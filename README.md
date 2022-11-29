<!-- Download & play -->
<h1>Download & play</h1>
<b>Browser Edition</b>
<p>
  <a href="https://lastmanfighting.github.io">Play</a> the full game in a browser.
</p>
<p>
  <a href="https://github.com/lastmanfighting/lastmanfighting.github.io">Download</a> the full browser game source.
</p>
<b>Desktop & Developer Edition</b>
<p>
  <a href="https://github.com/lastmanfighting/source">Download and play</a> the full game source, locally.
</p>
<!-- Game controls -->
<h1>Game controls</h1>
<p>[Movement] - <code>Player Look</code></p>
<p>[RMB] - <code>Zoom Scope</code> (Sniper only.)</p>
<p>[Esc] - <code>Exit Game</code> (Works only locally, in Krom Player.)</p>
<p>[W] - <code>Walk Forward</code></p>
<p>[S] - <code>Walk Backward</code></p>
<p>[A] - <code>Walk Left</code></p>
<p>[D] - <code>Walk Right</code></p>
<p>[1] - <code>Equip Pistol</code></p>
<p>[2] - <code>Equip Assault</code></p>
<p>[3] - <code>Equip Ak47</code></p>
<p>[4] - <code>Equip Sniper</code></p>
<p>[5] - <code>Equip Shotgun</code></p>
<!-- Changelog -->
<h1>Changelog</h1>
<ul>
  <li>
    Fixed <code>DrawScope.hx</code> not working in the browser.
  </li>
  <li>
    Fixed <code>DrawFramerate.hx</code> not working in the browser.
  </li>
  <li>
    Potentially fixed <code>DrawMinimap.hx</code> not working in the browser.
  </li>
  <li>
    Fixed missing Sniper texture.
  </li>
  <li>
    Fixed bad performance with minimap.
  </li>
  <li>
    Decreased global volume for sound effects.
  </li>
</ul>
<!-- Known issues -->
<h1>Known issues</h1>
<ol>
  <li>
    Mouselook is oddly automatically capped in the browser.<br />
    <code>NOTE:</code> This appears to be because the mouse cursor is locked to screen boundaries in the browser.
  </li>
  <li>
    Active mouse with escape key behavior doesn't work as expected.<br />
    <code>NOTE:</code> This happens even with official Armory online demos.
  </li>
  <li>
    How to prevent player weapons from appearing as Irradance reflections?
  </li>
  <li>
    <b>[NOT A BUG]:</b> How to properly and cap mouselook.<br />
    <code>NOTE:</code> I've already seen the FirstPersonController script from the FirstPerson demo, I'm not interested in that one.
  </li>
  <li>
    <b>[NOT A BUG]:</b> Music doesn't automatically start in the browser.
  </li>
</ol>
<!-- Todo -->
<h1>Todo</h1>

<ol>
  <li>
    Implement proper aspect ratio detection for scope overlay.
  </li>
  <li>Implement UI:
    <ul>
      <li>Home screen.
        <ul>
          <li>
            Resume button, settings button, quit button.
          </li>
        </ul>
      </li>
      <li>
        Pause screen.
      </li>
      <li>
        Death screen.
      </li>
    </ul>
  </li>
  <li>
    Implement menu settings:
    <ul>
      <li>
        Resolution size.
      </li>
      <li>
        Audio volume.
      </li>
    </ul>
  </li>
  <li>
    Implement jumping.
  </li>
  <li>
    Implement crouching.
  </li>
  <li>
    Implement shooting.
  </li>
  <li>
    Implement crosshair.
  </li>
  <li>
    Implement shot particles (Bullet-hole, sparks, and smoke particles, etc.).
  </li>
  <li>
    Implement enemies (zombies) with basic A.I..
  </li>
  <li>
    Implement animations for all logical animatable objects.
  </li>
</ol>
<h1>Developer questions</h1>
<ol>
  <li>
    Should I put <code>notifyOnRender()</code> inside <code>notifyOnInit()</code>?
  </li>
</ol>
<!-- Credits -->
<h1>Credits</h1>
<h2>Project</h2>
<!-- Armory3D -->
<a href="https://armory3d.org"><b>Armory3D</b></a><br />
<ul>
  <li>
    <p>License - <a href="https://opensource.org/licenses/zlib">https://opensource.org/licenses/Zlib</a></p>
  </li>
</ul>
<!-- RPaladin -->
<a href="https://github.com/rpaladin"><b>RPaladin</b></a>
<ul>
  <li>
    <p>License - <a href="https://creativecommons.org/licenses/by/4.0">https://creativecommons.org/licenses/by/4.0</a></p>
  </li>
</ul>
<h2>Models</h2>
<!-- Desert Environment -->
<a href="https://devassets.com/assets/desert-environment"><b>Desert Environment</b></a>
<ul>
  <li>
    <p>License - <a href="ttps://devassets.com/guidelines">https://devassets.com/guidelines</a></p>
  </li>
</ul>
<!-- Modern Weapons -->
<a href="https://devassets.com/assets/modern-weapons"><b>Modern Weapons</b></a>
<ul>
  <li>
    <p>License - <a href="ttps://devassets.com/guidelines">https://devassets.com/guidelines</a></p>
  </li>
</ul>
<h2>Textures</h2>
<!-- texture_01.png -->
<a href="https://kenney.nl/assets/prototype-textures"><b>texture_01.png</b></a>
<ul>
  <li>
    <p>License - <a href="https://creativecommons.org/publicdomain/zero/1.0">https://creativecommons.org/publicdomain/zero/1.0</a></p>
  </li>
</ul>
<!-- waternormals.jpg -->
<a href="https://supertux.org"><b>waternormals.jpg</b></a>
<ul>
  <li>
    <p>License - <a href="https://github.com/supertux/supertux/blob/master/LICENSE.txt">https://github.com/supertux/supertux/blob/master/LICENSE.txt</a></p>
  </li>
</ul>
<h2>Audio</h2>
<!-- 210018__supakid13__sniper-scope-zoom-in.wav -->
<a href="https://freesound.org/people/Supakid13/sounds/210018"><b>210018__supakid13__sniper-scope-zoom-in.wav</b></a>
<ul>
  <li>
    <p>License - <a href="https://creativecommons.org/publicdomain/zero/1.0">https://creativecommons.org/publicdomain/zero/1.0</a></p>
  </li>
</ul>
<!-- 170273__knova__change-weapon-sound.wav -->
<a href="https://freesound.org/people/knova/sounds/170273"><b>170273__knova__change-weapon-sound.wav</b></a>
<ul>
  <li>
    <p>License - <a href="https://creativecommons.org/licenses/by-nc/3.0">https://creativecommons.org/licenses/by-nc/3.0</a></p>
  </li>
</ul>
<!-- Cinematic Racing Hip-Hop by Infraction [Copyright Free Music] ⧸ Endgame.wav -->
<a href="https://youtube.com/watch?v=JLAsSAjwx44"><b>Cinematic Racing Hip-Hop by Infraction [Copyright Free Music] ⧸ Endgame.wav</b></a>
<ul>
  <li>
    <p>License - <a href="https://inaudio.org/blog/what-is-royalty-free-music/">https://inaudio.org/blog/what-is-royalty-free-music/</a></p>
  </li>
</ul>
<h2>Fonts</h2>
<!-- arial.ttf -->
<a href="https://microsoft.com/en-us/software-download"><b>arial.ttf</b></a>
<ul>
  <li>
    <p>License - <a href="https://en.wikipedia.org/wiki/Arial#Free_alternatives">Proprietary</a></p>
  </li>
</ul>
<!-- Thanks for feedback -->
<!--
Thanks for feedback
(sorted alphabetically)
• danieljackson
• longpinkytoes
• timodriaan
-->
<h1>Thanks for feedback</h1>
<h2>(sorted alphabetically)</h2>
<ul>
<li>
  danieljackson
</li>
<li>
  longpinkytoes
</li>
<li>
  timodriaan
</li>
</li>