from django.urls import path
from .views import home, resume, contact

urlpatterns = [
    path(
        "",
        home,
    ),
    path(
        "resume/",
        resume,
    ),
    path(
        "contact/",
        contact,
    ),
]
