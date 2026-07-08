local ServerStorage = game:GetService("ServerStorage")
local Workspace = game:GetService("Workspace")

if Workspace:FindFirstChild("SpaceFishingLobbyStatic") then
	print("[SpaceFishing] Existing Workspace lobby found. Manual scene edits are preserved.")
	return
end

local sceneTemplates = ServerStorage:FindFirstChild("SceneTemplates")
local lobbyTemplate = sceneTemplates and sceneTemplates:FindFirstChild("SpaceFishingLobbyStatic")

if not lobbyTemplate then
	warn("[SpaceFishing] SpaceFishingLobbyStatic was not found in Workspace or ServerStorage/SceneTemplates.")
	return
end

local lobby = lobbyTemplate:Clone()
lobby.Name = "SpaceFishingLobbyStatic"
lobby.Parent = Workspace

print("[SpaceFishing] SpaceFishingLobbyStatic cloned from fallback template.")
