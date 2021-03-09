--API for keeping track of the turtle's position.
local loc = {x=0, y=0, z=0, fx=1, fz=0}

--x() returns position (getter)
--supplying an argument causese the turtle to go to that position, then return it
function x(n)
	if n~=nil and n~=loc.x then
		f(n-loc.x,0)
		for i=1, math.abs(n-loc.x) do
			if(turtle.forward()) then loc.x=loc.x+(n>loc.x and 1 or -1) end
		end
	end
	return loc.x
end
function y(n)
	if n~=nil and n~=loc.y then
		f = n>loc.y and turtle.up or turtle.down
		dy = n>loc.y and 1 or -1
		for i=1, math.abs(n-loc.y) do
			if(f()) then loc.y=loc.y+dy end
		end
	end
	return loc.y
end
function z(n)
	if n~=nil and n~=loc.z then
		f(0,n-loc.z)
		for i=1, math.abs(n-loc.z) do
			if(turtle.forward()) then loc.z=loc.z+(n>loc.z and 1 or -1) end
		end
	end
	return loc.z
end
function f(m,n)   --Causes the turtle to face in a certain dx,dz direction
	m = m==0 and 0 or m/math.abs(m)
	n = n==0 and 0 or n/math.abs(n)
	if(m==0 and n==0 or m~=0 and n~=0) then
		error("Told to face "+m+", "+n) --illegal facing direction
	end
	if(loc.dz==m and loc.fx==-1*n) then
		turtle.turnLeft()
	elseif(loc.fx==n and loc.fz==-1*m) then
		turtle.turnRight()
	elseif(loc.fx~=m or loc.fz~=n) then
		turtle.turnLeft()
		turtle.turnLeft()
	end
	loc.fx = m
	loc.fz = n
	return loc.fx, loc.fz
end
