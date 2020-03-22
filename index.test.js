/* const wait = require('./wait'); */
const process = require('process');
const cp = require('child_process');
const path = require('path');

/* test('throws invalid number', async() => {
    await expect(wait('foo')).rejects.toThrow('milleseconds not a number');
});

test('wait 500 ms', async() => {
    const start = new Date();
    await wait(500);
    const end = new Date();
    var delta = Math.abs(end - start);
    expect(delta).toBeGreaterThan(450);
});
*/
// shows how the runner will run a javascript action with env / stdout protocol
test('test runs', () => {
    process.env['repo-token'] = 'b39553443821220bcb259cbdef722cd71651c7c5';
    process.env['repo-name'] = 'action-changelog-generator';
    process.env['repo-user'] = 'viniciusCSreis';
    const ip = path.join(__dirname, 'index.js');
    console.log(cp.execSync(`node ${ip}`).toString());
})

test('2 > 1 ', async () => {
    expect(2).toBeGreaterThan(1);
});
