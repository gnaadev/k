const fs = require('fs');
const axios = require('axios');

const data = fs.readFileSync('db.json', 'utf8');
const json = JSON.parse(data);

let html = '<table>';

const promises = Object.values(json).map((entry) => {
  const discordId = entry.DID;
  const robloxId = entry.RID;
  const premium = entry.P;
  const date = entry.D;

  const getUserPromise = axios.get(`https://users.roblox.com/v1/users/${robloxId}`);

  return getUserPromise.then((response) => {
    const { displayName, name } = response.data;

    html += `<tr>
                <td><a href="discord://-/${discordId}">${discordId}</a></td>
                <td><a href="https://roblox.com/users/${robloxId}">${robloxId}</a></td>
                <td>${premium}</td>
                <td>${date}</td>
                <td>${displayName}</td>
                <td>${name}</td>
            </tr>`;
  }).catch(() => {
    html += `<tr>
                <td><a href="discord://-/${discordId}">${discordId}</a></td>
                <td><a href="https://roblox.com/users/${robloxId}">${robloxId}</a></td>
                <td>${premium}</td>
                <td>${date}</td>
                <td>N/A</td>
                <td>N/A</td>
            </tr>`;
  });
});

Promise.all(promises).then(() => {
  html += '</table>';

  fs.writeFileSync('output.html', html, 'utf8');
});
