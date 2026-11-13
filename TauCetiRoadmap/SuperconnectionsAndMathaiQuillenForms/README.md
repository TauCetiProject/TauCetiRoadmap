# Roadmap: superconnections, Quillen's character forms and Mathai–Quillen forms

**Summary.** Build Quillen's ℤ/2-graded Chern–Weil theory in two tiers. The algebraic tier works
on Mathlib's carriers: `ZMod 2`-graded algebras `GradedAlgebra 𝒜` with `𝒜 : ZMod 2 → Submodule R
A` over a commutative ring `R`, the super tensor product `A ⊗̂ End(R^(m|n))` written on matrices
`Matrix (m ⊕ n) (m ⊕ n) A` with the Koszul sign rule, Mathlib's exterior algebra, and complex
matrices. Its end theorems are: the exterior algebra is supercommutative, the product of
`A ⊗̂ End(R^(m|n))` is associative and adds parities, and on a supercommutative `A` the supertrace
satisfies `str(XY) = (-1)^(|X||Y|) str(YX)` for homogeneous `X`, `Y` (Layer 1); for a
supercommutative differential graded algebra `(A, d)` and an odd supermatrix `Θ`, the curvature
`F = dΘ + Θ²` of `d + Θ` satisfies the Bianchi identity, every `str(F^k)` is closed, and an even
derivation `∂` commuting with `d` satisfies `∂ str(F^(k+1)) = (k + 1) d str((∂Θ) F^k)`; for every
complex `n × m` matrix `T` and `t ∈ ℂ`, `tr exp(−t T*T) − tr exp(−t TT*) = m − n`; and Duhamel's
formula `d/dt exp(F(t)) = ∫₀¹ exp(sF(t)) F′(t) exp((1 − s)F(t)) ds` in a real Banach algebra
(Layer 2); the Berezin integral on `Λ(Rⁿ)` multiplies by `det f` under `Λ(f)`, the Pfaffian
defined as a Berezin integral satisfies `Pf(Σ)² = det Σ` and `Pf(BΣBᵀ) = det B Pf(Σ)` for skew
`Σ` over a commutative `ℚ`-algebra, and the standard Gaussian density on `ℝʳ` has integral `1`
(Layer 3); for a skew-adjoint complex supermatrix `X`, `1 − X` is invertible, the Cayley transform
`g = (1 + X)(1 − X)⁻¹` is unitary, and `εgε = g⁻¹` when `X` is odd (Layer 6). The bundle tier
states the same theorems for smooth ℤ/2-graded vector bundles over a smooth manifold `M`: the
Chern character form `φ str exp(−𝔸²)` of a superconnection is closed, its class is independent of
`𝔸` and equals `ch(E⁺) − ch(E⁻)`, the character of `∇ + tX` is exact where `X` is invertible and
tends to the character of `ker X` when that kernel has constant rank (Layer 4); the Mathai–Quillen
Euler form `e_(∇,s)` of a section `s` of an oriented Euclidean bundle is closed, equals the
Pfaffian form at `s = 0` and represents the Poincaré dual of `s⁻¹(0)` for transverse `s`, which
gives `∫_M Pf(R/2π) = Σ ind = χ(M)` for the tangent bundle, and the Thom form `τ_∇` on the total
space is closed, Gaussian on the fibres with fibre integral `1`, pulls back to `e_(∇,s)` along `s`
and represents the Thom class (Layer 5); the invariant character forms `tr(F(dF)^(2k))` on the
manifold of self-adjoint involutions and `tr((g⁻¹dg)^(2k−1))` on the unitary group are closed and
invariant, the even ones representing a multiple of the Chern character of the tautological bundle
(Layer 6).

Suggested home: `TauCeti/Algebra/Super/` for Layers 1–3 and 6.1, and
`TauCeti/Geometry/Manifold/Superconnection/` for Layers 4, 5, 6.2.

## Scope and ownership

**Owned here.** The supertrace on `A ⊗̂ End(R^(m|n))` and its graded-trace property, the parity
involution and supercommutativity predicate on `ZMod 2`-graded algebras (Layer 1); Quillen's
algebraic model of superconnections on a supercommutative differential graded algebra, the
closedness of the components of the character, the algebraic transgression formula, the
finite-dimensional McKean–Singer identity and Duhamel's formula (Layer 2); the Berezin integral on
`Λ(Rⁿ)`, the Pfaffian of a skew matrix as a Berezin integral with its two identities, and the
normalization of the Gaussian density (Layer 3); superconnections on smooth ℤ/2-graded vector
bundles, their Chern character forms, transgression forms and the character of `∇ + tX` (Layer
4); the fibrewise Berezin integral, the Mathai–Quillen Euler and Thom forms, their localization on
the zero set of a transverse section and the de Rham Poincaré–Hopf identity they give (Layer 5);
the graded Cayley transform and the invariant character forms on Grassmannians and unitary groups
(Layer 6). A search of the roadmaps on main, of the open pull requests and of the maintainers'
packages for superconnection, supertrace, supermatrix, Berezin integral, Mathai–Quillen, Thom
form, Quillen's character and the Cayley transform of a graded space finds no other owner. The
supercommutative algebras of SymplecticFieldTheory (§0.3, the free supercommutative algebra on a
graded ℚ-module) and of HopfologicalAlgebra (the exterior Hopf superalgebra) are particular
algebras, not the supertrace or the super tensor product with endomorphisms;
MotivesAndAlgebraicCycles and SchubertGeometry use alternating traces on graded cohomology, the
case `A = R` of 1.3.

**Left to CharacteristicClasses.** The Chern–Weil forms of ordinary connections, their
closedness, connection independence by the transgression form, and the Chern character and
Pfaffian forms with their normalizations `ch(F) = tr exp((i/2π)F)`, `Pf([[0,a],[−a,0]]) = a`
(CharacteristicClasses C4, items 1–2, and Conventions); the Thom class `U_E` (C2, item 1), the
Euler class of a transverse section as the Poincaré dual of its oriented zero locus, the
sum-of-local-indices formula and `e(TM)[M] = χ(M)` (C2, item 3), and fibre integration with the
compact-support de Rham comparison (C2, item 5). Layers 4 and 5 compare their forms with these
classes and restate none of them.

**Left to DifferentialGeometry and SmoothBundlesConnections.** Differential forms, the wedge and
the exterior derivative (DifferentialGeometry Layers 0–1), orientations (Layer 2), integration and
Stokes' theorem (Layer 5) and de Rham cohomology (Layer 6); connections on vector bundles
associated with principal bundles (SmoothBundlesConnections B3.3), the exterior covariant
derivative on bundle-valued forms, curvature and the Bianchi identity (B4.1). Layer 4 is the
ℤ/2-graded extension of B4.1, built on its bundle-valued forms.

**Left to OperatorTheory/SelfAdjointSpectralTheory.** The Cayley transform `U_A = (A − i)(A + i)⁻¹`
of a self-adjoint operator and its unitarity (SelfAdjointSpectralTheory SA-D24, SA-D27). For a
skew-adjoint `X` the transform of 6.1 is `g = −U_(−iX)` (Convention 5); 6.1 keeps the matrix
adapter and the graded statement `εgε = g⁻¹`, which SA-D24 does not contain.

**Supplied by Mathlib and consumed by name.** Graded algebras and their decompositions, the
exterior and Clifford algebras with the even–odd grading, exterior powers and alternating maps,
determinants, block matrices, the conjugate transpose and the unitary group, the exponential of a
Banach algebra, derivatives and interval integrals.

**Out of scope.** Determinant line bundles of Fredholm families and the Quillen metric
(HeegaardFloer F0.0 owns determinant lines of Fredholm families); Bismut's superconnection for
families of Dirac operators and the local families index theorem (Bismut 1986; Berline–Getzler–
Vergne, Ch. 10), which need heat kernels of fibrewise Dirac operators owned by no roadmap; the
Mathai–Quillen character form of the Atiyah–Bott–Shapiro Thom class in K-theory, which needs
spinor bundles of SpinGeometry; equivariant Thom forms in the Cartan model; Quillen's comparison
of superconnection character forms with pulled-back invariant forms, and its extension to the
Schatten-class Grassmannians and unitary groups of a Hilbert space (Quillen 1988); the Connes–Chern
character in cyclic homology, which is NoncommutativeGeometry's (N1–N2).

## Conventions

1. **The super tensor product.** A matrix `X : Matrix (m ⊕ n) (m ⊕ n) A` represents
   `∑ X k l ⊗ E k l` in `A ⊗̂ End(R^(m|n))`, the basis vectors indexed by `m` even and those by
   `n` odd, `|k|` their parity (`sPar`). The product is Quillen's
   `(a ⊗ u)(b ⊗ v) = (−1)^(|u||b|) ab ⊗ uv`, which on matrices reads
   `(X ⋆ Y) k l = ∑ j, X k j σ^(|k| + |j|)(Y j l)`, `σ` the parity involution, and the
   supertrace is `str(a ⊗ u) = a str(u)`, so `str X = ∑ᵢ X i i − ∑ⱼ X j j` (even block minus odd
   block), with no sign depending on the parity of `X`, and `str(dX) = d str(X)` for the entrywise
   differential. Witness: over `A = ℤ` with `m = n = 1`, the odd supermatrices `X = E₁₂` and
   `Y = E₂₁` have `X ⋆ Y = E₁₁` and `Y ⋆ X = E₂₂`, so `str(X ⋆ Y) = 1 = (−1)^(1·1) str(Y ⋆ X)`;
   the ordinary trace gives `tr(XY) = tr(YX) = 1`, and the supercommutator `XY + YX = 1` has
   supertrace `0` and trace `2`. Berezin's supermatrix convention, in which the odd block of an
   odd matrix enters with a plus sign, gives the same supertrace on even supermatrices and is not
   used: it does not commute with the entrywise differential.
2. **Superconnections and their character.** In Layers 2 and 4 the curvature of `𝔸 = d + Θ` is
   `𝔸² = dΘ + Θ²`, and the Chern character form is `ch(𝔸) = φ str exp(−𝔸²)`, where `φ`
   multiplies forms of degree `2k` by `(2πi)^(−k)` (Berline–Getzler–Vergne, §1.4). For a
   connection `∇` on an ungraded bundle this is `tr exp((i/2π)F)`, CharacteristicClasses'
   normalization. Witness: on a line bundle with curvature `F = i dα` (CharacteristicClasses,
   Conventions), `φ(−F) = −i dα/(2πi) = −dα/2π` and `(i/2π)F = −dα/2π` agree; omitting `φ`
   would give `−i dα`, which is not real.
3. **The odd endomorphism.** In 2.5 and 4.4, `X = [[0, T*], [T, 0]]` is odd and self-adjoint,
   `T : E⁺ → E⁻`, so `X² = diag(T*T, TT*) ≥ 0` and `exp(−tX²)` decays as `t → ∞` where `T` is
   invertible. Witness: for `T = (a) : ℂ → ℂ`, `str exp(−tX²) = e^(−t|a|²) − e^(−t|a|²) = 0`, and
   for `T : ℂ⁰ → ℂ` (so `m = 0`, `n = 1`) it is `−1 = m − n`. Quillen's skew-adjoint form
   `[[0, −T*], [T, 0]]` and writes the character with `exp(𝔸²)`; in degree zero the two agree,
   `exp((iX)²) = exp(−X²)`, and `iX` is of Quillen's form for `iT`.
4. **Berezin integral and orientation.** `∫_B` is the coefficient of `e₀ ∧ ⋯ ∧ e_(n−1)` in the
   top-degree component (Wu 2006, §2.1), and the Pfaffian is `Pf(Σ) = ∫_B exp(∑_(i<j) Σᵢⱼ eᵢeⱼ)`,
   in which only `ω^r / r!` reaches the top degree. Witness: `Pf([[0, a], [−a, 0]]) = a`, as in
   CharacteristicClasses' Conventions; reversing the orientation (`e₁ ∧ e₀`) gives `−a`. The
   Mathai–Quillen forms carry the factor `(−1)^(r(r+1)/2) (2π)^(−r/2)` (Wu 2006, (2.5) and (2.7)),
   which makes the fibre form exactly the Gaussian density: on `ℝʳ` with `∇ = d`,
   `∫_B exp(−∑ dxᵢ eᵢ)` is `(−1)^r (−1)^(r(r−1)/2) dx₁ ⋯ dx_r = (−1)^(r(r+1)/2) dx₁ ⋯ dx_r`
   (`r = 1`: `−dx₁`; `r = 2`: `−dx₁dx₂`), and the prefactor cancels the sign.
5. **The Cayley transform.** `g = (1 + X)(1 − X)⁻¹` for skew-adjoint `X`, so `g = 1` at `X = 0`
   and `g = −U_(−iX)` with SelfAdjointSpectralTheory's `U_A = (A − i)(A + i)⁻¹`. Witness: at
   `X = 0`, `U_0 = (−i)(i)⁻¹ = −1`, so `−U_0 = 1 = g`; for `X = (iθ)` on `ℂ`,
   `g = (1 + iθ)/(1 − iθ)`, of modulus `1`, and `g = −1` is never reached.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Graded algebras: `GradedAlgebra`, `DirectSum.decompose`, `DirectSum.decomposeLinearEquiv`,
  `DirectSum.component` (`RingTheory/GradedAlgebra/Basic`, `Algebra/DirectSum/Decomposition`,
  `Algebra/DirectSum/Module`), `ZMod`, `Submodule`.
- Exterior and Clifford algebras: `ExteriorAlgebra`, `ExteriorAlgebra.ι`, `ExteriorAlgebra.map`,
  the exterior powers `⋀[R]^i M` (`ExteriorAlgebra.exteriorPower`) and the instance
  `ExteriorAlgebra.gradedAlgebra` (`LinearAlgebra/ExteriorAlgebra/Basic`, `…/Grading`),
  `exteriorPower.alternatingMapLinearEquiv` (`LinearAlgebra/ExteriorPower/Basic`),
  `CliffordAlgebra.evenOdd` with its instance `CliffordAlgebra.gradedAlgebra`
  (`LinearAlgebra/CliffordAlgebra/Grading`), `QuadraticForm`.
- Linear algebra: `Basis.det`, `Pi.basisFun`, `LinearMap.det`, `Matrix.det`, `Matrix.trace`,
  `Matrix.trace_mul_pow_comm_of_ne_zero` (`LinearAlgebra/Matrix/Trace`),
  `Matrix.map`, `Matrix.fromBlocks`, `Matrix.conjTranspose`, `Matrix.unitaryGroup`, `Pi.single`.
- Analysis: `NormedSpace.exp` (`Analysis/Normed/Algebra/Exponential`), `HasDerivAt`,
  `intervalIntegral`, `MeasureTheory.integral`, `EuclideanSpace`, `Real.exp`, `Real.pi`.

**From Tau Ceti.** Nothing is consumed from the Tau Ceti library.

**From CharacteristicClasses.** Conventions (the normalization of Chern character and Pfaffian
forms), for Conventions 2 and 4; C4, items 1–2 (Chern–Weil forms of connections, closedness,
transgression, the Chern character form, the Pfaffian form), for 4.3 and 5.1; C2, item 1 (the
Thom class `U_E`), for 5.4; C2, item 3 (the Euler class of a transverse section, the
sum-of-local-indices formula, `e(TM)[M] = χ(M)`), for 5.3; C2, item 5 (fibre integration and the
compact-support de Rham comparison), for 5.4.

**From DifferentialGeometry.** Layer 0 (differential forms and the wedge), Layer 1 (the exterior
derivative), Layer 2 (orientations), Layer 5 (integration and Stokes' theorem), Layer 6 (de Rham
cohomology), for Layers 4 and 5 and 6.2.

**From SmoothBundlesConnections.** B3.3 (induced connections on associated vector bundles) and
B4.1 (bundle-valued forms, the exterior covariant derivative, curvature, Bianchi), for 4.1–4.2.

**From OperatorTheory/SelfAdjointSpectralTheory.** SA-D24 (the Cayley transform) and SA-D27 (its
unitarity), for 6.1.

## How to read the build

Layer 1 is linear algebra over a `ZMod 2`-graded algebra: supercommutativity, the super tensor
product `A ⊗̂ End(R^(m|n))` on matrices and the supertrace. Layer 2 is Quillen's algebraic model:
a supercommutative differential graded algebra plays the forms on `M`, an odd supermatrix plays
`𝔸 − d` on a trivialized bundle, and the closedness and transgression of the character are proved
for every component `str(F^k)`; the degree-zero McKean–Singer identity and Duhamel's formula supply
the exponential. Layer 3 builds the Berezin integral and the Pfaffian, the algebra of the
Mathai–Quillen forms. Layers 4 and 5 transport Layers 1–3 fibrewise to smooth bundles over the
carriers of DifferentialGeometry and SmoothBundlesConnections and compare the resulting classes
with CharacteristicClasses: Layer 4 for superconnections and Quillen's character of `∇ + tX`, Layer
5 for the Mathai–Quillen Euler and Thom forms. Layer 6 treats the graded Cayley transform, whose
algebra (6.1) uses only Mathlib, and the invariant character forms on Grassmannians and unitary
groups (6.2), which use Layers 4 and DifferentialGeometry.

## Layer 1: superalgebras, supermatrices and the supertrace

### 1.1 Supercommutative algebras

Define `IsSuperCommutative 𝒜` for `𝒜 : ZMod 2 → Submodule R A`: homogeneous `a ∈ 𝒜 i`,
`b ∈ 𝒜 j` satisfy `ab = (−1)^(ij) ba`; the parity involution `parityInv 𝒜`,
`a₀ + a₁ ↦ a₀ − a₁` through `DirectSum.decompose`, and its powers `parityPow 𝒜 k` for `k : ZMod 2`.
Prove `isSuperCommutative_exteriorAlgebra`: the exterior algebra, graded by the parity of the
degree (`CliffordAlgebra.evenOdd` of the zero quadratic form), is supercommutative, over every
commutative ring (Quillen 1985; Berline–Getzler–Vergne, §1.3). Route: check it on products of
generators, where `ι m ι m′ = −ι m′ ι m`, and extend by bilinearity and induction on length.
*Needs:* Mathlib `GradedAlgebra`, `DirectSum.decompose`, `CliffordAlgebra.evenOdd`,
`ExteriorAlgebra`, `QuadraticForm`.

**Checks.**

- In `Λ(R²)`, `e₀e₁ = −e₁e₀` (both odd, sign `−1`) and `e₀ (e₀e₁) = 0 = (e₀e₁) e₀` (odd times
  even, sign `+1`); a definition with the ungraded commutator would require `e₀e₁ = e₁e₀`,
  which fails over `ℤ`.
- `parityInv` is `1` on `𝒜 0` and `−1` on `𝒜 1`: on `Λ(R²)` it sends `1 + e₀ + e₀e₁` to
  `1 − e₀ + e₀e₁`; Mathlib's `CliffordAlgebra.involute` does the same, while `reverse` sends
  `e₀e₁` to `−e₀e₁`, so `reverse` is not the parity involution.
- The ℕ-grading of the exterior algebra is not used: supercommutativity needs only the parity,
  and `ℤ`, graded by `𝒜 0 = ⊤`, `𝒜 1 = ⊥`, is supercommutative; the matrix algebra `M₂(ℤ)`,
  trivially graded, is not.

### 1.2 The super tensor product with endomorphisms

Define the parity `sPar` of `m ⊕ n` (`0` on `m`, `1` on `n`), the product `superMul 𝒜 X Y` of
Convention 1, `(X ⋆ Y) k l = ∑ j, X k j σ^(|k| + |j|)(Y j l)`, and `IsSuperHomogeneous 𝒜 p X`:
every entry `X k l` lies in `𝒜 (p + |k| + |l|)`. Prove `superMul_assoc` and
`IsSuperHomogeneous.superMul` (parities add), the matrix form of the associativity of the super
tensor product `A ⊗̂ End(R^(m|n))` (Quillen 1985; Berline–Getzler–Vergne, §1.3). Route: `σ` is an
algebra automorphism with `σ² = 1`, so the two triple sums agree term by term.
*Needs:* 1.1; Mathlib `Matrix`, `GradedAlgebra`.

**Checks.**

- For `A` trivially graded, `σ = 1` and `superMul` is the matrix product.
- The Koszul sign: over `A = Λ(R¹)` with generator `e` and `m = n = 1`, the odd supermatrices
  `E₂₁` (entry `1` at `(inr, inl)`) and `e E₁₁` give `E₂₁ ⋆ e E₁₁ = σ(e) E₂₁ = −e E₂₁`, Quillen's
  `(1 ⊗ E₂₁)(e ⊗ E₁₁) = (−1)^(1·1) e ⊗ E₂₁`; the matrix product would give `+e E₂₁`.
- In the other order, `e E₁₁ ⋆ E₁₂ = e E₁₂` with no sign, since `σ^(|1| + |1|) = σ⁰`.
- The identity matrix is homogeneous of parity `0` and a two-sided unit of `superMul`, since
  `σ(1) = 1`; `E₁₂` is homogeneous of parity `1`, and `e E₁₂` of parity `0`.

### 1.3 The supertrace

Define `superTrace X = ∑ᵢ X i i − ∑ⱼ X j j`, the even diagonal block minus the odd one. Prove
`superTrace_superMul_comm`: on a supercommutative `A`, for `X` of parity `p` and `Y` of parity
`q`, `str(X ⋆ Y) = (−1)^(pq) str(Y ⋆ X)`, so the supertrace vanishes on supercommutators
(Quillen 1985; Berline–Getzler–Vergne, §1.3; Wu 2006, §2.3). Route: compare the terms
`X k l σ^(|k|+|l|)(Y l k)` and `Y l k σ^(|k|+|l|)(X k l)`; supercommutativity of the entries, of
parities `p + |k| + |l|` and `q + |k| + |l|`, gives the sign `(−1)^(pq + |k| + |l|)`, which the
signs `(−1)^(|k|)` and `(−1)^(|l|)` of the supertrace turn into `(−1)^(pq)`.
*Needs:* 1.1, 1.2.

**Checks.**

- Convention 1's witness: `str(E₁₂ ⋆ E₂₁) = 1`, `str(E₂₁ ⋆ E₁₂) = −1`, `p = q = 1`.
- `str 1 = m − n`, not `m + n`: the identity is even and its odd block enters with a minus sign.
- Supercommutativity is needed: over the trivially graded `A = M₂(ℤ)` with `m = 1`, `n = 0`,
  `X = (a)`, `Y = (b)` give `str(XY) − str(YX) = ab − ba ≠ 0` for non-commuting `a`, `b`.
- `str` preserves parity: for `X` of parity `p` the diagonal entries lie in `𝒜 p`, so `str X`
  does; for `A = Ω(M)` this is the statement that `str : Ω(M, End E) → Ω(M)` maps even
  forms to even forms.

### Examples

- `A = R` trivially graded: `superMul` is the matrix product and `str` the alternating trace of a
  graded endomorphism of `R^(m|n)`, the trace used by MotivesAndAlgebraicCycles and
  SchubertGeometry on graded cohomology.
- `A = Λ(Rᵈ)` with its parity grading: the local model of `Ω(ℝᵈ) ⊗̂ End(ℝ^(m|n))` at the constant
  forms.

### Dependencies

1.1 ← Mathlib; 1.2 ← 1.1; 1.3 ← 1.1, 1.2.

## Layer 2: superconnections in Quillen's algebraic model

### 2.1 Supercommutative differential graded algebras

Define the structure `SuperDGA 𝒜`: an `R`-linear map `d` that is odd (`d_mem`), satisfies the graded
Leibniz rule `d(ab) = d(a) b + σ(a) d(b)` (`d_mul`) and `d ∘ d = 0` (`d_d`); the entrywise
differential `dMat δ X` of a supermatrix, and the supercommutator
`superComm 𝒜 p q X Y = X ⋆ Y − (−1)^(pq) Y ⋆ X` (Quillen 1985). Prove that `dMat` is an odd
derivation of `superMul` on homogeneous supermatrices,
`d(X ⋆ Y) = dX ⋆ Y + (−1)^(|X|) X ⋆ dY`: it uses `d σ = −σ d`, which follows from `d_mem`.
*Needs:* 1.2.

**Checks.**

- `d(1) = 0`: `d(1) = d(1 · 1) = 2 d(1)`.
- The forms on `ℝᵈ`, or any `Λ(Rᵈ)` with `d = 0`, are instances; the parity of a form is its
  degree mod 2, so `d` is odd.
- The ungraded Leibniz rule is wrong for forms: for `a = dx`, `b = y` on `ℝ²`,
  `d(dx · y) = d(y dx) = dy ∧ dx = −dx ∧ dy`, which is `d(dx) y + σ(dx) dy`, while
  `d(dx) y + dx dy` gives `+dx ∧ dy`.

### 2.2 Superconnections, curvature and the Bianchi identity

For an odd supermatrix `Θ`, the superconnection `𝔸 = d + Θ` on `A ⊗ R^(m|n)` has curvature
`curvature δ Θ = dΘ + Θ ⋆ Θ`, and acts on a supermatrix `X` of parity `p` by
`covD δ Θ p X = dX + [Θ, X]`. Prove `bianchi`: `[𝔸, 𝔸²] = 0`, `covD δ Θ 0 (curvature δ Θ) = 0`
(Quillen 1985; Berline–Getzler–Vergne, §1.4). Route: `d(dΘ) = 0`, `d(Θ ⋆ Θ) = dΘ ⋆ Θ − Θ ⋆ dΘ` by
2.1, and the cubic terms cancel.
*Needs:* 2.1.

**Checks.**

- For `A = R` with `d = 0` and `Θ = X` odd, the curvature is `X ⋆ X = X²`, with
  `X = [[0, T*], [T, 0]]` giving `diag(T*T, TT*)` (Convention 3).
- For `n = 0` and `Θ` an `m × m` matrix of one-forms, `curvature = dΘ + Θ ∧ Θ`, the curvature of a
  connection `d + Θ`, as in CharacteristicClasses' Conventions.
- The parity argument of `covD` matters: for `A = R`, `d = 0`, Bianchi reads
  `Θ ⋆ Θ² − Θ² ⋆ Θ = 0`; computing `[Θ, F]` with the sign of two odd elements instead gives
  `2Θ³`, which is `2Θ ≠ 0` for `Θ = [[0, 1], [1, 0]]`.

### 2.3 The Chern character is closed

Define `superPow 𝒜 F k`. Prove `superTrace_dMat` (`str(dX) = d str(X)`) and
`isClosed_superTrace_superPow`: on a supercommutative differential graded algebra, every
component `str(F^k)` of the character of `d + Θ`, `F` its curvature, is closed (Quillen 1985;
Berline–Getzler–Vergne, Proposition 1.41 and the proof of the closedness of `ch(𝔸)` in §1.4).
Route: `d(F^k) = −[Θ, F^k]` by 2.2, and `str` kills supercommutators (1.3).
*Needs:* 1.3, 2.1, 2.2.

**Checks.**

- `k = 0`: `str(1) = m − n` is a constant, closed since `d(1) = 0`.
- `A = R`, `d = 0`, `Θ = X`: `str(X^(2k))` is `tr((T*T)^k) − tr((TT*)^k) = 0` for `k ≥ 1`, the
  algebraic heart of 2.5.
- Without supercommutativity the statement fails: the supertrace of a commutator is then not zero
  (1.3, Checks), and `d str(F²)` picks up `str([Θ, F²])`.

### 2.4 Transgression

Prove `transgression`: for an even derivation `∂` of `A` that preserves the grading and commutes
with `d`, `∂ str(F^(k+1)) = (k + 1) d str((∂Θ) ⋆ F^k)` (Quillen 1985; Berline–Getzler–Vergne,
Proposition 1.41; Garcia 2016, (A.9), for the form `d/dt str e^(𝔸_t²) = d str(𝔸̇_t e^(𝔸_t²))`).
For `A` the forms on `M` depending smoothly on a parameter `t` and `∂ = ∂/∂t`, summing the series
of `exp(−F)` gives `d/dt str exp(−𝔸_t²) = −d str(𝔸̇_t exp(−𝔸_t²))`. Route: `∂F = [𝔸, ∂Θ]`, so
`∂ str(F^(k+1)) = (k + 1) str([𝔸, ∂Θ] ⋆ F^k)` by graded cyclicity, which is
`(k + 1) str([𝔸, (∂Θ) ⋆ F^k]) = (k + 1) d str((∂Θ) ⋆ F^k)` by Bianchi; no division is used.
*Needs:* 1.3, 2.2, 2.3.

**Checks.**

- `k = 0`: `∂ str(dΘ + Θ²) = d str(∂Θ)`, since `str(∂Θ ⋆ Θ) + str(Θ ⋆ ∂Θ) = 0` by 1.3.
- For `Θ_t = Θ₀ + t η` with `A` forms on `M` with polynomial coefficients in `t`, the right side
  integrates over `[0, 1]` to the Chern–Simons form whose differential is
  `str(F₁^(k+1)) − str(F₀^(k+1))`, the connection-path argument of CharacteristicClasses C4,
  item 1, in the ungraded case `n = 0`.
- `k = 1`, `d = 0`: the right side is `0`, and so is the left, since
  `str(Θ⁴) = str(Θ ⋆ Θ³) = −str(Θ³ ⋆ Θ) = −str(Θ⁴)` by 1.3; the identity needs no division by `2`
  because the proof never isolates `str(Θ⁴)`.

### 2.5 The degree-zero character: McKean–Singer in finite dimensions

Prove `trace_exp_sub_trace_exp`: for every complex `n × m` matrix `T` and `t ∈ ℂ`,
`tr exp(−t T*T) − tr exp(−t TT*) = m − n`; it is the degree-zero component
`str exp(−tX²) = m − n` of the character of `d + √t X` (Convention 3; Quillen 1985). Route: expand
both exponentials; `tr((T*T)^k) = tr((TT*)^k)` for `k ≥ 1` (Mathlib's
`Matrix.trace_mul_pow_comm_of_ne_zero`, for rectangular factors), so only the constant terms
`tr 1 = m` and `tr 1 = n` survive.
*Needs:* Mathlib `NormedSpace.exp`, `Matrix.trace`, `Matrix.trace_mul_pow_comm_of_ne_zero`,
`Matrix.conjTranspose`.

**Checks.**

- `T = 0`: `m − n`, with no cancellation.
- `T` invertible (`m = n`): `T*T` and `TT*` are conjugate, the difference is `0`.
- `T = (1, 0) : ℂ² → ℂ` (`n = 1`, `m = 2`): `T*T = diag(1, 0)`, `TT* = (1)`, and
  `(e^(−t) + 1) − e^(−t) = 1 = 2 − 1`; with `T T*` and `T* T` exchanged the sign flips.

### 2.6 Duhamel's formula

Prove `hasDerivAt_exp_duhamel`: in a complete real normed algebra, if `F` has derivative `F′` at
`t`, then `s ↦ exp(F(s))` has derivative `∫₀¹ exp(sF(t)) F′ exp((1 − s)F(t)) ds` at `t`
(Duhamel's formula; Berline–Getzler–Vergne, Ch. 2). With a continuous trace `τ`, it gives
`d/dt τ(exp F(t)) = τ(F′ exp F(t))`, and with a supertrace and `F(t)` even the same, which sums
2.4 to the exponential. Route: `exp(F(t + h)) − exp(F(t)) = ∫₀¹ d/ds (exp(sF(t+h))
exp((1 − s)F(t))) ds`, the derivative of the integrand being `exp(sF(t+h))(F(t+h) − F(t))
exp((1 − s)F(t))`, and the series bounds of `NormedSpace.exp`.
*Needs:* Mathlib `NormedSpace.exp`, `HasDerivAt`, `intervalIntegral`.

**Checks.**

- If `F(t)` and `F′` commute, the integrand is `exp(F(t)) F′`, the usual chain rule.
- `𝔸 = M₂(ℝ)`, `F(s) = [[0, s], [0, 0]] + [[1, 0], [0, 0]]`: the formula gives the derivative of
  the explicit `exp(F(s)) = [[e, s(e − 1)], [0, 1]]`, namely `[[0, e − 1], [0, 0]]`, while the
  commutative guess `exp(F) F′ = [[0, e], [0, 0]]` is wrong.
- The order of the factors matters: replacing the integrand by `exp(sF) exp((1 − s)F) F′` gives
  `exp(F) F′`, the same wrong value.

### Examples

- `A = Λ(ℝᵈ)` with `d = 0`, `Θ = X + θ` with `θ` an odd matrix of constant one-forms: all four
  theorems are identities of polynomials in the entries.
- The trivial graded bundle `ℂ^(m|n)` over `M` with `𝔸 = d + √t X(x)`: Layer 4's 4.4 at the
  level of forms on a trivialization.

### Dependencies

2.1 ← 1.2; 2.2 ← 2.1; 2.3 ← 1.3, 2.1, 2.2; 2.4 ← 1.3, 2.2, 2.3; 2.5, 2.6 ← Mathlib.

## Layer 3: the Berezin integral and the Pfaffian

### 3.1 The Berezin integral

Define `berezin n : ExteriorAlgebra R (Fin n → R) →ₗ[R] R`: project to the top degree (Mathlib's
decomposition of `ExteriorAlgebra.gradedAlgebra`) and evaluate the alternating form
`(Pi.basisFun R (Fin n)).det` through `exteriorPower.alternatingMapLinearEquiv` (Convention 4;
Wu 2006, §2.1; Berline–Getzler–Vergne, §1.3). Prove `berezin_map`: for a linear map `f` of `Rⁿ`,
`∫_B Λ(f)(x) = det f · ∫_B x`, the change of variables of the Berezin integral. Route: `Λ(f)`
preserves degrees and acts on the top degree by `det f`.
*Needs:* Mathlib `ExteriorAlgebra.map`, `exteriorPower.alternatingMapLinearEquiv`, `Basis.det`,
`DirectSum.decomposeLinearEquiv`, `DirectSum.component`, `LinearMap.det`.

**Checks.**

- `∫_B e₀e₁ = 1` and `∫_B e₁e₀ = −1` in `Λ(R²)`; `∫_B 1 = 0` for `n ≥ 1`, and `∫_B 1 = 1` for
  `n = 0`.
- `∫_B` kills lower degrees: `∫_B (e₀ + 3e₀e₁) = 3`; a definition by the coefficient of `e₀` in
  degree one would give `1`.
- For `f` swapping `e₀` and `e₁`, `det f = −1` and `∫_B Λ(f)(e₀e₁) = ∫_B e₁e₀ = −1`.

### 3.2 The Pfaffian as a Berezin integral

Define `skewForm Σ = ∑_(i<j) Σᵢⱼ eᵢ eⱼ`, which is `½ (·, Σ ·)` for skew `Σ`, and
`pfaffian Σ = (r!)⁻¹ ∫_B (skewForm Σ)^r` for a `2r × 2r` matrix over a commutative `ℚ`-algebra
(Convention 4; Wu 2006, §2.1; Mathai–Quillen 1986). Prove `pfaffian_sq`, `Pf(Σ)² = det Σ`, and
`pfaffian_mul_mul_transpose`, `Pf(BΣBᵀ) = det B Pf(Σ)`, for skew `Σ`. Route: the second by 3.1
applied to `f = B` after `skewForm (BΣBᵀ) = Λ(B)(skewForm Σ)`; the first by reducing to a
block-diagonal normal form over the fraction field of the generic skew matrix and the second
identity, or by the Berezin integral over `Λ(R^(2r) ⊕ R^(2r))` of `exp(∑ Σᵢⱼ eᵢ fⱼ)`, which is
`det Σ` up to the sign of the reordering.
*Needs:* 3.1; Mathlib `Matrix.det`, `Matrix.transpose`.

**Checks.**

- `Pf([[0, a], [−a, 0]]) = a` (Convention 4), with square `a² = det`.
- For `Σ` block diagonal with blocks `[[0, aᵢ], [−aᵢ, 0]]`, `Pf(Σ) = a₁ ⋯ a_r`: the cross terms of
  `ω^r` are `r!` copies of `a₁e₀e₁ ⋯ a_r e_(2r−2)e_(2r−1)`.
- For `4 × 4`, `Pf = Σ₀₁Σ₂₃ − Σ₀₂Σ₁₃ + Σ₀₃Σ₁₂`; the missing `1/r!` would give twice it.
- `Σ = 0`: `Pf = 0` for `r ≥ 1` and `Pf = 1` for `r = 0`, the empty matrix with `det = 1`.

### 3.3 The Gaussian density

Prove `integral_gaussian_density`: on `EuclideanSpace ℝ (Fin r)`,
`∫ (2π)^(−r/2) exp(−|x|²/2) dx = 1`, the fibre integral of the Mathai–Quillen form on the trivial
bundle (Mathai–Quillen 1986; Wu 2006, (2.1)). Route: Mathlib's Gaussian integral on a
finite-dimensional inner product space.
*Needs:* Mathlib `MeasureTheory.integral`, `EuclideanSpace`, the Gaussian integral.

**Checks.**

- `r = 0`: the integral over a point of `1` is `1`.
- `r = 1`: `∫ e^(−x²/2) dx = √(2π)`; the normalization `π^(−r/2) e^(−|x|²)` of the physics
  literature also has integral `1`, while `(2π)^(−r/2) e^(−|x|²)` has `2^(−r/2)`.
- The sign of Convention 4 is what makes `u = (2π)^(−r/2) e^(−|x|²/2) dx₁ ⋯ dx_r` positive on the
  standard orientation.

### Examples

- `Λ(R⁰) = R`: `∫_B = id`, `Pf` of the empty matrix is `1`.
- `R = ℝ[a₀₁, …]`, the generic skew matrix: 3.2 there implies 3.2 for every skew matrix over every
  commutative `ℚ`-algebra.

### Dependencies

3.1 ← Mathlib; 3.2 ← 3.1; 3.3 ← Mathlib.

## Layer 4: superconnections on ℤ/2-graded bundles

### 4.1 Graded bundles and the supertrace

For a smooth ℤ/2-graded complex vector bundle `E = E⁺ ⊕ E⁻` over a smooth manifold `M`, identify
`Ω(M, End E)` with `Ω(M) ⊗̂_(C^∞(M)) Γ(End E)` under Quillen's sign rule, and define the supertrace
`str : Ω(M, End E) → Ω(M)`, `str(ω ⊗ u) = ω str(u)`. Prove that it is a graded trace and commutes
with the exterior covariant derivative of a grading-preserving connection,
`str[∇, α] = d str(α)` (Quillen 1985; Berline–Getzler–Vergne, §1.4). Route: 1.3 in local
trivializations, where `Ω(U) ⊗̂ End(ℂ^(m|n))` is the algebra of Layer 1.
*Needs:* 1.3; DifferentialGeometry Layers 0–1; SmoothBundlesConnections B4.1.

**Checks.**

- On a point, `str` is the alternating trace `tr|E⁺ − tr|E⁻`.
- For the identity endomorphism, `str 1 = rk E⁺ − rk E⁻`, locally constant.
- For a one-form `ω` and an odd `u`, `str(ω ⊗ u) = 0`, while `str(ω ⊗ 1) = (rk E⁺ − rk E⁻) ω`.

### 4.2 Superconnections

Define a superconnection on `E`: an odd `ℂ`-linear operator `𝔸` on `Ω(M, E)` with
`𝔸(ωs) = dω s + (−1)^(|ω|) ω 𝔸s`. Prove that every superconnection is `∇ + θ` with `∇ = ∇⁺ ⊕ ∇⁻`
a grading-preserving connection and `θ ∈ Ω(M, End E)` odd, that `𝔸²` is `Ω(M)`-linear, an even
element of `Ω(M, End E)`, and the Bianchi identity `[𝔸, 𝔸²] = 0` (Quillen 1985;
Berline–Getzler–Vergne, §1.4; Garcia 2016, §A.1). Route: the difference of two superconnections is
`Ω(M)`-linear, and Bianchi is 2.2 in a trivialization.
*Needs:* 2.2, 4.1; SmoothBundlesConnections B3.3, B4.1.

**Checks.**

- `θ = 0`: `𝔸² = F⁺ ⊕ F⁻`, the curvatures of `∇±`.
- `θ = X` of degree 0, `X = [[0, T*], [T, 0]]`: `𝔸² = F + [∇, X] + X²`, with `[∇, X]` an odd
  one-form and `X²` of degree 0.
- Parity is needed: for an even endomorphism `u` of degree 0, `(∇ + u)²(fs) − f(∇ + u)²s =
  2 df ∧ us`, so `(∇ + u)²` is not `Ω(M)`-linear; for odd `u` the two terms `df ∧ us` and
  `u(df s) = −df ∧ us` cancel.

### 4.3 The Chern character form

Prove that `ch(𝔸) = φ str exp(−𝔸²)` (Convention 2) is closed; that for a smooth family `𝔸_t`,
`d/dt str exp(−𝔸_t²) = −d str(𝔸̇_t exp(−𝔸_t²))`, so the class of `ch(𝔸)` in
`H^even(M; ℂ)` is independent of `𝔸`; and that it equals `ch(E⁺) − ch(E⁻)`, the difference of
CharacteristicClasses' Chern character forms of `∇⁺` and `∇⁻` (Quillen 1985;
Berline–Getzler–Vergne, Proposition 1.41 and §1.4; Garcia 2016, §A.1). Route: 2.3 and 2.4 in
trivializations, summed with 2.6; for the last, the path `∇ + tθ`, `t ∈ [0, 1]`, joins `𝔸` to
`∇⁺ ⊕ ∇⁻`, whose character is CharacteristicClasses C4, item 2, for each summand.
*Needs:* 2.3, 2.4, 2.6, 4.2; CharacteristicClasses C4, items 1–2; DifferentialGeometry Layer 6.

**Checks.**

- `E⁻ = 0`: `ch(𝔸) = tr exp((i/2π)F)`, CharacteristicClasses' form.
- `E⁺ = E⁻ = L` a line bundle and `𝔸 = ∇ ⊕ ∇ + X` with `X = [[0, 1], [1, 0]]`: the class is
  `ch(L) − ch(L) = 0`, and indeed `𝔸 = ∇ ⊕ ∇ + X` has the exact character of 4.4.
- The sign of the transgression form is fixed by `𝔸_t = ∇ + tX` over a point: there
  `str exp(−t²X²)` is constant (Convention 3's witness), and the right side is `−d(…) = 0`.

### 4.4 Quillen's character of ∇ + tX

Let `∇` be grading-preserving and Hermitian, and `X = [[0, T*], [T, 0]]` with `T : E⁺ → E⁻`
(Convention 3), and put `𝔸_t = ∇ + tX`. Prove: (a) if `T` is invertible at every point of an open
`U ⊆ M`, then `str exp(−𝔸_t²) → 0` as `t → ∞`, with all derivatives, uniformly on compact subsets
of `U`, and on `U` the form `ch(𝔸₁)` is exact with primitive
`φ ∫₁^∞ str(X exp(−𝔸_t²)) dt`, the integral converging on `U`; (b) if `ker T` and `ker T*` have
locally constant rank, so that `K = ker X` is a ℤ/2-graded subbundle with the compressed
connection `∇^K = P_K ∇ P_K`, then `ch(𝔸_t) → ch(K⁺, ∇^K) − ch(K⁻, ∇^K)` as `t → ∞`, uniformly
on compact subsets with all derivatives, and the difference is `d` of a convergent transgression
integral (Quillen 1985; Berline–Getzler–Vergne, Ch. 9). Route: (a) from 4.3 and the bound
`|exp(−𝔸_t²)| ≤ C(1 + t)^N e^(−t² λ)` with `λ > 0` the smallest eigenvalue of `X²` on the compact
set, by Duhamel's expansion (2.6) around `exp(−t²X²)`; (b) in a frame adapted to
`E = K ⊕ K^⊥`, on which `X` is invertible, by the same expansion.
*Needs:* 2.5, 2.6, 4.3; DifferentialGeometry Layer 6.

**Checks.**

- Over a point the degree-zero part is 2.5: `str exp(−t²X²) = rk K⁺ − rk K⁻ = m − n` for every
  `t`, and (b) holds with equality.
- `E⁺ = E⁻ = ℂ` trivial, `T = f` a nowhere-zero function: (a) gives `ch(𝔸₁) = d(…)` on all of `M`,
  consistent with `ch(ℂ) − ch(ℂ) = 0`.
- Without the rank condition (b) fails: on `M = ℝ²` with `E⁺ = E⁻ = ℂ`, `∇ = d` and `T = z`,
  `ch(𝔸_t) = −(t²/π) e^(−t²|z|²) dx ∧ dy` (from `str((dX)²) = 2 dz ∧ dz̄` under Convention 1), of
  integral `−1` for every `t > 0`; it concentrates at `0`, where the kernel jumps, and its limit is
  the current `−δ₀`, not a form.

### Examples

- `M` a point: Layer 4 is Layer 2 with `A = ℂ`.
- The Koszul complex of a section `s` of a Hermitian bundle `F` with `∇_s = ∇ + i(s + s*)` on
  `ΛF` (Garcia 2016, §A.2–A.3): a superconnection of the form 4.4 whose `X` is invertible off
  `s⁻¹(0)`.

### Dependencies

4.1 ← 1.3, DifferentialGeometry Layers 0–1, SmoothBundlesConnections B4.1; 4.2 ← 2.2, 4.1,
SmoothBundlesConnections B3.3, B4.1; 4.3 ← 2.3, 2.4, 2.6, 4.2, CharacteristicClasses C4, items 1–2,
DifferentialGeometry Layer 6; 4.4 ← 2.5, 2.6, 4.3.

## Layer 5: Mathai–Quillen Euler and Thom forms

### 5.1 The fibrewise Berezin integral and the Euler form

For an oriented real vector bundle `E` of rank `r` with a Euclidean metric and a compatible
connection `∇` of curvature `R`, define the Berezin integral `∫_B : Ω(M, ΛE*) → Ω(M)` fibrewise
(3.1 in oriented orthonormal frames) and prove that the Euler form
`e(∇) = (2π)^(−r/2) ∫_B exp(½(·, R·))` equals `Pf(R/2π)`, CharacteristicClasses' Pfaffian form, and
is `0` in odd rank (Mathai–Quillen 1986; Berline–Getzler–Vergne, §1.6; Wu 2006, (2.3)). Route: 3.2
fibrewise; orthonormal frame changes have `det = 1`, so 3.1 makes `∫_B` frame-independent.
*Needs:* 3.1, 3.2; CharacteristicClasses C4, item 2; SmoothBundlesConnections B4.1.

**Checks.**

- `r = 2`, `R = [[0, −dα], [dα, 0]]`: `e(∇) = −dα/2π`, CharacteristicClasses' witness.
- Odd `r`: `∫_B` of an even element of `ΛE*` is `0`, so `e(∇) = 0`.
- Reversing the orientation of `E` reverses `∫_B` and `e(∇)`.

### 5.2 The Mathai–Quillen Euler form of a section

For a smooth section `s`, define `e_(∇,s) = (−1)^(r(r+1)/2) (2π)^(−r/2) ∫_B exp(−S_(∇,s))` with
`S_(∇,s) = ½|s|² + (∇s, ·) + ½(·, R·)` (Wu 2006, (2.4)–(2.5), following
Berline–Getzler–Vergne, §1.6). Prove that it is closed, that `e_(∇,βs)` has a class independent of
`β ≥ 0`, with an explicit transgression form, and that `e_(∇,0) = e(∇)` for even `r`
(Mathai–Quillen 1986). Route: `exp(−S_(∇,s))` is closed for the operator `d − ι_s` on
`Ω(M, ΛE*)` (contraction by `s` in the Grassmann variables), which `∫_B` turns into `d`; the
`β`-derivative is `(d − ι_s)`-exact.
*Needs:* 3.1, 5.1; DifferentialGeometry Layer 6.

**Checks.**

- `s = 0`, `r` even: `(−1)^(r(r+1)/2) Pf(−R/2π) = (−1)^(r/2) (−1)^(r/2) Pf(R/2π) = e(∇)`.
- `M = ℝʳ`, `E` trivial, `∇ = d`, `s = x`: `e_(d,x) = (2π)^(−r/2) e^(−|x|²/2) dx₁ ⋯ dx_r`
  (Convention 4), of integral `1` by 3.3.
- `s = βx` on `ℝʳ`: `(2π)^(−r/2) β^r e^(−β²|x|²/2) dx`, of integral `1` for every `β > 0` and
  concentrating at `0` as `β → ∞`.

### 5.3 Localization and Poincaré–Hopf

Let `M` be closed and oriented and `s` transverse to the zero section, with `Z = s⁻¹(0)` oriented
by CharacteristicClasses C2, item 3. Prove: (a) `∫_M ω ∧ e_(∇,s) = ∫_Z ω` for every closed `ω` of
degree `dim M − r`; (b) `∫_M φ ∧ e_(∇,βs) → ∫_Z φ` as `β → ∞` for every form `φ`; (c) for
`E = TM` with the Levi-Civita connection and a vector field `s` with nondegenerate zeros,
`∫_M Pf(R/2π) = ∑_(s(p)=0) sign det(∇s(p)) = χ(M)` (Mathai–Quillen 1986; Wu 2006, (2.6)).
Route: (a) by 5.2, Stokes and CharacteristicClasses C2, item 3, which identifies the class of
`e(E)` with the Poincaré dual of `Z`; (b) by the Gaussian rescaling of 5.2's third Check in normal
coordinates along `Z`; (c) from (a) with `ω = 1`, `β → 0` giving the Pfaffian, and C2, item 3's
sum-of-local-indices formula with `e(TM)[M] = χ(M)`.
*Needs:* 3.3, 5.1, 5.2; CharacteristicClasses C2, item 3; DifferentialGeometry Layers 2, 5.

**Checks.**

- `M = S²`, the height gradient: two zeros of index `+1`, `∫ Pf(R/2π) = (1/2π) ∫ K dA = 2`.
- `M = T²` flat: `R = 0`, and a constant field has no zeros; both sides `0`.
- Reversing the orientation of `E` changes both sides of (a) by a sign.

### 5.4 The Thom form

On the total space of `π : E → M`, with the tautological section `x` of `π*E`, define
`τ_∇ = e_(π*∇, x)` (Wu 2006, (2.7)). Prove that `τ_∇` is closed, that its restriction to each fibre
is the Gaussian `(2π)^(−r/2) e^(−|x|²/2) dx₁ ⋯ dx_r`, with fibre integral `1`, that
`s*τ_∇ = e_(∇,s)` for every section `s`, in particular `0*τ_∇ = e(∇)`, and that for the
fibrewise radial diffeomorphism `ρ` from the open unit disc bundle onto `E`, `ρ*τ_∇` extends by
zero to a closed form with compact vertical support whose class is the real image of the Thom
class `U_E` (Mathai–Quillen 1986; Berline–Getzler–Vergne, §1.6). Route: closedness from 5.2;
the fibre value from Convention 4 and 3.3; `s*` by naturality of the construction; the class by
C2, item 5's compact-support comparison and the characterization of `U_E` by fibre integral `1`
(C2, item 1). The equivariant construction of `τ_∇` from the `SO(r)`-equivariant Gaussian on `ℝʳ`
(Mathai–Quillen 1986) is a second route.
*Needs:* 3.3, 5.2; CharacteristicClasses C2, items 1, 5; DifferentialGeometry Layer 5.

**Checks.**

- `M` a point: `τ = (2π)^(−r/2) e^(−|x|²/2) dx` on `ℝʳ`, integral `1` by 3.3.
- With `ρ(y) = y/√(1 − |y|²)`, `ρ*τ_∇` contains `exp(−|y|²/(2(1 − |y|²)))` times a power of
  `(1 − |y|²)⁻¹`, which tends to `0` with all derivatives at the unit sphere, so the extension by
  zero is smooth.
- `r = 1`, `E = M × ℝ`: `τ = (2π)^(−1/2) e^(−x²/2) dx` (Convention 4's sign at `r = 1` is absorbed),
  and `0*τ = 0 = e(∇)` in odd rank.

### Examples

- The Hopf bundle `O(−1)` over `ℂP¹` as a real rank-2 bundle: `∫ e(∇) = −1`.
- `TS²` with the round metric: 5.3 (c) gives `χ(S²) = 2`.

### Dependencies

5.1 ← 3.1, 3.2, CharacteristicClasses C4, item 2, SmoothBundlesConnections B4.1; 5.2 ← 3.1, 5.1;
5.3 ← 3.3, 5.1, 5.2, CharacteristicClasses C2, item 3, DifferentialGeometry Layers 2, 5; 5.4 ←
3.3, 5.2, CharacteristicClasses C2, items 1, 5, DifferentialGeometry Layer 5.

## Layer 6: the Cayley transform and invariant character forms

### 6.1 The graded Cayley transform

Define `grading = 1 ⊕ −1` on `ℂ^(m|n)` and `cayley X = (1 + X)(1 − X)⁻¹`. Prove
`isUnit_one_sub_of_skew` (`1 − X` invertible for `X* = −X`), `cayley_mem_unitaryGroup` and
`grading_mul_cayley_mul_grading`: if moreover `X` is odd, `εXε = −X`, then `εgε = g⁻¹`, so `εg`
is a self-adjoint involution, the reflection `2P_W − 1` in a subspace `W`; this is Quillen's
correspondence between odd skew-adjoint `X`, unitaries `g` with `εgε = g⁻¹` and `−1 ∉ spec(g)`,
and subspaces `W` (Quillen 1988). Route: the eigenvalues of `X` are imaginary, so `1 − X` is
invertible; unitarity is SelfAdjointSpectralTheory SA-D27 for `A = −iX` (Convention 5); `ε(1 ± X)ε
= 1 ∓ X` and `1 + X`, `1 − X` commute.
*Needs:* SelfAdjointSpectralTheory SA-D24, SA-D27; Mathlib `Matrix.unitaryGroup`,
`Matrix.fromBlocks`.

**Checks.**

- `X = 0`: `g = 1`, `εg = ε = 2P_(E⁺) − 1`, so `W = E⁺`.
- `m = n = 1`, `X = [[0, −a], [a, 0]]` with `a` real:
  `g = (1 + a²)⁻¹ [[1 − a², −2a], [2a, 1 − a²]]`, a rotation, and `εgε = gᵀ = g⁻¹`; `εg` fixes
  `(1, −a)`, so `W` is the line it spans.
- An even skew-adjoint `X = diag(iθ, 0)` gives `g = diag((1 + iθ)/(1 − iθ), 1)`, which commutes
  with `ε`, and `εgε = g ≠ g⁻¹` for `θ ≠ 0`: oddness is needed.

### 6.2 Invariant character forms on Grassmannians and unitary groups

On the manifold `Gr(V)` of self-adjoint involutions `F` of a finite-dimensional Hermitian space
`V` (the disjoint union of the Grassmannians, through `W ↦ 2P_W − 1`) and on `U(V)`, prove that
`tr(F(dF)^(2k))` and `tr((g⁻¹dg)^(2k−1))` are closed and `U(V)`-invariant, that
`tr(F(dF)^(2k)) = 2^(2k+1) tr(P(dP)^(2k))` with `P = (1 + F)/2`, and that
`(1/k!)(i/2π)^k tr(P(dP)^(2k))` is the degree-`2k` Chern character form of the tautological bundle
`W` with the connection `P d P`, so the class of `tr(F(dF)^(2k))` is
`2^(2k+1) k! (2π/i)^k ch_k(W)` (Quillen 1988). Route: `P dP P = 0` and `(dP)²` commutes with `P`,
so the curvature of `P d P` is `P dP dP` and its `k`-th power `P(dP)^(2k)`; `tr((dP)^(2k)) = 0`
by graded cyclicity of the trace on matrix-valued forms (1.3 with `n = 0`); closedness from
`d tr(F(dF)^(2k)) = tr((dF)^(2k+1))`, which vanishes because `F² = 1` makes `F` anticommute with
`dF`, so conjugating by `F` changes its sign.
*Needs:* 1.3, 4.3; CharacteristicClasses C4, item 2; DifferentialGeometry Layers 0–1, 6.

**Checks.**

- `k = 0`: `tr(F) = 2 dim W − dim V`, locally constant, and `ch₀(W) = dim W`.
- `V = ℂ²`, `Gr₁(ℂ²) = ℂP¹`: `∫ (i/2π) tr(P dP dP) = −1`, the degree of the tautological
  `O(−1)`, matching CharacteristicClasses' `c₁(O(−1)) = −h`.
- `tr((g⁻¹dg)¹)` on `U(1)` is `i dθ`, of integral `2πi`; on `U(V)` the forms of even degree
  `tr((g⁻¹dg)^(2k))` vanish by cyclicity, so only odd degrees occur.

### Examples

- The Cayley transform of `X(x) = [[0, −T(x)*], [T(x), 0]]` over `M`: a map `M → Gr(V)` whose
  pullback of 6.2's forms is the object of Quillen's comparison (Scope, Out of scope).
- `Gr₁(ℂ^N) = ℂP^(N−1)`: 6.2 gives `ch(O(−1))` as an invariant form.

### Dependencies

6.1 ← SelfAdjointSpectralTheory SA-D24, SA-D27, Mathlib; 6.2 ← 1.3, 4.3, CharacteristicClasses
C4, item 2, DifferentialGeometry Layers 0–1, 6.

## Downstream consumers

No roadmap on main or in the open pull requests consumes SuperconnectionsAndMathaiQuillenForms.
IndexTheory states its cohomological formula with CharacteristicClasses' Thom classes and Chern
characters (IndexTheory, Conventions) and builds its heat-kernel trace of Layer 8.2 for Dolbeault
Laplacians on its own; NoncommutativeGeometry puts the local index formula outside its scope.

## Research context

Quillen introduced superconnections to give a heat-kernel proof of a local index theorem for
families: the character of `∇ + √t D` for a family of Dirac operators `D` should represent the
Chern character of the index bundle, with a limit as `t → 0` given by local geometry. Bismut
(1986) carried this out with the superconnection that carries his name, and
Berline–Getzler–Vergne (Ch. 10) give a proof by Getzler's rescaling (Getzler 1983). Mathai and
Quillen (1986) built their Thom form through equivariant differential forms, on the equivariant
cohomology of Berline–Vergne (1983) and Atiyah–Bott (1984); its pullback by the zero section is the
Chern–Weil Euler form, so it interpolates between Chern's intrinsic Gauss–Bonnet theorem, proved by
transgression on the sphere bundle (Chern 1944), and the Poincaré–Hopf count of the zeros of a
section. Kalkman (1993) gave a BRST model of equivariant cohomology and representatives of the
equivariant Thom class; Getzler (1991) gave a probabilistic account of the Mathai–Quillen form, and
Atiyah–Jeffrey (1990) read it as the finite-dimensional model of Witten's cohomological field
theories, in which the Euler class of an infinite-rank bundle is computed by the same Berezin
integral (Wu 2006, §5). Bismut, Gillet and Soulé (1990) use currents of Mathai–Quillen type for
complex immersions.

Poincaré–Hopf for the higher Chern classes, not only the Euler class, is a theorem of Harvey and
Lawson's theory of characteristic currents (Harvey–Lawson 1993; announced in Harvey–Lawson 1994):
for sections `s₀, …, s_k` of a complex bundle `F` with connection, `c_(n−k)(Ω_F)` differs from the
current of their linear-dependence locus by the differential of a canonical locally integrable
transgression (Harvey–Lawson 1994, §8), and their Theorem B gives a family of Thom forms with the
Mathai–Quillen properties that converge to the current of the zero section. The analytic input is
Harvey–Semmes (1992), and MacPherson's Grassmann graph construction (MacPherson 1974) is one choice
of approximation. Quillen's notebooks 1982-13, 1983-2, 1984-1 to 1984-5 and 1990-1 (Clay
Mathematics Institute) work on these questions.

## References

- D. Quillen, « Superconnections and the Chern character », *Topology* 24 (1985), no. 1, 89–95.
  doi:10.1016/0040-9383(85)90047-3. Zbl 0569.58030.
- V. Mathai, D. Quillen, « Superconnections, Thom classes, and equivariant differential forms »,
  *Topology* 25 (1986), no. 1, 85–110. doi:10.1016/0040-9383(86)90007-8. Zbl 0592.55015.
- D. Quillen, « Superconnection character forms and the Cayley transform », *Topology* 27 (1988),
  no. 2, 211–238. doi:10.1016/0040-9383(88)90040-7. Zbl 0671.57013.
- J.-M. Bismut, « The Atiyah–Singer index theorem for families of Dirac operators: two heat
  equation proofs », *Invent. Math.* 83 (1986), 91–151. doi:10.1007/BF01388755. Zbl 0592.58047.
- N. Berline, E. Getzler, M. Vergne, *Heat Kernels and Dirac Operators*, Grundlehren Math. Wiss.
  298, Springer, 1992. doi:10.1007/978-3-642-58088-8. Zbl 0744.58001.
- S. Wu, « Mathai–Quillen formalism », in *Encyclopedia of Mathematical Physics*, vol. 3,
  Elsevier, 2006, 390–399; arXiv:hep-th/0505003 (cited in the numbering of arXiv version 1).
- L. E. Garcia, « Superconnections, theta series, and period domains », *Adv. Math.* 329 (2018),
  555–589; arXiv:1604.03897 (cited in the numbering of arXiv version 1, Appendix A).
- J.-M. Bismut, H. Gillet, C. Soulé, « Complex immersions and Arakelov geometry », in *The
  Grothendieck Festschrift*, vol. I, Progr. Math. 86, Birkhäuser, 1990, 249–331. Zbl 0744.14015.
- S.-S. Chern, « A simple intrinsic proof of the Gauss–Bonnet formula for closed Riemannian
  manifolds », *Ann. of Math.* (2) 45 (1944), 747–752. doi:10.2307/1969302.
- E. Getzler, « Pseudodifferential operators on supermanifolds and the Atiyah–Singer index
  theorem », *Comm. Math. Phys.* 92 (1983), 163–178. doi:10.1007/BF01210843.
- N. Berline, M. Vergne, « Zéros d'un champ de vecteurs et classes caractéristiques
  équivariantes », *Duke Math. J.* 50 (1983), 539–549. doi:10.1215/S0012-7094-83-05024-X.
- M. F. Atiyah, R. Bott, « The moment map and equivariant cohomology », *Topology* 23 (1984), 1–28.
  doi:10.1016/0040-9383(84)90021-1.
- J. Kalkman, « BRST model for equivariant cohomology and representatives for the equivariant Thom
  class », *Comm. Math. Phys.* 153 (1993), 447–463. doi:10.1007/BF02096949.
- E. Getzler, « The Thom class of Mathai and Quillen and probability theory », in *Stochastic
  Analysis and Applications* (Lisbon, 1989), Progr. Probab. 26, Birkhäuser, 1991, 111–122.
  doi:10.1007/978-1-4612-0447-3_8.
- M. F. Atiyah, L. Jeffrey, « Topological Lagrangians and cohomology », *J. Geom. Phys.* 7 (1990),
  119–136. doi:10.1016/0393-0440(90)90023-V.
- F. R. Harvey, H. B. Lawson Jr., *A Theory of Characteristic Currents Associated with a Singular
  Connection*, Astérisque 213, Soc. Math. France, 1993. Zbl 0804.53037.
- F. R. Harvey, H. B. Lawson Jr., « A theory of characteristic currents associated with a singular
  connection », *Bull. Amer. Math. Soc.* 31 (1994), 54–63. doi:10.1090/S0273-0979-1994-00497-5;
  arXiv:math/9407216.
- F. R. Harvey, S. Semmes, « Zero divisors of atomic functions », *Ann. of Math.* (2) 135 (1992),
  567–600. doi:10.2307/2946577.
- R. MacPherson, « Chern classes for singular algebraic varieties », *Ann. of Math.* (2) 100
  (1974), 423–432. doi:10.2307/1971080.
