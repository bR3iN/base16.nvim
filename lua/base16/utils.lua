local function starts_with(str, prefix)
  return (string.sub(str, 1, #prefix) == prefix)
end
local function hex__3ergb(hex)
  local parse_slice
  local function _1_(start, _end)
    local slice = hex:sub(start, _end)
    return tonumber(slice, 16)
  end
  parse_slice = _1_
  local r = parse_slice(2, 3)
  local g = parse_slice(4, 5)
  local b = parse_slice(6, 7)
  return {r, g, b}
end
local function rgb__3ehex(_2_)
  local _arg_3_ = _2_
  local r = _arg_3_[1]
  local g = _arg_3_[2]
  local b = _arg_3_[3]
  return string.format("#%02x%02x%02x", r, g, b)
end
local function clamp(val)
  return math.min(math.max(val, 0), 255)
end
local function add_rgb(_4_, _6_)
  local _arg_5_ = _4_
  local r1 = _arg_5_[1]
  local g1 = _arg_5_[2]
  local b1 = _arg_5_[3]
  local _arg_7_ = _6_
  local r2 = _arg_7_[1]
  local g2 = _arg_7_[2]
  local b2 = _arg_7_[3]
  local add_channel
  local function _8_(_241, _242)
    return clamp((_241 + _242))
  end
  add_channel = _8_
  return {add_channel(r1, r2), add_channel(g1, g2), add_channel(b1, b2)}
end
local function scale_rgb(_9_, weight)
  local _arg_10_ = _9_
  local r = _arg_10_[1]
  local g = _arg_10_[2]
  local b = _arg_10_[3]
  local scale_channel
  local function _11_(_241)
    return clamp((weight * _241))
  end
  scale_channel = _11_
  return {scale_channel(r), scale_channel(g), scale_channel(b)}
end
local function scale(color, weight)
  local rgb = hex__3ergb(color)
  return rgb__3ehex(scale_rgb(rgb, weight))
end
local function mix(color1, color2, weight)
  local rgb1 = hex__3ergb(color1)
  local rgb2 = hex__3ergb(color2)
  return rgb__3ehex(add_rgb(scale_rgb(rgb1, weight), scale_rgb(rgb2, (1 - weight))))
end
local function lighten(color, weight)
  return scale(color, (1 + weight))
end
local function darken(color, weight)
  return scale(color, (1 - weight))
end
return {lighten = lighten, darken = darken, scale = scale, mix = mix}
