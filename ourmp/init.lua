AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

local interval = 10

local startint = 0

function ENT:Initialize()


	self:SetModel("models/props_c17/consolebox03a.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )      
	self:SetMoveType( MOVETYPE_VPHYSICS )   
	self:SetSolid( SOLID_VPHYSICS )  
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end


	end

	function ENT:Think()
		if(interval==startint) then
			self:SetMoneyAmount(self:GetMoneyAmount()+200)
			startint = 0			
		else
			startint = startint + 1
		end

	end

	function ENT:Use(act,call)
		local money = self:GetMoneyAmount()
		self:SetMoneyAmount(0)
		call:addMoney(money)
	end