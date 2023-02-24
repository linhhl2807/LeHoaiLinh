<html>
   
   <head>
      <title>Tạo bảng trong PHP</title>
   </head>
   
   <body>
    <center>
    <H1>TÌM HIỂU KỸ THUẬT DOM TRONG JAVASCRIPT</H1>
    <H1>(DOM: Document Object Model)</H1>
    <form method="post">
    <table border=1 cellspacing=0 cellpading=0>  
        <tr>
            <td>Số dòng</td>
            <td><input type="text" name="sodong" value="0"></td>
        </tr>
        <tr>
            <td>Số cột</td>
            <td><input type="text" name="socot" value="0"></td>
        </tr>
        <tr>
            <center>
                <td></td>
            <td colspan="2"><input type="submit" name="gui" value ="Hiển thị">
            <input type="submit" name="xoa" value ="Xóa"></td>
            </center>
        </tr>
    </table>
    <?php
    if (isset($_POST['gui'])){
        $c = $_POST['sodong'];
        $d = $_POST['socot'];
        for ($a = 0; $a < $c; $a++) {
            for ($b = 0; $b < $d; $b++) {
                echo $a.$b." ";
            }
            echo "<br>";
        }
    }
    if (isset($_POST['xoa'])){
        echo " ";
    }
     ?>
     </form>
     
       </center>
   </body>
</html>
