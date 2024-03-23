from pydantic import BaseModel
from typing import List, Optional

class ArticleModelCommand(BaseModel):
    category_id: int
    name: str = ""
    description: str

class ArticleModelResponse(BaseModel):
    id: int
    category_id: int
    name: str = ""
    description: str

class CategoryModelCommand(BaseModel):
    name: str
    description: str
    parent_id: int = None  

class CategoryModelResponse(BaseModel):
    id: int
    parent_id: Optional[int]
    name: str
    description: str
    

class CategoryModelResponseSub(BaseModel):
    id: int
    name: str
    description: str
    subCategories: Optional[List['CategoryModelResponseSub']] = []
    class Config:
        orm_mode = True
        from_attributes = True