# Roadmap: Toeplitz operators, symbols and finite sections

**Summary.** Develop the scalar and finite-matrix Hardy-space models of Toeplitz
operators from circle Fourier analysis, bounded multiplication and orthogonal
projection. Build their symbol isometry, Brown–Halmos characterization, Hankel
product calculus, Fredholm and winding-number theory, and finite-section algebra,
ending with the two-limit stability criterion and strong inverse convergence with
quantitative solution error. The roadmap is this README; Suggested.lean states its
headline acceptance theorems on the pinned carriers.

## Scope and ownership

This is the Hardy-space and finite-section part of OperatorTheory. It owns the
unit-disk harmonic-majorant comparison, scalar and finite-block Toeplitz/Hankel
operators, their symbol comparisons, the determinant index formula and the
finite-section stability theory. It extends the existing finite-section target
by its ambient-invertibility and inverse-convergence consequences.

[CStarAlgebras C8](../../CStarAlgebras/README.md#c8-quasidiagonality-and-representation-approximation)
owns the unilateral-shift algebra and its scalar exact sequence. Its
[C1](../../CStarAlgebras/README.md#c1-ideals-hereditary-subalgebras-and-multipliers)
and [C5](../../CStarAlgebras/README.md#c5-c-tensor-products-and-operator-space-tensor-products)
own quotient C*-algebras, spectral permanence and bounded-product/norm-null
quotients. [OperatorKTheory K4](../../OperatorKTheory/README.md#k4-fredholm-indices-and-extensions)
owns the Calkin/Atkinson comparison and index boundary comparison;
[BanachSpaceTheory B5](../../BanachSpaceTheory/README.md#b5-function-spaces-and-weak-compactness)
owns the scalar L∞ C*-algebra structure. These constructions are imported, not
repeated. The finite-block and Hardy-model transports here are their specified
variants. The binary Fredholm-product theorem is already in Tau Ceti; §3.4 adds
finite Hilbert-product transport and its converse. Circle degree, compact
perturbation and native Fourier/projection theory are also library inputs.

The analytic Hardy model follows the
[Hardy-space design discussion](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Hardy%20Spaces/near/588721731):
build the unit-disk p=2 harmonic-majorant model and its boundary comparison in
Tau Ceti, adopting a matching Mathlib carrier when available. General Hardy spaces
on arbitrary domains are outside this roadmap.

## Conventions

All operator spaces are complex Hilbert spaces; finite products carry the
Euclidean Hilbert norm, never the maximum norm. Circle functions use native
`UnitAddCircle`, period one and `AddCircle.haarAddCircle` of mass one.
`circlePeriodPositive` records the positive period. Write eₙ(t)=exp(2πint),
â(n)=∫a(t)exp(−2πint)dt; inner products are conjugate linear first.
Symbols are almost-everywhere classes. For continuous symbols, nonvanishing means
at every point. Block rank r is a positive natural number; section n has n+1
positions, so n=0 is a one-position section. The finite-product lemma also covers
an empty index set. Hilbert spaces in that lemma may lie in any fixed universe.

Write Tₐ=P Mₐ restricted to H² and Hₐ=(1−P)Mₐ restricted to H², with Hₐ landing
in the actual orthogonal complement. The matrix entry (i,j) of Tₐ is â(i−j);
a matrix written cⱼ₋ᵢ has cₙ=â(−n). Reflection means a(t)↦a(−t), and the
forward shift T_z has index −1. Winding is counterclockwise; the normalized
integral is (2πi)⁻¹∫γ′/γ, and is used only when γ avoids zero and is piecewise C¹.

**Checks.**

- For a=2+3z, the entries (0,0),(1,0),(0,1) are 2,3,0; reflection gives 2,0,3.
- Haar mass one gives ‖e₀‖²=‖e₁‖²=1 and ⟨e₀,e₁⟩=0; mass 2π gives the wrong norm.
- The loops 2z and 2z⁻¹ have degrees 1 and −1 and Toeplitz indices −1 and 1.

## Exact supplier contracts

### From Mathlib

- `fourier`, `fourierCoeff`, `fourierBasis` and `span_fourierLp_closure_eq_top`
  in `Mathlib/Analysis/Fourier/AddCircle.lean` supply normalized circle Fourier
  analysis and density for 1≤p<∞. The Hardy nonnegative-mode comparison is §1.1.
- `Submodule.orthogonalProjectionOnto` in
  `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean` supplies projection
  to a closed submodule, with that submodule as codomain.
- `ContinuousLinearMap.holderL` in `Mathlib/MeasureTheory/Function/Holder.lean`
  supplies heterogeneous Lp multiplication. In particular the native Hölder
  scalar action at ∞,∞,∞ represents the product of two scalar symbols.
  `ContinuousMap.toLp` in `Mathlib/MeasureTheory/Function/LpSpace/ContinuousFunctions.lean`
  embeds continuous symbols; native `Lp` star supplies pointwise conjugation.
- `lp.evalCLM` in `Mathlib/Analysis/Normed/Lp/lpSpace.lean` and
  `PiLp.continuousLinearEquiv` in `Mathlib/Analysis/Normed/Lp/PiLp.lean`
  construct coordinate cutoffs. `lp.inftyCStarRing` supplies the C*-norm on
  bounded products of operator algebras.
- `ContinuousLinearMap.IsFredholm`, `ContinuousLinearMap.isFredholm_iff_exists_isQuasiInverse`
  and `ContinuousLinearMap.IsFredholm.index_comp` in
  `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean`, and
  `ContinuousLinearMap.index_continuousOn_isFredholm` in its `Open.lean`, supply finite-rank
  parametrices, composition and index continuity on the Fredholm locus.
- `DiffContOnCl.circleAverage_poissonKernel_smul`,
  `InnerProductSpace.HarmonicOnNhd.circleAverage_poissonKernel_smul`,
  `InnerProductSpace.HarmonicOnNhd.circleAverage_eq` and
  `AnalyticOnNhd.circleAverage_log_norm`, in `Mathlib/Analysis/Complex/Poisson.lean`,
  `Harmonic/Poisson.lean`, `Harmonic/MeanValue.lean` and `JensenFormula.lean`,
  supply Poisson, mean-value and Jensen formulas on smaller closed disks.
  Jensen's nonzero-center hypothesis is handled by factoring the zero at zero.
- `Matrix.exists_mulVec_eq_zero_iff`, `LinearMap.finrank_range_of_inj`,
  `Submodule.smithNormalFormOfRankEq` and `Module.Basis.toMatrix`, in
  `Mathlib/LinearAlgebra/Matrix/ToLinearEquiv.lean`, `Dimension/Finrank.lean`,
  `FreeModule/PID.lean` and `Matrix/Basis.lean`, supply the full-rank polynomial
  linear algebra used in §3.4. Smith normal form requires a PID and full rank.

### From Tau Ceti

- `Circle.degree`, `Circle.sub_eq_degree_mul` and `Circle.degree_eq_of_homotopy`
  in `TauCeti/Topology/Circle/Degree.lean` supply integer degree, its positive
  2π angle increment and homotopy invariance with moving basepoint.
- `TauCeti.Contour.windingNumber` in
  `TauCeti/Analysis/Contour/Winding/Number/Basic.lean` is the normalized
  complex integral compared with degree for piecewise-C¹ nonvanishing loops.
- `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` and
  `ContinuousLinearMap.index_add_of_isCompactOperator` in
  `TauCeti/Analysis/Fredholm/CompactPerturbation.lean` supply compact perturbation.
- `ContinuousLinearMap.IsFredholm.prodMap` and `ContinuousLinearMap.index_prodMap`
  in `TauCeti/Analysis/Fredholm/Prod.lean` supply binary Fredholm products and
  index additivity over a nontrivially normed field. Use their native kernel,
  range and quotient product comparisons before finite PiLp transport; the
  ambient spaces need not be finite dimensional.

### From TauCetiRoadmap.CStarAlgebras

C1 supplies closed-ideal quotients, isometry of injective star homomorphisms and
spectral permanence with the same unit or appropriate unitization. C5 supplies
the norm-null ideal in native bounded products, with pointwise operations and
quotient norm. C8 supplies `0→K(ℓ²)→T→C(Circle)→0`, sending the forward shift
Sx(0)=0, Sx(n+1)=x(n) to the identity circle coordinate.

### From TauCetiRoadmap.OperatorKTheory

K4 supplies the Calkin algebra and its identification of Fredholmness with
invertibility modulo compacts, compatible with the native index.

### From TauCetiRoadmap.BanachSpaceTheory

B5 supplies the scalar `Lp ℂ ∞` unit and commutative C*-algebra laws, reusing
native star and Hölder multiplication. Only finite normalized Haar measure is
needed here; the generic measure-space theory remains there.

## How to read the build

Layer 1 constructs the Hardy model, Layer 2 its scalar and block operator
calculus, and Layer 3 its symbol and Fredholm comparisons. Layer 4 first proves
stability in bounded-product quotients, then the strong inverse theorems for
coordinate compressions. Layer 5 builds the finite-section algebra before using
its compatible-pair quotient to detect stability. Layer 6 supplies worked
examples. Each construction includes its element-level equations and usable
API; only the headline signatures and their simple definitions appear in Lean.

## Layer 1: Hardy space, multipliers and kernels

### 1.1 Boundary Hardy space and multipliers

Define `SequenceL2`, `CircleL2` and `Symbol` as native ℓ², circle L² and circle
L∞ respectively. Define `hardySubspace` as the closed span of the nonnegative
Fourier monomials and `HardySpace` as its subtype; `hardyComplete` records its
completeness. Define `hardyMonomial` by inclusion of each nonnegative Fourier
monomial in that span. Define `symbolMultiplier` by native Hölder multiplication
and `continuousSymbol` by the continuous-to-Lp embedding (Park, §1, pp.1–2;
park line 20).

Prove the negative-Fourier-coefficient characterization of H², construct its
ℕ-indexed Hilbert basis and isometric comparison to native
`lp (fun _ : ℕ => ℂ) 2` by the Hardy Fourier unitary, and give the projection
coefficient formula. Prove completeness and the orthogonal splitting into
nonnegative and negative modes. Consume native `ContinuousLinearMap.holderL`
for bounded multiplication by an L∞ symbol on L²; develop its norm, adjoint,
linearity, products and constants. Identify continuous symbols with their
L∞ classes, including equality of norms from full Haar support.

The API comprises:

- The Hardy subspace consists exactly of functions whose negative coefficients vanish;
  its monomials form an orthonormal basis and its inclusion preserves the norm.
- The projection preserves nonnegative coefficients and kills negative coefficients;
  the Hardy Fourier unitary and its inverse preserve inner products and coefficients.
- Multipliers preserve sums, scalar multiples and products, have adjoint multiplication
  by the conjugate symbol, and have norm equal to the essential supremum.
- Continuous-symbol embedding preserves constants, products and conjugation and is
  isometric because Haar measure has full support.

**Checks.**

- e₀ and e₁ belong to H², whereas e₋₁ does not; their projections are e₀,e₁,0.
- The Fourier unitary sends e₀+2e₁ to (1,2,0,…) of norm √5, excluding a scaled basis.
- Multipliers M₀,M₂,M_z send e₀ to 0,2e₀,e₁; M₂ also sends e₋₁ to 2e₋₁,
  whose Hardy projection is zero. This separates ambient multiplication from projection.
- In the Hardy monomial family, the vectors at indices 0,1,2 are e₀,e₁,e₂,
  each of norm 1; the Fourier unitary sends them to distinct unit vectors.
- Continuous symbols 0, 2 and z have L∞ norms 0,2,1; a change at one point does
  not change an Lp class, whereas two distinct continuous functions remain distinct.

*Needs:* circle Fourier basis and Lp multiplication; closed-submodule projection;
BanachSpaceTheory B5 for scalar L∞ algebra laws.

### 1.2 Analytic model, least majorants and uniqueness

For x∈H² construct the holomorphic disk function
`F_x(w)=Σ_(n≥0)hat(x)(n)w^n`. Prove local uniform convergence, holomorphy,
the bound `|F_x(w)|≤‖x‖/sqrt(1−|w|²)`, and radial L² convergence to x.
Construct the unit-disk p=2 Hardy space of holomorphic F for which |F|²
admits a real harmonic majorant. Give vector-space and norm/completeness
APIs, defining norm squared as the infimum of majorants' values
at 0. Prove F_x is
the Poisson extension of x and the Poisson extension of |x|² is its
harmonic majorant by positivity and Cauchy–Schwarz. Prove its pointwise
minimality by the Poisson representation of any majorant on each r-disk,
the L¹ convergence `|F_x(r·)|²→|x|²` and uniform convergence of the
rescaled Poisson kernels on fixed interior points. Conversely
use mean value to bound all radial L² means by any majorant's value at 0;
Parseval then gives square-summable Taylor coefficients and the boundary
element x. Prove the isometric equivalence and equality of norm squared,
least majorant at 0 and supremum of radial L² means. Construct the reproducing kernels
and their normalized versions. Use native Jensen/Poisson theory to prove
that a nonzero H² boundary function is nonzero almost everywhere: factor its
zero at the origin, bound the negative part of log|F_x| and take an a.e.
convergent subsequence of the radial L² approximants. Fatou's lemma for
log⁻ proves logarithmic integrability and boundary uniqueness. Prove the
transport between native `circleAverage`/`circleMap` and the normalized
AddCircle Haar integral used here. Prove L¹ Fourier uniqueness by Fejér
means and their L¹ approximation, and the integrable product/coefficient
formulas for two L² functions; these are prerequisites of Coburn's proof.
For N≥1 define the Fejér mean on circle L¹ by its finite coefficients
(1−|k|/N)â(k) for |k|<N and zero otherwise. Its API includes positivity,
preservation of constants, L¹ contraction and convergence to the input in L¹
(Jerison, Theorem 1, pp.2–3, jerison-fejer line 56); Fourier uniqueness is its
Corollary 1, p.3 (jerison-fejer line 90).
For f,g∈L² their product is L¹ with norm at most ‖f‖₂‖g‖₂, and its kth
coefficient is the absolutely convergent sum Σⱼ f̂(j)ĝ(k−j), by Cauchy–Schwarz.
The power-series bound uses 1−|w|²>0; the kernel denominator is nonzero
because |conj(w)z|<1 for |w|<1 and |z|≤1.

The analytic/boundary identification is Xia, §I.2, Theorem I.2.1, p.24
(xia-hardy line 714), specialized to the unit disk with basepoint zero, where
harmonic measure is normalized Haar measure. The pointwise least-majorant
assertion follows the Poisson route above, and boundary uniqueness is Park,
Lemma 2.6, p.4 (park line 156). The API comprises:

- The boundary-to-disk map and inverse are linear isometries, with inverse given
  by the L² radial boundary value. The least-majorant value at zero equals ‖x‖².
- For |w|<1 the kernel is k_w(z)=(1−conj(w)z)⁻¹, with norm squared
  (1−|w|²)⁻¹ and ⟨k_w,x⟩=F_x(w). Its normalized version is √(1−|w|²)k_w.
- The theorem `hardy_boundary_unique` says x≠0 implies x(t)≠0 almost everywhere;
  L¹ Fourier uniqueness and the L² product/coefficient identities are supplied
  at precisely the integrability needed by §3.3.

**Checks.**

- x=0 gives F=0 and least majorant 0; x=e₀ gives F=1 and least majorant 1.
- For x=e₀+e₁, the least majorant is 2+2Re(w), with value 2 at zero;
  |1+w|² is not harmonic and differs by 1−|w|².
- For k₀=1 the kernel norm is 1; for w=1/2 it is 2/√3; w=1 is excluded,
  since the proposed coefficients are not square summable.
- The normalized kernels at w=0,1/2,i/2 have norm 1; their constant
  coefficients are 1,√3/2,√3/2, respectively. Leaving out the normalization fails.
- For x=e₁, F_x(w)=w, radial mean square r² tends to 1 and the least
  majorant is 1; together with 0 and e₀ this separates the analytic norm from evaluation at zero.
- The Fejér means of e₀ at N=1,2 are both e₀; those of e₁ are 0,e₁/2.
  The formula requires N≥1. For f=e₁,g=e₋₁ the product's coefficient at 0 is
  1, whereas f=e₁,g=e₁ gives coefficient at 0 equal to 0 and at 2 equal to 1.
- The zero function fails the nonzero hypothesis; 1−z has one boundary zero,
  of Haar measure zero, so boundary uniqueness is an almost-everywhere assertion.

*Needs:* §1.1; the named native Poisson, mean-value and Jensen formulas; the
circle-integral transport, Fejér approximation and L¹ coefficient targets of this section.

### Examples

The boundary element e₀+e₁ has norm √2 and analytic extension 1+w. Its
least majorant and reproducing-kernel values use the same mass-one normalization.

### Dependencies

Circle Fourier analysis, Hölder multiplication, native Hilbert projections and
complex Poisson/Jensen theory; BanachSpaceTheory B5 only for scalar L∞ algebra laws.

## Layer 2: bounded symbols and Toeplitz matrices

### 2.1 Scalar symbols and Brown–Halmos

Define `toeplitz` as P Mₐ restricted to the actual Hardy submodule.
Construct the bounded complex-linear symbol map a↦T_a. Prove its matrix
formula, `T_a†=T_(bar a)`, constants and `‖T_a‖=‖a‖∞`; derive injectivity.
Prove the Brown–Halmos criterion `S†TS=T` for the forward shift S iff
T is T_a for a unique L∞ symbol. On finitely supported vectors a sequence
(c_n)_(n∈ℤ) defines the matrix c_(j−i); prove it extends boundedly to ℓ²(ℕ)
iff it has such a symbol. Give the equivalent uniform bound on all leading
finite square compressions. Pass from these bounds to the bilateral Laurent
operator by translated finite supports, then identify the Laurent multiplier
under the native Fourier unitary. Own the multiplier criterion
`‖a p‖₂≤C‖p‖₂` for all trigonometric polynomials implies a∈L∞ with
‖a‖∞≤C, first for a∈L², by density, truncation and indicator approximation.
This also proves the symbol norm equality.

The headline signatures are `toeplitz_matrix_coefficient`, `norm_toeplitz` and
`toeplitz_brownHalmos`; Brown–Halmos quantifies over every bounded operator T on
H² and uses the actual shift S=T_z, with a unique symbol (Böttcher,
Theorem 4.1, p.67, boettcher-survey line 445; norm equality in Proposition 4.2,
p.68, boettcher-survey line 501).

- The symbol map is linear, injective and isometric, respects conjugation as adjoint,
  and sends each constant c to cI.
- The matrix dictionary and reflection preserve the stated coefficient signs;
  the finite-square bound is uniform in the section size and vector.

**Checks.**

- a=0 gives norm 0; a=2 gives norm 2 and matrix 2I.
- a=z gives entry (1,0)=1 and (0,1)=0, and S†SS=S.
- The rank-one projection E₀₀ is not Toeplitz: S†E₀₀S=0≠E₀₀.

*Needs:* §1.1, its Fourier unitary and projection coefficients; translated finite
supports, the multiplier criterion and approximation targets in this section.

### 2.2 Hankel products

Define `hankel`, the Hankel operator `H_a=(1−P)M_a|H²`, with the actual orthogonal
complement as codomain. Prove
`T_a T_b−T_(ab)=−H_(bar a)† H_b`, using the ambient projection splitting.
For analytic b or coanalytic a the corresponding Hankel term vanishes;
prove the product identities and construct the H∞ multiplier comparison.
For continuous symbols prove the semicommutator compact by uniform
trigonometric approximation and finite-rank Laurent-polynomial calculations.
Do not make compression a multiplicative map on arbitrary symbols.

The API includes bounded linear dependence on the symbol, its exact codomain,
the analytic/coanalytic vanishing rules, `toeplitz_hankel_product`, and
`toeplitz_semicommutator_compact` (Böttcher, §6, equation (18), p.78 and
Proposition 6.1, p.78; Park, Proposition 2.2, p.3, park line 105).
The H∞ comparison identifies bounded analytic multipliers with symbols having
no negative Fourier coefficients, preserving multiplication, norm and action.

**Checks.**

- H_z=0, whereas H_(z⁻¹)e₀=e₋₁; the zero operator is the wrong model for the latter.
- H_(z⁻²)e₁=e₋₁, excluding the shifted-index convention e₋₂.
- T_z T_(z⁻¹)−I=−E₀₀, while T_(z⁻¹)T_z−I=0; this fixes the product sign and order.
- The H∞ symbols 1 and z act by I and S; z⁻¹ is excluded because its coefficient
  at −1 is 1. Thus the comparison cannot include every L∞ symbol.

*Needs:* §2.1; the orthogonal splitting in §1.1; uniform trigonometric approximation
and finite-rank closure for continuous compactness.

### 2.3 Finite block symbols

For every finite r≥1 use `PiLp 2 (fun _ : Fin r => HardySpace)` for the
block Hardy space. Compare it with the closed nonnegative-mode subspace of
`Lp (EuclideanSpace ℂ (Fin r)) 2 haarAddCircle` and with the vector-valued
ℓ² carrier. Matrix symbols use `Lp (EuclideanSpace ℂ (Fin r) →L[ℂ]
EuclideanSpace ℂ (Fin r)) ∞ haarAddCircle`, with its operator norm.
Construct the block multiplier and compression, its matrix Fourier-entry
formula, linearity, adjoint, isometry and block Brown–Halmos criterion.
On these operator-valued L∞ classes construct product by native Hölder
multiplication and the constant unit, and reuse native `Lp` star for the
pointwise adjoint; prove the C*-laws,
continuous-symbol embedding with exact sup operator norm and the
vector-valued multiplier criterion. Give product Fourier coefficients as
ordered convolution under the required L²/L¹ hypotheses, first on finite
Fourier sums and then by scalar native norm convergence on each finite
matrix entry.
Construct the block Hankel operator into the actual orthogonal complement
of the block Hardy subspace. Prove `T_(AB)=T_A T_B` when B is analytic
or A is coanalytic. Prove the block semicommutator formula and
compactness for continuous
matrix symbols by finite matrix entries and trigonometric approximation.
Use the same scalar projections and coefficient conventions on every block.

For these block constructions the API includes:

- The vector-valued, finite-product and sequence Hilbert identifications preserve
  each position and fiber coordinate and the sum-of-squares inner product.
- The operator-valued symbol algebra has pointwise ordered multiplication, adjoint
  and unit; its embedding of continuous symbols preserves the sup operator norm.
- Block Toeplitz and Hankel maps have the same linearity, adjoint, Fourier-entry,
  product-defect and compactness laws, with the written matrix order. Block
  Brown–Halmos uses S acting on positions and the identity on each fiber.

These are finite-matrix extensions of §2.1–§2.2 (Park, §3, p.5, park line 184;
Böttcher–Silbermann, *Large Truncated*, §6.1).

**Checks.**

- At r=1, all three Hilbert models and all operators recover the scalar ones.
  At r=2, e₀⊗(1,0), e₁⊗(0,1) and their sum have norms 1,1,√2 in each model.
- For a constant diag(2,1), the symbol and Toeplitz norms are 2, not √5.
- For constant matrices E₁₂ and E₂₁, the two ordered products are E₁₁ and E₂₂;
  their Hankel operators vanish. This rejects commutative multiplication.
- Block H_(z⁻¹ I₂) sends e₀⊗v to e₋₁⊗v, whereas H_(z I₂)=0;
  the negative-complement codomain is retained on each fiber.

*Needs:* §2.1–§2.2; native finite PiLp and Euclidean operator norms; entrywise
Hölder products and the finite-matrix norm comparisons constructed here.

### Examples

For 2+3z the first two rows begin (2,0,…) and (3,2,0,…). For matrices E₁₂,E₂₁
the constant Toeplitz product is the ordered matrix product on every position.

### Dependencies

Layer 1 and native finite Hilbert products; block multiplication, vector-valued
multiplier bounds and block comparisons are delivered in §2.3.

## Layer 3: the shift algebra and Fredholm symbols

### 3.1 The scalar shift-algebra comparison

Compare C*(S) in the Hardy model with C8's shift algebra through the ℓ²
unitary and `AddCircle.toCircle`'s identification with native `_root_.Circle`.
Pin the symbol of S as the identity coordinate z and the symbol of T_a
as a transported along that identification. From C8's exact sequence deduce
every element has a unique expression T_a+K with a continuous and K compact.
For continuous a derive `‖T_a‖essential=‖a‖∞` and
`σ_essential(T_a)=a(𝕋)` in the same Calkin carrier.

The comparison's API preserves the shift generator, adjoint, norm, compact
ideal and continuous symbol; its quotient is isometric and multiplicative
(Park, Theorem 2.3 and Corollary 2.4, p.4, park lines 134–140;
Böttcher, Theorem 6.2, p.79, boettcher-survey line 905).

**Checks.**

- I has symbol 1 and essential norm 1; E₀₀ has symbol 0 and essential norm 0.
- S has symbol z, essential norm 1 and essential spectrum the circle.
- I−E₀₀ has symbol 1, essential spectrum {1}, yet kernel dimension 1; the
  quotient comparison does not preserve invertibility of arbitrary lifts.

*Needs:* §1.1 Hardy Fourier unitary, §2.1; CStarAlgebras C8 and C1;
OperatorKTheory K4 and the AddCircle-to-Circle transport.

### 3.2 Winding, Fredholmness and index

For continuous a, prove T_a is Fredholm iff a is nowhere zero and
`index(T_a)=−wind(a,0)`. Define winding using native `Circle.degree`
in `TauCeti.Topology.Circle.Degree`: normalize a by its pointwise modulus
and pull back along `[0,1]→UnitAddCircle` to a loop in `_root_.Circle`.
For piecewise-C¹ symbols prove its cast to ℂ equals
`TauCeti.Contour.windingNumber γ 0 1 0`, where γ(t)=a(t mod 1) on
[0,1]. Prove degree 0 is equivalent to
a continuous logarithm by circle-cover lifting, and construct a nowhere-zero
homotopy from a to z^k when its degree is k. Prove homotopy invariance
through the native Fredholm-family theorem. Use the integer-power monomial
models to pin the sign, and include compact perturbations T_a+K.

Define `normalizedSymbolPoint`, `symbolLoop` and `symbolWinding` by the
pointwise normalization, positive quotient path and native degree respectively.
Their API gives continuity, matching endpoints, invariance under positive
rescaling, homotopy invariance and additivity under products; the nonvanishing
hypothesis excludes division by zero. The headline tests are
`toeplitz_fredholm_iff` and `toeplitz_index` (Park, Corollary 2.4 and Theorem 2.5,
p.4, park lines 139–152; Böttcher, Theorem 4.4, p.69).

**Checks.**

- For a=2, normalization and loop are constant 1, winding 0 and index 0.
- For a=2z, the normalized loop is exp(2πit), with values 1,−1,1 at
  t=0,1/2,1; degree 1 and index −1. For 2z⁻¹ the degree and index reverse.
- The zero symbol has no normalization hypothesis and its operator is not
  Fredholm. The symbol z−1 vanishes at the circle point 1 and is also excluded.
- For γ(t)=2exp(2πit), γ′/γ=2πi, so the normalized contour integral is 1.
  Omitting i would instead give i.

*Needs:* §3.1, native circle degree and covering lifts, native index continuity
and compact perturbation; the piecewise-C¹ integral comparison uses the named
Tau Ceti contour integral and the positive quotient parametrization.

### 3.3 Coburn's alternative and scalar invertibility

Consume C1's spectral permanence for C*(S)/K inside the Calkin algebra
in the essential-spectrum computation. Prove Coburn's alternative for nonzero L∞ scalar a:
`ker(T_a)=0` or `ker(T_a†)=0`, by Layer 1's boundary uniqueness and the Hardy
product argument. Deduce that a scalar Toeplitz operator of Fredholm index 0
is invertible. Hence continuous T_a is invertible iff a is nowhere zero
and its winding number is 0. For T_a+K its Fredholm index remains the
symbol index; compute `T_1−projection(span e_0)`, which has index 0 and
is not invertible.

The headline `toeplitz_coburn` retains a≠0 in L∞; `toeplitz_isUnit_iff`
combines Fredholmness, zero winding and scalar invertibility. Park's Proposition
2.7, pp.4–5 (park line 158), states the narrower continuous nowhere-zero case.
Its Hardy-product argument extends as follows: if Tₐf=0 and Tₐ†g=0 with
f,g≠0, then af and conj(a)g have strictly negative modes. The L¹ function
af conj(g) has only strictly negative modes from the first equation and only
strictly positive modes from the second. Fourier uniqueness makes it zero;
boundary uniqueness for f,g forces a=0 almost everywhere, a contradiction.
This proves the stated measurable-symbol alternative. The resulting invertibility
criterion is also Böttcher, Theorem 4.3, p.69 (boettcher-survey line 536).

**Checks.**

- a=0 has both kernels H² and is excluded; for a=z the kernel dimensions are 0,1.
- A nonzero semicircle indicator is an L∞ symbol with zeros on a set of measure
  1/2. Its Toeplitz operator is injective: ⟨f,Tₐf⟩=∫semicircle |f|² and boundary
  uniqueness force f=0. No nowhere-zero assumption is silently inserted.
- I−E₀₀ has kernel and cokernel dimensions 1,1 and index 0 but is not invertible;
  it is a compact perturbation, not a pure scalar Toeplitz counterexample.

*Needs:* §1.2 boundary and Fourier uniqueness, §2.1 adjoint/product formulas,
§3.2 for the continuous-symbol invertibility consequence.

### 3.4 Matrix symbols and finite products

Identify the block shift algebra with the finite matrix algebra over C8's
scalar algebra, acting on the pinned block Hilbert space. Construct its
symbol map to continuous operator-valued circle functions, kernel the
block compact operators, norm/adjoint/quotient and spectral-permanence
comparisons. All block identifications are targets here; C8 supplies the
scalar extension used for their entries. For a continuous matrix symbol
prove Fredholmness iff it is pointwise invertible and index equals minus
the winding of its determinant. Own the determinant index proof: approximate
uniformly by matrix Laurent polynomials through nowhere-singular symbols,
use Fredholm-family and determinant-degree homotopy invariance, and multiply
by z^m to obtain a polynomial matrix Q. Prove det Q≠0 in ℂ[z], then consume `Matrix.exists_mulVec_eq_zero_iff`
and `LinearMap.finrank_range_of_inj` for injectivity and image rank r. Consume
the polynomial PID instance and `Submodule.smithNormalFormOfRankEq`
for this full-rank image, reindexing its full-rank embedding to get the
diagonal form. Transport its image basis back to the domain
and use `Module.Basis.toMatrix` and inverse-basis identities to obtain
Q=U D V with explicit unimodular factors and polynomial inverses.
The nonzero constant det U and det V make ∏d_i a constant multiple
of det Q; prove each Smith entry d_i is nowhere zero on the circle. Prove U, V, U⁻¹ and V⁻¹ are bounded analytic multipliers with constant
determinants; T_U and T_V have inverses T_(U⁻¹) and T_(V⁻¹).
Own the finite Hilbert-product theorem: a block-diagonal bounded
operator on `PiLp 2 (fun i:Fin r=>H_i)` is Fredholm iff each component
is Fredholm, and its index is the sum of their indices. Construct the
bounded block-diagonal map on PiLp. Consume
`ContinuousLinearMap.IsFredholm.prodMap` and `ContinuousLinearMap.index_prodMap`
from `TauCeti/Analysis/Fredholm/Prod.lean`, iterating their binary kernel,
range and quotient comparisons and transporting from finite products to PiLp.
Prove the converse by recovering component quasi-inverses through coordinate
inclusions/projections using `ContinuousLinearMap.isFredholm_iff_exists_isQuasiInverse`.
Include arbitrary finite index sets, possibly empty, and arbitrary complex Hilbert
spaces Hᵢ; no finite-dimensional hypothesis on Hᵢ is imposed. Prove the transported
kernel/cokernel identifications, closed range and dimension formulas.
The diagonal polynomial factors then use the scalar index theorem;
finite direct-sum index additivity gives index mr for z^(−m)I_r, and
Layer 2's analytic product identities account for the z^(−m) factor. Build the
matrix-polynomial, Smith/Toeplitz and determinant comparisons explicitly.
Do not apply scalar Coburn to block symbols.

The matrix symbol map preserves linear operations, products modulo compacts,
adjoint and quotient norm, with compact kernel. Its Fredholm and determinant-index
statements are Park, Theorem 3.1, p.5 (park line 198). The polynomial Smith route
and finite-product converse above are the comparison targets needed by that proof.

**Checks.**

- r=1 recovers the scalar index; the empty finite-product operator is the unique
  invertible operator on zero space, with index and empty index sum both 0.
- S⊕S† has kernel and cokernel dimensions 1,1 and index −1+1=0. Its symbol
  diag(z,z⁻¹) has determinant 1 but the operator is not invertible.
- diag(z²,1) has determinant degree 2, kernel dimension 0 and cokernel dimension
  2, hence index −2; the scalar factor z⁻¹I₂ has index 2.
- The polynomial matrix [[1,z],[0,1]] has polynomial inverse [[1,−z],[0,1]]
  and determinant 1; the zero polynomial matrix fails det Q≠0 and full rank.

*Needs:* §2.3 block carriers and analytic products; §3.1–§3.3; native polynomial
PID, Smith full-rank, matrix/basis comparisons; Tau Ceti binary Fredholm products,
native quasi-inverses and index composition. The Smith basis transport is constructed here.

### Examples

The two fibers of diag(z,z⁻¹) retain opposite scalar indices. Index zero
alone cannot yield the block stability theorem of Layer 5.

### Dependencies

Layers 1–2, CStarAlgebras C1/C8, OperatorKTheory K4, native circle degree and
Fredholm theory, and the pinned Tau Ceti compact-perturbation and binary-product APIs.

## Layer 4: bounded products and stability

### 4.1 Bounded families and quotient stability

For n∈ℕ use the Euclidean operator algebra on ℂ^(n+1), with its operator
norm and finite identity. Use native `lp (fun n => FiniteOperator n) ∞`
and `lp.inftyCStarRing` for bounded families. Consume
[CStarAlgebras C5](../../CStarAlgebras/README.md#c5-c-tensor-products-and-operator-space-tensor-products)'s
norm-null ideal and quotient and
[C1](../../CStarAlgebras/README.md#c1-ideals-hereditary-subalgebras-and-multipliers)'s
quotient C*-norm and spectral permanence, with their evaluation/star/unit APIs.
Prove that the quotient class is invertible iff A_n are eventually invertible
with uniformly bounded inverse norms. Construct both directions explicitly,
allowing arbitrary finitely many initial values and using Neumann estimates.
This criterion applies to all bounded matrix families, before Toeplitz structure.
State the same criterion for an arbitrary ℕ-family of nonzero finite-dimensional
Hilbert spaces with their operator algebras. In particular, block sections
use `EuclideanSpace ℂ (Fin (n+1) × Fin r)`, r≥1, and its operator-norm
bounded product and norm-null quotient, with identity at every n.
Compare r=1 block coordinates with the scalar sequence carrier through
the Hardy Fourier unitary and the unique fiber coordinate. Identify the r=1 block
finite section with the scalar compression of the transported operator under the native
`Fin (n+1) × Fin 1 ≃ Fin (n+1)` equivalence and the unique-index `PiLp`
isometries.

Define `FiniteOperator` with n+1 Euclidean coordinates and `StableSections`
for a family of normed rings by eventual units and an explicit common inverse
bound. The bounded-product application additionally assumes the operator norms
of the family are uniformly bounded (Böttcher, §7, p.82, boettcher-survey line 1037).

- Stability ignores finitely many initial coordinates and is invariant under
  uniformly bounded invertible coordinate changes whose inverses are uniformly bounded.
- The bounded product and quotient have pointwise unit, product and star;
  quotient invertibility is equivalent to stability with the finite identities.
- Scalar/block coordinate transport is isometric and preserves compression,
  adjoints and identities.

**Checks.**

- Aₙ=I is stable with C=1; A₀=0, Aₙ=I for n≥1 has the same quotient class.
- Aₙ=(n+1)⁻¹I consists of units but is not stable: inverse norms n+1 are unbounded.
- The zero family has totalized inverses zero but is not stable, because its
  finite identities are nonzero. Thus inverse bounds alone are insufficient.
- The block identity has norm 1 at r=1 and r=2, independently of n;
  the 2×2 matrix of ones has operator norm 2 and coefficientwise maximum 1.
- The finite operator carriers at n=0,1,2 have Hilbert dimensions 1,2,3;
  block rank 2 gives 2,4,6, with identity norm 1 in every case.

*Needs:* native bounded-product C*-norm; CStarAlgebras C5 norm-null ideal and
C1 quotient; Neumann estimates. The block/scalar comparison also needs §1.1 and §2.3.

### 4.2 Coordinate compressions and condition numbers

For a bounded T on native ℓ² define its finite sections by the first n+1
coordinates; their identity is I_(n+1). Transport to HardySpace using
the Hardy Fourier unitary. Prove the norm bound and strong convergence of the
zero extensions `P_nTP_n→T` and their adjoints to T†. Define condition number on invertible
sections as `κ(A_n)=‖A_n‖‖A_n⁻¹‖`.

Define `coordinateCutoff` as restriction to coordinates 0,…,n;
`finiteSection` is QₙTQₙ†, and `coordinateProjection` is Qₙ†Qₙ. Thus Qₙ=Jₙ†.
Define `finiteInverseExtension` as Qₙ†Aₙ⁻¹Qₙ, using the totalized inverse
outside the invertible tail (Böttcher, §1, pp.58–61, especially equation (5)
and the condition-number definition at boettcher-survey line 190).

- Cutoff and inclusion are adjoints, QₙQₙ†=I, and Pₙ is the orthogonal projection;
  restriction, extension and finite-corner identification preserve coordinates.
- Compression is linear, star preserving and contractive; its zero extensions
  and adjoints converge strongly. It is not multiplicative on arbitrary operators.
- Extended inverses are inverses on the finite corner on the stable tail and
  vanish on its orthogonal complement; κ is defined only on invertible operators.
- On a nonzero finite Hilbert space, κ(A)≥1, κ(A⁻¹)=κ(A†)=κ(A),
  κ(cA)=κ(A) for c≠0, and κ(AB)≤κ(A)κ(B) for invertible A,B.

**Checks.**

- For n=0, Q₀e₀=(1) and Q₀e₁=0; Q₀†(1)=e₀. Doubling the cutoff would give 4I
  for the identity compression and the false inverse norm 1/4.
- For n=1, P₁(e₀+2e₁+3e₂)=e₀+2e₁; both P₁² and P₁† equal P₁.
- For T=2I, Aₙ=2I and its extended inverse is Pₙ/2; for T=0 the totalized
  extension is 0 and is not an inverse on the finite corner. For T=I the
  section is I and its extended inverse is Pₙ.
- The projections P₀,P₁,P₂ send e₀+2e₁+3e₂ to e₀, e₀+2e₁, e₀+2e₁+3e₂;
  these values also pin all cutoff coordinates at sizes 1,2,3.
- κ(2I)=1 and κ(diag(2,1))=2. Singular 0 is excluded, although its totalized
  inverse would give the spurious value 0.

*Needs:* native coordinate evaluations and finite PiLp transport; adjoints,
finite-support density and Hilbert-space projection; §4.1 for stability terminology.

### 4.3 Stable inverse limits and error

Prove that stability of these square finite sections forces T invertible.
Write J_n for the coordinate inclusion, `P_n=J_n J_n†` and
`A_n=J_n† T J_n`. Given an actual eventual bound `‖A_n⁻¹‖≤C`, C>0,
pass the lower bounds for A_n and A_n† to T and T† using the two strong
limits. Prove T has closed range and `ker T†=0`, hence is onto, and
`‖T⁻¹‖≤C`. This argument uses the adjoint limit to prove surjectivity.
For `B_n=J_n A_n⁻¹ J_n†`, prove strong convergence of B_n to T⁻¹ and
of B_n† to `(T⁻¹)†`. Arbitrary finitely many initial choices do not
change these limits. For y=T⁻¹b and x_n=B_n b, prove on the stable tail
`x_n−P_n y=B_n T(1−P_n)y`, hence
`‖x_n−y‖≤(1+C‖T‖)‖(1−P_n)y‖`.
For finite right-hand sides b_n with `J_n b_n→b`, add
`C‖J_n b_n−P_n b‖` to this error bound and deduce convergence of
the corresponding computed solutions. An eventual bound C is specified;
under eventual invertibility, a finite limsup of inverse norms gives such a
bound for every strictly larger positive C.
Compute T=I: B_n=P_n converges strongly to I but `‖B_n−I‖=1`, so
operator-norm convergence is not asserted. The inverse extensions always
have finite rank on the infinite-dimensional ambient space.

The unitary that swaps successive coordinate pairs has singular odd-sized
sections, showing that invertibility of T alone does not establish stability.

The headline signatures are `finiteSections_inverse_convergence`,
`finiteSections_inverse_norm_le` and `finiteSections_solution_error`.
The first two use Böttcher, Propositions 1.1–1.3, pp.60–61
(boettcher-survey lines 159–207). The error identity is the finite-corner inverse
identity applied to T(y−Pₙy); its triangle inequality gives the stated bound.

**Checks.**

- T=I has inverse bound 1, Bₙ=Pₙ, and for b=eₙ₊₁ the error is 1 while the
  stated right-hand side is 2; for b=e₀ both sides are 0. Norm convergence fails.
- For T=2I, C=1/2 and b=eₙ₊₁, the error is 1/2 and the bound is 1;
  the inherited inverse norm is exactly 1/2.
- Swapping successive pairs gives at n=0 the zero 1×1 section, at n=1 the
  invertible exchange matrix, and at n=2 a singular 3×3 section. Invertibility
  of the ambient unitary does not imply stability.
- With T=I and Jₙbₙ=Pₙb+εe₀, the added right-hand-side error has norm |ε|;
  the coefficient C=1 bounds it exactly.

*Needs:* §4.2 strong compression and adjoint limits; the stable-tail bound;
closed-range/inverse theorems for Hilbert operators. No Toeplitz symbol is required.

### Examples

The identity exhibits strong but not norm convergence of the extended inverses;
the pair-swap unitary exhibits failure of the converse to ambient invertibility.

### Dependencies

Native ℓ², finite Euclidean spaces and adjoints; CStarAlgebras C1/C5 for §4.1;
Layers 1–2 only for the Hardy/block transports.

## Layer 5: continuous Toeplitz finite sections

### 5.1 Reflection, classical Hankel operators and the section algebra

Define `hardyCutoff` by the first n+1 inner products with `hardyMonomial`,
and `toeplitzSection` by its compression of `toeplitz`. These are the same
finite matrices as the sequence model under the Hardy Fourier unitary.

- Hardy cutoff and its adjoint give the isometric finite monomial inclusion;
  its coordinate formula is âₓ(i), and Toeplitz section entries are â(i−j).
- Section transport preserves norm, adjoint, unit and stability; r=1 block
  sections agree with scalar sections.

**Checks.**

- Hardy cutoff at n=0 sends e₀ to (1) and e₁ to (0).
- At n=1 it sends e₀+2e₁+3e₂ to (1,2), with Euclidean norm √5.
- The first two-coordinate section of T_z is [[0,0],[1,0]], while that of
  T_(z⁻¹) is [[0,1],[0,0]], excluding a transposed convention. Constant 2 gives 2I.
- At n=2 the Hardy cutoff of e₀+2e₁+3e₂ is (1,2,3); its adjoint includes
  those same coefficients, excluding a missing last coordinate.

*Needs:* §1.1 Hardy coefficients, §2.1 and §4.2 coordinate compression.

Let P_n select the first n+1 coordinates and W_n reverse those coordinates,
zero on the complement. Construct the norm-closed finite-section algebra
generated by `(P_n T_a P_n)_n` for continuous a and norm-null families.
Prove its representation formula
`A_n=P_n(T_a+K)P_n+W_n L W_n+G_n`, with compact K,L and ‖G_n‖→0.
This is an equation after the finite matrix's zero extension
`E_n(A_n)=J_n A_n J_n†` to ℓ², with J_n the first-n+1 coordinate
isometry; prove compression/extension are mutually inverse on that corner.
Define the classical Hankel operator C_a on ℓ² with entries hat(a)(i+j+1).
Pin the flip J:(H²)⊥→H² by e_(−n−1)↦e_n, so `J H_a=C_(a(−t))`.
Prove Widom's finite-product identity
`T_n(ab)=T_n(a)T_n(b)+P_n C_a C_(b(−t)) P_n+W_n C_(a(−t)) C_b W_n`.
Prove W_n→0 weakly, `‖K W_n L‖→0` for compact K,L and
`W_n P_n K P_n W_n→0` strongly for compact K. These give closure
of the representation formula under multiplication together with
`‖K(I−P_n)‖→0`, `‖(I−P_n)K‖→0`, `W_n²=P_n` and
`W_n T_n(a) W_n=T_n(a(−t))`. Prove existence by
Laurent-polynomial products and closure, uniqueness of
a,K,L, and the actual strong-limit homomorphisms
`W(A)=T_a+K`, `W_reflected(A)=T_(a(−t))+L`.
Define them as the strong limits of E_n(A_n) and
W_n E_n(A_n) W_n respectively, and prove multiplicativity from strong limits and uniform norm bounds,
and star-preservation from the corresponding strong adjoint limits.
For R=limsup‖A_n‖ prove `‖a‖∞≤R`, `‖T_a+K‖≤R`,
`‖T_(a(−t))+L‖≤R`, and consequently `‖K‖,‖L‖≤2R`.
These estimates make the representation class norm closed. Construct the
independent compact boundary remainders from the shift-product defects,
first finite matrix units at each end and then their norm closures; this
proves every compatible pair lies in the pair map's image.

The reflection, classical Hankel and finite-section-algebra APIs include:

- Reflection is self-adjoint, squares to Pₙ, has zero tail, and conjugates
  finite Toeplitz sections to reflected-symbol sections. Its block version
  preserves each fiber index.
- The classical Hankel map has entries â(i+j+1), is bounded and linear in a,
  and compares with complement-valued H by the specified unitary flip.
- The section algebra contains the generators and norm-null ideal, is closed
  under product and adjoint, and has the displayed representation and two
  strong-limit star homomorphisms. The compatible symbols determine a uniquely;
  the two compact remainders are independent and uniquely determined.

The product identity is Böttcher, §8, equation (31), p.83
(boettcher-survey line 1105); the reflection identities are equation (32), p.84.
The representation is Theorem 8.3, p.86 (boettcher-survey line 1193), with
boundary ideals in Theorem 8.1, pp.84–85. The explicit estimates above prove the
closure and uniqueness needed for this presentation.

**Checks.**

- W₀e₀=e₀, W₀e₁=0; W₁e₀=e₁, W₁e₁=e₀ and W₁e₂=0. Thus W₁²=P₁,
  not the ambient identity. For blocks, e₀⊗v goes to e₁⊗v without changing v.
- C_z=E₀₀, C_(z⁻¹)=0, and C_(z²)e₀=e₁; the coefficient is i+j+1.
- For a=z,b=z⁻¹ the finite product is I−E₀₀ and the left Hankel correction
  is E₀₀; reversing a,b gives I−Eₙₙ with right correction Eₙₙ. Each sum is I.
- The family PₙE₀₀Pₙ has limits (E₀₀,0), whereas WₙE₀₀Wₙ has limits
  (0,E₀₀). Neither nonzero boundary ideal is norm null: both norms are 1.
- A norm-null family has representation a=K=L=0 and itself as G; a constant
  symbol 2 has a=2,K=L=G=0, with both limits 2I and R=2.

*Needs:* §2.2–§2.3 ordered products, §3.1 shift algebra, §4.1–§4.2;
compact finite-rank approximation, the reflection identities and bounds of this section.

### 5.2 Compatible pairs and stability

Identify the quotient by norm-null families with the pairs in the shift
algebra having these compatible reflected symbols. Prove the pair map
injective. Apply C1 spectral permanence both to this quotient's embedding
in Layer 4's bounded-product quotient and to the shift algebra in B(H²);
this proves the pair image inverse closed and detects all
finite-section obstructions. Deduce stability iff both limiting operators
are invertible. For pure continuous scalar Toeplitz sections, obtain stability
iff a is nowhere zero with winding number 0 by Layer 3. Give uniform inverse bounds
and convergence of the computed solutions. For matrix-valued continuous
symbols use the pinned block Hilbert carrier and the first n+1 block
projection. Pin reflection by `(W_n x)_(i,α)=x_(n−i,α)` for i≤n and
zero otherwise: it reverses block positions and preserves the fiber index α.
Use the block finite carrier and bounded-product quotient from Layer 4
and Layer 2/Layer 3's block APIs. Prove Widom's identity in ordered matrix products,
the block compact remainder representation, both strong-limit homomorphisms,
closedness/uniqueness and the same quotient comparison. Prove stability requiring
both matrix Toeplitz limit operators invertible; determinant winding alone
does not replace those conditions.

The pair quotient map preserves product, adjoint, unit and norm, has kernel
exactly the norm-null ideal, and is onto the pairs with reflected compatible
symbols. The strong limits and two-limit criterion are Böttcher, §9,
equations (45)–(46), p.89 and Theorem 9.2, pp.90–92
(boettcher-survey lines 1390 and 1424). Its continuous scalar specialization is
`continuousToeplitzSections_stable`. The finite-block extension preserves ordered
matrix multiplication (Böttcher–Silbermann, *Large Truncated*, §6.2).

**Checks.**

- Symbol 2 gives two invertible limits 2I and inverse bound 1/2; z gives S,S†,
  singular finite sections and winding 1.
- The pair (I,I−E₀₀) has compatible symbols 1,1 but fails invertibility in
  the second component; the representing family I−Eₙₙ is singular for every n.
- diag(z,z⁻¹) has determinant degree 0, yet both block limits have nonzero
  kernels or cokernels and every block finite section is singular.
- A norm-null perturbation of the identity has both limits I and is stable,
  even when one of its finitely many initial sections is zero.

*Needs:* §5.1 representation, boundary ideals and strong adjoint limits;
CStarAlgebras C1 spectral permanence; §4.1 quotient stability and §4.3 inverse
convergence; §3.3 only for reducing the scalar criterion to winding zero.

### Examples

The distinct end defects E₀₀ and Eₙₙ explain why two limit operators are needed.
The matrix diag(z,z⁻¹) explains why determinant winding is not a block replacement.

### Dependencies

Layers 2–4, CStarAlgebras C1 and the finite-section algebra constructed in §5.1.
No general Toeplitz or block criterion is assumed in proving that algebra's structure.

## Layer 6: explicit checks and ordering

### 6.1 Symbols and coefficient examples

Compute shifts, adjoints, constant symbols and Laurent monomials in both
index conventions. For the block symbol diag(z,z̄), prove determinant 1 and
winding 0 but `T_A=S⊕S†` is not invertible, despite Fredholm index 0; its
pure finite sections are singular. This supplies the determinant-winding
counterexample to stability. For the symmetric coefficients `c_n=1/(|n|+1)`, prove
the L² function with these Fourier coefficients is not essentially bounded,
using the finite constant-vector logarithmic lower bound, and leading compression norms
are unbounded; the matrix therefore has no bounded ℓ² extension. For
`c_0=0`, `c_n=sgn(n)/(|n|+1)` when n≠0, compare the bilateral kernel
with 1/n. Its ℓ¹ difference has norm 2, and the discrete Hilbert-transform
multiplier has norm π; prove the Toeplitz compression bound π+2.

The coefficient computations use the matrix criterion of §2.1 (Böttcher,
Theorem 4.1, p.67) and the elementary Fourier series
Σₙ≥₁ sin(nθ)/n=(π−θ)/2 for 0<θ<2π, in L². For the even coefficients,
the normalized all-ones vector of length N gives
1+2Σₖ₌₁ᴺ⁻¹(1−k/N)/(k+1), which tends to infinity. For the odd coefficients,
Σₙ≠₀ |sgn(n)/(|n|+1)−1/n|=2Σₙ≥₁1/(n(n+1))=2. These calculations
specify the unbounded and bounded cases without an executable procedure.

**Checks.**

- The even-kernel Rayleigh quotients at N=1,2,3 are 1,3/2,17/9.
- The odd-kernel 2×2 matrix in the cⱼ₋ᵢ convention is [[0,1/2],[−1/2,0]],
  of norm 1/2, consistent with the global bound π+2.
- The partial ℓ¹ differences through ±1 and ±2 are 1 and 4/3; their limit is 2.

*Needs:* §1.1 Fourier expansion, §2.1 matrix boundedness, §3.4 block index and
§5.2 stability. The sine-series identity follows by radial geometric-series
integration and L² convergence.

### Examples

Positive even coefficients have unbounded compression norms; cancellation in
the odd coefficients gives a bounded Toeplitz operator. The two tests distinguish
coefficient decay from the actual bounded-symbol criterion.

### Dependencies

Layers 1–5 and scalar geometric-series integration; no computational algorithms.

## Downstream consumers

OperatorTheory uses this Hardy-space and finite-section library. OperatorKTheory
K6 uses the Hardy projection and index sign in circle pairings; its K4 input to
this roadmap is only the earlier generic Calkin comparison. Applications to
finite-dimensional approximation consume §4.3 and §5.2 with their stated
stability hypotheses, rather than assuming ambient invertibility suffices.

## References

- E. Park, *Toeplitz operators*, TCU seminar notes (2016),
  [institutional text](https://faculty.tcu.edu/richardson/Seminars/EftonToeplitz_2016.pdf).
  §1, pp.1–2; Proposition 2.2, p.3; Theorem 2.3, Corollary 2.4, Theorem 2.5,
  Lemma 2.6 and Proposition 2.7, pp.4–5; Theorem 3.1, p.5. Source key: park.
- A. Böttcher, *C*-Algebras in Numerical Analysis*, Irish Math. Soc. Bulletin
  45 (2000), 57–133,
  [publisher open text](https://www.irishmathsoc.org/bull45/S4502.pdf).
  Propositions 1.1–1.3, pp.60–61; Theorem 4.1 and Proposition 4.2, pp.67–68;
  Theorems 4.3–4.4, p.69; §6, pp.77–79; §7, p.82; equation (31), p.83;
  Theorems 8.1 and 8.3, pp.84–86; Theorem 9.2, pp.90–92.
  Source key: boettcher-survey. Indices starting at 1 there are shifted to 0 here.
- A. Böttcher and B. Silbermann, *Analysis of Toeplitz Operators*, second
  edition, Springer (2006), Chapters 2 (pp.45–109) and 7 (pp.323–407),
  [publisher](https://doi.org/10.1007/3-540-32436-4).
  Source key: boettcher-silbermann-analysis; chapter locators are uncertified.
  Numbered results from the 1990 edition quoted inside Böttcher's survey are
  not used as theorem numbers for this second edition.
- A. Böttcher and B. Silbermann, *Introduction to Large Truncated Toeplitz
  Matrices*, first edition, Springer (1999), §§2.1–2.5 and §§6.1–6.2,
  [publisher](https://doi.org/10.1007/978-1-4612-1426-7).
  Source key: boettcher-silbermann-truncated; these section locators are uncertified.
- D. Jerison, *Fourier Series, Continued (part 3)*, MIT 18.103 notes (2013),
  Theorem 1, pp.2–3 and Corollary 1, p.3,
  [author text](https://math.mit.edu/~jerison/103/handouts/fseries3.pdf).
  Source key: jerison-fejer; the period-2π formulas use normalized measure,
  so the period-one transport preserves the coefficients and norms.
- J. Xia, *Traces, Indices and Spectral Theory of Toeplitz Operators on Multiply
  Connected Domains*, PhD thesis, Stony Brook (1983), §I.2, Theorem I.2.1, p.24,
  [institutional text](https://www.math.stonybrook.edu/alumni/1983-Jingbo-Xia.pdf).
  Source key: xia-hardy. The disk specialization uses harmonic measure at zero.
- J. B. Conway, *A Course in Functional Analysis*, second edition, Springer
  (1990), Chapter I (Hilbert-space background),
  [publisher](https://doi.org/10.1007/978-1-4757-4383-8).
  Source key: conway; this background locator is uncertified.
