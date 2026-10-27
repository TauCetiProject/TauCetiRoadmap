# Global holomorphic functions of one complex variable

This roadmap owns approximation, prescribed isolated singularities and divisors, entire canonical
products, and global smooth ∂̄ solvability on arbitrary open subsets of ℂ. It consumes the local
complex-analysis, contour and geometric-function APIs under their stated hypotheses.

## Scope and foundations

Work scalar-valued functions on arbitrary open `Ω : Set ℂ`; establish connected-component
versions by applying the theorems componentwise. Treat the empty domain and finite/discrete-set
edge cases. Use `DifferentiableOn ℂ` / native analytic predicates and the native meromorphic order
and locally-finite support carriers after checking their precise hypotheses. Do not introduce a
parallel definition of holomorphic function merely to restate the same API.

### Preparatory real-plane calculus and compact-support Cauchy–Green

Define the Wirtinger operators by the native real Fréchet derivative:
`∂̄u(z)=(fderiv ℝ u z 1+i*fderiv ℝ u z i)/2` and
`∂_z u(z)=(fderiv ℝ u z 1−i*fderiv ℝ u z i)/2`.
Under `DifferentiableAt ℝ u z`, prove `∂̄u(z)=0` iff `DifferentiableAt ℂ u z`;
derive the open-set versions under real differentiability at each point. Smoothness uses
`ContDiffOn ℝ ∞`, with `open scoped ContDiff`; native `⊤` in this order type is analytic
order `ω`, and does not express the smooth compact-support inputs.

#### Low-regularity Cauchy–Riemann criterion (Looman–Menchoff)

For an open `Ω ⊆ ℂ` and `f = u + i v : ℂ → ℂ` with `ContinuousOn f Ω`, prove that
existence at every point of `Ω` of the four real coordinate partial derivatives, together
with `u_x = v_y` and `u_y = -v_x`, implies `DifferentiableOn ℂ f Ω`. Encode the two
directional complex derivatives with `HasLineDerivAt ℝ f` in directions `1` and
`Complex.I`; the CR equations are precisely `f_I = Complex.I * f_1`. Conversely,
complex differentiability gives these coordinate partials and CR. The assertion is local
and requires no connectedness assumption. Do not assume continuity or local integrability
of the partial derivatives, or replace coordinate partial existence by real Fréchet
differentiability. Keep the separate countable-exception / almost-everywhere-CR extension
outside this assertion.

Use this proof route. If the conclusion fails, let `E` be the points of `Ω` having no
relative neighborhood on which `f` is holomorphic. Then `E` is relatively closed in `Ω`;
if it is empty the conclusion already holds. Regard `Ω` as an open subtype of `ℂ` and
`E` as a closed subtype of `Ω`. Install their local `LocallyCompactSpace` structures
using `IsOpen.locallyCompactSpace` and `IsClosed.locallyCompactSpace`, then apply
the native locally compact Hausdorff Baire instance to `E`;
do not claim that a relatively closed subset of an open domain is complete in the
inherited metric.

For each integer `n ≥ 1`, let `E_n` contain those `z ∈ E` for which, for every real `h`
with `0 < |h| ≤ 1/n`, `|f(z+h)-f(z)| ≤ n|h|` whenever `z+h ∈ Ω`, and
`|f(z+i h)-f(z)| ≤ n|h|` whenever `z+i h ∈ Ω`. These endpoint-in-domain clauses are part
of the definition. For a fixed increment the failure set is open relative to `E`, so
`E_n` is relatively closed. Existence of the two coordinate partials at each `z ∈ E`
implies `E = ⋃_{n≥1} E_n`. Baire gives some `N ≥ 1` and a nonempty relatively open part
of `E` contained in `E_N`. Choose an ordinary bounded open rectangle `K` around one of
its points with `closure K ⊂ Ω` and `E ∩ K ⊂ E_N`.

Identify the real plane with `ℂ` through `Complex.measurableEquivRealProd`.
Use `Complex.volume_preserving_equiv_real_prod` to transport the scalar product-area
integrals and `m(R\E)` to native complex `volume` in the content and density steps.

Prove the following balanced-rectangle scalar estimate. For a closed nondegenerate
rectangle `R`, write `w_R,h_R` for its side lengths and assume `1/2 ≤ w_R/h_R ≤ 2`.
Let the ambient function `φ : ℝ×ℝ → ℝ` satisfy `ContinuousOn φ R` and have both coordinate
partial derivatives at every point of `R`. Let `N ≥ 0` and let `F ⊆ R` be closed and
nonempty. Suppose that for every `(x,y) ∈ F` and all `(ξ,y),(x,η) ∈ R`,
`|φ(ξ,y)-φ(x,y)| ≤ N|ξ-x|` and `|φ(x,η)-φ(x,y)| ≤ N|η-y|`.
Let `J=[a,b]×[α,β]` be the smallest rectangle containing `F`. Then

`|∫_a^b (φ(x,β)-φ(x,α)) dx - ∬_F ∂_yφ dxdy| ≤ 5N m(R\F)`,

`|∫_α^β (φ(b,y)-φ(a,y)) dy - ∬_F ∂_xφ dxdy| ≤ 5N m(R\F)`,

where `m` is planar Lebesgue measure. If `J` is degenerate in either coordinate, both
expressions are zero: use zero-length interval integrals and the zero area of `F`.

Own the one-dimensional interpolation proof. On a nonempty closed vertical slice `P` of
`F`, write `g(y)=φ(x,y)` for `y∈[α,β]`. Adjoin `α,β` to `P` with their actual values
`g(α),g(β)`. The increment hypotheses at points of `P` make these enlarged data
`N`-Lipschitz, including the pair of endpoints by comparison through any point of `P`.
Extend the data affinely over each complementary component interval. Prove that the
interpolant is `N`-Lipschitz and has the original endpoint values. Its derivative on a
gap is the endpoint secant slope, bounded by `N`. At non-isolated points of `P` which
are not gap endpoints, prove by difference quotients that its derivative agrees with
`g'`. Isolated points and gap endpoints form a countable exceptional set; the disjoint
gap intervals are countable by assigning distinct rationals. Define the derivative to
be zero on the exceptional set. Prove its measurability from difference quotients and
its interval integrability using the bound `N` on the finite interval. Apply native
`MeasureTheory.integral_eq_of_hasDerivAt_off_countable_of_le` to obtain the endpoint
identity. Subtract the integral of `g'` over `P`; the remaining error is at most `N`
times the length of `[α,β]\P`. The interpolation and accumulation-point proof are
targets here; the native FTC supplies the final identity after its continuity,
off-countable derivative and `IntervalIntegrable` hypotheses have been proved.

For an empty vertical slice with `x∈[a,b]`, take points `(x_β,β),(x_α,α)∈F` attaining
the top and bottom. Bound `|φ(x,β)-φ(x,α)|` along
`(x,β)→(x_β,β)→(x_α,β)→(x_α,α)→(x,α)`.
All four increments have an endpoint in `F`. The three horizontal distances total at
most `2w_J`, so the bound is `N(2w_J+h_J)≤5N h_R`. Let `S` be the set of such empty
slices in `[a,b]`. Use the full-height region `S×R_y ⊆ R\F`, of area `m₁(S)h_R`, for
this contribution. The gap regions of the nonempty slices lie in `J\F` and are
disjoint from `S×R_y`. Their combined error is therefore at most `5N m(R\F)`.
Exchange axes for the second inequality, using the other aspect-ratio bound.

Discharge the Fubini premises explicitly. The restrictions of `φ` to `R` are continuous
and Borel measurable. Express each partial derivative on the interior as a pointwise
limit of measurable coordinate difference quotients. Set it to zero outside its domain
for this measurability argument; boundary lines have area zero. The increment bounds
pass to the derivative limit on `F`, giving absolute value at most `N` there; hence the
restricted derivatives are integrable on this finite-area set. Sections of `F` are
closed. Use product-measure Fubini with its `AEStronglyMeasurable` and integrability
premises to identify these area integrals with the section integrals above. These
arguments add no hypothesis on the partial derivatives of the headline theorem.

Apply the scalar estimate to both real components of `f` on a balanced cell `R ⊂ K`
with side lengths at most `1/N` and `F=E∩R≠∅`. The CR equations cancel the two area
integrals in each component of the contour integral, giving
`|λ(J)|≤20N m(R\E)`, where `λ` is the positively oriented boundary integral and `J`
is the smallest rectangle containing `F`. To pass from `J` to `R`, subdivide `R\J`
into finitely many rectangular strips. Each strip's open interior avoids `E`, while
its boundary may meet `E`. Native Cauchy–Goursat applies to continuity on the closed
strip and holomorphicity in its interior. Cancel shared edges to obtain `λ(R)=λ(J)`.
Handle a degenerate `J` by zero-length edges and cancellation; then `λ(J)=0`. If
`R` misses `E`, apply Cauchy–Goursat directly. Thus every such balanced cell satisfies
`|λ(R)|≤20N m(R\E)`.

For an arbitrary nondegenerate closed rectangle `R ⊂ K`, set
`δ=min(w_R,h_R,1/N)`, `m=ceil(w_R/δ)`, `n=ceil(h_R/δ)`, and subdivide equally into
`m` columns and `n` rows. Each cell side lies in `[δ/2,δ]`; each cell has aspect ratio
in `[1/2,2]` and side lengths at most `1/N`. Summing the cell estimates and cancelling
internal edges gives `|λ(R)|≤20N m(R\E)`; common boundaries have zero area. Prove this
finite grid construction without assuming finite tiling by squares.

Define the complex boundary-integral content on `∅` together with nondegenerate
half-open rectangles `[a,b)×[c,d)` whose closure lies in `K`, with value zero at `∅`.
Prove its set-semiring axioms and finite additivity by collecting all coordinate
endpoints of each finite disjoint partition, refining to a common finite grid, and
cancelling opposite internal edges. The preceding estimate gives
`‖A(Q)‖ₑ≤20N area(Q)` on the whole semiring. Apply native
`VectorMeasure.exists_extension_of_isSetSemiring_of_le_measure` with the finite measure
`μ=20N·volume|_K`, proving its domination and measurability hypotheses. Since `K` is
bounded, contain it in a ball of finite volume to prove `volume K<∞` and the required
`IsFiniteMeasure μ`. Use
`variation_le_of_forall_enorm_le` to obtain `c.variation≤μ` and hence `c≪volume`.

Construct `ComplexMeasure.HaveLebesgueDecomposition c volume` locally from the real and
imaginary signed-measure decomposition instances for σ-finite volume. Use
`ComplexMeasure.rnDeriv`, `integrable_rnDeriv`, and
`singularPart_add_withDensity_rnDeriv_eq`. Prove singular-part elimination componentwise:
`ComplexMeasure.absolutelyContinuous_ennreal_iff` gives absolute continuity of `c.re`
and `c.im`. Each signed density measure is absolutely continuous by
`Measure.withDensityᵥ_absolutelyContinuous`; subtract it from the corresponding signed
measure to show its singular part is absolutely continuous. Native
`SignedMeasure.mutuallySingular_singularPart` makes it mutually singular to volume.
For each component, split every measurable set at a measurable singularity witness,
use singularity on one side and absolute continuity on the volume-null side, and then
additivity to obtain zero. Since the complex singular part is assembled from these two
signed singular parts, it is zero as well. This identifies `c` with its integrable
complex RN density `g`.

Use `VitaliFamily.ae_tendsto_average_norm_sub` for the native closed-ball Vitali family
on `ℂ`, supplied by the finite-dimensional real Besicovitch-covering instance. Transfer
the norm-average limit to centered half-open squares `Q_r` of half-side `r>0`:
`Q_r⊆closedBall(x,√2r)`, `area(Q_r)=4r²`, and
`area(closedBall(x,√2r))=2πr²`, using native `Complex.volume_closedBall`. The average of any nonnegative integrable function
over `Q_r` is at most `π/2` times its average over that ball. Use the positive-radius
rescaling `r↦√2r` to transfer the limit as `r→0⁺`; in particular the square average of
`‖g(y)-g(x)‖` tends to zero. Apply the same comparison to the measurable-set density
theorem for `E∩K`. At almost every `x∈K\E`, a neighborhood avoids `E`, and all
sufficiently small rectangle content values vanish. At almost every `x∈E∩K`, density
of `E` is one and `|c(Q_r)|/area(Q_r)≤20N area(Q_r\E)/area(Q_r)→0`.
The square differentiation identity therefore gives `g=0` almost everywhere on `K`.
Domination makes `c` vanish off `K`, so `c=0` and all rectangle contour integrals in
`K` vanish.

Prove the all-corner Morera bridge. Native `Complex.IsConservativeOn f K` quantifies
every pair `z,w` with `Rectangle z w⊆K`, including reversed and degenerate rectangles.
For degenerate coordinate intervals, use zero-length interval integrals and cancellation
of remaining opposite edges. For nondegenerate rectangles use the half-open content
identity and boundary formula. Handle every corner order using
`intervalIntegral.integral_symm` and `Complex.wedgeIntegral_add_wedgeIntegral_eq`.
Apply native `TauCeti.morera` with `ContinuousOn f K` to obtain holomorphicity on `K`,
contradicting `E∩K≠∅`.

This target consumes native locally compact Baire, rectangle Cauchy–Goursat/Morera,
off-countable FTC, product Fubini, finite vector-measure extension, variation domination,
complex RN decomposition, Besicovitch/Vitali differentiation, and measurable-set density.
Its new proof targets are the balanced scalar estimate and interpolation construction,
the measurability/Fubini instantiation, finite-grid rectangle content, complex singular-part
elimination, square-to-ball adapter, and all-corner Morera bridge. Use native
`VectorMeasure`/`ComplexMeasure` carriers throughout.

#### Compact-support Cauchy–Green

Let `dA` be native Lebesgue `volume` on ℂ, normalized by
`Complex.volume_preserving_equiv_real_prod`. Prove local integrability of `1/z` in two real
dimensions. Pin the fundamental-solution identity by the following complex bilinear weak
identity for every smooth compactly supported test function φ:
`∫ ζ, (1/(π*ζ))*∂̄φ(ζ) dA(ζ) = −φ(0)`.
This defines `∂̄(1/(πz))=δ₀` through integration by parts; it is not a pointwise derivative
claim or a sesquilinear test pairing. Bochner integrals use the native complex Banach carrier.
For bounded measurable compactly supported input, prove integrability of the translated
kernel for each z. For smooth compactly supported input, prove transfer of derivatives under
the convolution and all smoothness conclusions used below. These scalar analytic results
use native real-plane measure and calculus, independently of a manifold-form implementation.

Establish the compact-support Cauchy–Green identity used in its
Cauchy/Pompeiu route: for `φ∈C_c^∞(ℂ)`, `Tφ(z)=(1/π)∫φ(ζ)/(z−ζ) dA(ζ)` is smooth and
`∂̄Tφ=φ`; moreover `T(∂̄φ)=φ`. Fix the normalization/sign by this displayed kernel. For a
cutoff `α` equal to one near `K`, apply the compact-support formula to `αf`; the remaining
cutoff-derivative term has support separated from `K`. Its integral kernel is smooth on the product
of that support with `K`, so Riemann sums approximate the integral uniformly on `K`. Prove the uniform Riemann-sum lemma: for compact `K₁,K₂` and continuous `G:K₁×K₂→ℂ`,
partition a bounded box containing `K₁` into half-open squares of mesh δ, retain the finitely
many cells meeting `K₁`, and choose a sample in each positive-area intersection. The sums
`Σ_{j,k}G(z_{jk},ξ)Area(S_{jk}∩K₁)` converge uniformly in `ξ∈K₂` to
`∫_{K₁}G(z,ξ)dA(z)`. Bound the error by `Area(K₁)ω_G(√2δ)` using the uniform modulus
on `K₁×K₂` (and state the boundary-cell convention). Record `dz∧dz̄=−2i dA` only as a
later coordinate identity; this scalar lemma uses real-plane Bochner area measure and no form carrier. This is the compact-product lemma used with the cutoff derivative kernel. These belong to the GH0 preparatory layer and precede Runge approximation. In particular, if α is compactly supported in U and α=1 near K, then on K
`f(ξ)=T(∂̄(αf))(ξ)=(1/π)∫ f(ζ)∂̄α(ζ)/(ξ−ζ) dA(ζ)`; the support of `∂̄α` is separated
from K. The cutoff satisfies `HasCompactSupport α`, `tsupport α ⊆ U`, and `α=1` near K;
f is holomorphic on U and αf is extended by zero outside U.


### Preparatory primary factors and locally uniform products

Define `E₀(w)=1-w` and `E_p(w)=(1-w) exp(w + … + w^p/p)` for p>0. For a finite or countable sequence of nonzero zeros `a_n` repeated according to multiplicity,
allow the empty and finite cases (empty product `1`), and for an infinite sequence require
`|a_n|→∞`. Prove local-uniform convergence of `∏ E_{p_n}(z/a_n)` under
`Σ_n (R/|a_n|)^(p_n+1)<∞` for every `R>0`, and prove its exact zero divisor. State the local
order equality `analyticOrderAt F z = Nat.card {n | a_n=z}` when the set is finite; multiplicity
indexing, rather than distinct zero support, supplies the general repeated-zero statement. Prove the sharp estimate `|1−E_p(w)|≤|w|^(p+1)` for `|w|≤1`, the local-uniform
primary-product theorem and its exact zero divisor. Also prove the general locally-uniform product
lemma: for holomorphic `u_j` on open U with `Σ_j sup_K |u_j|<∞` for every compact K⊂U,
`∏_j(1+u_j)` converges locally uniformly to a holomorphic function. At each z let
`J_z={j : u_j(z)=−1}`. Compact summability forces `J_z` finite; require also each factor indexed
by `J_z` to have finite germ order at z (so none vanishes identically near z). Then their orders
sum to the product order, while the remaining tail is a holomorphic unit germ at z. In particular,
if `J_z=∅`, the product is nonzero at z. For the convergence conclusion consume
`Summable.hasProdUniformlyOn_one_add` (or its natural-number variant) from
`Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean` on each compact K, with the
summable majorant `sup_K |u_j|` and continuity supplied by holomorphy. Use its actual
cofinite eventual-majorant hypothesis; the majorant may depend on K. Assemble the compact
conclusions into `HasProdLocallyUniformlyOn` and use native holomorphic-limit closure.
The locally uniform theorem with one global majorant does not itself supply this
compact-dependent adapter. For the additional germ-order and unit-tail conclusions,
discard finitely many terms so `|u_j|≤1/2`, sum the logarithmic series, and treat the finite
factors separately. The weaker uniform-absolute-tail criterion below remains a separate target.

#### Genus-one products over weighted zero support

This roadmap owns the general primary factors and their basic API, including
`E_p(0)=1`, `E_p(w)=0 ↔ w=1`, and the specialization `E₁(w)=(1-w) exp(w)`.
Writing `Q_p(w)=Σ_(k=1)^p w^k/k`, prove `E_p'(w)=−w^p exp(Q_p(w))` everywhere
and `logDeriv E_p(w)=−w^p/(1-w)` away from `w=1`, including `p=0`. In particular, prove
`E₁'(w)=−w exp(w)`, `E₁'/E₁=−w/(1-w)` off `1`, and
`log ‖E₁(w)‖ ≤ 2‖w‖` everywhere, with Lean's convention `Real.log 0=0` at `w=1`.
The sharp deviation estimate above gives `‖E₁(w)−1‖≤‖w‖²` on the unit disk;
also supply `log ‖E₁(w)‖≤‖w‖²` there, using
`‖E₁(w)‖≤1+‖E₁(w)−1‖` and `log(1+t)≤t`, treating a zero factor separately.

Supply the following weighted-support specialization without choosing an enumeration.
Let `S⊂ℂ\{0}` be countable, meet each compact set in finitely many points, and carry
finite multiplicities `m:S→ℕ`. Zero multiplicities are allowed; for actual zero support
they are positive. If `Σ_(ρ:S) m(ρ)/‖ρ‖²<∞`, then

`P(z)=∏' (ρ:S), E₁(z/ρ)^(m(ρ))`

converges locally uniformly on ℂ, is entire, satisfies `P(0)=1`, and has analytic order
`m(ρ)` at each `ρ∈S` and zero order elsewhere. Its native meromorphic divisor has these
same values, cast to ℤ. Include empty and finite support.

Apply the countable-index primary-product theorem to `ι=Σ (ρ:S), Fin (m ρ)`,
`a(ρ,j)=ρ`, and constant `p=1`. Compact finiteness of S and finiteness of every `Fin (m ρ)`
give cofinite escape for a. For each `R>0`, summing over the finite fibers gives exactly
`Σ_(i:ι) (R/‖a i‖)² = R² Σ_(ρ:S) m(ρ)/‖ρ‖²`.
Prove the local-uniform product grouping identity between this repeated-index product
and the product of powers over S, including convergence at zeros; do not justify the
identity merely by manipulating totalized `tprod` values. Identify the zero fiber at ρ
with `Fin (m ρ)` and translate `analyticOrderAt` through the native
`AnalyticOnNhd.divisor_apply` formula. Thus equal multiplicities give equality of native
divisors, without a private zero-divisor carrier.

Expose a native-divisor form: for `D : Function.locallyFinsuppWithin Set.univ ℤ`
on ℂ, with `∀ z, 0≤D z`, `D 0=0`, and
`Σ_(ρ:D.support) (D ρ)/‖ρ‖²<∞` (real casts), construct the normalized entire product
with factors `E₁(z/ρ)^((D ρ).toNat)` and native divisor exactly D. Derive countability
and compact finiteness from D rather than asking the consumer to supply them.
The real cast agrees with the natural multiplicity because D is nonnegative.

ZerosOfLFunctions, Layer 5, a later roadmap,
consumes this genus-one specialization and the entire-logarithm theorem in GH3. Its
`E₁` is this roadmap's `E_p` at `p=1`. The L-function roadmap owns `OrderLE`, the
growth/counting and partial-summation argument giving weighted inverse-square
summability, the degree bound on the exponential factor in order-one Hadamard
factorization, and the L-function applications. For an entire f with `f(0)≠0`, take S to
be the support of `MeromorphicOn.divisor f Set.univ` and m its nonnegative values converted
to ℕ; the nonzero basepoint excludes 0 from S. This roadmap supplies the countable,
compact-finite support adapters from the native locally finite divisor and the resulting
product with exactly that divisor. No finite-order growth hypothesis is needed here,
and no dependency from this roadmap to ZerosOfLFunctions is introduced.

#### Variable exponents, genus, and logarithmic derivatives

For any escaping sequence, the universal choice `p_n=n−1`, indexed by n≥1, is admissible:
on each disk of radius R the tail has `R/|a_n|≤1/2`, hence its majorant is at most `2^(−n)`.
For constant p, define the genus of the repeated nonzero zero list to be the least p∈ℕ with
`Σ |a_n|^(−p−1)<∞`, and infinity if none exists; use genus zero for finite/empty lists.
Prove that this summability is equivalent to absolute locally uniform convergence of the
primary-factor deviations on compact disks for a fixed p. This is the unordered absolute
criterion; a product grouped in opposite pairs can converge even when its ungrouped
genus-zero criterion fails. The general factorization theorem permits variable p_n and
therefore imposes no finite-genus hypothesis.

For holomorphic factors f_i on open U, finite partial products P_s converging locally uniformly
to F, and an open V⊆U on which every factor and F are nonzero, prove locally uniform convergence
on compact subsets of V of
`logDeriv P_s = Σ_{i∈s} f'_i/f_i` to `F'/F`.
Use the unordered finite-subset filter when convergence is unordered, or the specified
partial-product sequence when an order is part of the data. Consume
`Complex.logDeriv_tendsto` from `Mathlib/Analysis/Complex/LocallyUniformLimit.lean` and
the finite-product rule with their exact derivative and nonvanishing hypotheses. An unpaired
series of principal parts receives no value from a paired-product identity.


#### Sharp finite-product majorant

For every finite set `s` and `u : ι → ℂ`, put `P_s=∏_(i∈s)(1+u_i)` and
`A_s=∏_(i∈s)(1+‖u_i‖) : ℝ`. Prove both inequalities

`‖P_s−1‖ ≤ A_s−1` and `A_s ≤ exp(Σ_(i∈s) ‖u_i‖)`.

The first is a separate sharp finite-induction target: the native
`Finset.norm_prod_one_add_sub_one_le` supplies the exponential consequence but does not
state this intermediate bound. For insertion of a fresh index, use
`P_(insert i s)−1=(P_s−1)(1+u_i)+u_i`, the triangle inequality,
`‖1+u_i‖≤1+‖u_i‖`, and `A_s≥1`. The second bound is not a new target: it is the pinned
`Real.prod_one_add_le_exp_sum` (`Mathlib/Analysis/Complex/Exponential.lean`) applied to the
nonnegative family `t_i=‖u_i‖`. Expose the combined bound `‖P_s−1‖≤exp(Σ_(i∈s)‖u_i‖)−1`
for consumers.
No factor is divided out: zero factors, `u_i=0`, and an empty index set are allowed;
for the empty set `P_s=A_s=1` and the sharp error is zero. These finite estimates precede
the arbitrary-set uniform-tail and holomorphic product targets below. They do not introduce
a logarithm of a vanishing factor or replace either sequential or unordered convergence.


#### Uniform-tail product criterion

For an arbitrary set X and functions `u_n : X → ℂ`, assume each u_n is bounded on X,
each series `Σ_n |u_n(x)|` converges, and these series have uniformly vanishing tails on X:
for every ε>0 there is N such
that `Σ_(n≥N) |u_n(x)|<ε` for every x∈X. Prove uniform convergence of the sequential
partial products `P_N(x)=∏_(n<N)(1+u_n(x))`, and that the limit vanishes at x exactly when
one factor vanishes. State empty-X and finite-factor cases. This criterion does not require
summability of `Σ_n sup_X |u_n|`. Identify the limit with the native pointwise
`∏' n, (1+u_n(x))` and prove `HasProdUniformlyOn` on X through the unordered
finite-subset filter, as well as convergence of the displayed sequential products.

Use boundedness of the finite head and a uniformly small absolute tail to obtain one bound
C for the full absolute sums. Finite product estimates give
`|P_M−P_N|≤exp(C)(exp(ε)−1)` uniformly once the tail is below ε. The relative estimate
`|P_M−P_N|≤|P_N|(exp(ε)−1)` gives a nonzero tail and the zero criterion. Reuse
`Finset.norm_prod_one_add_sub_one_le`, `multipliable_one_add_of_summable`, and
`tprod_one_add_ne_zero_of_summable` from `Analysis/SpecialFunctions/Log/Summable.lean`
for the finite estimate and pointwise product and nonvanishing conclusions; the new
interface supplies the uniform tail control.
For holomorphic u_n on open Ω, assume pointwise absolute summability and uniformly
vanishing absolute tails on every compact K⊆Ω. Apply the
criterion on compact neighborhoods, then use native local-uniform holomorphic closure.
Prove both the sequential partial-product conclusion and the unordered finite-subset-filter
conclusion `HasProdLocallyUniformlyOn`; the same absolute-tail estimate controls all omitted
finite subsets, so reordering does not change the limit. Prove the order identity
`analyticOrderAt F z = ∑' n, analyticOrderAt (fun w => 1+u_n w) z` in `ℕ∞` for z∈Ω,
including infinite order when a factor has zero germ. A sufficiently small uniform absolute
tail is a unit on a compact disk, leaving only finitely many factors carrying nonzero order.
When no factor vanishes identically on the component, these orders are finite and the
identity is a finite sum. Use native analytic order and its factorization characterization.
The stronger compact-sup-summability criterion is also a useful sufficient condition.

### GH0. Plane domains, compact hulls, and Runge approximation

Define the Ω-holomorphic hull of nonempty compact K⊆Ω by all z∈Ω satisfying
|g(z)|≤sup_(w∈K)|g(w)| for every g holomorphic on Ω; the empty set has empty
hull. Prove that it equals K together with every component of Ω∖K whose closure
is compact and contained in Ω. Prove compactness, idempotence and monotonicity,
and identify hull equality with absence of relatively compact complementary components.
For compact K⊆Ω and open Ω, prove equality of the extended set distances to the complement:
`(⨅ z∈K̂_Ω, ⨅ w∈Ωᶜ, edist z w) = (⨅ z∈K, ⨅ w∈Ωᶜ, edist z w)`.
Empty infima are ∞, covering K=∅ and Ω=ℂ. For nonempty K and nonempty complement,
deduce the ordinary distance equality to ∂Ω. Prove also `K̂_Ω⊆conv(K)`, using
`sup_{w∈K} ℓ(w)` for each continuous real-linear functional ℓ to separate points from the
ordinary convex hull; exponential holomorphic functions realize these real support bounds.
Own the filled compact exhaustion in its generic topological form. Let `E` be a real normed
space of finite dimension and `Ω ⊆ E` open. Construct compact `K_n ⊆ Ω` with
`K_n ⊆ int K_{n+1}`, `⋃ K_n = Ω`, every compact subset of `Ω` contained in some `K_n`, and
no connected component of `Ω∖K_n` whose closure is compact and contained in `Ω`. Take
`K_n` to be the points of norm at most n whose extended distance to `Ωᶜ` is at least `1/n`
(for `Ω = E` the distance to the empty complement is infinite, so `K_n` is the closed ball of
radius n; the real-valued distance to the empty set would be zero and must not be used).
No filling step is needed: a point x of `Ω∖K_n` either has distance less than `1/n` to some
y in `Ωᶜ`, and then the segment from x towards y stays in `Ω∖K_n` until its first point of
`Ωᶜ`, which lies in the closure of x's component; or it has `‖x‖>n`, and then the ray
`t ↦ (1+t)x` stays outside the ball of radius n, so x's component is unbounded or its
closure meets `Ωᶜ`. Prove compactness (closed and bounded in a proper space), nesting into
interiors, compact cofinality (a compact subset of `Ω` is bounded and has positive distance
to the closed set `Ωᶜ`), and the absence of relatively compact complementary components; empty
early stages are allowed. For `E = ℂ` this is the condition of `IsRungeCompactPair`, so every
`K_n` is a compact Runge set in `Ω`. The statement and proof use no holomorphy; the
filled-compact exhaustion of Hyperfunctions HF2.AnalyticPreparation is its instance
`E = ℂ^d ≅ ℝ^(2d)`, and Hyperfunctions already consumes GH0, so this roadmap is the one owner.

#### Holomorphic functions with compact-open convergence

For an open set `U : TopologicalSpace.Opens ℂ`, use Mathlib's native bundled analytic maps
`H(U) = ContMDiffMap (modelWithCornersSelf ℂ ℂ) (modelWithCornersSelf ℂ ℂ) U ℂ ω`
([native analytic-map bundle](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Geometry/Manifold/ContMDiffMap.lean)).
The complex charted-space and analytic-manifold structures on U are the native restrictions
of those on ℂ. The order is analytic `ω`. Equality is equality of functions on U.

Send such a map to its underlying native continuous map `ι : H(U) → C(U,ℂ)` and prove
injectivity. Equip H(U) with the uniformity induced by ι from native compact convergence on
`C(U,ℂ)`; its topology is compact-open. Install this as a scoped instance in the
function-space namespace, opened explicitly by consumers: the reducible analytic-map alias
must not install a global uniformity on all native `ContMDiffMap` users. Prove the precise range comparison:
`g ∈ range ι` iff the ambient representative
`g₀(z) = if hz : z∈U then g ⟨z,hz⟩ else 0` satisfies `DifferentiableOn ℂ g₀ U`.
Use the restricted complex charts, complex analyticity versus differentiability on open sets,
and agreement of representatives on U. Values outside U do not affect this condition.
Identify ι with a uniform embedding onto this closed subspace. This comparison connects
the manifold-map bundle with the existing ambient `DifferentiableOn` API; it is not an
additional definition of holomorphicity.

Use Mathlib’s native compact-convergence infrastructure:
`CompactExhaustion.hasAntitoneBasis_compactConvergenceUniformity` gives an entourage basis;
its countable-generation instance on a locally compact σ-compact source supplies
metrizability; and `ContinuousMap.tendsto_iff_tendstoLocallyUniformly` identifies convergence.
Construct the following explicit complete comparison metric for that same uniformity,
retaining it definitionally with `MetricSpace.replaceUniformity`. Scope the resulting
metric instance in the same `HolomorphicMapTopology` namespace as the induced uniformity;
keep the comparison distance on `C(U,ℂ)` as an explicit definition, without installing
a competing global metric instance on that native carrier. Use the elementary exhaustion,
for integers n≥1 and Ω the underlying set of U,

`K_n = {z : ℂ | ‖z‖ ≤ n ∧ Metric.infEDist z Ωᶜ ≥ ENNReal.ofReal (1/n)}`.

Prove compactness, `K_n ⊆ int K_(n+1)`, and cofinality among compact subsets of Ω.
For Ω=ℂ the extended distance to its empty complement is ∞; only the radius cutoff remains.
For Ω=∅ every K_n is empty and H(U) has one element. The metric construction uses no Runge
theorem and no normal-family theorem. Any cofinal nested compact exhaustion gives the same
uniformity, by the native compact-exhaustion basis theorem.

For continuous maps f,g on U put `s_n(f,g)=sup_(z∈K_n) |f(z)−g(z)|`, with value zero for
empty K_n, and define

`d_C(f,g)=Σ_(n≥1) 2^(−n) s_n(f,g)/(1+s_n(f,g))`.

Prove it is a metric on `C(U,ℂ)`, and restrict it through ι to d on H(U). Bound each term by
`2^(−n)`; use monotonicity and subadditivity of `t/(1+t)` for the triangle inequality and
cofinality for separation. Also compare with the metric using `min(1,s_n)`, via
`min(1,t)/2 ≤ t/(1+t) ≤ min(1,t)` for t≥0.

Prove equality of uniformities, rather than only a statement about convergent sequences.
A finite collection of compact-sup conditions is controlled by one K_N and the smallest
requested tolerance ε. The inequality `d_C(f,g)<2^(−N)ε/(1+ε)` implies those conditions.
Conversely, bound the geometric tail after N by ε/2 and the finite initial sum by ε/2 using
finitely many compact-sup conditions. Deduce that convergence and the Cauchy property are
exactly uniform convergence and uniform Cauchy convergence on every compact subset of U.
Prove the representative-level equivalence with `TendstoLocallyUniformlyOn` on the open
ambient set Ω, and independence from the exhaustion. For every compact K⊆Ω, restriction
to native `C(K,ℂ)` is uniformly continuous, using cofinality and the same quantitative bound.

For completeness, the open subtype U is locally compact Hausdorff and therefore compactly
coherent. Native `ContinuousMap.compactConvergenceUniformSpace` and its completeness theorem
make `C(U,ℂ)` complete. After the metric/uniformity comparison, prove that range ι is closed:
a convergent sequence of its continuous maps yields ambient representatives converging locally
uniformly on Ω, and `TendstoLocallyUniformlyOn.differentiableOn` preserves holomorphy there.
Use the range comparison to lift the limit to H(U). Thus the induced metric on H(U) is
complete. Establish the open-subtype/ambient local-uniform convergence adapter explicitly.

Reuse the native complex-algebra operations and constants on `ContMDiffMap` from
`Mathlib.Geometry.Manifold.Algebra.SmoothFunctions`; prove their continuity for the scoped
compact-convergence topology. Provide continuous point evaluation, restriction to smaller
open sets and compact subsets, and compatibility with the continuous-map and ambient
holomorphic APIs. Open-set restriction uses composition with the native smooth inclusion
(`contMDiff_inclusion`, `ContMDiffMap.comp`); reuse native restriction homomorphisms where
their codomain structure matches. Give the derivative map
and prove its compact-open continuity by the native locally uniform derivative theorem and
Cauchy estimates on compact neighborhoods. These are function-space results independent of
Montel; ConformalMapping L1 consumes this topology for its compactness criterion.


#### Neighborhood-holomorphic restrictions on a compact set

For compact K⊆ℂ, define O(K) as the complex subspace of native `C(K,ℂ)` consisting of
restrictions of functions holomorphic on some open neighborhood of K. Neighborhoods may depend
on the function. Prove the subspace laws by intersecting two neighborhoods, and express Runge
approximation as density of the restriction image of H(Ω) in O(K), with its inherited sup-norm
topology. Distinguish this space from functions merely holomorphic on the interior of K.

Prove by explicit examples that O(K) need not be open or closed in C(K,ℂ). For the closed
unit disk, small nonzero multiples of `conj z` tend to zero in norm but cannot extend
holomorphically across the disk, so O(K) is not open. The polynomial partial sums of
`Σ_(n≥0) z^n/(n+1)^2` converge uniformly on that disk to a continuous function. Its derivative
along the real radius tends to infinity as r→1: use nonnegative derivative coefficients,
their divergent sum at 1, and finite-head lower bounds as r increases to 1. A holomorphic
extension near the closed disk would have bounded derivative near 1, a contradiction.
Thus O(K) is not closed. These are counterexamples to a general open/closed assertion;
for finite K, O(K)=C(K,ℂ) by polynomial interpolation, including empty K.

#### Contour integration and compact-open closure

For finite piecewise-C¹ curves on compact parameter intervals [a,b] with a≤b, prove the integral estimate
`|∫_γ f−∫_γ g| ≤ sup_(trace γ)|f−g| · length(γ)` with `TauCeti.Contour`’s integral and
`length(γ)=∫|γ′|`, under the continuity/integrability hypotheses. Treat a=b as zero length and reverse orientation
by negation, retaining the same length bound. Derive continuity of integration
under uniform convergence on the trace, and the finite-cycle version by summing with the
cycle coefficients. Supply the rectangle/wedge-integral comparison to this contour API.
Also give a disk-Morera proof of compact-open holomorphic closure: rectangle and wedge
integrals pass to uniform limits as interval integrals, giving `IsConservativeOn`; apply
Mathlib’s `Complex.isConservativeOn_and_continuousOn_iff_isDifferentiableOn` directly. The function-space completeness theorem can directly
consume `TendstoLocallyUniformlyOn.differentiableOn`; the contour argument is a reusable
proof route and continuity result, rather than a second holomorphic-limit predicate.

#### Runge equivalences, pole pushing, and interpolation

Prove the universal Runge equivalence: for compact K⊆Ω, the property that every
function holomorphic on every open neighborhood U of K can be uniformly approximated
on K by functions holomorphic on Ω holds if and only if no component of Ω\K is
relatively compact in Ω. Quantify over U and f in this equivalence. For any individual
such f, the no-hole condition supplies approximants with error below each ε>0. Also expose the equivalent hull equality and
the point-separation criterion, with their directions stated. Specialize to polynomial
approximation on compact `K ⊂ ℂ` iff `ℂ \ K` is connected. Include the rational approximation
variant with a specified pole set meeting every component of the complement in the sphere.
Develop pole-pushing on nested compacta, rather than treating a picture or a single pole move as
the theorem. In the one-pole geometric-series step, assume `dist(a,K), dist(b,K) > 2δ` and
`|a−b|<δ`; then the expansion ratio is below `1/2`. For arbitrary `f∈H(ℂ\{a})`, first
truncate its Laurent series on a neighborhood of `K`, then push the finitely many pole terms. State
the uniform error on `K` and the finite chain hypotheses explicitly. Prove the finite-jet interpolation refinement: for a finite subset of K and
prescribed finite jet orders, the approximants may match the given neighborhood function’s
jets exactly while retaining arbitrary uniform approximation error on K. Build a finite
Hermite interpolation polynomial P matching those jets, using the Chinese remainder theorem
for the pairwise coprime powers `(X-a)^(m_a+1)`. Put `Q(z)=∏_a(z-a)^(m_a+1)`.
The quotient `(f-P)/Q` extends holomorphically at the marked points by the native analytic
order/factorization criterion. Apply scalar Runge to this extended quotient and set the
approximant to `P+Qg`. The error on K is bounded by `sup_K|Q|` times the quotient-approximation
error (use `max(1,sup_K|Q|)` to choose its tolerance). This preserves the jets even if K has
empty interior or a marked point lies on its boundary, without a later neighborhood lemma.

For the finite-chain pole-pushing construction on nonempty K, first choose `4δ₁<dist(w₀,K)` and
`w∈Θ∩B(w₀,δ₁)` when Θ is a connected component of Ω∖K and w₀∈closure Θ∖Ω. Join the initial
pole to w by a compact path in Θ, using openness and connectedness. Subdivide it with a
positive uniform separation from K, and finish with the straight segment from w to w₀ in
the K-free ball. Only separation from K is required of the final segment. For an unbounded
complementary component, move the pole to a sufficiently large point w in that component
and truncate its geometric expansion in z/w on K to obtain polynomials. This route handles
the unbounded component even when its closure contains no finite point of ℂ∖Ω; a finite excluded endpoint
is required only for the corresponding bounded-component construction.

Use the preparatory compact-support reconstruction and uniform Riemann-sum lemma under
their stated support hypotheses. Form finite sums of simple fractions, move poles across
complementary components using the geometric-series expansions, control errors uniformly on K,
and pass to hulls and an exhaustion. Prove the compactness and connected-component lemmas
used at each step, then derive the point-separation criterion with its precise quantifiers.

Also prove the finite-rank linear Runge operator used by GH5 and CKG K2. If K⊆Ω is compact
and Runge and U⊃K is open, choose a compact collar L⊂U∩Ω with K⊂int L. For every ε>0,
construct N<∞, points ζ₁,…,ζ_N∈int L, weights w_j∈ℂ and g_j∈H(Ω), all independent of
f, such that the fixed linear operator
`A_ε f(z)=Σ_{j=1}^N w_j f(ζ_j)g_j(z)` satisfies
`sup_K |f−A_ε f| ≤ ε sup_L |f|` for every f∈H(U). The proof must yield this operator-norm
bound, not just pointwise existence of an approximant: start with the fixed-cutoff Cauchy–Green
formula, approximate its kernel integral by Riemann sums on K, control the sample and quadrature
terms by Cauchy estimates using the collar L, and push each of the finitely many fixed kernel
poles to a function in H(Ω), with the accumulated error bounded by ε sup_L|f|. State the
support/collar choices that make all estimates uniform. The finite-rank form is essential: it
commutes with differentiation in external smooth parameters and preserves holomorphic dependence
on external complex parameters.

### GH1. Prescribed zeros and divisor realization on an open plane set

For a relatively closed discrete `E ⊆ Ω` and multiplicity `m : E → ℕ`, construct `f` holomorphic
on Ω with zero order exactly `m z` at every z in E and no other zeros, including the all-zero
multiplicity and empty-E cases. State the local order using the existing analytic/meromorphic
order APIs, including `AnalyticAt.analyticOrderAt_eq_natCast` and
`meromorphicOrderAt_eq_int_iff`; consume their order/factor characterizations with their exact
nonzero and unit hypotheses instead of reproving them here. Use the native locally-finite divisor
carrier when its hypotheses match; do not introduce a parallel closed-discrete predicate.

Extend to integer divisors `ν : E → ℤ`: produce a meromorphic function with order `ν z` at each
z in E and order zero outside E, and require `meromorphicOrderAt f z ≠ ⊤` at every z∈Ω. This
excludes identically-zero components and makes the divisor statement meaningful. For every native
`MeromorphicOn F Ω`, construct holomorphic f,g with
`∀ᶠ z in codiscreteWithin Ω, g z ≠ 0 ∧ F z = f z / g z`.
This is equality off a relatively closed discrete exceptional set, equivalently equality of the
meromorphic germs; arbitrary total-function values at exceptional points are not constrained.
Require g not identically zero on each nonempty connected component of Ω, including components
on which F has zero germ. State componentwise behavior when Ω is disconnected. The quotient statement is a consequence of
positive and negative parts of the divisor and the two realization theorems; it is not the
finite-support `extract_zeros_poles` result.

First prove zero-free Runge approximation: if K is Runge in Ω and u is holomorphic and
nowhere zero on a neighborhood of K, approximate u uniformly on K by a function holomorphic
and nowhere zero on all of Ω. Prove the winding-class extension needed for this result;
ordinary scalar Runge approximation only controls zeros near K. If Ω is disconnected, carry the
construction on all its components together: use one finite dual-cycle family over V and the
simultaneous correction below, not separate componentwise period systems. Prove a concrete
Runge-neighborhood construction. Fix a square grid and a dyadic mesh sequence δ_n=2^(−n)δ₀;
let L_n be the finite union of closed squares of mesh δ_n meeting K. For small δ₀, prove
K⊂int L_n⊂L_n⊂U∩Ω. The fixed-grid refinement gives L_(n+1)⊂L_n. Prove the hulls
H_n=(L_n)^_Ω (the Ω-holomorphic hull of L_n) are nested compacta and their intersection is K: for each holomorphic g,
continuity and L_n shrinking to K give sup_(L_n)|g|→sup_K|g|, while K is Runge. Hence for
every open N⊃K some H_n⊂N; otherwise nested compactness would give a point of
(⋂H_n)\N. Choose such n with H_n⊂U∩Ω and set V=int H_n. The hull H_n is compact and
Runge. Prove V is relatively compact and finite-connectivity, `closure V=H_n` for this finite
square-cell construction (or give the exact replacement compact Runge neighborhood with the same
hull), and every bounded component of ℂ\V meets ℂ\Ω. The proof must establish finite
polygonal boundary and local finiteness for this square construction; do not assume arbitrary
regular cells are affine convex cells.
For each bounded connected component B_k of ℂ\V choose a point a_k∈B_k\Ω. Prove the
finite dual-grid-boundary lemma: construct a cycle σ_k : `TauCeti.Contour.Cycle` whose finitely
many closed piecewise-C¹ terms lie in V and for which
`Cycle.IsIn σ_k V` and `Cycle.windingNumber a_l σ_k=δ_kl` for all bounded complementary
components B_l. The cycle terms may lie on several connected components of V. Build them from
finite oriented grid boundaries pushed into V; prove the boundary winding and disjoint-component
properties for this actual finite polyhedral construction. Do not postulate an abstract H₁(V;ℤ)
carrier or a basis theorem.
For a holomorphic nowhere-zero u on a neighborhood of V, define
`w_k=(2πi)⁻¹ Cycle.integral (u′/u) σ_k`. Define the finite image cycle u_*σ_k by composing
its supported curve generators with u; prove those compositions remain closed piecewise-C¹, and
prove the chain-rule identity between this integral and `2πi` times the winding of u_*σ_k about
0. Since 0 is outside its trace, `exists_int_windingNumber_of_not_mem_trace` makes w_k an integer.
Use the native `PiecewiseC1ClosedCurve.of`, its raw-curve integral comparison, and `Cycle`'s
additive integral/winding API; introduce only the needed finite composition and chain-rule adapter. For any finite cycle γ with `Cycle.IsIn γ V`, choose integers n_k(γ) satisfying
`(n_k(γ):ℂ)=Cycle.windingNumber a_k γ`. Prove
`Cycle.IsNullHomologous (γ−Σ_k n_k(γ) • σ_k) V`: at points outside V, winding is locally
constant on each complementary component; it is zero on the unbounded component, while on B_l
the subtracted cycle has winding `Cycle.windingNumber a_l γ−(n_l(γ):ℂ)=0`. Thus
`homologyCauchyTheorem` gives
`Cycle.integral (u′/u) γ = Σ_k n_k(γ) • Cycle.integral (u′/u) σ_k
=2πiΣ_k (n_k(γ):ℂ)w_k`, with no homology-group abstraction.
Set the exponents to these w_k and define the single rational function
`R(z)=∏_k(z−a_k)^{w_k}` on all Ω (empty product 1 when there are no bounded complementary
components). Every pole lies at a_k∉Ω, so R is holomorphic and nowhere zero on Ω. The
logarithmic-derivative period of R on σ_k is 2πi w_k. The null-homology identity above therefore
shows that `(u/R)′/(u/R)` has zero integral on every closed piecewise-C¹ cycle in V. Apply the
native exactness criterion and primitive-to-logarithm theorem on each component of V; the
componentwise logarithms together form one element of H(V), even when V is disconnected.
Approximate that function by the finite-rank GH0 operator/Runge theorem and exponentiate. The
boundary-cycle construction and its winding-decomposition identity are the explicit planar
prerequisites; scalar Runge approximation alone does not supply them.
Choose a nested Runge compact exhaustion of Ω. Each stage meets the relatively closed
discrete divisor in a finite set. Form finite divisor products over E∩K_n and their shell
ratios; approximate each inverse shell ratio on K_n by the globally nowhere-zero functions
just constructed, with error small enough that the corrected shell factor differs from 1
by at most 2^(−n). Prove compatibility of the resulting expressions on overlapping compacta,
locally uniform convergence of the tail products, nonvanishing away from the marked points,
and the exact local integer order at each marked point. Handle finitely many early factors
and negative divisor orders separately. Expose these estimates and the zero-free
approximation theorem as reusable API, rather than assuming a divisor theorem as a premise.
Also give a direct arbitrary-Ω divisor construction independent of zero-free Runge. Work
componentwise. For proper Ω split the marked points into E_b={a∈E: dist(a,ℂ\Ω)<1} and
E_∞={a∈E: dist(a,ℂ\Ω)≥1}; isolate any finite exceptional points and zero. The E_∞ points
escape every bounded set, so consume the preparatory primary-product existence/zero-divisor lemma for
their repeated list. For each a∈E_b choose b_a∈ℂ\Ω with
`|a−b_a|<2 dist(a,ℂ\Ω)` and put `w_a(z)=(b_a−a)/(z−b_a)`. On every compact K⊂Ω,
`w_a→0` along the E_b list: a bounded subsequence of E_b can accumulate only at ∂Ω, where
its distance to ℂ\Ω tends to zero, while an unbounded subsequence has |b_a|≥|a|−2 and
|w_a|=O_K(|a|⁻¹). For `p≥0` define `B_p(w)=(1+w) exp(Σ_{k=1}^p (−1)^k w^k/k)`; record the identity
`B_p(w)=E_p(−w)` for the previously defined primary factor, not a second family of factors.
It has one simple zero at w=−1. For |w|≤1, consume the sharp preparatory estimate
`|B_p(w)−1|≤|w|^(p+1)`. Raise it to the prescribed multiplicity and choose p_a by a
diagonal compact exhaustion so the deviations are summable on
each compact. Finite exceptional factors are retained separately. These factors are holomorphic on
Ω (their only possible singularity is at b_a∉Ω), have exactly the prescribed zeros, and the locally uniform
product is nonzero off E; prove exact orders at E and nonvanishing of the tail product. When
Ω=ℂ, use the preparatory product theorem for the whole sequence. Both divisor constructions
consume only earlier preparatory results and GH0; the later full factorization theorem
does not supply a prerequisite to this milestone.

#### Boundary zeros and domains of holomorphy

For every open Ω construct a holomorphic f on Ω with no meromorphic continuation through
any local boundary germ. Precisely, for every ξ∈∂Ω, disk D centered at ξ and connected component
C of D∩Ω with ξ∈closure C, no meromorphic function on D agrees with f on C.

Use a compact exhaustion `K_n⊂int K_(n+1)` with union Ω. Cover K₁ and each compact shell
`K_n\int K_(n−1)` by finitely many open disks with closure in Ω and radii less than 1/n.
For n≥3 choose all disks in that shell disjoint from K_(n−2); prove this is possible because
K_(n−2) lies in the interior of K_(n−1). Choose a distinct point in each disk, avoiding the
finitely many earlier choices. The set E of all chosen points is relatively closed discrete:
any compact in Ω lies in some K_N and all disks from shells n≥N+2 avoid it.

To verify accumulation within each local branch, fix ξ,D,C as above and choose x_j∈C tending
to ξ. Choose a covering disk for each x_j in its earliest exhaustion shell. The shell indices
tend to infinity because every K_N is compact inside Ω. Their radii tend to zero; eventually
the disks lie in D, and their connectedness, containment in Ω and intersection with C put
them wholly in C. The chosen points therefore lie in C and tend to ξ. Each fixed covering
disk has closure inside Ω, so a subsequence uses distinct disks and hence distinct points.
The prescribed-zero theorem supplies f with exact zero set E and no other zeros. A meromorphic extension on D would
have zeros accumulating at its interior point ξ; remove any possible pole at ξ and apply the
analytic identity theorem to conclude that the extension is zero. This contradicts the nonzero
values of f on the nonempty open set C\E. Include Ω empty and boundary empty as vacuous
boundary cases. Derive the arbitrary-disk statement for every component: if D meets Ω but is not
contained in Ω, fix any component C of D∩Ω, choose z∈C and w∈D\Ω, and follow the segment
from z to w. Convexity of D keeps the segment in D. Its first exit ξ from Ω lies in D∩∂Ω, and
the initial segment stays in C. A sufficiently short tail before ξ lies in one component of a
centered disk about ξ, still contained in C, whose closure contains ξ. Any meromorphic extension
on D agreeing on C (or agreeing near z, by the identity theorem on C) would contradict the
centered boundary-germ result on that local component. For an interior germ
`g∈M(D_r(z))` agreeing with f near `z∈Ω`, if the disk were not contained in Ω, follow a segment
from z to a point of `D_r(z)\Ω` and take its first exit. The component containing z accumulates
at that boundary point, contradicting the centered result. Thus `D_r(z)⊆Ω`. State that the identity
principle is applied on the connected component containing the initial agreement neighborhood.

##### A simpler whole-overlap zero-set construction

As an alternative explicit zero-set construction for the whole-overlap consequence,
for every open Ω construct one holomorphic f on Ω admitting no
holomorphic extension to any ball centered at any boundary point: for every a∈∂Ω and r>0
there is no holomorphic F on B(a,r) agreeing with f on all of B(a,r)∩Ω. No connectedness
assumption on Ω is needed; the ball claim is vacuous for Ω=∅ and Ω=ℂ. For nonempty Ω,
also prove that for every connected open V strictly containing Ω
there is no holomorphic F on V whose restriction is f. Connectedness of V is essential:
an unrelated disjoint open component can otherwise be added. The nonempty hypothesis belongs
to this larger-domain claim. For Ω=ℂ there is no strict larger plane domain.

For nonempty proper Ω use GH1's prescribed-zero theorem with multiplicity one. Choose a countable dense sequence
`a_j` in the nonempty boundary, allowing repetitions. For n≥1 and j≤n choose pairwise distinct
`z_(n,j) ∈ Ω∩B(a_j,1/n) \ D_n`, using exactly the `infEDist` distance exhaustion
defined in GH0 (holomorphic functions with compact-open convergence), here renamed D_n. The intersection with
the ball is infinite, and every point of D_n has distance at least 1/n from a_j∈Ωᶜ.
Let E be the set of these points. Every D_m meets only finitely many levels n<m, so E is
relatively closed and discrete in Ω. For each fixed j the chosen points converge to a_j;
closedness then gives ∂Ω⊆closure E. The exact-zero function is not identically zero on any
nonempty open component, since a relatively discrete set cannot contain an open subset.

A ball extension would have zeros accumulating at its center and hence vanish on the whole
ball by the identity theorem, contradicting agreement with f off E in the overlap. For a
connected larger V, Ω is a nonempty proper relatively open subset of V, so its relative
boundary in V is nonempty. Choose a∈∂Ω∩V; zeros from E accumulate at a inside V, so the
identity theorem makes F vanish on V, again a contradiction. This argument uses the global
set E; it does not require E to accumulate through every individual component of Ω.

This dense-boundary construction gives an alternative direct proof of the whole-overlap
and connected-larger-domain consequences of the stronger theorem. It does not establish accumulation through every local component; the
shell-cover construction above supplies the stronger meromorphic branchwise theorem.


### GH2. Mittag–Leffler principal parts on arbitrary plane domains

For a relatively closed discrete set E in Ω and a finite principal part `p_a(w) =
Σ_(k=1..N_a) c_(a,k) (w−a)^(−k)` at every a ∈ E, construct meromorphic f on Ω having exactly
those principal parts and no other poles. Prove uniqueness modulo addition of a holomorphic
function and natural restriction/translation/scaling rules. Also prove the general isolated-singularity
version: for each a∈E let U_a be an open neighborhood of a and φ_a holomorphic on U_a\{a}. Construct f holomorphic
on Ω\E such that f−φ_a has a holomorphic extension near a. This includes essential
singularities; the finite-principal-part meromorphic theorem is its pole-only
specialization. State equality of singular germs modulo holomorphic germs, uniqueness
modulo a holomorphic function on Ω, and restriction compatibility. Build the local
Laurent decomposition into its holomorphic part and punctured negative part, allowing
an infinite negative Laurent series in the general theorem.

Proof route: first prove that the negative Laurent part of a germ holomorphic on
a punctured disk converges on the whole punctured plane, giving a global singular
representative for each isolated singularity, including essential ones. Order the
closed discrete data in finite batches along the Runge exhaustion. Approximate each
batch's singular representatives on the preceding compact by functions holomorphic
on Ω and subtract those approximants. Enforce summable errors on preceding compacta;
prove locally uniform convergence away from E and holomorphic extension of the
difference at each marked point. Prove Laurent-coefficient extraction and the
finite-principal-part specialization.

### GH3. Entire products and full Weierstrass factorization

Consume the preparatory primary-product existence and exact-order theorem under its stated
convergence hypotheses.

Supply the reusable equal-divisor quotient theorem: if f and F are entire, neither is
identically zero, and their native divisors on ℂ agree, then `f=exp(g) F` for some entire g.
Construct the removable extension q of f/F, prove `f=qF` everywhere and that q never
vanishes, then apply the entire-logarithm theorem. Nontriviality of both functions is
essential: the native divisor of the identically zero function is zero and cannot
distinguish it from a nonvanishing entire function. This theorem applies in particular
to the genus-one product and the original function with the same divisor.

For every nonzero entire f with zero order m at 0 and nonzero zeros listed with multiplicity,
prove `f(z)=z^m exp(g(z)) ∏ E_{p_n}(z/a_n)` for an admissible sequence p_n and entire g. Prove
that the zero-free quotient extends through its removable singularities, then consume the native
contour primitive-to-logarithm API on ℂ to obtain its entire logarithm and exponential factor. State nonuniqueness under
choice of p_n; for a fixed product and fixed f, two possible logarithms g differ by
2πik with k∈ℤ, constant on ℂ. The product and factorization theorems allow a variable sequence of primary-factor
genera and impose no finite-order hypothesis on the entire function.

### GH4. Products, approximation, and contour examples

The following formulas and examples are explicit targets with the stated convergence hypotheses.

#### Sine, cosine, cotangent, and shifted sine

Prove
`sin(πz) = πz ∏_(n≥1) (1 − z²/n²)` and `cos(πz) = ∏_(n≥1) (1 − 4z²/(2n−1)²)`.
The respective simple zero sets are `ℤ` and `ℤ+1/2`. On `ℂ\ℤ`, derive from compact-uniform
product convergence
`π cot(πz) = z⁻¹ + Σ_(n≥1) 2z/(z² − n²)`,
where `n` and `-n` terms are paired. The paired series converges locally uniformly away from
`ℤ`. Its residue at each integer is `1`. The half-integer shift gives `-π tan(πz)` with
simple poles of residue `1` at `ℤ+1/2`; state its symmetric pairing and local-uniform domain.
Also prove the one-sided genus-one product
`∏_{n≥1}(1+z/n)e^{-z/n}`: it converges locally uniformly and its zeros are exactly the negative
integers. Also prove the all-z identity
`(Complex.Gamma z)⁻¹ = z exp(γz)∏_{n≥1}(1+z/n)e^{-z/n}`, where γ is
`Real.eulerMascheroniConstant`, using the totalized native reciprocal at poles. The product is
entire with simple zeros exactly at the nonpositive integers and agrees with native reciprocal
Gamma on its regular locus. State pole exclusions when using native Gamma or digamma.
Reuse `Complex.tendsto_euler_sin_prod` in `EulerSineProd.lean`; the cotangent series theorem is
root-namespaced `cot_series_rep` in `Cotangent.lean`, not `Complex.cot_series_rep`. The compact-uniform
product convergence is already supplied by `HasProdLocallyUniformlyOn_euler_sin_prod` and
`multipliableUniformlyOn_euler_sin_prod_on_compact`; consume these with their stated compact and
zero-exclusion hypotheses, and derive the cosine product from `sin(2πz)=2sin(πz)cos(πz)` by splitting even and odd factors in finite products, passing to the locally uniform limit, and checking the constant at zero. For reciprocal Gamma,
pass from the native Gamma sequence to the normalized product using the harmonic/logarithmic
limit defining `Real.eulerMascheroniConstant`; identify the entire product with the totalized native
reciprocal Gamma, including its zeros at the poles.

For `α∈ℂ\ℤ`, put `a_n=n-α` and choose a fixed enumeration of `ℤ`. Since
`Σ |a_n|^{-2}<∞`,
`P_α(z) = ∏_(n∈ℤ) E₁(z/a_n)`
converges locally uniformly and has exactly the simple zeros `a_n`. The quotient
`sin(π(z+α))/P_α(z)` is zero-free entire, so define its entire logarithm `g_α` and obtain
`sin(π(z+α))=e^{g_α(z)}P_α(z)` and `e^{g_α(0)}=sin(πα)`. On compacta avoiding the shifted lattice,
`π cot(π(z+α)) = g'_α(z) + Σ_(n∈ℤ) ((z+n+α)⁻¹ − (n+α)⁻¹)`.
The difference summands are `O(|n|^{-2})`, hence absolutely and locally uniformly summable.
An unpaired series of simple principal parts is not assigned a value; any such expansion must
specify symmetric partial sums. Determine the scalar and linear exponential explicitly:
`sin(π(z+α)) = sin(πα) exp(πz cot(πα)) ∏_(n∈ℤ) (1 + z/(n+α)) exp(−z/(n+α))`.
The bilateral genus-one product converges independently of enumeration because its tail
factor deviations are bounded on each compact by a constant times `|n+α|⁻²`.
Reindex by `n↦−n` to identify it with `P_α`; prove ordering independence from absolute
local-uniform convergence. Subtract the symmetrically paired cotangent
expansions at `z+α` and `α`; their difference is the absolutely convergent series displayed
above. It follows that `g'_α=π cot(πα)` away from the zeros, hence everywhere by analytic
continuation. Evaluation at zero supplies `e^{g_α(0)}=sin(πα)` and gives the formula without
choosing a branch of the logarithm of that nonzero constant.

For reciprocal Gamma, consume `Complex.GammaSeq_tendsto_Gamma`,
`Complex.Gamma_mul_Gamma_one_sub`, and the `Complex.digamma` recurrence/reflection API in
Mathlib's `Gamma/Beta.lean` and `Gamma/Digamma.lean`. Name the harmonic/logarithmic limit
`Real.tendsto_harmonic_sub_log` from `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean`. State pole exclusions when taking
logarithmic derivatives. These native special-function facts do not replace the sine-product
proof or global product API.

#### Independent paired-cotangent strip proof

Develop this second proof of the paired cotangent identity alongside the preceding
product/logarithmic-derivative proof. It does not consume that identity, the sine product,
or native `cot_series_rep` as a premise. Write
`U=ℂ\{(k:ℂ) | k∈ℤ}`,
`q_N(z)=Σ_(k=−N)^N (z−k)⁻¹`, and
`q(z)=z⁻¹+Σ_(n≥1)((z−n)⁻¹+(z+n)⁻¹)`.
The infinite sum is specifically this paired series, not an unpaired bilateral sum.

First prove local uniform convergence of `q_N` to q on U using
`(z−n)⁻¹+(z+n)⁻¹=2z/(z²−n²)` and compact-dependent `O(n⁻²)` bounds.
Give the finite truncation/pairing comparison, holomorphy on U, and the residue-one
local decomposition at each integer. Derive periodicity directly from the finite identity

`q_N(z+1)−q_N(z)=(z+N+1)⁻¹−(z−N)⁻¹`.

Its two boundary terms converge locally uniformly to zero away from the indicated poles;
thus `q(z+1)=q(z)` on U. Put `c(z)=π cos(πz)/sin(πz)`. Prove its regular locus and
residue-one decompositions using elementary sine/cosine differentiation and their integer
zeros. Cancel the principal parts to construct an actual entire function F satisfying
`F=c−q` on U, with its values at the integers obtained by removable extension. Do not
assign zero arbitrarily at the poles. Prove uniqueness and one-periodicity of this extension.

Prove uniform bounds on the full closed fundamental strip `|Re z|≤1/2`, rather than
only at `z=iy`. For `|Im z|≥1` and n≥1,

`‖2z/(z²−n²)‖ ≤ 3|Im z|/((n−1/2)²+(Im z)²)`.

The decreasing-function integral comparison gives
`Σ_(n≥1) |y|/((n−1/2)²+y²) ≤ 1+π/2` for `|y|≥1`.
Together with `‖1/z‖≤1`, this bounds q by `4+3π/2` on those two strip tails.
Use the exponential formula for cotangent to bound c there by
`π(1+exp(−2π))/(1−exp(−2π))`. On the remaining compact rectangle
`|Re z|≤1/2`, `|Im z|≤1`, use continuity of the entire extension F, including the
removed pole at zero. Periodicity moves every complex number into this strip, so F is
globally bounded. Consume native Liouville only after this bound, giving F constant.

Determine the constant without invoking the desired cotangent series. For real `y>0`, prove

`q(iy)=−i(1/y+2 S_y)`, where
`S_y=(1/y) Σ_(n≥1) 1/(1+(n/y)²)`.

Construct the improper-Riemann comparison from finite upper and lower rectangular sums
for the decreasing function `t↦1/(1+t²)` on `[0,R]`. Prove the improper integral is π/2
using the arctangent derivative and limit; control the infinite tail by
`∫_R^∞ 1/(1+t²) dt ≤ 1/R` for `R>0`. Pass from finite sums to the summable infinite
series, obtaining the explicit all-`y>0` estimate
`0≤π/2−S_y≤1/y`. Hence `q(iy)→−πi`. Independently the exponential formula gives
`c(iy)→−πi`, so the constant F is zero. Conclude `c=q` on U, and compare this independently
constructed proof with the existing native theorem afterwards. The zero value `y=0` is
excluded from the Riemann/vertical-limit claims; integers are excluded from the final identity.
No absolute convergence of `Σ_(k∈ℤ)(z−k)⁻¹` is claimed. This alternative does not remove
the existing sine/cosine/Gamma/shifted-product or contour examples.


#### Theta, hyperbolic sine, divisors, and ratio products

For real `0<r<1`, define
`H_r(z) = ∏_(n≥1) (1 + r^(2n−1) e^z)(1 + r^(2n−1) e^(−z))`.
On each compact `K⊆D_R`, the sum of factor deviations is bounded by
`2 e^R Σ r^(2n-1)+Σ r^(4n-2)<∞`; hence the product is entire. Reindex finite partial products,
then take compact-uniform limits, to prove
`H_r(z+2 log r)=r^{-1}e^{-z}H_r(z)`. Here `log r` is the real logarithm; do not assert this
formula for arbitrary complex `r`. Include the finite-product proof without cancellation at a
possible zero. The hyperbolic sine identity is
`sinh(πz) = πz ∏_(n≥1) (1 + z²/n²)`,
proved by `sin(iw)=i sinh(w)` from the sine product.

Product instances must include their actual reciprocal-power checks. For the integer lattice
minus zero use genus one and `Σ_{n≠0}|n|^{-2}<∞`; for half-integers use genus one and pair
opposite roots. For `a_n=log n`, `n≥2`, every integer choice `p_n≥n` is admissible, including strict choices
at any or all indices. For fixed `R`, choose N with `q=R/log N<1`; for n≥N the actual factor
bound is `(R/log n)^{p_n+1}≤q^{p_n+1}≤q^{n+1}`. This gives a summable geometric tail;
handle the finite initial factors separately. For
`z∏_{n≥1}E_{n-1}(z/log(n+1))`, isolate `n=1` and use exponent `p_n+1=n`. For
`Λ=(ℤ+iℤ)\{0}`, order finite products by radius and use genus two. Unit squares around lattice
points in the `k`th unit annulus lie in an annulus of fixed enlarged width, so the shell count is
`O(k)` and `Σ_{λ∈Λ}|λ|^{-3}<∞`. This proves the full-lattice product, independent of ordering and grouping.

For the square lattice use the explicit Manhattan-shell enumeration:
`z ∏_(N≥1) ∏_(m,n∈ℤ, |m|+|n|=N) E₂(z/(n+im))`, where `E₂(w) = (1−w) exp(w + w²/2)`.
For `Λ=ℤ+iℤ`, this has simple zero set all of `Λ`, including zero. Each shell has `4N` points and `|n+im|≥N/√2`. On `|z|≤R`, the sharp preparatory estimate `|E₂(w)−1|≤|w|³` for `|w|≤1` bounds each sufficiently large shell's total deviation by `4N(√2R/N)^3`. The shell bounds are summable, so the product converges compact-uniformly and independently of ordering. Consume the preparatory estimate `|1−E_p(w)|≤|w|^{p+1}` for `|w|≤1` and the proved
admissibility of `p_n=n−1` for every escaping sequence; do not repeat that proof here. State the
genus criterion and logarithmic-derivative theorem from the preparatory product layer,
including nonvanishing of both factors and limit and compact avoidance of every zero.
A concrete sparse illustration is `a_n=2^n`: its genus-zero product
`∏_{n≥1}(1-z/2^n)` converges locally uniformly since on `|z|≤R` the tail sum of factor
deviations is `Σ_{n≥N}R/2^n=R·2^(1-N)`, which tends to zero as `N→∞`. This is an additional
example; each separately specified sequence requires its own convergence estimate.

For sequences `a_n,b_n` with `Σ|a_n-b_n|<∞`, the ratio product
`∏_(n≥1) (z−a_n)/(z−b_n) = ∏_(n≥1) (1 + (b_n−a_n)/(z−b_n))`
converges locally uniformly on `ℂ \ closure{b_n : n≥1}`; on each compact set disjoint from the pole
closure the denominators have a positive lower bound, and the perturbations are summable. State the
summability premise separately from pole-set separation, and handle removable numerator/pole
coincidences by cancellation. For `a_n=2/n²`, `b_n=1/n²`, no numerator zero cancels a pole, since
`2/m²=1/n²` would imply `m²=2n²`. Each pole is genuine: after removing its factor the remaining product converges to a nonzero
value near that pole. The pole closure `{1/n²:n≥1}∪{0}` therefore gives the maximal open
holomorphy domain for this example, including exclusion of continuation across the accumulation
point 0 by its nearby genuine poles.

#### Polynomial and rational approximation examples

For the crescent `Ω={z∈ℂ: |z|<1 and |2z−1|>1}`, prove compact-open polynomial density in
`H(Ω)` and the failure of global uniform approximation for all holomorphic functions.
Its complement is the union of the closed exterior of the unit disk and the closed disk
`{|2z−1|≤1}`; these meet at `1`, so the complement is connected. The polar description
`0<θ<2π`, `max(0,cos θ)<r<1` identifies Ω with an open rectangle and proves connectedness.
Take a compact exhaustion and fill its bounded complementary components. Prove that each
filled compact stays in Ω: the connected set `ℂ\Ω` meets the unbounded complementary
component and therefore lies wholly in it. Arrange nested interiors and connected compact
complements, then use GH0 polynomial Runge and diagonal approximation. For the separate
global-sup assertion use `f(z)=1/z`. Every `−t`, `0<t<1`, lies in Ω and `|f(−t)|=1/t`.
Every polynomial is bounded on the unit disk, so every `p−f` is unbounded on Ω. Continuity
on this open set also gives infinite essential supremum. Thus no sequence of polynomials
has global `L∞(Ω)` error tending to zero, despite the compact-open density. As a second
boundary-pole witness on this same crescent, take `f(z)=1/(z+1)` and `z_t=-1+t` for
`0<t<1`. Then `|z_t|=1-t<1` and `|2z_t-1|=3-2t>1`, so `z_t∈Ω` and
`|f(z_t)|=1/t→∞`. Every polynomial remains bounded on the unit disk, hence its uniform
error against this second witness is infinite as well.

Apply GH0’s compact-support Cauchy/Pompeiu identity, uniform Riemann-sum lemma,
finite-chain pole-pushing and rational pole-set theorem to these approximation examples.
Use their stated compact separation, error bounds and sphere-complement pole-set hypotheses.

#### Full-boundary Cauchy–Pompeiu formula

Give piecewise-`C¹` Jordan parametrizations `γ₀,…,γₘ`, with `m<∞`, and write `Dⱼ` for the
bounded Jordan component enclosed by the image of `γⱼ`. Require the closed hole interiors
`closure(Dⱼ)` (`1≤j≤m`) to be pairwise disjoint and contained in `D₀`; define
`Δ := D₀ \ ⋃_{j=1}^m closure(Dⱼ)`. Thus `Δ` is the bounded finitely connected region with outer
boundary `γ₀` and hole boundaries `γ₁,…,γₘ`. Parameterize every `γⱼ` counterclockwise around its
own bounded component. Define the oriented boundary cycle by
`C_Δ := [γ₀] − Σ_{j=1}^m [γⱼ]` in the existing free-abelian `TauCeti.Contour.Cycle`; this is the
same orientation as the outer curve counterclockwise and each hole curve clockwise. Here `[γ]`
denotes the native cycle generator bundled from its closed piecewise-`C¹` parameterization.

Prove the region-boundary adapter: `trace(C_Δ)=∂Δ`, `n_{C_Δ}=1` on `Δ`, and
`n_{C_Δ}=0` on `ℂ\closure(Δ)`. Use ConformalMapping L5 for the single-Jordan separation and
filled-hull topology. GH4 must also prove the orientation-to-winding statement for the chosen
counterclockwise parameterizations and assemble the finitely many disjoint hole indices; L5 alone
does not state that winding conclusion. Suppose `Ω` is open, `closure(Δ)⊆Ω`, `f : ℂ → ℂ` is
`C¹` on `Ω` as a real map, and `ξ∈Δ`. The formal theorem target is the area-integral identity

`f(ξ) = (2πi)⁻¹ ∫_(C_Δ) f(z)/(z−ξ) dz − π⁻¹ ∫_Δ ∂̄f(z)/(z−ξ) dA(z)`.

Here `dA` is positive planar Lebesgue measure. Record the source's equivalent plus-wedge display
as the coefficient identity `dz∧dz̄=−2i dA` in the positive basis `(1,i)`; do not introduce
an independent integral of a 2-form. Use `Cycle.integral` for the boundary term and Bochner area
integration; prove integrability from boundedness of `∂̄f` on `closure(Δ)` and local integrability
of `z↦‖z−ξ‖⁻¹` in two dimensions.

For sufficiently small `ε>0` with `B̄_ε(ξ)⊆Δ`, let `S_ε` be the positively oriented circle cycle
and set `C_ε=C_Δ−S_ε`, `U_ε=Ω\B̄_{ε/2}(ξ)`, and `F(z)=f(z)/(z−ξ)` on `U_ε`. Prove `C_ε` has
trace in `U_ε` and its total winding number vanishes on `ℂ\U_ε`: outside `Ω`, both component
indices vanish; on `B̄_{ε/2}(ξ)`, the domain-boundary and circle indices are both `1` and cancel.
On `U_ε` off the traces, its index equals `1` on `Δ\B̄_ε(ξ)` and `0` elsewhere. On `U_ε`,
`∂̄F=(∂̄f)/(z−ξ)` by the real `C¹` product rule and `∂̄((z−ξ)⁻¹)=0`. Apply
DifferentialGeometry 5.6.3's finite integer-weighted-cycle Green identity to the two real forms
associated to `F dz`: for `F=u+iv`, use `u dx−v dy` and `v dx+u dy`. Add the explicit local
coordinate comparison target: on each native cycle generator,
`(F∘γ)·γ′=(u∘γ)x′−(v∘γ)y′+i((v∘γ)x′+(u∘γ)y′)`; extend by finite integer additivity. This
identifies the real and imaginary parts of `Cycle.integral F` with the two finite real circulation
integrals, without introducing a second cycle or contour-integral carrier. The two curls are
`−vₓ−uᵧ=−2 Im(∂̄F)` and `uₓ−vᵧ=2 Re(∂̄F)`, so their identities combine to
`∮_{C_ε}F dz=2i∫_{Δ\B̄_ε(ξ)}∂̄F dA`; traces are area-null. This gives the punctured
Cauchy–Pompeiu identity. As `ε↓0`, the counterclockwise circle integral of `F dz` tends to
`2πi f(ξ)`, and the exact error estimate is
`|∮_{S_ε}F dz−2πi f(ξ)|≤2π sup_{|z−ξ|=ε}|f(z)−f(ξ)|`, which tends to zero. Set
`M=sup_{z∈closure(Δ)}|∂̄f(z)|<∞`; the deleted area term is at most `2πMε`. The source
plus-wedge and minus-area versions then agree by `dz∧dz̄=−2i dA`.

As a real/imaginary Stokes cross-check for the GH5 disk monomial moment, let `F=u+iv` be smooth
on a neighborhood of the closed unit disk. Interpret `∮_{|z|=1}F dz̄` as the pair of
existing real curve integrals associated to the one-forms `u dx+v dy` and `v dx−u dy`; do not
introduce a second complex contour carrier. Their curls are `vₓ−uᵧ` and `−uₓ−vᵧ`, which combine
to `−2i∂_zF`. Specialize DG5.6.3 to the positive unit-circle cycle (index one on the open disk)
to obtain
`∮_{|z|=1}F dz̄=−2i∫_{|z|<1}∂_zF dA`. For `m,n∈ℕ` and
`F=z^(m+1)z̄^n/(m+1)`, this recovers the GH5 disk moment identity. This cross-check belongs
to GH4 because it consumes DG5.6.3; the GH5 target itself uses polar area integration only.

The region-boundary adapter must prove the Jordan separation/orientation-to-winding facts and hole
cancellation, then identify the geometric boundary with `trace(C_Δ)`; it must not assume a graph-cell
decomposition. Consume DG 5.6.3 for local fields on an open set and finite integer-weighted AC
cycles; its full target specializes to native `TauCeti.Contour.Cycle` and imposes no nonzero-speed or
finite-cell-division hypothesis. GH4 owns only the local `Cycle.integral` real/imaginary-coordinate
comparison above, not a duplicate AC-cycle theorem. GH0 and GH5’s scalar solver remain independent of the DG Green theorem and
ConformalMapping; GH5’s form consequences consume DG0–DG1 and DG6 as stated below. GH4 consumes
DG 5.6.3 and ConformalMapping L5 for Jordan separation. DG has no reverse dependency on GH,
and there is no CKG edge for this boundary formula.

For the upper/lower/real-axis example, let
`K_{1,n}={|z|≤n, Im z≥1/n}`, `K_{2,n}={|z|≤n, Im z≤-1/n}`,
`K_{3,n}={|Re z|≤n, Im z=0}`. Use neighborhoods
`U_{1,n}={|z|<n+1, Im z>1/(n+1)}`, `U_{2,n}={|z|<n+1, Im z<−1/(n+1)}` and
`U_{3,n}={|Re z|<n+1, |Im z|<1/(2n)}`; these are disjoint and contain their respective compact
pieces. Prescribe values `1,-1,0` there.
Prove `ℂ\K_n` is connected and choose polynomial `P_n` with each piece's error at most `1/n`.
For each fixed point, membership eventually lies in the appropriate piece, giving pointwise limit
`1` above the real axis, `-1` below, and `0` on it; this is not uniform convergence on `ℂ`.

For the point-value constrained example, for each integer n≥1 define five compact pieces and
pairwise disjoint open neighborhoods by
`K₁ⁿ={|z|≤n, Im z≥1/n}`, `K₂ⁿ={|z|≤n, Im z≤−1/n}`,
`K₃ⁿ={Im z=0, 1/n≤Re z≤n}`, `K₄ⁿ={Im z=0, −n≤Re z≤−1/n}`,
and `K₅ⁿ={0}`, with `Kⁿ=⋃₁⁵Kᵢⁿ`. Set
`U₁ⁿ=int K₁ⁿ⁺¹`, `U₂ⁿ=int K₂ⁿ⁺¹`,
`U₃ⁿ={|Im z|<1/(2n), 1/(2n)<Re z<2n}`,
`U₄ⁿ={|Im z|<1/(2n), −2n<Re z<−1/(2n)}`, and
`U₅ⁿ={|z|<1/(3n)}`, with `Uⁿ=⋃₁⁵Uᵢⁿ`. Prove `Kᵢⁿ⊆Uᵢⁿ` and pairwise disjointness of these open sets. Define the target to be `1` on `K₅ⁿ` and `0` on the other four pieces, and the corresponding locally constant function on the disjoint neighborhoods. Verify directly that `ℂ\Kⁿ` is connected, then apply polynomial Runge to obtain `Q_n^m` with error `1/m`. Since `|Q_n^m(0)-1|≤1/m`, normalize
`P_n=Q_n^{n+1}/Q_n^{n+1}(0)`. Then `P_n(0)=1` and
`sup_{Kⁿ\{0}}|P_n|≤(1/(n+1))/(1-1/(n+1))=1/n`; prove pointwise convergence to zero at every fixed nonzero point. This is constrained approximation via a finite interpolation/normalization argument, not ordinary Runge density alone.

Include the annulus-hull comparison with `K = closure(D_3(0)) \ D_2(0)`, `Ω₁=D_4(0)`, and
`Ω₂ = D_4(0) \ closure(D_1(0))`. Compute `K̂_{Ω₁} = closure(D_3(0))` and
`K̂_{Ω₂}=K`. For the transfer theorem, let
Ω₁ and Ω₂ be open, K⊆Ω₁∩Ω₂ compact, and suppose the compact hull H=`K̂_{Ω₂}` is contained in Ω₁, prove:
for every f holomorphic on Ω₁ and ε>0 there is g holomorphic on Ω₂ with
`sup_{z∈H}|f(z)−g(z)|<ε`. The hull H is Runge in Ω₂ and Ω₁ is its holomorphic
neighborhood, so GH0 applies on H; in particular the same error bound holds on K.

Include the explicit example
`e^z−1 = z e^{z/2} ∏_{n≥1}(1+z²/(4π²n²))`. Prove the identity by relating the sine product
at `z/(2πi)` to `e^z−1`, with the exponential prefactor computed explicitly and local-uniform
convergence proved. This identity and the reciprocal-Gamma formula are separate targets.

The Stone–Weierstrass comparison is stated as real polynomials in `x,y` dense in real-valued
`C(K,ℝ)` for compact `K⊆ℝ²`; their complex linear span is dense in `C(K,ℂ)`. The Euler example is included above with its independent convergence/identity proof obligation. The two-domain
annulus hull example and the approximation implication when `K̂_{Ω₂}⊆Ω₁` use the actual
holomorphic-neighborhood and compact hypotheses. This differs
from holomorphic polynomial approximation, which requires connected complement. For arbitrary
open `Ω`, approximate by `H(Ω)` or rational functions under GH0's actual complement and pole-set
conditions, not by complex polynomials without extra hypotheses.

#### Product logarithmic derivatives and boundary examples

For each pole family identify principal parts before summing. Cotangent poles at integers have
residue one; the regularized series is `1/z+Σ_{n≥1}2z/(z²-n²)`. Derive this by symmetric
pairing and local-uniform convergence, not by assigning a value to an unpaired bilateral sum.
The same rule applies to shifted lattices and logarithmic derivatives of products. Preserve the
local pole exclusions and verify residues directly.

For arbitrary-domain boundary noncontinuation, consume
GH1’s branchwise meromorphic noncontinuation theorem
and its shell-cover proof, including the arbitrary-disk and interior-germ corollaries.
The product and cotangent examples here retain their explicit pole, residue, and
logarithmic-derivative calculations.

### GH5. Global smooth `∂̄` solvability on an arbitrary plane domain

This milestone owns the global one-variable inhomogeneous Cauchy–Riemann equation, not just a
closed-form identity for a particular exercise. For every open `Ω⊆ℂ` and every `f∈C^∞(Ω)`,
construct `g∈C^∞(Ω)` with `∂̄g=f`; no simple connectivity is assumed. Use `ContDiffOn ℝ ∞` for smoothness, with `open scoped ContDiff`; native `⊤`
in this order type denotes analytic order `ω`, so it does not express the smooth
compact-support input. Consume the preparatory Wirtinger operators, real-differentiability
criterion and normalized compact-support operator. The proof route is a global one-variable
shell construction:

1. Consume the GH0 compact-support Cauchy–Green formula and its uniform Riemann-sum estimate.
   GH5 supplies the exhaustion-shell cover and support/extension adapters, correction estimates,
   and convergence of the resulting solution.
2. Choose a compact Runge exhaustion from GH0 and construct a countable locally finite open
   cover by relatively compact exhaustion shells. On the real smooth open subtype `M=Ω`, apply
   native `SmoothPartitionOfUnity.exists_isSubordinate` from
   `Mathlib/Geometry/Manifold/PartitionOfUnity.lean` to this cover and the closed set `s=univ`.
   Check its finite-dimensional smooth-manifold, Hausdorff and σ-compact hypotheses for M.
   It gives smooth nonnegative χ_j, locally finite supports, sum one, and
   `tsupport χ_j ⊆ shell_j`. Relative compactness of each shell makes these topological supports
   compact in M; prove that their images in ℂ are compact subsets of Ω. Use the open-subtype
   smoothness and extension-by-zero adapters to make `φ_j=χ_j f` smooth and compactly supported
   on ℂ. Set `u_j=Tφ_j`. Then `∂̄u_j=φ_j`; the chosen shell separation makes terms from later
   shells holomorphic near earlier compacts. Generic smooth-partition existence is a native
   input; the shell construction and these support/comparison properties are GH5 targets.
3. Correct each `u_j` on preceding compacts by a GH0 finite-rank linear `H(Ω)` operator,
   choosing its error parameter against the sup norm of the current holomorphic tail on the
   collar L. Use a slightly larger Runge compact at each stage so Cauchy estimates on its interior
   control every derivative on the preceding compact. The fixed operator acts on each shell datum
   independently of its values, and the summable seminorm errors make the series converge in
   `C^∞_loc(Ω)` with `∂̄` equal to `Σφ_j=f`.

Classify the full solution space. Given any smooth particular solution `u₀` on an open Ω,
a smooth `u` solves `∂̄u=f` exactly when `u=u₀+h` for a unique `h∈H(Ω)`. The difference
satisfies the homogeneous Cauchy–Riemann equation, whose native differentiability criterion
makes it holomorphic; conversely holomorphic functions are smooth and have zero `∂̄`.
No connectedness or simple connectivity is required. On ℂ the right-hand side `f(z)=z̄`
has all solutions `u(z)=z̄²/2+h(z)` with h entire. For `f(z)=z e^{−|z|²}`, use
`u₀(z)=−e^{−|z|²}`. Since this particular solution is bounded, a solution is bounded exactly
when its entire summand is bounded. Liouville gives precisely `u(z)=−e^{−|z|²}+c`, `c∈ℂ`.
For `f(z)=z`, the particular solution `u₀(z)=|z|²`; all solutions are
`|z|²+h(z)` for h entire. For the related exactness exercise, `dg=f dz` with smooth g forces
`∂̄g=0`, hence g is holomorphic. Merely `∂_z g=f` does not: `f=0`, `g(z)=z̄` is a counterexample.

For every smooth `f` on an arbitrary open Ω, construct a smooth `g` such that
`ω=g dz+f dz̄` is closed. Apply global solvability to the smooth datum `∂_z f`,
obtaining `∂̄g=∂_z f`, and prove
`dω=(∂_z f−∂̄g) dz∧dz̄=0` on the differential-form carrier below.
For a fixed f, all such coefficients are `g=g₀+h`, with h holomorphic on Ω.
The conclusion is closedness; a global primitive additionally requires vanishing periods.

For differential-form exactness, take `U : TopologicalSpace.Opens ℂ`, the open subtype
`M := ↥U` and model `I := 𝓘(ℝ, ℂ)`. The inclusion `ι : M → ℂ` induces a smooth
identification of the tangent bundle with the trivial bundle of fibre ℂ: at `z : M`,
`mfderiv I I ι z : TangentSpace I z →L[ℝ] ℂ` and its inverse are the mutually inverse
coordinate tangent maps. Write `e_z : ℂ ≃L[ℝ] TangentSpace I z` for the inverse
identification. For every ambient `u : ℂ → ℂ`, prove the restriction comparison
`ContDiffOn ℝ ∞ u (U : Set ℂ) ↔ ContMDiff I I ∞ (fun z : M => u z)`, using the native
open-subtype smoothness API. Throughout, `d v` for a smooth coefficient function `v` means
`mextDeriv (RoughForm.ofFunction I v)`, with its smoothness supplied by DG1.3.

Define real one-forms `dx = d(Re ∘ ι)` and `dy = d(Im ∘ ι)`. For a fixed `c : ℂ`, let
`L_c : ℝ →L[ℝ] ℂ` be `L_c(t)=c*(t:ℂ)`. On DG0.3/0.4's generic form carrier define
`dz = mapCoeff L_1 dx + mapCoeff L_i dy` and
`dbarz = mapCoeff L_1 dx − mapCoeff L_i dy`, where `i := Complex.I` and each `mapCoeff`
is the bundled fixed-coefficient map. A product of a smooth complex function with a form
means the paired wedge of its degree-zero form with that form, using complex multiplication
as a continuous real-bilinear pairing; these formulas require no separate form carrier.

For smooth `u : M → ℂ`, define its real coordinate derivatives by evaluating `mfderiv`
on `e_z 1` and `e_z i`. Put `∂z u=(∂x u−i*∂y u)/2` and
`∂barz u=(∂x u+i*∂y u)/2`, and prove `du=(∂z u) dz+(∂barz u) dbarz`.
For ambient smooth-on-`U` functions, prove these derivatives of the restriction agree with
the ambient derivatives used by GH5, including `barDerivative`. By DG's determinant wedge
evaluation, prove `dz∧dbarz = mapCoeff L_(−2i) (dx∧dy)`; its value on
`(e_z 1,e_z i)` is `−2i`. Every smooth complex-valued two-form `η` therefore has the unique
form `η=h dz∧dbarz`, where `h(z)=η_z(e_z 1,e_z i)/(−2i)`; prove `h` is smooth.
Extend `h` by zero off `U`; the restriction comparison gives an ambient function smooth on
`U`. Apply GH5 to it, restrict the solution to `M`, and use DG's
`mextDeriv_wedgeWith` Leibniz rule to obtain `d(−u dz)=η`, with sign
`−du∧dz=(∂barz u) dz∧dbarz`. For a real two-form, include coefficients by `L_1`, take a
complex primitive and then take its real part; DG1.2's coefficient naturality and
`Re ∘ L_1 = id` give a real primitive. Thus the real degree-two de Rham quotient vanishes.
CKG K5a consumes the complex exactness on this same open-subtype carrier and owns its
complex-coefficient quotient comparison, including `H²_dR(U;ℂ)=0`.

**GH5 coordinate worked examples.** Keep these scalar computations in GH5; the disk moment is
proved by polar area integration and has no DG or CKG dependency. On all of `ℂ`, prove
`d(i z²)=2iz dz` and `d(i|z|²)=i(z̄ dz+z dz̄)`, as identities of
complex-valued real one-forms with the coefficient pairing specified above. Also prove
`d(|z|²)=2(x dx+y dy)` and `d(|z|⁴)=4(x²+y²)(x dx+y dy)`. On `ℂ\{0}`, prove
`d((log|z|)²)=log(x²+y²)(x dx+y dy)/(x²+y²)`, using
`log|z|=½ log(x²+y²)`; keep the expression `(log|z|)²` distinct from `log(|z|²)`.
Using the already-defined GH5 Wirtinger operators, for `m,n∈ℤ` prove on `ℂ\{0}`
`∂_z(z^mz̄^n)=m z^(m−1)z̄^n` and
`∂_{z̄}(z^mz̄^n)=n z^mz̄^(n−1)`. For `m,n∈ℕ`, prove the corresponding formulas on
all of `ℂ`, reading the derivative term as zero when its exponent is zero: `∂_z=0` if `m=0`
and `m z^(m−1)z̄^n` otherwise; `∂_{z̄}=0` if `n=0` and
`n z^mz̄^(n−1)` otherwise.

Let `D=ball 0 1 ⊂ ℂ` with native Lebesgue area `volume`. For `m,n∈ℕ`, prove
`∫_D z^mz̄^n dvolume = if m=n then π/(m+1) else 0`, by polar coordinates: the angular
integral vanishes unless `m=n`, while the equal-index radial integral is
`2π∫₀¹ r^(2m+1)dr=π/(m+1)`. State that `D` is the open unit disk and that `m,n` are natural
exponents; negative powers are not part of this disk-integrability claim. GH4's separate
real/imaginary Green specialization supplies a Stokes cross-check, not a prerequisite for this
GH5 computation.

### GH5.1. Cousin I and planar de Rham consequences

For additive Cousin I, for every open `Ω⊆ℂ` and locally finite open
cover `{U_i}`, prove: every
holomorphic additive 1-cocycle `c_ij` with `c_ij+c_jk+c_ki=0` is a coboundary. Choose a smooth
locally finite partition `ρ_k` subordinate to the cover and set `b_i=Σ_k ρ_k c_ik` on `U_i`.
Verify `b_i-b_j=c_ij`, so `∂̄b_i` is one global smooth datum; solve `∂̄u=∂̄b_i` by GH5,
and check `b_i-u` are holomorphic and glue with the required differences. For the Mittag–Leffler application,
use `Ω₀=Ω\E` and small disjoint disks around the marked points, and verify this is an open
cover. For the de Rham consequence consume DG Layer 6.1–6.2's real smooth de Rham complex and quotient
carrier. The coordinate calculation above gives exactness for every complex-valued smooth 2-form;
real and imaginary parts give real-coefficient exactness. CKG K5a consumes the complex exactness
statement and proves its own complex de Rham comparison on the generic form carrier. The open plane
domain is Hausdorff and paracompact. This uses no singular/de Rham comparison or fundamental class.

## Dependencies, references, and explicit boundaries

Consume Mathlib Cauchy/power-series/isolated-zero/meromorphic-order/local-uniform-limit APIs,
Mathlib's uniform-on product topology, and the Tau Ceti contour/residue/winding API under their
actual pinned hypotheses. GH0 owns its planar hull and Runge theorems. GH0 and GH5 do not consume a
ConformalMapping contract or DifferentialGeometry Green theorem; GH4 alone consumes ConformalMapping
L5's Jordan separation/filled-hull target and DifferentialGeometry 5.6.3's finite-cycle Green target,
with the GH-owned Jordan orientation/winding and `Cycle.integral` coordinate adapters stated above.
Neither provider depends on GH4, so these edges are acyclic. This owner provides GH0 Runge/exhaustion
(the exhaustion in the generic finite-dimensional form used by Hyperfunctions HF2) and the scalar compact-support Cauchy–Green operator to CKG K2, and GH5.1 complex 2-form exactness
to CKG K5a. Those CKG targets own the parameter and complex-carrier comparison arguments
respectively.
It builds the global one-variable Runge, Mittag–Leffler, zero-divisor, quotient, entire-factorization,
and arbitrary-domain smooth ∂̄ results itself; it does not depend on
the several-variable Runge or local preparation contracts. It does not duplicate the local
holomorphic/meromorphic carriers, Cauchy theorem, geometric Riemann mapping, or local
several-variable preparation theorem.

References for proof routes: Conway, *Functions of One Complex Variable I*, chapters on Runge,
Mittag–Leffler and Weierstrass products; Ahlfors, *Complex Analysis*, chapters on infinite
products and approximation. For global ∂̄ solvability, use a one-variable Cauchy–Green solution
operator and the exhaustion/Runge correction argument specified in GH5. These references guide
proofs; they do not replace Lean targets.
