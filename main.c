#include "mlx_linux/mlx.h"
#include "data.h"

void	exit_prog(int err, char *msg, t_data *data)
{
	printf("%s\n", msg);
	mlx_destroy_window(data->mlx, data->mxl_win);
	exit(err);
}

int	key_press(int key, void *data)
{
	printf("%d\n", key);
	if (key == K_EXIT || key == 65307)
		exit_prog(0, "exit", data);
	return (0);
}

int read_data(void *data)
{
	char t[100];

	(void)data;

	int a = read(0, t, 99);
	a = write(1, t, 99);
	(void)a;
	return (0);
}

int main(void)
{
	t_data	data;


	data.mlx = mlx_init();
	int x, y;
	mlx_get_screen_size(data.mlx, &x, &y);
	data.mxl_win = mlx_new_window(data.mlx, x / 2, y / 2, "test");
	mlx_key_hook(data.mxl_win, key_press, &data);
	mlx_expose_hook(data.mxl_win, read_data, &data);
	mlx_loop(data.mlx);
	return (0);
}