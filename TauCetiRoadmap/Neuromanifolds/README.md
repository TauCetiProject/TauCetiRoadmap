# Roadmap: neuromanifolds, parametrisations and neurovarieties

**Summary.** A neural network of fixed shape is a family of functions indexed by its parameters:
each choice `w` of weights and biases gives a function `f(w) : X → Y`. Its *neuromanifold* is the
set of functions it realises, and its *parametrisation* sends a parameter to the function it
realises; the fibres of the parametrisation record which parameters realise the same function.
This roadmap develops that language for an arbitrary supplied realisation map `f : W → X → Y`,
with no prescribed data structure for architectures and no smooth structure implied by the word
neuromanifold. Two parameters are equivalent when their functions agree at every input. Dense
layers, coordinatewise activations, valid one-dimensional convolutions, multilayer perceptrons
(MLPs) and convolutional chains are concrete ways of supplying a realisation map. Models that are
polynomial jointly in their parameters and inputs, over an infinite field, also receive finite
coefficient coordinates and a *neurovariety*, the Zariski closure of the image of their
coefficient map.

The headline theorems are these. For every model, the parameters modulo equivalence are in
bijection with the neuromanifold, and a function of the parameters factors through the
parametrisation exactly when it is constant on fibres. If `f` is jointly polynomial over an
infinite field `K`, the coefficients of its outputs in the input variables are polynomials in the
parameters of uniformly bounded degree, and evaluation from this finite-dimensional coefficient
space to functions is linear and injective: two parameters realise the same function exactly when
their coefficients agree, and the neuromanifold is the image of the coefficient image. In an MLP
without biases whose output layer is linear and whose hidden layers apply `t ↦ t ^ r` with
layer-dependent exponents, every output is a polynomial in the inputs that is homogeneous of
degree the product of the hidden exponents; permuting the neurons of a hidden layer, or scaling
them by an invertible diagonal matrix with the compensating power on the next layer, does not
change the realised function. Over `ℝ` the coefficient image of every jointly polynomial model is
semialgebraic, but it need not be Zariski closed: for `x ↦ w² x` it is `[0, ∞)`, and its
neurovariety is `ℝ`.

Two library areas carry the roadmap. Mathlib's multivariate polynomials supply evaluation, the
submodules of polynomials of bounded degree and of homogeneous polynomials, zero loci and
vanishing ideals; the coefficient coordinates and the neurovariety are built from them. Tau Ceti's
real algebraic geometry supplies semialgebraic sets and the Tarski–Seidenberg projection theorem
over `ℝ`, from which semialgebraicity of coefficient images follows. No differential geometry is
used.

The guide to the layers below: Layer 1 builds the neuromanifold, the fibres and parameter
equivalence for any model, and their behaviour under reparametrisation, restriction and
composition with maps of inputs and outputs. Layer 2 builds composition of models, finite chains,
the concrete layers, MLPs and convolutional chains. Layer 3 treats jointly polynomial models:
their constructors, coefficient extraction, the faithful coefficient presentation and its
independence of choices, homogeneity of monomial MLPs, change of field, and the hidden-neuron
symmetries with identifiability. Layer 4 builds the neurovariety, its independence of the
presentation, semialgebraicity over `ℝ` and two scalar examples.

This README is the roadmap. [Suggested.lean](Suggested.lean) is its acceptance test: it states the
headline theorem that the pinned libraries do not prove, and its module docstring names the
declarations that state the others.

## Conventions

1. **Models.** A *model* (or *realisation map*) is any function `f : W → X → Y` from a parameter
   type to functions from an input type to an output type. The map already encodes connectivity,
   weight sharing, skip connections, biases and activations; no universal architecture record,
   layer sequence or tuple of widths is required, and two architectural descriptions supplying the
   same map give the same objects. The general definitions depend only on the map and its domain.
   Restricted parameter sets are subtypes. No topology, regularity or injectivity is assumed of a
   general model.
2. **Equality of realised functions** is equality at every input (function extensionality), not
   equality on a training set or almost everywhere.
3. **Names.** The neuromanifold is the literature's name for the set of realised functions; no
   manifold structure is implied. Unqualified Lean names below live in the namespace
   `TauCeti.Neuromanifold`; `MLPSpec.foo` stands for `TauCeti.Neuromanifold.MLPSpec.foo`.
   Images, kernels, quotients, matrices and polynomials are Mathlib's `Set.range`, `Set.image`,
   `Setoid.ker`, `Quotient`, `Matrix`, `LinearMap` and `MvPolynomial`; no parallel theory of
   images, quotients or polynomial evaluation is built.
4. **MLPs** are one constructor of realisation maps, not the definition of architecture. An MLP of
   depth `L` has widths `d_0, …, d_L`, a weight matrix `W_i` of size `d_i × d_(i-1)` and a bias
   `b_i ∈ K^(d_i)` for each layer `1 ≤ i ≤ L`, and scalar activations `σ_i` on the hidden layers
   `1 ≤ i ≤ L − 1`. Following Finkel–Rodriguez–Wu–Yahl (Definition 1), only hidden layers have
   activations: `h_0(x) = x`, `h_i(x) = σ_i(W_i h_(i-1)(x) + b_i)` coordinatewise for `i < L`, and
   the realised function is `h_L = W_L h_(L-1) + b_L` when `L ≥ 1` (the identity when `L = 0`).
   The *bias-free* network has its own parameter space of weights only, embedded into the affine
   parameters by zero biases, so its fibres contain no artificial bias coordinates. Identity
   activations give linear networks; *monomial* activations are `t ↦ t ^ r_i`, with layer-dependent
   exponents. Changing the depth, the widths or the activations gives a different model; it does
   not enlarge the parameter space of a fixed model. These conventions impose nothing on a
   separately supplied map.
5. **Scalars.** Dense and convolutional evaluation and polynomial substitution are over a field
   `K` (the Lean carriers are stated over semirings, which include fields). The faithful comparison
   of coefficients with functions needs `K` infinite (an infinite integral domain suffices), which
   covers `ℝ` and `ℂ`. ReLU, `tanh` and semialgebraicity are real constructions. Real and complex
   parameter maps are distinct instantiations of the same definitions; nothing equates their
   images or fibres, and no dimension comparison is made.
6. **Polynomial models.** A *jointly polynomial model* is a tuple `P = (P_j)` of polynomials, one
   for each output coordinate `j` in a finite type `J`, in parameter variables `w` (a type `W`)
   and input variables `x` (a finite type `X`); it realises `w ↦ (x ↦ (P_j(w, x))_j)`, evaluation
   at the pair `(w, x)`. Numbered variables `Fin p ⊕ Fin n` are the special case
   `K[w_1, …, w_p, x_1, …, x_n]` of Marchetti–Shahverdi–Mereta–Trager–Kohn (§3.1). A *polynomial
   coefficient map* is a map `c` from parameters to a finite-dimensional space `V` of polynomial
   functions each of whose coordinates is a polynomial in the parameters; composed with a
   *faithful* evaluation map `E : V → (X → Y)` (linear and injective) it is the model `E ∘ c`.
   Both a joint polynomial tuple and a coefficient map are entry points; neither needs an MLP or
   convolutional constructor.
7. **Neurovariety.** For a coefficient map `c` into a finite coordinate space `K^σ`, the
   neurovariety is the Zariski closure of the image of `c`: the common zeros in `K^σ` of the
   polynomials over `K` vanishing on the image (Finkel–Rodriguez–Wu–Yahl, §1.1, equations
   (3)–(4)). The realised image, its neurovariety, and the property that they coincide (an
   *algebraic image*) are kept separate. Marchetti et al. do not define neurovariety separately;
   Shahverdi (§2.2) uses the word for a closed neuromanifold. This roadmap follows the closure
   convention and imposes closedness on no realised image.
8. **Notation.** `K^n` is `Fin n → K`; for a multi-index `α`, `x^α` is the monomial and `|α|` its
   total degree. A product of parameter spaces is reassociated by the canonical equivalences, and
   the parameter space of a model without parameters is a one-point type.

## Layer 1: realised functions and parameter fibres

The definitions follow Marchetti–Shahverdi–Mereta–Trager–Kohn (Definition 3.1 for the
neuromanifold, §4.3 for fibres). The facts below are elementary consequences of these definitions;
none is attributed to the paper.

### 1.1 The neuromanifold, the parametrisation and the fibres

For a model `f : W → X → Y`, the neuromanifold is `M_f = {g : X → Y | ∃ w, f(w) = g}`
(Marchetti et al., Definition 3.1), `realizedFunctions f`, defined as `Set.range f`. Both the
ambient realisation map `f` and its corestriction `φ_f : W → M_f`, `parametrization f`, are kept.
The fibre over an ambient function `g` is `{w | f(w) = g}`, `fiber f g`, and parameter
equivalence, `w ∼ v` exactly when `f(w) = f(v)`, is `parameterSetoid f`, the kernel `Setoid.ker f`
(Marchetti et al., §4.3).

- A function lies in `M_f` exactly when some parameter realises it (`mem_realizedFunctions`).
- `φ_f` is surjective and its value at `w`, as an ambient function, is `f(w)`
  (`parametrization_surjective`, `parametrization_coe`).
- Fibres over distinct functions are disjoint, and the fibre over `f(w)` is the equivalence class
  of `w` (`disjoint_fiber`, `fiber_eq_class`).

Prove that the fibre over a function `g : X → Y` is nonempty exactly when `g ∈ M_f`.
*Needs:* Tau Ceti `fiber`, `realizedFunctions`; Mathlib `Set.preimage_singleton_nonempty`.

**Checks.**

- For `f(w)(x) = w x` over `ℝ`, the fibre over `x ↦ 2x` is `{2}`. If realised functions were
  compared only on the sample `{0}`, every two parameters would be equivalent and this fibre
  would be all of `ℝ`.
- For `f(w)(x) = w² x` over `ℝ`, the fibre over `x ↦ 4x` is `{−2, 2}` and the fibre over
  `x ↦ −x` is empty, matching `x ↦ −x ∉ M_f`.

### 1.2 Parameters modulo realisation

The equivalence `W/∼ ≃ M_f` is `quotientEquiv f`, with the commuting equation on representatives
`quotientEquiv_mk`: the class of `w` goes to `φ_f(w)`. It is an equivalence of sets; nothing is
claimed about quotient or subspace topologies. A map `h : W → Z` factors through `φ_f`, and then
uniquely, exactly when it is constant on each fibre, `Function.FactorsThrough h f`
(`existsUnique_factor_iff`).

**Checks.**

- For `f(w)(x) = w² x` over `ℝ`, the classes are the pairs `{w, −w}`. The map `w ↦ |w|` factors
  through `φ_f`; the identity of `ℝ` does not, since it separates `1` and `−1`, which lie in one
  fibre.

### 1.3 Reparametrisation and restriction

For a map of parameter spaces `r : W' → W`, the model `f ∘ r` realises some of the functions of
`f`. Prove:

- the reparametrisation inclusion: `M_(f ∘ r) ⊆ M_f`, with equality when `r` is surjective;
- the fibre preimage formula: the fibre of `f ∘ r` over `g` is the preimage under `r` of the fibre
  of `f` over `g`;
- restriction: for a set `S` of parameters, the neuromanifold of the restriction of `f` to the
  subtype `S` is the image `f '' S`; for `S = ∅` it is empty.

Transport along an equivalence `e : W' ≃ W` of parameter spaces is `fiberEquiv f e g`, an
equivalence between the fibres of `f ∘ e` and of `f` over `g`; parameter equivalence of `f ∘ r` is
parameter equivalence of `f` pulled back along `r` (`parameterSetoid_comp_iff`), for every `r`.
*Needs:* Tau Ceti `realizedFunctions`, `fiber`; Mathlib `Set.range_comp_subset_range`,
`Function.Surjective.range_comp`, `Set.preimage_comp`, `Set.range_domRestrict`.

**Checks.**

- For `f(w)(x) = w x` over `ℝ` and `r(u) = u²`, the neuromanifold of `f ∘ r` is
  `{x ↦ t x | t ≥ 0}`, a proper subset of `M_f`: equality needs `r` surjective. The fibre of `f ∘ r`
  over `x ↦ 4x` is `r⁻¹({4}) = {−2, 2}`.
- Restricting `f(w)(x) = w x` to `S = [0, ∞)` gives `{x ↦ t x | t ≥ 0}`.

### 1.4 Post- and precomposition

For `h : Y → Z`, the postcomposed model is `w ↦ h ∘ f(w)`; for `a : X' → X`, the precomposed model
is `w ↦ f(w) ∘ a`. Prove:

- the postcomposition formula: the neuromanifold of `w ↦ h ∘ f(w)` is `{h ∘ g | g ∈ M_f}`;
  parameter equivalence of `f` implies that of the postcomposed model, and when `h` is injective
  the two equivalences coincide (postcomposition preserves and reflects equivalence);
- the precomposition formula: the neuromanifold of `w ↦ f(w) ∘ a` is `{g ∘ a | g ∈ M_f}`;
  parameter equivalence of `f` implies that of the precomposed model, and when `a` is surjective
  the two equivalences coincide;
- the degenerate parameter spaces: if `W` is empty, `M_f` is empty and so is every fibre; if `W`
  has exactly one point `∗`, then `M_f = {f(∗)}`. The fibre over `f(∗)` is then all of `W`
  (`fiber_eq_univ`, for every subsingleton `W`).

*Needs:* §1.1; Tau Ceti `realizedFunctions`, `parameterSetoid`; Mathlib `Set.range_comp`,
`Function.Injective.comp_left`, `Function.Surjective.injective_comp_right`, `Set.range_eq_empty`,
`Set.range_unique`.

**Checks.**

- For `f(w)(x) = w x` over `ℝ` and `h(y) = y²`, the postcomposed model is `w ↦ (x ↦ w² x²)`, in
  which `1` and `−1` are equivalent although `f(1) ≠ f(−1)`: without injectivity of `h`,
  postcomposition does not reflect equivalence.
- For the same `f`, and `a` the inclusion of the one-point set `{0}` into `ℝ`, every `f(w) ∘ a` is
  the zero function, so all parameters become equivalent: without surjectivity of `a`,
  precomposition does not reflect equivalence.

### Examples

For `f(w)(x) = w² x` over `ℝ`: `M_f = {x ↦ t x | t ≥ 0}`, the classes of parameter equivalence are
`{w, −w}`, and `quotientEquiv f` identifies `ℝ/∼` with `M_f` by `[w] ↦ (x ↦ w² x)`. Restricting to
`[0, ∞)` gives the same neuromanifold with trivial fibres, so the restriction is injective.

### Dependencies

Mathlib sets, images, setoids and quotients; Tau Ceti `realizedFunctions`, `parametrization`,
`fiber`, `parameterSetoid`, `quotientEquiv` and their API. No other layer.

## Layer 2: constructors of realisation maps

### 2.1 MLP specifications and parameter spaces

An MLP specification over `K` of depth `L` is `MLPSpec K L`: widths `d : Fin (L + 1) → ℕ` and
scalar activations of the hidden layers `1, …, L − 1`, following Convention 4. Its affine parameter
space `A.Parameters` is `∏ (K^(d_i × d_(i-1)) × K^(d_i))` over the layers `1 ≤ i ≤ L`, its bias-free
parameter space `A.Weights` is `∏ K^(d_i × d_(i-1))`, and the zero-bias embedding is the injective
`A.zeroBias` (`MLPSpec.zeroBias_injective`). The prefix evaluations `h_i` are `A.evalPrefix`, with
the prefix recursion `MLPSpec.evalPrefix_zero` and `MLPSpec.evalPrefix_succ`; the realisation is
`A.realize` and the bias-free realisation is `A.realizeWeights = A.realize ∘ A.zeroBias`. Layer 1's
neuromanifold, parametrisation and fibres apply to both. The depth-zero and depth-one equations are
`MLPSpec.realize_depth_zero` (the identity) and `MLPSpec.realize_depth_one` (`x ↦ W_1 x + b_1`);
`MLPSpec.realize_succ` says the last layer is affine. Specifications agree when their widths and
activations agree (`MLPSpec.ext`), and prefix evaluations agree for parameters agreeing on the
layers below (`MLPSpec.evalPrefix_congr`).

Concatenation: for `A` of depth `L + 1`, `B` of depth `M + 1` and an activation `σ` for the
junction layer, `A.append B σ` has depth `L + 1 + (M + 1)`; a specification of that depth splits
into `lowerLayers`, `upperLayers` and `junctionActivation`, recovering `A` and `B` when the output
width of `A` is the input width of `B` (`MLPSpec.lowerLayers_append`, `MLPSpec.upperLayers_append`,
`MLPSpec.append_lowerLayers_upperLayers`). The parameter products split explicitly
(`MLPSpec.splitParameters`, `MLPSpec.splitWeights`), and the realisation of the concatenation is
the upper realisation after the junction activation after the lower realisation
(`MLPSpec.realize_splitParameters_symm`, with the neuromanifold formula
`MLPSpec.realizedFunctions_realize`).

Constructors: identity activations `MLPSpec.linear d`; arbitrary layerwise polynomial hidden
activations `MLPSpec.polynomial d p`, with `σ_i(t) = p_i(t)`; and monomial exponents
`MLPSpec.monomial d r`, with `σ_i(t) = t ^ r_i` and the exponents allowed to differ between
layers. The monomial networks of Finkel–Rodriguez–Wu–Yahl (Definition 1) are
`MLPSpec.monomial d (fun _ => r)` with `L ≥ 1`, no biases (`realizeWeights`), a common hidden
exponent `r` and a linear head; each hidden step is `h ↦ (W h) ^ r` coordinatewise
(`MLPSpec.monomial_evalPrefix_zeroBias_castSucc_succ`).

Prove the one-step composition formula: for an MLP specification `A` of depth `L + 2`, read
`A.realize`, through `A.splitParameters`, as a model on the product of the parameters of its first
`L + 1` layers and of its last layer. It is the composition model (§2.2) of three models: the
realisation of `A.lowerLayers`, the coordinatewise activation layer of `A.junctionActivation`
(which has a one-point parameter space), and the dense layer of the last layer. The
reassociation of the parameter products is the only bookkeeping. Prove the same for
`A.realizeWeights`, with the bias-free linear layer in place of the dense layer. For
`MLPSpec.monomial d (fun _ => r)` with zero biases, this and induction on the depth give the
realisation `W_L ∘ σ_r ∘ W_(L-1) ∘ ⋯ ∘ σ_r ∘ W_1`, where `σ_r` is `t ↦ t ^ r` coordinatewise.
*Needs:* Tau Ceti `MLPSpec.realize_splitParameters_symm`,
`MLPSpec.realizeWeights_splitWeights_symm`, `MLPSpec.realize_depth_one`,
`MLPSpec.realizeWeights_succ`, `compose`, `dense`, `activation`; Mathlib `Equiv.prodAssoc`.

**Checks.**

- Depth `2`, widths `(1, 1, 1)`, hidden activation `t ↦ t²`, `W_1 = 1`, `b_1 = 0`, `W_2 = 1`,
  `b_2 = 1`: the realisation is `x ↦ x² + 1`. A convention that also activates the output layer
  gives `(x² + 1)²`.
- Depth `2` with identity hidden activation realises `x ↦ W_2 W_1 x + (W_2 b_1 + b_2)`: the
  product is `W_2 W_1`, the later layer on the left.
- Depth `0` realises the identity of `K^(d_0)`, and its neuromanifold is a single point.

### 2.2 Composition and concrete layers

The composition of models `f : W → X → Y` and `g : V → Y → Z` is `compose f g`, with parameter
space `W × V` and realisation `(w, v) ↦ g(v) ∘ f(w)` (`compose_apply_apply`); its neuromanifold is
`{b ∘ a | a ∈ M_f, b ∈ M_g}` (`realizedFunctions_compose`). Composition is associative under the
reassociation `Equiv.prodAssoc` (`compose_assoc`), and the parameter-free identity model is a unit
on both sides (`const_id_compose`, `compose_const_id`). This is the compositional reading of
Marchetti et al. (§3, equation (2)), with no universal syntax for neural architectures.

Concrete layers over `K`, with their specialisation laws:

- The dense affine layer `dense`, with parameters `(A, b)` for a `Matrix` with finite input index
  type, and value `x ↦ A x + b`; its coordinate formula is `(A x + b)_i = ∑_j A_ij x_j + b_i`
  (`dense_apply_apply`) and `b = 0` gives the linear layer `A.mulVec` (`dense_mk_zero`).
- The coordinatewise activation layer `activation σ`, `x ↦ (i ↦ σ(x_i))`, with a one-point
  parameter space; the identity activation gives the identity (`activation_id`), and the layer
  commutes with reindexing the coordinates, in particular with permutations (`activation_reindex`).
  The instances are the identity, `t ↦ t ^ r` for every natural `r` including `0`
  (`powerActivation`), ReLU `t ↦ max(0, t)` (`reluActivation`) and `t ↦ tanh t`
  (`tanhActivation`), the last two over `ℝ`.
- The one-dimensional, single-channel valid convolution with filter length `k`, stride `s`, input
  length `n` and output length `m`, where `n = s(m − 1) + k` (the case of interest has `k, s, m`
  positive). With zero-based indices, `C_w(x)_i = ∑_(j<k) w_j x_(s i + j)`, with no padding and no
  filter reversal (Shahverdi, §2.1, equations (2.1)–(2.2)). The index `s i + j` is valid,
  `convolutionIndex` taking values in `Fin n`; the convolution is `convolution`, its structured
  matrix `convolutionMatrix`, and the matrix and sum presentations agree
  (`convolutionMatrix_mulVec`). A scalar bias shared across output positions is the separate
  constructor `affineConvolution`, which is `convolution` at zero bias.

Finite dense chains are the MLP specifications of §2.1. Finite convolutional chains are
`ConvolutionSpec K L`, an MLP specification together with filter lengths and strides satisfying
the length equation at every layer; their realisation is the MLP realisation of the convolution
matrices (`ConvolutionSpec.realize_eq_mlp`), with the recursive layer formula
`ConvolutionSpec.evalPrefix_succ`. Two bias-free dense layers with identity activation realise
`x ↦ B A x` (`compose_mulVec_mulVec`), and their neuromanifold is the image of `(A, B) ↦ B A` under
matrix evaluation (`realizedFunctions_compose_mulVec_mulVec`); like every result of this layer,
this uses the complete parameter products and does not assume that different parameters give
different functions.

Define *finite chains* of models, with varying intermediate types. A chain of length `n` consists
of input types `X_0, …, X_n`, parameter types `W_1, …, W_n` and models `f_i : W_i → X_(i-1) → X_i`
(in Lean, `X : Fin (n + 1) → Type*`, `W : Fin n → Type*` and
`f : (i : Fin n) → W i → X i.castSucc → X i.succ`). Its parameter type is the product of the
`W_i`, and its realisation sends `(w_1, …, w_n)` to `f_n(w_n) ∘ ⋯ ∘ f_1(w_1)`. The empty chain has
a one-point parameter type and realises the identity of `X_0`. Prove:

- the chain realisation of length `n + 1` is the composition model of the chain of its first `n`
  models and its last model, under the equivalence of its parameter type with the product of the
  parameter type of the first `n` models and `W_(n+1)`;
- its neuromanifold is `{g ∘ h | h ∈ M_first, g ∈ M_(f_(n+1))}`, and the neuromanifold of the
  empty chain is the single function `id`;
- a chain of length one realises `f_1`, up to the equivalence of its parameter type with `W_1`;
- splitting a chain of length `m + n` into its first `m` and its last `n` models exhibits its
  realisation as the composition model of the two sub-chains, up to the equivalence of parameter
  types;
- the realisation of an MLP specification is the realisation of the chain of its dense and
  activation layers (the dense layers of layers `1, …, L`, with the activation layer of `σ_i` after
  layer `i < L`), and the bias-free realisation that of the chain of linear and activation layers;
  the realisation of a convolutional specification is the realisation of the chain of its
  affine convolutions and activation layers.

*Needs:* §2.1; Tau Ceti `compose`, `realizedFunctions_compose`, `compose_assoc`,
`const_id_compose`, `dense`, `activation`, `affineConvolution`, `MLPSpec.realize_succ`,
`ConvolutionSpec.realize_succ`; Mathlib `Fin.snocEquiv` or `Fin.consEquiv`.

**Checks.**

- With `A = [[0, 1], [0, 0]]` as first layer and `B = [[1, 0], [0, 0]]` as second, the
  two-layer linear model realises `x ↦ B A x = (x_2, 0)`; the reversed order gives `A B = 0`.
- Filter length `2`, stride `1`, output length `2`, so `n = 3`:
  `C_w(x) = (w_0 x_0 + w_1 x_1, w_0 x_1 + w_1 x_2)`, with matrix `[[w_0, w_1, 0], [0, w_0, w_1]]`.
  Reversing the filter would give `w_1 x_0 + w_0 x_1` as first coordinate.
- Filter length `3`, stride `2`, output length `2` give `n = 5` and the windows `{0, 1, 2}` and
  `{2, 3, 4}`, which overlap in `x_2`; the largest index `s(m − 1) + k − 1 = 4` is `n − 1`, so no
  padding is needed.
- `t ↦ t ^ 0` sends every vector to the all-ones vector (`0 ^ 0 = 1`), not to the indicator of
  its nonzero coordinates.
- The empty chain's neuromanifold is `{id}`; a chain of two copies of the identity model has a
  one-point parameter type and the same neuromanifold.

### Examples

The two-layer linear network with hidden width `1` from `K²` to `K²` realises exactly the maps
`x ↦ B A x` with `A ∈ K^(1×2)` and `B ∈ K^(2×1)`, the matrices of rank at most one, and its fibre
over the zero map is `{(A, B) | A = 0 or B = 0}`. The motivation is Marchetti et al., Appendix A;
neither its dimension nor its optimisation claims enter here.

### Dependencies

Layer 1; Mathlib matrices, `Fin` products and equivalences; Tau Ceti `compose`, the layers
`dense`, `activation`, `convolution` and `affineConvolution`, `MLPSpec` and `ConvolutionSpec` with
their API.

## Layer 3: polynomial models and faithful coefficient coordinates

An algebraic model in the sense of Marchetti et al. (§3.1) is polynomial jointly in parameters and
inputs; this layer develops its algebraic interface. The comparisons of coefficients with functions
are over an infinite field `K` (Convention 5); the constructions, and the homogeneity of §3.6, hold
over every commutative semiring.

### 3.1 Jointly polynomial models and their constructors

A jointly polynomial model `P : J → MvPolynomial (W ⊕ X) K` (Convention 6) realises
`polynomialRealization P`, with `polynomialRealization P w x j = eval (Sum.elim w x) (P j)`. The
constructors and their evaluation equations are: constants (`polynomialRealization_C`), coordinate
projections of inputs and parameters (`polynomialRealization_X_inr`,
`polynomialRealization_X_inl`), pairing (`polynomialRealization_sumElim`), reindexing parameters
by polynomial maps (`polynomialReparametrize`), composition by polynomial substitution
(`polynomialCompose`, realising `compose` of the two models), linear and affine layers
(`polynomialLinear`, `polynomialDense`), polynomial activations (`polynomialActivation`) and
convolutions (`polynomialConvolution`, `polynomialAffineConvolution`).

The finitely many weights and biases of a fixed chain are enumerated by the finite types
`A.ParameterIndex` and `A.WeightIndex`, which identify the parameter products with coordinate
spaces (`MLPSpec.parameterEquiv`, `MLPSpec.weightEquiv`, with the parameter count
`MLPSpec.card_parameterIndex`, and `ConvolutionSpec.parameterEquiv`); a numbering by `Fin p`
follows from `Fintype.equivFin`. When every hidden activation of `A` is a polynomial function,
`A.polynomialRealize q` is a joint polynomial tuple realising `A.realize` in these coordinates
(`MLPSpec.polynomialRealization_polynomialRealize`), and `A.polynomialRealizeWeights q` realises
`A.realizeWeights` (`MLPSpec.polynomialRealization_polynomialRealizeWeights`); likewise for
convolutional chains (`ConvolutionSpec.polynomialRealization_polynomialRealize`). The
identity-activation specialisation is `MLPSpec.polynomialRealization_polynomialRealize_linear`.

**Checks.**

- The MLP with widths `(2, 3, 1)` has `3·2 + 3 + 1·3 + 1 = 13` affine parameters and
  `3·2 + 1·3 = 9` weights.
- The one-output dense layer on two inputs is `A_11 x_1 + A_12 x_2 + b_1`: of degree `2` jointly
  in parameters and inputs, and of degree `1` in the inputs.

### 3.2 Coefficients in the input variables

Collecting the coefficients of `P_j` in the input variables gives `inputPolynomial P j`, a
polynomial in `x` with coefficients polynomial in `w`. The uniform input-degree bound
`polynomialInputDegree P` does not depend on `w`, and
`f(w)(x)_j = ∑_(|α| ≤ d) c_(j,α)(w) x^α` with `c_(j,α)` the coefficient polynomials
(`polynomialRealization_eq_sum`); the bound need not be minimal. Zero outputs and constant
polynomials are covered (`polynomialInputDegree_of_isEmpty`, `polynomialInputDegree_zero`,
`polynomialInputDegree_C`).

**Checks.**

- For one parameter, one input and `P = w² x + w`, the coefficients are `c_1(w) = w²` and
  `c_0(w) = w`, with bound `1`. At `w = 0` the realised function is zero, of lower degree, while
  the bound stays `1`: the bound is uniform, not pointwise.

### 3.3 The bounded-degree coefficient space

Let `V` be the product over output coordinates of the polynomials of total degree at most `d` in
the input variables, `MvPolynomial.restrictTotalDegree X K d`. Its monomial coefficients give the
linear equivalence `MvPolynomial.boundedCoefficientEquiv` of `V` with `K^J`, where
`J = {(j, α) | |α| ≤ d}`; this index type is finite for finitely many input variables
(`Finsupp.finite_of_degree_le`). Evaluation `E : V → (X → Y)` is the linear map
`MvPolynomial.tupleEvaluation`, injective over an infinite integral domain
(`MvPolynomial.tupleEvaluation_injective`). The polynomial coefficient map
`polynomialCoefficientMap P : W → V` satisfies `E ∘ c = f`
(`tupleEvaluation_comp_polynomialCoefficientMap`), and `polynomialCoefficientCoordinates P` is the
same map in the coordinates `K^J`.

A supplied polynomial coefficient map is accepted directly (Convention 6): from coefficient
polynomials `Q` in the parameters, `polynomialFromCoefficients Q` is a joint polynomial tuple whose
realisation is `E` composed with the supplied map, and extracting its coefficients recovers the
supplied map in the same coordinates (`exists_polynomialRealization_of_coefficients`,
`polynomialCoefficientMap_polynomialFromCoefficients_coe`). This round trip connects the two entry
points without architecture data.

**Checks.**

- For two inputs and `d = 2`, one output has `J` of size `6`, the monomials
  `1, x_1, x_2, x_1², x_1 x_2, x_2²`.
- Over the finite field `𝔽_2`, the polynomials `x²` and `x` define the same function, so
  evaluation on polynomials of degree at most `2` in one variable is not injective: faithfulness
  needs `K` infinite.

### 3.4 Coefficients and functions

The neuromanifold is the image of the coefficient image under evaluation,
`E(range c) = M_f` (`realizedFunctions_polynomialRealization`). Over an infinite integral domain,
coefficients and functions give the same fibres: `c(w) = c(v)` exactly when `f(w) = f(v)`
(`polynomialCoefficientMap_eq_iff`), and the fibre of `f` over `E(q)` is the fibre of `c` over `q`
(`fiber_polynomialRealization_tupleEvaluation`). The same comparison holds for any faithful
presentation, an injective `E` with `E ∘ c = f`: `M_f = E(range c)`
(`realizedFunctions_eq_image_range`), parameter equivalence is the kernel of `c`
(`parameterSetoid_eq_ker`), fibres correspond (`fiber_apply_eq_preimage`), and the coefficient
image and the realised image are equivalent types (`rangeEquivRealizedFunctions`). Faithfulness
means injectivity of the evaluation map; a presentation by sampled outputs does not satisfy it
automatically.

**Checks.**

- For `f(w)(x) = w x` over `ℝ`, presenting `f(w)` by its value at the single sample `x = 0` gives
  the constant vector `0` for every `w`, while the realised functions differ: no injective `E`
  with `E ∘ c = f` exists for this `c`.

### 3.5 Degree bounds and coordinate changes

Increasing the degree bound pads the coefficients by zeros: `MvPolynomial.boundedCoefficientPadding`
is linear and injective (`MvPolynomial.boundedCoefficientPadding_injective`) and commutes with
evaluation (`MvPolynomial.tupleEvaluation_padding`,
`tupleEvaluation_padding_polynomialCoefficientCoordinates`). Changing the basis of the same
ambient space by a linear equivalence transforms the coefficient polynomials linearly
(`polynomialCoefficientTransform`, with `tupleEvaluation_comp_polynomialCoefficientTransform`).
These two statements are the precise independence guarantees; an arbitrary nonlinear encoding is
not a coordinate change.

**Checks.**

- With `d = 1`, `x ↦ 2x + 1` has coordinates `(1, 2)` on the monomials `(1, x)`; with `d = 2` it has
  `(1, 2, 0)` on `(1, x, x²)`.

### 3.6 Homogeneity of bias-free monomial MLPs

Let `A = MLPSpec.monomial d r` be the monomial MLP specification over a commutative semiring `K`,
of depth `L`, with widths `d` and hidden exponents `r : Fin (L − 1) → ℕ`; its output layer is
linear, so its exponent is `1`. Prove
`isHomogeneous_inputPolynomial_polynomialRealizeWeights_monomial`: substituting zero for every
bias and reading each output coordinate `o` as a polynomial in the input variables with
coefficients polynomial in the weights, `inputPolynomial (A.polynomialRealizeWeights q) o` with
`q j = X ^ r j`, the polynomial is homogeneous of degree `∏ j, r j`. Homogeneity is in the input
variables, not jointly in weights and inputs. The zero polynomial is homogeneous of every degree,
so nothing is asserted about the total degree. Positivity of the exponents is not needed.

Deduce:

- for a common hidden exponent `r`, the degree is `r ^ (L − 1)` (for `L ≥ 1`, and `1` at depth
  `0`);
- the input-degree bound of these polynomials is at most `∏ j, r j`
  (`polynomialInputDegree_le_of_isHomogeneous`);
- the homogeneous coefficient presentation of the bias-free monomial MLP,
  `polynomialHomogeneousCoefficientMap` applied to these polynomials, its inclusion into the
  bounded-degree presentation of §3.3 (`inclusion_comp_polynomialHomogeneousCoefficientMap`), and
  the description of the bias-free neuromanifold as the image of the homogeneous coefficient image
  under evaluation (`realizedFunctions_polynomialRealization_of_isHomogeneous` with
  `MLPSpec.realizedFunctions_polynomialRealizeWeights`).

*Route.* Induction along the layers with the prefix recursion `MLPSpec.polynomialPrefix_succ`:
taking coefficients in the input variables is a ring isomorphism `K[w, x] ≅ K[w][x]`, substituting
zero for the biases maps coefficients along a ring homomorphism, the inputs are homogeneous of degree `1`, a linear layer without bias
preserves the degree, and `t ↦ t ^ r` multiplies it by `r`. The layer constructors' lemmas
`isHomogeneous_inputPolynomial_polynomialLinear`,
`isHomogeneous_inputPolynomial_polynomialActivation_X_pow` and
`isHomogeneous_inputPolynomial_polynomialCompose` give the same steps for chains built from them.
*Needs:* §§3.1–3.3; Tau Ceti `MLPSpec.monomial`, `MLPSpec.polynomialRealizeWeights`,
`MLPSpec.polynomialPrefix_succ`, `MLPSpec.polynomialRealizeWeights_def`, `inputPolynomial`,
`polynomialHomogeneousCoefficientMap`; Mathlib `MvPolynomial.IsHomogeneous` with
`IsHomogeneous.add`, `IsHomogeneous.mul` and `IsHomogeneous.pow`, `Fin.prod_const`.

**Checks.**

- Widths `(1, 1, 1)`, `r = 2`: the output is `W_2 W_1² x²`, homogeneous of degree `2` in `x` and of
  degree `5` jointly; a statement of joint homogeneity of degree `2` is false.
- Widths `(1, 0, 1)`, `r = 2`: the hidden layer is empty and the output polynomial is `0`,
  homogeneous of degree `2`, of total degree `0`; a statement "the total degree is `∏ r_i`" fails.
- Widths `(1, 1, 1)`, `r = 2`, with biases: `W_2 (W_1 x + b_1)² + b_2` has constant term
  `W_2 b_1² + b_2` (for `W_1 = 2`, `b_1 = 1`, `W_2 = 3`, `b_2 = 5` its value at `x = 0` is `8`), so
  it is not homogeneous: bias-freeness is needed.
- Widths `(1, 2, 1)`, `r = 0`: every hidden neuron outputs `1` and the output is the sum
  `W_2[1,1] + W_2[1,2]` of the last weights, homogeneous of degree `0 = ∏ r_i`.
- Depth `3`, widths `(1, 1, 1, 1)`, `r = 2`: the output is `W_3 W_2² W_1⁴ x⁴`, of degree
  `4 = 2 ^ (3 − 1)`.

### 3.7 Change of field

Polynomial models and their realisations transport along a ring homomorphism `φ : K → K'`, in
particular a field embedding, by mapping coefficients, weights and inputs:
`polynomialRealization (map φ ∘ P) (φ ∘ w) (φ ∘ x) = φ ∘ polynomialRealization P w x`
(`polynomialRealization_map`), with coefficient extraction (`inputPolynomial_map`), the degree
bound (`polynomialInputDegree_map`, for injective `φ`), the layer constructors
(`map_polynomialDense`, `map_polynomialLinear`, `map_polynomialActivation`,
`map_polynomialConvolution`, `map_polynomialAffineConvolution`) and substitution and composition
(`map_polynomialReparametrize`, `map_polynomialCompose`). For injective `φ` and `K` an infinite
integral domain, parameters over `K` are equivalent exactly when their images are
(`polynomialRealization_map_eq_iff`), and the `K`-points of a transported fibre over a transported
function form the original fibre (`preimage_fiber_polynomialRealization_map`). For
`ℝ → ℂ` this is `polynomialRealization_map_ofReal` and `polynomialRealization_map_ofReal_eq_iff`.
Neither the real and complex images nor their fibres are equated, and no dimension comparison is
made.

Prove transport of the polynomial architectures of §3.1: for an MLP specification `A` over `K`
whose hidden activations are the polynomial functions of `q`, mapping the coefficients of
`A.polynomialRealize q` along `φ` gives the joint polynomial tuple of the MLP specification over
`K'` with the same widths and the hidden activations of the mapped polynomials `q_j.map φ`, and the
same for `A.polynomialRealizeWeights q`; likewise for convolutional specifications, with the same
filter lengths and strides.
*Needs:* §3.1; Tau Ceti `MLPSpec.polynomialRealize`, `MLPSpec.polynomialPrefix_succ`,
`ConvolutionSpec.polynomialRealize`, `polynomialRealization_map`; Mathlib `MvPolynomial.map`,
`Polynomial.map`, `Polynomial.aeval`.

**Checks.**

- For `x ↦ w² x`, the real coefficient image is `[0, ∞)` and the complex one is `ℂ`, whose real
  points are all of `ℝ`: the real image is not the set of real points of the complex image. The
  fibre over `x ↦ −x` is empty over `ℝ` and `{i, −i}` over `ℂ`; its real points are empty, as the
  fibre statement says.

### 3.8 Hidden-neuron symmetries and identifiability

For a bias-free MLP whose hidden layer `i` has activation `t ↦ t ^ r_i`, two transformations of
the weights preserve the realised function (Finkel–Rodriguez–Wu–Yahl, Lemma 4 and equation (6),
with the same local calculation for layer-dependent exponents). For a permutation matrix `P` at
hidden layer `i`, `W_i ↦ P W_i` and `W_(i+1) ↦ W_(i+1) P⁻¹` (`MLPSpec.permuteHidden`, for any
coordinatewise activation, `MLPSpec.realizeWeights_permuteHidden`). For an invertible diagonal
matrix `D`, `W_i ↦ D W_i` and `W_(i+1) ↦ W_(i+1) D^(−r_i)`, the power taken entrywise on the
diagonal (`MLPSpec.scaleHidden`, `MLPSpec.realizeWeights_scaleHidden`). Other weights are
unchanged. They satisfy inverse and composition laws (`MLPSpec.permuteHidden_inv_permuteHidden`,
`MLPSpec.permuteHidden_permuteHidden`, `MLPSpec.scaleHidden_inv_scaleHidden`,
`MLPSpec.scaleHidden_scaleHidden`) and generate the equivalence relation
`MLPSpec.hiddenSymmetrySetoid` on the weights, characterised by `MLPSpec.hiddenSymmetrySetoid_le_iff`,
whose classes lie in realisation fibres (`MLPSpec.hiddenSymmetrySetoid_le_parameterSetoid`). No
converse is asserted.

Identifiability at a parameter modulo an equivalence relation `s` on the parameters,
`IdentifiableAt f s w`, requires the realisation fibre of `w` to be its `s`-class. When `s` refines
parameter equivalence, it holds exactly when the induced map `quotientParametrization` from
`W/s` to the neuromanifold is injective at the class of `w`
(`identifiableAt_iff_quotientParametrization`), and it holds at every parameter exactly when that
map is injective (`forall_identifiableAt_iff_injective`). This is a definition and comparison API;
no generic identifiability and no degree bound is asserted.

**Checks.**

- Widths `(1, 1, 1)`, `r = 2`: scaling by `c ≠ 0` sends `(W_1, W_2)` to `(c W_1, c⁻² W_2)` and
  `c⁻² W_2 (c W_1 x)² = W_2 W_1² x²`. Compensating by `c⁻¹` instead would multiply the output by
  `c`.
- Over `ℝ`, same widths and `r = 2`: at `(1, 1)` the fibre is `{(a, a⁻²) | a ≠ 0}`, which is the
  symmetry class, so the network is identifiable there. At `(0, 1)` the fibre of the zero function
  is `{W_1 = 0} ∪ {W_2 = 0}`, while the class is `{(0, t) | t > 0}`: identifiability fails, which
  is why no converse is asserted.

### Examples

For the bias-free monomial MLP with widths `(2, 1, 1)` and `r = 2`, the output is
`v (u_1 x_1 + u_2 x_2)²`, homogeneous of degree `2` in `x`; its coefficients in the basis
`(x_1², x_1 x_2, x_2²)` are `(a, b, c) = (v u_1², 2 v u_1 u_2, v u_2²)`. Over `ℝ` or `ℂ` the
coefficient image is the set of binary quadratic forms of rank at most one, the quadric
`b² = 4ac`: a point of the quadric with `a ≠ 0` is the image of `v = a`, `u = (1, b / 2a)`, and one
with `a = 0` has `b = 0` and is the image of `v = c`, `u = (0, 1)`.

### Dependencies

Layers 1–2; Mathlib polynomial evaluation, substitution, `MvPolynomial.restrictTotalDegree`,
`MvPolynomial.homogeneousSubmodule`, `MvPolynomial.IsHomogeneous`, finite sums and polynomial
extensionality (`MvPolynomial.funext`); Tau Ceti's jointly polynomial models, coefficient
presentations, change of field and hidden-neuron symmetries named above.

## Layer 4: neurovarieties and algebraic images

Over a field `K`, in a finite coordinate space `K^σ`, for a coefficient map `c : W → K^σ` with
image `S = range c` (Convention 7).

### 4.1 Zariski closure, neurovariety and algebraic image

With `I(S)` the polynomials vanishing on `S` and `Z(I)` the common zeros of an ideal (Mathlib's
`MvPolynomial.vanishingIdeal` and `MvPolynomial.zeroLocus`, related by
`MvPolynomial.zeroLocus_vanishingIdeal_galoisConnection`), the Zariski closure `Z(I(S))` is the
closure operator `MvPolynomial.zariskiClosure K`; hence it is extensive, monotone and idempotent,
it is the smallest zero locus containing `S` (`MvPolynomial.zariskiClosure_le_zeroLocus_iff`),
`I(Z(I(S))) = I(S)` (`MvPolynomial.vanishingIdeal_zariskiClosure`), and the empty and the full set
are closed (`MvPolynomial.zariskiClosure_empty`, `MvPolynomial.zariskiClosure_univ`). These
lemmas are about sets and do not involve models. The neurovariety of `c` is
`neurovariety c = Z(I(range c))`, with membership `mem_neurovariety_iff`. Separately, `c` has an
*algebraic image*, `IsAlgebraicImage c`, when `neurovariety c = range c`, equivalently when
`range c` is the zero locus of some ideal (`isAlgebraicImage_iff_exists_zeroLocus`); the name
expresses the closed-image property and is not needed to define a neurovariety. An empty parameter
space gives the empty neurovariety and a surjective `c` the full space
(`neurovariety_of_isEmpty`, `neurovariety_eq_univ_of_surjective`).

**Checks.**

- The image of `w ↦ (w, w², w³)` is the zero locus of `z_2 − z_1²` and `z_3 − z_1³` (a point with
  these coordinates is the image of `w = z_1`), so it is an algebraic image.
- The image `[0, ∞)` of `w ↦ w²` over `ℝ` is closed in the Euclidean topology, but its Zariski
  closure is `ℝ`: defining the neurovariety by the Euclidean closure would make this image
  algebraic.

### 4.2 The parametrisation into the neurovariety

The corestriction of `c` to its image is surjective (`parametrization_surjective`, `c` being a
model with inputs `σ` and outputs `K`). The map `toNeurovariety c` from parameters to the
neurovariety has image exactly `range c`, as a subset of the neurovariety (`range_toNeurovariety`),
and it is surjective exactly when the image is algebraic (`surjective_toNeurovariety_iff`). No general
surjectivity onto the closure is asserted.

**Checks.**

- For `w ↦ w²` over `ℝ`, the map into the neurovariety `ℝ` misses `−1`; over `ℂ` it is surjective
  and the image is algebraic.

### 4.3 Independence of the presentation

Closure and closedness commute with invertible `K`-linear coordinate changes
(`MvPolynomial.zariskiClosure_image_linearEquiv`, `neurovariety_linearEquiv_comp`,
`isAlgebraicImage_linearEquiv_comp_iff`). Zero-padding to a larger degree bound maps the closure
to the closure in the enlarged space and preserves and reflects closedness
(`neurovariety_extendByZero_comp`, `isAlgebraicImage_extendByZero_comp_iff`), and the extra
coordinates vanish on that closure (`apply_eq_zero_of_mem_neurovariety_extendByZero_comp`).
Together with §3.5, the neurovariety and the closed-image property do not depend on the chosen
basis or degree bound.

**Checks.**

- Under `z ↦ −z` on `ℝ`, the image `[0, ∞)` of `w ↦ w²` becomes `(−∞, 0]`, whose closure is still
  `ℝ`. Padding `ℝ` into `ℝ²` by `z ↦ (z, 0)` sends the closure `ℝ` to `ℝ × {0}`, not to `ℝ²`.

### 4.4 Semialgebraicity over the reals

The coefficient image of every real jointly polynomial model with finitely many parameters and
inputs is semialgebraic (`isSemialgebraic_range_polynomialCoefficientCoordinates`, and the image
of any semialgebraic set of parameters, `isSemialgebraic_image_polynomialCoefficientCoordinates`).
Both are stated over a commutative ring with a linear order whose semialgebraic sets have
semialgebraic projections, `TauCeti.HasSemialgebraicProjections`; for `ℝ` this is the Tarski–Seidenberg
theorem, the instance `TauCeti.instHasSemialgebraicProjectionsReal`, and it enters through the
polynomial coefficient map and `TauCeti.IsSemialgebraic.image_eval`. No finite-dimensional
semialgebraic structure is asserted for the space of all functions realised by an arbitrary ReLU
or transcendental model.

**Checks.**

- The image `[0, ∞) = {z | z ≥ 0}` of `w ↦ w²` is semialgebraic and not algebraic: semialgebraicity
  is the right notion for real images.

### 4.5 Two scalar examples

Over a field `K`, the model `f_w(x) = w x` has the faithful presentation `a ↦ (x ↦ a x)` by its one
coefficient (`scalarEvaluation`, `scalarEvaluation_injective`, `realizedFunctions_mul`); its
coefficient image is `K`, so its image is algebraic and equals its neurovariety
(`neurovariety_const`, `isAlgebraicImage_const`). Over `ℝ`, `g_w(x) = w² x` has coefficient image
`[0, ∞)` (`range_const_sq`, `realizedFunctions_sq_mul`), whose Zariski closure is `ℝ`
(`neurovariety_const_sq`), so its image is not algebraic (`not_isAlgebraicImage_const_sq`). The
closure is computed from the fact that a univariate polynomial vanishing on all nonnegative reals
is zero (`Polynomial.eq_zero_of_infinite_isRoot`). These examples are acceptance targets of this
roadmap, not examples of the sources; they show why polynomiality does not imply a Zariski-closed
image.

**Checks.**

- The image of `w ↦ w²` is algebraic over `ℂ`, where it is all of `ℂ`; the failure is a real
  phenomenon.

### Examples

For the bias-free monomial MLP of Layer 3's example, the coefficient map
`(u_1, u_2, v) ↦ (v u_1², 2 v u_1 u_2, v u_2²)` into `ℝ³` has the whole quadric `b² = 4ac` as image,
because `v` takes both signs. The quadric is a zero locus, so it is the neurovariety and the image
is algebraic. Fixing `v = 1` instead gives the image `{b² = 4ac, a ≥ 0, c ≥ 0}`, which is not
algebraic and has the same neurovariety, as for `x ↦ w² x` in §4.5.

### Dependencies

Layers 1 and 3; Mathlib zero loci and vanishing ideals, univariate root finiteness and real
square roots; Tau Ceti's Zariski closure, neurovariety
and semialgebraic sets with the projection theorem for `ℝ`. The closure lemmas do not involve
models, and only §4.4 uses the semialgebraic supplier.

## Scope and ownership

**This roadmap owns** the model API for supplied realisation maps (the neuromanifold, the
parametrisation, fibres and parameter equivalence, and their functoriality, Layer 1), the
constructors of realisation maps (composition, finite chains, dense, activation and convolution
layers, MLPs and convolutional chains, Layer 2), the comparison of coefficients with functions for
jointly polynomial models with its independence of choices, homogeneity and hidden-neuron
symmetries of monomial MLPs and change of field (Layer 3), and neurovarieties, algebraic images,
semialgebraicity of real coefficient images and the scalar examples (Layer 4).

**Already in the library.** Much of the roadmap is proved at the Tau Ceti pin, in
`TauCeti/Geometry/Neuromanifold/` and `TauCeti/RingTheory/MvPolynomial/`; the layers above use
those declarations by name and plan them no further. The targets left to build are: in §1.1, the
nonemptiness of fibres over the neuromanifold; all of §1.3 and §1.4 (reparametrisation,
restriction, post- and precomposition and the degenerate parameter spaces); in §2.1, the one-step
composition formula; in §2.2, finite chains of models and the agreement of MLP and convolutional
realisations with their chains; §3.6, homogeneity of bias-free monomial MLPs and its consequences;
in §3.7, transport of MLP and convolutional specifications along ring homomorphisms. Every other
statement of the layers is a Tau Ceti declaration, named where it is used and listed in the
supplier contracts below; by section, the main ones and their modules are these (names in
`TauCeti.Neuromanifold` unless qualified, paths under `TauCeti/`).

| Section | Tau Ceti declarations at the pin |
|---|---|
| §1.1 | `realizedFunctions`, `parametrization`, `fiber`, `parameterSetoid`, `mem_realizedFunctions`, `parametrization_surjective`, `parametrization_coe`, `disjoint_fiber`, `fiber_eq_class` (`Geometry/Neuromanifold/Basic.lean`) |
| §1.2 | `quotientEquiv`, `quotientEquiv_mk`, `existsUnique_factor_iff` (`Geometry/Neuromanifold/Basic.lean`) |
| §1.3, §1.4 | `fiberEquiv`, `parameterSetoid_comp_iff`, `fiber_eq_univ` (`Geometry/Neuromanifold/Basic.lean`) |
| §2.1 | `MLPSpec`, `MLPSpec.zeroBias`, `MLPSpec.evalPrefix`, `MLPSpec.realize`, `MLPSpec.realizeWeights`, `MLPSpec.linear`, `MLPSpec.polynomial`, `MLPSpec.monomial` and their equations (`Geometry/Neuromanifold/MLP/Basic.lean`); `MLPSpec.append`, `MLPSpec.splitParameters`, `MLPSpec.realize_splitParameters_symm` (`Geometry/Neuromanifold/MLP/Append.lean`) |
| §2.2 | `compose`, `compose_assoc`, `realizedFunctions_compose`, `const_id_compose` (`Geometry/Neuromanifold/Composition.lean`); `dense`, `compose_mulVec_mulVec`, `realizedFunctions_compose_mulVec_mulVec` (`Geometry/Neuromanifold/Dense.lean`); `activation`, `powerActivation`, `reluActivation`, `tanhActivation` (`Geometry/Neuromanifold/Activation.lean`); `convolutionIndex`, `convolution`, `convolutionMatrix`, `affineConvolution` (`Geometry/Neuromanifold/Convolution/Basic.lean`); `ConvolutionSpec` (`Geometry/Neuromanifold/Convolution/Chain.lean`) |
| §3.1 | `polynomialRealization` (`Geometry/Neuromanifold/Polynomial/Basic.lean`); the constructors of `Geometry/Neuromanifold/Polynomial/Constructors.lean`; `MLPSpec.parameterEquiv` (`Geometry/Neuromanifold/MLP/Parameters.lean`); `MLPSpec.polynomialRealize`, `MLPSpec.polynomialRealizeWeights` (`Geometry/Neuromanifold/MLP/Polynomial.lean`); `ConvolutionSpec.polynomialRealize` (`Geometry/Neuromanifold/Convolution/Polynomial.lean`) |
| §3.2, §3.3 | `inputPolynomial`, `polynomialInputDegree`, `polynomialCoefficientMap`, `polynomialCoefficientCoordinates` (`Geometry/Neuromanifold/Polynomial/Basic.lean`); `polynomialFromCoefficients`, `exists_polynomialRealization_of_coefficients` (`Geometry/Neuromanifold/Polynomial/FromCoefficients.lean`); `MvPolynomial.boundedCoefficientEquiv`, `MvPolynomial.tupleEvaluation`, `MvPolynomial.tupleEvaluation_injective` (`RingTheory/MvPolynomial/RestrictTotalDegree.lean`) |
| §3.4 | `realizedFunctions_polynomialRealization`, `polynomialCoefficientMap_eq_iff` (`Geometry/Neuromanifold/Polynomial/Presentation.lean`); `rangeEquivRealizedFunctions` and the faithful-presentation API (`Geometry/Neuromanifold/Basic.lean`) |
| §3.5 | `MvPolynomial.boundedCoefficientPadding` (`RingTheory/MvPolynomial/DegreePadding.lean`); `polynomialCoefficientTransform` (`Geometry/Neuromanifold/Polynomial/Coordinates.lean`) |
| §3.6 | the generic homogeneous presentation `polynomialHomogeneousCoefficientMap` (`Geometry/Neuromanifold/Polynomial/Homogeneous.lean`) |
| §3.7 | `polynomialRealization_map`, `polynomialRealization_map_ofReal` and the transport of the layer constructors (`Geometry/Neuromanifold/Polynomial/Map.lean`) |
| §3.8 | `MLPSpec.permuteHidden`, `MLPSpec.scaleHidden`, `MLPSpec.hiddenSymmetrySetoid`, `MLPSpec.hiddenSymmetrySetoid_le_parameterSetoid` (`Geometry/Neuromanifold/MLP/Symmetry.lean`); `IdentifiableAt`, `identifiableAt_iff_quotientParametrization` (`Geometry/Neuromanifold/Basic.lean`) |
| §4.1–§4.3 | `MvPolynomial.zariskiClosure` (`RingTheory/MvPolynomial/ZariskiClosure.lean`); `neurovariety`, `IsAlgebraicImage`, `toNeurovariety`, `neurovariety_linearEquiv_comp`, `neurovariety_extendByZero_comp` (`Geometry/Neuromanifold/Neurovariety.lean`) |
| §4.4 | `isSemialgebraic_range_polynomialCoefficientCoordinates` (`Geometry/Neuromanifold/Polynomial/Semialgebraic.lean`) |
| §4.5 | `scalarEvaluation`, `neurovariety_const`, `range_const_sq`, `neurovariety_const_sq`, `not_isAlgebraicImage_const_sq` (`Geometry/Neuromanifold/Scalar.lean`) |

Targets of this roadmap belong beside these modules: model-specific material under
`TauCeti/Geometry/Neuromanifold/`, reusable affine algebraic lemmas under
`TauCeti/RingTheory/MvPolynomial/` or `TauCeti/Geometry/RealAlgebraic/`.

**Supplied by another area.** Semialgebraic sets, the image theorem for polynomial maps under
projection closure, and the projection theorem over `ℝ` (Tarski–Seidenberg, by cylindrical
algebraic decomposition) are Tau Ceti's real algebraic geometry, the material of the completed
[RealAlgebraicGeometry](../../Completed/RealAlgebraicGeometry/README.md) roadmap (its Layer 6).
§4.4 consumes them and does not redevelop cylindrical algebraic decomposition or quantifier
elimination. Differential manifold theory is not a prerequisite.

**Outside this roadmap.** Generic identifiability, activation-degree thresholds, dimension,
degree, singularities, optimisation, learning bounds, tropical geometry and approximation are not
part of it; nor are schemes or the comparison of real and complex dimensions. In particular
Finkel–Rodriguez–Wu–Yahl, Theorem 18, and its generic-fibre argument motivate the boundary between
these foundations and generic-fibre classification; they need polynomial independence and
genericity results that this roadmap does not build.

## Exact supplier contracts

### From Mathlib

- `Set.range`, `Set.image`, `Set.preimage`, `Setoid.ker`, `Quotient`, `Function.FactorsThrough`,
  with `Set.preimage_singleton_nonempty`, `Set.range_comp_subset_range`,
  `Function.Surjective.range_comp`, `Set.range_comp`, `Set.preimage_comp`, `Set.range_domRestrict`,
  `Set.range_eq_empty`, `Set.range_unique`, `Function.Injective.comp_left` and
  `Function.Surjective.injective_comp_right`: the elementary image, preimage and kernel facts used
  in Layer 1.
- `Matrix`, `Matrix.mulVec`, `LinearMap`, `Equiv.prodAssoc`, `Fin.snocEquiv`, `Fin.consEquiv`,
  `Fintype.equivFin`, `Fin.prod_const`, `Real.tanh`.
- `MvPolynomial`, `MvPolynomial.eval`, `MvPolynomial.map`, `Polynomial.aeval`, `Polynomial.map`,
  and polynomial extensionality `MvPolynomial.funext` (over an infinite integral domain, polynomials
  are equal when they agree at every point; `Mathlib/Algebra/MvPolynomial/Funext.lean`).
- `MvPolynomial.restrictTotalDegree`, the submodule of polynomials of total degree at most `d`,
  with its membership characterisation `MvPolynomial.mem_restrictTotalDegree` and its
  `Module.Finite` instance for finitely many variables
  (`Mathlib/RingTheory/MvPolynomial/Basic.lean`); `Finsupp.finite_of_degree_le`, finiteness of the
  multi-indices of bounded degree in finitely many variables.
- `MvPolynomial.IsHomogeneous` with `IsHomogeneous.add`, `IsHomogeneous.mul`, `IsHomogeneous.pow`,
  and `MvPolynomial.homogeneousSubmodule`.
- `MvPolynomial.zeroLocus`, `MvPolynomial.vanishingIdeal` and
  `MvPolynomial.zeroLocus_vanishingIdeal_galoisConnection` (`Mathlib/RingTheory/Nullstellensatz.lean`),
  used over any field, with no algebraic closedness: the radical-ideal conclusion of the
  Nullstellensatz is not applied over `ℝ`.
- `Polynomial.eq_zero_of_infinite_isRoot`: a polynomial over an integral domain with infinitely
  many roots is zero; `Real.sqrt`, the real square root.
- `Complex.ofRealHom`, the embedding `ℝ → ℂ`.

### From Tau Ceti

Paths are under `TauCeti/`; names without a namespace are in `TauCeti.Neuromanifold`. All the
declarations below are proved at the pin.

- *Models* (`Geometry/Neuromanifold/Basic.lean`): `realizedFunctions f = Set.range f` with
  `mem_realizedFunctions`; `parametrization f`, the corestriction, with `parametrization_coe` and
  `parametrization_surjective`; `fiber f g = f ⁻¹' {g}` with `disjoint_fiber`; `parameterSetoid f =
  Setoid.ker f` with `fiber_eq_class` and `parameterSetoid_comp_iff`; `quotientEquiv f :
  Quotient (parameterSetoid f) ≃ realizedFunctions f` with `quotientEquiv_mk`;
  `existsUnique_factor_iff` (unique factorisation through the parametrisation iff
  `Function.FactorsThrough`); `fiberEquiv f e g` for an equivalence `e` of parameter types;
  `fiber_eq_univ` for a subsingleton parameter type; `IdentifiableAt f s w` (the fibre of `w` is
  its `s`-class), `quotientParametrization`, `identifiableAt_iff_quotientParametrization` and
  `forall_identifiableAt_iff_injective` (for `s` refining parameter equivalence); for an injective
  `E` with `E ∘ c = f`, `realizedFunctions_eq_image_range`, `apply_eq_apply_iff_of_injective`,
  `parameterSetoid_eq_ker`, `fiber_apply_eq_preimage` and `rangeEquivRealizedFunctions`.
- *Composition* (`Geometry/Neuromanifold/Composition.lean`): `compose f g (w, v) = g v ∘ f w` with
  `compose_apply_apply`, `realizedFunctions_compose`, `compose_assoc` (under `Equiv.prodAssoc`),
  `realizedFunctions_compose_assoc`, and the units `const_id_compose`, `compose_const_id` for the
  identity model on a one-point parameter type.
- *Layers*: `dense` with `dense_apply`, `dense_apply_apply`, `dense_mk_zero`,
  `compose_mulVec_mulVec` and `realizedFunctions_compose_mulVec_mulVec`, over a not necessarily
  unital or associative semiring
  (`Geometry/Neuromanifold/Dense.lean`); `activation σ`, with a one-point parameter type,
  `activation_apply`, `activation_id`, `activation_reindex`, and `powerActivation`,
  `reluActivation`, `tanhActivation` (`Geometry/Neuromanifold/Activation.lean`);
  `convolutionIndex` (for `h : n = s * (m - 1) + k`, value `s * i + j` in `Fin n`), `convolution`,
  `convolutionMatrix`, `convolutionMatrix_mulVec`, `affineConvolution` and
  `affineConvolution_zero_bias` (`Geometry/Neuromanifold/Convolution/Basic.lean`).
- *MLPs* (`Geometry/Neuromanifold/MLP/Basic.lean`, `MLP/Append.lean`, `MLP/Parameters.lean`):
  `MLPSpec K L` (widths `Fin (L + 1) → ℕ`, hidden activations `Fin (L - 1) → K → K`, `@[ext]`),
  `MLPSpec.Weights`, `MLPSpec.Parameters`, `MLPSpec.zeroBias` with `MLPSpec.zeroBias_injective`,
  `MLPSpec.evalPrefix` with `MLPSpec.evalPrefix_zero`, `MLPSpec.evalPrefix_succ` and
  `MLPSpec.evalPrefix_congr`, `MLPSpec.realize` with `MLPSpec.realize_depth_zero`,
  `MLPSpec.realize_depth_one` and `MLPSpec.realize_succ`, `MLPSpec.realizeWeights` with
  `MLPSpec.realizeWeights_succ`; `MLPSpec.linear`, `MLPSpec.polynomial`, `MLPSpec.monomial` and
  `MLPSpec.monomial_evalPrefix_zeroBias_castSucc_succ`; `MLPSpec.append`, `MLPSpec.lowerLayers`,
  `MLPSpec.upperLayers`, `MLPSpec.junctionActivation`, `MLPSpec.splitParameters`,
  `MLPSpec.splitWeights`, `MLPSpec.realize_splitParameters_symm`,
  `MLPSpec.realizeWeights_splitWeights_symm`, `MLPSpec.realizedFunctions_realize`,
  `MLPSpec.lowerLayers_append`, `MLPSpec.upperLayers_append`,
  `MLPSpec.append_lowerLayers_upperLayers`; `MLPSpec.ParameterIndex`, `MLPSpec.WeightIndex`,
  `MLPSpec.parameterEquiv`, `MLPSpec.weightEquiv`, `MLPSpec.card_parameterIndex`.
- *Convolutional chains* (`Geometry/Neuromanifold/Convolution/Chain.lean`): `ConvolutionSpec K L`
  (an `MLPSpec` with filter lengths, strides and the length equation),
  `ConvolutionSpec.realize`, `ConvolutionSpec.realize_eq_mlp`, `ConvolutionSpec.evalPrefix_succ`,
  `ConvolutionSpec.realize_succ`, `ConvolutionSpec.parameterEquiv`.
- *Jointly polynomial models* (`Geometry/Neuromanifold/Polynomial/`): `polynomialRealization`,
  `inputPolynomial`, `polynomialInputDegree`, `polynomialRealization_eq_sum`,
  `polynomialCoefficientMap`, `tupleEvaluation_comp_polynomialCoefficientMap`,
  `polynomialCoefficientCoordinates` (`Basic.lean`, over a commutative semiring); the constructors
  `polynomialReparametrize`, `polynomialCompose`, `polynomialLinear`, `polynomialDense`,
  `polynomialActivation`, `polynomialConvolution`, `polynomialAffineConvolution` with their
  realisation equations (`Constructors.lean`); `realizedFunctions_polynomialRealization`, and, over
  an infinite integral domain, `polynomialCoefficientMap_eq_iff` and
  `fiber_polynomialRealization_tupleEvaluation` (`Presentation.lean`); `polynomialFromCoefficients`,
  `exists_polynomialRealization_of_coefficients`,
  `polynomialCoefficientMap_polynomialFromCoefficients_coe` (`FromCoefficients.lean`);
  `tupleEvaluation_padding_polynomialCoefficientCoordinates` (`Basic.lean`) and
  `polynomialCoefficientTransform` with `tupleEvaluation_comp_polynomialCoefficientTransform`
  (`Coordinates.lean`); `polynomialHomogeneousCoefficientMap` (assuming each
  `inputPolynomial P j` homogeneous of degree `d`), `inclusion_comp_polynomialHomogeneousCoefficientMap`,
  `realizedFunctions_polynomialRealization_of_isHomogeneous`,
  `polynomialInputDegree_le_of_isHomogeneous` and the homogeneity lemmas
  `isHomogeneous_inputPolynomial_polynomialLinear`,
  `isHomogeneous_inputPolynomial_polynomialActivation_X_pow`,
  `isHomogeneous_inputPolynomial_polynomialCompose` (`Homogeneous.lean`);
  `polynomialRealization_map`, `inputPolynomial_map`, `polynomialInputDegree_map`,
  `polynomialRealization_map_eq_iff`, `preimage_fiber_polynomialRealization_map`,
  `polynomialRealization_map_ofReal`, `polynomialRealization_map_ofReal_eq_iff` and the transport
  lemmas `map_polynomialReparametrize`, `map_polynomialCompose`, `map_polynomialLinear`,
  `map_polynomialDense`, `map_polynomialActivation`, `map_polynomialConvolution`,
  `map_polynomialAffineConvolution` (`Map.lean`).
- *Chains as polynomial models*: `MLPSpec.polynomialPrefix` with `MLPSpec.polynomialPrefix_succ`,
  `MLPSpec.polynomialRealize`, `MLPSpec.polynomialRealizeWeights` with
  `MLPSpec.polynomialRealizeWeights_def`, `MLPSpec.polynomialRealization_polynomialRealize`,
  `MLPSpec.polynomialRealization_polynomialRealizeWeights`,
  `MLPSpec.realizedFunctions_polynomialRealizeWeights`,
  `MLPSpec.polynomialRealization_polynomialRealize_linear` (`MLP/Polynomial.lean`, assuming each
  hidden activation is the evaluation of the given polynomial); `ConvolutionSpec.polynomialRealize`,
  `ConvolutionSpec.polynomialRealization_polynomialRealize`,
  `ConvolutionSpec.polynomialRealization_polynomialRealizeWeights` (`Convolution/Polynomial.lean`).
- *Symmetries* (`Geometry/Neuromanifold/MLP/Symmetry.lean`): `MLPSpec.permuteHidden`,
  `MLPSpec.scaleHidden` with their inverse and composition laws, `MLPSpec.realizeWeights_permuteHidden`
  (any activation), `MLPSpec.realizeWeights_scaleHidden` (the activation of the scaled layer is
  `t ↦ t ^ e`), `MLPSpec.hiddenSymmetrySetoid`, `MLPSpec.hiddenSymmetrySetoid_le_iff`,
  `MLPSpec.hiddenSymmetrySetoid_le_parameterSetoid`.
- *Bounded-degree coordinates* (`RingTheory/MvPolynomial/RestrictTotalDegree.lean`,
  `RingTheory/MvPolynomial/DegreePadding.lean`), in `MvPolynomial`: `boundedCoefficientEquiv`
  (finitely many variables), `tupleEvaluation` (linear) with `tupleEvaluation_injective` (an
  infinite integral domain), `basisRestrictTotalDegree`, `restrictTotalDegree_mono`,
  `homogeneousSubmodule_le_restrictTotalDegree`, `boundedCoefficientPadding` with
  `boundedCoefficientPadding_injective` and `tupleEvaluation_padding`.
- *Zariski closure* (`RingTheory/MvPolynomial/ZariskiClosure.lean`), in `MvPolynomial`:
  `zariskiClosure k`, a `ClosureOperator` on sets of points with `zariskiClosure_apply`
  (`zeroLocus (vanishingIdeal S)`), `mem_zariskiClosure_iff`, `zariskiClosure_isClosed_iff`,
  `zariskiClosure_le_zeroLocus_iff`, `vanishingIdeal_zariskiClosure`, `zariskiClosure_empty`,
  `zariskiClosure_univ`, `zariskiClosure_image_linearEquiv` (finitely many coordinates) and
  `zariskiClosure_image_extendByZero` (injective index map).
- *Neurovarieties* (`Geometry/Neuromanifold/Neurovariety.lean`, over a field): `neurovariety`,
  `mem_neurovariety_iff`, `vanishingIdeal_neurovariety`, `neurovariety_subset_zeroLocus_iff`,
  `IsAlgebraicImage` with `isAlgebraicImage_iff`, `isAlgebraicImage_iff_isClosed` and
  `isAlgebraicImage_iff_exists_zeroLocus`, `neurovariety_of_isEmpty`,
  `neurovariety_eq_univ_of_surjective`, `toNeurovariety` with `range_toNeurovariety` and
  `surjective_toNeurovariety_iff`, `neurovariety_linearEquiv_comp`,
  `isAlgebraicImage_linearEquiv_comp_iff`, `neurovariety_extendByZero_comp`,
  `isAlgebraicImage_extendByZero_comp_iff`, `apply_eq_zero_of_mem_neurovariety_extendByZero_comp`.
- *Scalar examples* (`Geometry/Neuromanifold/Scalar.lean`): `scalarEvaluation`,
  `scalarEvaluation_injective`, `realizedFunctions_mul`, `neurovariety_const`,
  `isAlgebraicImage_const`, `range_const_sq`, `realizedFunctions_sq_mul`, `neurovariety_const_sq`,
  `not_isAlgebraicImage_const_sq`.
- *Semialgebraic sets* (`Geometry/RealAlgebraic/Semialgebraic/`, `Geometry/RealAlgebraic/CAD/Existence.lean`):
  `TauCeti.IsSemialgebraic`, `TauCeti.IsSemialgebraicMap`, `TauCeti.HasSemialgebraicProjections`,
  `TauCeti.IsSemialgebraic.image_eval` (the image of a semialgebraic set under a polynomial map
  with finitely many coordinates, assuming projection closure), the instance
  `TauCeti.instHasSemialgebraicProjectionsReal` (Tarski–Seidenberg over `ℝ`), and
  `isSemialgebraic_image_polynomialCoefficientCoordinates`,
  `isSemialgebraic_range_polynomialCoefficientCoordinates`
  (`Geometry/Neuromanifold/Polynomial/Semialgebraic.lean`, finitely many parameters and inputs).

## References

- Giovanni Luca Marchetti, Vahid Shahverdi, Stefano Mereta, Matthew Trager and Kathlén Kohn,
  *Algebra Unveils Deep Learning — An Invitation to Neuroalgebraic Geometry*,
  [arXiv:2501.18915v2](https://arxiv.org/html/2501.18915v2). Definition 3.1 supplies the
  neuromanifold (used in §1.1 here); §3, equation (2), layer composition (§2.2 here); §3.1, the
  jointly polynomial setting and the finite ambient space (Layer 3 here); §4.3, fibres (§1.1
  here). Appendix A motivates the two-layer linear example, without importing its dimension or
  optimisation claims.
- Vahid Shahverdi, *Algebraic Complexity and Neurovariety of Linear Convolutional Networks*,
  [arXiv:2401.16613v1](https://arxiv.org/html/2401.16613v1), §§2.1–2.2: a supplementary source for
  the convolution convention (its §2.1, equations (2.1)–(2.2), used in §2.2 here); its closed-image
  use of "neurovariety" (its §2.2) differs from the closure convention adopted here.
- Bella Finkel, Jose Israel Rodriguez, Chenxi Wu and Thomas Yahl, *Activation degree thresholds and
  expressiveness of polynomial neural networks*,
  [arXiv:2408.04569v4](https://arxiv.org/html/2408.04569v4). Definition 1, Remark 2, equations
  (3)–(6) and Lemma 4 supply the monomial specialisation (Definition 1; §2.1 here), the closure
  convention (its §1.1, equations (3)–(4); Convention 7 and §4.1 here) and the elementary
  symmetries (Lemma 4 and equation (6); §3.8 here). Theorem 18 motivates the boundary between
  these foundations and generic-fibre classification.
