#include "mlx_linux/mlx.h"

int main(void)
{
	void *mlx;

	mlx = mlx_init();
	void *mlx_w = mlx_new_window(mlx, 200, 200, "test");
	(void)mlx_w;
	mlx_loop(mlx);
	return (0);
}