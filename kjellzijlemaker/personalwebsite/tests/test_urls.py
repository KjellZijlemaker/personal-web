from django.test import Client, TestCase


class User_Form_Test(TestCase):
    def test_logged_user_get_details(self):
        response = self.client.get("/", follow=True)
        self.assertEqual(response.status_code, 200)

    def test_logged_user_get_details_images(self):
        response = self.client.get("/admin/", follow=True)
        self.assertEqual(response.status_code, 200)
