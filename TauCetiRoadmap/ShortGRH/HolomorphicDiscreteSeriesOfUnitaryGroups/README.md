# Holomorphic discrete series of unitary groups

The argument proves the Riemann hypothesis for Dirichlet L-functions through a one-sided bound for a weighted sum
over primes, which gives a zero-free half-plane. The bound comes from comparing an upper and a lower bound for the
covolume of a lattice of theta lifts between definite unitary groups. This roadmap states what the argument needs
about the real unitary groups `U(p, q)` and their discrete series, at the real places of the CM field.

They enter in four ways.

- Forms on the unitary groups of the argument are fixed, at each real place, by a kernel `e_λ = deg_λ·conj c_λ` (their
  *type*). Spaces of such forms must consist of cusp forms, and the kernel must be an idempotent.
- Theta lifts between spaces of different signatures carry forms of one type to forms of another. This is the local
  theta correspondence of discrete series at the real places.
- The spanning theorem bounds a second moment of Poincaré series. Its archimedean factors are Bessel functions on a
  real unitary group `G₁`. Its unfolding needs the Haar measures of `G₁` and of its unipotent subgroups, fibre
  measures of Gram maps, the big cell of the Bruhat decomposition, and measures on the floors of a tower of
  subgroups.
- The comparison of the trace formulas of two inner forms that differ only at the real places needs the formal degree
  of `e_λ` and the stable sum of its elliptic orbital integrals.

Throughout, the roadmap works with one explicit function: Flensted-Jensen's integral `c_λ` over the maximal compact
subgroup, an average of products of principal minors. For a parameter whose entries of different signs are far
apart, it is the coefficient of the lowest `K`-type of a discrete series. The shorter proof never constructs a
discrete series representation. Instead it does four things:

- it proves the properties of `c_λ` that it uses directly from the integral;
- it builds the module that `c_λ` generates inside `L²`;
- it recognises `c_λ` as the coefficient of a `K`-highest vector of the right weight and Casimir value in any unitary
  representation of polynomial growth (rigidity);
- it states the local theta correspondence as statements about the operators `π(e_λ)` on a Fock space.

So most sections here are about one function, with explicit gaps and constants, where the literature has theorems
about representations.

Layer 1 constructs the compact-dual Haar measure on the unitary group `U(J)` of a hermitian involution and computes
fibre measures of the Gram map. Layer 2 treats the unitary group of `ϱ` hyperbolic planes plus a middle block:
its floors, the Bessel subgroup, the big cell, the real group `G₁` with its unipotent Haar measures and the bounds
for Bessel functions. Layer 3 does measure theory at a place: quadrics, Fourier kernels, the complex place and the
measures of the floors. Layer 4 defines parameters, `c_λ`, `𝔤𝔩_n`-modules and holomorphic functions of a weight, and
proves the facts about highest vectors that the later layers use. Layer 5 proves the properties of `c_λ`. Layer 6
proves rigidity, the vanishing of constant terms, the value of `c_λ` in the holomorphic chamber and the location of
the peaks of bounded holomorphic forms. Layer 7 computes Weyl characters, `K`-type multiplicities, orbital integrals
and the formal degree. Layer 8 states the local theta correspondence on Fock space.

The statements of this roadmap are used in `SecondMomentsOfPoincareSeries`, `PairsOfFramesAtOnePlace` and
`RemainingAndMainTermsOfSecondMoments` (Layers 1–3 and 5), in `ThetaLiftChainsAndTheSeesawIdentity` and
`WeilRepresentationsOnBanachSpacesOfData` (Layers 5, 6 and 8), in `NormsOfThetaLiftsAndExchangeIdentities`
(Layers 5 and 6), and in `AdelicUnitaryGroupsAndAlgebraicModularForms` (Layers 6 and 7: cusp kernels and the trace
formula comparison). In turn it cites sections of `OneSidedPrimeSumBoundsAndAdmissibleData`,
`ThetaLiftChainsAndTheSeesawIdentity`, `AdelicUnitaryGroupsAndAlgebraicModularForms`,
`SiegelWeilAndRallisFormulasOnUnitaryGroups`, `PairsOfFramesAtOnePlace`, `IntegralRepresentationsOfGeneralLinearGroups`
and `WeilRepresentationsOnBanachSpacesOfData`, and of `RepresentationTheory/ClassicalGroups` and
`RepresentationTheory/CompactGroups`.

## Conventions and notation

**Labels.** Every section that states something carries `*Origin:*`, which says where the statement comes from, and
`*Method of the formal proof:*`, which says how the shorter formal proof proves it, as in the family
`RiemannHypothesisForDirichletLFunctions`. `[ShortProof]` is the shorter formal proof; its pointers are paths under
its directory `src/`.

**Forms and matrices.**
- Hermitian forms are conjugate-linear in the first variable: `h(u, w) = u*Jw` for a hermitian matrix `J`.
- `M*` is the conjugate transpose.
- Matrices act on column vectors.
- `‖g‖` is the operator norm of a complex matrix for the standard hermitian inner product.
- A complex matrix `z` is *accretive* if `z + z*` is positive definite.

**Measures.**
- `μ ∗ μ′` is the convolution of measures on a group, the law of `xy` for `x ∼ μ`, `y ∼ μ′`.
- `δ_s` is the unit mass at `s`.
- Integrals of `[0, ∞]`-valued functions are lower integrals.
- On a compact group, `dk` is the Haar probability measure.
- Lebesgue measure on `ℂ^m` is the product of the Lebesgue measures of the real and imaginary parts.
- `dS` on skew-hermitian `n × n` matrices is Lebesgue measure in the coordinates `Im S_aa` and `Re S_ab`, `Im S_ab`
  for `a < b`. `dT` on hermitian matrices is Lebesgue measure in `T_aa` and `Re T_ab`, `Im T_ab` for `a < b`.
- `dY` on `M_{n×m}(ℂ)` is Lebesgue measure.

**The data.** Most sections do not use the data of the argument. The letters `ϱ` (hyperbolic planes), `X₀` (the
definite space, of rank `k`) and `N` (the norm of the extra line of `Y₀`) are those of
OneSidedPrimeSumBoundsAndAdmissibleData §3.2 and ThetaLiftChainsAndTheSeesawIdentity §2.1 (the data and the spaces
`Y_j`). The real group `G₁` of Layer 2 is the archimedean form of the unitary group of `Y₀`, with `N` replaced by
`1`.

### Table of symbols

| Symbol | Meaning | Defined in |
|---|---|---|
| `U(J)`, `𝔲(J)` | unitary group `{g : g*Jg = J}` of a hermitian matrix `J`, its Lie algebra `{X : X*J + JX = 0}` | 1.1 |
| `μ^c_J`, `vol U(n)` | compact-dual Haar measure on `U(J)`; `vol U(n) = ∏_{i=1}^{n} 2π^i/(i − 1)!` | 1.1 |
| `ε`, `G_ε`, `K_ε` | sign vector in `{±1}^n`; `G_ε = U(diag ε) ≅ U(p, q)`; `K_ε = G_ε ∩ U(n)` | 1.1 |
| `ϱ`, `κ`, `k`, `r` | number of hyperbolic planes; index set of `X₀`, with `k = |κ|`; rank `r = 2ϱ + k + 1` | 2.1 |
| `e_a`, `e*_a`, `x_i`, `z` | the basis: hyperbolic pairs (`a < ϱ`), basis of `X₀` (`i ∈ κ`), the extra vector | 2.1 |
| `f_b`, `Z(γ)`, `δ_j` | frame `(e_0, …, e_{ϱ−1}, z)`; frame Gram matrix `(h(f_a, γf_b))`; its leading minors | 2.1 |
| `H_l`, `𝒩_l`, `𝒩_{<l}`, `Q_l` | floor groups | 2.1 |
| `𝖴`, `𝖴⁰`, `H`, `S`, `σ(s)` | Bessel unipotent group, its frame fixer, `U(X₀)`, the Bessel subgroup, its additive functional | 2.1 |
| `w_p`, `ν_a(v, β)` | Weyl elements; Heisenberg elements of floor `a` | 2.1, 2.3 |
| `G₁`, `ψ_∞` | real group of `J₁ = diag(hyperbolic, 1_κ, −1)`; `ψ_∞(c) = exp(c − c̄)` | 2.5 |
| `A`, `τ`, `δ`, `ν`, `mod`, `ψ`, `c_A` | a place and its data | 3.1 |
| `l = 2λ`, `ρ`, `ρ_c`, `Λ`, `κ_λ` | doubled parameter; half-sums of positive and compact positive roots; lowest `K`-type `Λ = λ + ρ − 2ρ_c`; `κ_λ = |λ|² − |ρ|²` | 4.1 |
| `m_w` | product of principal minors of weight `w` | 4.1 |
| `c_λ`, `deg_λ`, `e_λ` | Flensted-Jensen's function, `deg_λ = (∫|c_λ|²)⁻¹`, `e_λ = deg_λ·conj c_λ` | 4.1 |
| `π(f)` | `∫ f(g)π(g) dg` | 4.2 |
| `T = (σ, γ, γ′)`, `𝒫` | a Fock datum; polynomials in the variables `z_{rc}` | 8.1 |

## Layer 1: Haar measure on the unitary group of a hermitian involution

The compact-dual Haar measure on `U(J)`, the polar formula for the Gram map on bases, the volume of `U(n)`, covering
bounds for norm balls, and measures below the fibre measures of the Gram map.

### 1.1 Unitary groups of hermitian involutions and their compact-dual measure

*Origin:* definitions and conventions.

*Method of the formal proof:* The groups are matrix groups with the topology of a closed set of matrices. The
measure is defined by a chart, so its normalisation is explicit for every signature.

(a) A *hermitian involution* is `J ∈ M_n(ℂ)` with `J* = J` and `J² = 1`. Its unitary group is
`U(J) = {g ∈ GL_n(ℂ) : g*Jg = J}`, with the topology of a closed subset of `M_n(ℂ)`. Its Lie algebra is
`𝔲(J) = {X : X*J + JX = 0}`, with `exp : 𝔲(J) → U(J)`. For a sign vector `ε ∈ {±1}^n`:
- `G_ε = U(diag ε)`, isomorphic to `U(p, q)` with `p`, `q` the numbers of signs `+1`, `−1`;
- `K_ε = G_ε ∩ U(n)`, its maximal compact subgroup: the block diagonal elements, those commuting with `diag ε`;
- `K_ε` carries its Haar probability measure `dk`.

(b) Put `vol U(n) = ∏_{i=1}^{n} 2π^i/(i − 1)!`, the product of the areas of the unit spheres of `ℂ, ℂ², …, ℂ^n`.

(c) *The compact-dual measure.* Let `J` be a hermitian involution of size `n`. For a skew-hermitian `S` with
`det(1 − JS/2) ≠ 0` put `c_J(S) = (1 + JS/2)(1 − JS/2)⁻¹`, an element of `U(J)`. The measure `μ^c_J` on `U(J)` is the
image under `c_J` of the measure `|det(1 − JS/2)|^{−2n}·dS/vol U(n)` on the open set of these `S`. The density in
the chart is the same function of `S` for every signature. When no confusion arises, `μ^c_J` is written `dg`.

(d) *The Gram map.* For a hermitian `J` of size `r` and `Y ∈ M_{r×m}(ℂ)` put `Gram_J(Y) = Y*JY`, a hermitian
`m × m` matrix, read in the coordinates of `dT`.

(e) *Fibre measures.* Let `π : X → B` be a continuous map between finite-dimensional real vector spaces with Lebesgue
measures, and `b ∈ B`. A measure `l` on `X` is *below the fibre measure of `π` over `b`* if the following holds for
every lower semicontinuous `K : X → [0, ∞]` and every `C ∈ [0, ∞]`: if some neighbourhood `O` of `b` has
`∫_{π⁻¹(S)} K dx ≤ C·vol(S)` for every open `S ⊆ O`, then `∫ K dl ≤ C`.

(f) For a hermitian involution `J` of size `r`, a matrix `E ∈ M_{r×m}(ℂ)` and a measure `m` on `U(J)`, say that *`m`
is below the Gram fibre at `E`* if the image of `m` under `g ↦ gE` is below the fibre measure of `Gram_J` over
`Gram_J(E)`.

*Needs:* none.

[ShortProof], `Lib/DiscreteSeries/Haar/CayleyChart` (`New.cayleyChart`, `New.volU`, `New.haarU`),
`Lib/DiscreteSeries/FlenstedJensen/Defs` (`New.maxCompactU`, `New.haarK`, `New.unitaryLie`),
`Lib/DiscreteSeries/Haar/GramFibre` (`New.LeGramFibre`), `Lib/General/Measure/FibreMeasure` (`New.LeFibreMeasure`)

### 1.2 The compact-dual measure is a Haar measure

*Origin:* adapted from the published theory of Haar measure on unitary groups in Cayley coordinates: here, for
every hermitian involution, with the normalisation of 1.1 (c) and invariance under all maps `g ↦ agb` between
unitary groups of two involutions.

*Method of the formal proof:* The Jacobian of the chart is computed from the logarithmic derivative `Φ*J dΦ`, which is
skew-hermitian. A linear isomorphism that matches two volumes normalised by the same Gaussian integral preserves
measure. No chart covers almost all of `U(J)` a priori. Instead, multiplying by a generic scalar `e^{it}` moves almost
every point of any parametrisation into the chart, and this gives the invariance.

Let `J`, `J′` be hermitian involutions of size `n`. Prove that:

(a) `c_J` is injective on `{S : det(1 − JS/2) ≠ 0}`, and every `g ∈ U(J)` with `g + 1` invertible is `c_J(S)` for one
such `S`;

(b) let `a, b ∈ GL_n(ℂ)` and `t ∈ ℝ^×` with `b*(tJ)b = J′`, and suppose that `g ↦ agb` is a bijection
`U(J) → U(J′)`. Then it carries `μ^c_J` to `μ^c_{J′}`. This covers left and right translations, conjugation by
permutation matrices, and `U(J) = U(−J)`;

(c) `μ^c_J` is a left and right Haar measure on `U(J)`.

The library has the chart for `J = 1` as algebra: `Matrix.cayley` and `Matrix.IsHermitian.cayley_mem_unitaryGroup`.
It has no measure, Jacobian or injectivity statement for it.

*Needs:* 1.1.

[ShortProof], `Lib/DiscreteSeries/Haar/CayleyChart` (`New.cayleyChart_injOn`, `New.cayleyChart_cayleyChartInv`,
`New.lintegral_eq_cayleyChart`, `New.measurePreserving_haarU`)

### 1.3 The polar formula for the Gram map on bases

*Origin:* adapted from Weil (1961), the densities as volumes of fibre measures (HermitianFormsAndLattices §6.1 (f)):
here, at one real place, for bases, in Lebesgue coordinates. The constant is `vol U(r)/2^r` relative to `μ^c_J`, the
same for every signature.

*Method of the formal proof:* Near `J` the Gram map has a section, by the inverse function theorem applied on the
slice `1 + JX/2`. For `Y = γσ(T)` the matrix `Y*J dY` has hermitian part `dT/2`. For fixed `T` it is
`σ*(Jγ⁻¹dγ)σ`, which is skew-hermitian. With the Cayley density of 1.1 this gives the Jacobian. The changes of
variables needed are: joining blocks of columns, `Y ↦ PYQ` with Jacobian `|det P|^{2m}|det Q|^{2n}`, `T ↦ C*TC`
on hermitian matrices, the splitting `Z = S + T/2` into skew-hermitian and hermitian parts with
`dZ = 2^{−n}dS dT`, and cutting a hermitian matrix into blocks.

Let `J` be a hermitian involution of size `r`. Prove that:

(a) there are an open set `V` of hermitian `r × r` matrices containing `J` and a measurable map `σ` from hermitian
matrices to `M_r(ℂ)`, differentiable on `V`, with invertible values and `σ(T)*Jσ(T) = T` on `V`, and `σ(J) = 1`;

(b) for every such pair `(V, σ)` (`V` open, `σ` measurable, differentiable on `V`, with invertible values and
`Gram_J ∘ σ = id` on `V`) and every measurable `K ≥ 0` on `M_r(ℂ)`:
`∫_{Y : Y*JY ∈ V} K(Y) dY = (vol U(r)/2^r)·∫_V ∫_{U(J)} K(γσ(T)) dμ^c_J(γ) dT`.

*Needs:* 1.1, 1.2.

[ShortProof], `Lib/DiscreteSeries/Haar/GramPolar` (`New.exists_isGramSection`, `New.IsGramSection.lintegral_eq`),
`Lib/DiscreteSeries/Haar/GramCoordinates` (`New.lintegral_eq_det_mul_comp_mul_mul`,
`New.lintegral_eq_skewOfReal_add_hermOfReal`)

### 1.4 The volume of `U(n)`

*Origin:* adapted from Braun (1941), Shimura (1997) and Siegel (1935–1937), the archimedean densities of positive
Hermitian forms (HermitianFormsAndLattices §6.1b): here, the density of the Gram map `Y ↦ Y*Y` near the identity in
Lebesgue coordinates, and the total mass of `U(n)` for `μ^c_1`.

*Method of the formal proof:* Induction on `n`. One column ranges over a sphere: the law of the squared norm of a
vector of `ℂ^n` has density `π^n r^{n−1}/(n − 1)!`. The components of the other columns orthogonal to it form a
square matrix of size `n − 1`. Comparing the result with 1.3 for `J = 1` on a small open set gives the mass.

Prove that:

(a) there is an open set `W` of hermitian `n × n` matrices containing `1` such that, for every measurable `G ≥ 0`
supported in `W`, `∫_{M_n(ℂ)} G(Y*Y) dY = (vol U(n)/2^n)·∫ G(T) dT`;

(b) `μ^c_1` is a probability measure on `U(n)`; by uniqueness of Haar measure it is the Haar probability measure `dk`
of `U(n)`.

*Needs:* 1.1, 1.3.

[ShortProof], `Lib/DiscreteSeries/Haar/TotalMass` (`New.exists_hasGramDensity`, `New.isProbabilityMeasure_haarU`)

### 1.5 Covering bounds for norm balls

*Origin:* particular to this proof: a covering bound comparing norm balls in a group mapping to `U(J)`, with explicit
constants, and the resulting bound for the integral of `(2/‖j(s)y‖)^c`.

*Method of the formal proof:* The covering argument takes place in the real space `M_n(ℂ)` of dimension `2n²`. Balls of
radius `1/(2D)` around points of the norm ball of radius `R` are compared by volume. The integral bound integrates
the covering bound over the level sets of the norm.

Let `J` be a hermitian involution of size `n ≥ 1`, `S` a group with measurable multiplication and a right-invariant
measure `ν`, and `j : S → U(J)` a homomorphism. Prove that:

(a) for `D, R ≥ 1`, `K ≥ 3DR²` and `y ∈ U(J)`:
`ν{s : ‖j(s)y‖ ≤ R} ≤ K^{2n²}·ν{s : ‖j(s) − 1‖ ≤ 1/D}`;

(b) let `S` moreover be a topological group with its Borel structure, `ν` finite on compact sets, and `j` proper.
Then for every integer `c > 8n²` and every `y ∈ U(J)` the function `s ↦ (2/‖j(s)y‖)^c` is `ν`-integrable, and
`∫ (2/‖j(s)y‖)^c dν(s) ≤ 16^c·ν{s : ‖j(s) − 1‖ ≤ 1}`;

(c) `U(J)` is a proper metric space for the operator norm, and its norm balls `{‖g‖ ≤ T}` are compact.

*Needs:* 1.1.

[ShortProof], `Lib/DiscreteSeries/Haar/TotalMass` (`New.DiscreteSeries.measure_ball_le_covering`,
`New.DiscreteSeries.integral_decay_le`, `New.DiscreteSeries.lintegral_decay_le`, `New.isCompact_U_norm_le`)

### 1.6 Measures below the Gram fibre

*Origin:* adapted from Weil (1961), the densities as volumes of fibre measures (HermitianFormsAndLattices §6.1 (f)):
here, one-sided comparisons at one real place. They are exact for bases. For tuples built by choosing vectors in
turn they are lower bounds for the fibre measure, and degenerate Gram matrices are allowed.

*Method of the formal proof:* For bases, the indicator function of the open set of the `γσ(T)` with `γ` in an open
set is tested against 1.3, and the outer regularity of Haar measure concludes. For appending, the Gram matrix is cut
into the Gram matrix of the first columns and the other two blocks. One takes the fibre of the first map, and on it
the fibre of the second.

Let `J` be a hermitian involution of size `r`. Prove that:

(a) *(bases)* a measure `m` on `U(J)` that is below the Gram fibre at `1` satisfies `m ≤ (vol U(r)/2^r)·μ^c_J`, and
`(vol U(r)/2^r)·μ^c_J` is itself below the Gram fibre at `1`;

(b) *(appending vectors)* let the columns of `E` be those of `E₁` and `E₂`, in some order. Let `m`, `m′` be s-finite
measures on `U(J)` with the following properties:
- `m` is below the Gram fibre at `E₁`;
- `m′`-almost every `g` fixes the columns of `E₁`;
- the image of `m′` under `g ↦ gE₂` is below the fibre measure of `y ↦ (E₁*Jy, y*Jy)` over `(E₁*JE₂, E₂*JE₂)`.

Then `m ∗ m′` is below the Gram fibre at `E`;

(c) *(one more vector)* the case of (b) where `E₂` is one vector `v`, the second map being
`y ↦ (E₁*Jy, h(y, y))`. In particular, let `p` be a set of indices, `j ∉ p` and `q = p ∪ {j}`. If `m` is below the
Gram fibre at `(e_i)_{i∈p}`, `m′` fixes these `e_i` almost everywhere, and the law of `ge_j` under `m′` is below the
fibre measure of `y ↦ (((Jy)_i)_{i∈p}, h(y, y))` over its value at `e_j`, then `m ∗ m′` is below the Gram fibre at
`(e_i)_{i∈q}`.

*Needs:* 1.1–1.3; AuxiliaryAlgebraAndAnalysisForThetaLifts (measures below a fibre measure: images, composition of
two maps).

[ShortProof], `Lib/DiscreteSeries/Haar/GramFibre` (`New.LeGramFibre.le_haar`, `New.leGramFibre_haar`,
`New.LeGramFibre.append`, `New.LeGramFibre.append_vector`, `New.LeGramFibre.insert`)

## Layer 2: The split unitary group, its floors and the Bessel subgroup

The unitary group of `ϱ` hyperbolic planes plus a middle block, over a commutative ring with involution, and its
archimedean form `G₁`. The subgroups are the floor groups, the Bessel unipotent group and the Bessel subgroup. The
section results are invariance of frame minors, the big cell, Haar measures on the unipotent groups, the fibre
measure on frames, and Schur's bound for Bessel functions.

### 2.1 The split form, floors, levels and the subgroups

*Origin:* definitions and conventions.

*Method of the formal proof:* All groups are matrix groups cut out by conditions on entries in a fixed basis that is
graded by level and by floor.

(a) *The basis and the form.* Let `R` be a commutative ring with involution `x ↦ x̄`, `ϱ ≥ 0`, and `κ` a finite set
with a distinguished element `k₀`. The basis `𝐁` consists of `e_0, …, e_{ϱ−1}`, `x_i` (`i ∈ κ`), `z`,
`e*_0, …, e*_{ϱ−1}`. The *middle block* is spanned by the `x_i` and `z`. For a hermitian matrix `T` on `κ ⊔ {z}`,
the *split form* `J_T` on `R^𝐁` is defined as follows:
- `h(e_a, e*_b) = δ_ab` and `h(e_a, e_b) = h(e*_a, e*_b) = 0`;
- the hyperbolic pairs are orthogonal to the middle block;
- the middle block has Gram matrix `T`.

`G_T = U(J_T)` is its unitary group in `GL_𝐁(R)`. Two forms are used:
- `T = diag(1_κ, −N)`, for `N ∈ R`;
- over `ℂ`, `T₁ = diag(1_κ, −1)`.

(b) *Levels and floors.*
- `level(e_a) = a`, `level(x_i) = level(z) = ϱ`, `level(e*_a) = 2ϱ − a`.
- `floor(e_a) = floor(e*_a) = a`, `floor(z) = ϱ`, `floor(x_i) = ϱ + 1`.
- `V_l` is the span of the basis vectors of floor at least `l`.

(c) *The frame.* `f_b = e_b` for `b < ϱ` and `f_ϱ = z`.
- `Z(γ) = (h(f_a, γf_b))_{a,b≤ϱ}` is the frame Gram matrix of `γ`, and `δ_j(γ)` its leading principal `j × j` minor
  (`δ_0 = 1`).
- `γ_F = (γ_{f_a f_b})` is the frame block of `γ`.

(d) *The subgroups of `G_T`.*
- `H_l`: the elements that fix every basis vector of floor `< l`.
- `𝖴`: the elements that are block upper unitriangular for the levels, that is, `g e_j − e_j` lies in the span of
  the basis vectors of level `< level(e_j)` for every basis vector `e_j`.
- `𝒩_{<l}`: the elements that are block unitriangular when the basis vectors of floor `< l` keep their level and all
  others get level `ϱ`.
- `𝒩_l = H_l ∩ 𝒩_{<l+1}`.
- For `l ≤ ϱ + 1`, `Q_l = {g : g f_b − f_b ∈ ⟨e_c : c < b⟩ for all b < l}`. For `l ≥ ϱ + 2`, `Q_l = 𝖴`.
- `S = Q_{ϱ+1}` is the *Bessel subgroup*.
- `H = H_{ϱ+1}` fixes all `e_a`, `e*_a` and `z`; for `T = diag(1_κ, −N)` with `N` a unit it is the unitary group of
  the `x_i` (2.5 (a)).
- `𝖴⁰` is the set of elements of `𝖴` that fix every frame vector.

(e) *Weyl elements and the functional `σ`.*
- For `j ≤ ϱ` and units `p_0, …, p_{j−1}`, the *Weyl element* `w_p` sends `e_a ↦ p_a e*_a` and `e*_a ↦ p̄_a⁻¹ e_a`
  for `a < j`, and fixes the other basis vectors. It lies in `G_T`.
- For `γ ∈ G_T` put `σ(γ) = Σ_{a<ϱ} γ_{f_a, f_{a+1}}`, the sum of the entries just above the diagonal of the frame
  block.

(f) *Congruence subgroups.* For a subring `𝒪 ⊆ R` stable under the involution and a unit `g` of `R`, `K_𝒪(g)` is the
set of `γ ∈ G_T ∩ GL_𝐁(𝒪)` with `g⁻¹(γ − 1)` integral over `𝒪`.

*Needs:* none.

[ShortProof], `Lib/General/Groups/BesselGroups` (`New.Shape`, `New.Shape.Form.splitGram`, `New.BesselIndex.level`,
`New.Shape.besselFrame`, `New.Shape.Form.frameGram`, `New.Shape.Form.besselU`, `New.Shape.Form.besselU0`),
`Lib/DiscreteSeries/Bruhat/FloorGroups` (`New.Shape.Form.floorGroup`, `New.Shape.Form.unipotentBelow`,
`New.Shape.Form.partialUnitriangularGroup`, `New.Floors.FloorGroups.weylElem`, `New.simpleRootSum`)

### 2.2 Floor groups and the Bessel subgroup

*Origin:* adapted from the Bruhat decomposition and the Bessel data of a pair of unitary groups
(GanGrossPrasadUnitaryGroups §1.2): here, over a commutative ring with involution. The section gives the tower of floor
groups, the invariance of the leading minors of the frame Gram matrix, the normaliser of `𝖴`, the additive
functional `σ`, and a coset statement for congruence subgroups.

*Method of the formal proof:* Entry computations in the graded basis. An element of `Q_l` is block triangular on the
columns of the first `l` frame vectors, so the leading minors of `Z` of order at most `l` do not see it on the right.
The relation `J s⁻¹ = s*J` moves a factor on the left to the right. An element of `S` is block upper triangular for
the levels, and conjugation by such a matrix keeps the unitriangular group.

Prove that:

(a) `H_l` decreases from `H_0 = G_T` to `H_l = {1}` for `l ≥ ϱ + 2`. `𝒩_{<l}` increases and equals `𝖴` for `l ≥ ϱ`.
`Q_l` decreases, `Q_{ϱ+2} = 𝖴`, and `𝖴 ⊆ Q_l` and `H_l ⊆ Q_l` for every `l`;

(b) for `s, s′ ∈ Q_l`, `γ ∈ G_T` and `j ≤ min(l, ϱ + 1)`: `δ_j(s⁻¹γs′) = δ_j(γ)`. In particular every leading minor of
`Z(γ)` is constant on the double cosets `𝖴γ𝖴`;

(c) for `l ≤ ϱ` and `j ≤ l`, the Weyl element of the first `l` pairs has `δ_j(w_p) = p_0⋯p_{j−1}`, and it commutes
with `H_l`;

(d) `S` normalises `𝖴`;

(e) `σ(su) = σ(s) + σ(u)` and `σ(s⁻¹) = −σ(s)` for `s, u ∈ S`, and `σ = 0` on `H`;

(f) let `𝒪 ⊆ R` be a subring stable under the involution and `g` a unit. If `h, h′ ∈ H`, `u, u′ ∈ 𝖴` and
`y ∈ G_T` satisfy `uhy ∈ K_𝒪(g)` and `u′h′y ∈ K_𝒪(g)`, then `h′h⁻¹ ∈ K_𝒪(g)`. So the `h ∈ H` with
`hy ∈ 𝖴·K_𝒪(g)` form one right coset of `H ∩ K_𝒪(g)`.

*Needs:* 2.1.

[ShortProof], `Lib/DiscreteSeries/Bruhat/FloorGroups` (`New.Floors.FloorGroups.leadingMinor_frameGram_partialUnitriangularGroup_mul`,
`New.Filling.leadingMinor_frameGram_besselU_mul`, `New.Floors.FloorGroups.leadingMinor_frameGram_weylElem`,
`New.Floors.FloorGroups.commute_weylElem`, `New.besselS_le_normalizer_besselU`, `New.simpleRootSum_mul`,
`New.simpleRootSum_eq_zero_of_mem_besselH`, `New.div_mem_unitaryLevel_of_besselU_mul`),
`Lib/DiscreteSeries/Bessel/SchurBound` (`New.Filling.simpleRootSum_inv`)

### 2.3 The Heisenberg groups of the floors

*Origin:* adapted from the published theory of the unipotent radicals of isotropic flags in unitary groups (Eichler
transformations): here, one floor at a time, over a commutative ring with involution that has an element of trace one.

*Method of the formal proof:* An element of `𝒩_a` is determined by the image of `e*_a`, which is an isotropic vector of
`V_a` pairing to `1` with `e_a`. Every such vector is reached by an explicit Eichler map. The factorisation of `𝖴` is
an induction on the floors: each step peels off the factor of the lowest floor.

Let `R` have an element `τ` with `τ + τ̄ = 1`, and let `J_T` be invertible. For `a < ϱ`, `v ∈ V_{a+1}` and `β ∈ R`
with `β̄ = −β`, let `ν_a(v, β)` be the isometry
`w ↦ w + w(e*_a)·v + ((β − τh(v, v))·w(e*_a) − h(v, w))·e_a`, where `w(e*_a)` is the coordinate of `w` at `e*_a`. It
sends `e*_a` to `e*_a + v + (β − τh(v, v))e_a`, and it fixes `e_a` and the basis vectors of floor `< a`. Prove that:

(a) `ν_a(v, β) ∈ 𝒩_a`, and every element of `𝒩_a` is `ν_a(v, β)` for some `(v, β)`;

(b) `u ↦ ue*_a` is a bijection from `𝒩_a` onto the vectors `y ∈ V_a` with `h(y, y) = 0` and `h(e_a, y) = 1`;

(c) every `u ∈ 𝒩_{<j}` is `u_0u_1⋯u_{j−1}` with `u_l ∈ 𝒩_l`, with unique factors. In particular `𝖴 = 𝒩_0⋯𝒩_{ϱ−1}`
with unique factors;

(d) `S = 𝖴H`, that is, every `s ∈ S` is `uh` with `u ∈ 𝖴` and `h ∈ H`; and `S` normalises `𝖴⁰`.

*Needs:* 2.1, 2.2.

[ShortProof], `Lib/DiscreteSeries/Bruhat/FloorMeasures` (`New.Floors.TraceOne.heisenbergElem`,
`New.Floors.FloorGroups.heisenbergElem_mem_floorUnipotent`, `New.Floors.FloorGroups.exists_eq_heisenbergElem_of_mem`,
`New.Floors.FloorGroups.bijOn_mulVec_eStar`, `New.Floors.FloorGroups.existsUnique_prod_of_mem_besselU`,
`New.mem_besselS`, `New.Floors.FloorGroups.besselS_le_normalizer_besselU0`)

### 2.4 The big cell

*Origin:* adapted from the Bruhat decomposition and the Bessel data of a pair of unitary groups
(GanGrossPrasadUnitaryGroups §1.2): here, the big cell of the double cosets `𝖴\G_T/𝖴`, over a field with involution and
integrally over a subring. The criterion is the non-vanishing of the leading minors of the frame Gram matrix. The
factors are unique, and the Levi factor is left as an element fixing the hyperbolic pairs.

*Method of the formal proof:* Induction on the floors. The pivot `h(e_j, σe_j)` is a unit, and two Heisenberg
elements (2.3) clear its column and its row. Over a field the integral statement is applied to the whole field. For
uniqueness, the minors of `Z(w_p)` are the products of the first entries of `p` (2.2 (c)), and an element of
`𝖴 ∩ w_pH_ϱ𝖴w_p⁻¹` is trivial.

Let `R` have an element `τ` with `τ + τ̄ = 1`, and let `J_T` be invertible. Prove that:

(a) *(existence over a field)* if `R` is a field and `δ_j(γ) ≠ 0` for `1 ≤ j ≤ ϱ`, then `γ = u⁻¹w_pσu′` with
`u, u′ ∈ 𝖴`, `p_a` units (`a < ϱ`) and `σ ∈ H_ϱ`;

(b) *(uniqueness)* if `u⁻¹w_pσu′ = v⁻¹w_qσ′v′` with `u, u′, v, v′ ∈ 𝖴` and `σ, σ′ ∈ H_ϱ`, then `p_a = q_a` for
`a < ϱ`, `σ = σ′`, `u = v` and `u′ = v′`;

(c) *(integral form)* let `𝒪 ⊆ R` be a subring stable under the involution over which `J_T` is unimodular (`J_T` and
`J_T⁻¹` have entries in `𝒪`). If `γ ∈ G_T ∩ GL_𝐁(𝒪)` and `δ_j(γ)` is a unit of `𝒪` for `1 ≤ j ≤ ϱ`, then for every
`j ≤ ϱ` we have `γ = u⁻¹w_pσu′`. Here `u, u′ ∈ 𝖴 ∩ GL_𝐁(𝒪)`, `σ ∈ H_j ∩ GL_𝐁(𝒪)`, `w_p` is the Weyl element of
the first `j` pairs, and `p_a, p_a⁻¹ ∈ 𝒪` for `a < j`;

(d) under the hypotheses of (c) on `𝒪`: if `u⁻¹w_pσu′ ∈ GL_𝐁(𝒪)` with `u, u′ ∈ 𝖴`, `σ ∈ H_ϱ` and `p_a⁻¹ ∈ 𝒪` for
`a < ϱ`, then `u`, `σ` and `u′` lie in `GL_𝐁(𝒪)`.

The library has the big cell of `GL_n` over any commutative ring: `Matrix.exists_blockLDU_iff` (a block `LDU`
factorisation exists iff the leading block minors are units) and `Matrix.eq_of_blockLDU_eq` (uniqueness). The
statement above is the unitary form, with Weyl elements, and is not deduced there.

*Needs:* 2.1–2.3.

[ShortProof], `Lib/DiscreteSeries/Bruhat/BigCell` (`New.Filling.exists_big_cell_decomp`,
`New.Filling.big_cell_factors_unique`, `New.Filling.exists_integral_big_cell_decomp`,
`New.Filling.big_cell_factors_mem_intGL`)

### 2.5 The real group `G₁` and its Bessel subgroups

*Origin:* adapted from the Bruhat decomposition and the Bessel data of a pair of unitary groups
(GanGrossPrasadUnitaryGroups §1.2): here, the group `G₁` of the split form with `T₁ = diag(1_κ, −1)`, the structure of
`S` and of the fixer of the frame, and Bessel functions of a type.

*Method of the formal proof:* Explicit matrices. An element of `S` is corrected by an element of `𝖴` with the same
frame block. An element fixing the frame is moved by an explicit element of `𝖴⁰` into the unitary group of `X₀`.

Let `G₁ = G_{T₁}` over `ℂ`, of rank `r = 2ϱ + k + 1`. Let `ι : U(k) → G₁` embed the unitary group of `X₀`, acting on
the `x_i` and fixing the other basis vectors; then `ι(U(k)) = H`. Write `ι_*(dh)` for the image under `ι` of the Haar
probability measure `dh` of `U(k)`. Prove that:

(a) over a commutative ring `R` with an element of trace one and `T = diag(1_κ, −N)` with `N` a unit (so that `J_T` is
invertible), `H` is the image of `U(κ)`, and every `s ∈ S` is `uι(h)` with `u ∈ 𝖴` and `h ∈ U(κ)`; and every upper
unitriangular `(ϱ + 1) × (ϱ + 1)` matrix is the frame block `u_F` of some `u ∈ 𝖴`;

(b) in `G₁`, if `s` fixes every frame vector then `s = vι(h)` with `v ∈ 𝖴⁰` and `h ∈ U(k)`, and
`𝖴⁰ ∩ ι(U(k)) = {1}`;

(c) `‖ι(h)u‖ = ‖u‖` for `h ∈ U(k)` and `u ∈ G₁`.

*Definition (Bessel functions).* Let `ψ_∞(c) = exp(c − c̄)` and let `π_K` be a unitary representation of `U(k)` on
`ℂ^I`. A *Bessel function of type `π_K`* is a bounded strongly measurable `W : G₁ → ℂ^I` with:
- `W(ny) = ψ_∞(σ(n))·W(y)` for `n ∈ 𝖴`;
- `W(ι(h)y) = π_K(h)W(y)` for `h ∈ U(k)`.

*Needs:* 2.1–2.3.

[ShortProof], `Lib/DiscreteSeries/Bessel/Basic` (`New.exists_eq_toBesselH`, `New.exists_besselU_mul_toBesselH`,
`New.exists_mem_besselU_frameMatrix_eq`, `New.RealPlace.exists_embedH_eq_of_fix_frameCols`,
`New.RealPlace.embedH_eq_one_of_mem_besselU0`, `New.RealPlace.norm_embedH_mul`, `New.IsBesselFunction`)

### 2.6 Haar measures on the Bessel unipotent groups

*Origin:* adapted from the published theory of Haar measures on unipotent groups in coordinates: here, explicit
coordinates on `𝖴⁰ ⊆ 𝖴 ⊂ G₁`, two-sided invariance with cutoffs for the action on `G₁`, dilations, homogeneous
balls and tubes.

*Method of the formal proof:* The free entries determine an element of `𝖴` (the other entries are forced by the form).
In these coordinates left and right translations are affine maps of determinant one. The dilation is
`d = diag(T^{ϱ−level(i)})`. The ball volume is the determinant of `(ω, μ) ↦ (ρω, ρ²μ)`. Tubes are built from a
homogeneous ball and the norm bound under multiplication.

*Free entries.* For `u ∈ 𝖴⁰` they are the complex entries `u_{e_a, x_i}` and `u_{e_a, e*_b}` (`b > a`) and the real
numbers `Im u_{e_a, e*_a}`. For `u ∈ 𝖴` they are the complex entries `u_{e_a, e_b}` and `u_{e_a, e*_b}` (`b > a`),
`u_{e_a, x_i}` and `u_{e_a, z}`, and `Im u_{e_a, e*_a}`. Prove that:

(a) the free entries are injective on `𝖴⁰` and on `𝖴`, and there are measures `μ⁰` on `𝖴⁰` and `μ_𝖴` on `𝖴` that they
carry to Lebesgue measure;

(b) `μ⁰` and `μ_𝖴` are left and right Haar measures, invariant under inversion and σ-finite. The left action of each
group on `G₁` has a *cutoff*, as in AdelicUnitaryGroupsAndAlgebraicModularForms §1.1: a measurable `β ≥ 0` on `G₁`
with `∫ β(uy) du = 1` for every `y`;

(c) *(dilations)* for `T ≥ 1` there is `d ∈ G₁` with `(d⁻¹ud)_{ij} = T^{level(i)−level(j)}u_{ij}` for all `u ∈ G₁`, and
`‖d⁻¹ud‖ ≤ 1 + r²‖u‖/T` for `u ∈ 𝖴`;

(d) *(homogeneous balls)* for `u ∈ 𝖴⁰` write `ue*_b = e*_b − Σ_i ω_{ib}x_i − Σ_a μ_{ab}e_a`, and let
`B(ρ) = {u ∈ 𝖴⁰ : ‖ω‖ ≤ ρ, ‖μ‖ ≤ ρ²}`. Then `B(ρ)B(ρ′) ⊆ B(ρ + ρ′)`, and `μ⁰(B(ρ)) = ρ^{2ϱ(k+ϱ)}μ⁰(B(1))` for
`ρ > 0`;

(e) *(tubes)* for `T ≥ 8r` there are a compact `B ⊂ G₁` and a measurable `Ω ⊆ 𝖴⁰` with the following properties:
- `0 < μ⁰(Ω) < ∞`;
- `‖y‖ ≤ T^{10}` on `B`;
- `uy ∈ B` whenever `u ∈ Ω` and `‖y‖ ≤ T`;
- `μ⁰{u : uy ∈ B} ≤ 3μ⁰(Ω)` for every `y ∈ G₁`;

(f) every Haar measure on `G₁` is σ-finite.

*Needs:* 2.1, 2.5.

[ShortProof], `Lib/DiscreteSeries/Bessel/UnipotentHaarMeasure` (`New.RealPlace.measurePreserving_freeEntries_besselHaar₀`,
`New.RealPlace.measurePreserving_freeEntries_besselHaar`, `New.RealPlace.isUnimodularHaar_besselHaar₀`,
`New.RealPlace.exists_dilation`, `New.RealPlace.besselHaar₀_homogeneousBall`, `New.RealPlace.exists_tube`,
`New.sigmaFinite_G₁`), `Lib/DiscreteSeries/Bessel/Basic` (`New.Shape.besselHaar₀`, `New.Shape.besselHaar`)

### 2.7 The fibre measure on frames of `G₁`

*Origin:* adapted from Weil (1961), the densities as volumes of fibre measures (HermitianFormsAndLattices §6.1 (f)):
here, upper bounds by Haar measure of `G₁` for tuples with a definite complement and for the frame. The frame has an
isotropic part, so its Gram matrix is degenerate.

*Method of the formal proof:* A tuple with a definite complement is completed to a basis by `k` vectors orthogonal to
it, which is the definite case of 1.6 (a), and 1.6 (b) assembles the two steps. For the frame, the dual vectors
`e*_a` are added in the coordinates (c), and the tuple obtained has a definite complement.

Let `μ^c = μ^c_{J₁}` on `G₁` and `dh` the Haar probability measure of `U(k)`, carried to `G₁` by `ι`. Prove that:

(a) let `E` be the tuple of the `2ϱ + 1` basis vectors outside `X₀`. If an s-finite measure `m` on `G₁` is below the
Gram fibre at `E`, then `m ∗ ι_*(dh) ≤ (vol U(r)/(vol U(k)·2^{2ϱ+1}))·μ^c`;

(b) let `F = (e_0, …, e_{ϱ−1}, z)` be the frame and `ds = μ⁰ ∗ ι_*(dh)`, a measure on the fixer `𝖴⁰ι(U(k))` of the
frame. If an s-finite `m` is below the Gram fibre at `F`, then `m ∗ ds ≤ (vol U(r)/(vol U(k)·2^{ϱ+1}))·μ^c`;

(c) the `ϱ`-tuples `e* + e·a + x·c` (`a ∈ M_ϱ(ℂ)`, `c ∈ M_{κ×ϱ}(ℂ)`) are the tuples dual to `e_0, …, e_{ϱ−1}` and
orthogonal to `z`. Each is `u(e* + e·T/2)` with `u ∈ 𝖴⁰` and `T` hermitian, and for measurable `K ≥ 0`:
`∫ K(e* + e·a + x·c) da dc = 2^{−ϱ}·∫ ∫_{𝖴⁰} K(u(e* + e·T/2)) dμ⁰(u) dT`.

*Needs:* 1.1–1.6, 2.5, 2.6.

[ShortProof], `Lib/DiscreteSeries/Bessel/FrameFibre` (`New.LeGramFibre.mconv_embedH_le`,
`New.RealPlace.lintegral_eq_unipotent_coords`, `New.LeGramFibre.mconv_fixerHaar_le`)

### 2.8 Schur's bound and `L²` bounds for Bessel functions

*Origin:* adapted from the published theory of Schur's test for integral operators and of Bessel functions on unitary
groups: here, for convolution by an idempotent kernel on a unimodular group and on a quotient `S\G` with a cutoff,
and the invariance of the norms of Bessel functions under the Bessel subgroup.

*Method of the formal proof:* The inner products of right translates of a vector fixed by an idempotent kernel are
values of the kernel. Schur's bound for a family of vectors with such Gram matrix gives (b). In (c), the function
`F ∗ x` lies in the closed span of the right translates of `F`, and the quotient is integrated through the cutoff.
For (d), `ψ_∞ ∘ σ` is a character on `S` (2.2 (e)).

An *idempotent kernel* on a locally compact group `G` with Haar measure is a continuous integrable `e : G → ℂ` with:
- `e(g⁻¹) = conj e(g)` and `e(1) ≠ 0`;
- `∫ e(z)·e((zx)⁻¹y) dz = e(x⁻¹)e(y)/e(1)` for all `x, y`.

Write `(F ⋆ x)(y) = ∫ x(a⁻¹)F(ya) da` for vector-valued `F`. Prove that:

(a) over any commutative ring with involution there is a fixed matrix `C` on `𝐁` with
`tr(Cu) = σ(u) + conj σ(u⁻¹)` for every `u ∈ G_T`;

(b) *(Schur's bound)* let `G` be locally compact, Polish and unimodular, `ψ` a bounded idempotent kernel with
`ψ(1) = d`, `x` integrable with `ψ ⋆ x = x`, and `w : G → E` (`E` a Hilbert space) with
`⟨w(a), w(b)⟩ = ψ(a⁻¹b)q/d` for a real `q`. Then for every integrable `z`:
`‖∫ z(g)(w ⋆ x)(g) dg‖² ≤ (‖(w ⋆ x)(1)‖²/d)·∫|z|²`;

(c) *(in `L²(S\G)`)* let `G` be locally compact, Polish and unimodular, with Haar measure, and `S ⊆ G` a subgroup
with an s-finite, inversion-invariant measure whose action on `G` has a cutoff. Let `ν` be the measure on `G` that
integrates left `S`-invariant functions as on `S\G` (the quotient integral of
AdelicUnitaryGroupsAndAlgebraicModularForms §1.1). Let:
- `F` be bounded measurable with `F(sy) = c(s)F(y)`, `|c(s)| = 1`, `F` integrable for `ν`, and `F ⋆ ψ = F`;
- `ψ` be a bounded idempotent kernel with `ψ(1) = d`;
- `x` be integrable with `ψ ⋆ x = x`, and `z` integrable.

Then `∫ |((F ⋆ x) ⋆ ž)(y)|² dν(y) ≤ (∫|x|²/d)·(d⁻¹∫|F|² dν)·∫|z|²`, where `ž(a) = z(a⁻¹)`;

(d) for a Bessel function `W` of a type, `s ∈ S`, a measure `μ` on `G₁` and `β : G₁ → ℂ`:
`‖∫ β(y)W(sgy) dμ(y)‖ = ‖∫ β(y)W(gy) dμ(y)‖`.

*Needs:* 2.2, 2.5, 2.6.

[ShortProof], `Lib/DiscreteSeries/Bessel/SchurBound` (`New.Filling.trace_besselCharMatrix_mul`,
`New.IsIdempotentKernel.enorm_integral_convolve_sq_le`, `New.IsBoundedMeasurable.lintegral_sq_convolve_convolve_le`,
`New.IsBesselFunction.enorm_integral_besselS_mul`, `New.IsBesselFunction.enorm_besselS_mul`)

## Layer 3: Measures at a place

Measure theory on quadrics of a hermitian form at a place: places and quadric measures, the complex place and polar
coordinates, quadrics solved in a block, Fourier kernels and Plancherel's inequality, the measures of the floors,
the Cartan decomposition of the top floor, and fibre measures of the floors at `ℂ`.

### 3.1 Places, quadric measures and solved measures

*Origin:* definitions and conventions.

*Method of the formal proof:* The local theory is stated once for an abstract ring with involution and the data
listed below. Its instances are the complex numbers (3.2) and, in SiegelWeilAndRallisFormulasOnUnitaryGroups §3.6
(integral places), a finite product of completions of the CM field. The abstraction only collects the standard data
of these rings: no comparison theorem is used, and every statement below is about the standard object in each
instance.

(a) *Places.* A *place* is a commutative topological ring `A` with a continuous involution `x ↦ x̄`. It is locally
compact and Polish, with an additive Haar measure `dx`, and comes with:
- an element `τ` with `τ + τ̄ = 1`;
- a unit `δ` with `δ̄ = −δ`;
- a Haar measure `ν` on the additive group `A⁻` of skew elements, such that `(a, b) ↦ τδ⁻¹a + b` carries `ν × ν`
  to `dx`;
- a measurable multiplicative map `mod : A → [0, ∞]`, invariant under `x ↦ x̄` and `x ↦ −x`, such that for every
  square matrix `M` with unit determinant `x ↦ Mx` carries Haar measure of `A^n` to `mod(det M)⁻¹` times itself;
- a continuous additive character `ψ` with `|ψ| = 1`;
- a number `c_A ∈ [0, ∞]` such that some continuous integrable `G ≥ 0` with `G(0) = 1` has
  `∫ |∫ G(v)ψ(v̄w) dv| dw ≤ c_A`.

Moreover almost every element of `A` is a unit, and `mod(u)⁻¹ ≤ |g(u)|²` on units for some locally integrable `g`.

(b) *Quadric measures.* Let `T` be a hermitian matrix on `A^ι` and `β ∈ A⁻`. Let `h` be the form of a hyperbolic
plane `(e, e′)` plus `T` on `A^{{e,e′}⊔ι}`. The *quadric measure* of `h(v, v) = δ⁻¹β` is the image of
`dt·dw·dν(a)` under the map `(t, w, a) ↦ (t̄⁻¹τ(δ⁻¹β − h(w, w)) + ta)e + te′ + w`, with `t̄⁻¹ = 0` when `t̄` is not a
unit.

(c) *Disintegrations.* A family `(l_β)_{β∈A⁻}` of measures on `A^ι` *disintegrates* a measure `μ` along a form `J` if
both of the following hold:
- for continuous compactly supported `f ≥ 0`, the integrals `∫ f dl_β` are finite and continuous in `β`;
- `∫ f(x*Jx, x) dμ(x) = ∫∫ f(δ⁻¹β, x) dl_β(x) dν(β)` for every measurable `f ≥ 0`.

(d) *Solved measures.* For a set `R ⊆ A`, the *box* of `R` in `A^κ` is the set of vectors with all coordinates in
`R`. Let `blk : B → κ` be injective. A measure `ρ` on `A^κ` is *solved in the block `blk`* with bound `M` on the box
of `R` if, after joining the coordinates outside the block with those of the block, it is `dw ⊗ ζ`. Here `ζ` is an
s-finite kernel from the coordinates `w` outside the block to measures on `A^B`, and `ζ_w(box of R) ≤ M` for all `w`.

(e) *Kernel bounds.* For a matrix `J` on `A^κ`, `ξ ∈ A`, measures `ρ`, `ρ′` and sets `S`, `S′ ⊆ A^κ`, say that *the
kernel `ψ(ξv*Jy)` multiplies square norms by at most `C` from `(S, ρ)` to `(S′, ρ′)`* if
`∫_{S′} |∫ ψ(ξ·v*Jy)φ(y) dρ(y)|² dρ′(v) ≤ C·∫|φ|² dρ` for every measurable `ρ`-integrable `φ` vanishing off `S`.

*Needs:* none.

[ShortProof], `Lib/General/Measure/QuadricDisintegration` (`New.Floors.Place`, `New.Floors.Place.quadricMeasure`,
`New.Floors.Place.IsDisintegration`), `Lib/DiscreteSeries/Bruhat/QuadricBlocks` (`New.Floors.Place.IsSolvedIn`),
`Lib/DiscreteSeries/Bruhat/FourierKernels` (`New.Floors.Place.FourierSqNormLe`)

### 3.2 The complex place, polar coordinates and spheres

*Origin:* adapted from the published theory of polar coordinates and of the invariant measures on spheres: here, the
radial variable is the squared norm, the angular part is the image of Haar probability measure of `U(m)`, and the
spheres are the fibres of `y ↦ y*y` in the sense of 3.1 (c).

*Method of the formal proof:* The kernel for (a) is the Gaussian `exp(−|x|²)`, whose integral is `π`. For (b), `g` is
averaged over `U(m)`, which preserves Lebesgue measure; the average depends only on `|ω|²`, whose law has density
`π^m r^{m−1}/(m − 1)!`. For (c), the sphere of squared radius `2t` gets the invariant measure of mass
`2π^k(2t)^{k−1}/(k − 1)!`.

Prove that:

(a) `ℂ` with complex conjugation is a place, with `τ = 1/2`, `δ = i/2`, `ν` the image of Lebesgue measure under
`t ↦ it`, `mod(x) = |x|²`, `ψ(x) = exp(x − x̄)` and `c_ℂ = π²`;

(b) *(polar coordinates)* for a finite set `κ` with `m = |κ| ≥ 1`, `k ∈ κ` and measurable `g ≥ 0` on `ℂ^κ`:
`∫ g(ω) dω = ∫_0^∞ (π^m r^{m−1}/(m − 1)!)·∫_{U(m)} g(h·√r·e_k) dh dr`;

(c) *(spheres)* if `|κ| = k ≥ 2`, there is an s-finite kernel `(l_β)_{β∈iℝ}` on `ℂ^κ` that disintegrates Lebesgue
measure along `y ↦ y*y` at the place `ℂ`, with `l_β{y : |y_i| ≤ R for all i} ≤ 2π^k(kR²)^{k−1}/(k − 1)!` for all `β`
and `R`.

The library has polar coordinates in the form "sphere times radius", for any norm:
`MeasureTheory.Measure.measurePreserving_homeomorphUnitSphereProd` (Mathlib) and
`TauCeti.lintegral_eq_lintegral_toSphere_lintegral_Ioi`. (b) needs the Euclidean norm on `ℂ^κ`, the radial
density in `r = |ω|²`, and the angular part as an image of Haar measure of `U(m)`; with 1.4 this is a short bridge
from those statements.

*Needs:* 1.1, 1.4, 3.1.

[ShortProof], `Lib/DiscreteSeries/Bruhat/ComplexPlace` (`New.Floors.complexPlace`, `New.Floors.lintegral_eq_polar`),
`Lib/DiscreteSeries/Bruhat/SphereFibres` (`New.Floors.exists_isDisintegration_le_sphereDensity`)

### 3.3 Quadrics solved in a block

*Origin:* particular to this proof: the measure of a quadric in a hyperbolic plane plus `T`, solved in a block of
coordinates where `T` is the identity, at any place.

*Method of the formal proof:* Split `T` as `T₂ ⊕ 1_B`. In the chart of 3.1 (b) the part `z` of the vector in the block is
free, and the rest lies on a quadric of the plane plus `T₂` whose value is that of the given quadric minus `h(z, z)`.
The two roles are exchanged by (a), which is Tonelli's theorem and the defining property of disintegrations.

Let `A` be a place. Prove that:

(a) let `l`, `l′` be s-finite kernels that disintegrate `μ` on `A^κ` and `μ′` on `A^B` along forms `J`, `J′`, and
write `q(y)` for the skew element with `δ⁻¹q(y) = y*Jy` (resp. `y*J′y`). Then for `β ∈ A⁻` and measurable `f ≥ 0`:
`∫∫ f(y, z) dl′_{β−q(y)}(z) dμ(y) = ∫∫ f(y, z) dl_{β−q(z)}(y) dμ′(z)`;

(b) Haar measure of `A^κ` is solved in every block `blk`, with any bound `M ≥ vol(R)^{|B|}` on the box of `R`;

(c) let `l` be an s-finite kernel that disintegrates Haar measure of `A^B` along `x ↦ x*x`, with
`l_β(box of R) ≤ M` for all `β`. Let `T` be a hermitian matrix on `A^κ` and `blk : B → κ` injective, such that the
rows of `T` at the indices `blk(B)` are those of the identity. Then for every `β ∈ A⁻` the quadric measure of
`h(v, v) = δ⁻¹β` (hyperbolic plane plus `T`) is solved in the block `blk` with bound `M` on the box of `R`.

*Needs:* 3.1.

[ShortProof], `Lib/DiscreteSeries/Bruhat/QuadricBlocks` (`New.Floors.Place.IsDisintegration.lintegral_lintegral_comm`,
`New.Floors.Place.isSolvedIn_volume`, `New.Floors.Place.IsDisintegration.isSolvedIn_quadricMeasure`)

### 3.4 Plancherel's inequality and Fourier kernels between solved measures

*Origin:* adapted from the published theory of Plancherel's theorem on locally compact abelian groups: here, an
inequality at a place with the constant `c_A` of 3.1 (a), and its consequence for kernels between two measures
solved in disjoint blocks.

*Method of the formal proof:* (a) The integrand is damped by `∏_i G(x̄v_i)`, with the kernel `G` of the place. The
square is expanded as a double integral and the variable `v` is integrated first. The damping is removed by Fatou's
lemma as `x → 0` along units. (b) The fibre variables of `v` and `y` are not paired, so the kernel is a Fourier
kernel in the inner coordinates times phases. Plancherel's inequality is applied there and the Cauchy–Schwarz
inequality elsewhere, and the outer coordinates are estimated by the volume of the box.

Let `A` be a place. Prove that:

(a) *(Plancherel)* for a unit `η` and `f` measurable and integrable on `A^ι`:
`∫ |∫ ψ(η·v*w) f(w) dw|² dv ≤ (c_A/mod(η))^{|ι|}·∫|f|²`;

(b) let `ρ` be solved in the block `blk : B → κ` with bound `M` on the box of `R`, and `ρ′` solved in `blk′ : B′ → κ`
with bound `M′` on the box of a measurable `R′`. Let `inner : ι → κ` be such that `inner`, `blk′` and `blk` together
are injective, and let the rows of `J` at the indices `inner(ι)` and `blk′(B′)` be those of the identity. Then for
every unit `ξ` the kernel `ψ(ξ·v*Jy)` multiplies square norms from (box of `R`, `ρ`) to (box of `R′`, `ρ′`) by at
most `vol(R′)^{|κ|−|ι|−|B′|}·M′·vol(R)^{|κ|−|ι|−|B|}·M·(c_A/mod(ξ))^{|ι|}`.

*Needs:* 3.1.

[ShortProof], `Lib/DiscreteSeries/Bruhat/FloorMeasures` (`New.Floors.Place.plancherel_inequality`,
`New.Floors.Place.lintegral_damped_fourier_le`), `Lib/DiscreteSeries/Bruhat/FourierKernels`
(`New.Floors.Place.IsSolvedIn.setLIntegral_le`, `New.Floors.Place.IsSolvedIn.fourierSqNormLe`)

### 3.5 Measures of the floors

*Origin:* particular to this proof: invariant measures on the Heisenberg groups of the floors and their convolutions,
and the disintegration of Haar measure of a floor along the form, in hyperbolic coordinates, at any place.

*Method of the formal proof:* Translation by an element of `𝒩_l` is an affine change of the parameters `(v, β)` of
2.3 that preserves Haar measure, and the ascending convolution inherits the invariance floor by floor. The floor basis
carries the volume of the coordinates to Haar measure of `V_b` because `mod(det T) = 1`, and 3.1 (b) does the rest.

Let `A` be a place and `T` a hermitian matrix on `κ ⊔ {z}` with `J_T` invertible. Prove that:

(a) for `l < ϱ` let `η_l` be the image of (Haar measure of `V_{l+1}`) `× ν` under `(v, β) ↦ ν_l(v, β)`, and put
`η_l = δ_1` for `l ≥ ϱ`. Then `η_l ∗ δ_s = η_l = δ_s ∗ η_l` for `s ∈ 𝒩_l`. The ascending convolution
`η_0 ∗ ⋯ ∗ η_{j−1}` is carried by `𝒩_{<j}` and is invariant under left and right translation by `𝒩_{<j}`;

(b) let the middle block have a *hyperbolic basis*: a basis in which the form `T` is `m + 1` hyperbolic planes plus an
orthonormal part (`k + 1 = |ι| + 2m + 2`), with `mod(det T) = 1`. For a floor `b ≤ ϱ`, take the basis of `V_b`
made of it and of the pairs `e_a, e*_a` (`b ≤ a < ϱ`); its first plane is the first hyperbolic plane of the middle
block. The *floor quadric measures* are the images under this basis of the quadric measures of 3.1 (b). They
disintegrate Haar measure of `V_b` along `v ↦ h(v, v)`.

*Needs:* 2.1, 2.3, 3.1.

[ShortProof], `Lib/DiscreteSeries/Bruhat/FloorMeasures` (`New.Floors.Place.heisenbergMeasure`,
`New.Floors.heisenbergMeasure_mconv_dirac`, `New.Floors.ascConv`,
`New.Floors.ascConv_heisenbergMeasure_invariant`, `New.Floors.ae_ascConv_mem_unipotentBelow`,
`New.Floors.HyperbolicBasis`, `New.Floors.HyperbolicBasis.isDisintegration_floorVolume`)

### 3.6 The top floor at `ℂ`: Cartan decomposition and the hyperboloid

*Origin:* adapted from the published theory of the Cartan decomposition of a unitary group of rank one and of the
invariant measure of a hyperboloid: here, double cosets of `U(X₀)` in the top floor group of `G₁`, and polar
coordinates for the hyperboloid `h(v, v) = −1` of `V_ϱ = X₀ ⊕ ℂz`, written in the chart of the floors.

*Method of the formal proof:* (a) The column of `σ` at `z` is moved by an element of `U(X₀)` to a multiple of
`x_{k₀}` plus a multiple of `z`, and the boost absorbs it. (b) By uniqueness of disintegrations the floor quadric
measure of the top floor is the hyperboloid measure. Polar coordinates on `X₀` (3.2 (b)), with `−c` for `c` and
`h⁻¹` for `h`, give the image of the chart law.

In `G₁` let the *boost* `b(a)`, for `|a| ≥ 1`, act on the plane spanned by `x_{k₀}` and `z` by the matrix
`((ā, √(|a|² − 1)), (−√(|a|² − 1), −a))` and fix the other basis vectors. Define the chart `w_l(c)` of floor `l` and
its density `d_l(c)` as follows:
- `w_ϱ(c) = b(c/min(1, |c|))` for `c ≠ 0`, and in every other case `w_l(c)` is the Weyl element of floor `l` with
  scalar `c`;
- `d_l(c) = |c|^{2(k−1)+4(ϱ−l)}` for `l < ϱ`, and `d_l(c) = 2π^k((|c|² − 1)⁺)^{k−1}/(k − 1)!` for `l ≥ ϱ`.

Let `L_l` be the image of `d_l(c) dc` under `c ↦ w_l(c)⁻¹`. Prove that:

(a) `h(z, w_ϱ(c)z) = c` for `|c| > 1`; and if `σ ∈ H_ϱ` and `c = h(z, σz)` has `|c| > 1`, then
`σ = ι(h)w_ϱ(c)ι(h′)` for some `h, h′ ∈ U(k)`;

(b) if `k ≥ 2`, the image of `L_ϱ ∗ ι_*(dh)` under `σ ↦ σ⁻¹z` is the floor quadric measure of the top floor, for the
hyperbolic basis `(1 + i)/2·(x_{k₀} ± z)`, `x_i` (`i ≠ k₀`), of `V_ϱ`. That is, it is the measure of the hyperboloid
`h(v, v) = −1` of `V_ϱ` that disintegrates its Lebesgue measure along `v ↦ h(v, v)`.

The assembly of these measures and of the lower floors into Haar measure of `G₁`, with a bound for the constant, is in
PairsOfFramesAtOnePlace §4.1 (Haar measure of `G₁` from floors).

*Needs:* 2.5, 3.2, 3.5; AuxiliaryAlgebraAndAnalysisForThetaLifts (uniqueness of disintegrations of quadric measures).

[ShortProof], `Lib/DiscreteSeries/Bruhat/ComplexPlace` (`New.Floors.cellChart`, `New.Floors.cellDensity`,
`New.Floors.realFrameGram_cellChart`, `New.Floors.cartan_decomposition`, `New.Floors.map_orbitPoint_cellLaw_top`,
`New.Floors.complexBasis`)

### 3.7 Floor measures below fibre measures at `ℂ`

*Origin:* adapted from Weil (1961), the densities as volumes of fibre measures (HermitianFormsAndLattices §6.1 (f)):
here, lower bounds for the fibre measures of the maps that record the products of a vector with the lower basis
vectors and its norm, by the floor measures of 3.5, in `G₁`.

*Method of the formal proof:* The linear part of the map is a coordinate projection, whose fibre measure is Haar
measure of `V_b`. The quadratic part is handled by 3.5 (b). The factor `1/2` comes from `d(h(y, y)/2)`, since the
measures are quotients by the skew measure `ν`. For the dual vector, a parametrisation by the Heisenberg group
transfers the bound.

In `G₁` prove that:

(a) for a floor `b ≤ ϱ`, half the floor quadric measure of floor `b`, for the hyperbolic basis of 3.6 (b), at the
level `h(f_b, f_b)` is below the fibre
measure of `y ↦ ((h(e_i, y))_{floor(i)<b}, h(y, y))` over its value at `f_b`;

(b) for `a < ϱ`, half the image of `η_a` under `u ↦ ue*_a` is below the fibre measure of
`y ↦ ((h(e_i, y))_{floor(i)<a or i=e_a}, h(y, y))` over its value at `e*_a`;

(c) `η_l` (at the place `ℂ`) and `ι_*(dh)` are invariant under inversion, and `(μ ∗ μ′)⁻¹ = μ′⁻¹ ∗ μ⁻¹` for
s-finite measures.

*Needs:* 1.1, 2.5, 3.5, 3.6; AuxiliaryAlgebraAndAnalysisForThetaLifts (measures below a fibre measure: images,
composition of two maps).

[ShortProof], `Lib/DiscreteSeries/Bruhat/FloorFibre` (`New.Floors.leFibreMeasure_frameVector`,
`New.Floors.leFibreMeasure_dualVector`, `New.Floors.inv_mconv`)

## Layer 4: Parameters, highest vectors and holomorphic functions

Doubled Harish-Chandra parameters, products of principal minors and the definition of `c_λ`; `𝔤𝔩_n`-modules, unitary
representations and coefficient maps; exponentials and the equivariance of minors; holomorphic extension of
coefficients of highest vectors; and the vanishing of coefficient maps on the filtration of a `K`-highest vector.

### 4.1 Parameters, products of principal minors and `c_λ`

*Origin:* definitions and conventions.

*Method of the formal proof:* Harish-Chandra parameters are stored doubled, as integer vectors. All functions are
products and quotients of principal minors, so they extend to (open sets of) complex matrices.

Let `ε ∈ {±1}^n`, `G = G_ε` and `K = K_ε`.

(a) *Products of principal minors.* For `w ∈ ℤ^n` and invertible `g ∈ M_n(ℂ)` put
`m_w(g) = ∏_{t∈ℤ} det(g_{S_t})·det(g)^{−[t≤0]}`, with `S_t = {a : w_a ≥ t}` and `g_S` the principal submatrix on `S`
(`det g_∅ = 1`); almost all factors are `1`. Put `‖m_w‖²_K = ∫_K |m_w(k)|² dk`.

(b) *Orders and triangular matrices.* For `o ∈ ℤ^n`:
- `b` is *`o`-triangular* if `b_{ab} = 0` whenever `o_b < o_a`, and `det b ≠ 0`;
- `b^w = ∏_a b_aa^{w_a}`;
- `w` is *`K`-dominant for `o`* if `w_b ≤ w_a` whenever `ε_a = ε_b` and `o_a < o_b`;
- `2ρ(o)_a = #{b : o_b < o_a} − #{b : o_b > o_a}`.

(c) *Parameters.* A *(doubled) parameter* is `l ∈ ℤ^n`, read as `l = 2λ`. It has *gap `h`* (`h ∈ ℕ`) if:
- its entries are distinct and `≡ n − 1 mod 2`;
- `|λ_a − λ_b| ≥ h` whenever `ε_a ≠ ε_b`.

It has *large gap `A`* if it has gap `500n³ + A`. The root `e_a − e_b` is positive for `l` when `l_b < l_a`. Put:
- `2ρ_a = #{b : l_b < l_a} − #{b : l_b > l_a}`;
- `2ρ_{c,a}` the same count over the `b` with `ε_b = ε_a`;
- `λ + ρ = (l + 2ρ)/2`;
- `Λ = λ + ρ − 2ρ_c`, the *lowest `K`-type*;
- `κ_λ = |λ|² − |ρ|² = Σ_a (l_a² − (2ρ_a)²)/4`;
- `dim(λ) = ∏_{l_b<l_a}(λ_a − λ_b)/∏_{i<n} i!`.

The *root cone* of `l` is the set of `β ∈ ℤ^n` with `o·β ≤ 0` for every `o ∈ ℤ^n` such that `l_b < l_a` implies
`o_a < o_b`.

(d) *Flensted-Jensen's function.* For matrices `a`, `z` put
`Ξ_l(a, z) = (∫_K m_Λ(ak)·conj m_Λ(k)/m_{−(λ+ρ)}(k*zk) dk)/‖m_Λ‖²_K`.
For `g ∈ G` let `a_g` be its block diagonal part (the entries `g_{ab}` with `ε_a = ε_b`), and put
`c_λ(g) = Ξ_l(a_g, a_g⁻¹g)`. Put `deg_λ = (∫_G |c_λ|² dμ^c)⁻¹` and `e_λ = deg_λ·conj c_λ`. For a sign vector `ε` the
compact form `l` with all signs `+1` gives `Λ = λ − ρ`.

(e) *Smooth functions and right derivatives.* A function on `G` is *smooth* if it is the restriction of a smooth
function on `M_n(ℂ)`. `Y ∈ 𝔲(diag ε)` acts by `(R_Y f)(x) = d/dt f(x exp tY)|_{t=0}`, extended complex-linearly to
`𝔤𝔩_n(ℂ) = 𝔲 ⊕ i𝔲`. `U(𝔤)c_λ` is the span of the iterated right derivatives of `c_λ`. *Bumps* are smooth compactly
supported functions on `G`. The *smearing* of a continuous `F` by a bump `α` is `g ↦ ∫ α(y⁻¹)F(gy) dy`; a right
derivative of it falls on `α`.

(f) *Holomorphic functions of a weight.* Let `Φ` be a finite set, `o` injective, and `u = (u_τ)_{τ∈Φ}` with
`u_τ ∈ ℤ^n`. A function `F` on `G^Φ` is *holomorphic of weight `u`* (for `o`) if there is `F′` on `M_n(ℂ)^Φ` that is
complex analytic at every `hb` and has `F′(hb) = ∏_τ b_τ^{u_τ}·F(h)`. Here `h ∈ G^Φ` and each `b_τ` is
`o`-triangular. A variant restricts `h_τ` and `b_τ` to the matrices that commute with a second sign vector `ε′`.

*Needs:* 1.1.

[ShortProof], `Lib/DiscreteSeries/FlenstedJensen/Defs` (`New.weightMinors`, `New.HCParam.HasGap`,
`New.HCParam.HasLargeGap`, `New.paramAddRho`, `New.HCParam.lowestKType`, `New.HCParam.casimirValue`,
`New.weylDimensionPoly`, `New.HCParam.flenstedJensen`, `New.HCParam.dsCoeff`, `New.HCParam.formalDegree`,
`New.HCParam.dsKernel`, `New.IsKDominant`, `New.IsHolOfWeight`),
`Lib/DiscreteSeries/Rigidity/RepresentationsAndCasimirs` (`New.HCParam.rootCone`),
`Lib/DiscreteSeries/FlenstedJensen/RightDerivatives` (`New.SmoothU`, `New.rightDeriv`, `New.DiscreteSeries.Bumps`,
`New.DiscreteSeries.smear`, `New.DiscreteSeries.hasDerivAt_smear`)

### 4.2 `𝔤𝔩_n`-modules, unitary representations and coefficient maps

*Origin:* definitions and conventions.

*Method of the formal proof:* Representations of `U(J)` are on normed spaces with an invariant positive form, not on
Hilbert spaces. `𝔤𝔩_n`-modules are linear maps from matrices to endomorphisms that respect commutators.

(a) A *`𝔤𝔩_n`-module* is a complex vector space `M` with a linear map `X ↦ ρ(X)` from `M_n(ℂ)` to `End(M)` such that
`ρ(XY − YX) = [ρ(X), ρ(Y)]`. `E_ab` acts by `ρ(E_ab)`. For a relation `r` on indices put
`Ω_r = Σ_{r(a,b)} E_abE_ba`. Then `Ω = Ω_⊤` is the Casimir operator, and `Ω_K = Ω_{ε_a=ε_b}` that of `𝔨`.

(b) For a parameter `l` and `ν ∈ ℤ^n`, a vector `x` is *`K`-highest of weight `ν`* if `E_aax = ν_ax` for all `a`, and
`E_abx = 0` whenever `ε_a = ε_b` and `l_b < l_a`. The vector `0` is allowed. Put
`c_K(ν) = Σ_a ν_a(ν_a + 2ρ_{c,a})`.

(c) The *filtration* of `x`: `M_0` is the least subspace containing `x` that is stable under the `E_ab` with
`ε_a = ε_b`, and `M_{s+1} = M_s + Σ_{a,b} E_abM_s`.

(d) A `𝔤𝔩_n`-module `H` with an inner product satisfies *the Casimir bound for `l`* if both of the following hold:
- `⟨E_abv, w⟩ = ε_aε_b⟨v, E_baw⟩` for all `v`, `w`;
- `Re⟨y, Ωy⟩ ≥ κ_λ‖y‖²` for all `y`.

(e) A *unitary representation of exponent `A`* of `U(J)` on a normed space `X` is a homomorphism `π` to bounded
operators with the following properties:
- it is strongly continuous;
- a bounded hermitian positive definite form `B` is `π`-invariant;
- `‖π(g)‖ ≤ C‖g‖^A`.

A `𝔤𝔩_n`-module `M` with a linear `ι : M → X` is the *derivative of `π` along `ι`* if
`d/dt π(exp tY)ι(v)|_{t=0} = ι(ρ(Y)v)` for `Y ∈ 𝔲(J)`. Maps `c(g) : M → X` form a *coefficient map* if
`d/dt c(g exp tY)v = c(g exp tY)(ρ(Y)v)` for all `g`, `Y`, `v`, `t`.

(f) For `X` complete and `f` with `f(g)‖g‖^A` integrable, `π(f) = ∫ f(g)π(g) dg`.

*Needs:* 1.1, 4.1.

[ShortProof], `Lib/DiscreteSeries/Rigidity/RepresentationsAndCasimirs` (`New.GlModule`, `New.IsUnitaryRep`,
`New.IsDerivedAction`, `New.HCParam.IsKHighest`, `New.GlModule.IsCoeffMap`, `New.GlModule.casimir`,
`New.IsUnitaryCasimirGe`, `New.HCParam.casimirKValue`, `New.GlModule.filtration`),
`Lib/DiscreteSeries/Rigidity/KernelFixes` (`New.integratedRep`)

### 4.3 Exponentials, block diagonal matrices and equivariance of minors

*Origin:* adapted from the published theory of highest weight vectors of `GL_n` as products of principal minors and of
the exponential map of unitary groups: here, for `U(diag ε)` and its block diagonal triangular matrices.

*Method of the formal proof:* A logarithm of an element of `K` is taken by the functional calculus. The polar
decomposition `g = k·exp(Y)` gives two exponentials. Block triangular factors multiply each principal minor on an upper
set of `w` by the product of their diagonal entries there.

Prove that:

(a) an element of `G_ε` lies in `K_ε` if and only if it is block diagonal, that is, commutes with `diag ε`; the block
diagonal part of `x` is `(x + diag(ε)·x·diag(ε))/2`;

(b) every `k ∈ K_ε` is `exp(X)` with `X ∈ 𝔲(diag ε)` block diagonal, and every `g ∈ G_ε` is `exp(X)exp(Y)` with
`X, Y ∈ 𝔲(diag ε)`;

(c) let `o` be injective, `w` `K`-dominant for `o`, `x` invertible and `b` invertible block diagonal. If `b` is
`o`-triangular then `m_w(xb) = m_w(x)·b^w`. If `b` is `(−o)`-triangular then `m_w(bx) = b^w·m_w(x)`.

The library has the first half of (b) for `U(n)`: `Matrix.UnitaryGroup.exists_expUnitary_eq`.

*Needs:* 1.1, 4.1.

[ShortProof], `Lib/DiscreteSeries/Holomorphic/MaximalCompactMinors` (`New.mem_maxCompactU`, `New.blockDiagPart_eq`,
`New.IsKDominant.weightMinors_mul_borel`, `New.IsKDominant.weightMinors_oppBorel_mul`),
`Lib/DiscreteSeries/Holomorphic/HighestVectorExtension` (`New.exists_expU_eq_maxCompactU`,
`New.exists_eq_expU_mul_expU`)

### 4.4 Holomorphic extension of coefficients of highest vectors

*Origin:* adapted from Harish-Chandra (1955–1956) and Knapp (1986), Chapter VI, the holomorphic discrete series
realised on the bounded symmetric domain, whose `K`-finite part is a lowest-weight module
(DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8): here, functions on powers of `U(p, q)` that extend
holomorphically to the group times a Borel subgroup take the place of the bounded domain. No holomorphic discrete
series is constructed.

*Method of the formal proof:* Each element of the group is joined to `1` by an analytic path in the group (4.3 (b)),
along which the coefficient satisfies a first-order system. Its solution extends analytically to the products `hb`.
Means over circles in the diagonal torus give the integral against `conj m_w`.

Let `o` be injective. Prove that:

(a) let `ε′` be a sign vector and let each `u_τ` satisfy `u_{τ,b} ≤ u_{τ,a}` whenever `ε′_a = ε′_b` and `o_a < o_b`.
Then for every invertible matrix `y`, `g ↦ ∏_τ m_{u_τ}(y·g_τ)` is holomorphic of weight `u` in the variant with `ε′`.
In particular, for `w` `K`-dominant for `o`, `m_w` is holomorphic of weight `w` in the variant with `ε′ = ε`; and it is
holomorphic of weight `w` without restriction if `w_b ≤ w_a` whenever `o_a < o_b`;

(b) for each `τ ∈ Φ`, let:
- `x_τ` be a `K`-highest vector of weight `u_τ` for the parameter `−o` (with signs `ε′`) in a `𝔤𝔩_n`-module `ρ_τ`;
- `c_τ` be a coefficient map for `ρ_τ` (4.2), with values in linear maps to a complete normed space `X`, that is
  continuous in the group variable;
- `ℓ` be a continuous multilinear form on `X^Φ`.

Then `h ↦ ℓ((c_τ(h_τ)x_τ)_τ)` is holomorphic of weight `u`, in the variant with `ε′`;

(c) if `F` on one copy of `G_ε` is continuous and holomorphic of weight `w` (variant with `ε′ = ε`), and `w` is
`K`-dominant for `o`, then `∫_K F(k)·conj m_w(k) dk = ‖m_w‖²_K·F(1)`.

The library has highest weight vectors of the rational representations of `GL_n(ℂ)`, but no statement on a
non-compact unitary group.

*Needs:* 4.1, 4.2, 4.3.

[ShortProof], `Lib/DiscreteSeries/Holomorphic/HighestVectorExtension` (`New.isHolOfWeight_weightMinors`,
`New.HCParam.IsKHighest.isHolOfWeight_coeffMap`, `New.IsHolOfWeight.integral_mul_conj_weightMinors`)

### 4.5 The filtration of a `K`-highest vector and the vanishing of coefficient maps

*Origin:* adapted from Harish-Chandra (1953), Lemma 34 with §7, `K`-finite vectors are analytic
(DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.1): here, for `𝔤𝔩_n`-modules with an invariant inner product and a
Casimir bound. Explicit norm bounds along the filtration of a `K`-highest vector replace analyticity in a vanishing
criterion for coefficient maps.

*Method of the formal proof:* Every `g` is a product of two exponentials (4.3 (b)). Along `t ↦ g exp(tY)` the
function `c(g exp tY)v`, for `v ∈ M_s`, has derivative `c(g exp tY)(Yv)`, with `‖Yv‖ ≤ (n + 1)⁴(R + 1 + s)‖Y‖‖v‖`.
A downward induction on `s` against a barrier shows that it stays zero. The norm bound comes from the Casimir bound,
which controls `Σ‖E_abv‖²` on `M_s`.

Let `l` have gap `g`. Prove that:

(a) if `x` is `K`-highest of weight `ν`, then `Ω_Kx = c_K(ν)x`;

(b) in a `𝔤𝔩_n`-module with the Casimir bound for `l`, a nonzero `K`-highest vector of weight `Λ + ν` satisfies
`Σ_a(n² + ν_a(ν_a + l_a)) ≥ 0`;

(c) in a module with the Casimir bound for `l`, if `x` is `K`-highest of some weight, each `M_s` is finite-dimensional;
and in any `𝔤𝔩_n`-module with an inner product (no Casimir bound and no gap needed), every nonzero finite-dimensional
subspace stable under the `E_ab` with `ε_a = ε_b` contains a nonzero vector `v` with `E_aa v = μ_a v` for complex
numbers `μ_a` that is killed by the `E_ab` with `ε_a = ε_b` and `l_b < l_a`;

(d) *(vanishing)* let `H` have the Casimir bound for `l`, `x ∈ H` be `K`-highest, and `c` a coefficient map on `G_ε`
with values in linear forms on `H`, with `|c(g)v| ≤ D‖v‖`. If `c(1)` vanishes on every `M_s`, then `c(g)x = 0` for
every `g ∈ G_ε`.

*Needs:* 4.2, 4.3.

[ShortProof], `Lib/DiscreteSeries/Rigidity/RepresentationsAndCasimirs` (`New.HCParam.IsKHighest.casimirK_eq_smul`,
`New.HCParam.IsKHighest.sum_card_sq_add_mul_nonneg`), `Lib/DiscreteSeries/Rigidity/HighestVectorsAndFiltration`
(`New.HCParam.IsKHighest.finite_filtration`, `New.HCParam.exists_highest_vector`,
`New.HCParam.IsKHighest.coeffMap_eq_zero`)

## Layer 5: Flensted-Jensen's function `c_λ`

The explicit function `c_λ` on `G_ε = U(diag ε)`: integrals of densities on flags, the independence of Flensted-Jensen's
integral from choices with its analyticity and Casimir eigenvalue, the first properties and `K`-types of `c_λ`, its
decay, Schur orthogonality and model in `L²`, and explicit Lipschitz and tail bounds.

### 5.1 Integrals of densities on flags

*Origin:* adapted from the published theory of integration over flag varieties (the Iwasawa decomposition and the
form of Haar measure on it): here, the integral over `G_ε` of a density on flags becomes an integral over a part of
`U(n)`, the same rule for every signature, without Haar measure on `GL_n(ℂ)`.

*Method of the formal proof:* The factorisation `y = gb` with `g ∈ G_ε` and `b` triangular with positive diagonal
ratios is unique. The Cayley chart of 1.1 transports Haar measure of `G_ε` onto the open orbit `G_εB` inside `U(n)`,
with a Jacobian that the flag density cancels. Real linear forms reduce the complex statement to positive functions.
The statement for `K_ℂ` is proved block by block by Fubini's theorem.

Let `o ∈ ℤ^n` be injective. A function `F` on `M_n(ℂ)` is a *density on flags* for `o` if
`F(yb) = |b^{2ρ(o)}|²·F(y)` for invertible `y` and `o`-triangular `b`. Prove that:

(a) if `F` is a density on flags, continuous on `GL_n(ℂ)`, and `x ∈ GL_n(ℂ)`, then `g ↦ F(xg)` is integrable on `G_ε`
and `∫_{G_ε} F(xg) dμ^c(g) = ∫_{{k∈U(n) : x⁻¹k ∈ G_εB_o}} F(k) dk`, where `G_εB_o` is the set of products of an
element of `G_ε` and an `o`-triangular matrix;

(b) for such `F`, `∫_{U(n)} F(xk) dk = ∫_{U(n)} F(k) dk` for every `x ∈ GL_n(ℂ)`;

(c) let `l` be injective, and `F` continuous on the invertible block diagonal matrices with
`F(yb) = |b^{−2ρ_c}|²·F(y)` for `b` block diagonal and `(−l)`-triangular. Then `∫_K F(xk) dk = ∫_K F(k) dk` for
every invertible block diagonal `x`.

*Needs:* 1.1, 1.2, 1.4, 4.1.

[ShortProof], `Lib/DiscreteSeries/FlenstedJensen/FlagDensities` (`New.openOrbit`, `New.IsFlagDensity`,
`New.integral_mul_left_eq_setIntegral_openOrbit`, `New.integral_haar_eq_setIntegral_openOrbit`,
`New.integral_unitary_mul_left_of_density`, `New.integral_haarK_mul_left_of_density`)

### 5.2 Independence of the splitting, analyticity and the Casimir eigenvalue

*Origin:* adapted from Sun (2007), Theorem 2.1, Proposition 6.1 and formula (26): the integral formula for the
lowest-`K`-type coefficient of a discrete series of `U(p, q)`, its discrete-series case being credited there to
Flensted-Jensen (1980) (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a): here, the value of Flensted-Jensen's
integral for every admissible splitting, its transformation under triangular factors, and the Casimir eigenvalue of
`c_λ` for every gap.

*Method of the formal proof:* The integrand is a density on the flag variety of `K_ℂ`. Polarization makes the integral
locally constant in the block diagonal factor, and the admissible factors form a convex set. Near a point, `c_λ` is an
average over `k ∈ K` of functions that are lowest weight vectors of weight `λ + ρ` in the basis `kE_abk⁻¹` of
`𝔤𝔩_n`. The Casimir operator does not depend on the basis.

Let `l` have gap `h`, and write `Ω = Σ_{a,b} R_{E_ab}R_{E_ba}` for the Casimir operator acting by right derivatives.
Prove that:

(a) for `g ∈ G` and an invertible block diagonal `a` with `a⁻¹g` accretive, `c_λ(g) = Ξ_l(a, a⁻¹g)`. For every
splitting `g = pzq*` with `p`, `q` block diagonal and `z` accretive,
`c_λ(g) = (∫_K m_Λ(pk)·conj m_Λ(qk)/m_{−(λ+ρ)}(k*zk) dk)/‖m_Λ‖²_K`;

(b) *(triangular factors)* if `b′` is block diagonal and `l`-triangular, `b` is block diagonal and `(−l)`-triangular,
and `y` and `b′yb` are accretive, then `Ξ_l(1, b′yb) = b′^Λ·b^Λ·Ξ_l(1, y)`;

(c) `c_λ`, as a function of a matrix, is complex analytic at every point of `G` (for every `l`);

(d) `Ωc_λ = κ_λ·c_λ`.

*Needs:* 4.1, 4.2, 4.3, 5.1.

[ShortProof], `Lib/DiscreteSeries/FlenstedJensen/CasimirEigenfunction` (`New.flenstedJensen_eq_of_accretive`,
`New.dsCoeff_eq_flenstedJensen`, `New.dsCoeff_eq_integral_of_eq_mul_mul_conjTranspose`,
`New.DiscreteSeries.flenstedJensen_triangular_mul_mul_triangular`, `New.HCParam.analyticAt_dsCoeff`,
`New.casimir_dsCoeffSmooth`), `Lib/DiscreteSeries/FlenstedJensen/RightDerivatives` (`New.rightDeriv`)

### 5.3 First properties of `c_λ` and its `K`-types

*Origin:* adapted from Sun (2007), Theorem 2.1, Proposition 6.1 and formula (26): the integral formula for the
lowest-`K`-type coefficient of a discrete series of `U(p, q)`, its discrete-series case being credited there to
Flensted-Jensen (1980) (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a): here, the integral is the
definition, no discrete series is assumed, and the properties are proved for every gap.

*Method of the formal proof:* The properties are read off the integral over `K`. Inversion conjugates products of
minors. The `K`-projections use Schur's relations for `K` in the form of 4.4 (c), applied to the integrand, and the
invariance of 5.1 (c).

Let `l` have gap `h`. Prove that:

(a) `c_λ(1) = 1`, and `c_λ(a) = m_Λ(a)` for every invertible block diagonal `a` in `G`, in particular on `K`;

(b) *(polar formula)* for `p, q ∈ K` and `z ∈ G` positive definite,
`c_λ(pzq⁻¹) = (∫_K m_Λ(pu)·conj m_Λ(qu)/m_{−(λ+ρ)}(u*zu) du)/‖m_Λ‖²_K`;

(c) `c_λ(g⁻¹) = conj c_λ(g)` and `c_{−λ}(g) = conj c_λ(g)` for `g ∈ G`;

(d) for `x, b ∈ G`: `∫_K conj m_Λ(k)·c_λ(xkb) dk = ‖m_Λ‖²_K·c_λ(x)c_λ(b)`;

(e) for `x, b ∈ G` and `ν` `K`-dominant for `−l` with `ν − Λ` outside the root cone of `l`:
`∫_K conj m_ν(k)·c_λ(xkb) dk = 0`.

For a gap `h ≥ 120·n·min(p, q)^{3/2}`, these properties also follow from
DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (b), which identifies `c_λ` with the lowest-`K`-type
coefficient of the discrete series of parameter `λ`, together with Schur orthogonality on `K` and Blattner's
formula. That route presupposes the existence and classification of discrete series; the statement above is about
one explicit function, for every gap.

*Needs:* 4.1, 4.3, 4.4, 5.1, 5.2.

[ShortProof], `Lib/DiscreteSeries/FlenstedJensen/PsiKTypes` (`New.dsCoeff_one`, `New.dsCoeff_of_mem_blockDiagAlg`,
`New.dsCoeff_of_mem_maxCompactU`, `New.dsCoeff_polar`, `New.dsCoeff_inv`, `New.dsCoeff_neg`,
`New.integral_conj_weightMinors_lowestKType_mul_dsCoeff`, `New.integral_conj_weightMinors_mul_dsCoeff_eq_zero`)

### 5.4 Decay, Schur orthogonality and the `L²` model

*Origin:* adapted from Sun (2007), Theorem 2.1, Proposition 6.1 and formula (26): the integral formula for the
lowest-`K`-type coefficient of a discrete series of `U(p, q)`, its discrete-series case being credited there to
Flensted-Jensen (1980) (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a): here, polynomial decay with the full
exponent `h`, Schur orthogonality with `deg_λ = (∫|c_λ|²)⁻¹`, and a unitary model of `U(𝔤)c_λ` in `L²(G)` for a large
gap. The discrete series is built from `c_λ`, not assumed.

*Method of the formal proof:* Fischer's inequality gives `|c_λ(g)|²·|det a_g|^h ≤ 1`, and `(‖g‖/2)² ≤ |det a_g|`. Every
element of `U(𝔤)c_λ` is a smearing of `c_λ` by a bump, which carries the decay over. Integrability then follows from
1.5 (b). Schur orthogonality comes from the two `K`-projections of 5.3 (d), (e) applied to `y ↦ c_λ(xya)`. The model
in `L²` is `f ↦ √deg_λ·f`.

Prove that:

(a) if `l` has gap `h` and `n ≥ 1`, then `|c_λ(g)| ≤ 1` and `|c_λ(g)| ≤ (2/‖g‖)^c` for every integer `c ≤ h` and
`g ∈ G`;

(b) if `l` has gap `h`, then `c_λ` is `K`-highest of weight `Λ` in `U(𝔤)c_λ`: `R_{E_aa}c_λ = Λ_ac_λ`, and
`R_{E_ab}c_λ = 0` when `ε_a = ε_b` and `l_b < l_a`.

Let `l` have large gap `A` and `n ≥ 1`. Prove that:

(c) every `f ∈ U(𝔤)c_λ` is `g ↦ ∫ α(y⁻¹)c_λ(gy) dy` for a bump `α`. For every integer `c ≤ 500n³ + A` there is
`C_f` with `|f(g)| ≤ C_f(2/‖g‖)^c`. The functions `f` and `g ↦ f(g)‖g‖^C` (`C ≤ A + 1`) are integrable, and `f` is
square-integrable; the same holds for `e_λ`;

(d) `deg_λ > 0` and, for `x, a ∈ G`, `deg_λ·∫_G c_λ(xya)·conj c_λ(y) dy = c_λ(x)c_λ(a)`;

(e) *(the `L²` model)* `f ↦ √deg_λ·f` embeds `U(𝔤)c_λ` injectively in `L²(G)`, and the following hold:
- the right regular representation is a unitary representation of exponent `0` (4.2 (e)), and the right derivatives
  are its derivative along this embedding;
- `⟨c_λ, R(g)f⟩ = f(g)` for all `f` and `g`, in the inner product pulled back from `L²(G)`;
- for that inner product, `E_ab` has adjoint `ε_aε_bE_ba` and `Re⟨y, Ωy⟩ ≥ κ_λ‖y‖²`;
- `c_λ` has norm one, and `|f(g)| ≤ ‖f‖`.

The decay of (a) is used with exponents up to the gap itself. DiscreteSeriesCoefficientsAndAutomorphicMetrics
§2.4a (c), (d) bound the same coefficient through `exp(−(h/8)·min(d(g)², d(g)/√(2q₀)))`, with `q₀ = min(p, q)` and
`d(k·exp X) = ‖X‖_HS`. This gives only the exponent `h/(8√q₀)` in `‖g‖`, and only for `h ≥ 120·n·q₀^{3/2}` or, for
the coefficient of one vector, `h > max(8nq₀, npq + 1)`. So that section does not imply (a).

*Needs:* 1.5, 4.1, 4.2, 4.5, 5.2, 5.3.

[ShortProof], `Lib/DiscreteSeries/FlenstedJensen/SquareIntegrability` (`New.DiscreteSeries.norm_dsCoeff_le_pow`,
`New.DiscreteSeries.norm_dsCoeff_le_one`, `New.isKHighest_dsGenerator`, `New.exists_smear_dsCoeffSmooth_eq`,
`New.HCParam.HasLargeGap.exists_decay_bound`, `New.HCParam.HasLargeGap.integrable_mul_norm_pow`,
`New.formalDegree_pos`, `New.dsCoeff_schur_orthogonality`, `New.HCParam.HasLargeGap.toL2`,
`New.HCParam.HasLargeGap.isDerivedAction_toL2`, `New.HCParam.HasLargeGap.inner_toL2_dsGenerator_rightRegularL2`,
`New.HCParam.HasLargeGap.isUnitaryCasimirGe_dsAction`, `New.isUnitaryRep_rightRegularL2`)

### 5.5 Lipschitz and tail bounds for `c_λ`

*Origin:* particular to this proof: explicit bounds, polynomial in the size `L` of the parameter, for the derivatives,
the oscillation and the tails of `c_λ` under a large gap.

*Method of the formal proof:* The right derivatives of `c_λ` are bounded through the module of 5.4 (e), with norm
bounds for `𝔤𝔩_n` on it. Integration along a path gives the Lipschitz bound. The measure bound combines the lower
bound `|c_λ| ≥ 1/2` near `1` with the covering bound 1.5 (a), and the tail bound uses 1.5 (b).

Let `l` have large gap `B`, `n ≥ 1` and `|l_a| ≤ L` for all `a`. Prove that:

(a) `|(R_Xc_λ)(y)| ≤ (n + 1)⁴(n + L + 1)‖X‖` for `X ∈ M_n(ℂ)` and `y ∈ G`;

(b) `|c_λ(xg) − c_λ(x)| ≤ 100(n + L + 1)⁵‖g − 1‖` for `x, g ∈ G`;

(c) if `β ≥ n + L + 1` and `‖g − 1‖ ≤ (200β⁵)⁻¹`, then `|c_λ(g)| ≥ 1/2`;

(d) let `j : S → G` be a homomorphism from a group with measurable multiplication and a right-invariant measure `ν`,
with `|c_λ ∘ j|²` integrable. Then for `r ≥ 1`:
`ν{s : ‖j(s)‖ ≤ r} ≤ (2000(n + L + 1)⁶r²)^{2n²}·∫ 4|c_λ(j(s))|² dν(s)`;

(e) for an integer `c > 8n²`, `g ↦ deg_λ(2/‖g‖)^c` is integrable on `G` with integral at most
`8(2000(n + L + 1)⁶)^{2n²}·2^c`.

*Needs:* 1.5, 5.4.

[ShortProof], `Lib/DiscreteSeries/FlenstedJensen/SquareIntegrability` (`New.norm_rightDeriv_dsCoeffSmooth_le`,
`New.norm_dsCoeff_sub_le`, `New.half_le_norm_dsCoeff`, `New.measure_ball_le_integral_dsCoeff`, `New.integral_tail_le`)

## Layer 6: Rigidity, cusp kernels and the holomorphic chamber

The rigidity of the coefficient `c_λ` and the operators `π(e_λ)`, the vanishing of constant terms for minimal
idempotent kernels, the model function and the value of `c_λ` in the holomorphic chamber, and Siegel's argument that a
bounded holomorphic form is large only away from the cusps.

### 6.1 The idempotent `e_λ` and rigidity of the coefficient

*Origin:* adapted from the published theory of the classification of discrete series by their lowest `K`-type and of
the projectors of integrable discrete series: here, for `U(p, q)` and a large gap, as an equality of matrix
coefficients in any unitary representation of polynomial growth, with a Casimir bound in place of the absence of
lower `K`-types. Irreducibility is not assumed.

*Method of the formal proof:* The module generated by `ι(v)`, with the inner product given by `B`, and the model of
5.4 (e) are put in an orthogonal sum, which again has the Casimir bound. There the vector `(ιv, −B(ιv, ιv)·c_λ)` is
`K`-highest and orthogonal to `(ιv, c_λ)`, hence to all that the latter generates. So the bounded coefficient map
`(u, w) ↦ B(ιv, π(g)u) − B(ιv, ιv)·w(g)` vanishes at `1` on the filtration, and 4.5 (d) gives the identity for every
`g`. Integration by parts moves the Casimir operator onto `e_λ` (5.2 (d)), and 5.3 (e) gives the vanishing off the
root cone.

Let `l` have large gap `A`, `n ≥ 1`, `π` a unitary representation of exponent `A` of `G_ε` on a complete normed space
`X`, with invariant form `B`, and `ρ` the derivative of `π` along `ι : M → X`. Prove that (completeness of `X` is not
needed for (a) and (e)):

(a) `e_λ` is an idempotent kernel (2.8), and there is a bump `α` with `∫ α(x⁻¹)e_λ(x⁻¹g) dx = e_λ(g)` for all `g`;

(b) `π(e_λ)ι(Ωv) = κ_λ·π(e_λ)ι(v)` for every `v ∈ M`;

(c) if `v` is `K`-highest of weight `ν` with `ν − Λ` outside the root cone of `l`, then `π(e_λ)π(y)ι(v) = 0` for every
`y`;

(d) if `v` is `K`-highest of weight `Λ` and `B(ιv, π(z)ιv) > 0` for every positive definite `z ∈ G_ε`, then
`Re B(ιv, π(e_λ)ιv) > 0`;

(e) *(rigidity)* if `v` is `K`-highest of weight `Λ` and `ι(Ωv) = c·ι(v)` with `c ≥ κ_λ`, then
`B(ιv, π(g)ιv) = B(ιv, ιv)·c_λ(g)` for every `g`;

(f) under the hypotheses of (e), `π(f)ι(v) = ι(v)` for every `f` with `f(g)‖g‖^A` integrable and
`∫ f(y)e_λ(y⁻¹g) dy = e_λ(g)` for all `g`.

*Needs:* 2.8, 4.2, 4.5, 5.2–5.4.

[ShortProof], `Lib/DiscreteSeries/Rigidity/KernelFixes` (`New.HCParam.HasLargeGap.isIdempotentKernel_dsKernel`,
`New.HCParam.HasLargeGap.exists_bump_conv_dsKernel`, `New.integratedRep_dsKernel_casimir`,
`New.integratedRep_eq_zero_of_notMem_rootCone`, `New.re_integratedRep_dsKernel_pos`,
`New.coeff_eq_dsCoeff_of_isKHighest`, `New.integratedRep_fix_of_isKHighest`)

### 6.2 Minimal idempotent kernels kill bounded radical-invariant functions

*Origin:* adapted from the published theory of discrete series coefficients as cusp forms: here, an abstract
vanishing statement for a minimal idempotent kernel on a locally compact group, tested on bounded continuous functions
that are invariant under a radical. Its hypothesis on dilations is checked for unitary groups.

*Method of the formal proof:* Let `T` be integration against `e` and `V` the space of bounded continuous functions that
are fixed by `T` and invariant under the radical. The shift of `H` by `−log|c|` along `D`, with the Lipschitz bound by
`ℓ`, makes a phase operator on `V` contracting. Then `V = 0`, and `Tf ∈ V`. The dilation is
`y = 1 + c·p − (c/(1 + c))·q`, with `p` the orthogonal projection onto the span of the columns of `x⁻¹A` and
`q = JpJ`.

Prove that:

(a) let `G` be a second countable locally compact group with Haar measure. Let `e` be an idempotent kernel (2.8), and
`H, ℓ : G → ℝ` with `H` continuous, `|H(xg) − H(x)| ≤ ℓ(g)` and `‖e‖·ℓ` integrable. Let `D` be a subgroup of
`G × ℂ^×` with the following properties:
- `H(rg) = H(g) − log|c|` for `(r, c) ∈ D`;
- every neighbourhood `W` of `1` has a `c` with `log|c| ≠ 0` such that, for every `x`, some `b ∈ W` has
  `(xbx⁻¹, c) ∈ D`.

Then `∫ e(g)f(xg) dg = 0` for every `x` and every bounded continuous `f` with `f(rg) = f(g)` whenever `(r, 1) ∈ D`;

(b) let `J` be a hermitian involution and `A` a matrix whose columns are isotropic (`A*JA = 0`). For `c > 0` and
`x ∈ U(J)` there is `y ∈ U(J)` with `‖y − 1‖ ≤ c` such that `g = xyx⁻¹` satisfies both of the following:
- `gA = (1 + c)A`;
- `w*Jgv = w*Jv` whenever `A*Jv = A*Jw = 0`.

The formal proof does not state that coefficients of integrable discrete series are cusp forms. That theorem follows
from (a) and (b) with `e = e_λ` (6.1 (a)) and `H` a height on the adelic quotient. The conclusion is drawn in
AdelicUnitaryGroupsAndAlgebraicModularForms §§5.2, 5.3, 5.4 (cusp kernels; cuspidality of forms).

*Needs:* 1.1, 2.8.

[ShortProof], `Lib/DiscreteSeries/CuspKernel` (`New.DiscreteSeries.integral_idempotentKernel_mul_eq_zero`,
`New.DiscreteSeries.exists_conj_mem_dilationGroup`)

### 6.3 The model function and `c_λ` in the holomorphic chamber

*Origin:* adapted from Harish-Chandra (1955–1956) and Knapp (1986), Chapter VI, the holomorphic discrete series
realised on the bounded symmetric domain, whose `K`-finite part is a lowest-weight module
(DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8): here, the explicit coefficient of the highest vector as a
product of quotients of minors, its reproducing property on `G_ε^Φ`, a uniqueness statement, and the identification of
`c_λ` in the holomorphic chamber.

*Method of the formal proof:* A holomorphic function of weight `u` is recovered from its means over circles of the
diagonal torus, which gives the reproducing formula. Under `F(g⁻¹) = conj F(g)` the laws for right and left
translation by the torus combine into the uniqueness statement. For `c_λ`, write `g` near `1` as `x′ax` with `a`
block diagonal and `x′ − 1`, `x − 1` in the off-diagonal blocks. Neither side sees `x′` or `x`, both agree at `a`, and
both are analytic.

Let `o` be injective with the indices of sign `+1` first. For `w ∈ ℤ^n` put `c_i = 2Σ_j|w_j|` if `ε_i = 1` and `c_i = 0`
otherwise. The *model function* is `m^hol_w(g) = m_{w+c}(g)/m_c(g)`. With the indices numbered along `o`, and `w`
`K`-dominant for `o`, it is the product of the leading minors of size `i` to the powers `w_i − w_{i+1}`, with
`w_{n+1} = 0`. For `u = (u_τ)` put
`m^hol_u(h) = ∏_τ m^hol_{u_τ}(h_τ)`. Let each `u_τ` be `K`-dominant for `o`. Prove that:

(a) `m^hol_u` is holomorphic of weight `u`;

(b) *(reproducing formula)* if `F` on `G^Φ` is holomorphic of weight `u` and `F·conj m^hol_u` is integrable, then
`∫ F·conj m^hol_u = (∫|m^hol_u|²)·F(1)`;

(c) if `F` is holomorphic of weight `u` and `F(g⁻¹) = conj F(g)`, then `F = F(1)·m^hol_u`;

(d) *(the holomorphic chamber)* let `n ≥ 1` and `A ∈ ℕ`. Let `w` be `K`-dominant for `o` with `w_i + γ ≤ w_j` whenever
`ε_i = 1` and `ε_j = −1`, where `γ > 500n³ + A + n + 1`. Then `l = 2w + 2ρ(−o)` has large gap `A`, and
`c_λ = m^hol_w` on `G_ε`.

*Needs:* 4.1, 4.3, 4.4, 5.2, 5.3.

[ShortProof], `Lib/DiscreteSeries/Holomorphic/ModelFunction` (`New.isHolOfWeight_holMinorsPi`,
`New.IsHolOfWeight.circle_mean_holMinorsPi`, `New.IsHolOfWeight.integral_mul_conj_holMinorsPi`,
`New.IsHolOfWeight.eq_holMinorsPi_mul`, `New.dsCoeff_eq_holMinors`)

### 6.4 The peaks of a bounded holomorphic form lie away from the cusps

*Origin:* adapted from the published theory of the location of the maximum of a cusp form (Siegel's argument): here,
for bounded forms on unitary groups over a CM field, holomorphic of a vector-valued weight with gap one. A point
where the form exceeds half its supremum takes the place of an attained maximum. The distance from the cusp is the
first minimum of the lattice, bounded explicitly in the weight and the level.

*Method of the formal proof:* If the first minimum at `g` is small, a short lattice vector `v` is isotropic. The
transvections `n(z) = 1 − p·z·vv*J` fix `F(g ·)`. Completing squares writes them, for `Im z > −1`, as `hb` with `h`
real and `b` triangular. The factor `b^u` is bounded and tends to `0` as `Im z → ∞`. So `z ↦ F(g·n(z))` extends to a
bounded holomorphic function of period one that vanishes at `i∞`, and the Schwarz lemma makes `|F(g)|` too small for a
peak.

Let `E` be a CM field with a CM type `Φ_w` at its infinite places `w`, and `V` a hermitian space over `E` of dimension
`n ≥ 1` with an adelic point and signs `s ∈ {±1}^n` at every infinite place. `G` is its adelic unitary group, `Γ` the
rational points, and `V_g` the space moved by `g`; all are taken from
AdelicUnitaryGroupsAndAlgebraicModularForms §3.1 (spaces with an adelic frame, lattices).
Let `λ(V_g) = min(1, ‖y‖)` over the nonzero vectors `y` of the lattice of `V_g`, with the archimedean length of
that roadmap: the first minimum, as in AdelicUnitaryGroupsAndAlgebraicModularForms §4.2. A *peak* of a bounded
function `F` is a point `g` with `|F(g)| > sup|F|/2`.

Let `o` be injective with the signs `+1` first, and `u = (u_w)` weights with the following properties:
- `u_{w,i} + 1 ≤ u_{w,j}` whenever `s_i = 1` and `s_j = −1`;
- `|u_{w,i}| ≤ A`, where `A ≥ 2`.

Let `p ∈ 𝒪_E` with `p̄ = −p` and `0 < Im Φ_w(p) ≤ A′` for every `w`, where `A′ ≥ 1`. Let `F : G → ℂ` have the
following properties:
- it is bounded;
- it is left invariant under `Γ`;
- it is right invariant under the principal congruence subgroup of level `p` of the finite adelic group;
- for every adelic `g` the function `h ↦ F(g·(h, 1))` on the real points is holomorphic of weight `u` (4.1 (f)).

Prove that `λ(V_g) ≥ (AA′)^{−1/2}` at every peak `g` of `F`.

*Needs:* 4.1, 6.3; AdelicUnitaryGroupsAndAlgebraicModularForms §§3.1, 3.9, 4.2 (spaces, first minima, principal
levels).

[ShortProof], `Lib/DiscreteSeries/Holomorphic/PeaksAwayFromCusp` (`New.Rows.IsPeak`, `New.Rows.exists_isPeak`,
`New.Rows.IsPeak.le_firstMinimum`)

## Layer 7: Weyl characters, orbital integrals and the formal degree

Weyl's character and dimension formulas for products of unitary groups in the form used, the `K`-type multiplicities of
`c_λ`, its orbital integrals on the compact torus as Laurent polynomials, their comparison with the open orbit, and
Harish-Chandra's formulas for the formal degree and the stable orbital integral.

### 7.1 Weyl's character and dimension formulas for products of unitary groups

*Origin:* adapted from the published theory of Weyl's character and dimension formulas: here, for the class function
on `K_ε` obtained by averaging a product of principal minors over conjugation, for the dimension as the inverse of
an `L²` norm on `U(n)`, and for the trace of the Schur matrices of a product of groups `GL_a(ℂ)`.

*Method of the formal proof:* By Schur's lemma the normalised conjugation means of products of minors are traces of
twisted Schur modules. The formula then follows from the bialternant identity for Schur modules at diagonal matrices.
The dimension formula is a limit at `1` along two one-parameter subgroups of the torus. The formula at elements with
distinct eigenvalues follows by diagonalisation.

For `ν ∈ ℤ^n` define the continuous class function on `K = K_ε`
`χ_ν(g) = (∫_K m_ν(y⁻¹gy) dy)/‖m_ν‖²_K`. For `x` in the torus `(S¹)^n` write `diag(x)`. For `l` injective let:
- `δ_a = #{b : ε_b = ε_a, l_b < l_a}`;
- `V_c(x) = ∏(x_a − x_b)` over the pairs with `ε_a = ε_b` and `l_b < l_a`.

Prove that:

(a) let `l` be injective and `ν` `K`-dominant for `−l`. Then `χ_ν(diag x)` is a Laurent polynomial in `x`, and
`V_c(x)·χ_ν(diag x) = Σ_w sgn(w)·x^{(ν+δ)∘w}`, the sum over the permutations `w` with `ε ∘ w = ε`. The case `ν = 0`
is the denominator formula `V_c(x) = Σ_w sgn(w)x^{δ∘w}`;

(b) *(dimension)* for all signs `+1` and `l` a parameter (any gap), `‖m_{λ−ρ}‖²_{U(n)}⁻¹ = dim(λ)`, in the notation of
4.1 (c);

(c) for the Schur matrices `S_κ` of `∏_v GL_a(ℂ)` twisted by powers `e_v` of the determinants, let each `g_v` have
distinct eigenvalues `x_{v,0}, …, x_{v,a−1}`. Then
`tr S_{κ,e}(g)·∏_v det(x_{v,i}^j) = ∏_v det(x_{v,i}^{e_v+λ_{v,a−1−j}+j})` (`0 ≤ i, j < a`), with `λ_v` the weight of
the diagram `κ` at `v`.

The library has the character formula for its own Weyl modules of one `GL_n` in characteristic zero:
`TauCeti.diagramSchurPoly_mul_alternant` with `TauCeti.char_weylRepOfShape_diagonal_eq_eval_diagramSchurPoly`, and the
dimension as `TauCeti.finrank_rationalWeylFDRep`. It has Schur orthogonality as
`ContRepresentation.schur_orthogonality_self`. What is missing, and what (a) and (b) need, is the bridge: on `K`,
`m_ν` is the coefficient of a unit highest weight vector of the irreducible representation of highest weight `ν`.
Hence `‖m_ν‖²_K = 1/dim` and `χ_ν` is its character.

*Needs:* 1.4, 4.1; RepresentationTheory/ClassicalGroups §§4.2, 5.1 (characters and dimensions of Weyl
modules); RepresentationTheory/CompactGroups §4.1 (Schur orthogonality);
IntegralRepresentationsOfGeneralLinearGroups §1.3 (Schur matrices, character at diagonals).

[ShortProof], `Lib/DiscreteSeries/Character/WeylCharacterFormula` (`New.HCParam.kTypeChar`,
`New.Orbital.weyl_character_kTypeChar`, `New.Orbital.weyl_denominator`, `New.weyl_dimension_formula`,
`New.Variety.trace_weylRep`)

### 7.2 `K`-type multiplicities of `c_λ` and orbital integrals as Laurent polynomials

*Origin:* particular to this proof: for the explicit function `c_λ` with a large gap, the integrality of its `K`-type
multiplicities, with multiplicity one at `Λ` and zero off `Λ + root cone`, the absolute convergence of its orbital
integrals on the compact torus with a denominator, and their Laurent property.

*Method of the formal proof:* The multiplicity of the type `ν` is the dimension of the space of `K`-highest vectors of
weight `ν` in a large step of the filtration of the module of 5.4 (e). This space is finite-dimensional by 4.5 (c).
Integrating the identity that expresses this over the group gives (a). For (c), `D·Θ` extends to a continuous class
function on `K`. Its coefficients against the characters of `K` are integers (Brauer's rule and (a)) and
square-summable, so almost all vanish, and 7.1 turns the finite sum into a Laurent polynomial.

Let `n ≥ 1`. Prove that:

(a) let `l` have large gap `A`. For `ν` `K`-dominant for `−l`, the function
`R(g) = ∫_K c_λ(g⁻¹kg)·conj χ_ν(k) dk` is integrable on `G` and `deg_λ·∫_G R = m` for a natural number `m`, with
`m = 1` if `ν = Λ` and `ν − Λ` in the root cone if `m ≠ 0`;

(b) let `l` have large gap `10n⁵`, `N = 4n² + 1`, and `D(x) = ∏(x_a − x_b)` over the pairs with `ε_a ≠ ε_b` and
`l_a < l_b`. For a continuous class function `d` on `K` with `d(diag x) = D(x)^N`, the map that sends `g ∈ G` to
the function `k ↦ d(k)·c_λ(g⁻¹kg)`, with values in the continuous functions on `K` (supremum norm), is integrable.
In particular the orbital integral
`Θ(x) = deg_λ∫_G c_λ(g⁻¹·diag(x)·g) dg` converges absolutely at every `x` with distinct entries;

(c) with `l`, `N`, `D` as in (b), there is a Laurent polynomial `P` with the following properties:
- `P` is antisymmetric under the permutations preserving `ε`;
- `P(x) = V_c(x)D(x)^N·Θ(x)` on the torus;
- `P = D^N·t` for a formal series `t` with `t_{Λ+δ} = 1`, each of whose exponents occurs in some alternant
  `Σ_w sgn(w)x^{μ∘w}` with `μ − (Λ + δ)` in the root cone.

*Needs:* 1.5, 4.5, 5.3, 5.4, 6.1, 7.1.

[ShortProof], `Lib/DiscreteSeries/Character/MultiplicityOrbitalIntegral` (`New.Orbital.exists_kType_multiplicity`,
`New.Orbital.integrable_mul_dsCoeff_conj`, `New.Orbital.IsOrbitalLaurent`, `New.Orbital.IsConeSeriesMultiple`,
`New.Orbital.exists_laurent_orbital_integral`)

### 7.3 Orbital integrals and the open orbit

*Origin:* particular to this proof: at a point `x` of the torus with `diag(ε)·diag(x)` accretive, the orbital integral
of `c_λ` is, up to a constant of modulus one, a multiple of Weyl's character of `U(n)` of highest weight `λ − ρ`, minus
an integral over the unitary matrices outside the open orbit `G_εB`. This error decays along rays of positive diagonal
matrices, so that a Laurent polynomial equal to it times a Laurent polynomial has no monomial of low level in the
relevant direction.

*Method of the formal proof:* Both sides are integrals of `y ↦ m_{−(λ−ρ)}(y*Jy)/m_{−(λ+ρ)}(y*Ay)`, a density on flags.
Over `G_ε` it gives the orbital integral, over `U(n)` the character (5.1 (a)), and the two differ by the integral off
the open orbit. Lower bounds for products of minors at `u*diag(2^f)u` show that the error is small at
`diag(2^{−(s·o+e)})` for large `s` (b). For (c), the identity is continued analytically off the torus; along these
rays the right side is of smaller order than the monomials of `P` of least level for `o`, which therefore cancel.

For `A` accretive let `off_l(A) = ∫_{k∈U(n), k∉G_εB_l} m_{−(λ−ρ)}(k*Jk)/m_{−(λ+ρ)}(k*Ak) dk`, with `J = diag ε`. Write
`χ^{U(n)}_ν` for the function `χ_ν` of 7.1 for the sign vector with all signs `+1` (so `K = U(n)`). Let `l` have gap
`h`. Prove that:

(a) there is `σ ∈ ℂ` with `|σ| = 1` such that, at every `x` in the torus with `J·diag(x)` accretive,
`σ·∫_G c_λ(g⁻¹·diag(x)·g) dg = ‖m_{λ−ρ}‖²_{U(n)}·χ^{U(n)}_{λ−ρ}(diag x) − off_l(J·diag x)`;

(b) `off_l` is complex analytic at every accretive matrix. Let `o ∈ ℤ^n` satisfy `o_a < o_b` whenever `l_b < l_a`.
Then for every `e ∈ ℤ^n` there is `c` such that, for all large integers `s`,
`|off_l(diag(2^{−(s·o_a + e_a)}))| ≤ c·2^{−s(o·(λ+ρ) + h)}`;

(c) let `P`, `Q` be Laurent polynomials with `P(x) = Q(x)·off_l(J·diag x)` at every `x` in the torus with `J·diag(x)`
accretive, and `o` as in (b). If `γ ∈ ℤ^n` satisfies `o·γ < o·(λ + ρ) + o·β + h` for every exponent `β` of `Q`, then
the coefficient of `x^γ` in `P` is `0`.

*Needs:* 4.1, 5.1, 5.2, 7.1.

[ShortProof], `Lib/DiscreteSeries/Character/OpenOrbitIntegral` (`New.Orbital.offOrbitIntegral`,
`New.Orbital.orbital_eq_char_sub_offOrbitIntegral`, `New.Orbital.analyticAt_offOrbitIntegral`,
`New.Orbital.exists_norm_offOrbitIntegral_le`, `New.Orbital.coeff_eq_zero_of_low_level`)

### 7.4 The formal degree and the stable orbital integral

*Origin:* adapted from Harish-Chandra (1966) and Atiyah and Schmid (1977), the formal degree of a discrete series,
equal for the Haar measure matched with the compact dual to the dimension of the representation of the compact dual
with the same infinitesimal character (DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3): here, for `U(p, q)`, a
large gap and the explicit function `c_λ`. The formal degree is `(∫|c_λ|²)⁻¹`, and the stable sum of the elliptic
orbital integrals of `e_λ` is computed. No representation occurs.

*Method of the formal proof:* By 7.2 (c) the orbital integral times a product of roots is a Laurent polynomial. It is
identified by comparing monomials of low level with 7.3. The constant, and with it the formal degree, is read off
one coefficient of this comparison.

Let `l` have large gap `10n⁵` and `n ≥ 1`, and let `q_ε` be the number of pairs `(a, b)` with `ε_a = 1` and
`ε_b = −1`. Prove that:

(a) `deg_λ = dim(λ) = ∏_{l_b<l_a}(λ_a − λ_b)/∏_{i<n} i!`;

(b) at every `x` in the torus with distinct entries:
`(−1)^{q_ε}·Σ_{σ∈S_n} ∫_G e_λ(g⁻¹·diag(x∘σ)·g) dg = #{σ : ε∘σ = ε}·conj χ^{U(n)}_{λ−ρ}(diag x)`.

The general theorem is DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3, which also gives (a) once `c_λ` is
identified with the lowest-`K`-type coefficient of a discrete series and the measures are matched. The shorter proof
needs only the statement above about one function.

*Needs:* 1.4, 4.1, 5.4, 7.1–7.3.

[ShortProof], `Lib/DiscreteSeries/Character/FormalDegree` (`New.Orbital.formalDegree_eq_weylDimensionPoly`,
`New.Orbital.neg_one_pow_mul_sum_integral_dsKernel`, `New.Orbital.harish_chandra_degree_and_orbital`)

## Layer 8: The local theta correspondence of discrete series

Fock data of a real unitary dual pair, matched parameters and joint harmonics. The section results are the block rule
for parameters, the uniqueness and existence of joint harmonics, the comparison of Casimir operators, Howe's argument,
and the local correspondence as statements about the operators `π(e_λ)` of an oscillator pair.

### 8.1 Fock data, oscillator actions, matching and joint harmonics

*Origin:* definitions and conventions.

*Method of the formal proof:* The polynomial Fock space is the polynomial ring in the variables `z_{rc}`. Each
variable has a sign, and raising and lowering operators are multiplications and derivatives according to the sign.
The two group actions come from one datum and its swap.

(a) *Fock data.* Let `R` (rows, `n = |R|`) and `C` (columns, `n′ = |C|`) be finite sets with signs `ε ∈ {±1}^R`,
`ε′ ∈ {±1}^C`. A *Fock datum* `T = (σ, γ, γ′)` consists of a sign `σ` and integers `γ`, `γ′`. Its *swap* is
`(−σ, γ′, γ)` with rows and columns exchanged. Let `𝒫 = ℂ[z_{rc}]`. The variable `z_{rc}` has sign
`η_{rc} = σε_rε′_c`. Put `A_{rc} = z_{rc}`, `B_{rc} = ∂_{rc}` if `η_{rc} = 1`, and `A_{rc} = −∂_{rc}`, `B_{rc} = z_{rc}`
otherwise.

(b) *Oscillator actions.* The row action of `𝔤𝔩_R` sends `E_ab` to `s_ab·Σ_c A_{ac}B_{bc} + γδ_ab`, with `s_ab = 1` if
`ε_a = ε_b` and `s_ab = σ` otherwise. The column action of `𝔤𝔩_C` is the row action of the swap; it sends `E_ab` to
`s′_ab·(−Σ_r B_{ra}A_{rb}) + γ′δ_ab`, with `s′_ab = 1` if `ε′_a = ε′_b` and `σ` otherwise. Both are `𝔤𝔩`-modules.
The *centre* of the row action is `γ − n′/2`, and that of the column action is `γ′ − n/2`.

(c) *Matching.* For parameters `l = 2λ` of the rows and `l′ = 2λ′` of the columns put `ξ_r = λ_r − γ + n′/2` and
`ξ′_c = λ′_c − γ′ + n/2`. The pair `(r, c)` is *matched* if `ξ_r = −ξ′_c` and `σε_rε′_cξ_r > |n − n′|/2`. The
parameters *match* if all of the following hold:
- both have gap `500(n + n′)³`;
- every row is matched with a column or has `|ξ_r| < (n − n′)/2`;
- every column is matched with a row or has `|ξ′_c| < (n′ − n)/2`.

(d) *Harmonics.* `Φ ∈ 𝒫` is *termwise harmonic* if `∂_{ac}∂_{bc}Φ = 0` whenever `ε_a ≠ ε_b`; for the swap, if
`∂_{ra}∂_{rb}Φ = 0` whenever `ε′_a ≠ ε′_b`. A *joint harmonic* for matching `l`, `l′` is a nonzero `Φ` with the
following properties:
- it is termwise harmonic for `T` and for its swap;
- it is `K`-highest of weight `Λ(l)` for the row action, in the order of `l`;
- it is `K`-highest of weight `Λ(l′)` for the column action, in the order of `l′`.

The *Laplacians* of the rows are `Σ_{c : η_{ac}=−1} A_{ac}B_{bc}` for `ε_a ≠ ε_b`. A *pre-joint harmonic* is a nonzero
`Φ` with the following properties:
- it is killed by the Laplacians of both sides;
- it is killed by the compact raising operators of the columns;
- it is `K`-highest of weight `Λ(l)` for the rows.

(e) *Oscillator pairs.* Let `𝓕` be the Fock space of WeilRepresentationsOnBanachSpacesOfData §§1.1, 2.1 (the Fock
model), a complete normed space, with its bounded positive definite hermitian form `⟨,⟩` and the vectors `v_P` of the
polynomials `P`. An *oscillator representation* of `G_ε` for `T` is a unitary representation `π` of exponent `|R × C|`
on `𝓕` (4.2 (e)) with the following properties:
- its derivative along `P ↦ v_P` is the row action;
- `⟨v_P, π(z)v_P⟩ > 0` for every positive definite `z ∈ G_ε` and every nonzero termwise harmonic `P`.

An *oscillator pair* is an oscillator representation `π` of `G_ε` for `T` and `π′` of `G_{ε′}` for the swap, with `π(g)`
and `π′(h)` commuting. For `v_Φ` write `Φ`.

*Needs:* 4.1, 4.2; WeilRepresentationsOnBanachSpacesOfData §§1.1, 2.1 (Fock space, form, polynomial vectors).

[ShortProof], `Lib/DiscreteSeries/Theta/FockDualPair` (`New.FockDualPair`, `New.FockDualPair.swap`,
`New.FockDualPair.oscRows`, `New.FockDualPair.swap_oscRows_E`, `New.FockDualPair.IsMatchedPair`, `New.IsMatch`,
`New.FockDualPair.IsTermwiseHarmonic`, `New.IsJointHarmonic`, `New.FockDualPair.fockLaplacian`),
`Lib/DiscreteSeries/Theta/FockJointHarmonics` (`New.FockDualPair.IsPreJointHarmonic`),
`Lib/Weil/Fock/OscillatorPair` (`New.OscillatorRep`, `New.OscillatorPair`)

### 8.2 The block rule for corresponding parameters

*Origin:* adapted from Li (1990): the theta lift `θ(π_λ) = π_{λ′}` of a discrete series of `U(p, q)`
(ThetaKernelsForUnitaryDualPairs §3.46a, paragraph *Data*): here, the combinatorial relation between the two
parameters, with the shifts by the weights of the splitting characters and a gap `500(n + n′)³`, and its equivalence
with matching on Fock space.

*Method of the formal proof:* Both sides are symmetric in the two spaces, so one may take `n ≤ n′`. The matched entries
are then the common ones, and the unmatched entries of the larger side are the points of `(n′ − n − 1)/2 + ℤ` of modulus
below `(n′ − n)/2`, that is, the block. Only integer vectors are involved.

For `d ≥ 0` let `[d]` be the doubled block `{d − 1, d − 3, …, 1 − d}` and `e + [d]` its translate by `2e`. For spaces
`S`, `T` of ranks `n`, `n′` with signs `s`, `t`, doubled parameters `l`, `l′` and integers `γ`, `γ′`, put
`ℓ_c = l_c − 2γ′ + n′` and `ℓ′_r = l′_r − 2γ + n`. The pair satisfies the *block rule* if all of the following hold:
- both parameters have gap `500(n + n′)³`;
- if `n ≤ n′`, the set of the `ℓ′_r` is the union of the set of the `ℓ_c` and `[n′ − n]` (symmetrically if `n′ ≤ n`);
- a common positive entry `ℓ_c = ℓ′_r > 0` has `s_c = t_r`;
- a common negative entry has `s_c = −t_r`.

Prove that:

(a) the block rule for `(γ, γ′, l, l′)` holds if and only if `l′` and `−l` match (8.1 (c)) for the Fock datum with rows
indexed by `T`, columns by `S`, `σ = 1`, row shift `γ` and column shift `n′ − γ′`;

(b) if the block rule holds for `(γ, γ′, l, l′)` on `(S, T)`, then it holds for `(γ′, γ, l′, l)` on `(T, S)`; for
`(n − γ, n′ − γ′, −l, −l′)` on `(S⁻, T)`, where `S⁻` is `S` with all signs negated; for `(γ, γ′, l, l′)` on
`(S⁻, T⁻)`; and for `(γ + u, γ′ + u′, l + 2u′, l′ + 2u)` for all integers `u`, `u′`;

(c) if `n ≤ n′`, `γ = e + ⌊n/2⌋` and `γ′ = e + ⌊n′/2⌋`, the block rule holds if and only if all of the following hold:
- the gaps hold;
- the set of the `l′_r + (n mod 2)` is the union of the set of the `l_c + (n′ mod 2)` and `e + [n′ − n]`;
- for a common entry `l_c + (n′ mod 2) = l′_r + (n mod 2)`, `s_c ≠ t_r` exactly when it is below `2e`.

The same holds with `⌈·⌉` and the signs of the parities reversed.

*Needs:* 4.1, 8.1.

[ShortProof], `Lib/DiscreteSeries/Theta/BlockRule` (`New.IsBlockRule`, `New.isBlockRule_iff_isMatch`,
`New.IsBlockRule.symm`, `New.IsBlockRule.neg`, `New.IsBlockRule.shift`, `New.isBlockRule_iff_of_character`,
`New.isBlockRule_iff_of_character_conj`)

### 8.3 Uniqueness of joint harmonics

*Origin:* adapted from Howe (1989), the decomposition through joint harmonics, and Kashiwara and Vergne (1978) and
Paul (1998), the occurring types and lowest `K`-types (ThetaKernelsForUnitaryDualPairs §3.46): here, uniqueness up to
a scalar of the joint harmonic of matched parameters of a real dual pair of unitary groups on the polynomial Fock
space, with one of its two weights sufficing. This is the case of multiplicity one in the `(GL, GL)`-duality that the
proof uses.

*Method of the formal proof:* The weights relative to the vacuum have the sign of the matching. Both polarisations in
a raising operator kill a highest harmonic polynomial, so each row carries variables of one sign. Such a polynomial
does not vanish at the `0`-`1` matrix of the matching, so two of them are proportional. The Fischer decomposition in
bounded degree (orthogonal complements for `⟨P, Q⟩ = P(∂)Q(0)`) gives the criteria for the Laplacians to vanish.

Let `l`, `l′` match for `T`. Prove that:

(a) any two pre-joint harmonics are proportional;

(b) a pre-joint harmonic does not vanish at the matching point, the `0`-`1` matrix of the matched pairs;

(c) if `Φ` is a joint harmonic and `P` satisfies all of the following:
- it is termwise harmonic for `T` and for the swap;
- it is `K`-highest of weight `Λ(l)` for the rows;
- it is killed by the compact raising operators of the columns,

then `P = cΦ`. The same holds with rows and columns exchanged.

*Needs:* 8.1.

[ShortProof], `Lib/DiscreteSeries/Theta/FockJointHarmonics` (`New.IsMatch.unique`,
`New.IsMatch.eval_matchingPoint_ne_zero`, `New.IsJointHarmonic.exists_eq_smul_of_row_weight`,
`New.IsJointHarmonic.exists_eq_smul_of_column_weight`)

### 8.4 The Casimir operators of an oscillator pair

*Origin:* adapted from the published theory of the correspondence of infinitesimal characters in the theta
correspondence: here, the identity of the centred Casimir operators of the two actions on the polynomial Fock space,
and the corresponding relation between matched parameters.

*Method of the formal proof:* The centred Casimir operators are written in normal order in the operators `A_{rc}`,
`B_{rc}`. Their quartic parts agree, and the quadratic and constant parts differ by the constant. For matched
parameters the unmatched entries form the block, whose sum of squares is computed.

For a `𝔤𝔩_R`-module and `w ∈ ℂ`, let `Ω^w = Σ_{a,b}(E_ab − wδ_ab)(E_ba − wδ_ba)` be the Casimir operator centred at
`w`. Let `T` be a Fock datum with `n` rows and `n′` columns. Prove that:

(a) `Ω^{γ′−n/2}` of the column action equals `Ω^{γ−n′/2}` of the row action plus `nn′(n − n′)/4`;

(b) if `l`, `l′` match, then with `u = λ − (γ − n′/2)` and `u′ = λ′ − (γ′ − n/2)`:
`|u|² − n(n² − 1)/12 + nn′(n − n′)/4 = |u′|² − n′(n′² − 1)/12`.

Here `n(n² − 1)/12` and `n′(n′² − 1)/12` are `|ρ|²` and `|ρ′|²`.

*Needs:* 4.1, 4.2, 8.1.

[ShortProof], `Lib/DiscreteSeries/Theta/CasimirComparison` (`New.GlModule.centredCasimir`, `New.FockDualPair.centre`,
`New.FockDualPair.centredCasimir_swap_oscRows_eq_add`, `New.IsMatch.centred_casimirValue_eq`)

### 8.5 Existence of joint harmonics and Howe's argument

*Origin:* adapted from Howe (1989), the decomposition through joint harmonics, and Kashiwara and Vergne (1978) and
Paul (1998), the occurring types and lowest `K`-types (ThetaKernelsForUnitaryDualPairs §3.46): here, the existence of
the joint harmonic of matched parameters as an explicit product of minors along layers, and a generation statement
for subspaces stable under the column action, which takes the place of Howe's duality theorem.

*Method of the formal proof:* The matched pairs are arranged in layers, each pairing rows with columns, of total weight
`Λ(l)`. The joint harmonic is a product of minors along the layers. Howe's argument is an induction on the degree. If
`G` missed a polynomial of degree at most `j`, the orthogonal complement of `G` in degree at most `j` (for the Fischer
inner product `⟨P, Q⟩ = P(∂)Q(0)`) would contain a nonzero `Q` that is highest for the columns. The hypotheses (by
adjunction) make `Q` `K`-highest of weight `Λ(l)` for the rows. Fischer's decomposition makes `Q` killed by the
Laplacians of both sides. So `Q` is a multiple of `Φ` (8.3), hence lies in `G`, and `Q = 0`.

Let `l`, `l′` match for `T`. Prove that:

(a) a joint harmonic exists;

(b) *(Howe's argument)* let `Φ` be a joint harmonic and `G ⊆ 𝒫` a subspace that is stable under the column action,
contains `Φ`, and contains:
- `X·P` for every `X ∈ 𝔤𝔩_R` and every `P` that is `K`-highest for the rows of a weight `ν` with `ν − Λ(l)` outside the
  root cone of `l`;
- the images of the `E_ba` with `ε_a = ε_b` and `l_b < l_a`;
- the images of the `E_aa − Λ(l)_a`.

Then `G = 𝒫`.

*Needs:* 8.1, 8.3.

[ShortProof], `Lib/DiscreteSeries/Theta/LocalCorrespondence` (`New.IsLayering`, `New.IsMatch.isLayering`,
`New.IsMatch.exists_isJointHarmonic`, `New.IsJointHarmonic.howe_argument`)

### 8.6 The local theta correspondence for oscillator pairs

*Origin:* adapted from Li (1990): the theta lift `θ(π_λ) = π_{λ′}` of a discrete series of `U(p, q)` whose parameter has
entries of absolute value at least `(t + 1)/2` (ThetaKernelsForUnitaryDualPairs §3.46a): here, as statements about the
operators `π(e_λ)`, `π′(f)` of an oscillator pair on Fock space, for matched parameters of gap `500(n + n′)³`. No
discrete series representation and no Howe duality theorem are used.

*Method of the formal proof:* (a) is 6.1 (d), with the positivity of an oscillator representation at positive definite
elements. For (b), the Casimir operators of the two groups agree on `Φ` up to the constant of 8.4. So `π(e_λ)Φ` is
`K′`-highest of weight `Λ(l′)` for `π′` with Casimir value `κ_{λ′}`, and 6.1 (f) applies to `π′`. For (c), the
polynomials `P` such that `π(e_λ)v_P` is a smearing of `π(e_λ)Φ` by a bump of the second group form a subspace
satisfying the hypotheses of Howe's argument (8.5 (b)), by 6.1 (b), (c) and 5.4 (c).

Let `R`, `C` be nonempty, `(π, π′)` an oscillator pair for `T`, and `Φ` a joint harmonic of matching parameters `l`,
`l′`. Write `e_λ`, `e_{λ′}` for the kernels of 4.1 on `G_ε` and `G_{ε′}`. Prove that:

(a) `Re⟨Φ, π(e_λ)Φ⟩ > 0`;

(b) `π′(f)π(e_λ)Φ = π(e_λ)Φ` for every `f` on `G_{ε′}` with `f(g)‖g‖^{|R×C|}` integrable and
`∫ f(y)e_{λ′}(y⁻¹g) dy = e_{λ′}(g)` for all `g`;

(c) for every `P ∈ 𝒫` there is a bump `α` on `G_{ε′}` with `π(e_λ)v_P = π′(α̌)π(e_λ)Φ`, where `α̌(g) = α(g⁻¹)`;

(d) `π′(g′)` commutes with `π(e_λ)`, and along `P ↦ π(e_λ)v_P` the derivative of `π′` is the column action; and
`(π′, π)` is an oscillator pair for the swap of `T`.

For `n′ ≠ n` and parameters in the range of its *Data*, ThetaKernelsForUnitaryDualPairs §3.46a, together with
DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (b) and the existence of the discrete series of both
parameters, implies (a)–(c). The shorter proof needs only the statements above. Equal ranks, which matching allows,
are outside the *Data* of §3.46a.

*Needs:* 5.4, 6.1, 8.1, 8.3–8.5.

[ShortProof], `Lib/DiscreteSeries/Theta/LocalCorrespondence` (`New.OscillatorPair.re_inner_integratedRep_pos`,
`New.OscillatorPair.integratedRep_integratedRep_eq_self`, `New.OscillatorPair.exists_bump_integratedRep_eq`,
`New.OscillatorPair.map_integratedRep_dsKernel`, `New.OscillatorPair.isDerivedAction_integratedRep`,
`New.OscillatorPair.swap`)

## What the library already provides

- The unitary group `U(J)` of a matrix, as the subgroup `{g : g*Jg = J}` of `GL_n`: `Matrix.unitaryGroupOf`. The group
  `U(diag ε)` after reindexing: `TauCeti.Matrix.indefiniteUnitaryGroup`. The library has their algebra and topology,
  not their measures.

## Results taken from other roadmaps

- Characters of Weyl modules of `GL_n` as Schur polynomials, and their dimensions:
  RepresentationTheory/ClassicalGroups §§4.2, 5.1 (used by 7.1, which states the bridge to products of minors).
- Schur orthogonality for one irreducible representation of a compact group: RepresentationTheory/CompactGroups §4.1
  (used by 7.1).
