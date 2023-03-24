<!--
    File Name   : index.php
    Created     : on 14:09 at Mar 09, 2023
    Description : 倉庫整理アプリの index

    Copyright 2023 Shogo Kitada All Rights Reserved.
        contact@shogo0x2e.com (Twitter, GitHub: @shogo0x2e)

    I would be happy to notify me if you use part of my code.
-->

<!doctype html>

<html lang="ja">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>ShibaLab-Souko</title>

  <link href="./index.css" rel="stylesheet">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>

  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">ShibaLab-Souko</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">

        <ul class="navbar-nav me-auto mb-2 mb-md-0">

        </ul>
        <form class="d-flex">
          <input class="form-control me-2" list="datalistOptions" id="exampleDataList" placeholder="検索... ">
          <datalist id="datalistOptions">

            <option value="San Francisco">
            <option value="New York">
            <option value="Seattle">
            <option value="Los Angeles">
            <option value="Chicago">
          </datalist>
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav> <!-- navbar -->
  <div class="hero h-100 d-flex align-items-center" id="home">
    <div class="container">
      <div class="row">
        <div class="col-lg-7 mx-auto text-center">
          <h1 class="display-4 text-black">ShibaLab-Souko</h1>
          <p class="text-black my-3">
            右上の検索ボックス (スマホの場合はハンバーガーボタン) から備品分類を入力...
          </p>
          <!-- <a href="#" class="btn btn-primary me-2">テストボタン</a>
          <a href="#" class="btn btn-outline-dark">ボタン2</a> -->
        </div>
      </div>
    </div>
  </div>

  <!-- Option 1: Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>
