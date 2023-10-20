var state = stateReset;
function stateReset(gl) {
  var numAttribs = gl.getParameter(gl.MAX_VERTEX_ATTRIBS);
  var tmp = gl.createBuffer();
  gl.bindBuffer(gl.ARRAY_BUFFER, tmp);
  for (var ii = 0; ii < numAttribs; ++ii) {
    gl.disableVertexAttribArray(ii);
    gl.vertexAttribPointer(ii, 4, gl.FLOAT, false, 0, 0);
    gl.vertexAttrib1f(ii, 0);
  }
  gl.deleteBuffer(tmp);
  var numTextureUnits = gl.getParameter(gl.MAX_TEXTURE_IMAGE_UNITS);
  for (var ii = 0; ii < numTextureUnits; ++ii) {
    gl.activeTexture(gl.TEXTURE0 + ii);
    gl.bindTexture(gl.TEXTURE_CUBE_MAP, null);
    gl.bindTexture(gl.TEXTURE_2D, null);
  }
  gl.activeTexture(gl.TEXTURE0);
  gl.useProgram(null);
  gl.bindBuffer(gl.ARRAY_BUFFER, null);
  gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, null);
  gl.bindFramebuffer(gl.FRAMEBUFFER, null);
  gl.bindRenderbuffer(gl.RENDERBUFFER, null);
  gl.disable(gl.BLEND);
  gl.disable(gl.CULL_FACE);
  gl.disable(gl.DEPTH_TEST);
  gl.disable(gl.DITHER);
  gl.disable(gl.SCISSOR_TEST);
  gl.blendColor(0, 0, 0, 0);
  gl.blendEquation(gl.FUNC_ADD);
  gl.blendFunc(gl.ONE, gl.ZERO);
  gl.clearColor(0, 0, 0, 0);
  gl.clearDepth(1);
  gl.clearStencil(-1);
  gl.colorMask(true, true, true, true);
  gl.cullFace(gl.BACK);
  gl.depthFunc(gl.LESS);
  gl.depthMask(true);
  gl.depthRange(0, 1);
  gl.frontFace(gl.CCW);
  gl.hint(gl.GENERATE_MIPMAP_HINT, gl.DONT_CARE);
  gl.lineWidth(1);
  gl.pixelStorei(gl.PACK_ALIGNMENT, 4);
  gl.pixelStorei(gl.UNPACK_ALIGNMENT, 4);
  gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, false);
  gl.pixelStorei(gl.UNPACK_PREMULTIPLY_ALPHA_WEBGL, false);
  gl.polygonOffset(0, 0);
  gl.sampleCoverage(1, false);
  gl.scissor(0, 0, gl.canvas.width, gl.canvas.height);
  gl.stencilFunc(gl.ALWAYS, 0, 4294967295);
  gl.stencilMask(4294967295);
  gl.stencilOp(gl.KEEP, gl.KEEP, gl.KEEP);
  gl.viewport(0, 0, gl.canvas.width, gl.canvas.height);
  gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT | gl.STENCIL_BUFFER_BIT);
  return gl;
}
var glReset = Reset;
var state$1 = state;
function Reset(gl) {
  var cleanup = [
  "Buffer",
  "Framebuffer",
  "Renderbuffer",
  "Program",
  "Shader",
  "Texture"].
  map(function (suffix) {
    var remove = "delete" + suffix;
    var create = "create" + suffix;
    var original = gl[create];
    var handles = [];
    gl[create] = function () {
      var handle = original.apply(this, arguments);
      handles.push(handle);
      return handle;
    };
    return {
      remove,
      handles };

  });
  return function reset() {
    cleanup.forEach(function (kind) {
      for (var i = 0; i < kind.handles.length; i++) {
        gl[kind.remove].call(gl, kind.handles[i]);
      }
    });
    state(gl);
    return gl;
  };
}
glReset.state = state$1;

export { glReset as __moduleExports, glReset as default, state$1 as state };
