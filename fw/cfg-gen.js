
for (let c = 0; c < 8; c++) {

    console.info(
`  - ["ssr8.reg${c}", "o", {"title": "Register ${c}"}]
  - ["ssr8.reg${c}.name", "s", "gpo${c}", {"title": "Register ${c} name"}]
  - ["ssr8.reg${c}.lsb", "i", ${c}, {"title": "Register ${c} lsb"}]
  - ["ssr8.reg${c}.msb", "i", ${c}, {"title": "Register ${c} msb"}]
  - ["ssr8.reg${c}.def", "i", 0, {"title": "Register ${c} default value"}]
  - ["ssr8.reg${c}.logic", "b", true, {"title": "Register ${c} msb"}]`);  

}
