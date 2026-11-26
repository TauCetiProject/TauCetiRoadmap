# Adelic unitary groups and algebraic modular forms

The argument proves the Riemann hypothesis for Dirichlet L-functions through a one-sided bound for a sum over primes:
such a bound at arbitrarily large scales gives a zero-free half-plane. At each scale the bound comes from comparing an
upper and a lower bound for the covolume of a lattice of theta lifts. The theta lifts, the source forms and the target
forms of the argument are functions on the adelic points of unitary groups of hermitian spaces over a CM field `E`:
algebraic modular forms on definite groups, and forms of a discrete-series type on indefinite ones.

This roadmap states the background that the argument uses about these groups and these forms, in the form the
shorter proof needs. It is used by the roadmaps of the argument and by background roadmaps, among them
WeilRepresentationsOnBanachSpacesOfData, SiegelWeilAndRallisFormulasOnUnitaryGroups and
GaloisRepresentationsOfUnitaryEigenforms. It cites HolomorphicDiscreteSeriesOfUnitaryGroups (the real unitary groups and
their discrete series), IntegralRepresentationsOfGeneralLinearGroups (the weight representations and Green's
characters), WeilRepresentationsOnBanachSpacesOfData (Weil data, isotropic splittings, Hecke operators at split places),
GaloisRepresentationsOfUnitaryEigenforms (Hecke eigenforms), IdelicReciprocityCountsAndCyclotomicClassGroups (class
field theory of CM fields) and SecondMomentsOfPoincareSeries (where Layer 7 is used), and from earlier roadmaps
HermitianFormsAndLattices, GeometryOfNumbersAndQuadraticArithmetic and DiscreteSeriesCoefficientsAndAutomorphicMetrics.

Layer 1 is integration over quotients: the quotient integral is realised by a weight of total mass one on each orbit,
which also serves for actions that do not come from a subgroup; it includes unfolding, quotients in stages, Iwasawa
coordinates, and the weighted class sums `∑ f(g)/#(Γ ∩ gKg⁻¹)` that replace integrals on definite groups. Layer 2 is
the adeles of a totally complex field with the normalisations used: covolume one and self-duality of `E`, strong
approximation omitting finite places, a one-sided Poisson inequality, and the scaling of Haar measure by `GL_n`.
Layer 3 is hermitian spaces that are standard at every finite place and their adelic unitary groups: Landherr's
theorem in that case, Witt's theorem over the integral finite adeles, splittings along isotropic frames, the
Iwasawa decomposition, weak approximation and congruence levels. Layer 4 is reduction theory: adelic Minkowski
theorems, short bases, finite volume and a weak form of Weil's convergence criterion, Mahler's criterion, and the
integral over a definite quotient as a class sum. Layer 5 is forms of a cusp kernel on indefinite groups: they are
cuspidal, decay rapidly and are finite in number at each level. Layer 6 is algebraic modular forms: their pairing,
Hecke eigenforms, their identification with forms on the standard definite space, periods over a block subgroup and
the `p`-adic gauge. Layer 7 is the comparison of traces of Hecke-type operators on forms of two unitary groups that
differ only in their signs at the real places; it gives the equality of multiplicities used for the spanning theorem
(SecondMomentsOfPoincareSeries §2.3).

## Conventions and notation

Hermitian matrices and forms are conjugate-linear in the first variable: for a ring `R` with involution `z ↦ z̄` and
`J ∈ M_n(R)`, `h_J(u, v) = ū^T J v` and `A* = Ā^T`. `J` is hermitian if `J* = J`, and
`U(J)(R) = {g ∈ GL_n(R) : g* J g = J}`. A matrix `X ∈ M_{n×k}(R)` is *left invertible* if `YX = 1` for some
`Y ∈ M_{k×n}(R)`. `e(t) = exp(2πit)`.

| Symbol | Meaning | Defined |
|---|---|---|
| `E, E⁺, x ↦ x̄` | a CM field (from Layer 3 on), its maximal totally real subfield, complex conjugation | 2.1 |
| `Φ = (Φ_w)` | for each infinite place `w` of `E` a complex embedding `Φ_w` inducing it (a CM type when `E` is CM) | 2.1 |
| `f, rd_E, 𝔇` | the number of infinite places of `E`, its root discriminant `|d_E|^{1/[E:ℚ]}`, its different | 2.1 |
| 5040 condition | `E` contains a primitive root of unity of order `5040` | 2.1 |
| `𝔸, 𝔸_f, Ô` | the adeles `ℂ^Φ × 𝔸_f` of a totally complex `E`, the finite adeles, the integral finite adeles | 2.1 |
| `E_w, 𝒪_w, k_w, q_w, ϖ_w` | completion at a finite place `w`, its integers, residue field, its order, a uniformiser | 2.1 |
| `ψ, |·|_𝔸` | the standard additive character of `𝔸`, the module of an idele | 2.1 |
| `s` | a sign vector `s ∈ {±1}^n`, the same at every infinite place | 3.1 |
| `G_∞(s), G_f, G(s), K₀` | `∏_w U(diag s)(ℂ)`, `U(1_n)(𝔸_f)`, `G_∞(s) × G_f`, `G_f ∩ GL_n(Ô)` | 3.1 |
| level | an open subgroup `K ⊂ K₀` | 3.1 |
| `V = (J, x)` | a hermitian space with an adelic frame of signs `s` | 3.1 |
| `Γ_V, Γ_{V,f}, Λ_V` | its rational points in `G(s)` and in `G_f`, its lattice | 3.1 |
| `I_n` | the standard space `(1_n, 1)`, signs `(1, …, 1)` | 3.1 |
| `ι_w, T_{w,j}` | the embedding of `GL_n(E_w)` in `G_f` at a split place, the Hecke operators there | 3.1 |
| `K(a), K_H` | the principal level of `a ∈ 𝓞_E`, the level cut out by `H` at places pairwise non-conjugate | 3.9 |
| `∫_{H\X}`, cutoff | integration over a quotient by a weight of mass one on orbits | 1.1 |
| `S_{Γ,K}(f), I_{Γ,K}(f)` | the weighted class sum and the class integral | 1.4 |
| `λ(V), ht_V` | the first minimum (cut at `1`) and the height | 4.2 |
| `mass(n)` | the mass of the standard space | 4.4 |
| `e_l` | the discrete-series kernel of a doubled parameter `l = 2λ` | 5.1 |
| cusp kernel | a minimal idempotent kernel on `G_∞(s)` with moment and decay | 5.1 |
| `𝒜(V, e, K)` | the forms of type `e` and level `K` on `V` | 5.1 |
| `ρ_{κ,e}, ρ, W_{κ,e}, v⁺_l` | the representation of weight `(κ, e)` of `GL_n(ℂ)^Φ`, the representation `z ↦ ρ_{κ,e}(z̄)` of `U(n)^Φ`, their space, the highest vector for `l` | 6.1 |
| `φ♮` | the function on `G(1)` attached to an algebraic form | 6.1 |
| test function, `a ⋆ 1_K` | locally constant compactly supported function on `G_f`; the test function of `a ∈ ℂ[G_f]` | 7.1 |
| `J^V_S(φ)`, `I_γ` | the part of the geometric side with characteristic polynomials in `S`, the orbital integral | 7.1 |

The discrete-series coefficients `c_λ` of `U(p, q)`, their formal degrees `d(λ)`, the Haar measures on the real
unitary groups (normalised so that `U(n)` has mass one) and the gap condition on parameters are those of
HolomorphicDiscreteSeriesOfUnitaryGroups §§1.1, 1.4, 4.1. A doubled parameter `l ∈ ℤ^n` for the signs `s` has *gap `h`*,
as in HolomorphicDiscreteSeriesOfUnitaryGroups §4.1 (c), if its entries are distinct, congruent to `n − 1` modulo `2`,
and `|l_i − l_j| ≥ 2h` whenever `s_i ≠ s_j`. The weight representations of Layer 6 are modelled on the polynomial
representations of `GL_n` with their minor-product bases of IntegralRepresentationsOfGeneralLinearGroups §§1.1, 1.2,
and the labels and label idempotents of `GL_n(𝔽_q)` in 7.2 are those of
IntegralRepresentationsOfGeneralLinearGroups §5.3. Weil data of a CM field are those of
WeilRepresentationsOnBanachSpacesOfData §3.1.

Sums over infinite sets of classes are not used: a class sum is taken where the classes are finite in number, and a
class with infinite stabiliser has weight zero.

**Origin and method.** Every section that states something carries `*Origin:*` (`published:`, `adapted from`,
`particular to this proof:`, `this roadmap's own formulation:`, or `definitions and conventions`) and
`*Method of the formal proof:*`, which says how the shorter formal proof proves it; `[ShortProof]` names the file and
declaration of that proof. A contribution may state a result more generally or prove it otherwise.

## Layer 1: Integration over quotients and class sums

### 1.1 Quotient integrals by cutoffs

*Origin:* adapted from the published theory of invariant integration on quotients (Weil's formula) and unfolding:
here the integral over a quotient is a weighted integral on the space itself, for measurable actions that need not
come from a subgroup, with existence of the weight and independence of it in place of existence and uniqueness of a
quotient measure.

*Method of the formal proof:* (a) is Tonelli's theorem for the defining identity of a cutoff. (b) follows by unfolding
twice: both distributions are computed from `μ` through (a). For a proper action a cutoff is the quotient of a
compactly supported bump by the integral of its translates; for a discrete subgroup one takes a Borel fundamental
domain. Unimodularity compares the quotient integral of a right translate of the weight with that of the weight. The
library has the unfolding identity in Mathlib's model with a fundamental domain and a measure on `G ⧸ Γ`
(`QuotientGroup.integral_eq_integral_automorphize`); the bridge to the model here is not small.

This device stands in for the invariant measure on the orbit space; no comparison with that measure is used, and later
sections integrate over quotients only in this sense.

Let a group `H` with an s-finite measure `ν` invariant under inversion act measurably on a measure space `(X, μ)`, with
`μ` s-finite and `H`-invariant. A *cutoff* is a measurable `β : X → [0, ∞]` with `∫_H β(h·x) dν(h) = 1` for every
`x ∈ X`. For a measurable `H`-invariant `F`, `∫_{H\X} F` means `∫_X F·β dμ` (as a lower integral for `F ≥ 0`, as a
Bochner integral when `Fβ` is `μ`-integrable). For a discrete subgroup `Γ` of a second countable locally compact
group `G` acting by left multiplication, with counting measure on `Γ` and a left Haar measure `μ` on `G`, this is
`∫_{Γ\G}`, and `vol(Γ\G) = ∫_{Γ\G} 1`.

(a) For a cutoff `β`, the map `(x, h) ↦ h·x` carries `(βμ) × ν` to `μ`. Hence
`∫_X (∫_H f(h·x) dν(h)) β(x) dμ(x) = ∫_X f dμ` for measurable `f ≥ 0`, and for `μ`-integrable `f` with both sides
integrable.

(b) For a measurable `H`-invariant `F`, the distribution of `F` under `βμ` is the same for every cutoff `β`. More
generally, if `σ : (L, ϱ) → (H, ν)` is measure preserving, `(Z, m)` is a measure space, `T : Z → X` is measurable,
`ϱ` and `m` are s-finite, and `(z, l) ↦ σ(l)·T(z)` carries `m × ϱ` to `μ`, then `F` under `βμ` and `F ∘ T` under `m`
have the same distribution.

(c) A cutoff exists when `X` is a σ-compact Hausdorff space, the action is continuous and proper, and `ν` is a nonzero
right invariant measure finite on compact sets; in particular for a discrete subgroup `Γ` of `G` as above.

(d) For `Γ ⊂ G` discrete and `f ∈ L¹(G)`, `g ↦ ∑_{γ∈Γ} f(γg)` is integrable over `Γ\G` and
`∫_{Γ\G} ∑_{γ∈Γ} f(γg) dg = ∫_G f dμ`. If `vol(Γ\G) < ∞` then `μ` is also right invariant; if `Γ\G` is compact then
`vol(Γ\G) < ∞`.

(e) *Moving the quotient.* Let `R ⊂ G` be a subgroup with left invariant measures `ν` on `R` and `μ` on `G`, let
`Λ → R` be a homomorphism from a countable group, and let `β` be a measurable weight on `G` whose `Λ`-translates sum
to `1`. For `F` on `R × G` measurable, invariant under the diagonal action of `Λ` and integrable for `β(s)·(ν × μ)`:
`∫_G β(x) ∫_R F(s, x) dν(s) dμ(x) = ∫_R β(s) ∫_G F(s, x) dμ(x) dν(s)`.

(f) *Periodic means.* Let `B` be a second countable locally compact abelian group with Haar measure `μ` and `B₀ ⊂ B` a
discrete cocompact subgroup. If `F ∈ L¹(B)` and `G` is continuous and `B₀`-periodic with
`G(x) = ∑_{γ∈B₀} F(γ + x)` for all `x`, then the mean of `G` over `B/B₀` (Haar probability measure) is
`vol(B₀\B)⁻¹ ∫_B F dμ`.

AnalyticNumberTheoryPartII §5.3k states Weil's formula and the unfolding for closed subgroups with an invariant
measure on the orbit space; after identifying the two kinds of quotient integral it gives (d), not (a)–(c) for actions
that are not subgroups of a group acting on itself.

*Needs:* Mathlib `MeasureTheory.Measure.IsHaarMeasure`, `MeasureTheory.lintegral_prod` (Tonelli),
`MeasureTheory.integral_prod` (Fubini).

[ShortProof], `Lib/Adelic/QuotientMeasure/Basic.lean` (`New.IsCutoff`, `New.IsCutoff.measurePreserving`,
`New.identDistrib_orbitMeasure_of_unfold`, `New.identDistrib_orbitMeasure`, `New.hasCutoff_of_proper`,
`New.integral_quotMeasure_tsum`, `New.isMulRightInvariant_of_finite_covolume`,
`New.isFiniteMeasure_quotMeasure_of_cocompact`, `New.quotMean_tsum_eq_integral`);
`Lib/Adelic/QuotientMeasure/MovingTheQuotient.lean` (`New.integral_cutoff_swap`)

### 1.2 Quotients in stages and two vanishing criteria

*Origin:* adapted from the published theory of invariant integration on quotients (quotients in stages): here for the
quotient integrals of 1.1, with two criteria for the vanishing of the integral of an invariant function.

*Method of the formal proof:* (a) by uniqueness of Haar measure for the push-forward of the quotient integral; (b) by
1.1 (b) applied to `(z, a) ↦ i(a)T(z)`. For (c) the inner integral over `Γ\H` in (b) is computed in two ways, once
through the mean and once through the scaling of Haar measure of `H`; (d) is (c) for the closed group of left
translations preserving the defect `F(s u y) − c F(s y)`, with the Dirac mass at `u`.

Let `G`, `H` be second countable locally compact groups with left Haar measures `μ`, `ν`, and `Γ ⊂ G`, `Λ ⊂ H` discrete
subgroups; integrals over `Γ\G` and `Λ\H` are those of 1.1, with values in a real Banach space (a complex Banach space
in (c) and (d)).

(a) If `μ` and `ν` are also right invariant and `π : H → G` is a continuous surjective homomorphism with `π(Λ) ⊂ Γ`,
there is `c ∈ ℝ` with `∫_{Λ\H} F(π(r)) dr = c ∫_{Γ\G} F` for every measurable left `Γ`-invariant `F`.

(b) Let `i : H → G` be an injective homomorphism with `i(Λ) = Γ`, `(Z, m)` an s-finite measure space and `T : Z → G`
such that `(z, a) ↦ i(a)T(z)` carries `m × ν` to `μ`. If `F` is measurable, left `Γ`-invariant and integrable over
`Γ\G`, then `z ↦ ∫_{Λ\H} F(i(a)T(z)) da` is `m`-integrable and
`∫_{Γ\G} F = ∫_Z ∫_{Λ\H} F(i(a)T(z)) da dm(z)`. If moreover `ν` is right invariant and `i` is a closed embedding, then
for such `F` the function `g ↦ ∫_{Λ\H} F(i(a)g) da` is integrable over `i(H)\G` and
`∫_{Γ\G} F = ∫_{i(H)\G} ∫_{Λ\H} F(i(a)g) da dg`, the outer integral being the quotient integral (1.1) for the action of
`H` on `G` by left translation through `i`, with the measures `ν` and `μ`.

(c) Let `F` be continuous and left `Γ`-invariant, `H ⊂ G` a closed subgroup containing `Γ`, `(C, κ)` a probability
space, `t : G × C → H` measurable in its second argument, and `d ≥ 0` such that right translation by every `t(x, b)`
multiplies the Haar measure of `H` by `d`. If `a ∈ ℂ`, `a ≠ d`, and `∫_C F(s·t(x, b)·x) dκ(b) = a·F(sx)` for all
`s ∈ H` and `x ∈ G`, then `∫_{Γ\G} F = 0`.

(d) Let `F` be continuous, left `Γ`-invariant and integrable over `Γ\G`. If `F(uy) = c·F(y)` for all `y`, for some
`u ∈ G` and `c ∈ ℂ` with `|c| = 1`, `c ≠ 1`, then `∫_{Γ\G} F = 0`.

*Needs:* 1.1.

[ShortProof], `Lib/Adelic/QuotientMeasure/UnfoldingInStages.lean` (`New.exists_integral_comp_quotMeasure_eq_smul`,
`New.integral_quotMeasure_stages`, `New.integral_quotMeasure_eq_integral_cosetMeasure`,
`New.Exchange.exists_integral_stages_eq_mul`, `New.integral_quotMeasure_eq_zero_of_mean`,
`New.integral_quotMeasure_eq_zero_of_twist`)

### 1.3 Orbit unfolding and integration in Iwasawa coordinates

*Origin:* adapted from the published theory of the unfolding of Poincaré-type sums and of Iwasawa integration on
reductive groups: here for abstract groups with a decomposition `G = N·i(M)·K` given as a hypothesis, up to a constant
that is not computed, combined with a discrete quotient.

*Method of the formal proof:* (1) by uniqueness of Haar measure: the measure `dn dm dk` in the coordinates `i(m)nk` is
left and right invariant. (2) by unfolding in stages along `Γ = (Γ ∩ N)·i(Δ)` (1.2) and the compactness of
`(Γ ∩ N)\N`. (3) by indexing the orbit by `Γ/Γ_y` and 1.1 (d) for the pair `Γ_y ⊂ Γ`.

(1) Let `G` be a unimodular second countable locally compact group, `N ⊂ G` a closed unimodular subgroup, `K ⊂ G` a
compact subgroup, `M` a unimodular second countable locally compact group, `i : M → G` a continuous homomorphism with
`G = N·i(M)·K`, and `w : M → (0, ∞)` continuous with `∫_N f(i(m) n i(m)⁻¹) dn = w(m) ∫_N f(n) dn`. Then there is
`d ∈ [0, ∞]` with `∫_K ∫_M ∫_N f(i(m)nk) dn dm dk = d·∫_G f` for all measurable `f ≥ 0`.

(2) If moreover `i(a) ∈ N` only for `a = 1`, and `Γ ⊂ G` is discrete with `Γ ∩ N` cocompact in `N` (which makes `N`
unimodular, 1.1 (d), so that this need not be assumed) and `Γ = (Γ ∩ N)·i(Δ)` for a countable subgroup `Δ ⊂ M`, there
is `c ≠ 0` such that for every measurable `F` on `G`, left invariant under `N` and under `Γ`, integrability of
`(m, k) ↦ w(m)F(i(m)k)` on `(Δ\M) × K` implies integrability of `F` over `Γ\G`, and
`∫_{Γ\G} F = c ∫_{Δ\M} ∫_K w(m) F(i(m)k) dk dm`.

(3) Let a discrete subgroup `Γ ⊂ G` act through a homomorphism on a countable set `Y`, and let `k_y` (`y ∈ Y`) be
measurable functions on `G` with `k_{γy}(γx) = k_y(x)`. Then `∫_{Γ\G} ∑_{z∈Γy} k_z = ∫_{Γ_y\G} k_y`, `Γ_y` the
stabiliser of `y`, either side being absolutely integrable if the other is.

AdelicAlgebraicGroups §3.1 states the Iwasawa integration formula for connected reductive groups with an admissible
maximal compact subgroup and the constant fixed; (1)–(2) are the abstract statements the formal proof checks by hand
for one parabolic subgroup of a unitary group (the stabiliser of an isotropic line), where the constant is not needed.

*Needs:* 1.1, 1.2.

[ShortProof], `Lib/Adelic/QuotientMeasure/IwasawaUnfolding.lean` (`New.integral_tsum_eq_integral_tsum_block`,
`New.integral_tsum_orbit_eq_integral_stabilizer`, `New.lintegral_iwasawa`, `New.integral_quotMeasure_iwasawa`)

### 1.4 Level spaces, Hecke operators and class sums

*Origin:* definitions and conventions.

Let `G` be a group, `Γ, K ⊂ G` subgroups, `π` a representation of `G` on a module `W` over a commutative ring `A`.

- For a character `χ : K → A^×`, the *level space* `W^{K,χ} = {v ∈ W : π(k)v = χ(k)v for all k ∈ K}`; `W^K` for
  `χ = 1`.
- For `f : G → A` with `f(gk) = f(g)` and finitely many cosets `gK` in its support, the *Hecke operator*
  `π(f)v = ∑_{gK} f(g)π(g)v` on `v ∈ W^K` (independent of the representatives); for `g ∈ G` the operator of the
  indicator of `KgK`.
- The *stabiliser* `Γ_g = Γ ∩ gKg⁻¹`. For `f : G → W` with `W` a `ℚ`-vector space, left `Γ`-invariant and right
  `K`-invariant, the *class sum* `S_{Γ,K}(f) = ∑_{ΓgK} f(g)/#Γ_g` over `Γ\G/K` (a class with infinite stabiliser has
  weight `0`).
- `(Γ, K)` has *finite type* if `G` is a topological group, `K` is compact and open, `Γ\G/K` is finite and every `Γ_g`
  is finite.
- For `(Γ, K)` of finite type and a left `Γ`-invariant `f` that is right invariant under an open `J ⊂ K`, the *class
  integral* `I_{Γ,K}(f) = [K : J]⁻¹·S_{Γ,J}(f)` (the integral over `Γ\G` for the Haar measure with `vol(K) = 1`; 1.5
  shows that it does not depend on `J`).
- For a compact subgroup `H` of a topological group `G` and a representation in which every vector is fixed by an open
  subgroup, the *compact mean* `e_H v = [H : H_v]⁻¹ ∑_{h ∈ H/H_v} π(h)v` (`H_v ⊂ H` open, fixing `v`).

For `K` compact and `H ⊂ G` open, `vol(H ∩ K)·[K : H ∩ K] = vol(K)` for every left Haar measure.

[ShortProof], `Lib/Adelic/Hecke/Basic.lean` (`New.levelSpace`, `New.heckeFun`, `New.heckeCoset`, `New.classAut`,
`New.classSum`, `New.relIndex_mul_measure_inf`, `New.heckeFun_eq_sum`, `New.heckeFun_heckeFun`);
`Lib/Adelic/Hecke/ClassSums.lean` (`New.HasFiniteType`, `New.classIntegral`, `New.compactMean`)

### 1.5 Change of level for class sums, and means over compact subgroups

*Origin:* adapted from Gross (1999), §§4–8, the class set with its finite stabilisers, the mass, the inner product
weighted by the inverse stabiliser orders and the Hecke operators with their adjoints: here for an abstract
topological group with subgroups `Γ` and `K`, for functions with values in a `ℚ`-vector space, with the means over
compact subgroups.

*Method of the formal proof:* double counting of the fibres of `Γ\G/K′ → Γ\G/K`: over the class of `g`, the classes of
`K′` are the `Γ_g`-orbits on `K/a⁻¹K′a`, and the orbit-stabiliser count gives the index. The compact mean is an average
over the finite quotient `H/H_v`.

(a) Let `G` be a topological group and `Γ, K, K′ ⊂ G` subgroups with `(Γ, K)` and `(Γ, K′)` of finite type, and
`a ∈ G` with `a⁻¹K′a ⊂ K`. For `f : G → W` (`W` a `ℚ`-vector space) left `Γ`-invariant and right `K`-invariant,
`S_{Γ,K′}(g ↦ f(ga)) = [K : a⁻¹K′a]·S_{Γ,K}(f)`. Hence `I_{Γ,K}(f)` does not depend on the open `J ⊂ K` fixing `f`; it
is additive, commutes with additive maps of the values, and `I_{Γ,K}(g ↦ f(gb)) = I_{Γ,K}(f)` for `b ∈ G`.

(b) Let `H` be a compact subgroup of a topological group `G` and `(π, V)` a complex representation in which every
vector is fixed by a neighbourhood of `1`. Then `e_H` is a well defined linear projector onto `V^H`, with
`π(h)e_H = e_H = e_Hπ(h)` for `h ∈ H`; it commutes with every linear map that commutes with `π(H)`; and
`B(e_H x, y) = B(x, e_H y)` for every `π`-invariant positive definite hermitian form `B`.

*Needs:* 1.4.

[ShortProof], `Lib/Adelic/Hecke/ClassSums.lean` (`New.classSum_eq_relIndex_smul`, `New.classIntegral_eq_classSum_mul`,
`New.classIntegral_sum`, `New.compactMean_eq_self`, `New.IsUnitary.compactMean_adjoint`)

## Layer 2: Adeles and ideles of a totally complex field

### 2.1 Adeles, the standard character and Haar measures

*Origin:* definitions and conventions.

Let `E` be a totally complex number field with a complex embedding `Φ_w` chosen for each infinite place `w`; `f` is the
number of infinite places, `r₂ = f`, `d_E` the discriminant and `rd_E = |d_E|^{1/[E:ℚ]}`. When `E` is a CM field, `E⁺`
is its maximal totally real subfield, `x ↦ x̄` complex conjugation, and the `Φ_w` form a CM type. The *5040 condition*
on a CM field `E` is that `E` contains a primitive root of unity of order `5040`.

- The adele ring `𝔸` of `E` is identified with `ℂ^Φ × 𝔸_f` through `Φ` (each `E_w` is `ℂ` by `Φ_w`); `E → 𝔸` is the
  diagonal embedding, `Ô = ∏_w 𝒪_w ⊂ 𝔸_f` the integral finite adeles. For a finite place `w`: `E_w`, `𝒪_w`, `k_w`,
  `q_w = #k_w`, a uniformiser `ϖ_w`. For CM `E`, conjugation acts on `𝔸_f` and on `𝔸` componentwise, and a finite place
  `w` is *split* if `w̄ ≠ w`.
- `ψ_f` is the continuous character of `𝔸_f` that is trivial on `Ô` and equals `e(Tr_{E/ℚ} a)` at `a ∈ E` (it is
  unique, as `𝔸_f = E + Ô`); the *standard character* is `ψ(x) = e(−∑_w 2 Re x_w)·ψ_f(x_f)`.
- Haar measures: on `E_w` the one with `vol(𝒪_w) = 1`; on `𝔸_f` the one with `vol(Ô) = 2^{r₂}/√|d_E|`; on each `ℂ`
  Lebesgue measure; on `𝔸` the product; on `𝔸^n` and `M_{m×n}(𝔸)` the products.
- The *module* of an idele `a` is `|a|_𝔸 = ∏_w |a_w|² · ∏_v ‖a_v‖_v` (normalised absolute values at the finite places),
  and `|a|_f = ∏_v ‖a_v‖_v` for a finite idele.

[ShortProof], `Lib/Adelic/Adeles/Basic.lean` (`New.𝔸`, `New.toAdele`, `New.Ô`, `New.CMType`, `New.HasPrimitiveRoot5040`);
`Lib/Adelic/Adeles/AdditiveCharacter.lean` (`New.ψf`, `New.stdAddChar`, `New.volÔ`, `New.volume_Ô`);
`Lib/Adelic/Adeles/IdeleModulus.lean` (`New.ideleAbs`, `New.finIdeleAbs`)

### 2.2 The field is a self-dual lattice of covolume one in its adeles

*Origin:* adapted from the published theory of the additive duality between a number field and its adeles: here for a
totally complex field with the normalisations of 2.1, with an explicit fundamental domain.

*Method of the formal proof:* a fundamental domain `F × Ô` for `E` acting on `ℂ^Φ × 𝔸_f`, with `F` a fundamental
parallelotope of `𝓞_E` in the Minkowski embedding, whose volume `2^{−r₂}√|d_E|` cancels that of `Ô`. For duality: an
adele that pairs trivially with `E` has finite part in `E` plus the inverse different after translation, and its
archimedean part is then determined by the rationality of the traces it produces.

(a) `E` is discrete in `𝔸`, `𝔸/E` is compact, and for some `R > 0` the set `B(0, R) × Ô` (`B(0, R)` the closed ball in
`ℂ^Φ`) contains a measurable fundamental domain for `E` of measure one; so `𝔸/E` has measure one. The same holds for
`E^n ⊂ 𝔸^n` and `M_{m×n}(E) ⊂ M_{m×n}(𝔸)`. Consequently a compact subset of `M_{m×n}(𝔸)` contains only finitely many
rational matrices.

(b) `ψ` is trivial on `E`. If `x ∈ 𝔸` has `ψ(ax) = 1` for all `a ∈ E`, then `x ∈ E`; if `ψ(ux) = 1` for all `u ∈ 𝔸`,
then `x = 0`. So `a ↦ (x ↦ ψ(ax))` is an injective homomorphism from `E` to the continuous unitary characters of `𝔸/E`
whose common kernel is `E`; the same holds for `a ∈ M_{n×m}(E) ↦ (x ↦ ψ(tr(a x)))` on `M_{m×n}(𝔸)`.

(c) For CM `E`, `ψ(½(x + x̄)) = ψ(x)` for `x ∈ 𝔸`, and `ψ_f(½(x + x̄)) = ψ_f(x)` for `x ∈ 𝔸_f`.

AnalyticNumberTheoryPartII §5.3h, a general theorem on Schwartz–Bruhat functions and Poisson summation over every
number field, also implies (a) and (b).

*Needs:* 2.1; Tau Ceti `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`,
`TauCeti.GlobalNumberFields.compactSpace_quotient_principalSubgroup`.

[ShortProof], `Lib/Adelic/Adeles/AdditiveCharacter.lean` (`New.exists_hasFundDomain_toAdele`,
`New.isCovolOneLattice_ratAdeles`, `New.isCovolOneLattice_ratVectors`, `New.isCovolOneLattice_ratMatrices`,
`New.finite_setOf_map_toAdele_mem`); `Lib/Adelic/Adeles/StrongApproximation.lean` (`New.stdAddChar_toAdele`,
`New.mem_ratAdeles_of_stdAddChar_eq_one`, `New.eq_zero_of_forall_stdAddChar_eq_one`, `New.isDualFamily_ratAdeles`,
`New.isDualFamily_ratMatrices`, `New.stdAddChar_inv_two_mul_add_star`)

### 2.3 Strong approximation omitting finite places, and a one-sided Poisson inequality

*Origin:* adapted from the published theory of strong approximation for the additive group and of Poisson summation in
the adeles: here strong approximation omits a nonempty set of finite places and keeps the infinite places, and Poisson
summation is an inequality for nonnegative integrable functions that are lower semicontinuous at finitely many
rational points.

*Method of the formal proof:* (a) by duality: the closure of `E + 𝔸_S` is a closed subgroup containing `E`; a
character of `𝔸/E` trivial on it is `ψ(r·)` with `r ∈ E` (2.2 (b)), and `ψ(r·)` trivial on `𝔸_S` forces `r = 0`. The
matrix form follows coordinatewise after moving by `x`. (b) the function is smoothed by a bump on `𝔸/E`; Fourier
inversion on the compact group `𝔸/E` with the dual family of 2.2 (b) bounds the periodised smoothed function by `S`
(1.1 (f)), and lower semicontinuity lets the bump shrink.

Let `E` be totally complex. For a set `S` of finite places, `𝔸_S ⊂ 𝔸` is the set of adeles that vanish at the infinite
places and at the finite places outside `S`.

(a) If `S` is nonempty, `E + 𝔸_S` is dense in `𝔸`. For CM `E`, every `x ∈ GL_n(𝔸)` and every `m`, the set
`{x⁻¹ξ + u : ξ ∈ M_{n×m}(E), u ∈ M_{n×m}(𝔸_S)}` is dense in `M_{n×m}(𝔸)`.

(b) Let `F : 𝔸 → ℝ` be integrable with `F ≥ 0`, `T ⊂ E` finite with `F` lower semicontinuous at every point of `T`,
and `S ≥ 0` such that `∑_{ξ∈Y} |∫_𝔸 ψ(−ξx)F(x) dx| ≤ S` for every finite `Y ⊂ E` (Haar measure of 2.1). Then
`∑_{t∈T} F(t) ≤ S`.

*Needs:* 1.1, 2.1, 2.2.

[ShortProof], `Lib/Adelic/Adeles/StrongApproximation.lean` (`New.strong_approximation`,
`New.Exchange.denseRange_rat_matrix_add`, `New.IsDualFamily.sum_le_of_fourier`)

### 2.4 Scaling of Haar measure by `GL_n` over the adeles, and idelic generators of ideals

*Origin:* adapted from the published theory of the module of an idele: here the scaling of Haar measure on vectors and
matrices over the adeles by `GL_n`, through the determinant, with idelic generators of ideals.

*Method of the formal proof:* the local scaling `‖a‖_v` of Haar measure on `E_v` by `a ∈ E_v^×`, the product over the
places of the restricted product, and the passage to `GL_n` through the factor `|det|` of a general element of
`GL_n` acting on a Haar measure. The module as a continuous homomorphism on the ideles and the product formula are in
the library (`TauCeti.GlobalNumberFields.ideleNorm`, `TauCeti.GlobalNumberFields.ideleNorm_unitEmbedding`); the local
Haar character is `IsDedekindDomain.HeightOneSpectrum.distribHaarChar_adicCompletion`.

Let `E` be a number field, totally complex where `𝔸` occurs.

(a) For a finite idele `a`, multiplication by `a` multiplies Haar measure on `𝔸_f` by `|a|_f`; at a finite place `w`,
multiplication by `a ∈ E_w^×` multiplies Haar measure on `E_w` by `‖a‖_w`.

(b) For `a ∈ GL_n(𝔸_f)` and every Haar measure `μ` on `𝔸_f^n`, `μ(aA) = |det a|_f·μ(A)` for measurable `A`.

(c) For `a ∈ GL_n(𝔸)`, `vol(aA) = |det a|_𝔸·vol(A)` on `𝔸^n` with the measure of 2.1; for `a ∈ GL_n(𝔸)` and
`b ∈ 𝔸^×`, the map `X ↦ aXb` on `M_{n×1}(𝔸)` multiplies the measure by `|b^n det a|_𝔸`.

(d) For CM `E`: `|ā|_𝔸 = |a|_𝔸`, and `|a|_𝔸 = 1` when `āa = 1`.

(e) (idelic generators) For a nonzero ideal `I ⊂ 𝓞_E` there are a finite idele `t ∈ Ô` with `t_w = 1` at the places not
dividing `I` and `v_w(t_w)` the multiplicity of `w` in `I` elsewhere, and a ring homomorphism `Ô → 𝓞_E/I` extending the
reduction of `𝓞_E`, whose kernel is `IÔ = tÔ`; and for `y ∈ 𝔸_f`, `cy ∈ Ô` for all `c ∈ I` if and only if `ty ∈ Ô`.

*Needs:* 2.1; Tau Ceti `TauCeti.GlobalNumberFields.ideleNorm`, `TauCeti.GlobalNumberFields.ideleNorm_unitEmbedding`.

[ShortProof], `Lib/Adelic/Adeles/IdeleModulus.lean` (`New.genIndex_eq_inv_finIdeleAbs`, `New.genIndex_eq_inv_norm`,
`New.map_mulVec_haar_finAdele`, `New.volume_map_mulVec_adele`, `New.volume_map_mul_mul_adele`, `New.ideleAbs_star`,
`New.ideleAbs_eq_one_of_mem_unitary`); `Lib/Adelic/Adeles/LocalFactors.lean`
(`New.exists_reduction_and_idele_generator`)

## Layer 3: Hermitian spaces and unitary groups over the adeles

### 3.1 Hermitian spaces with an adelic frame and their unitary groups

*Origin:* definitions and conventions.

Let `E` be a CM field with a CM type `Φ` (2.1) and `n ≥ 1`.

- A *sign vector* is `s ∈ {±1}^n`; `diag(s)` is the diagonal matrix. The same `s` is used at every infinite place.
- `G_∞(s) = ∏_w U(diag s)(ℂ)` over the infinite places `w` (each factor `≅ U(p, q)`, `p = #{i : s_i = 1}`), with the
  product of the Haar measures of HolomorphicDiscreteSeriesOfUnitaryGroups §1.1 (c). `G_f = U(1_n)(𝔸_f) = {g ∈ GL_n(𝔸_f) :
  g*g = 1}` with the subspace topology, and `G(s) = G_∞(s) × G_f`; `G_f` is embedded in `G(s)` by `g ↦ (1, g)`.
  `K₀ = G_f ∩ GL_n(Ô)`. A *level* is an open subgroup `K ⊂ K₀`. `G_f` carries the Haar measure with `vol(K₀) = 1`,
  `G(s)` the product measure. For a finite place `w`, `g_w ∈ GL_n(E_w)` is the component of `g ∈ G_f`.
- A *hermitian space with an adelic frame of signs `s`* is a pair `V = (J, x)` of a hermitian `J ∈ M_n(E)` and
  `x ∈ GL_n(𝔸)` with `x*Jx = diag(s)` at every infinite place (`J` read through `Φ_w`) and `x*Jx = 1_n` at every
  finite place. So `(E^n, h_J)` has signature `(p, n − p)` at every infinite place and is isometric to the standard
  form `⟨1, …, 1⟩` at every finite place.
- Its *rational points*: `γ ↦ x⁻¹γx` embeds `U(J)(E⁺) = {γ ∈ GL_n(E) : γ*Jγ = J}` in `G(s)`; the image is `Γ_V`, and
  `Γ_{V,f}` is its image in `G_f`. Its *lattice* is `Λ_V = {y ∈ E^n : (x⁻¹y)_f ∈ Ô^n}`, and the *length* `‖y‖_V` is the
  Euclidean norm of the vector `((x⁻¹y)_{w,i})_{w,i} ∈ ℂ^{Φ×n}`.
- The *moved space* `V·g = (J, xg)` for `g ∈ G(s)`; the *standard space* `I_n = (1_n, 1)`, of signs `(1, …, 1)`; the sum
  `V ⊕ V′` of spaces with frames (signs concatenated), and reindexing are spaces; under the 5040 condition so is the
  negative `(−J, εx)` of signs `−s`, where `ε` is the idele equal to `1` at the infinite places whose finite part is a
  unit of `Ô` with `ε̄ε = −1` (3.4 (a)).
- At a split place `w`, `ι_w : GL_n(E_w) → G_f` is the homomorphism with component `g` at `w`, the conjugate of
  `(g^T)⁻¹` at `w̄`, and `1` elsewhere. For a representation of `G_f` and `0 ≤ j ≤ n`, `T_{w,j}` is the Hecke operator
  (1.4) of the double coset of `diag(ϖ_w 1_j, 1_{n−j})` under `GL_n(𝒪_w)`, acting through `ι_w` on the vectors fixed
  by `ι_w(GL_n(𝒪_w))`, as in WeilRepresentationsOnBanachSpacesOfData §9.2.
- Integrals over `Γ_V\G(s)` are those of 1.1.

[ShortProof], `Lib/Adelic/Unitary/Defs.lean` (`New.Gf`, `New.G`, `New.GInf`, `New.stdLevel`, `New.IsLevel`,
`New.Space`, `New.Space.ratEmbed`, `New.Space.Γ`, `New.Space.Γf`, `New.Space.baseLattice`, `New.stdSpace`,
`New.ofSplitPlace`, `New.heckeGL`); `Lib/Adelic/Unitary/ComponentsAndBlockSums.lean` (`New.Space.sum`,
`New.Space.neg`, `New.Space.move`, `New.Space.reindex`); `Lib/Weil/Unramified/SplitHecke.lean` (`New.heckeSplit`)

### 3.2 First properties of the adelic unitary groups

*Origin:* adapted from the published theory of adelic points of algebraic groups: here for the matrix groups of 3.1.

*Method of the formal proof:* (a) the rational matrices are discrete in the adelic ones (2.2 (a)); for definite signs
the archimedean factor is compact. (b) the restricted product structure of `𝔸_f` and the identity `g*g = 1` read at
`w` and `w̄`. (c) linear algebra. (d) the 5040 condition gives an integral finite idele `ν` with `ν̄ν = −1`, which turns
`diag(s)` into `1_n` at every finite place.

(a) `g ↦` (the adelic matrix of `g`) is a closed embedding of `G(s)` in `M_n(𝔸)`. `Γ_V` is discrete in `G(s)`; for
`s = (1, …, 1)`, `Γ_{V,f}` is discrete in `G_f`.

(b) For `g ∈ G_f` and a finite place `u` with `ū = w`, `g_w` is the conjugate of `((g_u)⁻¹)^T`; `g_w ∈ GL_n(𝒪_w)` for
almost all `w`, and `K₀ = {g : g_w ∈ GL_n(𝒪_w) for all w}`. For a set `S` of finite places, every `g` is `ab` with `a`
supported on `S ∪ S̄` and `b` trivial there, both in `K₀` if `g ∈ K₀`. A subgroup of `G_f` containing `K₀` and the
elements supported on `{w, w̄}` for every `w` is `G_f`. At a split place `w`, `ι_w` is a continuous injective
homomorphism onto the elements supported on `{w, w̄}`, and `ι_w(g) ∈ K₀` if and only if `g ∈ GL_n(𝒪_w)`; the same holds
for a finite set of split places pairwise non-conjugate.

(c) The matrix `J` of a space is invertible and hermitian, and an adelic matrix preserving the form `x*Jx` of 3.1 is an
element of `G(s)`.

(d) Under the 5040 condition, for every sign vector `s` there is a space with an adelic frame of signs `s`.

*Needs:* 2.1, 2.2, 3.1.

[ShortProof], `Lib/Adelic/Unitary/WeakApproximation.lean` (`New.G.isClosedEmbedding_adeleMatrix`, the instance
`DiscreteTopology W.Γf`); `Lib/Adelic/Adeles/StrongApproximation.lean` (`New.Space.discreteTopology_Gamma`);
`Lib/Adelic/Unitary/ComponentsAndBlockSums.lean` (`New.Gf.atPlace_star`, `New.Gf.exists_supportedOn_mul_trivialOn`,
`New.Gf.mem_of_stdLevel_le_of_supportedOn_le`, `New.range_ofSplitPlace`, `New.ofSplitPlace_mem_stdLevel`,
`New.ofSplitPlaces`, `New.Weil.normNegOne`, `New.signedSpace`); `Lib/Adelic/Unitary/GramMatrix.lean`
(`New.Space.isUnit_J`, `New.Space.isHermitian_J`, `New.G.ofMatrix`)

### 3.3 Landherr's theorem for locally standard spaces, and the Hasse principle for unitary cocycles

*Origin:* adapted from Landherr (1936), the Hasse principle for Hermitian forms over a quadratic extension of number
fields, as stated in Kirschmer (2016), Theorem 2.4.1: here for spaces that are isometric to the standard form at
every finite place, with the same signs at all infinite places, over a CM field with the 5040 condition; with the
representation of `1` by a possibly degenerate form and the Hasse principle for unitary cocycles of a cyclic
extension of prime degree.

*Method of the formal proof:* Hasse's norm theorem and strong approximation (2.3) in place of the Hasse–Minkowski
theorem. A totally positive element of `E⁺` that is locally a sum of two squares in a quadratic algebra is a global norm;
this gives (b), representing `1` over `E` one column at a time, and an induction on the columns gives a rational
orthogonal frame with the prescribed signs, which is (a). For (c), Hilbert's theorem 90 for `GL_n` gives a rational
splitting, which (a) corrects to a unitary one. The library has Hasse's norm theorem for cyclic extensions
(`TauCeti.ClassFieldTheory.cyclicHasseNorm`).

Let `E` be a CM field with the 5040 condition.

(a) If `V = (J, x)` and `V′ = (J′, x′)` are spaces with adelic frames of the same signs `s`, there is `a ∈ GL_n(E)` with
`a*Ja = J′`. Moreover `a` and `g ∈ G(s)` can be chosen with `x′ = a⁻¹xg` and `x⁻¹(aγa⁻¹)x = g·(x′⁻¹γx′)·g⁻¹` for all
`γ ∈ U(J′)(E⁺)`; so the rational points of `V` and `V′` are conjugate in `G(s)`.

(b) A hermitian `K ∈ M_n(E)`, not necessarily invertible, that represents `1` over `𝔸` (`z*Kz = 1` for some
`z ∈ 𝔸^n`) represents `1` over `E`.

(c) Let `E′/E` be a Galois extension of CM fields of prime degree, `σ` a generator of its group, and `s ∈ U(1_n)(E′)`
with `s·σ(s)·…·σ^{[E′:E]−1}(s) = 1`. If `s = uσ(u)⁻¹` for some `u` in the finite adelic unitary group `U(1_n)(𝔸_{E′,f})`,
then `s = gσ(g)⁻¹` for some `g ∈ U(1_n)(E′)`.

HermitianFormsAndLattices §3.1 (Landherr's theorem for every quadratic extension of number fields) also implies (a);
(b) for invertible `K` is a case of HermitianFormsAndLattices §3.5.

*Needs:* 2.1, 2.3, 3.1, 3.2; Tau Ceti `TauCeti.ClassFieldTheory.cyclicHasseNorm`.

[ShortProof], `Lib/Adelic/Landherr.lean` (`New.Space.landherr`, `New.Space.exists_x_eq_and_ratEmbed_conj_eq`,
`New.Core.exists_form_eq_one`, `New.Core.exists_rat_frame_of_adelic`, `New.exists_sq_add_sq_quadraticAlgebra`,
`New.U.hasse_principle_coboundary`)

### 3.4 Witt's theorem over the integral finite adeles

*Origin:* adapted from Kirschmer (2016), Theorem 3.3.3, Proposition 3.3.5 and Theorem 3.3.6, after Jacobowitz (1962)
and Shimura (1964), the unimodular Hermitian lattices at split, unramified and ramified nondyadic places, their
conjugacy and their diagonal unit bases, and from Scharlau (1985), Chapter 7, Witt's theorems for trace-valued
ε-Hermitian forms over a field with involution: here over the integral finite adeles of a CM field with the 5040
condition, at all finite places at once, with Witt's extension theorem for primitive frames of equal, possibly
degenerate, Gram matrix.

*Method of the formal proof:* the 5040 condition gives a skew unit `z ∈ Ô` (`z − z̄` invertible) and makes every unit
of `Ô` fixed by conjugation a norm. An orthonormal frame is built column by column from these norms; Witt's theorem is
proved over `Ô` with quasi-reflections `v ↦ v − σ⁻¹h(u, v)u` (`σ + σ̄ = h(u, u)`) and Eichler maps with integral data,
as over a field (HermitianFormsAndLattices §1.1).

Let `E` be a CM field with the 5040 condition.

(a) Every unit `u ∈ Ô` with `ū = u` is `ȳy` for some `y ∈ Ô^×`.

(b) Every hermitian `b ∈ M_n(Ô)` invertible over `Ô` satisfies `k*bk = 1` for some `k ∈ GL_n(Ô)`.

(c) If `X, Y ∈ M_{n×k}(𝔸_f)` are primitive (matrices over `Ô` with a left inverse over `Ô`) and `X*X = Y*Y`, then
`gX = Y` for some `g ∈ K₀`.

(d) (over any commutative ring with involution) For a hermitian `J`, an isotropic `x`, a vector `u` with `h(u, x) = 0`
and `ς` with `ς + ς̄ = h(u, u)`, the Eichler map `v ↦ v + h(u, v)x − h(x, v)(u + ςx)` is an isometry of `h_J`.

*Needs:* 2.1, 3.1; HermitianFormsAndLattices §1.1 (b) (Witt's extension theorem over a field).

[ShortProof], `Lib/Adelic/Witt/WittTheorem.lean` (`New.exists_unit_star_mul_self_eq`, `New.exists_orthonormal_Ô`,
`New.exists_orthonormal_frame_Ô`, `New.witt_Ô`, `New.witt_Ô_of_orthonormal`, `New.exists_unitary_eq_eichlerMap`,
`New.witt_of_quasiReflection_mem`)

### 3.5 Splittings along isotropic frames

*Origin:* adapted from Scharlau (1985), Chapter 7, and Knus (1991), the Witt decomposition of a Hermitian space over a
field with involution: here along an isotropic frame of a space with an adelic frame, with a complement that is again
standard at every finite place.

*Method of the formal proof:* dual isotropic vectors are found over `E`; the complement has the right local invariants,
and Landherr's theorem (3.3) and Witt's theorem over `Ô` (3.4) give it an adelic frame.

Let `E` be a CM field with the 5040 condition, `V = (J, x)` a space with an adelic frame of signs `s`, and
`k ∈ M_{n×p}(E)` left invertible with `k*Jk = 0`. Then there are `m ≥ 0`, a sign vector `s₀ ∈ {±1}^m`, a space
`V₀ = (J₀, x₀)` with an adelic frame of signs `s₀`, and `l ∈ M_{n×p}(E)`, `i ∈ M_{n×m}(E)` with `l*Jl = 0`, `l*Jk = 1`,
`i*Ji = J₀`, `i*Jk = 0`, `i*Jl = 0`, such that `E^n` is the direct sum of the column spans of `k`, `i` and `l` (a
splitting of `V` over `V₀` along `k`, as in WeilRepresentationsOnBanachSpacesOfData §5.1); in particular `n = m + 2p`,
and the number of `+1` and of `−1` in `s` is each at least `p`.

The formal proof proves it for CM fields with Weil data (WeilRepresentationsOnBanachSpacesOfData §3.1), which include
the 5040 condition.

*Needs:* 3.1, 3.3, 3.4; HermitianFormsAndLattices §1.1 (b).

[ShortProof], `Lib/Adelic/Witt/IwasawaDecomposition.lean` (`New.Space.exists_splitting`,
`New.Space.card_eq_of_perp_subset`, `New.Space.card_le_card_preimage_of_isotropic`)

### 3.6 The Iwasawa decomposition of the adelic unitary group

*Origin:* adapted from the published theory of the Iwasawa decomposition of reductive groups over local fields and
over the adeles: here for the adelic unitary group of a space with an adelic frame, its maximal compact subgroup
`K_∞K₀` and the stabilisers of isotropic flags of a splitting.

*Method of the formal proof:* the abstract step: if every left invertible frame can be made block triangular by
`GL_p` and any two isotropic frames of the admissible kind are carried to each other by the compact group, then
`g = (radical)(Levi)κ`. The compact group acts transitively by Witt's theorem over `Ô` (3.4, with Gram matrix `0`) at the
finite places and by the unitary group of `ℂ^n` at the infinite places.

Let `E` be a CM field with the 5040 condition, `V` a space with an adelic frame of signs `s`, and `V = ⟨k⟩ ⊕ V₀ ⊕ ⟨l⟩`
a splitting along an isotropic frame `k` of `p` vectors (3.5). Let `K_max ⊂ G(s)` be the compact subgroup of the `g`
whose adelic matrix is unitary at every infinite place and integral at every finite place (so `K_max = K_∞ × K₀` with
`K_∞ = ∏_w U(diag s)(ℂ) ∩ U(n)`). For every weight function `wt : {1, …, p} → ℕ` (grouping the frame into blocks)
and every `g ∈ G(s)` there is `κ ∈ K_max` such that `gκ` carries the frame `k` to `k·b` for some `b ∈ GL_p(𝔸)` block
triangular for `wt`, and `gκ` is the product of an element of the unipotent radical of the stabiliser of the span of
`k` and of the Levi element `(b, u)` with `u ∈ G(s₀)` the adelic group of `V₀`.

The formal proof proves it for CM fields with Weil data, which include the 5040 condition. AdelicAlgebraicGroups §3.1
states `G(𝔸) = P(𝔸)K` for connected reductive groups and admissible maximal compact subgroups; whether `K_max` is
admissible there is not used.

*Needs:* 3.1, 3.4, 3.5.

[ShortProof], `Lib/Adelic/Witt/IwasawaDecomposition.lean` (`New.maxCompact`, `New.isCompact_maxCompact`,
`New.Space.Splitting.iwasawa_of_witt`, `New.Space.Splitting.iwasawa`,
`New.Space.Splitting.exists_eq_radicalElement_mul_levi_mul_isAdapted`)

### 3.7 Smooth local sections of the isotropic orbit

*Origin:* adapted from Scharlau (1985), Chapter 7, Witt's theorems for trace-valued ε-Hermitian forms over a field with
involution: here over `ℂ`, for one isotropic vector, with an isometry depending smoothly on the target vector.

*Method of the formal proof:* explicit isometries (quasi-reflections and Eichler maps, 3.4 (d)) whose coefficients are
smooth functions of the target vector near the base point.

Let `J ∈ M_n(ℂ)` be invertible and hermitian.

(a) If `x₀`, `y₀` are isotropic with `h_J(y₀, x₀) ≠ 0`, there are a neighbourhood `N` of `x₀` and a map `k : N → U(J)(ℂ)`,
smooth as a matrix-valued function of the real coordinates, with `k(x)y₀ = x` for every isotropic `x ∈ N`.

(b) For `J = diag(s)` and isotropic `x₀ ≠ 0` there is such a smooth `k` near `x₀` with `k(x)x₀ = x` for every isotropic
`x` near `x₀`.

*Needs:* 3.4 (d).

[ShortProof], `Lib/Adelic/Witt/SmoothWitt.lean` (`New.Exchange.exists_contDiff_carrying_isotropic`,
`New.Exchange.exists_contDiff_eventually_mulVec_eq`)

### 3.8 Weak approximation

*Origin:* adapted from weak approximation, Platonov and Rapinchuk (1994), Chapter 7: here for `U(V)` of a hermitian space
with an adelic frame over a CM field, at all infinite places and a finite set of finite places at once.

*Method of the formal proof:* the Cayley transform identifies a neighbourhood of `1` in `U(J)` with an open set of a
vector space of matrices skew for `J`, where strong approximation for adelic matrices (2.3 (a)) applies; translates
cover the group.

Let `E` be a CM field, `V` a space with an adelic frame of signs `s`, and `S` a finite set of finite places. Then the
products `γ·(1, h)`, `γ ∈ Γ_V`, `h ∈ G_f` with `h_w = 1` for `w ∈ S ∪ S̄`, are dense in `G(s)`. Equivalently `U(J)(E⁺)`
is dense in the product of the unitary groups of `V` at all infinite places and at the places of `S`.

HermitianFormsAndLattices §2.5 (f) states weak approximation at finite sets of finite places for every hermitian
space; the formal proof uses the infinite places as well.

*Needs:* 2.3, 3.1, 3.2.

[ShortProof], `Lib/Adelic/Unitary/WeakApproximation.lean` (`New.Space.weak_approximation`, `New.cayleyTransform`)

### 3.9 Congruence levels

*Origin:* adapted from Borel (1963), the stabilizers of lattices in the local and in the finite adelic points of a linear
algebraic group are compact open: here for the finite adelic unitary group of the identity form, with principal
levels, levels cut out by reductions at places pairwise non-conjugate, and their indices.

*Method of the formal proof:* openness and the neighbourhood basis from the topology of `Ô`; surjectivity of reduction
from 3.2 (b) and the surjectivity of `GL_n(𝒪_w) → GL_n(k_w)`; the index from surjectivity; the bound from
`#GL_n(R) ≤ #R^{n²}` for the finite ring `R = 𝓞_E/a`. The library has openness of congruence subgroups for points of
affine group schemes of finite type in the point topology (`TauCeti.HopfAlgebra.isOpen_congruenceSubgroup`), a model
whose comparison with the matrix groups here is not small.

Let `E` be a CM field.

(a) (any number field) Every neighbourhood of `1` in `GL_n(𝔸_f)` contains `{g ∈ GL_n(Ô) : g ≡ 1 mod MÔ}` for some
integer `M ≥ 1`.

(b) For `0 ≠ a ∈ 𝓞_E`, the *principal level* `K(a) = {g ∈ K₀ : g ≡ 1 mod aÔ}` is a level; `K(b) ⊂ K(a)` if `a | b`;
every neighbourhood of `1` in `G_f` contains `K(M)` for some integer `M ≥ 1`; and `[K₀ : K(a)] ≤ N(a)^{n²}`.

(c) Let `w_1, …, w_r` be finite places with `w_i ≠ w_j` for `i ≠ j` and `w̄_i ≠ w_j` for all `i, j` (so all are
split), and `red : K₀ → ∏_i GL_n(k_{w_i})` the reduction. Then `red` is surjective, already on the elements of `K₀`
supported on `{w_i, w̄_i}`. For a subgroup `H` of the product, `K_H = red⁻¹(H)` is a level containing the elements of `K₀` that are
trivial at all `w_i`, and `[K₀ : K_H] = [∏_i GL_n(k_{w_i}) : H]`.

(d) In (c), let `χ` be a character of `H` and `φ : S → ∏_i GL_n(k_{w_i})` a homomorphism from a group `S` whose image
normalises `H` and fixes `χ`. Then lifts of `φ` define an action of `S` on the vectors of any representation of `G_f` on
which `K_H` acts through `χ ∘ red`.

*Needs:* 2.1, 3.1, 3.2.

[ShortProof], `Lib/Adelic/Unitary/CongruenceLevels.lean` (`New.exists_congruenceGL_subset`, `New.principalLevel`,
`New.isOpen_principalLevel`, `New.principalLevel_le_of_dvd`, `New.exists_principalLevel_subset`,
`New.relIndex_principalLevel_le`, `New.levelOf`, `New.isOpen_levelOf`, `New.exists_reduceFamily_eq`,
`New.relIndex_levelOf`, `New.inf_trivialOn_le_levelOf`, `New.levelRep`)

## Layer 4: Reduction theory and finite volume

### 4.1 Adelic Minkowski theorems

*Origin:* adapted from Bombieri and Vaaler (1983): Minkowski's second theorem over a number field for bodies that are
products over the infinite places (Theorem 3, the upper bound): here for the lattice of an adelic frame over a CM field,
with the first theorem as a count and the explicit constants below.

*Method of the formal proof:* the first theorem by integrating the number of rational points of `y⁻¹(B × Ô)^n + v` over
`v` (covolume one, 2.2) and scaling (2.4); the second by successive minima, applying the first theorem to a box without
nonzero lattice vectors.

Let `E` be a CM field, `y ∈ GL_n(𝔸)`, `L_y = {ξ ∈ E^n : (y⁻¹ξ)_f ∈ Ô^n}`, and `ℓ_y(ξ)` the Euclidean norm of
`((y⁻¹ξ)_{w,i})_{w,i} ∈ ℂ^{Φ×n}`. Let `U = {z ∈ ℂ^Φ : |z_w| < 1 for all w} × Ô`, and `2_∞` the idele equal to `2` at
the infinite places and to `1` at the finite places.

(a) `|det y|_𝔸 ≤ (2 rd_E)^{fn} · #{ξ ∈ E^n : (y⁻¹ξ)_i ∈ U for all i}`; in particular there is a nonzero such `ξ` if
`|det y|_𝔸 > (2 rd_E)^{fn}`.

(b) `L_y` contains a basis `y_1, …, y_n` of `E^n` with `ℓ_y(y_1) ≤ … ≤ ℓ_y(y_n)` and
`|det y|_𝔸 · ∏_j ℓ_y(y_j)^{2f} ≤ (2fn·rd_E)^{fn}`.

(c) For a compact `B ⊂ 𝔸^n` there is `C < ∞` such that for every `x ∈ ℤ^n` the number of `ξ ∈ E^n` with
`(2_∞^{−x_i}ξ_i)_i ∈ B` is at most `C·4^{f·∑_i max(x_i, 0)}`.

AdelicHeightsAndSuccessiveMinima §3.1 states Minkowski's second theorem over a number field for balanced bodies, with
other constants.

*Needs:* 2.1, 2.2, 2.4.

[ShortProof], `Lib/Adelic/Reduction/MinkowskiTheorems.lean` (`New.minkowski_first`, `New.exists_ne_zero_inv_mulVec_mem`,
`New.Core.frameLattice`, `New.Core.frameLength`, `New.Core.minkowski_second_theorem`,
`New.exists_basis_frameLength_le_two_zpow`, `New.Core.encard_le_of_dyadic_box`)

### 4.2 First minimum, height and short bases

*Origin:* adapted from the published theory of the reduction of lattices (short bases from transference): here for the
lattices of hermitian spaces with an adelic frame, with explicit constants.

*Method of the formal proof:* the dual of the image of `Λ_V` in `ℂ^{Φ×n}` (for the real part of the hermitian pairing)
contains the image of `(2/d)Λ_V` up to the different (self-duality, 2.2); transference
(GeometryOfNumbersAndQuadraticArithmetic §4.4) bounds the covering radius by the inverse first minimum, and vectors of
norm at most three times the covering radius span.

Let `E` be a CM field and `V` a space with an adelic frame of signs `s`. The *first minimum* is
`λ(V) = min(1, min{‖y‖_V : 0 ≠ y ∈ Λ_V})`, and the *height* of `g ∈ G(s)` is `ht_V(g) = 1/λ(V·g) ≥ 1`. A function `F`
on `G(s)` has *moderate growth* if `|F(g)| ≤ C·ht_V(g)^B` for some `C`, `B`, and *rapid decay* if `|F(g)|·ht_V(g)^B` is
bounded for every `B`.

(a) For `0 ≠ d ∈ 𝓞_E` in `𝔇`, every `u ∈ ℂ^{Φ×n}` lies within `(2fn)²/λ(V)` of the image of `(2/d)a` for some
`a ∈ Λ_V`.

(b) For an integer `N ≥ 1` with `N ∈ 𝔇`, `Λ_V` contains a basis of `E^n` of vectors of length at most
`6N(fn)²/λ(V)`.

(c) For `N` as in (b) and `g ∈ G_f` there is `Y ∈ GL_n(E)` with `g⁻¹Y` integral over `Ô` and `|φ(Y_{ij})| ≤ 6N(fn)²`
for every embedding `φ : E → ℂ` and all `i, j`.

(d) (effective approximation) For `0 ≠ d ∈ 𝓞_E` in `𝔇` and every adele `(z, y) ∈ ℂ^Φ × 𝔸_f` there is `a ∈ E` with
`y − a ∈ Ô` and `|z_w − Φ_w(a)| ≤ (2f)²·|Φ_w(d)|` at every infinite place `w`.

*Needs:* 2.2, 3.1; GeometryOfNumbersAndQuadraticArithmetic §4.4 (item 4.4.14, covering-radius transference).

[ShortProof], `Lib/Adelic/Reduction/FirstMinimumShortBases.lean` (`New.Space.firstMinimum`, `New.Space.height`,
`New.Space.IsModerate`, `New.Space.IsRapid`, `New.Space.exists_norm_sub_archCoords_le`, `New.Space.exists_short_basis`,
`New.Space.exists_short_basis_stdSpace`); `Lib/Adelic/Adeles/SemilocalProducts.lean`
(`New.exists_principal_near_of_mem_differentIdeal`)

### 4.3 Reduction theory, finite volume and a weak form of Weil's convergence criterion

*Origin:* adapted from Weil (1965), §§V–VI, the convergence criterion for theta integrals of classical groups: here for
unitary groups of hermitian spaces with an adelic frame over a CM field, for the count of rational `n × t` matrices in a
compact set when `2t < n`, with finite volume (`t = 0`) and a reduction theory for `GL_n` over the adeles by dyadic
profiles.

*Method of the formal proof:* every adelic frame has a rational basis that is reduced in a fixed compact set after
scaling its columns by powers of `2` at infinity (a profile), from Minkowski's theorems (4.1); the integral over the
quotient is bounded by a sum over profiles, which converges by the counts of 4.1 (c) when `2t < n`.

Let `E` be a CM field, `D(x) = diag(2_∞^{x_1}, …, 2_∞^{x_n})` for `x ∈ ℤ^n`.

(a) There are a compact `M ⊂ GL_n(𝔸)` and `c ∈ ℤ` such that for every `y ∈ GL_n(𝔸)` there are `x ∈ ℤ^n` and
`Y ∈ GL_n(E)` with `y⁻¹YD(x)⁻¹ ∈ M`, and `∑_i x_i ≤ c` when `|det y|_𝔸 ≥ 1`.

(b) Let `V = (J, x)` be a space with an adelic frame and identify `G(s)` with `U(J)(𝔸)` by `g ↦ xgx⁻¹`. For every
compact `Ω ⊂ M_{n×t}(𝔸)` with `2t < n`, `∫_{U(J)(E⁺)\U(J)(𝔸)} #{ξ ∈ M_{n×t}(E) : g⁻¹ξ ∈ Ω} dg < ∞`.

(c) `Γ_V\G(s)` has finite volume.

AdelicAlgebraicGroups §3.4 (finite volume of `G(F)\G(𝔸)^1` for connected linear algebraic groups) and
ThetaKernelsForUnitaryDualPairs §5.7a (Weil's convergence criterion for unitary pairs) also imply (b) and (c), once the
group and the quotient integral here are identified with `U(V)(𝔸)` and its quotient measure; they are general
theorems that the formal proof avoids.

*Needs:* 1.1, 2.2, 2.4, 3.1, 4.1.

[ShortProof], `Lib/Adelic/Reduction/FiniteVolume.lean` (`New.Core.exists_isCompact_profileBases`,
`New.exists_isBoundedDualBasis`, `New.Space.quotMeasure`, `New.Space.lintegral_encard_ne_top`,
`New.Space.isFiniteMeasure_quotMeasure`)

### 4.4 Mahler's criterion, and integrals over definite quotients as class sums

*Origin:* adapted from Gross (1999), §§4–8, the class set with its finite stabilisers, the mass, the inner product
weighted by the inverse stabiliser orders and the Hecke operators with their adjoints: here the integral over the
quotient of a definite unitary group with an adelic frame as a class sum, with Mahler's compactness criterion (one
direction) for the adelic unitary group of any signs.

*Method of the formal proof:* short bases (4.2) have Gram matrices in a finite set once the height is bounded, which
gives (a) through the bounded dual bases of 4.3; equal signs bound the height, which gives (b). For (d) the quotient is
cut into the finitely many classes `Γ_{V,f}gK`, each unfolded by 1.1 (d).

Let `E` be a CM field and `V` a space with an adelic frame of signs `s`.

(a) For every `R` there is a compact `C ⊂ G(s)` such that every `g` with `ht_V(g) ≤ R` lies in `Γ_V·C`.

(b) If all signs are equal, `Γ_V\G(s)` is compact. For `s = (1, …, 1)`, `Γ_{V,f}\G_f` is compact and `(Γ_{V,f}, K)` has
finite type (1.4) for every level `K`.

(c) `vol(K) = [K₀ : K]⁻¹` for every level `K`.

(d) Let `s = (1, …, 1)` (so `G_∞(s)` is compact, of mass one), `F` continuous and left `Γ_V`-invariant on `G(s)`, and
suppose `f(g) = ∫_{G_∞} F(z, g) dz` is right invariant under a level `K`. Then
`∫_{Γ_V\G} F = [K₀ : K]⁻¹·S_{Γ_{V,f},K}(f)`. For a smooth left `Γ_{V,f}`-invariant `y` on `G_f`,
`I_{Γ_{V,f},K}(y) = [K₀ : K]·∫_{Γ_V\G} y(g_f) dg`.

The *mass* of the standard space is `mass(n) = S_{Γ_{I_n,f},K₀}(1) = ∑_{Γ g K₀} 1/#(Γ_{I_n,f} ∩ gK₀g⁻¹)`.

*Needs:* 1.1, 1.4, 1.5, 3.1, 3.2, 4.2, 4.3.

[ShortProof], `Lib/Adelic/Reduction/DefiniteClassSums.lean` (`New.Space.mahler_criterion`,
`New.Space.isCocompact_of_definite`, `New.Space.isCocompact_finitePart`, `New.Space.hasFiniteType_of_isLevel`,
`New.measureReal_eq_inv_stdLevelIndex`, `New.Space.integral_quotMeasure_eq_classSum`,
`New.Space.classIntegral_eq_integral`); `Lib/Adelic/Unitary/Defs.lean` (`New.mass`)

## Layer 5: Automorphic forms on unitary groups

### 5.1 Automorphic functions, forms of a type and the Petersson product

*Origin:* definitions and conventions.

Let `E` be a CM field and `V` a space with an adelic frame of signs `s`.

- `F : G(s) → ℂ` is *automorphic* if it is continuous, left `Γ_V`-invariant, and right invariant under an open
  subgroup of `G_f` (a *level* of `F`).
- For `k` on `G_∞(s)`, right convolution is `R(k)F(g) = ∫_{G_∞} k(z)F(g·z) dz`.
- An *idempotent kernel* on a unimodular group `H` is a continuous integrable `e` with `e(g⁻¹) = conj e(g)`,
  `e(1) ≠ 0` and `∫_H e(z)e((zx)⁻¹y) dz = (e(x⁻¹)/e(1))·e(y)` for all `x, y` (so `e ∗ e = e`). A *cusp kernel of order
  `B`* on `G_∞(s)` is an idempotent kernel `e` such that, with `‖x‖ = ∏_w ‖x_w‖` (operator norms), `|e(x)|·‖x‖^{B+1}` is
  integrable, `|e(x)|·‖x‖^B` is bounded, and `α ∗ e = e` for some continuous compactly supported `α`.
- For `e` on `G_∞(s)`, a *form of type `e`* is a bounded automorphic `F` with `R(e)F = F` when `e` is integrable.
  `𝒜(V, e)` is the space of forms of type `e`, with the *Petersson product*
  `⟨F, F′⟩ = ∫_{Γ_V\G} conj F(g)·F′(g) dg` (1.1) and the action of `G_f` by right translation; `𝒜(V, e, K)` is the
  subspace of forms of level `K`.
- For a doubled parameter `l = (l_w)_w` (one `l_w ∈ ℤ^n` for each infinite place, read for the signs `s`), the
  *discrete-series kernel* is `e_l(x) = ∏_w d(l_w)·conj c_{l_w}(x_w)`, with the coefficient `c_λ` and formal degree
  `d(λ)` of HolomorphicDiscreteSeriesOfUnitaryGroups §4.1 (d); *forms of parameter `l`* are forms of type `e_l`.
- Moderate growth and rapid decay are measured against `ht_V` (4.2).

[ShortProof], `Lib/Adelic/AutomorphicForms/Basic.lean` (`New.Space.IsAutomorphic`, `New.realConv`, `New.typeKernel`,
`New.Space.IsForm`, `New.Space.petersson`, `New.Space.Form`, `New.Space.formRep`, `New.Space.rapidFunctions`);
`Lib/General/Measure/IdempotentKernel.lean` (`New.IsIdempotentKernel`); `Lib/Adelic/AutomorphicForms/RealConvolution.lean`
(`New.IsCuspKernel`)

### 5.2 Convolution over the real points, cusp kernels and projected Poincaré series

*Origin:* adapted from Barnes (1980), Lemma 1 and Proposition 1, the projector of an integrable discrete series in every
unitary representation: here as right convolution over `G_∞(s)` with an idempotent kernel on bounded automorphic
functions, with the reproducing identities of cusp kernels and Poincaré series projected to forms.

*Method of the formal proof:* (a) is the product over the infinite places of the idempotence, decay and moment of the
discrete-series kernels of HolomorphicDiscreteSeriesOfUnitaryGroups §§5.4, 6.1 under the gap. (b) continuity of translation in
`L¹(G_∞)`. (c), (d) the defining identity of an idempotent kernel and Fubini's theorem. (e) termwise convolution of an
absolutely bounded series.

Let `E` be a CM field, `V` a space with an adelic frame of signs `s`, and `n ≥ 1`.

(a) If `l_w` has gap `500n³ + B` for the signs `s` at every infinite place `w`, then `e_l` is a cusp kernel of order `B`.

(b) If `α` is integrable on `G_∞(s)` and `F` is bounded, measurable, left `Γ_V`-invariant and right invariant under an
open `K ⊂ G_f`, then `R(α)F` is automorphic, bounded and of level `K`; if `α` is an idempotent kernel, `R(α)F` is a form
of type `α` and level `K`.

(c) For automorphic `F, F′` and `x ∈ G(s)`: `⟨F(·x), F′⟩ = ⟨F, F′(·x⁻¹)⟩` and `conj⟨F, F′⟩ = ⟨F′, F⟩`; right translation
by `G_f` is unitary on `𝒜(V, e)`; for an idempotent kernel `e` and bounded automorphic `F, F′`,
`⟨R(e)F, F′⟩ = ⟨F, R(e)F′⟩`.

(d) For a cusp kernel `e`, forms `F, F′` of type `e`, `x ∈ G_∞(s)`, `g ∈ G(s)` and integrable `α, β` on `G_∞(s)`:
`∫ e(z)F(gzx) dz = (conj e(x)/e(1))·F(g)`, `⟨F, F′(·x)⟩ = (conj e(x)/e(1))·⟨F, F′⟩`, and
`⟨R(α)F, R(β)F′⟩ = (∫∫ conj α(x)·β(y)·conj e(x⁻¹y)/e(1) dx dy)·⟨F, F′⟩`.

(e) Let `e` be an idempotent kernel, `K ⊂ G_f` open, and `(W_i)` a countable family of measurable functions on `G(s)`
with `∑_i |W_i(g)| ≤ M` for all `g`, whose sum is left `Γ_V`-invariant and of level `K`. Then `g ↦ ∑_i R(e)W_i(g)` is a
form of type `e` and level `K`. This applies in particular when `∑_{γ∈Γ_V} c(γg) = ∑_i W_i(g)` for a function `c` of
level `K`.

*Needs:* 1.1, 3.1, 5.1; HolomorphicDiscreteSeriesOfUnitaryGroups §§5.4, 6.1 (idempotence, decay and moments of `e_λ`).

[ShortProof], `Lib/Adelic/AutomorphicForms/RealConvolution.lean` (`New.isIdempotentKernel_typeKernel`,
`New.isCuspKernel_typeKernel`, `New.Space.isAutomorphic_realConv`, `New.Space.exists_form_eq_realConv`,
`New.Space.IsAutomorphic.petersson_comp_mul_right`, `New.Space.inner_formRep`, `New.Space.conj_petersson`,
`New.Space.petersson_realConv_comm`, `New.Space.IsForm.realConv_translate`, `New.Space.IsForm.petersson_real_translate`,
`New.Space.IsForm.petersson_realConv_realConv`,
`New.Space.exists_form_eq_tsum_of_fixesLeft`, `New.Space.exists_form_eq_tsum`)

### 5.3 Constant terms along unipotent radicals vanish

*Origin:* adapted from the published theory of cusp forms (constant terms of functions reproduced by a cusp kernel):
here for bounded functions fixed by right convolution with a cusp kernel on adelic unitary groups.

*Method of the formal proof:* the constant term along `N_a` is again fixed by convolution with `e` and is invariant
under the real points of the radical; integrating `e` against such a function along a noncompact unipotent direction
gives `0` by the moment and decay of a cusp kernel.

Let `E` be a CM field, `e` a cusp kernel of order `B` on `G_∞(s)`, `W` a space with an adelic frame of signs `s`, and
`a ∈ M_n(𝔸)` with `a*·σ_s·a = 0` (`σ_s` the form `diag(s)` at infinity and `1_n` at the finite places) and `a_w ≠ 0` at
every infinite place `w`. Let `N_a ⊂ G(s)` be the closed subgroup of the `g` that fix the column span `A` of `a`
pointwise and satisfy `u*σ_s(gv) = u*σ_s v` for all `u, v ∈ A^⊥`.

(a) If `(Γ_W ∩ N_a)\N_a` has finite volume, `F` is continuous and bounded on `G(s)` with `R(e)F = F`, and `x ↦ F(gx)` is
left invariant under `Γ_W ∩ N_a`, then `∫_{(Γ_W∩N_a)\N_a} F(g·v·(y, 1)) dv = 0` for every `y ∈ G_∞(s)`.

(b) `(Γ_W ∩ N_a)\N_a` has finite volume if `N_a ⊂ (Γ_W ∩ N_a)·C` for some compact `C`.

*Needs:* 1.1, 3.1, 5.1.

[ShortProof], `Lib/Adelic/AutomorphicForms/UnipotentRadical.lean` (`New.unipotentRadical`,
`New.IsCuspKernel.integral_mul_eq_zero`, `New.Space.integral_unipotentRadical_eq_zero`,
`New.Space.isFiniteMeasure_quotMeasure_of_isCompact`, `New.Space.norm_le_of_integral_eq_zero`,
`New.Reduction.radicalElem`)

### 5.4 Forms of a cusp kernel are cuspidal, decay rapidly and are finite in number at each level

*Origin:* adapted from the published properties of spaces of cusp forms of a given type and level (finite dimension
and rapid decay): here for bounded functions reproduced by a cusp kernel on adelic unitary groups of hermitian spaces
with an adelic frame, with cuspidality proved and not assumed, and with an explicit depth in the cusp.

*Method of the formal proof:* at a point with a short lattice vector, the shortest vectors of a sorted Minkowski basis
(4.1, 4.2) span a rational isotropic subspace whose radical is covered by its rational points times a small real ball
and a principal level; the mean along the radical vanishes (5.3), so the form is bounded by its oscillation, which the
reproducing identity of 5.2 (d) makes small; iterating gives rapid decay, and rapid decay with the reproducing identity
gives finite dimension (compactness of the unit ball in `L²`).

Let `E` be a CM field, `V` a space with an adelic frame of signs `s`, `e` a cusp kernel of order `B` on `G_∞(s)`, and
`κ(N) = 8fn·rd_E + 48n⁶f²N + 1` for an integer `N ≥ 1` with `N ∈ 𝔇`. A function `F` is *cuspidal* if it is continuous,
left `Γ_V`-invariant, and for every `g ∈ G(s)` and every `X ∈ M_n(E)`, `X ≠ 0`, with `X*JX = 0`, the integral of
`F(g·v)` over `v` in `(Γ_{V·g} ∩ N_X)\N_X` vanishes, `N_X` the radical (5.3) of the column span of `X` in the frame of
`V·g`.

(a) Let `M ≥ 1` and `0 < δ ≤ 1`. If `λ(V) < (δ/(M·κ(N)²))^n`, there is a nonzero rational isotropic subspace `A`
spanned by vectors of `Λ_V`, with `A` and `A^⊥` spanned by lattice vectors of lengths at most `ℓ_A`, `ℓ_⊥` with
`ℓ_A·ℓ_⊥ ≤ δ`, such that every `u ∈ N_A` is `γ^{−1}u′` with `γ ∈ Γ_V ∩ N_A`, `u′_∞` within `δ` of `1` and `u′_f ∈ K(M)`.

(b) Every form of type `e` is cuspidal.

(c) If `F` is cuspidal of level `K(M)` and `λ(V·g) < (δ/(M·κ(N)²))^n`, then
`|F(g)| ≤ sup{|F(g·(z, 1)) − F(g)| : z ∈ G_∞(s), dist(z, 1) ≤ δ}`.

(d) For every open `K ⊂ G_f` and `A ∈ ℕ` there is `R` such that every form `F` of type `e` and level `K` with `|F| ≤ c`
satisfies `|F(g)|·ht_V(g)^A ≤ c·R` for all `g`; in particular forms of type `e` have rapid decay. When all signs are
equal, every automorphic function has rapid decay.

(e) For every open `K ⊂ G_f`, `𝒜(V, e, K)` is finite-dimensional.

(f) If `F` is automorphic and `z ↦ e(z)F(g·(z, 1))` is integrable for every `g`, then `R(e)F` is a form of type `e`.

The distance on `G_∞(s)` is that of `∏_w M_n(ℂ)` with the maximum over `w` of the operator norms.
ArithmeticLocallySymmetricSpaces ALS.F.6 states finite dimension and rapid decay for `K_∞`-finite, `𝔷(𝔤)`-finite cusp
forms; it does not apply to the forms here without showing that they are such, and is not used.

*Needs:* 1.1, 3.1, 3.9, 4.1, 4.2, 4.4, 5.1, 5.2, 5.3.

[ShortProof], `Lib/Adelic/AutomorphicForms/Cuspidality.lean` (`New.cuspConst`, `New.Space.CuspFrame`,
`New.Space.RadicalCovered`, `New.Space.exists_cuspFrame`, `New.Space.IsCuspidal`, `New.Space.IsForm.isCuspidal`,
`New.Space.IsCuspidal.norm_le_of_firstMinimum_lt`, `New.Space.exists_norm_mul_height_pow_le`,
`New.Space.IsForm.mem_rapidFunctions`, `New.Space.finite_levelSpace`, `New.Space.isForm_realConv`);
`Lib/Adelic/AutomorphicForms/Basic.lean` (`New.Space.isRapid_of_isCocompact`,
`New.Space.IsAutomorphic.mem_rapidFunctions`)

## Layer 6: Algebraic modular forms on definite unitary groups

### 6.1 Algebraic modular forms

*Origin:* definitions and conventions.

Let `E` be a CM field and `V` a space with an adelic frame of signs `(1, …, 1)` (a definite space), so that
`G_∞ = G_∞(1) = U(n)^Φ` is compact.

- A *weight* `(κ, e)` gives, at each infinite place `τ`, a partition (with `κ_τ(h)` columns of height `h`) and an
  integer `e_τ`; its highest weight at `τ` is `μ_{τ,p} = e_τ + ∑_{p<h<n} κ_τ(h)` (`0 ≤ p < n`). `ρ_{κ,e}` is the
  representation of `GL_n(ℂ)^Φ` of weight `(κ, e)` on `W = W_{κ,e}`, in the model and with the hermitian form of
  IntegralRepresentationsOfGeneralLinearGroups §§1.1, 2.1 (minor-product basis, integral Gram matrix). The
  representation used on forms is `ρ(z) = ρ_{κ,e}(z̄)` on `U(n)^Φ`, as in
  IntegralRepresentationsOfGeneralLinearGroups §2.4, `z̄` the entrywise complex conjugate (`= (z^T)⁻¹` on `U(n)`); the
  hermitian form is invariant under `ρ` (IntegralRepresentationsOfGeneralLinearGroups §2.3 (c)). `U(J)(E⁺)` acts on `W` through `γ ↦ ρ((x⁻¹γx)_∞)`.
- An *algebraic modular form of weight `(κ, e)`* on `V` is a function `φ : G_f → W` with `φ(γ_f g) = ρ(γ_∞)φ(g)` for
  every `γ ∈ Γ_V` with components `γ_∞`, `γ_f`, and every `g ∈ G_f`, whose stabiliser under right translation is open. `G_f` acts by right translation; for a level `K` and a character `χ` of `K`, the forms of level
  `(K, χ)` are those with `φ(gk) = χ(k)φ(g)`.
- For `l = (l_τ)`, `l_τ ∈ ℤ^n`, the *highest vector* `v⁺_l ∈ W` is the evaluation vector `ev_y` of
  IntegralRepresentationsOfGeneralLinearGroups §1.1 (e) at the array `y` with entry `1` in row `i` of block `τ` and
  column `#{j : l_{τ,j} > l_{τ,i}}`, and `0` elsewhere: a highest weight vector of `ρ_{κ,e}` for the order of the
  coordinates by decreasing entries of `l_τ`. It has unit length when every `l_τ` has distinct entries
  (IntegralRepresentationsOfGeneralLinearGroups §2.4 (d)).
- For a linear form `L` on `W`, `φ_L(z, g) = L(ρ(z)⁻¹φ(g))` on `G(1)`; `φ♮ = φ_L` for `L = ⟨v⁺, ·⟩`, `v⁺ = v⁺_l` for a
  parameter `l` of `(κ, e)` (below).
- The *doubled Harish-Chandra parameter* of `(κ, e)` at `τ` is `hc_τ = (hc_{τ,p})_{0≤p<n}`,
  `hc_{τ,p} = 2μ_{τ,p} + n − 1 − 2p`, strictly decreasing in `p`; `l = (l_τ)` is a *parameter of `(κ, e)`* if each
  `l_τ ∈ ℤ^n` has distinct entries, each of them one of the `hc_{τ,p}` (so `l_τ` is a permutation of `hc_τ`).
- Hecke operators `T_{w,j}` (3.1) act on forms; a *Hecke eigenform off a finite set `S`* is a form that is spherical
  off `S` for some Hecke polynomials, as in GaloisRepresentationsOfUnitaryEigenforms §1.1: nonzero, fixed by the
  elements of `K₀` trivial at `S`, and at every split place `w` with `w, w̄ ∉ S` fixed by `ι_w(GL_n(𝒪_w))` and an
  eigenvector of every `T_{w,j}`.

[ShortProof], `Lib/Adelic/AutomorphicForms/SmoothAlgebraicForms.lean` (`New.SmoothForm`, `New.Space.weightRep`,
`New.AlgForm`, `New.algFormRep`, `New.algFormCoeff`, `New.ofAlgForm`, `New.IsHCParam`, `New.hcParameter`);
`Lib/GaloisRep/Main/Defs.lean` (`New.IsSphericalOff`, `New.HasHeckePolyAt`)

### 6.2 The invariant pairing, Harish-Chandra parameters and formal degrees

*Origin:* adapted from Gross (1999), §§4–8, the inner product weighted by the inverse stabiliser orders: here the
pairing of algebraic forms on definite unitary groups by the class integral of 1.4; with, for the compact group
`U(n)^Φ`, the cyclicity of the highest vector, its coefficient, and the dimension as a product of formal degrees.

*Method of the formal proof:* (a) by 1.5 (a); (b) the translates of the highest vector span an invariant subspace of an
irreducible representation; (c) combinatorics of the decreasing positions of a parameter, and the coefficient and
formal degree of HolomorphicDiscreteSeriesOfUnitaryGroups §§4.1, 5.3 for signs `(1, …, 1)`.

Let `V` be a definite space and `(κ, e)` a weight.

(a) For a sesquilinear `B` on `W` invariant under `ρ(U(J)(E⁺))`, `⟨φ, φ′⟩_B = I_{Γ_{V,f},K₀}(g ↦ B(φ(g), φ′(g)))` is a
pairing on algebraic forms of weight `(κ, e)`, invariant under right translation by `G_f`.

(b) If every `l_τ` has distinct entries, the highest vector `v⁺_l` is cyclic: its translates under `U(n)^Φ` span `W`,
and so do the linear forms `⟨v⁺_l, ρ(z)·⟩`, `z ∈ U(n)^Φ`.

(c) Let `l` be a parameter of `(κ, e)`. Each `l_{τ,i}` is the entry of `hc_τ` at the position of `l_{τ,i}` in the
decreasing order of `l_τ`; `⟨v⁺, ρ(z)v⁺⟩ = ∏_τ conj c_{l_τ}(z_τ)` for `z ∈ U(n)^Φ` (`v⁺ = v⁺_l`); and
`∏_τ d(l_τ) = dim W`.

*Needs:* 1.4, 1.5, 4.4, 6.1; HolomorphicDiscreteSeriesOfUnitaryGroups §§4.1, 5.3 (`c_λ` and formal degree on `U(n)`).

[ShortProof], `Lib/Adelic/AutomorphicForms/SmoothAlgebraicForms.lean` (`New.smoothPairing`,
`New.smoothPairing_formTranslation`, `New.highestVector_cyclic`, `New.IsHCParam.eq_hcParameter`,
`New.IsHCParam.exists_decreasingPosition_eq`, `New.IsHCParam.gramForm_conjWeylRep_eq_dsCoeff`,
`New.IsHCParam.prod_formalDegree`)

### 6.3 Finiteness and Hecke eigenforms

*Origin:* adapted from Gross (1999): the forms as the invariants of the finite stabilisers over the class set; here
finiteness at every open level with a character, an invariant positive definite form, and spanning by Hecke eigenforms.

*Method of the formal proof:* (a) a form is determined by its values at representatives of the finitely many classes,
each in the invariants of a finite stabiliser. (b) the class integral of the invariant inner product of `W` (6.2 (a)).
(c) the Hecke operators at split places off `S` commute and are normal for the form of (b) (their adjoints are the
operators of the inverse double cosets, 1.5), so they are simultaneously diagonalisable on `M`.

(a) Let `G` be a topological group, `Γ → G` an injective homomorphism, `K ⊂ G` a subgroup with `(Γ, K)` of finite type,
`χ` a character of `K` that is trivial on a neighbourhood of `1`, and `ρ` a representation of `Γ` on a
finite-dimensional `W`. The smooth `φ : G → W` with
`φ(γgk) = χ(k)ρ(γ)φ(g)` form a finite-dimensional space; a form is determined by its values at representatives of
`Γ\G/K`.

(b) Let `V` be a definite space over a CM field. The algebraic forms of weight `(κ, e)` carry a positive definite
hermitian form invariant under right translation by `G_f`, and for every open `K ⊂ G_f` and character `χ` of `K` the
forms of level `(K, χ)` are finite-dimensional.

(c) Let `K₀,w` be the subgroup of the elements of `K₀` supported on `{w, w̄}`. For every open `H ⊂ G_f` there is a
finite set `S` of finite places such that `H` contains the elements of `K₀` trivial at `S`, and `w, w̄ ∉ S` whenever
`K₀,w ⊂ H`. An open `K ⊂ G_f` contains `K₀,w` for almost all `w`.

(d) Let `S` be a finite set of finite places and `M` a finite-dimensional space of algebraic forms on `V` of weight
`(κ, e)`, fixed by the elements of `K₀` trivial at `S` and stable under `T_{w,j}` for every split `w` with `w, w̄ ∉ S` and
every `j`. Then `M` is spanned by Hecke eigenforms off `S` (6.1) lying in `M`.

When all stabilisers `Γ ∩ gKg⁻¹` are trivial, the dimension in (a) is `#(Γ\G/K)·dim W`; for adelic groups this is
DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5c.

*Needs:* 1.4, 1.5, 3.1, 3.9, 4.4, 6.1, 6.2; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5c (dimension for trivial
stabilisers).

[ShortProof], `Lib/Adelic/AutomorphicForms/HeckeEigenforms.lean` (`New.deltaForm`, `New.freeLevelEquiv`,
`New.finite_levelSpace_smoothFormRep`, `New.finrank_levelSpace_smoothFormRep`, `New.Space.exists_isUnitary_formTranslation`,
`New.Space.finite_formTranslation_levelSpace`, `New.exists_inf_trivialOn_le`, `New.eventually_maxCompactAt_le`,
`New.hasHeckePolyAt_iff`, `New.le_span_isSphericalOff`)

### 6.4 Forms on the standard definite space are algebraic forms

*Origin:* adapted from Gross (1999), §§4–8, the class set with its finite stabilisers, the mass, the inner product
weighted by the inverse stabiliser orders and the Hecke operators with their adjoints: here the explicit comparison of
algebraic forms with the forms of type `e_l` on the standard definite unitary group through the highest vector, at all
levels at once, with the integration formula for products with a kernel built on the highest vector.

*Method of the formal proof:* Schur orthogonality on the compact group `U(n)^Φ` with the cyclic highest vector (6.2),
and the formula of 4.4 (d) for the integral over the quotient.

Let `E` be a CM field, `I_n` the standard space, `(κ, e)` a weight with parameter `l` (6.1), `d = dim W`, and
`v⁺ = v⁺_l` the highest vector.

(a) `φ ↦ φ♮`, `φ♮(z, g) = ⟨v⁺, ρ(z)⁻¹φ(g)⟩`, is a linear bijection from the algebraic forms of weight `(κ, e)` on `I_n`
onto `𝒜(I_n, e_l)`, with inverse `y ↦ (g ↦ d·∫_{G_∞} y(z, g)ρ(z)v⁺ dz)`. It commutes with right translation by `G_f`;
so it preserves levels, characters of levels and Hecke eigenvalues.

(b) Let `K` be a level and `Φ(z, g) = L_g(ρ(z)v⁺)` with linear forms `L_g` on `W`, `Φ` automorphic, such that `Φ·φ♮` is
right `K`-invariant. Then `∫_{Γ\G} Φ·φ♮ = (d·[K₀ : K])⁻¹·S_{Γ_f,K}(g ↦ L_g(φ(g)))`.

(c) If a level `K` acts on the right on `φ` and on `φ′` by the same unitary character of finite order, then
`S_{Γ_f,K}(g ↦ ⟨φ(g), φ′(g)⟩) = d·[K₀ : K]·⟨φ♮, φ′♮⟩`, the Petersson product of 5.1.

AutomorphicFormsOnReductiveGroups §7.5 (automorphic realisation) and DiscreteSeriesCoefficientsAndAutomorphicMetrics
§7.5a (integration formula, comparison) state related general forms; they do not give the explicit map of (a).

*Needs:* 1.4, 1.5, 4.4, 5.1, 6.1, 6.2; RepresentationTheory/CompactGroups §4.1 (Schur orthogonality).

[ShortProof], `Lib/Adelic/AutomorphicForms/AutomorphicAsAlgebraic.lean` (`New.Space.toAlgForm`,
`New.Space.ofAlgForm_toAlgForm`, `New.Space.toAlgForm_formRep`, `New.Space.algFormEquiv`,
`New.hasHeckePolynomial_toAlgForm_iff`, `New.Space.integral_eq_classIntegral_of_isLevel`,
`New.Space.integral_mul_eq_classIntegral`, `New.Space.classSum_gramForm_eq_mul_petersson`)

### 6.5 Periods over a block subgroup

*Origin:* particular to this proof: the integral over the quotient of a block subgroup `U(m) × U(1)` of a definite
unitary group, of an automorphic function built on a vector of a representation of `U(m)` times the restriction of an
algebraic form, written as a class sum through multiplicity one of the branching from `U(m + 1)` to `U(m)`.

*Method of the formal proof:* the archimedean integral is an intertwiner from `ρ` restricted to `U(m)^Φ` to `ρ₀`, hence a
multiple of the given branching matrix; the rest is 6.4 (b).

Let `E` be a CM field, `X` an index set of size `m + 1` identified with `{1, …, m} ⊔ {∗}`, `V` the standard space of rank
`m`, `(κ, e)` a weight for rank `m + 1` with representation `ρ` and `(κ₀, e₀)` a weight for rank `m` with representation
`ρ₀`, and `A : W_{κ,e} → W_{κ₀,e₀}` a linear map that spans the `U(m)^Φ`-equivariant maps (branching with multiplicity
one), `U(m)` embedded as `h ↦ diag(h, 1)`. For every linear form `t` on `W_{κ,e}` and every `c ∈ W_{κ₀,e₀}` there is
`C ∈ ℂ` such that for every algebraic form `ψ` of weight `(κ, e)` on `I_{m+1}`, every `u ∈ U(1)(𝔸_f)`, every level
`K ⊂ G_f(m)` and every automorphic `Φ` on `G(1_m)` of the form `Φ(z, g) = L_g(ρ₀(z)c)` with linear forms `L_g`:
`∫_{Γ_V\G} Φ(h)·ψ_t(diag(h, u)) dh = (C/[K₀ : K])·I_{Γ_{V,f},K}(g ↦ L_g(A·ψ(diag(g, u))))`, where `ψ_t` is the function
`φ_L` of 6.1 for `L = t` and the class integral is 1.4. Moreover `h ↦ ψ_t(diag(h, u))` is automorphic on `G(1_m)`.

*Needs:* 1.4, 1.5, 4.4, 5.1, 6.1, 6.4; IntegralRepresentationsOfGeneralLinearGroups §3.4 (branching with multiplicity
one).

[ShortProof], `Lib/Adelic/AutomorphicForms/BlockPeriods.lean` (`New.Seesaw.exists_eq_smul_of_intertwines`,
`New.Seesaw.integral_algFormCoeff_blockEmb`, `New.Seesaw.isAutomorphic_algFormCoeff_blockEmb`)

### 6.6 The `p`-adic gauge of algebraic forms and the integrality of class sums

*Origin:* particular to this proof: a `p`-adic norm on the values of algebraic forms, compatible with rational points
and with integral points above `p`, and the integrality of class sums and of class-sum pairings after multiplication
by a common multiple of the stabiliser orders.

*Method of the formal proof:* the gauge is a maximum of `p`-adic absolute values of coordinates in an integral basis,
on which integral matrices act integrally; weak approximation (3.8) moves a point into the integral points above `p`;
the integral Gram matrix of the minor-product basis gives (d); in a class sum, `A/#Γ_g` is an integer.

Fix a prime `p` and a ring homomorphism `ι : ℂ → ℂ_p`; `𝔬_ι = {z ∈ ℂ : |ι(z)|_p ≤ 1}`. `G_f^{(p)}` is the subgroup of
the `g ∈ G_f` whose components at all places above `p` lie in `GL_n(𝒪_w)`. For `g ∈ G_f` and `ξ ∈ W = W_{κ,e}`, the
*gauge* `γ_g(ξ)` is the largest `p`-adic absolute value of a coordinate (in the minor-product basis) of
`ρ_{κ,e}(g⁻¹)ι(ξ)`, `ρ_{κ,e}` the representation of 6.1 over `ℂ_p` (without conjugation), where at the infinite place
`τ` the element `g⁻¹` acts through its component at the prime of `E` induced by the embedding `x ↦ ι(Φ_τ(x̄))` of `E`
into `ℂ_p`.

(a) `γ_{γ_f g}(ρ(γ_∞)ξ) = γ_g(ξ)` for rational points `γ` of the standard space; `γ_{gk}(ξ) = γ_g(ξ)` for
`k ∈ G_f^{(p)}`; `γ_g(cξ) = |ι(c)|_p·γ_g(ξ)`; `γ_g(ξ + ξ′) ≤ max(γ_g(ξ), γ_g(ξ′))`; and for `k ∈ G_f^{(p)}`, `γ_k(ξ) ≤ 1`
if and only if every coordinate of `ξ` lies in `𝔬_ι`.

(b) For a definite space `V` and `g, h ∈ G_f` there is `γ ∈ U(J)(E⁺)` with `γ_f g ∈ G_f^{(p)}` and
`h·γ_f g·h⁻¹ ∈ G_f^{(p)}`.

(c) For a level `K` and a character `χ` of `K` of finite order, the form of level `(K, χ)` on `I_n` supported on
`Γ_f xK` with value `v` built at `x` (the delta form) has gauge at most `γ_x(v)` at every point, and its squared norm under
every automorphism `σ` of `ℂ` is at most `#(Γ_f ∩ xKx⁻¹)²` times that of `v`.

(d) If `γ_g(u) ≤ 1` for the homomorphism `ι ∘ conj` and `γ_g(v) ≤ 1` for `ι`, then `⟨u, v⟩ ∈ 𝔬_ι`.

(e) Let `(Γ, K)` have finite type and `A` be a common multiple of the orders of all stabilisers `Γ ∩ xKx⁻¹`. If
`γ_g(c·f(x)) ≤ 1` for all `x`, then `γ_g(A·c·S_{Γ,K}(f)) ≤ 1`; and if the archimedean norms of all `f(x)` under `σ` are at
most `B`, that of `S_{Γ,K}(f)` is at most `#(Γ\G/K)·B`.

(f) For places `w_i` and `H` as in 3.9 (c) and a character `χ` of `H` of finite order, the forms of weight `(κ, e)` on
`I_n` of level `(K_H, χ ∘ red)` form a finite-dimensional inner product space for
`⟨φ, φ′⟩ = S_{Γ_f,K_H}(g ↦ ⟨φ(g), φ′(g)⟩)`; if `φ` has gauge at most `1` everywhere for `ι ∘ conj`, `φ′` for `ι`, and `A`
is a common multiple of the stabiliser orders at `K_H`, then `A·⟨φ, φ′⟩ ∈ 𝔬_ι`.

*Needs:* 1.4, 1.5, 3.8, 3.9, 4.4, 6.1, 6.3; IntegralRepresentationsOfGeneralLinearGroups §§1.1, 1.3, 2.1 (minor-product
basis, integral Gram matrix).

[ShortProof], `Lib/Adelic/AutomorphicForms/SmoothAlgebraicForms.lean` (`New.weylGauge`, `New.integralAbove`);
`Lib/Adelic/AutomorphicForms/PAdicGauge.lean` (`New.weylGauge_embFin`, `New.weylGauge_mul_of_mem_integralAbove`,
`New.weylGauge_smul`, `New.weylGauge_le_one_iff`, `New.exists_mul_mem_integralAbove`, `New.Rows.weylGauge_deltaForm_le`,
`New.Rows.weylNormSq_deltaForm_le`, `New.gramForm_mem_embValRing`, `New.weylGauge_classSum_le_one`,
`New.sqrt_weylNormSq_classSum_le`, `New.LevelPlaces.LevelForm`, `New.LevelPlaces.LevelForm.inner_eq_stdClassSum`,
`New.LevelPlaces.LevelForm.norm_nsmul_inner_le_one`)

## Layer 7: The comparison of traces

### 7.1 Test functions, cuspidality at a split place, and the geometric side

*Origin:* definitions and conventions.

Let `E` be a CM field, `n ≥ 1`.

- A *test function* on a totally disconnected locally compact group is a locally constant compactly supported complex
  function. For a compact open subgroup `K ⊂ G_f` and `a = ∑ c_b b ∈ ℂ[G_f]`, `a ⋆ 1_K = ∑ c_b 1_{bK}`.
- For a complex representation `ρ` of a group `G` and a subgroup `K`, the *level algebra* is the subalgebra of the `a ∈ ℂ[G]`
  with `ρ(a)` preserving the `K`-fixed vectors; the *universal level algebra* `𝔄(K)` is the intersection of the level
  algebras over all complex representations of `G`.
- For a field `k`, `n ≥ 2` and a subset `∅ ≠ T ⊊ {1, …, n}` with coordinate projector `p_T`, `N_T(k) =
  {1 + p_T Z(1 − p_T) : Z ∈ M_n(k)}`. A test function `φ` on `G_f` is *cuspidal at the split place `w`* if for every such
  `T`, every `t ∈ GL_n(k_w)`, every map `ℓ : M_n(k_w) → GL_n(𝒪_w)` whose reduction is `Z ↦ (1 + p_T Z(1 − p_T))t`, and every
  `g ∈ G_f`: `∑_{Z∈M_n(k_w)} φ(g·ι_w(ℓ(Z))) = 0`.
- `g ∈ GL_n(E_w)` has a *simple zero* at `w` if its entries lie in `𝒪_w` and `0` is a simple root of the characteristic
  polynomial of its reduction modulo `w`.
- For a space `V` of signs `s`, a cusp kernel `k` of order `B ≥ 13n³` on `G_∞(s)` (5.1), a test function `φ` on `G_f`
  and a set `S` of monic polynomials over `E`, the *part of the geometric side* with polynomials in `S` is
  `J^V_S(k, φ) = ∫_{Γ_V\G} ∑_{γ ∈ U(J)(E⁺), χ_γ ∈ S} (k ⊗ φ)(g⁻¹γg) dg` (absolutely convergent by 7.3 (d)), `γ` read
  in `G(s)` through the frame and `χ_γ` its characteristic polynomial; `J^V(k, φ)` is the case of all polynomials.
- For `γ ∈ U(J)(E⁺)` with centraliser `Z_γ` in `U(J)(E⁺)` (read in `G(s)` through the frame, a discrete subgroup) and
  a function `k` on `G_∞(s)`, the *orbital integral* is `I_γ(k ⊗ φ) = ∫_{Z_γ\G} (k ⊗ φ)(g⁻¹γg) dg` (1.1).
- For a level `K`, `𝒜(V, l, K)` is `𝒜(V, e_l, K)` (5.1), on which `ℂ[G_f]` acts by right translation.

[ShortProof], `Lib/Adelic/TraceFormula/TestFunction.lean` (`New.TestFunction`, `New.convIndicator`, `New.IsCuspidalAt`,
`New.HasSimpleZero`); `Lib/Adelic/TraceFormula/LevelAlgebra.lean` (`New.levelAlgebra`, `New.levelAction`,
`New.universalLevelAlgebra`); `Lib/Adelic/TraceFormula/Convergence.lean` (`New.Space.kernelTerm`, `New.Space.polyTerm`);
`Lib/Adelic/TraceFormula/ReduciblePolynomials.lean` (`New.Space.geometricSide`);
`Lib/Adelic/TraceFormula/OrbitalUnfolding.lean` (`New.Space.orbitalIntegral`)

### 7.2 Idempotents of irreducible labels give cuspidal test functions

*Origin:* adapted from Green (1955), the cuspidal characters of `GL_n(𝔽_q)`, their degree and their values: here the
cuspidality of the idempotent of an irreducible label, inflated to a test function on the finite adelic unitary group
that is cuspidal at a split place.

*Method of the formal proof:* Green's class function of an irreducible label has mean zero on every proper coordinate
unipotent radical, so the coefficients of its idempotent sum to zero over each coset; on `K₀` the test function is the
inflation of the idempotent through the reduction, and outside `K₀` it vanishes.

Let `w_1, …, w_r` be finite places as in 3.9 (c), `c = (c_i)` with `c_i ∈ k_{w_i}[X]`, and suppose `c_x` is an
irreducible label of degree `n` (monic, irreducible, `c_x(0) ≠ 0`) for some index `x`. Let `e_c ∈ ℂ[∏_i GL_n(k_{w_i})]`
be the tensor product of the label idempotents, `ẽ_c ∈ ℂ[K₀]` its lift by a section of the reduction supported on the
places `w_i, w̄_i` (3.9 (c)), and `K(⊥)` the kernel of the reduction. Then for every `b ∈ ℂ[G_f]`, the test function
`(b·ẽ_c) ⋆ 1_{K(⊥)}` is cuspidal at `w_x`; and the coefficients of `e_c` sum to zero over every coset of `N_T(k_{w_x})`
(placed at `w_x`) for every proper nonempty `T`.

*Needs:* 3.9, 7.1; IntegralRepresentationsOfGeneralLinearGroups §§4.4, 5.3 (labels, idempotents, cuspidality of `τ_P`).

[ShortProof], `Lib/Adelic/TraceFormula/CuspidalType.lean` (`New.isCuspidalAt_convIndicator_tupleIdem`,
`New.sum_coeff_labelIdem_radicalHom`, `New.sum_coeff_tupleIdem_radicalHom`)

### 7.3 Kernel bounds and convergence of the geometric side

*Origin:* adapted from the comparison of simple trace formulas for inner forms of unitary groups (Kottwitz, Clozel,
Harris and Taylor, Labesse): here the bound of the kernel sum by a power of the height, and the convergence of the
geometric side for kernels of polynomial decay on adelic unitary groups.

*Method of the formal proof:* the rational points `g⁻¹γx` with finite part in the support of `φ` are counted in dyadic
shells of the archimedean norm by a measure comparison with disjoint translates of a level box (Minkowski, 4.1), with a
lower bound for `x⁻¹γx` at infinity when `γ` pairs two short lattice vectors non-trivially (a nonzero algebraic integer
has norm at least one); irreducible characteristic polynomials exclude the cusps, where `γ` would keep an isotropic
subspace.

Let `V` be a space with an adelic frame of signs `s`, `φ` a test function on `G_f`, and `k` measurable on `G_∞(s)` with
`|k(z)|·(∏_w ‖z_w‖)^B ≤ C` for all `z` (operator norms).

(a) There is `C′` with `∑_{γ ∈ U(J)(E⁺)} |φ((g⁻¹γx)_f)|·‖(g⁻¹γx)_∞‖^{−8n²−1} ≤ C′·ht_V(x)^{4fn²}` for all `g, x ∈ G(s)`,
`‖y_∞‖` the product of the operator norms at the infinite places.

(b) If `B > 8n²`, there is `C′ ≥ 0` with `∑_{γ∈Z} |(k ⊗ φ)(g⁻¹γx)| ≤ C′·ht_V(x)^{4fn²}` for all `g, x` and all subsets
`Z ⊂ U(J)(E⁺)`.

(c) If `B ≥ 13n³`, the sum over the `γ` with irreducible characteristic polynomial of `|(k ⊗ φ)(x⁻¹γx)|` is bounded
uniformly in `x`.

(d) If `B ≥ 13n³` and `k` is a cusp kernel of order `B`, there is `D` with `|∑_{γ: χ_γ ∈ S} (k ⊗ φ)(x⁻¹γx)| ≤ D` for all
`x` and all sets `S` of polynomials; so `J^V_S(k, φ)` is defined by an absolutely convergent integral (4.3 (c)).

*Needs:* 3.1, 4.1, 4.2, 4.3, 5.1, 5.4, 7.1.

[ShortProof], `Lib/Adelic/TraceFormula/KernelBound.lean` (`New.Space.exists_tsum_majorant_le`,
`New.tsum_mul_measure_le_lintegral`, `New.Space.exists_levelBox_disjoint`); `Lib/Adelic/TraceFormula/Stretch.lean`
(`New.Space.exists_one_le_pow_mul_prod_norm`); `Lib/Adelic/TraceFormula/Convergence.lean`
(`New.Space.exists_tsum_enorm_kernelTerm_le_height`, `New.Space.summable_kernelTerm`,
`New.Space.exists_tsum_enorm_irreducibleTerm_le`, `New.Space.exists_norm_partialKernel_spanStabilizer_le`,
`New.Space.exists_norm_tsum_polyTerm_le`)

### 7.4 Descent of invariant distributions to a slice

*Origin:* adapted from the published theory of invariant distributions (descent to a slice): here for an abstract
totally disconnected group acted on by conjugation, with the slice given as a hypothesis and no reductive structure.

*Method of the formal proof:* integration over the fibres of `(γ, y) ↦ j(γ)yj(γ)⁻¹` carries test functions on `Γ × G` to
test functions on the closed set `C`; an invariant distribution on `C` pulls back to a distribution on `Γ × X` that is
invariant under translations in `Γ`, hence a multiple of the Haar integral in `Γ`.

Let `G` be a Hausdorff, weakly locally compact, totally disconnected topological group, `Γ` a topological group with a
compact open subgroup acting on `G` by conjugation through a continuous homomorphism `j`, `H ⊂ Γ` a closed subgroup, with
Haar measures on `Γ` and `H`. Let `X ⊂ C ⊂ G` with `C` closed be a *slice*: `C` is the set of `j(γ)yj(γ)⁻¹`, `y ∈ X`;
`j(γ)yj(γ)⁻¹ ∈ X` with `y ∈ X` holds exactly for `γ ∈ H`; and near `X` the points of `C` are conjugated into `X` by
elements of `Γ` near `1`. Let `I` be a linear form on test functions on `G` that is invariant under conjugation by `Γ`
and depends only on the restriction to `C`. If `Ψ` is a test function on `Γ × G` with `∫_Γ Ψ(γ, y) dγ = 0` for every
`y ∈ X`, and `f` is a test function with `f(j(γ)yj(γ)⁻¹) = ∫_H Ψ(γh, j(h)⁻¹yj(h)) dh` (the integral over the `H`-orbit
of `(γ, y)`) for `γ ∈ Γ`, `y ∈ X`, then `I(f) = 0`. For every test function `Ψ` such an `f` exists.

*Needs:* 7.1; 1.5 (b) (compact means).

[ShortProof], `Lib/Adelic/TraceFormula/FibreIntegral.lean` (`New.IsSlice`, `New.IsInvariantDistribution`,
`New.fibreIntegral`, `New.IsImage`, `New.IsSlice.exists_isImage`, `New.IsInvariantDistribution.eq_zero_of_isImage`)

### 7.5 Invariant distributions on classes with coprime factors

*Origin:* adapted from the published theory of the simple trace formula (vanishing of invariant distributions supported
on classes with reducible characteristic polynomial for test functions cuspidal at a split place): here on the finite
adelic unitary group, at one split place.

*Method of the formal proof:* the elements whose component at `w` has characteristic polynomial `AB` with `A, B` coprime
are conjugate to block diagonal elements; the block diagonal locus is a slice (7.4) with stabiliser the Levi subgroup,
and the integral of a cuspidal test function over the corresponding unipotent radical vanishes.

Let `w` be a split place of the CM field `E`, and `A, B ∈ E_w[X]` coprime non-units. Let `I` be
a linear form on test functions on `G_f`, invariant under conjugation by `G_f`, that vanishes on every test function
vanishing on `{g ∈ G_f : χ(g_w) = AB}`. Then `I(φ) = 0` for every test function `φ` cuspidal at `w`.

*Needs:* 3.1, 3.2, 7.1, 7.4.

[ShortProof], `Lib/Adelic/TraceFormula/CoprimeFactors.lean` (`New.isSlice_blockLocus`, `New.eq_zero_of_coprime_factors`)

### 7.6 The geometric side, polynomial by polynomial

*Origin:* adapted from the comparison of simple trace formulas for inner forms of unitary groups (Kottwitz, Clozel,
Harris and Taylor, Labesse): here the decomposition of the geometric side by characteristic polynomials and the
vanishing of the reducible ones under cuspidality at a split place and a simple zero at a second place.

*Method of the formal proof:* (b) by 7.3 (d) and dominated convergence. (d): the reducible `R` with coprime factors at
`w` are removed by 7.5 (the term is an invariant distribution in `φ`); a power of an irreducible polynomial cannot be the
characteristic polynomial of an element with a simple zero; an element keeping an isotropic subspace has reducible
characteristic polynomial, unchanged by the unipotent radical (a).

Let `V` be a space with an adelic frame of signs `s`, `k` a cusp kernel of order `B ≥ 13n³` on `G_∞(s)`, `φ` a test
function on `G_f`.

(a) For a nondegenerate hermitian `J` over a field with involution, an element of `U(J)` keeping a nonzero isotropic
subspace has reducible characteristic polynomial, and multiplying it by an element of the unipotent radical of the
stabiliser of that subspace does not change its characteristic polynomial.

(b) `R ↦ J^V_{{R}}(k, φ)` is summable over the monic polynomials `R` with sum `J^V(k, φ)`, and
`J^V_S(k, (g, g)·φ) = J^V_S(k, φ)` for `g ∈ G_f`.

(c) If `φ(y) = 0` whenever the characteristic polynomial of `y_w` is `R` (at some finite place `w`), then
`J^V_{{R}}(k, φ) = 0`.

(d) If `φ` is cuspidal at a split place `w` and every `g` with `φ(g) ≠ 0` has a simple zero at a finite place `w′`, then
`J^V_{{R}}(k, φ) = 0` for every reducible `R`.

*Needs:* 3.1, 7.1, 7.3, 7.5.

[ShortProof], `Lib/Adelic/TraceFormula/IsotropicStabiliser.lean` (`New.IsIsotropicFrame.not_irreducible_charpoly`,
`New.IsIsotropicFrame.charpoly_radical_mul`); `Lib/Adelic/TraceFormula/ReduciblePolynomials.lean`
(`New.Space.hasSum_geometricSide`, `New.Space.geometricSide_translate`,
`New.Space.geometricSide_singleton_eq_zero_of_forall`, `New.Space.geometricSide_singleton_eq_zero`)

### 7.7 Traces on forms as the geometric side, and unfolding of orbital integrals

*Origin:* adapted from the comparison of simple trace formulas for inner forms of unitary groups (Kottwitz, Clozel,
Harris and Taylor, Labesse): here the trace of an operator on forms of a cusp kernel and a level, written as the
integral of the kernel on the diagonal, and the unfolding of the irreducible terms into orbital integrals.

*Method of the formal proof:* the kernel of `e ⊗ 1_K` is a form in each variable (5.2 (e)); expanding it in an orthonormal
basis of the finite-dimensional space `𝒜(V, e, K)` (5.4 (e)) and integrating on the diagonal gives the trace; for an
irreducible polynomial the sum over a conjugacy class is unfolded by 1.3 (3).

Let `V` be a space with an adelic frame of signs `s`, `e` a cusp kernel of order `B` on `G_∞(s)`, `K` a level.

(a) If `B > 8n²`, for every `x ∈ G(s)` there is `k_x ∈ 𝒜(V, e, K)` with
`conj k_x(g) = ∑_{γ∈Γ_V} e((xγg)_∞)·1_K((xγg)_f)`.

(b) If `B ≥ 13n³`, `a ∈ ℂ[G_f]` and `T` is an endomorphism of `𝒜(V, e, K)` acting as `a`, then
`vol(K)·tr T = J^V(e, a ⋆ 1_K)`.

(c) If `B ≥ 13n³`, `k` is measurable with `|k(z)|·(∏_w ‖z_w‖)^B` bounded, and `γ ∈ U(J)(E⁺)` has irreducible
characteristic polynomial, then the orbital integrand is integrable over `Z_γ\G`, and the integral over `Γ_V\G` of the
sum of `(k ⊗ φ)(g⁻¹γ′g)` over the `γ′` conjugate to `γ` under `U(J)(E⁺)` is `I_γ(k ⊗ φ)`. The conjugacy classes of all
spaces of rank `n` at once are indexed by the orbits of `GL_n(E)` on pairs `(x_f G_f, y)`, `x_f ∈ GL_n(𝔸_f)`,
`y ∈ GL_n(E)`, acting by `z·(x_f G_f, y) = (z x_f G_f, zyz⁻¹)`.

(d) Let `e = e_l`, and `γ ∈ U(J)(E⁺)` with `x⁻¹γx = g·(t, y)·g⁻¹` for some `g ∈ G(s)`, `t ∈ G_∞(s)` and `y ∈ G_f`. For
every `β : G_f → [0, ∞]` such that `u ↦ β((g⁻¹u)_f)` is a cutoff (1.1) on `G(s)` for the action of `Z_γ` with the
counting measure: `I_γ(e_l ⊗ φ) = ∏_w ∫_{U(diag s)} e_{l_w}(h⁻¹t_wh) dh · ∫_{G_f} β(v)·φ(v⁻¹yv) dv`.

*Needs:* 1.1, 1.3, 3.1, 5.1, 5.2, 5.4, 7.1, 7.3, 7.6.

[ShortProof], `Lib/Adelic/TraceFormula/OrbitalUnfolding.lean` (`New.Space.exists_kernel_form`,
`New.Space.partialKernel_convIndicator_eq_sum`, `New.Space.volume_mul_trace_eq`, `New.frameClass`, `New.frameClass_eq_iff`,
`New.Space.hasSum_classIntegral`, `New.Space.orbitalIntegral_unfold`); `Lib/Adelic/TraceFormula/TraceComparison.lean`
(`New.Space.orbitalIntegral_eq_prod_mul`)

### 7.8 The Selberg principle for cusp kernels

*Origin:* adapted from the published theory of discrete series (the vanishing of orbital integrals of cusp forms at
non-elliptic elements): here for a cusp kernel inside the adelic orbital integral of a rational point whose
characteristic polynomial is irreducible with a root off the unit circle.

*Method of the formal proof:* the centraliser of such a `γ` contains, at some infinite place, a noncompact torus along
which the orbital integrand is a convolution of the cusp kernel with a function invariant in a noncompact direction;
the moment and decay of the cusp kernel make this integral vanish, as in 5.3.

Let `V` be a space with an adelic frame of signs `s`, `e` a cusp kernel of order `B ≥ 13n³` on `G_∞(s)`, `φ` a test
function on `G_f`, and `γ ∈ U(J)(E⁺)` with irreducible characteristic polynomial `R` having, at some infinite place `w`,
a root `r` (of `R^{Φ_w}`) with `|r| ≠ 1`. Then `I_γ(e ⊗ φ) = 0`, and `J^V_{{R}}(e, φ) = 0`.

EndoscopicTransferAndUnitaryTraceComparison §2.10 states the vanishing for averaged Euler–Poincaré functions on a real
reductive group; it does not give this statement.

*Needs:* 1.1, 5.1, 5.3, 7.1, 7.3, 7.7.

[ShortProof], `Lib/Adelic/TraceFormula/TraceComparison.lean` (`New.Space.orbitalIntegral_eq_zero`,
`New.Space.geometricSide_singleton_eq_zero_of_norm_ne_one`, `New.Space.isEllipticSimilitude_of_norm_eq_one`)

### 7.9 Elliptic similitudes and the change of signs

*Origin:* particular to this proof: for an elliptic element, moving its finite adelic frame by an element commuting with
its centraliser changes its signs at the infinite places by any pattern of product one, and these moves permute the
orbits of marked triples.

*Method of the formal proof:* in an eigenbasis of `y` at each infinite place the form is diagonal. In the CM field
`L = E[X]/(P)`, `P` the characteristic polynomial of `y`, class field theory for `L` over its totally real subfield
gives `a ∈ L^×` with the prescribed signs at the roots (their product is one) and a finite idele `u` of `L` with
`a·u·ū = 1`. For polynomials `δ` over `E` and `g` over `𝔸_f` representing `a` and `u⁻¹`, `U = g(y)` read in
`GL_n(𝔸_f)` satisfies `(Ux)*β(Ux) = x*(βδ(y))x`, and `β ↦ βδ(y)` changes the signs; `U` commutes with the centraliser
of `y`.

Let `E` be a CM field. For `y ∈ GL_n(E)`, `ν ∈ ℚ^×` and a matrix `β ∈ M_n(E)`, `y` is an *elliptic similitude of `β`
with multiplier `ν`* if its characteristic polynomial is irreducible, `y*βy = νβ`, and every complex root `r` of the
characteristic polynomial under each `Φ_w` has `r r̄ = ν`. Number the roots at each `w`. For signs `ε = (ε_{w,i})`, a set
`F ⊂ M_n(𝔸_f)` and `x ∈ GL_n(𝔸_f)`, the pair `(y, x)` has *type* `(ε, ν, F)` if for some `β`, `y` is an elliptic similitude
of `β` with multiplier `ν`, `x*βx ∈ F`, and at each `w` the form `β^{Φ_w}·p_w(y^{Φ_w})` is positive definite, `p_w` the
polynomial interpolating `ε_{w,i}` at the `i`-th root. Let `Z` be a set of marks, `K ⊂ GL_n(𝔸_f)` a subgroup, and
`GL_n(E)` act on triples `(qK, y, μ)` by `z·(qK, y, μ) = (zqK, zyz⁻¹, μ)`. For every family `(η_μ)_{μ∈Z}` of sign patterns
with `∏_{w,i} η_{μ,w,i} = 1`, there is a permutation `e` of the `GL_n(E)`-orbits of triples such that for every `y` and
`μ` some `U ∈ GL_n(𝔸_f)` satisfies: (a) for all `ν, ε, F, x`, `(y, x)` has type `(εη_μ, ν, F)` if and only if `(y, Ux)` has
type `(ε, ν, F)`; (b) `U` commutes with every `z ∈ GL_n(E)` that commutes with `y`; (c) `e` maps the orbit of `(qK, y, μ)`
to that of `(UqK, y, μ)`.

*Needs:* 2.1, 3.1; IdelicReciprocityCountsAndCyclotomicClassGroups (class field theory for a CM field `L` over its
totally real subfield: for signs at the infinite places of `L` with product one, an `a ∈ L^×` with `φ(a)` real of the
prescribed sign for every complex embedding `φ`, and a finite idele `z` of `L` with `a·z·z̄ = 1`).

[ShortProof], `Lib/Adelic/TraceFormula/ChangingSigns.lean` (`New.Variety.IsEllipticSimilitude`,
`New.Variety.HasSignType`, `New.Variety.exists_eigenbasis_diag_form`, `New.Variety.exists_aeval_hasSignType_mul_iff`,
`New.Variety.exists_hasSignType_mul_iff`)

### 7.10 Comparison of traces under a simple-zero condition

*Origin:* adapted from the comparison of simple trace formulas for inner forms of unitary groups (Kottwitz, Clozel,
Harris and Taylor, Labesse): here for two hermitian spaces with adelic frames that differ only in their signs at the real
places, with idempotent discrete-series kernels at the real places, a test function cuspidal at a split place with a
simple zero at a second place, and the conclusion an equality of traces on spaces of forms of a level.

*Method of the formal proof:* by 7.7 (b) `vol(K)·tr T` is the geometric side, a sum over polynomials (7.6 (b)); reducible
polynomials vanish (7.6 (d)); irreducible ones with a root off the unit circle vanish (7.8); for the others the orbital
integrals factor (7.7 (d)), the real factors being characters of the compact unitary group at the roots, so that (a)
holds with a constant `c` that does not see the signs: the classes for different signs are matched by 7.9, which needs
the product of the signs to be one, available because the number of infinite places is even, and by Landherr's theorem
(3.3).

Let `E` be a CM field with the 5040 condition and an even number `f` of infinite places, `n ≥ 2`, and `φ` a test function on
`G_f`.

(a) Let `R` be an irreducible monic polynomial over `E` all of whose complex roots under every `Φ_w` lie on the unit
circle, numbered `z_{w,1}, …, z_{w,n}`, and `B ≥ 13n³`. There is `c ∈ ℂ` such that for every sign vector `s`, every space
`V` of signs `s` and every `l` with `e_l` a cusp kernel of order `B` and each `l_w` of gap `500n³ + 10n⁵` for `s`:
`J^V_{{R}}(e_l, φ) = c·∏_w conj χ_{l_w}(diag(z_{w,1}, …, z_{w,n}))`, `χ_{l_w}` the character of the irreducible
representation of `U(n)` whose highest weight is the lowest `K`-type of `l_w` for the signs `(1, …, 1)`.

(b) Let `V`, `V′` be spaces with adelic frames of signs `s`, `s′`, and `l` with each `l_w` of gap `500n³ + 10n⁵` for `s` and
for `s′`. Let `K` be a level, `a ∈ ℂ[G_f]`, `w` a split place and `w′` a finite place, such that `a ⋆ 1_K` is cuspidal at
`w` and every `g` with `(a ⋆ 1_K)(g) ≠ 0` has a simple zero at `w′`. If `T`, `T′` are endomorphisms of `𝒜(V, l, K)` and
`𝒜(V′, l, K)` acting as `a`, then `tr T = tr T′`.

BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a states equal cuspidal multiplicities of inner forms in an odd
number of variables under other hypotheses (pseudo-coefficients, types, all consecutive gaps `100r⁴`); neither
statement implies the other as written.

*Needs:* 3.1, 3.3, 5.2, 5.4, 7.1, 7.3, 7.6, 7.7, 7.8, 7.9; HolomorphicDiscreteSeriesOfUnitaryGroups §§7.1, 7.4 (Weyl
characters, elliptic orbital integrals).

[ShortProof], `Lib/Adelic/TraceFormula/TraceComparison.lean` (`New.Space.exists_geometricSide_singleton_eq`,
`New.trace_comparison`)

### 7.11 The Hecke relation for the stabiliser of a line

*Origin:* particular to this proof: the quadratic relation between the two Hecke operators of the stabiliser of a line
modulo `ϖ` in `GL_n(𝒪)`, on its fixed vectors, with the spherical mean.

*Method of the formal proof:* the product `T⁺T⁻` is computed by counting the cosets of `J diag(ϖ, 1, …, 1)J` and of its
inverse through a given coset, with the counts of linear forms and lines over the residue field; adjointness by
unitarity; the support of powers of `T⁺` by tracking the reduction of the line.

Let `w` be a finite place of a number field, `q = q_w`, `n ≥ 2`, `i ∈ {1, …, n}`, and `J ⊂ GL_n(𝒪_w)` the stabiliser of
the line `k_w e_i` modulo `ϖ_w`. For a complex representation `ρ` of `GL_n(E_w)`, let `T^±` be the Hecke operators of the
double cosets `J diag(ϖ_w, 1, …, 1)^{±1} J` (with `ϖ_w` in the `i`-th position) on `ρ^J`, and `e_sph` the mean over lifts
of `GL_n(k_w)` (the compact mean of 1.4 for `GL_n(𝒪_w)`).

(a) `T⁺T⁻y = q^{n−2}(y + (q^n − 1)·e_sph y)` for `y ∈ ρ^J`.

(b) If `ρ` is unitary, `⟨T⁺x, y⟩ = ⟨x, T⁻y⟩` for `x, y ∈ ρ^J`.

(c) For `m ≥ 1`, the `m`-th power of the group-algebra element of `T⁺` is a combination of `g` such that `gk` has a simple
zero at `w` for every `k ∈ J`.

*Needs:* 1.4, 7.1.

[ShortProof], `Lib/Adelic/TraceFormula/LineStabiliser.lean` (`New.lineStabilizer`, `New.lineRaise`, `New.lineLower`,
`New.lineHecke`, `New.lineRaise_lineLower`, `New.inner_lineRaise`, `New.lineHecke_pow_mem_spanOn`);
`Lib/Adelic/TraceFormula/LineCount.lean` (`New.card_forms_missing_line`, `New.KeepsLine.rootMultiplicity_charpoly`)

### 7.12 Traces from a raising operator, and cutting the level at an auxiliary place

*Origin:* particular to this proof: traces on the fixed vectors of a maximal level are recovered from traces of products
with powers of a raising operator at the level of the stabiliser of a line.

*Method of the formal proof:* (a) Newton's identities for the traces of powers; then the relation `T⁺T⁻ = d(1 + c·e)`
expresses `tr(A e)` through the traces of `A^l T⁺^i`. (b) is (a) for the relation of 7.11 (a) on the fixed vectors of
the cut level, with `e = e_sph` the projector onto the vectors fixed by the maximal level at `v`; (c) is bookkeeping of
supports at `v`.

(a) Let `M` be a finite-dimensional complex inner product space, `T⁺`, `T⁻ = (T⁺)*`, `e` an idempotent and `A` an
operator commuting with `T⁺` and `T⁻`, with `T⁺T⁻ = d(1 + c·e)` for real `d, c > 0`. Then the traces of `A^l (T⁺)^i`,
`l, i ≥ 1`, determine `tr(Ae)`. Over `ℂ`, the traces of all powers of an operator determine its characteristic polynomial.

(b) Let `ρ`, `ρ′` be unitary representations of `G_f`, `v` a split place, `K` a level containing `ι_v(GL_n(𝒪_v))`, and
`K′ = {g ∈ K : g_v ∈ J}` with `J` the stabiliser of the line of `e_i` modulo `ϖ_v` (7.11), with `ρ^{K′}`, `ρ′^{K′}`
finite-dimensional. Let `a ∈ 𝔄(K)` be a combination of elements whose component at `v` lies in `GL_n(𝒪_v)`, and `a′` the
element obtained from `a` by removing the components at `v` and `v̄`. If `(T⁺)^{m+1}(a′)^{l+1}` has the same trace on
`ρ^{K′}` and on `ρ′^{K′}` for all `l, m ≥ 0`, then `a` has the same trace on `ρ^K` and on `ρ′^K`.

(c) In (b), `a′ ⋆ 1_{K′}` is `a ⋆ 1_K` cut off to the points whose component at `v` lies in `J`; it is cuspidal at a split
place `w ≠ v, v̄` if `a ⋆ 1_K` is; and a product with a factor at `v` in the span of a set `Σ ⊂ GL_n(E_v)` has its test
function supported at `v` in `Σ·J`.

*Needs:* 3.1, 3.2, 7.1, 7.11.

[ShortProof], `Lib/Adelic/TraceFormula/LineDeterminant.lean` (`New.charpoly_eq_of_trace_pow_eq`,
`New.LineRelation.trace_mul_mean_eq`); `Lib/Adelic/TraceFormula/LevelCut.lean` (`New.cutLevel`,
`New.lineRelation_offAction`, `New.trace_eq_of_trace_cutLevel_eq`); `Lib/Adelic/TraceFormula/OffPlace.lean`
(`New.offPlace`, `New.convIndicator_mapDomain_offPlace`, `New.IsCuspidalAt.convIndicator_offPlace`,
`New.exists_atPlace_eq_of_convIndicator_ne_zero`)

### 7.13 Comparison of traces for cuspidal test functions

*Origin:* adapted from the comparison of simple trace formulas for inner forms of unitary groups (Kottwitz, Clozel,
Harris and Taylor, Labesse): here the comparison of 7.10 without the condition at a second place, for test functions
cuspidal at one split place.

*Method of the formal proof:* an auxiliary split place `v`, different from `w` and `w̄`, at which `K` is maximal and `a` is
integral, is chosen; the level is cut at `v` to the stabiliser of a line, where the positive powers of `T⁺` force the
simple zero (7.11 (c)), so 7.10 (b) applies to `(T⁺)^{m+1}(a′)^{l+1}`, and 7.12 (b) returns to the level `K`. The spaces
at the cut level are finite-dimensional by 5.4 (e).

Let `E` be a CM field with the 5040 condition and an even number of infinite places, `n ≥ 2`, `V`, `V′` spaces with adelic
frames of signs `s`, `s′`, and `l` with each `l_w` of gap `500n³ + 10n⁵` for `s` and for `s′`. Let `K` be a level, `a ∈ 𝔄(K)`
(7.1), and `w` a split place with `a ⋆ 1_K` cuspidal at `w`. If `T`, `T′` are endomorphisms of `𝒜(V, l, K)` and
`𝒜(V′, l, K)` acting as `a`, then `tr T = tr T′`.

*Needs:* 5.2, 5.4, 6.3 (c), 7.1, 7.10, 7.11, 7.12.

[ShortProof], `Lib/Adelic/TraceFormula/CuspidalComparison.lean` (`New.eventually_mem_spanOn_atPlace_mem_localIntGL`,
`New.exists_auxiliary_place`, `New.trace_eq_of_isCuspidalAt`)

## Results taken from other roadmaps

- Witt's extension theorem over a field with involution, in the matrix form used (left invertible `X, Y` with
  `X*JX = Y*JY` satisfy `gX = Y` with `g ∈ U(J)`): HermitianFormsAndLattices §1.1 (b).
- The transference bound for the covering radius of a lattice against the first minimum of its dual:
  GeometryOfNumbersAndQuadraticArithmetic §4.4 (item 4.4.14).
- The dimension of spaces of algebraic modular forms when all stabilisers are trivial (the number of classes times the
  dimension of the coefficients): DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5c.

## What the library already provides

- The integral finite adeles are compact and open, `𝓞_E` is dense in them and `E` is dense in the finite adeles:
  `IsDedekindDomain.FiniteAdeleRing.isCompact_integralAdeles`, `IsDedekindDomain.FiniteAdeleRing.isOpen_integralAdeles`,
  `IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap_integralAdeles`,
  `IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap`.
- Base change and Galois descent for finite adeles: `TauCeti.GlobalNumberFields.finiteAdeleBaseChangeEquiv`,
  `IsDedekindDomain.finiteAdeleExtension`, `TauCeti.GlobalNumberFields.mem_range_adeleExtension_iff`.
- The norm map on ideles preserves the module: `TauCeti.GlobalNumberFields.ideleNorm_ideleNormMap`, with the norm map of
  finite adeles `TauCeti.GlobalNumberFields.finiteAdeleNorm`.
- The module of an idele as a continuous homomorphism and the product formula:
  `TauCeti.GlobalNumberFields.ideleNorm`, `TauCeti.GlobalNumberFields.ideleNorm_unitEmbedding`,
  `NumberField.FiniteAdeleRing.unitEmbedding_norm_eq_inv_abs_norm`.
- A number field is discrete and cocompact in its adeles: `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`,
  `TauCeti.GlobalNumberFields.compactSpace_quotient_principalSubgroup`.
- Hasse's norm theorem for cyclic extensions of number fields: `TauCeti.ClassFieldTheory.cyclicHasseNorm`.
- An operator commuting with a group commutes with its group algebra, and the group-algebra map is compatible with
  push-forward: `Representation.commute_asAlgebraHom_of_forall_commute`, `MonoidAlgebra.lift_mapDomain`.
