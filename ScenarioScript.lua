-- SCENARIO NAME
-- By [AUTHOR NAME]

-- define true/false
local FALSE = 0
local TRUE = 1

-- condition return values
local CONDITION_NOT_YET_MET = 0
local CONDITION_SUCCEEDED = 1
local CONDITION_FAILED = 2

-- message types
local MT_INFO = 0
local MT_ALERT = 1

local MSG_TOP = 1
local MSG_VCENTRE = 2
local MSG_BOTTOM = 4
local MSG_LEFT = 8
local MSG_CENTRE = 16
local MSG_RIGHT = 32

local MSG_SMALL = 0
local MSG_REG = 1
local MSG_LRG = 2

-- speed variables
local MPH = 2.23693629
local KMH = 3.6
local gSpeedUnits = MPH
-- playerSpeed = math.abs(SysCall("PlayerEngine:GetSpeed")) * gSpeedUnits
-- SysCall("ScenarioManager:BeginConditionCheck", "")
-- SysCall("ScenarioManager:EndConditionCheck", "")
-- SysCall("ScenarioManager:LockControls")
-- SysCall("ScenarioManager:UnlockControls")

-- SysCall("PlayerEngine:SetControlValue", "", 0, 0)
-- SysCall("ScenarioManager:TriggerDeferredEvent", "", 0)
-- SysCall("PlayerEngine:GetControlValue", "", 0)

function OnEvent(event)
	_G["OnEvent" .. event]()
end

function TestCondition(condition)
	_G["TestCondition" .. condition]()
end

--------------------------------------------------------------------------------
-- DISPLAY RECORDED MESSAGE --
--------------------------------------------------------------------------------
function DisplayRecordedMessage(messageName)
	SysCall(
		"RegisterRecordedMessage",
		"StartDisplay" .. messageName,
		"StopDisplay" .. messageName,
		1
	)
end

--------------------------------------------------------------------------------
-- INTRO STUFF --
--------------------------------------------------------------------------------
function OnEventIntroMovie()
	SysCall("CameraManager:ActivateCamera", "camera", 0)

	SysCall("ScenarioManager:TriggerDeferredEvent", "ForceCabCamera", 1)
end

function OnEventForceCabCamera()
	SysCall("CameraManager:ActivateCamera", "CabCamera", 0)

	SysCall("ScenarioManager:TriggerDeferredEvent", "IntroMessage", 2)
end

function OnEventIntroMessage()
	DisplayRecordedMessage("IntroMessage")
end

function StartDisplayIntroMessage()
	SysCall(
		"ScenarioManager:ShowInfoMessageExt",
		"SCENARIO NAME",
		"0. Intro Message.html",
		0,
		MSG_VCENTRE + MSG_CENTRE,
		MSG_REG,
		TRUE
	)
end

function StopDisplayIntroMessage()
end

--------------------------------------------------------------------------------
--  --
--------------------------------------------------------------------------------
--[[
function OnEvent()
	DisplayRecordedMessage("")
end

function StartDisplay()
	DisplayTopLeftPopupMessage("", "")
end

function StopDisplay()
end
]]

--------------------------------------------------------------------------------
-- OUTRO MESSAGE --
--------------------------------------------------------------------------------
function OnEventOutroMessage()
	SysCall(
		"ScenarioManager:TriggerScenarioComplete",
		"Insert outro message."
	)
end

--------------------------------------------------------------------------------
-- OTHER FUNCTIONS --
--------------------------------------------------------------------------------
function DisplayTopLeftPopupMessage(title, content)
	SysCall(
		"ScenarioManager:ShowInfoMessageExt",
		title,
		content .. ".html",
		0,
		MSG_TOP + MSG_LEFT,
		MSG_SMALL,
		FALSE
	)
end