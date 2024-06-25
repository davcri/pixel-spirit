# Pixel Spirit

[Pixel Spirit](https://pixelspiritdeck.com/) tarot shaders implemented in Godot 4.

> The PixelSpirit Elements Deck is a tarot deck for learning GLSL shaders. Each
> PixelSpirit card has a visual element and its GLSL shader code. The cards are
> ordered from simplest to most complex, building a library of code functions that
> combine like a book of spells to form an infinite visual language.

https://github.com/davcri/pixel-spirit/assets/6860637/348752e0-a60d-4449-b0a8-c04fd3fc68e9

https://github.com/davcri/pixel-spirit/assets/6860637/816af57a-9b62-4433-8af4-67be736ff14a

## Tarot shaders

- Each file in `shaders/tarot-includes/*.gdshaderinc` has a `tarot_draw`
  function. EG:
  [01-justice.gdshaderinc](./shaders/tarot-includes/01-justice.gdshaderinc):
- Godot 2D shaders are in `shaders/canvas_item/*.gdshader` files
- Godot 3D shaders are in `shaders/spatials/*.gdshader` files

```
vec3 tarot_draw(vec2 uv) {
	return step(0.5, uv.x) * vec3(1.0, 1.0, 1.0);
}
```

## SDFs and utils

All the required SDFs and util functions are in
[utils.gdshaderinc](./shaders/utils/utils.gdshaderinc) which can be simply copy-pasted in other
Godot projects (there are some functions form Lygia's source code so make sure
to read its [license][lygia-license])

[lygia-license]: https://github.com/patriciogonzalezvivo/lygia/blob/main/LICENSE.md

---

### Resources

- [Godot shading language](https://docs.godotengine.org/en/stable/tutorials/shaders/shader_reference/shading_language.html)
- [Lygia shader library](https://lygia.xyz/)
- https://registry.khronos.org/OpenGL-Refpages/gl4/

### License

- Pixel Spirit tarot: see https://github.com/patriciogonzalezvivo/PixelSpiritDeck/blob/master/LICENSE
- Rest of the project: MIT
