# Pixel Spirit

[Pixel Spirit deck](https://pixelspiritdeck.com/) tarots implemented in Godot 4.

https://github.com/davcri/pixel-spirit/assets/6860637/348752e0-a60d-4449-b0a8-c04fd3fc68e9

## Tarot shaders

- Tarot 2D shaders are in `shaders/canvas_item/*.gdshader` files
- Tarot 3D shaders are in `shaders/spatials/*.gdshader` files
- Each file in `shaders/tarot-includes/*.gdshaderinc` has a `tarot_draw`
  function. EG:
  [01-justice.gdshaderinc](./shaders/tarot-includes/01-justice.gdshaderinc):

```
vec3 tarot_draw(vec2 uv) {
	return step(0.5, uv.x) * vec3(1.0, 1.0, 1.0);
}
```

## SDFs and utils

All the required SDFs and util functions are in
[utils.gdshaderinc](./shaders/utils/utils.gdshaderinc) which can be simply copy-pasted in other
Godot projects.

---

### Resources

- [Godot shading language](https://docs.godotengine.org/en/stable/tutorials/shaders/shader_reference/shading_language.html)
- [Lygia shader library](https://lygia.xyz/)
- https://registry.khronos.org/OpenGL-Refpages/gl4/

### License

- Pixel Spirit tarot: see https://github.com/patriciogonzalezvivo/PixelSpiritDeck/blob/master/LICENSE
- Rest of the project: MIT
