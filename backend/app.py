from flask import Flask, jsonify, request

app = Flask(__name__)

# Sample data
blog_posts = [
    {"id": 1, "title": "First Post", "content": "This is the first blog post."},
    {"id": 2, "title": "Second Post", "content": "This is the second blog post."},
]

# Get all blog posts
@app.route("/posts", methods=["GET"])
def get_posts():
    return jsonify(blog_posts)

# Get a specific blog post
@app.route("/posts/<int:post_id>", methods=["GET"])
def get_post(post_id):
    for post in blog_posts:
        if post["id"] == post_id:
            return jsonify(post)
    return jsonify({"error": "Post not found."}), 404

# Create a new blog post
@app.route("/posts", methods=["POST"])
def create_post():
    data = request.get_json()
    new_post = {
        "id": len(blog_posts) + 1,
        "title": data["title"],
        "content": data["content"],
    }
    blog_posts.append(new_post)
    return jsonify(new_post), 201

# Run the Flask application
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
