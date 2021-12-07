import pandas as pd

teams = {}
players = {}
roster = []

#open data
data = pd.read_excel("data.xlsx")

file = open("data.txt", 'w')
file.write("Players sql:\n\n")

#combine duplicates
sql = ""
team_idx = 1
player_idx = 31
for index, row in data.iterrows():
	if row["TEAM"] not in teams:
		teams[row["TEAM"]] = team_idx
		team_idx += 1

	if row["FULL NAME"] not in roster:
		roster.append(row["FULL NAME"])

		name = row["FULL NAME"].split( )
		player = {}
		player["p_id"] = player_idx
		player["t_id"] = teams[row["TEAM"]]
		player["fname"] =  name[0]
		player["lname"] = ' '.join(name[1:])
		player["total_points"] = 0
		player["avg_points"] = row["PPG"]
		player["total_reb"] = 0
		player["avg_reb"] = row["RPG"]
		player["total_ast"] = 0
		player["avg_ast"] = row["APG"]
		player["total_stl"] = 0
		player["avg_stl"] = row["SPG"]
		player["total_thr"] = 0
		player["avg_thr"] = 0
		player["3PA"] = row["3PA"]
		player["2Per"] = row["2P%"]
		player["3Per"] = row["3P%"]

		player_idx += 1

		players[row["FULL NAME"]] = [player, 1]
	else:
		players[row["FULL NAME"]][1] += 1

		players[row["FULL NAME"]][0]["avg_points"] += row["PPG"]
		players[row["FULL NAME"]][0]["avg_points"] /= players[row["FULL NAME"]][1]
		players[row["FULL NAME"]][0]["avg_reb"] += row["RPG"]
		players[row["FULL NAME"]][0]["avg_reb"] /= players[row["FULL NAME"]][1]
		players[row["FULL NAME"]][0]["avg_ast"] += row["APG"]
		players[row["FULL NAME"]][0]["avg_ast"] /= players[row["FULL NAME"]][1]
		players[row["FULL NAME"]][0]["avg_stl"] += row["SPG"]
		players[row["FULL NAME"]][0]["avg_stl"] /= players[row["FULL NAME"]][1]
		players[row["FULL NAME"]][0]["2Per"] += row["2P%"]
		players[row["FULL NAME"]][0]["2Per"] /= players[row["FULL NAME"]][1]
		players[row["FULL NAME"]][0]["3Per"] += row["3P%"]
		players[row["FULL NAME"]][0]["3Per"] /= players[row["FULL NAME"]][1]

		players[row["FULL NAME"]][0]["3PA"] += row["3PA"]

#Get Final player stats
for p in players:
	players[p][0]["total_points"] = round(players[p][0]["avg_points"] * 72)
	players[p][0]["total_reb"] = round(players[p][0]["avg_reb"] * 72)
	players[p][0]["total_ast"] = round(players[p][0]["avg_ast"] * 72)
	players[p][0]["total_stl"] = round(players[p][0]["avg_stl"] * 72)
	players[p][0]["total_thr"] = round(players[p][0]["3PA"] * players[p][0]["3Per"])
	players[p][0]["avg_thr"] = round(players[p][0]["total_thr"] / 72, 1)
	players[p][0]["avg_points"] = round(players[p][0]["avg_points"], 1)
	players[p][0]["avg_reb"] = round(players[p][0]["avg_reb"], 1)
	players[p][0]["avg_ast"] = round(players[p][0]["avg_ast"], 1)
	players[p][0]["avg_stl"] = round(players[p][0]["avg_stl"], 1)


	players[p][0]["2Per"] = round(players[p][0]["2Per"]*100, 2)
	players[p][0]["3Per"] = round(players[p][0]["3Per"]*100, 2)

	string = f"""(\'{players[p][0]["p_id"]}\',\'{players[p][0]["t_id"]}\',\'{players[p][0]["fname"]}\',\'{players[p][0]["lname"]}\',\'{players[p][0]["total_points"]}\',\'{players[p][0]["avg_points"]}\',\'{players[p][0]["total_reb"]}\',\'{players[p][0]["avg_reb"]}\',\'{players[p][0]["total_ast"]}\',\'{players[p][0]["avg_ast"]}\',\'{players[p][0]["total_stl"]}\',\'{players[p][0]["avg_stl"]}\',\'{players[p][0]["total_thr"]}\',\'{players[p][0]["avg_thr"]}\',\'{players[p][0]["2Per"]}\',\'{players[p][0]["3Per"]}\'),\n"""

	file.write(string)

file.write("\n")
file.write("Team Info\n\n")

for t in teams:
	string = f"(\'{teams[t]}\', \'\', \'{t}\', \'\', \'\', \'\'),"
	file.write(string+"\n")

file.close()