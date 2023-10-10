from django.shortcuts import render


def home(requests):
    return render(requests, "home.html")


def resume(requests):
    return render(requests, "resume.html")


def contact(requests):
    return render(requests, "contact.html")
