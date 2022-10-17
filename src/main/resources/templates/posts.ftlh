<!doctype html>
<head>
    <title>Spring Boot FreeMarker Application - Bootstrap Table</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        .panel-table .panel-body {
            padding: 0;
        }

        .panel-table .panel-body .table-bordered {
            border-style: none;
            margin: 0;
        }

        .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
            text-align: center;
            width: 100px;
        }

        .panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
        .panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
            border-right: 0px;
        }

        .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
        .panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
            border-left: 0px;
        }

        .panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td {
            border-bottom: 0px;
        }

        .panel-table .panel-body .table-bordered > thead > tr:first-of-type > th {
            border-top: 0px;
        }

        .panel-table .panel-footer .pagination {
            margin: 0;
        }

        /*
        used to vertically center elements, may need modification if you're not using default sizes.
        */
        .panel-table .panel-footer .col {
            line-height: 34px;
            height: 34px;
        }

        .panel-table .panel-heading .col h3 {
            line-height: 30px;
            height: 30px;
        }

        .panel-table .panel-body .table-bordered > tbody > tr > td {
            line-height: 34px;
        }


    </style>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
        <a class="navbar-brand" href="/">FreeMarker - Bootstrap Table</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-md-center">
            <div class="card">
                <h1>Post CRUD operation with Freemarker Template</h1>
                <a href="/create">Create New Post</a>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Title</th>
                        <th scope="col">Body</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list posts.page.content as post>
                        <tr>
                            <th scope="row">${post.id}</th>
                            <td>${post.title}</td>
                            <td>${post.body}</td>
                            <td><a href="/update/${post.id}">Update</a></td>
                            <td><a href="/delete/${post.id}">Delete</a></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>

        </div>
        <div class="panel-footer">
            <div class="row">


                <div class="col col-xs-2">
                    Total items: ${posts.page.totalElements}- item ${(posts.page.number )*posts.page.size +1 } -
                    ${(posts.page.number )*posts.page.size +posts.page.numberOfElements  }
                </div>
                <div class="col col-xs-10">
                    <nav aria-label="Page navigation" class="paging">
                        <#if (posts.page.totalPages> 1)>
                            <ul class="pagination">

                                <li class="page-item ${(posts.paging.isPrevEnabled())?string('' , 'disabled')}">
                                    <a class="page-link" href="/?pageNumber=${posts.paging.pageNumber - 1}"
                                       tabindex="-1">Previous</a>
                                </li>

                                <#list posts.paging.getItems() as item>
                                    <#if (item.pageItemType.name() == 'PAGE')>
                                        <li class="page-item ${(item.index == posts.paging.pageNumber)?string('active' , '')}">
                                            <a class="page-link" href="/?pageNumber=${item.index}">${item.index}</a>
                                        </li>
                                    </#if>
                                    <#if (item.pageItemType.name() == 'DOTS')>
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#">...</a>
                                        </li>
                                    </#if>
                                </#list>


                                <li class="page-item ${(posts.paging.isNextEnabled())?string('' , 'disabled')}">
                                    <a class="page-link" href="/?pageNumber=${posts.paging.pageNumber + 1}"
                                    >Next</a>
                                </li>

                            </ul>
                        </#if>
                    </nav>
                </div>

            </div>
        </div>

    </div>
</body>
</html>