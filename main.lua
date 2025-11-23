local Lighting = game:GetService("Lighting")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Hime's Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Hime's Hub",
   LoadingSubtitle = "Creator: Hime, The Choatic One.",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Hime's Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local function Notify(title, content, duration, imageId)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration or 5,
        Image = imageId or 0, -- Image id or 0 for no image
    })
end

local PlayerTab = Window:CreateTab("Player", 7792557371)
local ScriptsTab = Window:CreateTab("Scripts", 3019710370)
local LightingTab = Window:CreateTab("Lighting", 7792557371)

local PlayerSlider = PlayerTab:CreateSlider({
   Name = "Walk Speed",
   Range = {0, 150},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local PlayerSlider = PlayerTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Height",
   CurrentValue = 50,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local PlayerSlider = PlayerTab:CreateSlider({
   Name = "Gravity",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Gravity",
   CurrentValue = 162.2,
   Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Workspace.Gravity = Value
   end,
})

local PlayerButton = PlayerTab:CreateButton({
   Name = "Reset Player Stats",
   Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        game.Workspace.Gravity = 162.2
        Notify("Player Stats", "Successfully Reset Player Stats!", 5)
   end,
})

local PlayerSlider = PlayerTab:CreateSlider({
   Name = "FOV",
   Range = {70, 120},
   Increment = 1,
   Suffix = "FOV",
   CurrentValue = 70,
   Flag = "Slider4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Workspace.CurrentCamera.FieldOfView = Value
   end,
})

local PlayerSlider = PlayerTab:CreateSlider({
   Name = "Camera Speed",
   Range = {0.1, 1},
   Increment = 0.1,
   Suffix = "Speed",
   CurrentValue = 0.5,
   Flag = "Slider5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Workspace.CurrentCamera.CameraSubject.CameraSpeed = Value
   end,
})

local LightingSlider = LightingTab:CreateSlider({
   Name = "Time of Day",
   Range = {0, 24},
   Increment = 0.1,
   Suffix = "Hours",
   CurrentValue = 12,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Lighting.TimeOfDay = Value
   end,
})

local ScriptButton = ScriptsTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        Notify("Infinite Yield", "Successfully Loaded Infinite Yield!", 5)
   end,
})

local ScriptButton = ScriptsTab:CreateButton({
   Name = "Dex Explorer",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/REDzHUB/DEX-Explorer/main/Mobile.lua'))()
         Notify("Dex Explorer", "Successfully Loaded Dex Explorer!", 5)
   end,
})
