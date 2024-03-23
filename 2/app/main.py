from fastapi import FastAPI, HTTPException, Query
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
from database import Base, ArticleSchema, CategorySchema
from models import ArticleModelCommand, ArticleModelResponse, CategoryModelCommand, CategoryModelResponse, CategoryModelResponseSub
from typing import List


engine = create_engine('sqlite:///database.db')
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base.metadata.create_all(bind=engine)

app = FastAPI()

@app.post("/articles/", response_model=ArticleModelResponse)
def create_article(article: ArticleModelCommand):
    db = SessionLocal()
    db_article = ArticleSchema(**article.dict())
    db.add(db_article)
    db.commit()
    db.refresh(db_article)
    db.close()
    return db_article

@app.get("/articles", response_model=List[ArticleModelResponse])
def get_articles(query: str = Query(None)):
    db = SessionLocal()
    if query:
        articles = db.query(ArticleSchema).filter(
            (ArticleSchema.name.like(f"%{query}%")) |
            (ArticleSchema.description.like(f"%{query}%")) |
            (ArticleSchema.category_id.in_(db.query(CategorySchema.id).filter(CategorySchema.name.like(f"%{query}%"))))
        ).all()
    else:
        articles = db.query(ArticleSchema).all()
    db.close()
    return articles

@app.get("/articles/{article_id}", response_model=ArticleModelResponse)
def get_article(article_id: int):
    db = SessionLocal()
    db_article = db.query(ArticleSchema).filter(ArticleSchema.id == article_id).first()
    db.close()
    if db_article is None:
        raise HTTPException(status_code=404, detail="Article not found")
    return db_article

@app.put("/articles/{article_id}", response_model=ArticleModelResponse)
def update_article(article_id: int, article: ArticleModelCommand):
    db = SessionLocal()
    db_article = db.query(ArticleSchema).filter(ArticleSchema.id == article_id).first()
    if db_article is None:
        raise HTTPException(status_code=404, detail="Article not found")
    for var, value in vars(article).items():
        setattr(db_article, var, value)
    db.commit()
    db.refresh(db_article)
    db.close()
    return db_article

@app.delete("/articles/{article_id}")
def delete_article(article_id: int):
    db = SessionLocal()
    db_article = db.query(ArticleSchema).filter(ArticleSchema.id == article_id).first()
    if db_article is None:
        db.close()
        raise HTTPException(status_code=404, detail="Article not found")
    db.delete(db_article)
    db.commit()
    db.close()
    return {"message": "Article deleted successfully"}

@app.post("/categories/", response_model=CategoryModelResponse)
def create_category(category: CategoryModelCommand):
    db = SessionLocal()
    db_category = CategorySchema(**category.dict())
    db.add(db_category)
    db.commit()
    db.refresh(db_category)
    db.close()
    return db_category



def get_categories_with_subcategories(db, parent_id=None):
    categories = db.query(CategorySchema).filter(CategorySchema.parent_id == parent_id).all()
    categories_list = []
    for category in categories:
        
        category_model = CategoryModelResponseSub.from_orm(category)
        
        category_model.subCategories = get_categories_with_subcategories(db, category.id)
        
        categories_list.append(category_model)
      
    return categories_list

@app.get("/categories/", response_model=List[CategoryModelResponseSub])
def get_categories():
    db = SessionLocal()
    categories_list = get_categories_with_subcategories(db)
    db.close()
    return categories_list

@app.get("/categories/{category_id}", response_model=CategoryModelResponse)
def get_article(category_id: int):
    db = SessionLocal()
    db_category = db.query(CategorySchema).filter(CategorySchema.id == category_id).first()
    db.close()
    if db_category is None:
        raise HTTPException(status_code=404, detail="Category not found")
    return db_category

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
