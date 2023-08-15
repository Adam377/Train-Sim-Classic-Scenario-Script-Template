-- SCENARIO NAME
-- By [AUTHOR NAME]

-- define true/false
FALSE = 0
TRUE = 1

-- condition return values
CONDITION_NOT_YET_MET = 0
CONDITION_SUCCEEDED = 1
CONDITION_FAILED = 2

-- message types
MT_INFO = 0
MT_ALERT = 1

MSG_TOP = 1
MSG_VCENTRE = 2
MSG_BOTTOM = 4
MSG_LEFT = 8
MSG_CENTRE = 16
MSG_RIGHT = 32

MSG_SMALL = 0
MSG_REG = 1
MSG_LRG = 2

-- speed variables
MPH = 2.23693629
KMH = 3.6
gSpeedUnits = MPH
-- playerSpeed = math.abs(SysCall("PlayerEngine:GetSpeed")) * gSpeedUnits
-- SysCall("ScenarioManager:BeginConditionCheck", "")
-- SysCall("ScenarioManager:EndConditionCheck", "")
-- SysCall("ScenarioManager:LockControls")
-- SysCall("ScenarioManager:UnlockControls")

-- SysCall("PlayerEngine:SetControlValue", "", 0, 0)

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
end

function OnEventForceCabCamera()
	SysCall("CameraManager:ActivateCamera", "CabCamera", 0)
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
function DisplayTopLeftPopupMessage(title, content, hasPause)
	SysCall(
		"ScenarioManager:ShowInfoMessageExt",
		title,
		content .. ".html",
		0,
		MSG_TOP + MSG_LEFT,
		MSG_SMALL,
		hasPause
	)
end
-- hasPause takes TRUE/FALSE as values (i.e. it's boolean)