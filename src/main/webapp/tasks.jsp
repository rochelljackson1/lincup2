<%@ page import="com.uh.rachel.util.DataHandler" %>
<%@ page import="java.util.Vector" %>
<%@ page import="com.uh.rachel.util.tableClasses.tasksTable" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>LINCUP - Tasks</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

  <!-- Sidebar -->
  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-people-arrows"></i>
      </div>
      <div class="sidebar-brand-text mx-3">Linc <sup>Up</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item">
      <a class="nav-link" href="dash.jsp">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
      Menu
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
         aria-expanded="true" aria-controls="collapseTwo">
        <i class="fas fa-fw fa-calendar-alt"></i>
        <span>Events</span>
      </a>
      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Options:</h6>
          <a class="collapse-item" href="events.jsp">Event List</a>
          <a class="collapse-item" href="eventSchedule.jsp">Event Calendar</a>

        </div>
      </div>
    </li>

    <!-- Nav Item - Tasks -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
         aria-expanded="true" aria-controls="collapseUtilities">
        <i class="fas fa-fw fa-wrench"></i>
        <span>Tasks</span>
      </a>
      <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
           data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Options:</h6>
          <a class="collapse-item" href="tasks.jsp">Task List</a>
          <a class="collapse-item" href="tasksSteps.jsp">Task Steps</a>

        </div>
      </div>
    </li>

    <!-- Nav Item - Requests -->
    <li class="nav-item">
      <a class="nav-link" href="requests.jsp">
        <i class="fas fa-fw fa-table"></i>
        <span>Requests</span></a>
    </li>

    <!-- Nav Item - Members -->
    <li class="nav-item">
      <a class="nav-link" href="members.jsp">
        <i class="fas fa-fw fa-laugh"></i>
        <span>Members</span></a>
    </li>

    <!-- Nav Item - Student Organizations -->
    <li class="nav-item">
      <a class="nav-link" href="studentOrg.jsp">
        <i class="fas fa-fw fa-user-friends"></i>
        <span>Student Organizations</span></a>
    </li>
    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

  </ul>
  <!-- End of Sidebar -->

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

      <!-- Topbar -->
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
          <i class="fa fa-bars"></i>
        </button>


        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">






          <div class="topbar-divider d-none d-sm-block"></div>

          <!-- Nav Item - User Information -->
          <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">


              <i class="fas fa-user fa-lg "></i>
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">


              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                Logout
              </a>
            </div>
          </li>

        </ul>

      </nav>
      <!-- End of Topbar -->

      <!-- Begin Page Content -->
      <div class="container-fluid mt-5 pt-5">

        <!-- Page Heading -->

        <h1 class="text-center text-dark"><b>Tasks</b></h1>
        <div class="row justify-content-center">
          <div class="col-md-10 mb-3">


            <div class="card shadow mb-4">
              <div class="card-header py-3">
              </div>
              <div class="card-body">








<form action="deleteTasks" id="deleteForm" style="display:none;" method="post">
  <input name="rowToDelete" type="text">
  <button type="submit">Delete This Row</button>
</form>

<form action="insertTasks" method="post">
  <input name="taskIdInput" type="text">
  <input name="taskNameInput" type="text">
  <input name="taskDateInput" type="text">
  <input name="taskDescriptionInput" type="text">
  <input name="MemberIdInput" type="text">
  <input name="EventIdInput" type="text">
  <input name="taskStatusInput" type="text">
  <button type="submit">Insert This Row</button>
</form>

<form action="updateTasks" id="updateForm" style="display:none;" method="post">
  <input name="taskIdInput" type="text">
  <input name="taskNameInput" type="text">
  <input name="taskDateInput" type="text">
  <input name="taskDescriptionInput" type="text">
  <input name="MemberIdInput" type="text">
  <input name="EventIdInput" type="text">
  <input name="taskStatusInput" type="text">
  <button type="submit">Update This Row</button>
</form>


                <div class="modal fade" id="addModal" tabindex="-1" role="dialog"
                     aria-labelledby="addModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="addModalLabel">Add Event</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                          <span aria-hidden="true">&times;</span>

                        </button>
                      </div>
                      <div class="modal-body">

                        <form action="insertEvents" id="insertForm" method="post">

                          <div class="form row">

                            <div class="form-group col-md-4">
                              <label class="form-label">Event ID</label>

                              <input name="eventIdInput" type="text"
                                     class="form-control form-control-sm">
                            </div>


                            <div class="form-group col-md-4">
                              <label class="form-label">Event Name</label>
                              <input name="eventNameInput" type="text"
                                     class="form-control form-control-sm">
                            </div>


                            <div class="form-group col-md-4">
                              <label class="form-label">Event Type</label>
                              <input name="eventTypeInput" type="text"
                                     class="form-control form-control-sm">
                            </div>
                          </div>

                          <!--                          -->
                          <div class="form row">

                            <div class="form-group col-md-4">

                              <label class="form-label">City
                              </label>
                              <input name="eventCityInput" type="text"
                                     class="form-control form-control-sm">
                            </div>


                            <div class="form-group col-md-2">

                              <label class="form-label">State
                              </label>
                              <input name="eventStateInput" type="text"
                                     class="form-control form-control-sm">

                            </div>

                            <div class="form-group col-md-6">
                              <label class="form-label">Date
                              </label>
                              <input name="eventDateInput" type="date"
                                     class="form-control form-control-sm">

                            </div>
                          </div>

                          <div class="form row">

                            <div class="form-group col-md-6 ml-auto
">
                              <label class="form-label">Interest 1
                              </label>
                              <input name="interest1Input" type="text"
                                     class="form-control form-control-sm">
                            </div>
                            <div class="form-group col-md-6 ml-auto
">
                              <label class="form-label">Interest 2
                              </label>
                              <input name="interest2Input" type="text"
                                     class="form-control form-control-sm">
                            </div>
                          </div>

                          <div class="form row">
                            <div class="form-group col-md-6">
                              <label class="form-label">Interest 3
                              </label>
                              <input name="interest3Input" type="text"
                                     class="form-control form-control-sm">
                            </div>
                            <div class="form-group col-md-6">
                              <label class="form-label">Interest 4
                              </label>
                              <input name="interest4Input" type="text"
                                     class="form-control form-control-sm">
                            </div>
                          </div>

                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                    data-dismiss="modal">Cancel
                            </button>

                            <button type="submit" class="btn btn-primary">Insert New Event
                            </button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>


                <div class="table-responsive">
                  <table id="eventsTable"
                         class="display"
                         style="width:100%"


                  >
                    <thead>
                    <tr class="tr-class-1">
                      <th  data-valign="middle">Task ID</th>
                      <th  data-valign="middle">Task Name</th>
                      <th  data-valign="middle">Task Date</th>
                      <th  data-valign="middle">Member ID</th>
                      <th data-valign="middle">Event ID</th>
                      <th  data-valign="middle">Description</th>
                      <th  data-valign="middle">Status</th>
                      <th class="text-center">Actions</th>

                    </tr>

                    </thead>
                    <tbody>


  <% Vector<tasksTable> v = DataHandler.getTasks();
    for (tasksTable c : v) {
  %>

  <tr>
    <td><%= String.valueOf(c.getTaskId())%></td>
    <td><%= String.valueOf(c.getTaskName())%></td>
    <td><%= String.valueOf(c.getTaskDate())%></td>
    <td><%= String.valueOf(c.getDescription())%></td>
    <td><%= String.valueOf(c.getMemberid())%></td>
    <td><%= String.valueOf(c.getEventId())%></td>
    <td><%= String.valueOf(c.getStatus())%></td>

  </tr>

  <%
    }
  %>
                    </tbody>
                    <tfoot>
                    <tr>
                      <th>Task ID</th>
                      <th>Task Name</th>
                      <th>Task Date</th>
                      <th>Member ID</th>
                      <th>Event ID</th>
                      <th>Description</th>
                      <th>Status</th>
                      <th class="text-center">Actions</th>
                    </tr>
                    </tfoot>
</table>
              </div>
            </div>
          </div>

        </div>
      </div>






      <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Copyright &copy; LINCUP 2022</span>
        </div>
      </div>
    </footer>
    <!-- End of Footer -->

  </div>
  <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Select "Logout" below if you are ready to end your current session.
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        <a class="btn btn-primary" href="login.jsp">Logout</a>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="https://unpkg.com/bootstrap-table@1.19.1/dist/bootstrap-table.min.js"></script>


<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>


</body>

</html>