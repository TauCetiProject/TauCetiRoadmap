# Roadmap: compressible Euler equations, Part II: acoustical geometry and characteristic data

**Summary.** The sound cones of a classical solution of the compressible Euler equations
(barotropic or full, on `ℝ_t × ℝⁿ`, `n ≥ 1`, without vacuum) are the null cones of a Lorentzian
metric, the acoustical metric, which depends on the solution. This roadmap builds the geometry of
that metric for a given solution, and the theory of initial data prescribed partly on a
characteristic hypersurface. Its main objects are the acoustical (eikonal) functions of a solution,
`C¹` functions whose differential is future null, so that their level sets are sound fronts; the
frame, the inverse density `μ`, the function `κ = 1/|∇u|` and the acoustical coordinates attached to
one; the characteristic boundary of the development of data on an open set; characteristic data,
which prescribe the solution on an open part `S₀` of the initial slice and on a hypersurface `C`
issuing from its edge that is null for the metric of the data; and centered rarefaction waves.

The headline theorems are these. An outgoing acoustical function with prescribed initial values
`u₀`, `∇u₀ ≠ 0`, exists and is unique, of the regularity of the solution, as long as its null
generators do not cross, and `κ` satisfies a transport equation along the generators. For a `C¹`
solution on a time slab with bounded sound speed and velocity and an open set `S` of the initial
slice equal to the interior of its closure, the boundary of the domain of dependence of `S`
strictly between the initial time and the top of the slab coincides there with a Cauchy horizon of
the acoustical metric, and each of its points lies on a null geodesic contained in the boundary
and issuing from the edge of `S`; when the outgoing acoustical function of a defining function of
`S` has no caustic on the slab, the domain of dependence is `{u < 0}` and its characteristic
boundary below the top of the slab is `{u = 0}`. Two developments of the same characteristic
data agree on a largest common development, and every development lies below a maximal one.
Smooth characteristic data compatible to all orders at the edge, with compact edge modulo the
period group, have a smooth development for a short time, and the same holds for data on two
intersecting null hypersurfaces (the Goursat problem). The plane-symmetric centered rarefaction
wave of a polytropic gas is a family of centered rarefaction waves in the sense of Luo–Yu.

The roadmap builds on CompressibleEulerEquations, which supplies the equations of state and both
Euler systems, the sound-cone causal curves and domains of dependence in subsets of a half-space,
uniqueness on lens-shaped domains and on domains of dependence, local well-posedness in `Hᵏ`, and
the developments of data on open subsets of a slice with the nullity of their regular boundary. It
builds on LorentzianGeometry, which supplies the acoustical form on a product spacetime, the
geodesic flow, null hypersurfaces and optical functions, and domains of dependence and Cauchy
horizons of `C¹` metrics on open sets. It feeds the theory of multi-dimensional rarefaction waves
(Luo–Yu) and of shock formation and shock development (Christodoulou, Christodoulou–Miao), whose
main theorems are stated on the domains, foliations and developments built here.

Layer 1 is the acoustical geometry of a given classical solution: its extension below the initial
slice, outgoing acoustical functions, their frame and coordinates, and the propagation equation for
`κ`. Layer 2 is the characteristic boundary of the development of data on an open set: its
comparison with horizons, its ruling by null geodesics, and its eikonal description. Layer 3 is the
theory of characteristic data: inner equations, data sets and compatibility, developments and their
uniqueness, local existence near the edge, and the Goursat problem. Layer 4 defines centered
rarefaction waves and constructs the plane-symmetric model.

## Conventions

All conventions of CompressibleEulerEquations are in force: `E = EuclideanSpace ℝ (Fin n)`,
`n ≥ 1`, `𝔐 = ℝ × E`, `Σ_t = {t} × E`, `H_{t₀} = [t₀, ∞) × E`, period groups `Λ` and the
cylinder `Λ_cyl = {0} × (2πℤ)^{n−1}`, domains (relatively open subsets of `H_{t₀}`), states,
`B = ∂_t + v·∇`, `c = √(∂_ρP)`, the signature `(−, +, …, +)`, future meaning increasing `t`, and the
acoustical form `g = g_{c,v}` with inverse `g⁻¹ = −c⁻²B ⊗ B + Σᵢ ∂ᵢ ⊗ ∂ᵢ`.

**Acoustical functions.** An *acoustical function* (`IsAcousticalFunction`) on a set `W ⊆ 𝔐` for a
sound-cone field `(c, v)` is a `C¹` function u with `du ≠ 0`, `g⁻¹(du, du) = 0` and `du` future causal, that is
`∂_t u + v·∇u = c|∇u|`. Then u is nondecreasing along future causal curves, `L̂ = −g⁻¹(du)` is
future null, and (with `∇u ≠ 0`, which nullity forces)
`T̂ = ∇u/|∇u|`, `κ = 1/|∇u|`, `T = κT̂` (so `Tu = 1`), `L = B − cT̂` (so `Lt = 1` and `Lu = 0`),
`μ = −1/g⁻¹(dt, du) = cκ`, and `L = μL̂`. These are the conventions of Christodoulou–Miao, §2.1, and
Luo–Yu 2025a, §2.1: `u` increases away from the data whose domain of dependence `{u < 0}` bounds,
and `L` is the generator of the level sets normalized by `Lt = 1`. `S_{t,u} = Σ_t ∩ {u = const}`.

Witness, `n = 1`, constant state `c = 1`, `v = 0`: `u = t − x` has `∂_tu + v∂_xu = 1 = c|∂_xu|`,
`T̂ = −∂_x`, `L = ∂_t + ∂_x`, `κ = μ = 1`, and the half-space data `{x > 0} = {u(0, ·) < 0}`
have domain of dependence `{x > t} = {u < 0}`. The function `x − t` satisfies the eikonal equation
but has `∂_tu + v∂_xu = −1 < 0`: its differential is past null, and it is not an acoustical
function.

**Wedges.** For an open `W ⊆ 𝔐` and a `C¹` function `φ` on W, the *wedge*
`K_φ = H_{t₀} ∖ {p ∈ W : φ(p) < 0}` is the part of the half-space not strictly behind the
hypersurface `{φ = 0}`. A *wedge domain* is a relatively open subset of `K_φ`.

## Layer 1: the acoustical geometry of a solution

### 1.1 The acoustical field below the initial slice

Let U be a classical solution, of either Euler system, of class `C^k`, `k ≥ 1`, on a domain
`D ⊆ H_{t₀}`, with acoustical field `(c, v)`. For `k ≥ 0` let `a_1, …, a_{k+1}` be the solution of
`Σᵢ aᵢ(−1/i)^j = 1` for `0 ≤ j ≤ k` (a Vandermonde system), and define, for a function f on D,
the reflection `f̃(t₀ − s, x) = Σᵢ aᵢ f(t₀ + s/i, x)` for small `s > 0`. Prove that `f̃` extends f to
a `C^k` function on an open set of `𝔐` containing D, and that the set
`D̃ = D ∪ {(t₀ − s, x) : s > 0, (t₀ + s/i, x) ∈ D for all i, c̃(t₀ − s, x) > 0}` contains an open
set `D̂ ⊆ 𝔐` with `D̂ ∩ H_{t₀} = D` (for `(t₀, x) ∈ D` use that D is relatively open in `H_{t₀}`
and `c(t₀, x) > 0`). On `D̂` the reflected field `(c̃, ṽ)` defines, by LorentzianGeometry §7.3, a
`C^k` Lorentzian metric, time-oriented by `[B̃]` for `B̃ = ∂_t + ṽ` (LorentzianGeometry §8.1), with
`t` a `C^∞` temporal function (`g̃⁻¹(dt, dt) = −c̃⁻² < 0`).

- For `p ∈ D`, a past causal curve in `D̂` ending at p is, on the part of its interval where
  `t ≥ t₀`, a past causal curve in D; so `causalPast` in D and the restriction to `{t ≥ t₀}` of the
  causal past in `D̂` coincide.
- The extension depends on the choice of reflection only below `t₀`, where no statement of this
  roadmap looks.

**Checks.**

- `k = 0`: `a₁ = 1` and `f̃(t₀ − s) = f(t₀ + s)`, the even reflection; `k = 1`: `a₁ + a₂ = 1`,
  `−a₁ − a₂/2 = 1`, so `(a₁, a₂) = (−3, 4)` and `f̃(t₀ − s) = −3f(t₀ + s) + 4f(t₀ + s/2)`, whose
  one-sided `t`-derivative at `t₀` is `3f′ − 2f′ = f′`.
- The even reflection of `f(t) = t` is `|t|`, not `C¹`: `k = 0` gives only continuity, as stated.
- The constant state is its own reflection (`Σ aᵢ = 1`).

*Needs:* CompressibleEulerEquations §§1.2–1.3, §3.2; LorentzianGeometry §7.3, §8.1, §12.6.

### 1.2 Outgoing acoustical functions

Let `(c, v)` be the acoustical field of a classical solution of class `C^k`, `k ≥ 2`, on a domain
D, extended to `D̂` by §1.1, let `S′ ⊆ E` be open with `{t₀} × S′ ⊆ D`, and `u₀ ∈ C^k(S′)` with
`∇u₀ ≠ 0`. At `(t₀, y)`, `y ∈ S′`, put `ζ(y) = (c|∇u₀| − v·∇u₀, ∇u₀)`, the unique future null
covector whose spatial part is `∇u₀(y)`, and let `γ_y` be the null geodesic of `g` with initial
point `(t₀, y)` and velocity `−g⁻¹(ζ(y))`, reparametrized by `t` (LorentzianGeometry §§3.2–3.3; the
Christoffel field is `C^{k−1}`). Let `Ψ(t, y) = γ_y(t)` on its open domain of definition `Ω`, and
let `Ω′ ⊆ Ω` be a set of the form `{(t, y) : y ∈ S′, t₀ ≤ t < τ(y)}` on which Ψ is injective with
invertible differential. Define u on `W = Ψ(Ω′)` by `u(Ψ(t, y)) = u₀(y)`.

Prove:

- u is an acoustical function of class `C^k` on W, with `du` at `Ψ(t, y)` the covector carried
  along `γ_y` by the geodesic flow from `ζ(y)` (method of characteristics: the Hamiltonian
  `½g⁻¹(ζ, ζ)` is constant along the cotangent geodesic flow and the Lagrangian manifold generated
  from `{t₀} × S′` stays isotropic); the level sets of u are null hypersurfaces whose null
  generators (LorentzianGeometry §§9.2–9.3) are the curves `γ_y`, and `L = ∂_tΨ`.
- *Uniqueness.* If `u′` is a `C²` acoustical function on a connected set `W′ ⊆ W` swept by
  segments of the curves `γ_y` from `t₀`, with `u′(t₀, ·) = u₀`, then `u′ = u` on `W′`: the integral
  curves of `−grad_g u′` are null geodesics (LorentzianGeometry §9.3) through `(t₀, y)` with the
  same initial covector, hence the `γ_y`.
- The identities of the Conventions: `L = B − cT̂`, `g(L, L) = 0`, `g(L, T) = −μ`, `μ = cκ`,
  `g(T, T) = κ²`, `g(B, T) = 0`; and `Ψ(t₀, ·) = id`, so that for every compact `K ⊆ S′` some
  `τ > 0` has `[t₀, t₀ + τ) × K ⊆ Ω′` admissible.
- *Slabs.* If D contains a slab `O₁ = [t₀, t₁) × E`, `S′ = E`, and the maps `Ψ_t = Ψ(t, ·)` are `C^{k−1}`
  diffeomorphisms of E for `t ∈ [t₀, t₁)`, then u is defined on all of `O₁`. If `c`, `v` and their
  first and second derivatives are bounded on `[t₀, t₂] × E` for every `t₂ < t₁`, and the first and
  second derivatives of `u₀` and `1/|∇u₀|` are bounded on E, then this holds for `t₁` replaced by
  some `t₀ + τ`, `τ > 0` (`exists_isAcousticalFunction_slab`). If `c` and `|v|` are bounded on
  `[t₀, t₂] × E` for every `t₂ < t₁`, two `C²` acoustical functions on `O₁` with the same values on
  `Σ_{t₀}` agree there (`IsAcousticalFunction.eqOn_slab`): the integral curves of `L` of the first,
  run back from any point of `O₁`, reach `Σ_{t₀}`, so its generators sweep `O₁` and the uniqueness
  statement applies. Both statements use only that `(c, v)` is a `C²` field with `c > 0` on `O₁`,
  and are proved for such fields.

**Checks.**

- Constant state `(c, v)`, `u₀ = −x¹` (`n ≥ 1`): `u = (v¹ + c)(t − t₀) − x¹`, `T̂ = −∂₁`, `κ = 1`,
  `μ = c`, `L = ∂_t + v + c∂₁`; the level sets are the null hyperplanes of LorentzianGeometry §7.3's
  first Check.
- Expanding flow `ρ = (1 + t)⁻¹`, `v = x/(1 + t)`, `p = ρ²/2` (`c = (1 + t)^{−1/2}`), `n = 1`,
  `t₀ = 0`, `u₀ = x − 1`: `u = x/(1 + t) − 2(1 + t)^{−1/2} + 1`. Then `∂_xu = (1 + t)⁻¹`,
  `∂_tu + v∂_xu = (1 + t)^{−3/2} = c|∂_xu|`, `κ = 1 + t`, `μ = cκ = (1 + t)^{1/2}`, and
  `−g⁻¹(dt, du) = c⁻²(1 + t)^{−3/2} = (1 + t)^{−1/2} = 1/μ`. The level set `u = 0` is
  `x = 2√(1 + t) − (1 + t)`, the boundary curve of CompressibleEulerEquations §3.3's expanding-flow
  Check.
- With `u₀ = −x¹` and the past null covector `(v¹ − c, −e₁)` in place of `ζ`, the curves
  would move with speed `v¹ − c` and the level set `u = 0` would be the other boundary sheet:
  the sign condition in the definition picks the sheet bounding `{u < 0}`.

*Needs:* §1.1; CompressibleEulerEquations §3.1; LorentzianGeometry §§3.2–3.3, §7.3, §§9.2–9.3;
Christodoulou–Miao, §2.1; Christodoulou 2007, Ch. 2 (sources, by locator).

### 1.3 Acoustical coordinates

In the setting of §1.2 with W a slab or a set `Ψ(Ω′)`, let `ϑ₀ = (ϑ₀^A)`, `A = 1, …, n − 1`, be `C^{k−1}`
functions on S′ with `T(ϑ₀) = 0` on `Σ_{t₀}` such that `(u₀, ϑ₀)` is a local coordinate system on
S′ (for `Λ_cyl`-periodic data on the cylinder, `ϑ₀` with values in `(ℝ/2πℤ)^{n−1}`). Extend ϑ to W
by `L(ϑ) = 0`. Prove that `(t, u, ϑ)` are local coordinates on W (the *acoustical coordinates*), in
which `L = ∂_t`, `T = ∂_u − Ξ^A∂_{ϑ^A}` for functions `Ξ^A` vanishing on `Σ_{t₀}`, `X_A = ∂_{ϑ^A}` is
tangent to `S_{t,u}`, and

`g = −μ(dt ⊗ du + du ⊗ dt) + κ² du ⊗ du + g̸_{AB}(dϑ^A + Ξ^A du) ⊗ (dϑ^B + Ξ^B du)`,

with `g̸` the metric induced on `S_{t,u}` (Luo–Yu 2025a, §2.1; Christodoulou–Miao, §2.1). Prove the
general propagation identity

`Lκ = T̂^j·T(v^j) − T(c)`

for any `C²` field `(c, v)` and any `C²` acoustical function on an open set
(`IsAcousticalFunction.transport_kappa`; differentiate `κ = |∇u|⁻¹` along L,
using `Lu = 0` and `[∂ᵢ, L] = ∂ᵢ(v^j − cT̂^j)∂_j`); and, for a classical barotropic solution with the
polytropic law `p = k₀ρ^γ`, `γ > 1` (enthalpy `h = c²/(γ − 1)` and `Bv = −∇h`),
`Lκ = m′ + e′κ` with `m′ = −((γ + 1)/(γ − 1))·Tc` and `e′ = −c⁻¹T̂^i·L(v^i)` (Luo–Yu 2025a, §2.2,
written there with `ψᵢ = −vⁱ` for irrotational flows; irrotationality is not used).

**Checks.**

- In the coordinates, `g(L, L) = g_tt = 0`, `g(L, T) = g_tu = −μ`,
  `g(T, T) = (κ² + g̸ΞΞ) − 2g̸ΞΞ + g̸ΞΞ = κ²` and `g(T, X_A) = g̸_{AB}Ξ^B − Ξ^B g̸_{BA} = 0`.
- Expanding flow of §1.2: `κ = 1 + t`, `Lκ = 1`, and `T̂·T(v) − T(c) = (1 + t)∂_x(x/(1 + t)) − 0 = 1`.
- The two forms of the polytropic identity agree exactly when `T̂^i(∂ᵢh + Bvⁱ) = 0`: with
  `Th = (2c/(γ − 1))Tc` and `L = B − cT̂`, `m′ + e′κ − (T̂·T(v) − Tc) = −(κ/c)T̂^i(∂ᵢh + Bvⁱ)`, the
  momentum equation.

*Needs:* §1.2; CompressibleEulerEquations §1.2; LorentzianGeometry §9.2; Luo–Yu 2025a, §§2.1–2.2;
Christodoulou–Miao, Ch. 3 (sources, by locator).

### Examples

The constant state and the expanding flow with their acoustical functions, frames and `κ`.

### Dependencies

CompressibleEulerEquations §§1.2–1.3, §§3.1–3.2; LorentzianGeometry §§3.2–3.3, §7.3, §§9.2–9.3, §12.6.

## Layer 2: the characteristic boundary of a development

### 2.1 Comparison with horizons

Let U be a classical solution, of either Euler system, on a slab `O = [t₀, t₀ + T) × E` with `c`,
`|v|` bounded on `[t₀, t₂] × E` for every `t₂ < t₀ + T`, `Ô` an open set with `Ô ∩ H_{t₀} = O`
carrying a `C¹` extension `(c̃, ṽ)`, `c̃ > 0`, of the acoustical field (as §1.1 provides), and
`S ⊆ E` open and *regular* (`interior (closure S) = S`). Write `D = D⁺_O({t₀} × S)`, the largest
development in O (CompressibleEulerEquations §8.3), and `Ď = D⁺_Ô({t₀} × closure S)` in the sense
of LorentzianGeometry §12.6 for `(c̃, ṽ)`; by its statement on time functions, `Ď` is the domain of
dependence in `Ô` defined by `t`-parametrized causal curves, which is the form stated. Prove, in
`{t > t₀}`
(`futureDomainOfDependence_inter_eq_interior`):

- `D = interior Ď`, and `D ⊆ Ď ⊆ closure D`; hence `frontier D = frontier Ď` there.
- Route. `D ⊆ Ď`: a past-inextendible curve in `Ô` from a point of D, restricted to `t ≥ t₀`, is
  past-inextendible in O by the slab statement of CompressibleEulerEquations §3.3. `D` is open there
  (§3.3, openness), so `D ⊆ interior Ď`. Conversely let `p ∈ Ď`, `q ∈ I⁻(p)` with `t_q > t₀`, and
  γ a past causal curve in O from q, reaching `(t₀, y)`; the concatenation with a timelike curve
  from p to q gives `y ∈ closure S`. If `y ∈ frontier S = frontier (closure S)` (regularity), then
  `(t₀, y) ∈ I⁻(p)` by push-up (LorentzianGeometry §12.7), `I⁻(p)` is open, and a timelike curve from
  p to `(t₀, y′)` with `y′ ∉ closure S`, extended past-inextendibly below `t₀`, contradicts `p ∈ Ď`.
  So `I⁻(p) ∩ {t > t₀} ⊆ D`, which gives `Ď ⊆ closure D` and `interior Ď ⊆ D`.
- Consequently, by LorentzianGeometry §12.7 applied on `Ô` with the temporal function t, below
  the top of the slab, where the frontier in `𝔐` is the frontier in `Ô`,
  `frontier D ∩ {t₀ < t < t₀ + T} = H⁺_Ô({t₀} × closure S) ∩ {t₀ < t < t₀ + T}`.

**Checks.**

- Regularity is needed: `n = 1`, `c = 1`, `v = 0`, `T > 1`, `S = (−1, 0) ∪ (0, 1)`. Then
  `Ď = {0 ≤ t ≤ 1 − |x|}` for `closure S = [−1, 1]`, while
  `D = {|x| < 1 − t} ∖ {|x| ≤ t}`: the cone over the removed point is missing, and
  `interior Ď ∩ {t > 0} ≠ D`.
- Constant state on `S = B(0, R)`, `c₀T > R`: `D = {|x − v₀(t − t₀)| < R − c₀(t − t₀)}` and `Ď`
  is its closure in `H_{t₀}`; both frontiers in `{t > t₀}` are the null cone
  `|x − v₀(t − t₀)| = R − c₀(t − t₀)`.
- The top of the slab is excluded from the horizon statement: for `S = E`, `D = Ď = O`, whose
  frontier after `t₀` is `{t₀ + T} × E`, while `H⁺_Ô({t₀} × E)` is empty, every point of `O` lying
  in `I⁻_Ô(O)`.

*Needs:* §1.1; CompressibleEulerEquations §3.3, §8.3; LorentzianGeometry §12.6, §12.7.

### 2.2 The characteristic boundary and its null generators

For a development `(D, U)` of data on an open `S` (CompressibleEulerEquations §8.1), define its
*characteristic boundary* `𝒞(D) = frontier D ∩ {t > t₀}`, the frontier taken in `𝔐`
(`characteristicBoundary`; compare Hawking–Ellis, Ch. 6). In the setting of §2.1 prove that every
point of `𝒞(D)` below the top of the slab (`t < t₀ + T`) lies on a curve contained in `𝒞(D)` that,
after an admissible change of parameter (LorentzianGeometry §3.1), is a null geodesic of the
acoustical metric of the reflected field, with past endpoint on `{t₀} × frontier S`, and no two of
whose points are chronologically related. Route: §2.1 and LorentzianGeometry §12.7's generators of
`H⁺_Ô`, which are past-inextendible in `Ô` or end on `edge_Ô(closure S) = {t₀} × frontier S`; the
first alternative is excluded because the generator lies in `closure D ⊆ {t ≥ t₀}` and, the field
being bounded on slabs, would reach `Σ_{t₀}` in finite parameter. Prove that where
`𝒞(D) ∩ {t < t₀ + T}` is a `C¹` hypersurface it is null, in agreement with
CompressibleEulerEquations §8.4's statement on developments inside a slab, and that the generator
through such a point is tangent to it. For `C¹` solutions the generators through a point need not be
unique.

Prove the same for the unique maximal development `(D⁺_{H_{t₀}}({t₀} × S), U_*)` of
CompressibleEulerEquations §8.2's uniqueness criterion when `c`, `|v|` of `U_*` are bounded on bounded
slabs.

**Checks.**

- Constant state, maximal development, `S = {x¹ > 0}`: `𝒞(D) = {x¹ = (v₀¹ + c₀)(t − t₀), t > t₀}`,
  ruled by the lines `t ↦ (t, x₀ + (t − t₀)(v₀ + c₀e₁))` from `edge = {t₀} × {x¹ = 0}`
  (LorentzianGeometry §12.7's first Check).
- Constant state, maximal development, `S = B(0, R)`: the generators are the segments from
  `|x| = R` toward the centre, moving with the fluid at sound speed; they meet at the apex
  `t − t₀ = R/c₀`, after which `𝒞(D)` is empty.
- Expanding flow, maximal development, `S = (−1, 1)`: outside the hypotheses as stated, since
  `v = x/(1 + t)` is unbounded on every slab, but the generators are still the two curves
  `x = ±(2√(1 + t) − (1 + t))`, meeting at `t = 3`.

*Needs:* §2.1; CompressibleEulerEquations §8.1, §8.4; LorentzianGeometry §3.1, §12.7.

### 2.3 Eikonal description of the characteristic boundary

In the slab setting of §1.2 (`k ≥ 2`, `S′ = E`, `Ψ_t` diffeomorphisms of E for `t ∈ [t₀, t₁)`), with
`c` and `|v|` bounded on `[t₀, t₂] × E` for every `t₂ < t₁`, let `S = {u₀ < 0}` and
`O₁ = [t₀, t₁) × E`. Prove `D⁺_{O₁}({t₀} × S) = {u < 0}` and, for `D` this domain of dependence,
`𝒞(D) ∩ {t < t₁} = {u = 0} ∩ {t₀ < t < t₁}`, a `C^k` null hypersurface ruled by the curves `γ_y`,
`u₀(y) = 0`.
Route: u is nondecreasing along future causal curves (its differential is future causal and causal
curves are Lipschitz), so a past causal curve in `O₁` from a point with `u < 0` keeps `u < 0` and,
reaching `Σ_{t₀}` by the slab statement, ends in S; from a point with `u ≥ 0` the curve `γ_y`
through it is a past causal curve ending at `(t₀, y)` with `u₀(y) ≥ 0`, outside S. The route uses
only that u is a `C²` acoustical function on `O₁` and the bound on `c` and `|v|`, with the integral
curve of `L` through a point with `u ≥ 0` in place of `γ_y`; prove the statement in that form
(`futureDomainOfDependence_eq_setOf_neg`). For half-space data `S = {x¹ > 0}` (`u₀ = −x¹`,
`Λ = 0` or `Λ_cyl`), this is the domain `𝒟₀` and the boundary `C₀` of Luo–Yu 2025a, §2, for as
long as the outgoing acoustical function of `−x¹` has no caustic.

**Checks.**

- Constant state: `u = (v¹ + c)(t − t₀) − x¹` and `{u < 0} = {x¹ > (v¹ + c)(t − t₀)}`, the domain of
  CompressibleEulerEquations §3.3's half-space Check.
- Constant state, `n = 2`, `S = B(0, R)` with `u₀ = |x| − R` on `S′ = E ∖ {0}`: the hypothesis
  `S′ = E` fails, and it must. With `s = t − t₀`, `Ψ_t(y) = sv₀ + (|y| − c₀s)ŷ`: the generators
  from `|y| = R` meet at the apex `s = R/c₀`, where the characteristic boundary ends (§2.2), and
  `Ψ_t` is injective for no `s > 0`, since `Ψ_t(ae) = Ψ_t(−(2c₀s − a)e)` for a unit vector `e` and
  `0 < a < c₀s`.
- The bound on `c` and `|v|` is needed: for the Chaplygin law `P = A − 1/ρ` (`c = 1/ρ`) and
  `n = 1`, the stationary solution `ρ = 1/(1 + x²)`, `v = −(1 + x²)` carries the acoustical
  function `u = −x`, with `L = ∂_t` and `Ψ_t = id` on `O₁ = [0, 1) × ℝ`. The past causal curve
  `ẋ = v − c = −2(1 + x²)` through `(1/2, 1)`, where `u = −1`, has `arctan x = π/4 + 1 − 2t` and
  runs to `+∞` as `t ↓ (1 − π/4)/2` without meeting `Σ₀`, so `(1/2, 1) ∉ D⁺_{O₁}({0} × {x > 0})`.
- The expanding flow is excluded as stated, because `v = x/(1 + t)` is unbounded on E; its
  acoustical function of §1.2 with `u₀ = x − 1` still has `{u < 0} = {x < 2√(1 + t) − (1 + t)}`.

*Needs:* §1.2, §2.2; CompressibleEulerEquations §3.3.

### Examples

The constant-state cones and half-spaces, and the expanding-flow development, with their
characteristic boundaries and generators.

### Dependencies

Layer 1; CompressibleEulerEquations §3.3, §§8.1–8.4; LorentzianGeometry §3.1, §12.6, §12.7.

## Layer 3: characteristic initial data

### 3.1 Inner equations on sound-null hypersurfaces

Let `(𝒪, P)` be an equation of state, U a state of class `C¹` near a point, and `ζ` a covector with
`ζ′ ≠ 0` that is future null for `g_U`: `ζ₀ + v·ζ′ = c|ζ′|`. Write `n̂ = ζ′/|ζ′|` and `P_s = ∂_sP`.
For the full system in the material form of CompressibleEulerEquations §1.3, with residual
`ℰ(U) = (Bρ + ρ div v, Bv + ρ⁻¹(c²∇ρ + P_s∇s), Bs)`, prove that the left kernel of the symbol
`σ(U; ζ)` is spanned by `ℓ = (1, −(ρ/c)n̂, P_s/c²)` and its kernel by `r = (1, −(c/ρ)n̂, 0)` (the
sound sheet is simple; the material root `ζ₀ + v·ζ′ = 0` is not attained). Define the *inner
expression* on a `C¹` hypersurface `C = {φ = 0}` with `dφ` future null for `g_U`:

`ℓ·ℰ(U) = (B − c n̂·∇)ρ + ρ(div v − c⁻¹n̂·Bv) + (P_s/c²)(B − c n̂·∇)s`,

and prove that it involves only derivatives of U tangent to C, so it is defined for a `C¹` map on C
alone (*the inner equation* `ℓ·ℰ = 0`); every classical solution on a set containing C, or on one
side of C and `C¹` up to it, satisfies the inner equation on C. For the barotropic system drop the
entropy component: `ℓ = (1, −(ρ/c)n̂)`, `r = (1, −(c/ρ)n̂)`. Prove that on C the remaining equations
determine the transverse derivative `∂_φU` modulo `r`, and that the `r`-component satisfies a
Riccati equation along the null generators of C, and the higher transverse derivatives linear
transport equations (Rendall 1990, the reduction of the characteristic initial value problem to
the Cauchy problem, abstract, p. 221; Luo–Yu 2025b, §1.4.3, the diagonal system (1.25) in
the `L`-direction).

**Checks.**

- `p = ρ²/2`, state `ρ = 1`, `v = 0` (`c = 1`), `n = 1`, `ζ = (1, −1)`: `σ(δρ, δv) = (δρ − δv, δv − δρ)`,
  `ℓ = (1, 1)` gives `ℓσ = 0` and `r = (1, 1)` gives `σ(r) = 0`; the sign-reversed `ℓ = (1, −1)` gives
  `2(δρ − δv) ≠ 0`.
- The s-terms are tangential: on `δs` their symbol is `−(P_s/c)|ζ′| + (P_s/c²)·c|ζ′| = 0`.
- For the expanding flow on the curve `x = 2√(1 + t) − (1 + t)` with `n̂ = e₁`:
  `Bρ = −(1 + t)⁻²`, `∂_xρ = 0`, `div v = (1 + t)⁻¹`, `Bv = 0`, and the inner expression is
  `−(1 + t)⁻² + (1 + t)⁻² = 0`.

*Needs:* CompressibleEulerEquations §§1.2–1.3, §2.2, §3.1; Rendall 1990 (source; see References).

### 3.2 Characteristic data sets and compatibility

Define a *characteristic data set* for an equation of state as: a time `t₀`;
a period group Λ; a Λ-invariant open `W ⊆ 𝔐` and a Λ-invariant `C¹` function `φ` on W with
`dφ ≠ 0`, whose *edge* `𝓔 = {x : (t₀, x) ∈ W, φ(t₀, x) = 0}` is a `C¹` hypersurface of E (the
spatial part of `dφ` is nonzero there); the hypersurface `C = {p ∈ W ∩ H_{t₀} : φ(p) = 0}` and the
wedge `K_φ`; a Λ-invariant open `S₀ ⊆ E` with `{t₀} × S₀ ⊆ K_φ` and `{t₀} × (S₀ ∪ 𝓔)` relatively
open in `K_φ ∩ Σ_{t₀}`, that is, `S₀ ⊇ {x ∈ N : φ(t₀, x) > 0}` for an open `N ⊇ 𝓔` with
`{t₀} × N ⊆ W` (so `𝓔 ⊆ closure S₀`); and data `Ū₀` on `S₀`, `C¹` up to `𝓔`, and `Ū_C` on C, `C¹`
on C as a manifold with boundary `{t₀} × 𝓔`, Λ-periodic, valued in the states. Require:

1. `Ū₀ = Ū_C` on `𝓔`;
2. *nullity*: `dφ` is future null for `g_{Ū_C}` at every point of C (a condition on the data,
   because the metric on C depends only on `Ū_C`);
3. *constraint*: `Ū_C` satisfies the inner equation of §3.1 on C;
4. *compatibility of order 1*: the 1-jet at each edge point determined by `Ū₀` and the equations
   (the formal time derivative of CompressibleEulerEquations §7.1's Cauchy problem) restricts on
   `T C` to the derivative of `Ū_C`;
5. *C issues from the edge*: every point of C is the endpoint of a past causal curve in C for the
   acoustical cone of `Ū_C` (CompressibleEulerEquations §3.3) whose interval contains `t₀`, so that
   it starts on `C ∩ Σ_{t₀} = {t₀} × 𝓔`.

For data of class `C^m`, define *compatibility of order m* in the same way with m-jets: the formal
m-jet at an edge point computed from `Ū₀` by the equations restricts on C to the m-jet of `Ū_C`
(Luo–Yu 2025b, §2.1, conditions C1)–C3), there written as `L^aX^b`-derivatives along C for
`a + b ≤ m`). Smooth data compatible to all orders are *smoothly compatible*.

- Restricting C to `C ∩ {t < T}`, `T > t₀`, gives a characteristic data set.
- If `(D_R, U_R)` is one of the developments of data on an open set treated in §2.2 (the largest
  development in a slab, or the maximal development) and `C ⊆ 𝒞(D_R)` is a `C¹` piece of its
  characteristic boundary with `C ∩ D_R = ∅`, below the top of the slab in the first case, then the
  trace of `U_R` on C satisfies 2 and 3 (Layer 2, §3.1). The data of Luo–Yu 2025a are of this
  kind, with `Ū_C` the trace on `C₀` of the solution in `𝒟₀` and `S₀` the part of `Σ_δ` beyond
  `C₀`.

**Checks.**

- Constant data `(ρ₀, v₀)` on `S₀ = {x¹ < 0}` and on `C = {x¹ = (v₀¹ + c₀)(t − t₀)}` satisfy 1–5 and
  are smoothly compatible; replacing `Ū_C` by a different constant violates 1.
- With `n = 1`, `p = ρ²/2`, `t₀ = 0`, `Ū_C` the constant state `(1, 0)` on `C = {x = t}`, and
  `Ū₀ = (1, a x)` on `x < 0`: 1–3 and 5 hold, and the formal derivative at the edge from `Ū₀` has
  `∂_tv = −v∂_xv − ∂_xρ = 0`, `∂_tρ = −ρ∂_xv = −a`, so its derivative along `L = ∂_t + ∂_x` is
  `(−a, a)`; compatibility of order 1 holds exactly when `a = 0`.
- The top of the slab is excluded in the statement on traces: for `n = 1`, `c₀ = 1`, `v₀ = 0` and
  constant data on `(−1, 1)`, the largest development in `[0, 1/2) × ℝ` is
  `{|x| < 1 − t, 0 ≤ t < 1/2}`, whose characteristic boundary contains the spacelike segment
  `{t = 1/2, |x| < 1/2}`, where nullity fails.
- The condition on `S₀` at the edge is needed: for `n = 1`, `p = ρ²/2`, `t₀ = 0`, `W = 𝔐`,
  `φ = t − x` (`𝓔 = {0}`, `C = {x = t, t ≥ 0}`, `K_φ = {0 ≤ t, x ≤ t}`) and the open set
  `S₀ = (−1, 0) ∖ {−1/k : k ≥ 2}`, whose closure contains 0, the constant state `(1, 0)` satisfies
  1–5 and is smoothly compatible, but a relatively open subset of `K_φ` containing `(0, 0)`
  contains `(0, −1/k)` for large k, so these data have no development (§3.3).
- Condition 5 is needed: for `n = 1`, `p = ρ²/2`, `t₀ = 0`, `W = 𝔐 ∖ {(0, 5)}`, `φ = t − x + 5` and
  `S₀` empty, the edge is empty and `C = {x = t + 5, t > 0}`, and the constant state `(1, 0)` on C
  satisfies 1–4 but not 5. The data on `C ∩ {t < τ}` have no development for any `τ > 0`: a
  development D contains points p with `φ(p) > 0`, and the maximal past integral curve through p
  of `∂_t + (v + c)∂_x` for its solution is a past-inextendible causal curve in D that meets
  neither C, an integral curve of the same field, nor `Σ₀`, which D does not meet, so
  `p ∉ D⁺_D(C)`.

*Needs:* §3.1; CompressibleEulerEquations §3.3, §7.1, §8.1; Layer 2.

### 3.3 Developments of characteristic data

Define a *development* of a characteristic data set as a pair
`(D, U)` with D a Λ-invariant wedge domain of `K_φ` containing `({t₀} × S₀) ∪ C`, with
`D ∩ Σ_{t₀} = {t₀} × (S₀ ∪ 𝓔)`, U a Λ-periodic classical solution on D (derivatives within D, which
is uniquely differentiable: near C and near the corner `{t₀} × 𝓔` it is `C¹`-diffeomorphic to a
half-space or a quadrant), `U = Ū₀` on `{t₀} × S₀`, `U = Ū_C` on C, and
`D = futureDomainOfDependence (acousticalCone U) D (({t₀} × S₀) ∪ C)` (the development `𝒟(δ)`
of Luo–Yu 2025a on `Σ_δ ∪ C₀` is of this kind). Its *characteristic boundary* is
`frontier D ∩ {t > t₀} ∖ C`.

Prove the causal theory of CompressibleEulerEquations §3.3 for wedge domains and the data set
`({t₀} × S₀) ∪ C`: past-inextendible extensions, compact causal pasts, openness relative to `K_φ`
and idempotence, by the limit-curve statement of its §3.2 applied to relatively open subsets of
`K_φ` (curves leave a wedge domain to the past only through `Σ_{t₀}` or C). Then prove, for two
developments of the same data, the analogues of its §§8.1–8.2: the order and compatibility of
developments, the maximal common development `{p ∈ D₁ : J⁻_{D₁}(p) ⊆ D₂}`, the compatibility
criterion, the union of a nonempty compatible family, and the existence of maximal developments by
Zorn's lemma. The local step is uniqueness on lens-shaped domains with a null face: the energy
argument of CompressibleEulerEquations §6.1 on a lens whose past boundary lies in `Σ_{t₀} ∪ C`,
where the boundary flux on C of the difference of two solutions vanishes because the difference
vanishes on C.

**Checks.**

- Constant data as in §3.2's Check, with `W = 𝔐` and `φ = (v₀¹ + c₀)(t − t₀) − x¹`: the whole wedge
  `K_φ = {x¹ ≤ (v₀¹ + c₀)(t − t₀)}` with the constant state is the unique maximal development; it is
  the complement in `H_{t₀}` of the development `{x¹ > (v₀¹ + c₀)(t − t₀)}` of the half-space
  `{x¹ > 0}`, and it contains C.
- `H_{t₀}` with the constant state is a development of the initial data set on all of E
  (CompressibleEulerEquations §8.1), but not of the characteristic data: it contains points with
  `φ < 0` and is not a wedge domain of `K_φ`.

*Needs:* §3.2; CompressibleEulerEquations §3.2, §3.3, §6.1, §§8.1–8.2; Mathlib `zorn_le_nonempty₀`.

### 3.4 Local existence near the edge

Prove: for smoothly compatible smooth data with `𝓔/Λ` compact, there are `τ > 0` and a development
of the data restricted to `C ∩ {t < t₀ + τ}`, of class `C^∞` on its wedge domain (for `𝓔/Λ`
noncompact, the same near every compact subset of `𝓔`). Route (reduction to the Cauchy problem,
Rendall 1990, abstract, p. 221): the transport equations of §3.1 determine all transverse jets of the
solution on C near `𝓔`, with initial values at `𝓔` from the formal jets of `Ū₀`; a Borel lemma for
jets along a hypersurface (constructed here: a smooth function on a neighbourhood of C with
prescribed transverse Taylor coefficients, Hörmander, Theorem 1.2.6, in the normal coordinate)
gives Φ on the side `{φ < 0}` with these jets; the Cauchy problem with data `Ū₀` on `S₀` and
`Φ(t₀, ·)` across `𝓔` (smooth across `𝓔` by compatibility to all orders, made uniformly local by a
cutoff, CompressibleEulerEquations §7.3) and the source equal to `ℰ(Φ)` on `{φ < 0}` and 0 on
`{φ ≥ 0}` (smooth, since `ℰ(Φ)` vanishes to infinite order on C) has a smooth solution U by
CompressibleEulerEquations §7.1 extended to sources depending smoothly on `(t, x)` with bounded
derivatives (constructed here, by the same energy method). On the development of the data on
`{φ(t₀, ·) < 0}`, whose characteristic boundary near `𝓔` is C for short times (§§2.2–2.3, the
generators of C issuing from `𝓔` into that side), uniqueness for the equation with this source gives
`U = Φ`, hence `U = Ū_C` on C by continuity. That uniqueness is constructed here as well:
CompressibleEulerEquations §6.2 is stated for sources depending on the state alone, and the lens
argument of its §6.1 carries over unchanged, a source depending only on `(t, x)` cancelling in the
difference of two solutions. The restriction of U to the domain of dependence of
`({t₀} × S₀) ∪ C` in `K_φ` is the development.

**Checks.**

- Constant data: the reduction returns the constant state.
- The jets cannot be prescribed freely on C. For `n = 1`, constant `Ū_C` and
  `φ = (v_C + c_C)(t − t₀) − x`, the Riccati equation of §3.1 along the generator is
  `dα/dt = ρ⁻¹(d(ρc)/dρ)α²`, where `α` is the `r`-component of `∂_φU`; for `p = ρ²/2` and
  `Ū_C = (1, 0)` it is `dα/dt = (3/2)α²`. Data with `α₀ > 0` at the edge (compressive) blow up at
  `t − t₀ = 2/(3α₀)`, so τ is finite even for small smooth data, while `α₀ < 0` (expansive) decays;
  for the Chaplygin law `P = A − 1/ρ`, `ρc` is constant and `α` stays constant.

*Needs:* §§3.1–3.3, §2.3; CompressibleEulerEquations §6.1, §6.2, §7.1, §7.3; Hörmander, *The
Analysis of Linear Partial Differential Operators I*, Theorem 1.2.6; Rendall 1990 (source; see
References).

### 3.5 The Goursat problem

Define *double characteristic data*: two characteristic hypersurfaces `C = {φ = 0}`,
`C̲ = {φ̲ = 0}` with `dφ`, `dφ̲` future null and `g⁻¹(dφ, dφ̲) < 0` (a double null pair,
LorentzianGeometry §9.2) meeting in the spacelike codimension-two `Z = C ∩ C̲`, with data on
`C ∪ C̲` agreeing on Z and satisfying the inner equations on each, and compatibility of order m at
Z (the m-jets determined at Z by the two sets of transport equations agree). A development is a
classical solution on a relatively open subset D of `{φ ≥ 0, φ̲ ≥ 0}` containing `C ∪ C̲` near Z with
`D = D⁺_D(C ∪ C̲)`. Prove uniqueness (§3.3 with two null faces) and local existence near compact
pieces of Z for smoothly compatible data, by the reduction of §3.4 with jets on both hypersurfaces
(Rendall 1990, data on two transversely intersecting null hypersurfaces, abstract, p. 221; for
quasilinear wave equations its theorem is restated as Luk 2012, §3, Theorem 3). Luo–Yu 2025b,
§5.4 (p. 77; Step 3 of the plan in §2.3.2, p. 26), solves this problem between the rarefaction
fronts `H` and `H̲`.

**Checks.**

- Constant data, `n = 1`, on `C = {x = (v₀ + c₀)t}` and `C̲ = {x = (v₀ − c₀)t}`, `t > 0`: the constant
  state on `{(v₀ − c₀)t ≤ x ≤ (v₀ + c₀)t}` is the development. For `φ = (v₀ + c₀)t − x` and
  `φ̲ = x − (v₀ − c₀)t`, `dφ(B) = dφ̲(B) = c₀`, so both are future null, and
  `g⁻¹(dφ, dφ̲) = −c₀⁻²·c₀·c₀ + (−1)(1) = −2`.

*Needs:* §§3.1–3.4; LorentzianGeometry §9.2; Rendall 1990 (source; see References); Luk 2012, §3.

### Examples

Constant characteristic data and their maximal development; the trace of a half-space development
on its characteristic boundary as characteristic data.

### Dependencies

Layers 1–2; CompressibleEulerEquations §§1.2–1.3, §2.2, §§3.1–3.3, §§6.1–6.2, §§7.1–7.3, §§8.1–8.2;
LorentzianGeometry §9.2.

## Layer 4: centered rarefaction waves

### 4.1 Centered null foliations

Work with a barotropic equation of state, `n ≥ 1`, `Λ = Λ_cyl` (the cylinder of Luo–Yu, `n = 2`),
`t₀ = 0` and the codimension-two set `𝐒_* = {0} × {x¹ = 0}`. Let `U_r` be smooth data on
`{x¹ > 0}` that extend to a smooth solution on a slab `O = [0, t*) × E` (CompressibleEulerEquations
§8.3), `𝒟₀ = D⁺_O({0} × {x¹ > 0})` and `C₀ = 𝒞(𝒟₀) ∩ {t < t*}`. Define a *family of centered
rarefaction waves connected to* `U_r` (Luo–Yu 2025b, Definition 2.13) as a Λ-periodic classical
solution `U′` on a Λ-invariant set `𝒲′ ⊆ (0, t*) × E ∖ 𝒟₀` with `C₀ ⊆ 𝒲′`, together with a map
`X : [0, t*) × [0, u*] × (ℝ/2πℤ)^{n−1} → 𝔐/Λ`, `u* > 0`, into the cylinder, such that:

1. *(foliation)* X restricted to `t > 0` is a `C^N` diffeomorphism onto `𝒲′/Λ`, `t(X(t, u, ϑ)) = t`,
   and `u′ = u ∘ X⁻¹` is an acoustical function of the acoustical field of `U′` (§1.2's
   conventions), with level sets `C′_u`, `C′_0 = C₀`, and `L = ∂_t` in the coordinates `(t, u, ϑ)`;
2. *(emanating from `𝐒_*`)* X is continuous on `t = 0` with `X(0, u, ϑ) = (0, 0, ϑ)` for every u;
3. *(smoothness)* `U′ ∘ X` extends to a `C^N` map on `[0, t*) × [0, u*] × (ℝ/2πℤ)^{n−1}`, and
   `U′ = U_r`'s solution on `C₀`;
4. *(centered)* `κ′(t, u, ϑ)/t → 1` as `t → 0`, where `κ′ = 1/|∇u′|`.

Prove that for `u₁ > u₂` the hypersurface `C′_{u₁}` lies to the future of `C′_{u₂}` (u′ is
nondecreasing along future causal curves), that conditions 1–4 are invariant under translations
in `x²,…,xⁿ` and under the rescalings `(t, x) ↦ (t/k, x/k)` of solutions and data, `k` a positive
integer, with `t*` replaced by `t*/k` and the chart `(t, u, ϑ) ↦ k⁻¹X(kt, u, kϑ)` on lifts to `𝔐`
(the rescaled field must stay `Λ_cyl`-periodic, which a factor `λ` with `1/λ ∉ ℤ` does not ensure),
and that if `κ′/t` converges as `t → 0` to a function `a(u)` of `u` alone, of class `C^N` and
bounded above and below by positive constants, then replacing `u` by `∫₀^u a` gives a family
satisfying 1–4 (compare Luo–Yu 2025b, Remark 2.14).

**Checks.**

- The constant state `U′ = U_r` with `u′ = (v_r¹ + c_r)t − x¹` has `κ′ = 1`, so `κ′/t → ∞`: a single
  null hyperplane is not centered, as 4 detects.
- Condition 2 is what distinguishes a centered foliation from the foliation of §1.2 issuing from
  `Σ_0`: there, `X(0, u, ϑ) = (0, −u, ϑ)` depends on u.
- The limit must be a function of u alone. For `n = 2`, small `t*` and `u*`, the plane wave of §4.2
  also carries the acoustical function `u′ = F(t, x¹/t, x²)` with
  `F(0, ξ, x²) = (λ_r − ξ)/(1 + ε sin x²)`, `0 < ε < 1`: in the variables `(t, ξ = x¹/t, x²)` the
  eikonal equation reads `∂_tF = c t (∂₂F)²/(|∂_ξF| + √((∂_ξF)² + t²(∂₂F)²))`, regular at `t = 0`.
  Its foliation satisfies 1–3 with `C′_0 = C₀`, and `κ′ = t/√((∂_ξF)² + t²(∂₂F)²)` gives
  `κ′/t → 1 + ε sin ϑ`, between `1 − ε` and `1 + ε`; no function of u alone makes the limit 1.

*Needs:* §§1.2–1.3, §2.3; CompressibleEulerEquations §8.3.

### 4.2 The plane-symmetric centered rarefaction wave

For the polytropic law `p = k₀ρ^γ`, `γ > 1`, and a constant right state `(ρ_r, v_r)` with
`c_r = c(ρ_r)` and `v_r^A = 0` for `A ≥ 2` (the general case follows by a Galilean boost in the
`x^A` directions), put `λ_r = v_r¹ + c_r` and `w_r = c_r/(γ − 1) − v_r¹/2` (the Riemann invariant of
Luo–Yu 2025a, §1). For `0 < u* < λ_r + 2w_r`, define on
`𝒲′ = {0 < t < t*, (λ_r − u*)t ≤ x¹ ≤ λ_r t}`

`c = ((γ − 1)/(γ + 1))(x¹/t + 2w_r)`, `v¹ = 2c/(γ − 1) − 2w_r`, `v^A = 0`,

and `X(t, u, ϑ) = (t, (λ_r − u)t, ϑ)` (`planeRarefaction`). Prove that this is a classical
barotropic solution (`isSolution_planeRarefaction`), that it is a family of
centered rarefaction waves connected to the constant data `U_r` on `{x¹ > 0}` (`𝒟₀ = {x¹ > λ_r t}`),
with `u′ = λ_r − x¹/t`, `κ′ = t` and `L = ∂_t + (x¹/t)∂₁`.

**Checks.**

- At `u = 0`: `λ_r + 2w_r = c_r(γ + 1)/(γ − 1)`, so `c = c_r` and `v¹ = v_r¹` on `C₀`.
- `v¹ + c = x¹/t`, so `C′_u = {x¹ = (λ_r − u)t}` is null and `L(u′) = x¹/t² − (x¹/t)(1/t) = 0`.
- `κ′ = t`: with `T = −t∂₁`, `Tu′ = 1`; and `Lκ′ = 1` equals both forms of §1.3:
  `T̂·T(v) − Tc = 2/(γ + 1) + (γ − 1)/(γ + 1) = 1` and `m′ = −((γ + 1)/(γ − 1))Tc = 1` with `e′ = 0`
  (`c` and `v` are constant along L).
- `u* < λ_r + 2w_r` keeps `c > 0` on the tail: at `u* = λ_r + 2w_r` the tail has `c = 0` (vacuum).

*Needs:* §4.1, §1.3; CompressibleEulerEquations §1.2, §3.3.

### Examples

The plane-symmetric centered rarefaction of a polytropic gas.

### Dependencies

Layers 1–3; CompressibleEulerEquations §1.2, §3.3, §8.3.

## Downstream consumers

- **Rarefaction waves** (Luo–Yu 2025a, 2025b): `𝒟₀`, `C₀` and the acoustical coordinates (§§1.2–1.3,
  §2.3), the development `𝒟(δ)` of characteristic data on `Σ_δ ∪ C₀` (§§3.2–3.4), the Goursat
  problem between rarefaction fronts (§3.5), and centered rarefaction waves (§4.1) are the carriers of
  their main theorems.
- **Shock formation and shock development** (Christodoulou 2007; Christodoulou–Miao; Christodoulou
  2019): the acoustical functions, `μ`, the acoustical coordinates and the regular part `C̲` of the
  boundary of the maximal development (Layers 1–2).

## Scope and ownership

This roadmap owns:

- the extension of the acoustical field of a classical solution on a domain to an open set of
  `𝔐`, and the comparison of the domains of dependence of CompressibleEulerEquations (open data,
  inside a domain) with those of LorentzianGeometry (closed data, inside an open set);
- outgoing acoustical functions of the acoustical metric of a classical solution, the vector
  fields `L`, `T`, `T̂`, the functions `μ`, `κ`, the sections `S_{t,u}`, acoustical coordinates
  `(t, u, ϑ)`, the expression of the acoustical metric in them, and the propagation equation for
  `κ` along `L`;
- the characteristic boundary of a development, its identification with a horizon, its null
  generators and its eikonal description;
- the inner equation of each Euler system on a sound-null hypersurface, characteristic initial
  data sets, their compatibility conditions of every order, their developments, maximal common
  and maximal developments, local uniqueness with a null face, local existence near the edge and
  the Goursat problem;
- centered null foliations and centered rarefaction waves (Luo–Yu 2025b, Definition 2.13), and
  the plane-symmetric centered rarefaction wave of a polytropic gas.

Boundaries:

- **CompressibleEulerEquations** owns the equations of state, both Euler systems, the
  symmetrisers, the sound-cone fields with `IsCausalCurve`, `causalPast` and
  `futureDomainOfDependence`, the `Hᵏ_Λ` calculus, the energy method, local uniqueness on
  lens-shaped domains (§6.1) and on domains of dependence (§6.2), local well-posedness (§§7.1–7.3)
  and the developments of data on open subsets of a slice with the nullity of the regular part of
  their boundary (§§8.1–8.4). Nothing of it is planned again here; each statement of the layers
  says how it differs.
- **LorentzianGeometry** owns the acoustical form on `ℝ × Σ` (§7.3), the geodesic predicate, spray, flow and its regularity (§§3.2–3.3), null hypersurfaces, optical
  functions and double null foliations (§9.2), null generators (§9.3), causal curves and domains of
  dependence in subsets (§12.6), and push-up, limit curves, horizons relative to an open set and
  their null generators for locally Lipschitz metrics (§12.7). This roadmap applies them to the
  acoustical metric of a solution.
- **Well-posedness at real Sobolev orders** `s > n/2 + 1` (Kato–Ponce commutator estimates) is
  not part of this roadmap.
- Shock formation, the singular boundary of maximal developments, the energy estimates of
  rarefaction waves and the Riemann problem are the theorems of the cited papers; they are
  consumers of this roadmap and are not part of it. The relativistic Euler equations are outside
  the roadmap.

## Exact supplier contracts

### From Mathlib

- `ContDiffOn`, `fderivWithin`, `iteratedFDerivWithin`, `UniqueDiffOn` and `uniqueDiffOn_convex`:
  regularity on domains and wedges; `gradient`: the spatial gradient `∇u`; `IsPicardLindelof`,
  `ODE_solution_unique_of_mem_Icc`: integral curves of `L`;
  `LipschitzOnWith.ae_differentiableWithinAt_of_mem` and the chain rule almost everywhere for the
  monotonicity of acoustical functions along Lipschitz causal curves; `zorn_le_nonempty₀` for
  maximal developments; `ContinuousLinearMap` and `Matrix` for symbols and their left kernels.

### From Tau Ceti

- Nothing on causal structure, fluids or characteristic problems. The whole-space Sobolev
  spaces and the Carathéodory ODE theory enter only through CompressibleEulerEquations.

### From TauCetiRoadmap.CompressibleEulerEquations

- §§1.1–1.3: `EquationOfState`, `EquationOfState.soundSpeed`, `EquationOfState.IsSolution`, the
  barotropic system as the constant-entropy case.
- §§2.1–2.2: `QuasilinearSystem`, its `symbol`, the Euler symmetrisers and the characteristic
  variety (the sound sheet and the material sheet).
- §§3.1–3.3: `EquationOfState.acousticalCone`, `IsCausalCurve`, `IsPastCausalCurve`,
  `IsPastInextendible`, `causalPast`, `futureDomainOfDependence`, limit curves, compact causal
  pasts, openness and idempotence of `D⁺_D(S)` for relatively open data on a domain, slabs.
- §6.1 (`IsLensFunction`, `QuasilinearSystem.eqOn_lens`, moving cones) and §6.2
  (`QuasilinearSystem.eqOn_causalPast`).
- §§7.1–7.3: `QuasilinearSystem.localWellPosedness`, `EquationOfState.localWellPosedness`, the
  continuation criteria and uniformly local data.
- §§8.1–8.4: `EquationOfState.IsDevelopment`, `maximalCommonDevelopment`, `compatible_iff`,
  `exists_maximal_development`, `isGreatest_development_of_solution`, `isDevelopment_slab`,
  `slab_subset_of_maximal`, `boundary_futureCausal`, `boundary_null`.

### From TauCetiRoadmap.LorentzianGeometry

- §§3.2–3.3: the geodesic predicate, pregeodesics and their reparametrization, the flow of a
  locally Lipschitz connection and its `C^r` regularity for `C^r` coefficients.
- §7.3: the acoustical form on `ℝ × Σ`, `g(B, X) = 0` for `X` tangent to `Σ_t`, the inverse form,
  `g⁻¹(dt, dt) = −c⁻²`, causal vectors, and that `B` is a continuous timelike field.
- §8.1: time orientations, and the time orientation `[B]` of the acoustical form.
- §9.2: null hypersurfaces, null normals, optical functions with null normal `−grad_g u`, double
  null foliations; §9.3: `∇_L L = κL` on a `C²` null hypersurface and `∇_L L = 0` for
  `L = −grad_g u` of a `C²` optical function.
- §12.6: `TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`, `IsPastInextendibleIn`,
  `futureDomainOfDependenceIn`, and its statement on time functions: for the acoustical form of a
  continuous field with `c > 0`, `D⁺_D(S)` is the set defined by `t`-parametrized curves in the
  extension form; §12.7: push-up and `I⁺(p) = int J⁺(p)` for locally Lipschitz metrics, the relative
  horizon `H⁺_U(S)`, its achronal generators (null geodesics after reparametrization for `C¹`
  metrics), and, for `S` closed in a slice of a temporal function, `edge_U(S) = ∂_{Σ_{t₀}}S` and
  `∂_U D⁺_U(S) ∩ {t > t₀} = H⁺_U(S) ∩ {t > t₀}`.

## References

- ChristodoulouMiao2014: D. Christodoulou, S. Miao, *Compressible Flow and Euler's Equations*,
  Surveys of Modern Mathematics 9, 2014; arXiv:1212.2867: Ch. 1 (§1.2 irrotational flow, §1.3 the
  acoustical metric), §2.1 (null foliation, acoustical functions, `L`, `μ`, `T`), Ch. 3 (structure
  equations), Ch. 19 (the boundary of the maximal solution).
- Christodoulou2007: D. Christodoulou, *The Formation of Shocks in 3-Dimensional Fluids*, EMS
  Monographs, 2007, Chs. 1–3.
- Christodoulou2019: D. Christodoulou, *The Shock Development Problem*, EMS Monographs, 2019.
- LuoYu2025a, LuoYu2025b: T.-W. Luo, P. Yu, *On the stability of multi-dimensional rarefaction
  waves I: the energy estimates* and *II: existence of solutions and applications to the Riemann
  problem*, Ann. of Math. 202 (2025); arXiv:2302.09714, arXiv:2305.06308. The section, definition,
  remark, equation and page numbers cited are those of the arXiv versions v2. I, §2.1–§2.2
  (acoustical coordinates, the propagation equation for `κ`); II, §1.4.3 (the diagonal system
  (1.25)), §2.1 (compatibility conditions C1)–C3)), Definition 2.13 (centered rarefaction waves) and
  Remark 2.14, §5.4 (Goursat problem).
- Rendall1990: A. D. Rendall, *Reduction of the characteristic initial value problem to the Cauchy
  problem and its applications to the Einstein equations*, Proc. R. Soc. Lond. A 427 (1990), 221–239.
  Cited by its abstract (p. 221), which states the method, a reduction of the characteristic
  initial value problem to the Cauchy problem, and its application to data on two transversely
  intersecting null hypersurfaces, and through Luk 2012, §3, Theorem 3, which restates its
  existence and uniqueness theorem for quasilinear wave equations with data on two null
  hypersurfaces meeting in a 2-sphere; Cabet–Chruściel–Tagne Wafo 2016, Introduction, records that
  it covers quasilinear wave equations and symmetric hyperbolic systems.
- Luk2012: J. Luk, *On the local existence for the characteristic initial value problem in general
  relativity*, Int. Math. Res. Not. IMRN 2012, no. 20, 4625–4678; arXiv:1107.0898: §3 (Rendall's
  theorem), Theorem 3.
- CabetChruscielTagneWafo2016: A. Cabet, P. T. Chruściel, R. Tagne Wafo, *On the characteristic
  initial value problem for nonlinear symmetric hyperbolic systems, including Einstein equations*,
  Dissertationes Math. (2016), 1–72; arXiv:1406.3009v2: Introduction.
- Hörmander: L. Hörmander, *The Analysis of Linear Partial Differential Operators I*, 2nd ed.,
  Grundlehren der mathematischen Wissenschaften 256, Springer, 1990, Theorem 1.2.6 (Borel's lemma).
- HawkingEllis1973: S. W. Hawking, G. F. R. Ellis, *The Large Scale Structure of Space-Time*, Ch. 6
  (Cauchy horizons and their generators).
