game.Players.PlayerAdded:Connect(function(player: Player) 
	player.CharacterAdded:Connect(function(character: Model)
		if character then
			local humanoid: Humanoid = character:FindFirstChild('Humanoid')
			if humanoid then
				task.spawn(function()
					local init = false
					local flagged = false
					
					local hrp: Part = character:FindFirstChild('HumanoidRootPart')
					
					local origin = hrp.CFrame.Position

					while task.wait(0.1) do
						local new_position = origin - hrp.CFrame.Position
						
						local x1, z1 = hrp.AssemblyLinearVelocity.X, hrp.AssemblyLinearVelocity.Z
						local x2, z2 = new_position.X, new_position.Z

						if not init and x1 > 5 or z1 > 5 or x2 <= -5 or z2 <= -5 or x2 >= 0.1 or z2 >= 0.1 or x2 <= -0.1 or z2 <= -0.1 then
							init = true
						end
						
						if init then
							if x1 >= 20 or z1 >= 20 or x1 <= -20 or z1 <= -20 and humanoid.Health > 0 then
								if not flagged then
									flagged = true
									humanoid:TakeDamage(humanoid.Health)
									warn('check 1: '..player.Name)
								end
							end

							if x2 >= 2.2 or z2 >= 2.2 or x2 <= -2.2 or z2 <= -2.2 and humanoid.Health > 0 then
								if not flagged then
									flagged = true
									humanoid:TakeDamage(humanoid.Health)
									warn('check 2: '..player.Name)
								end
							end
						end
						
						origin = hrp.CFrame.Position
					end
				end)
			end
		end
	end)
end)
