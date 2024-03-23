from sqlalchemy import Column, Integer, String, ForeignKey, func

from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()


class ArticleSchema(Base):
    __tablename__ = 'Articles'
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True, nullable=True)
    description = Column(String)
    category_id = Column(Integer, ForeignKey('Categories.id'))
    

class CategorySchema(Base):
    __tablename__ = 'Categories'
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True, nullable=True)
    description = Column(String)
    parent_id = Column(Integer, nullable=True)
