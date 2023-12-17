import json

from .settings import DEFAULT_PRICE

def test_product_detail_api(client):
    id = 3
    response = client.get(f"/api/products/{id}")
    assert response.status_code == 200
    data = json.loads(response.data)
    assert id == data.get('id')
    assert DEFAULT_PRICE * id


def test_product_api(client):
    response = client.get("/api/products")
    assert response.status_code == 200

# post new cart
def test_post_cart(client):
    url = f"/api/cart"
    coupon_code = ""
    shipping_fee = 0
    cart_items = [{"product_id": 6, "qty": 1}]
    payload = {"coupon_code": coupon_code, "shipping_fee": shipping_fee, "cart_items": cart_items}
    response = client.post(url, json=payload)
    assert response.status_code == 200
    if response.status_code == 200:  assert "data created"
