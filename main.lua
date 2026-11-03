
-- FUTEBOL PROIBIDO HUB V5
-- Interface mobile

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "FutebolProibidoHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(310, 390)
main.Position = UDim2.new(0.5, -155, 0.5, -195)
main.BackgroundColor3 = Color3.fromRGB(15, 18, 18)
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 48)
title.BackgroundColor3 = Color3.fromRGB(25, 190, 100)
title.Text = "⚽ FUTEBOL PROIBIDO HUB V5"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 15
title.Font = Enum.Font.GothamBold
title.Parent = main

local content = Instance.new("Frame")
content.Position = UDim2.fromOffset(10, 100)
content.Size = UDim2.new(1, -20, 1, -110)
content.BackgroundTransparency = 1
content.Parent = main

local tabs = Instance.new("Frame")
tabs.Position = UDim2.fromOffset(10, 55)
tabs.Size = UDim2.new(1, -20, 0, 35)
tabs.BackgroundTransparency = 1
tabs.Parent = main

local function clear()
    for _,v in pairs(content:GetChildren()) do
        v:Destroy()
    end
end

local function addButton(name, y)
    local enabled = false

    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 42)
    b.Position = UDim2.fromOffset(0, y)
    b.BackgroundColor3 = Color3.fromRGB(35, 42, 40)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.Text = name .. " [OFF]"
    b.Parent = content

    Instance.new("UICorner", b)

    b.MouseButton1Click:Connect(function()
        enabled = not enabled
        b.Text = name .. (enabled and " [ON]" or " [OFF]")
        b.BackgroundColor3 = enabled
            and Color3.fromRGB(25, 160, 85)
            or Color3.fromRGB(35, 42, 40)
    end)
end

local function showTab(tab)
    clear()

    if tab == "Jogador" then
        addButton("Velocidade de treino", 0)
        addButton("Estamina infinita", 50)

    elseif tab == "Bola" then
        addButton("Assistência de chute", 0)
        addButton("Assistência de mira", 50)

    elseif tab == "Goleiro" then
        addButton("AUTO DEFESA", 0)
        addButton("DETECTAR BOLA", 50)
        addButton("ALERTA DE CHUTE", 100)

    elseif tab == "Config" then
        addButton("Informações do Hub", 0)
        addButton("Fechar Hub", 50)
    end
end

local function tabButton(name, x)
    local b = Instance.new("TextButton")
    b.Size = UDim2.fromOffset(70, 32)
    b.Position = UDim2.fromOffset(x, 0)
    b.BackgroundColor3 = Color3.fromRGB(35, 42, 40)
    b.TextColor3 = Color3.new(1,1,1)
    b.Text = name
    b.TextSize = 11
    b.Font = Enum.Font.GothamBold
    b.Parent = tabs

    b.MouseButton1Click:Connect(function()
        showTab(name)
    end)
end

tabButton("Jogador", 0)
tabButton("Bola", 76)
tabButton("Goleiro", 152)
tabButton("Config", 228)

showTab("Jogador")

print("Futebol Proibido Hub V5 carregado!")
