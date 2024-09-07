from vstools import vs, core, set_output

clip = core.std.BlankClip(format=vs.YUV422P10)

set_output(clip, "meme")