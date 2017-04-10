
<?php require 'components/header.php'; ?>
<?php require 'components/nav.php'; ?>



  <div class="formsection  templete clear">

    <h2 >Availabe Room: </h2>
    <form method="get" action="/booking-check-form">
      <table class="guestinfo">
            <tr >
                <td>Check In: </td>
                <td>
                    <input type="text" name="checkin" placeholder="Chack In Date">
                </td>
            </tr>
            <tr>
                <td>Check Out: </td>
                <td>  <input type="text" name="checkout" placeholder="Chack Out Date"></td>

            </tr>
            <tr>
                <td></td>
                <td ><button type="submit"> Next </button> </td>
            </tr>

      </table>
    </form>



  <h2 >Room Information</h2>
  <form action="/booking-user-form" method="post">
    <table class="guestinfo">
          <tr >
              <td>Room Type: </td>
              <td><?= $roomCategory[0]['roomType'] ?></td>

              <td><?= $roomCategory[0]['price'] ?></td>

              <td>
                <select class="" name="room_quantity">
                  <?php $count = 1; ?>
                  <?php while ($count <= $totalRoom): ?>
                    <option value="<?= $count ?>"><?= $count ?></option>
                    <?php $count ++ ?>
                  <?php endwhile ?>
                </select>
              </td>
          </tr>


          <tr>
              <td></td>
              <td > <button type="submit"> Submit </button> </td>
          </tr>

    </table>
  </form>

</div>

<?php require 'components/footer.php'; ?>
