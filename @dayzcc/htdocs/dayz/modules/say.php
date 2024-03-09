<?php

if (isset($_SESSION['user_id']) and (strpos($_SESSION['user_permissions'], "control") !== false))
{
	?>

	<h2>Say to global chat:</h2>
	<form action="index.php?view=actions" method="post">
		<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td align="center">
					<textarea name="say" rows="10" style="width: 99%"></textarea>
				</td>
			</tr>
			<tr>
				<td align="right">
					<br />
					<input type="submit" class="submit" />
					<br />
				</td>
			</tr>
		</table>
	</form>
	<br />

<?php } ?>