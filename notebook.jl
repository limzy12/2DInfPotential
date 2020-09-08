### A Pluto.jl notebook ###
# v0.11.12

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 69170b82-f0ab-11ea-0874-1f0d65e086d2
using PlutoUI, Plots

# ╔═╡ 791e9414-f0ab-11ea-2d29-ad3960a81495
md"""
### Number of intervals on each axis

Intervals: $(@bind axisInts Slider(50:10:500))
"""

# ╔═╡ e3344f24-f0e2-11ea-1ecb-7718e71b6ac1
md" Plot has $(axisInts) intervals along each axis "

# ╔═╡ 2503412e-f0ae-11ea-12ee-31e287429cf8
md"""
### Energy State

n_x: $(@bind nx Slider(1:10))

n_y: $(@bind ny Slider(1:10))
"""

# ╔═╡ 0d933d16-f0e3-11ea-2f66-bb591236d3cb
md" Plotting for n_x = $(nx) and n_y = $(ny) "

# ╔═╡ d9bafc62-f0ac-11ea-2e58-f3b4b28a5821
begin
	function meshgrid(xInts, yInts)
		dx = 1/xInts
		dy = 1/yInts
		X = [i for j = 0:dy:1, i = 0:dx:1]
		Y = [j for j = 0:dy:1, i = 0:dx:1]
		return X, Y
	end

	function twoD_InfPotential(n_x, n_y, X, Y)
		return sin.(n_x * pi * X) .* sin.(n_y * pi * Y)
	end

	function plotThis(x, y)
		return twoD_InfPotential(nx, ny, x, y)
	end
end

# ╔═╡ 3ea71f0c-f0ad-11ea-1cf9-b7fd50dd1cc1
begin
	X = 0:1/axisInts:1
	Y = 0:1/axisInts:1
	p1 = surface(X, Y, plotThis)
end

# ╔═╡ 14626014-f0e7-11ea-398f-edae313c0d15
contourf(X, Y, plotThis)

# ╔═╡ Cell order:
# ╟─69170b82-f0ab-11ea-0874-1f0d65e086d2
# ╟─791e9414-f0ab-11ea-2d29-ad3960a81495
# ╟─e3344f24-f0e2-11ea-1ecb-7718e71b6ac1
# ╟─2503412e-f0ae-11ea-12ee-31e287429cf8
# ╟─0d933d16-f0e3-11ea-2f66-bb591236d3cb
# ╟─d9bafc62-f0ac-11ea-2e58-f3b4b28a5821
# ╟─3ea71f0c-f0ad-11ea-1cf9-b7fd50dd1cc1
# ╟─14626014-f0e7-11ea-398f-edae313c0d15
