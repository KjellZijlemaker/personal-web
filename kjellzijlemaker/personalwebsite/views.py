from django.shortcuts import render

def my_page(requests):
    return render(requests, 'my_page.html')