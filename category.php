<?php
include_once "./inc/header.php";
include_once "./database/connect.php";
?>

<?php

$sql = "SELECT * FROM categories";
$result = mysqli_query($conn, $sql);
$categories = mysqli_fetch_all($result, MYSQLI_ASSOC);

?>


<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Categories</h1>
            <p class="lead fw-normal text-white-50 mb-0">Shop in style</p>
        </div>
    </div>
</header>
<!-- Section-->
<div class="container">
    <div class="row">
        <section class="py-5">
            <div class="container">
            </div>
            <div class="col-8 mx-auto">
                <form action="./index.php?page=create_category" method="post" class="form border p-2">
                    <input type="text" name="category_name" class="form-control my-3 border border-success"
                        placeholder="add new Category">
                    <input type="submit" value="Add" class="form-control btn btn-primary my-3 " placeholder="add new category">
                </form>
            </div>
        </section>

        <table class="table table-bordered table-striped table-hover">
            <thead>
                <th>ID</th>
                <th>Title</th>
                <th>Created at</th>
                <th>Action</th>
            </thead>
            <tbody>

                <?php foreach ($categories as $category) :  ?>
                    <tr>
                        <td><?= $category['id'] ?></td>
                        <td><?= $category['title'] ?></td>
                        <td><?= $category['created_at'] ?></td>
                        <td>
                            <a href="" class="btn btn-warning">edit</a>
                            <a href="" class="btn btn-danger">delete</a>
                        </td>
                    </tr>
                <?php endforeach; ?>

            </tbody>
        </table>
    </div>
</div>
<?php include_once "./inc/footer.php"; ?>