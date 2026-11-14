# Roadmap: superconnections, Quillen's character forms and Mathai–Quillen forms

**Summary.** Build Quillen's ℤ/2-graded Chern–Weil theory in two tiers. The algebraic tier works
on Mathlib's carriers: `ZMod 2`-graded algebras `GradedAlgebra 𝒜` with
`𝒜 : ZMod 2 → Submodule R A` over a commutative ring `R`, Mathlib's graded tensor product
`𝒜 ᵍ⊗[R] ℬ` with the block-parity grading `ℬ` of `Matrix (m ⊕ n) (m ⊕ n) R`, Mathlib's exterior
algebra, and complex matrices. Its end theorems are: the linear equivalence
`𝒜 ᵍ⊗[R] ℬ ≃ Matrix (m ⊕ n) (m ⊕ n) A` carries the product of the graded tensor product to the
Koszul-signed matrix product and its grading to the parity of supermatrices, and on a
supercommutative `A` the supertrace satisfies `str(XY) = (−1)^(|X||Y|) str(YX)` for homogeneous
`X`, `Y` (Layer 1); a ℤ-graded differential graded algebra is a `ZMod 2`-graded one on its parity
grading; for a supercommutative `ZMod 2`-graded differential graded algebra `(A, d)` and an odd
supermatrix `Θ`, the curvature `F = dΘ + Θ²` of `d + Θ` satisfies the Bianchi identity, every
`str(F^k)` is closed, and an even derivation `∂` commuting with `d` satisfies
`∂ str(F^(k+1)) = (k + 1) d str((∂Θ) F^k)`; for every complex `n × m` matrix `T` and `t ∈ ℂ`,
`tr exp(−t T*T) − tr exp(−t TT*) = m − n` (Layer 2); the Berezin integral on `Λ(Rⁿ)` multiplies by
`det f` under `Λ(f)`, and the Pfaffian, defined over every commutative ring as the Berezin integral
of the divided power `ω^[r]` of the two-form of `Σ`, satisfies `r! Pf(Σ) = ∫_B ω^r`,
`Pf(Σ)² = det Σ` and `Pf(BΣBᵀ) = det B Pf(Σ)` for alternating `Σ` (`Σᵀ = −Σ`, zero diagonal), and
the standard Gaussian density on `ℝʳ` has integral `1` (Layer 3); for a skew-adjoint complex
supermatrix `X`, `1 − X` is invertible, the Cayley transform `g = (1 + X)(1 − X)⁻¹` is unitary, and
`εgε = g⁻¹` when `X` is odd, and conversely a unitary `g` with `εgε = g⁻¹` and `−1 ∉ spec(g)` is
the transform of the odd skew-adjoint `(g − 1)(g + 1)⁻¹` (Layer 6). The bundle tier states the same
theorems for smooth ℤ/2-graded vector bundles over a smooth manifold `M`: the Chern character form
`φ str exp(−𝔸²)` of a superconnection is closed, its class is independent of `𝔸` and equals
`ch(E⁺) − ch(E⁻)`, the character of `∇ + tX` is exact where `X` is invertible and, when `ker X` has
locally constant rank, `ker X` is the image of a smooth projection given by a contour integral of
the resolvent and the character tends to that of `ker X` (Layer 4); the Mathai–Quillen Euler form
`e_(∇,s)` of a section `s` of an oriented Euclidean bundle is closed, equals the Euler form `e(∇)`
at `s = 0` (the Pfaffian form `Pf(R/2π)` in positive even rank, the orientation sign in rank zero)
and represents the Poincaré dual of `s⁻¹(0)` for transverse `s`, which gives
`∫_M e(∇) = Σ ind = χ(M)` for the tangent bundle, and the Thom form `τ_∇` on the total space is
closed, Gaussian on the fibres with fibre integral `1`, pulls back to `e_(∇,s)` along `s` and
represents the Thom class (Layer 5);
`W ↦ 2P_W − 1` embeds each complex Grassmannian of `V = ℂ^N` in the self-adjoint endomorphisms of
`V`, onto the involutions of one trace, and for `k ≥ 1` the invariant character forms
`tr(F(dF)^(2k))` on these involutions and `tr((g⁻¹dg)^(2k−1))` on the unitary group are closed and
invariant, the even ones representing a multiple of the Chern character of the tautological
bundle with the connection `P d P` (Layer 6).

Suggested home: `TauCeti/Algebra/Super/` for Layers 1–3 and 6.1, and
`TauCeti/Geometry/Manifold/Superconnection/` for Layers 4, 5, 6.2.

## Scope and ownership

**Owned here.** The parity involution and supercommutativity predicate on `ZMod 2`-graded
algebras, the block-parity grading of square matrices, the comparison of Mathlib's graded tensor
product with Koszul-signed supermatrices, and the supertrace with its graded-trace property
(Layer 1); Quillen's algebraic model of superconnections on a supercommutative `ZMod 2`-graded
differential graded algebra, its comparison with Tau Ceti's ℤ-graded differential graded algebras,
the closedness of the components of the character, the algebraic transgression formula and the
finite-dimensional McKean–Singer identity (Layer 2); the Berezin integral on `Λ(Rⁿ)`, the Pfaffian
of an alternating matrix over a commutative ring as a Berezin integral with its identities, and the
normalization of the Gaussian density (Layer 3); superconnections on smooth ℤ/2-graded vector
bundles, their Chern character forms, transgression forms, the character of `∇ + tX` and the
contour-integral projection onto a kernel of locally constant rank (Layer 4); the fibrewise
Berezin integral, the Mathai–Quillen Euler and Thom forms, their localization on the zero set of a
transverse section and the de Rham Poincaré–Hopf identity they give (Layer 5); the graded Cayley
transform and its converse, the embedding `W ↦ 2P_W − 1` of the complex Grassmannians in the
self-adjoint endomorphisms, the connection `P d P` on their tautological bundles, and the invariant
character forms on Grassmannians and unitary groups (Layer 6). No other roadmap owns
superconnections, the supertrace on `A ⊗̂ End(R^(m|n))`, the Berezin integral, the Mathai–Quillen
forms, the Thom form, Quillen's character or the graded Cayley transform. The
supercommutative algebras of SymplecticFieldTheory (§0.3, the free supercommutative algebra on a
graded ℚ-module) and of HopfologicalAlgebra (the exterior Hopf superalgebra) are particular
algebras, not the supertrace or the super tensor product with endomorphisms;
MotivesAndAlgebraicCycles and SchubertGeometry use alternating traces on graded cohomology, the
case `A = R` of 1.3.

**Shared with RandomMatrices.** RandomMatrices §8.5 develops Pfaffians of skew matrices for its
GOE kernels. 3.2 is the definition over every commutative ring, as the Berezin integral of the
divided power, with `Pf² = det` and `Pf(BΣBᵀ) = det B Pf(Σ)` for alternating matrices; on real
skew matrices it takes the values of RandomMatrices' Checks (3.2, Checks).

**Left to CharacteristicClasses.** The Chern–Weil forms of ordinary connections, their
closedness, connection independence by the transgression form, and the Chern character and
Pfaffian forms with their normalizations `ch(F) = tr exp((i/2π)F)`, `Pf([[0,a],[−a,0]]) = a`, the
Euler form of an oriented bundle of rank zero being its orientation sign (CharacteristicClasses
C4, items 1–2, and Conventions); the Thom class `U_E` (C2, item 1), the
Euler class of a transverse section as the Poincaré dual of its oriented zero locus, the
sum-of-local-indices formula and `e(TM)[M] = χ(M)` (C2, item 3), fibre integration with the
compact-support de Rham comparison (C2, item 5), and the identification of the Pfaffian class with
the real image of the Euler class (C5, item 5). Layers 4 and 5 compare their forms with these
classes and restate none of them.

**Left to DifferentialGeometry and SmoothBundlesConnections.** Differential forms, the wedge and
the exterior derivative (DifferentialGeometry Layers 0–1), orientations (Layer 2), integration and
Stokes' theorem (Layer 5) and de Rham cohomology (Layer 6); connections on vector bundles
associated with principal bundles (SmoothBundlesConnections B3.3), Hermitian and Euclidean fibre
metrics (B2.2), the exterior covariant derivative on bundle-valued forms, curvature and the
Bianchi identity (B4.1). Layer 4 is the ℤ/2-graded extension of B4.1, built on its bundle-valued
forms.

**Left to GeneralizedCohomology, LieGroups and LieGroupoidsPoisson.** The smooth graph-chart
structure on the complex Grassmannians `TauCeti.finiteGrassmannian ℂ p N` (GeneralizedCohomology
G4.0b), the embedded Lie-subgroup structure of `Matrix.unitaryGroup` (LieGroups Layer 2), and
smooth subbundles with the kernels and images of constant-rank bundle maps (LieGroupoidsPoisson
G0.1). 4.4 uses the last for `ker X`; 6.2 embeds the Grassmannians in the self-adjoint
endomorphisms and puts the connection `P d P` on their tautological bundles, which are images of
constant-rank projections.

**Compared with OperatorTheory/SelfAdjointSpectralTheory.** The Cayley transform
`U_A = (A − i)(A + i)⁻¹` of a self-adjoint operator and its unitarity are
SelfAdjointSpectralTheory's (SA-D24, SA-D27). For a skew-adjoint matrix `X` the transform of 6.1 is
`g = −U_(−iX)` (Convention 5); 6.1 proves its finite-dimensional statements from Mathlib's matrices
alone and adds the graded statement `εgε = g⁻¹`, which SA-D24 does not contain.

**Supplied by Mathlib and consumed by name.** Graded algebras and their decompositions, the graded
tensor product of graded algebras with its Koszul sign, the exterior and Clifford algebras with the
even–odd grading and their supercommutativity, contractions, exterior powers and alternating
maps, determinants, block matrices, the standard symplectic matrix and the bilinear form of a
matrix, polynomial rings and fraction fields, the conjugate transpose, self-adjoint elements and
the unitary group, the exponential of a Banach algebra, circle integrals, the Gaussian integral,
smooth embeddings of manifolds.

**Supplied by Tau Ceti and consumed by name.** Duhamel's formula for the derivative of the
exponential of a real Banach algebra, ℤ-graded differential graded algebras, smooth scalar and
bundle-valued differential forms on manifolds with their paired wedge, de Rham cohomology, the
finite Grassmannians, symplectic bases of nondegenerate alternating forms and the alternating
matrix with given strict-upper entries (Exact supplier contracts).

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
   `(a ⊗ u)(b ⊗ v) = (−1)^(|u||b|) ab ⊗ uv` (Garcia 2018, §A.1, (A.3)), the sign of Mathlib's
   `GradedTensorProduct.tmul_coe_mul_coe_tmul`, which on matrices reads
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
   multiplies forms of degree `2k` and of degree `2k − 1` by `(2πi)^(−k)`, so that `φ d = d φ` on
   odd forms (Berline–Getzler–Vergne, §1.4). For a connection `∇` on an ungraded bundle this is
   `tr exp((i/2π)F)`, CharacteristicClasses' normalization. Garcia 2018, §A.1, (A.6) and p. 24,
   writes the character as `str exp(𝔸²)` and multiplies its degree-`2p` part by `(−2πi)^(−p)`.
   The two normalizations agree on ordinary connections. For a superconnection with form-degree
   components `𝔸_j`, this roadmap's `ch(𝔸)` is Garcia's form of `𝔸′ = ∑_j i^(1−j) 𝔸_j`, which
   leaves the connection `𝔸₁` unchanged: multiplying forms of degree `k` by `(−i)^k` carries
   `exp(−𝔸²)` to `exp(𝔸′²)`, and `(−2πi)^(−p) (−i)^(2p) = (2πi)^(−p)`. Witness: on a line bundle
   with curvature `F = i dα` (CharacteristicClasses, Conventions), `φ(−F) = −i dα/(2πi) = −dα/2π`
   and `(i/2π)F = −dα/2π` agree; omitting `φ` would give `−i dα`, which is not real. On a form `β`
   of degree `2k − 1`, `φ(dβ) = (2πi)^(−k) dβ = d(φβ)`; scaling odd forms by `(2πi)^(−k+1)`
   instead would break this. On the trivial line over `ℝ⁴`, `𝔸 = d + η` with
   `η = x₁ dx₂∧dx₃∧dx₄` has `𝔸² = dη = vol₄` and `ch(𝔸) = 1 + vol₄/(4π²)`; Garcia's
   normalization applied to `𝔸` itself gives `1 − vol₄/(4π²)`, and applied to `𝔸′ = d − η` it
   gives `1 + vol₄/(4π²)`.
3. **The odd endomorphism.** In 2.5 and 4.4, `X = [[0, T*], [T, 0]]` is odd and self-adjoint,
   `T : E⁺ → E⁻`, so `X² = diag(T*T, TT*) ≥ 0` and `exp(−tX²)` decays as `t → ∞` where `T` is
   invertible. Witness: for `T = (a) : ℂ → ℂ`, `str exp(−tX²) = e^(−t|a|²) − e^(−t|a|²) = 0`, and
   for `T : ℂ⁰ → ℂ` (so `m = 0`, `n = 1`) it is `−1 = m − n`. Quillen 1988 uses the skew-adjoint
   `[[0, −T*], [T, 0]]` and writes the character with `exp(𝔸²)`; in degree zero the two agree,
   `exp((iX)²) = exp(−X²)`, and `iX`, the case `j = 0` of Convention 2's `𝔸′`, is of Quillen's
   form for `iT`.
4. **Berezin integral and orientation.** `∫_B` is the coefficient of `e₀ ∧ ⋯ ∧ e_(n−1)` in the
   top-degree component (Wu 2006, §2.1), and the Pfaffian of a `2r × 2r` matrix is
   `Pf(Σ) = ∫_B ω^[r]`, where `ω = ∑_(i<j) Σᵢⱼ eᵢeⱼ` and `ω^[r]` is its `r`-th divided power, the
   sum over the `r`-element sets of pairs `i < j` of the products of their terms; over a
   `ℚ`-algebra `ω^[r] = ω^r / r!` and `Pf(Σ) = ∫_B exp(ω)`, Wu's `∫_B e^(½(·, Σ ·))` (Wu 2006,
   §2.1). Witness: `Pf([[0, a], [−a, 0]]) = a`, as in
   CharacteristicClasses' Conventions; reversing the orientation (`e₁ ∧ e₀`) gives `−a`. The
   Mathai–Quillen forms carry the factor `(−1)^(r(r+1)/2) (2π)^(−r/2)` (Wu 2006, (2.5) and (2.7)),
   which makes the fibre form exactly the Gaussian density: on `ℝʳ` with `∇ = d`,
   `∫_B exp(−∑ dxᵢ eᵢ)` is `(−1)^r (−1)^(r(r−1)/2) dx₁ ⋯ dx_r = (−1)^(r(r+1)/2) dx₁ ⋯ dx_r`
   (`r = 1`: `−dx₁`; `r = 2`: `−dx₁dx₂`), and the prefactor cancels the sign. On a bundle, `∫_B`
   is computed in oriented orthonormal frames. In rank zero the only frame is empty, and `∫_B` is
   multiplication by the orientation sign `o : M → {±1}` relative to the empty basis,
   CharacteristicClasses' rank-zero convention (Conventions), while the Pfaffian of the empty
   matrix is `1`. Witness: for the zero bundle over a point with the negative orientation,
   `∫_B 1 = −1`, so its Euler form is `−1`, while the empty Pfaffian gives `+1`.
5. **The Cayley transform.** `g = (1 + X)(1 − X)⁻¹` for skew-adjoint `X`, so `g = 1` at `X = 0`
   and `g = −U_(−iX)` with SelfAdjointSpectralTheory's `U_A = (A − i)(A + i)⁻¹`. Witness: at
   `X = 0`, `U_0 = (−i)(i)⁻¹ = −1`, so `−U_0 = 1 = g`; for `X = (iθ)` on `ℂ`,
   `g = (1 + iθ)/(1 − iθ)`, of modulus `1`, and `g = −1` is never reached.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Graded algebras: `GradedAlgebra`, `DirectSum.decompose`, `DirectSum.decomposeLinearEquiv`,
  `DirectSum.component` (`RingTheory/GradedAlgebra/Basic`, `Algebra/DirectSum/Decomposition`,
  `Algebra/DirectSum/Module`), `DirectSum.of`, `DirectSum.coeAddMonoidHom`, `ZMod`, `Submodule`.
- Graded tensor product: `GradedTensorProduct` (notation `𝒜 ᵍ⊗[R] ℬ`), `GradedTensorProduct.of`,
  `GradedTensorProduct.tmul`, its ring structure `GradedTensorProduct.instRing` and the sign rule
  `GradedTensorProduct.tmul_coe_mul_coe_tmul` (`LinearAlgebra/TensorProduct/Graded/Internal`),
  for an index with `Module (ZMod 2) (Additive ℤˣ)` (`Data/ZMod/IntUnitsPower`);
  `matrixEquivTensor` (`RingTheory/MatrixAlgebra`).
- Exterior and Clifford algebras: `ExteriorAlgebra`, `ExteriorAlgebra.ι`,
  `ExteriorAlgebra.ι_add_mul_swap`, `ExteriorAlgebra.map`,
  the exterior powers `⋀[R]^i M` (`ExteriorAlgebra.exteriorPower`) and the instance
  `ExteriorAlgebra.gradedAlgebra` (`LinearAlgebra/ExteriorAlgebra/Basic`, `…/Grading`),
  `exteriorPower.alternatingMapLinearEquiv` (`LinearAlgebra/ExteriorPower/Basic`),
  `CliffordAlgebra.evenOdd` with its instance `CliffordAlgebra.gradedAlgebra`
  (`LinearAlgebra/CliffordAlgebra/Grading`),
  `CliffordAlgebra.map_mul_map_of_isOrtho_of_mem_evenOdd` (`LinearAlgebra/CliffordAlgebra/Prod`),
  `CliffordAlgebra.contractLeft` (`LinearAlgebra/CliffordAlgebra/Contraction`),
  `QuadraticMap.Isometry.id`, `QuadraticForm`.
- Finite sums and products: `Finset.powersetCard`, `Finset.noncommProd`, `Commute`.
- Linear algebra: `Basis.det`, `Basis.reindex`, `Pi.basisFun`, `LinearMap.det`, `Matrix.det`,
  `Matrix.trace`, `Matrix.trace_mul_pow_comm_of_ne_zero` (`LinearAlgebra/Matrix/Trace`),
  `Matrix.map`, `Matrix.fromBlocks`, `Matrix.conjTranspose`, `Matrix.unitaryGroup`, `selfAdjoint`,
  `Pi.single`; the standard symplectic matrix `Matrix.J` (`LinearAlgebra/SymplecticGroup`), and
  `Matrix.toBilin'`, `LinearMap.BilinForm.toMatrix` and
  `LinearMap.BilinForm.nondegenerate_toBilin'_iff_det_ne_zero`
  (`LinearAlgebra/Matrix/BilinearForm`).
- Rings: `MvPolynomial`, `FractionRing`.
- Analysis: `NormedSpace.exp` (`Analysis/Normed/Algebra/Exponential`), `HasDerivAt`,
  `MeasureTheory.integral`, `circleIntegral` (`MeasureTheory/Integral/CircleIntegral`),
  `EuclideanSpace`, `GaussianFourier.integral_rexp_neg_mul_sq_norm`
  (`Analysis/SpecialFunctions/Gaussian/FourierTransform`), `Real.exp`, `Real.pi`.
- Manifolds: `Manifold.IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding`).

**From Tau Ceti** (at the pin).

- Duhamel's formula (`TauCeti/Analysis/SpecialFunctions/Exponential`):
  `TauCeti.hasFDerivAt_exp`, the Fréchet derivative `TauCeti.expFDeriv 𝕂 x` of the exponential
  of a Banach algebra, and `TauCeti.expFDeriv_apply_eq_integral`,
  `expFDeriv 𝕂 x y = ∫₀¹ exp((1 − s)x) y exp(sx) ds`, for 4.3 and 4.4.
- Differential graded algebras (`TauCeti/Algebra/Homology/DG/Algebra/Defs`):
  `TauCeti.IsDGAlgebra 𝒜 d` for `𝒜 : ℤ → Submodule R A`, for 2.1.
- Differential forms (`TauCeti/Geometry/Manifold/DifferentialForm/Smooth`,
  `…/DifferentialForm/Curvature`, `…/DifferentialForm/Wedge/Smooth/Bundle`): the smooth forms
  `TauCeti.SmoothForm`, the smooth bundle-valued forms `TauCeti.SmoothBundleForm`, the
  endomorphism-valued two-forms `TauCeti.CurvatureForm`, and the paired wedge
  `TauCeti.SmoothBundleForm.wedgeWith`, the carriers of `Ω(M, E)` and `Ω(M, End E)` in Layers 4,
  5 and 6.2.
- De Rham cohomology (`TauCeti/Geometry/Manifold/DeRham/Basic`): `TauCeti.deRhamCohomology`, for
  the classes of 4.3, 5.2–5.4 and 6.2.
- Finite Grassmannians (`TauCeti/Topology/Grassmannian/Basic`): `TauCeti.finiteGrassmannian ℂ p N`,
  the `p`-dimensional subspaces of `Fin N → ℂ`, for 6.2.
- Symplectic bases (`TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis`):
  `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, a nondegenerate alternating bilinear
  form on a finite-dimensional vector space over a field has a basis indexed by `Fin m ⊕ Fin m` in
  which its matrix is `Matrix.J (Fin m) K`, for 3.2.
- Alternating matrices (`TauCeti/LinearAlgebra/Matrix/Alternating`): `Matrix.ofStrictUpper`, the
  matrix with zero diagonal and opposite lower entries that completes given strict-upper entries,
  for the generic alternating matrix of 3.2.

**From CharacteristicClasses.** Conventions (the normalization of Chern character and Pfaffian
forms, and the Euler form of rank zero), for Conventions 2 and 4 and 5.1; C4, items 1–2
(Chern–Weil forms of connections, closedness, transgression, the Chern character form, the
Pfaffian form), for 4.3 and 5.1; C2, item 1 (the Thom class `U_E`), for 5.4; C2, item 3 (the Euler
class of a transverse section, the sum-of-local-indices formula, `e(TM)[M] = χ(M)`), for 5.3; C2,
item 5 (fibre integration and the compact-support de Rham comparison), for 5.4; C5, item 5 (the
Pfaffian class is the real image of
the Euler class), for 5.3.

**From DifferentialGeometry.** Layer 0 (differential forms and the wedge), Layer 1 (the exterior
derivative), Layer 2 (orientations), Layer 5 (integration and Stokes' theorem), Layer 6 (de Rham
cohomology), for Layers 4 and 5 and 6.2.

**From SmoothBundlesConnections.** B3.3 (induced connections on associated vector bundles) and
B4.1 (bundle-valued forms, the exterior covariant derivative, curvature, Bianchi), for 4.1–4.2
and 5.1; B2.2 (Hermitian and Euclidean fibre metrics), for 4.4 and 5.1.

**From GeneralizedCohomology.** G4.0b (the smooth graph-chart structure on the complex finite
Grassmannians, of real dimension `2p(N − p)`), for 6.2.

**From LieGroups.** Layer 2 (the classical matrix groups, `Matrix.unitaryGroup` among them, as
embedded Lie subgroups of `GL_n`), for 6.2.

**From LieGroupoidsPoisson.** G0.1 (the smooth-subbundle API: kernels and images of constant-rank
bundle maps are smooth subbundles), for 4.4 and 6.2.

## How to read the build

Layer 1 is linear algebra over a `ZMod 2`-graded algebra: supercommutativity, the block-parity
grading of matrices, the comparison of Mathlib's graded tensor product `A ⊗̂ End(R^(m|n))` with
Koszul-signed supermatrices, and the supertrace. Layer 2 is Quillen's algebraic model: a
supercommutative `ZMod 2`-graded differential graded algebra plays the forms on `M` (Tau Ceti's
ℤ-graded ones give such algebras on their parity grading), an odd supermatrix plays `𝔸 − d` on a
trivialized bundle, and the closedness and transgression of the character are proved for every
component `str(F^k)`; the degree-zero McKean–Singer identity is the case `A = ℂ`. Layer 3 builds the
Berezin integral and the Pfaffian, the algebra of the Mathai–Quillen forms. Layers 4 and 5 transport
Layers 1–3 fibrewise to smooth bundles, on Tau Ceti's bundle-valued forms and the carriers of
DifferentialGeometry and SmoothBundlesConnections, sum the components of the character with Tau
Ceti's Duhamel formula, and compare the resulting classes with CharacteristicClasses: Layer 4 for
superconnections and Quillen's character of `∇ + tX`, Layer 5 for the Mathai–Quillen Euler and Thom
forms; Layer 4 takes the kernel bundle of `X` from LieGroupoidsPoisson's subbundles. Layer 6
treats the graded Cayley transform and its converse, whose algebra (6.1) uses only Mathlib, and
the invariant character forms on Grassmannians and unitary groups (6.2), which use 6.1 for the
charts, Layer 4, DifferentialGeometry, and the smooth Grassmannians, unitary groups and
subbundles of GeneralizedCohomology, LieGroups and LieGroupoidsPoisson.

## Layer 1: superalgebras, supermatrices and the supertrace

### 1.1 Supercommutative algebras

Define `IsSuperCommutative 𝒜` for `𝒜 : ZMod 2 → Submodule R A`: homogeneous `a ∈ 𝒜 i`,
`b ∈ 𝒜 j` satisfy `ab = (−1)^(ij) ba`; the parity involution `parityInv 𝒜`,
`a₀ + a₁ ↦ a₀ − a₁` through `DirectSum.decompose`, and its powers `parityPow 𝒜 k` for `k : ZMod 2`.
The exterior algebra, graded by `CliffordAlgebra.evenOdd` of the zero form, satisfies
`IsSuperCommutative`, over every commutative ring: Mathlib's
`CliffordAlgebra.map_mul_map_of_isOrtho_of_mem_evenOdd` with both isometries the identity
`QuadraticMap.Isometry.id 0`, every two vectors being orthogonal for the zero form
(Berline–Getzler–Vergne, §1.3).
*Needs:* Mathlib `GradedAlgebra`, `DirectSum.decompose`, `CliffordAlgebra.evenOdd`,
`CliffordAlgebra.map_mul_map_of_isOrtho_of_mem_evenOdd`, `QuadraticMap.Isometry.id`,
`ExteriorAlgebra`, `QuadraticForm`.

**API.**

- `parityInv 𝒜` is an `R`-algebra automorphism of `A` and an involution; it is `1` on `𝒜 0` and
  `−1` on `𝒜 1`, and `parityPow 𝒜 (i + j) = parityPow 𝒜 i ∘ parityPow 𝒜 j`.
- On `a ∈ 𝒜 i`, `parityPow 𝒜 k a = (−1)^(ik) a`.

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

Define the parity `sPar` of `m ⊕ n` (`0` on `m`, `1` on `n`), the block-parity grading
`blockGrading R m n : ZMod 2 → Submodule R (Matrix (m ⊕ n) (m ⊕ n) R)`, whose part of parity `i`
consists of the matrices vanishing off the entries `(k, l)` with `|k| + |l| = i`, with its
instance `GradedAlgebra (blockGrading R m n)` (the entrywise projections `blockPart`), so that
`A ⊗̂ End(R^(m|n))` is Mathlib's `𝒜 ᵍ⊗[R] blockGrading R m n`. Define the product
`superMul 𝒜 X Y` of Convention 1, `(X ⋆ Y) k l = ∑ j, X k j σ^(|k| + |j|)(Y j l)`,
`IsSuperHomogeneous 𝒜 p X` (every entry `X k l` lies in `𝒜 (p + |k| + |l|)`), and the `R`-linear
equivalence `superMatrixEquiv 𝒜 : 𝒜 ᵍ⊗[R] blockGrading R m n ≃ₗ[R] Matrix (m ⊕ n) (m ⊕ n) A`,
`a ᵍ⊗ₜ E k l ↦ a E k l`, Mathlib's `matrixEquivTensor` read through `GradedTensorProduct.of`.
Prove `superMatrixEquiv_mul`, that it carries the product of `𝒜 ᵍ⊗[R] blockGrading R m n` to
`superMul`, and `isSuperHomogeneous_superMatrixEquiv_tmul`, that it carries `a ᵍ⊗ₜ b` with
`a ∈ 𝒜 i` and `b` of block parity `j` to a supermatrix of parity `i + j` (Garcia 2018, §A.1, (A.3),
p. 23, for `A = Ω(M)`; Berline–Getzler–Vergne, §1.3). Route: both sides are additive in each
argument, so it suffices to compare `(a ᵍ⊗ₜ E k j)(b ᵍ⊗ₜ E j′ l)` for homogeneous `b`, where
`GradedTensorProduct.tmul_coe_mul_coe_tmul` gives `(−1)^((|k| + |j|)|b|) ab ᵍ⊗ₜ E k j E j′ l` and
`σ^(|k| + |j|)(b) = (−1)^((|k| + |j|)|b|) b`.
*Needs:* 1.1; Mathlib `Matrix`, `GradedAlgebra`, `DirectSum.of`, `DirectSum.coeAddMonoidHom`,
`GradedTensorProduct`, `GradedTensorProduct.of`, `GradedTensorProduct.tmul_coe_mul_coe_tmul`,
`matrixEquivTensor`.

**API.**

- `superMul 𝒜` is `R`-bilinear, associative (transported from `GradedTensorProduct.instRing` by
  `superMatrixEquiv_mul`), with two-sided unit `1`.
- Parities add: `IsSuperHomogeneous 𝒜 p X` and `IsSuperHomogeneous 𝒜 q Y` give
  `IsSuperHomogeneous 𝒜 (p + q) (X ⋆ Y)`, since a homogeneous supermatrix of parity `p` is a sum
  of images `a ᵍ⊗ₜ E k l` with `|a| + |k| + |l| = p`.
- `blockGrading R m n 0` is the block-diagonal matrices and `blockGrading R m n 1` the
  block-off-diagonal ones (`Matrix.fromBlocks A 0 0 D` and `Matrix.fromBlocks 0 B C 0`).
- The instance `blockGradedAlgebra` is built from the decomposition `blockDecompose` into the two
  blocks, with `blockPart_mem`, `blockPart_zero_add_blockPart_one` and `blockPart_of_mem`.

**Checks.**

- For `A` trivially graded, `σ = 1` and `superMul` is the matrix product.
- The Koszul sign: over `A = Λ(R¹)` with generator `e` and `m = n = 1`, the odd supermatrices
  `E₂₁` (entry `1` at `(inr, inl)`) and `e E₁₁` give `E₂₁ ⋆ e E₁₁ = σ(e) E₂₁ = −e E₂₁`, and in
  the graded tensor product `(1 ᵍ⊗ₜ E₂₁)(e ᵍ⊗ₜ E₁₁) = (−1)^(1·1) e ᵍ⊗ₜ E₂₁`; the matrix product
  would give `+e E₂₁`, which is the ungraded `A ⊗ M₂(R)` of `matrixEquivTensor`.
- In the other order, `e E₁₁ ⋆ E₁₂ = e E₁₂` with no sign, since `σ^(|1| + |1|) = σ⁰`, matching
  `(e ᵍ⊗ₜ E₁₁)(1 ᵍ⊗ₜ E₁₂) = (−1)^(0·0) e ᵍ⊗ₜ E₁₂`.
- The identity matrix has block parity `0` (`|k| + |k| = 0`) and is a two-sided unit of `superMul`,
  since `σ(1) = 1`; `E₁₂` has block parity `1`, and `e E₁₂` has supermatrix parity `0`.
- The grading of the entries is not the block grading of `ℬ`: with the trivial grading of `A`,
  `E₁₂` has parity `1` although its entry `1` is even.

### 1.3 The supertrace

Define `superTrace X = ∑ᵢ X i i − ∑ⱼ X j j`, the even diagonal block minus the odd one. Prove
`superTrace_superMul_comm`: on a supercommutative `A`, for `X` of parity `p` and `Y` of parity
`q`, `str(X ⋆ Y) = (−1)^(pq) str(Y ⋆ X)`, so the supertrace vanishes on supercommutators
(Garcia 2018, §A.1, (A.1) and (A.4), p. 23, for `A = ℂ` and its `Ω(M)`-linear extension;
Berline–Getzler–Vergne, §1.3). Route: compare the terms `X k l σ^(|k|+|l|)(Y l k)` and
`Y l k σ^(|k|+|l|)(X k l)`; supercommutativity of the entries, of parities `p + |k| + |l|` and
`q + |k| + |l|`, gives the sign `(−1)^(pq + |k| + |l|)`, which the signs `(−1)^(|k|)` and
`(−1)^(|l|)` of the supertrace turn into `(−1)^(pq)`.
*Needs:* 1.1, 1.2.

**API.**

- `superTrace` is `R`-linear, and `str(a • X) = a str X` for `a` in the centre of `A`.
- `str(X.map f) = f(str X)` for every additive map `f : A → A`; in particular
  `str(dMat d X) = d(str X)` for the differential of 2.1.
- `str 1 = m − n`.

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

### 2.1 Differential graded superalgebras

Define the structure `SuperDGA 𝒜`, the `ZMod 2`-graded notion of a differential graded algebra: an
`R`-linear map `d` that is odd (`d_mem`), satisfies the graded Leibniz rule
`d(ab) = d(a) b + σ(a) d(b)` (`d_mul`) and `d ∘ d = 0` (`d_d`); the entrywise differential
`dMat δ X` of a supermatrix, and the supercommutator `superComm 𝒜 p q X Y = X ⋆ Y − (−1)^(pq) Y ⋆ X`
(Garcia 2018, §A.1, (A.5), p. 23; Wu 2006, §2.3). Define the parity regrading
`parityGrading 𝒜 i = ⨆_(p ≡ i mod 2) 𝒜 p` of a ℤ-grading and prove
`exists_superDGA_of_isDGAlgebra`: if `TauCeti.IsDGAlgebra 𝒜 d` and the parity regrading is a
grading, then `d` is the differential of a `SuperDGA (parityGrading 𝒜)`. Prove that `dMat` is an
odd derivation of `superMul` on homogeneous supermatrices,
`d(X ⋆ Y) = dX ⋆ Y + (−1)^(|X|) X ⋆ dY`: it uses `d σ = −σ d`, which follows from `d_mem`.
Route: for the comparison, `d_mem` and `d_d` are `IsDGAlgebra.map_mem` and `IsDGAlgebra.sq_zero`,
and `d_mul` is `IsDGAlgebra.leibniz` on each ℤ-homogeneous component of `a`, where `σ` acts by
`(−1)^p = p.negOnePow`. Differential forms on `ℝᵈ`, ℤ-graded by degree, are the motivating
instance.
*Needs:* 1.2; Tau Ceti `TauCeti.IsDGAlgebra`.

**API.**

- `δ.d 1 = 0` and `δ.d (algebraMap R A r) = 0`.
- `δ.d ∘ parityInv 𝒜 = −(parityInv 𝒜 ∘ δ.d)`.
- `dMat δ` is `R`-linear and odd: it sends supermatrices of parity `p` to parity `p + 1`.
- For a ℤ-graded algebra `𝒜`, `parityGrading 𝒜` is a `ZMod 2`-graded algebra,
  `GradedAlgebra (parityGrading 𝒜)`: `1 ∈ 𝒜 0`, `𝒜 p · 𝒜 q ⊆ 𝒜 (p + q)`, and the component of
  parity `i` of `a` is the sum of its components of degrees `p ≡ i mod 2`. This is the instance
  `exists_superDGA_of_isDGAlgebra` takes; it is unique, since `DirectSum.Decomposition` is a
  subsingleton.

**Checks.**

- `d(1) = 0`: `d(1) = d(1 · 1) = 2 d(1)`.
- `Λ(Rᵈ)` with `d = 0` is an instance, and so is `ℤ`, graded in degree `0`; the parity of a form is
  its degree mod 2, so `d` is odd.
- The ungraded Leibniz rule is wrong for forms: for `a = dx`, `b = y` on `ℝ²`,
  `d(dx · y) = d(y dx) = dy ∧ dx = −dx ∧ dy`, which is `d(dx) y + σ(dx) dy`, while
  `d(dx) y + dx dy` gives `+dx ∧ dy`.
- The comparison keeps the sign: for `a ∈ 𝒜 p`, `σ(a) = (−1)^p a` in the parity regrading, which
  is `p.negOnePow • a`, the sign of `TauCeti.IsDGAlgebra.leibniz`; with `σ = 1` the comparison
  would fail on `dx · y` as above.
- The parity regrading of `ℤ[x]`, graded by degree (nothing in negative degrees), is the even and
  the odd polynomials: the parity-`0` component of `1 + x + x²` is `1 + x²`, and `x · x² = x³` is
  odd; the parity involution sends `p(x) = 1 + x + x²` to `1 − x + x² = p(−x)`.

### 2.2 Superconnections, curvature and the Bianchi identity

For an odd supermatrix `Θ`, the superconnection `𝔸 = d + Θ` on `A ⊗ R^(m|n)` has curvature
`curvature δ Θ = dΘ + Θ ⋆ Θ`, and acts on a supermatrix `X` of parity `p` by
`covD δ Θ p X = dX + [Θ, X]`. Prove `bianchi`: `[𝔸, 𝔸²] = 0`, `covD δ Θ 0 (curvature δ Θ) = 0`
(Wu 2006, §2.3, the curvature `D² = R + ∇L + L²`; Berline–Getzler–Vergne, §1.4). Route:
`d(dΘ) = 0`, `d(Θ ⋆ Θ) = dΘ ⋆ Θ − Θ ⋆ dΘ` by 2.1, and the cubic terms cancel.
*Needs:* 2.1.

**API.**

- Leibniz rule: for `X` of parity `p` and `Y` of parity `q`,
  `covD δ Θ (p + q) (X ⋆ Y) = covD δ Θ p X ⋆ Y + (−1)^p X ⋆ covD δ Θ q Y`, from 2.1 and
  `[Θ, X ⋆ Y] = [Θ, X] ⋆ Y + (−1)^p X ⋆ [Θ, Y]`.
- `covD δ Θ p` is `R`-linear and raises parity by `1`; `covD δ 0 p = dMat δ` on parity `p`.

**Checks.**

- For `A = R` with `d = 0` and `Θ = X` odd, the curvature is `X ⋆ X = X²`, with
  `X = [[0, T*], [T, 0]]` giving `diag(T*T, TT*)` (Convention 3).
- For `n = 0` and `Θ` an `m × m` matrix of one-forms, `curvature = dΘ + Θ ∧ Θ`, the curvature of a
  connection `d + Θ`, as in CharacteristicClasses' Conventions.
- The parity argument of `covD` matters: for `A = R`, `d = 0`, Bianchi reads
  `Θ ⋆ Θ² − Θ² ⋆ Θ = 0`; computing `[Θ, F]` with the sign of two odd elements instead gives
  `2Θ³`, which is `2Θ ≠ 0` for `Θ = [[0, 1], [1, 0]]`.

### 2.3 The Chern character is closed

Define `superPow 𝒜 F k`. Prove `isClosed_superTrace_superPow`: on a supercommutative differential
graded superalgebra, every component `str(F^k)` of the character of `d + Θ`, `F` its curvature,
is closed (Garcia 2018, §A.1, the first property after (A.7), p. 24; Wu 2006, §2.3, after (2.8);
Berline–Getzler–Vergne, §1.4). Route: `covD δ Θ 0 (F^k) = 0` by Bianchi and the Leibniz rule of
`covD` (2.2), and `str(covD δ Θ 0 Y) = d str(Y)` for every even `Y`, since
`str(dMat δ Y) = d str(Y)` (1.3) and `str` kills the supercommutator `[Θ, Y]` (1.3).
*Needs:* 1.3, 2.1, 2.2.

**API.**

- `superPow 𝒜 F (k + l) = superPow 𝒜 F k ⋆ superPow 𝒜 F l`, and `F^k` is even when `F` is.
- On a supercommutative `A`, `str(covD δ Θ p X) = d str(X)` for `X` homogeneous of parity `p`.

**Checks.**

- `k = 0`: `str(1) = m − n` is a constant, closed since `d(1) = 0`.
- `A = R`, `d = 0`, `Θ = X`: `str(X^(2k))` is `tr((T*T)^k) − tr((TT*)^k) = 0` for `k ≥ 1`, the
  algebraic heart of 2.5.
- Without supercommutativity the statement fails: the supertrace of a commutator is then not zero
  (1.3, Checks), and `d str(F²)` picks up `str([Θ, F²])`.

### 2.4 Transgression

Prove `transgression`: for an even derivation `∂` of `A` that preserves the grading and commutes
with `d`, `∂ str(F^(k+1)) = (k + 1) d str((∂Θ) ⋆ F^k)` (Garcia 2018, §A.1, (A.9), p. 24, for the
form `d/dt str e^(𝔸_t²) = d str(𝔸̇_t e^(𝔸_t²))`, which it cites as Berline–Getzler–Vergne,
Proposition 1.41). For `A` the forms on `M` depending smoothly on a parameter `t` and `∂ = ∂/∂t`,
summing the series of `exp(−F)` gives `d/dt str exp(−𝔸_t²) = −d str(𝔸̇_t exp(−𝔸_t²))`. Route:
`∂F = [𝔸, ∂Θ]`, so `∂ str(F^(k+1)) = (k + 1) str([𝔸, ∂Θ] ⋆ F^k)` by graded cyclicity, which is
`(k + 1) str([𝔸, (∂Θ) ⋆ F^k]) = (k + 1) d str((∂Θ) ⋆ F^k)` by Bianchi; no division is used.
*Needs:* 1.3, 2.2, 2.3.

**Checks.**

- `k = 0`: `∂ str(dΘ + Θ²) = d str(∂Θ)`, since `str(∂Θ ⋆ Θ) + str(Θ ⋆ ∂Θ) = 0` by 1.3.
- For `Θ_t = Θ₀ + t η` with `A` forms on `M` with polynomial coefficients in `t`, the right side
  integrates over `[0, 1]` to the Chern–Simons form whose differential is
  `str(F₁^(k+1)) − str(F₀^(k+1))`, the connection-path argument of CharacteristicClasses C4,
  item 1, in the ungraded case `n = 0`.
- `k = 1`, `d = 0`: the right side is `0`, and the left side is
  `∑_(i=0..3) str(Θ^i ⋆ ∂Θ ⋆ Θ^(3−i)) = (1 − 1 + 1 − 1) str(∂Θ ⋆ Θ³) = 0` by 1.3; `str(Θ⁴)`
  itself need not vanish (`A = 𝔽₂[x]`, `x` odd, `m = 1`, `n = 0`, `Θ = (x)`: `str(Θ⁴) = x⁴`,
  while `∂ = x d/dx` gives `∂ x⁴ = 4x⁴ = 0`).

### 2.5 The degree-zero character: McKean–Singer in finite dimensions

Prove `trace_exp_sub_trace_exp`: for every complex `n × m` matrix `T` and `t ∈ ℂ`,
`tr exp(−t T*T) − tr exp(−t TT*) = m − n`; it is the degree-zero component
`str exp(−tX²) = m − n` of the character of `d + √t X` (Convention 3; the degree-zero part of
the character form of Wu 2006, §2.3, (2.8)). Route: expand
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

### Examples

- `A = Λ(ℝᵈ)` with `d = 0`, `Θ = X + θ` with `θ` an odd matrix of constant one-forms: 2.2–2.4 are
  identities of polynomials in the entries.
- The trivial graded bundle `ℂ^(m|n)` over `M` with `𝔸 = d + √t X(x)`: Layer 4's 4.4 at the
  level of forms on a trivialization.

### Dependencies

2.1 ← 1.2, Tau Ceti `TauCeti.IsDGAlgebra`; 2.2 ← 2.1; 2.3 ← 1.3, 2.1, 2.2; 2.4 ← 1.3, 2.2, 2.3;
2.5 ← Mathlib.

## Layer 3: the Berezin integral and the Pfaffian

### 3.1 The Berezin integral

Define `berezin n : ExteriorAlgebra R (Fin n → R) →ₗ[R] R`: project to the top degree (Mathlib's
decomposition of `ExteriorAlgebra.gradedAlgebra`) and evaluate the alternating form
`(Pi.basisFun R (Fin n)).det` through `exteriorPower.alternatingMapLinearEquiv` (Convention 4;
Wu 2006, §2.1; Berline–Getzler–Vergne, §1.3). Prove `berezin_map`: for a linear map `f` of `Rⁿ`,
`∫_B Λ(f)(x) = det f · ∫_B x`, the change of variables of the Berezin integral. Route: `Λ(f)`
preserves degrees and acts on the top degree by `det f`.
*Needs:* Mathlib `ExteriorAlgebra.map`, `exteriorPower.alternatingMapLinearEquiv`, `Basis.det`,
`DirectSum.decomposeLinearEquiv`, `DirectSum.component`, `LinearMap.det`,
`CliffordAlgebra.contractLeft`.

**API.**

- `∫_B` vanishes on `⋀[R]^i (Fin n → R)` for `i ≠ n`, and on `⋀[R]^n (Fin n → R)` it is the
  coordinate along `e₀ ∧ ⋯ ∧ e_(n−1)`.
- For a permutation `σ` of `Fin n`, `∫_B e_(σ 0) ⋯ e_(σ(n−1)) = sign σ`.
- `∫_B (ι_v x) = 0` for the contraction `ι_v` by a linear form `v` (Mathlib's
  `CliffordAlgebra.contractLeft` at the zero form), which lowers degrees by one, so that the
  top-degree part of `ι_v x` comes from `⋀^(n+1) = 0`; this is the vanishing 5.2 uses.

**Checks.**

- `∫_B e₀e₁ = 1` and `∫_B e₁e₀ = −1` in `Λ(R²)`; `∫_B 1 = 0` for `n ≥ 1`, and `∫_B 1 = 1` for
  `n = 0`.
- `∫_B` kills lower degrees: `∫_B (e₀ + 3e₀e₁) = 3`; a definition by the coefficient of `e₀` in
  degree one would give `1`.
- For `f` swapping `e₀` and `e₁`, `det f = −1` and `∫_B Λ(f)(e₀e₁) = ∫_B e₁e₀ = −1`.

### 3.2 The Pfaffian as a Berezin integral

For a matrix `Σ` over a commutative ring, define `pairForm Σ (i, j) = Σᵢⱼ eᵢ eⱼ` on the pairs
`ijPairs N` with `i < j`, the two-form `skewForm Σ = ∑_(i<j) Σᵢⱼ eᵢ eⱼ`, which is `½ (·, Σ ·)` for
skew `Σ`, its divided powers `skewFormDivPow Σ r = ∑_S ∏_(p ∈ S) pairForm Σ p`, the sum over the
`r`-element subsets `S` of `ijPairs N`, the product being `Finset.noncommProd` since two-forms
commute (`commute_pairForm`), and `pfaffian Σ = ∫_B skewFormDivPow Σ r` for a `2r × 2r` matrix
(Convention 4; Wu 2006, §2.1). Expanded by 3.1, `∫_B ω^[r]` is the sum, over the perfect matchings
`{(i₁, j₁), …, (i_r, j_r)}` of `{0, …, 2r − 1}` with `iₜ < jₜ`, of the sign of the permutation
`(i₁, j₁, …, i_r, j_r)` times `Σ_(i₁j₁) ⋯ Σ_(i_rj_r)`, the expansion (0.8) of the Pfaffian in
Knuth 1996, §0, p. 2. Prove `factorial_mul_pfaffian`, `r! Pf(Σ) = ∫_B (skewForm Σ)^r`, for every
matrix (for real skew `Σ`, Wu 2006, §2.1, p. 1: `∫_B e^σ = ⟨ν, σ^(n/2)/(n/2)!⟩` for a two-form
`σ`); and for alternating `Σ` (`Σᵀ = −Σ` and `Σᵢᵢ = 0`) `pfaffian_sq`, `Pf(Σ)² = det Σ`, Cayley's
theorem for the general skew-symmetric matrix (Knuth 1996, §6, p. 10), and
`pfaffian_mul_mul_transpose`, `Pf(BΣBᵀ) = det B Pf(Σ)`, whose case `Pf(AᵀQA) = det A` for `Q`
block diagonal with blocks `[[0, 1], [−1, 0]]` is Brioschi's (Knuth 1996, §6, p. 11). The sources
state these identities for real or for generic matrices; over every commutative ring they are
identities of integral polynomials in the entries, obtained below from the generic alternating
matrix over `ℤ`. Over a `ℚ`-algebra the first gives `Pf(Σ) = (r!)⁻¹ ∫_B ω^r = ∫_B exp(ω)`, Wu's
definition. Route: the first because the terms `pairForm Σ p` commute and square to `0`, so `ω^r`
is `r!` times the sum over `r`-element sets. The third by 3.1 applied to `f = B`:
`Λ(B)(skewForm Σ) = skewForm (BΣBᵀ)` uses that `Σ` is alternating, and
`Λ(B)(skewFormDivPow Σ r) = skewFormDivPow (BΣBᵀ) r` holds because `r!` times either side is
`(skewForm (BΣBᵀ))^r` by the argument for the first, over the generic ring `ℤ[xᵢⱼ, bₖₗ]`, whose
exterior algebra has no `ℤ`-torsion, and specializes. The second by reduction to the generic
alternating matrix `G = Matrix.ofStrictUpper x` over `A = ℤ[xᵢⱼ | i < j]`, which specializes to
every alternating matrix, Pfaffians and determinants commuting with ring homomorphisms. Its
determinant is nonzero, since specializing `G` to `J₂ ⊕ ⋯ ⊕ J₂`, `J₂ = [[0, 1], [−1, 0]]`, gives
`1`; so over the fraction field `K` of `A` the alternating form `Matrix.toBilin' G` is
nondegenerate (`LinearMap.BilinForm.nondegenerate_toBilin'_iff_det_ne_zero`), and Tau Ceti's
`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` gives a basis indexed by `Fin r ⊕ Fin r`
(by counting dimensions) in which its matrix is `Matrix.J (Fin r) K = [[0, −1], [1, 0]]` in
blocks. Reindexed into adjacent pairs, `inr a ↦ 2a` and `inl a ↦ 2a + 1`, the basis has matrix
`D = J₂ ⊕ ⋯ ⊕ J₂`, of Pfaffian `1` and determinant `1`, so `G = CDCᵀ` with `C` the inverse
transpose of the change-of-basis matrix; the third identity gives `Pf(G) = det C`, and
`det G = (det C)² = Pf(G)²` in `K`, hence in `A`.
*Needs:* 3.1; Mathlib `Matrix.det`, `Matrix.transpose`, `Finset.powersetCard`,
`Finset.noncommProd`, `ExteriorAlgebra.ι_add_mul_swap`, `MvPolynomial`, `FractionRing`,
`Matrix.J`, `Matrix.toBilin'`, `LinearMap.BilinForm.toMatrix`,
`LinearMap.BilinForm.nondegenerate_toBilin'_iff_det_ne_zero`, `Basis.reindex`; Tau Ceti
`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, `Matrix.ofStrictUpper`.

**API.**

- `skewForm Σ` and `pfaffian Σ` depend only on the entries `Σᵢⱼ` with `i < j`.
- `commute_ι_mul_ι_ι`: `ι x ι y` commutes with every `ι z`, hence two-forms commute.
- `skewFormDivPow Σ 0 = 1`, `skewFormDivPow Σ 1 = skewForm Σ`, and `pfaffian (c • Σ) = c^r Pf(Σ)`.
- For a ring homomorphism `φ : R → R′`, `pfaffian (Σ.map φ) = φ (pfaffian Σ)`, by naturality of
  `ExteriorAlgebra` and of `∫_B` under the change of rings.

**Checks.**

- `Pf([[0, a], [−a, 0]]) = a` (Convention 4), with square `a² = det`; over `ℤ` or `𝔽₂`,
  `Σ = [[0, 1], [−1, 0]]` gives `ω^[1] = e₀e₁` and `Pf = 1 = det`.
- The factorial cannot be divided out in positive characteristic: over `𝔽₂`, `Σ = J₂ ⊕ J₂` has
  `ω = e₀e₁ + e₂e₃`, `ω^[2] = e₀e₁e₂e₃` and `Pf = 1`, while `ω² = 2 e₀e₁e₂e₃ = 0` and `2! = 0`,
  so no definition by `ω^r/r!` recovers `Pf`.
- For `Σ` block diagonal with blocks `[[0, aᵢ], [−aᵢ, 0]]`, `Pf(Σ) = a₁ ⋯ a_r`: the only
  `r`-element set of pairs with nonzero product is `{(0, 1), (2, 3), …}`, while `ω^r` has `r!`
  copies of `a₁e₀e₁ ⋯ a_r e_(2r−2)e_(2r−1)`.
- For `4 × 4`, `Pf = Σ₀₁Σ₂₃ − Σ₀₂Σ₁₃ + Σ₀₃Σ₁₂`, from the three sets `{01, 23}`, `{02, 13}`,
  `{03, 12}` with `e₀e₂e₁e₃ = −e₀e₁e₂e₃` and `e₀e₃e₁e₂ = e₀e₁e₂e₃`; the plain power `ω^r` gives
  twice it.
- `Σ = 0`: `Pf = 0` for `r ≥ 1` and `Pf = 1` for `r = 0`, the empty matrix with `det = 1`.
- The zero diagonal is needed: over `𝔽₂`, `Σ = [[1, 1], [1, 1]]` satisfies `Σᵀ = −Σ`, has
  `Pf = 1` and `det = 0`.
- RandomMatrices §8.5's Checks agree with these values: both give `Pf([[0, a], [−a, 0]]) = a`;
  for `4 × 4` its `a₁₂a₃₄ − a₁₃a₂₄ + a₁₄a₂₃`, indexed from `1`, is `Σ₀₁Σ₂₃ − Σ₀₂Σ₁₃ + Σ₀₃Σ₁₂`
  term by term; and for `A = [[0, 1], [−1, 0]]`, `B = diag(2, 1)`, `BABᵀ = [[0, 2], [−2, 0]]`
  has `Pf = 2 = det B · Pf A`, where a rule with `(det B)²` would give `4`.

### 3.3 The Gaussian density

Prove that on `EuclideanSpace ℝ (Fin r)`, `∫ (2π)^(−r/2) exp(−|x|²/2) dx = 1`, the fibre integral
of the Mathai–Quillen form on the trivial bundle (Wu 2006, §2.1, (2.1)). Route: Mathlib's
`GaussianFourier.integral_rexp_neg_mul_sq_norm` with `b = 1/2`, which gives `(2π)^(r/2)`.
*Needs:* Mathlib `MeasureTheory.integral`, `EuclideanSpace`,
`GaussianFourier.integral_rexp_neg_mul_sq_norm`.

**Checks.**

- `r = 0`: the integral over a point of `1` is `1`.
- `r = 1`: `∫ e^(−x²/2) dx = √(2π)`; the normalization `π^(−r/2) e^(−|x|²)` of the physics
  literature also has integral `1`, while `(2π)^(−r/2) e^(−|x|²)` has `2^(−r/2)`.
- The sign of Convention 4 is what makes `u = (2π)^(−r/2) e^(−|x|²/2) dx₁ ⋯ dx_r` positive on the
  standard orientation.

### Examples

- `Λ(R⁰) = R`: `∫_B = id`, `Pf` of the empty matrix is `1`.
- `R = ℤ[xᵢⱼ]`, the generic alternating matrix: 3.2 there implies 3.2 for every alternating matrix
  over every commutative ring.

### Dependencies

3.1 ← Mathlib; 3.2 ← 3.1, Tau Ceti (`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`,
`Matrix.ofStrictUpper`); 3.3 ← Mathlib.

## Layer 4: superconnections on ℤ/2-graded bundles

### 4.1 Graded bundles and the supertrace

For a smooth ℤ/2-graded complex vector bundle `E = E⁺ ⊕ E⁻` over a smooth manifold `M`, realize
`Ω(M, End E)` as Tau Ceti's `TauCeti.SmoothBundleForm` with values in the endomorphism bundle,
make it a ℤ/2-graded algebra by `TauCeti.SmoothBundleForm.wedgeWith` for composition with
Quillen's sign rule, identify it with `Ω(M) ⊗̂_(C^∞(M)) Γ(End E)`, and define the supertrace
`str : Ω(M, End E) → Ω(M)`, `str(ω ⊗ u) = ω str(u)`. Prove that it is a graded trace and commutes
with the exterior covariant derivative of a grading-preserving connection,
`str[∇, α] = d str(α)` (Garcia 2018, §A.1, (A.1)–(A.4), p. 23, and Wu 2006, §2.3, for the algebra
and the supertrace; Berline–Getzler–Vergne, §1.4, for the identity with the covariant derivative).
Route: 1.3 in local trivializations, where `Ω(U) ⊗̂ End(ℂ^(m|n))` is the algebra of Layer 1 and
`∇ = d + Θ` with `Θ` a block-diagonal matrix of one-forms, odd in the total grading; there
`str[∇, α] = d str(α)` is 2.3's `str(covD δ Θ p X) = d str(X)`.
*Needs:* 1.3, 2.3; Tau Ceti `TauCeti.SmoothForm`, `TauCeti.SmoothBundleForm`,
`TauCeti.SmoothBundleForm.wedgeWith`; DifferentialGeometry Layers 0–1; SmoothBundlesConnections
B4.1.

**API.**

- `str` is `Ω(M)`-linear: `str(ω ∧ α) = ω ∧ str(α)` for `ω ∈ Ω(M)` and `α ∈ Ω(M, End E)`.
- Naturality: for a smooth map `f : N → M`, `str(f*α) = f* str(α)` on `Ω(N, End f*E)`.
- Direct sums: on `E ⊕ E′` with the sum grading, `str(α ⊕ α′) = str(α) + str(α′)` for
  block-diagonal elements.

**Checks.**

- On a point, `str` is the alternating trace `tr|E⁺ − tr|E⁻`.
- For the identity endomorphism, `str 1 = rk E⁺ − rk E⁻`, locally constant.
- For a one-form `ω` and an odd `u`, `str(ω ⊗ u) = 0`, while `str(ω ⊗ 1) = (rk E⁺ − rk E⁻) ω`.

### 4.2 Superconnections

Define a superconnection on `E`: an odd `ℂ`-linear operator `𝔸` on `Ω(M, E)` with
`𝔸(ωs) = dω s + (−1)^(|ω|) ω 𝔸s`. Prove that every superconnection is `∇ + θ` with `∇ = ∇⁺ ⊕ ∇⁻`
a grading-preserving connection and `θ ∈ Ω(M, End E)` odd, that `𝔸²` is `Ω(M)`-linear, an even
element of `Ω(M, End E)`, and the Bianchi identity `[𝔸, 𝔸²] = 0` (Garcia 2018, §A.1, (A.5) and
the paragraph after it, pp. 23–24; Wu 2006, §2.3; Berline–Getzler–Vergne, §1.4). Route: the
difference of two superconnections is
`Ω(M)`-linear, and Bianchi is 2.2 in a trivialization.
*Needs:* 2.2, 4.1; Tau Ceti `TauCeti.CurvatureForm`; SmoothBundlesConnections B3.3, B4.1.

**API.**

- `Ω(M)`-linearity: the difference of two superconnections satisfies
  `(𝔸 − 𝔸′)(ωs) = (−1)^(|ω|) ω (𝔸 − 𝔸′)s`, so it is an odd element of `Ω(M, End E)`, and
  `𝔸 + θ` is a superconnection for every odd `θ`: superconnections form an affine space over the
  odd part of `Ω(M, End E)`.
- Naturality: for a smooth map `f`, `f*𝔸` is a superconnection on `f*E` with
  `(f*𝔸)² = f*(𝔸²)`.
- Direct sums: `𝔸 ⊕ 𝔸′` is a superconnection on `E ⊕ E′` with curvature `𝔸² ⊕ 𝔸′²`.

**Checks.**

- `θ = 0`: `𝔸² = F⁺ ⊕ F⁻`, the curvatures of `∇±`.
- `θ = X` of degree 0, `X = [[0, T*], [T, 0]]`: `𝔸² = F + [∇, X] + X²`, with `[∇, X]` an odd
  one-form and `X²` of degree 0.
- Parity is needed: for an even endomorphism `u` of degree 0,
  `(∇ + u)²(fs) − f(∇ + u)²s = 2 df ∧ us`, so `(∇ + u)²` is not `Ω(M)`-linear; for odd `u` the
  two terms `df ∧ us` and `u(df s) = −df ∧ us` cancel.

### 4.3 The Chern character form

Prove that `ch(𝔸) = φ str exp(−𝔸²)` (Convention 2) is closed; that for a smooth family `𝔸_t`,
`d/dt str exp(−𝔸_t²) = −d str(𝔸̇_t exp(−𝔸_t²))`, so the class of `ch(𝔸)` in
`H^even(M; ℂ)` (Tau Ceti's `TauCeti.deRhamCohomology` of the real and imaginary parts) is
independent of `𝔸`; and that it equals `ch(E⁺) − ch(E⁻)`, the difference of
CharacteristicClasses' Chern character forms of `∇⁺` and `∇⁻` (Garcia 2018, §A.1, the properties
after (A.7), (A.8) and (A.9), p. 24; Wu 2006, §2.3, after (2.8); Berline–Getzler–Vergne,
Proposition 1.41 and §1.4). Route: 2.3 and 2.4 in trivializations, summed to the exponential by
Tau Ceti's Duhamel formula `TauCeti.hasFDerivAt_exp` with
`TauCeti.expFDeriv_apply_eq_integral`; for the last, the path `∇ + tθ`, `t ∈ [0, 1]`, joins `𝔸`
to `∇⁺ ⊕ ∇⁻`, whose character is CharacteristicClasses C4, item 2, for each summand.
*Needs:* 2.3, 2.4, 4.2; Tau Ceti `TauCeti.hasFDerivAt_exp`, `TauCeti.expFDeriv_apply_eq_integral`,
`TauCeti.deRhamCohomology`; CharacteristicClasses C4, items 1–2; DifferentialGeometry Layer 6.

**API.**

- With a continuous trace `τ` on a real Banach algebra and `F` differentiable at `t`,
  `d/dt τ(exp F(t)) = τ(F′(t) exp F(t))`: by `TauCeti.expFDeriv_apply_eq_integral` the
  derivative is `τ(∫₀¹ exp((1 − s)F) F′ exp(sF) ds)`, and cyclicity makes the integrand
  `τ(F′ exp F)`; the same holds for a supertrace and `F(t)` even, which sums 2.4 to
  `d/dt str exp(−𝔸_t²) = −d str(𝔸̇_t exp(−𝔸_t²))`.
- `ch(𝔸 ⊕ 𝔸′) = ch(𝔸) + ch(𝔸′)` and `ch(f*𝔸) = f* ch(𝔸)` (Garcia 2018, (A.7) and the properties
  after it).

**Checks.**

- `E⁻ = 0` and `𝔸 = ∇` an ordinary connection: `ch(𝔸) = tr exp((i/2π)F_∇)`,
  CharacteristicClasses' form.
- `E⁻ = 0` does not make `𝔸` a connection: on the trivial line over `ℝ⁴`,
  `𝔸 = d + x₁ dx₂∧dx₃∧dx₄` has `𝔸² = dx₁∧dx₂∧dx₃∧dx₄ = vol₄`, and its character
  `1 + vol₄/(4π²)` (Convention 2) has the degree-four component `vol₄/(4π²)`, which the flat
  connection `d`, of character `1`, does not have; the classes agree, `vol₄` being exact.
- `E⁺ = E⁻ = L` a line bundle and `𝔸 = ∇ ⊕ ∇ + X` with `X = [[0, 1], [1, 0]]`: the class is
  `ch(L) − ch(L) = 0`, and indeed `𝔸 = ∇ ⊕ ∇ + X` has the exact character of 4.4.
- The sign of the transgression formula: on `ℝ²` with the trivial line, `𝔸_t = d + i t x dy` has
  `𝔸_t² = i t dx∧dy` and `𝔸̇_t = i x dy`, so `d/dt str exp(−𝔸_t²) = −i dx∧dy`, which is
  `−d str(𝔸̇_t exp(−𝔸_t²)) = −d(i x dy)`; the opposite sign would give `+i dx∧dy`.

### 4.4 Quillen's character of ∇ + tX

Let `E` carry a Hermitian metric (SmoothBundlesConnections B2.2), `∇` be grading-preserving and
Hermitian, and `X = [[0, T*], [T, 0]]` with `T : E⁺ → E⁻` (Convention 3), and put
`𝔸_t = ∇ + tX`. Prove: (a) if `T` is invertible at every point of an open `U ⊆ M`, then
`str exp(−𝔸_t²) → 0` as `t → ∞`, with all derivatives, uniformly on compact subsets of `U`, and on
`U` the form `ch(𝔸₁)` is exact with primitive `φ ∫₁^∞ str(X exp(−𝔸_t²)) dt`, the integral
converging on `U`. Prove next that if `ker X` has locally constant rank, then every point has a
neighbourhood and a `ρ > 0` on which `P_K = (2πi)⁻¹ ∮_(|w|=ρ) (w − X)⁻¹ dw` is defined and
smooth, and is the orthogonal projection onto `ker X`; it commutes with the grading, `X` being
odd, so `K = ker X = im P_K` is a smooth ℤ/2-graded subbundle `K⁺ ⊕ K⁻ = ker T ⊕ ker T*`
(LieGroupoidsPoisson G0.1, images of constant-rank bundle maps). Then prove (b): if `ker T` and
`ker T*` have locally constant rank, which is the same as for `ker X` since
`dim ker T − dim ker T* = rk E⁺ − rk E⁻`, then `ch(𝔸_t) → ch(K⁺, ∇^K) − ch(K⁻, ∇^K)` as
`t → ∞` for the compressed connection `∇^K = P_K ∇ P_K`, uniformly on compact subsets with all
derivatives, and the difference is `d` of a convergent transgression integral (Wu 2006, §2.3, the
formula after (2.8), for (a); Berline–Getzler–Vergne, §9.1, for (b)).
Route: (a) from 4.3 and the bound `|exp(−𝔸_t²)| ≤ C(1 + t)^N e^(−t² λ)` with `λ > 0` the
smallest eigenvalue of `X²` on the compact set, by the Duhamel expansion of
`TauCeti.expFDeriv_apply_eq_integral` around `exp(−t²X²)`; the projection: at a point `x₀` the
nonzero eigenvalues of the self-adjoint `X(x₀)` lie outside `[−2ρ, 2ρ]` for some `ρ > 0`, so near
`x₀` exactly `rk K` eigenvalues, with multiplicity, lie in `(−ρ, ρ)`, and they are `0` by the rank
condition; the circle `|w| = ρ` then avoids the spectrum, the resolvent is smooth on it, and the
integral is the spectral projection of `X` for `{0}`; `ε(w − X)⁻¹ε = (w + X)⁻¹` for the grading
`ε` and the substitution `w ↦ −w` give `εP_Kε = P_K`; (b) in a frame adapted to `E = K ⊕ K^⊥`, on
which `X` is invertible, by the same expansion as (a).
*Needs:* 2.5, 4.3; Tau Ceti `TauCeti.expFDeriv_apply_eq_integral`; Mathlib `circleIntegral`;
LieGroupoidsPoisson G0.1; SmoothBundlesConnections B2.2; DifferentialGeometry Layer 6.

**API.**

- `P_K² = P_K = P_K*` and `X P_K = P_K X = 0`.
- `P_K` does not depend on `ρ` below the smallest nonzero `|eigenvalue|` of `X` on the
  neighbourhood.
- Naturality: for a smooth map `f`, `f*P_K` is the projection of `f*X`.
- Direct sums: for `X ⊕ X′` on `E ⊕ E′`, with kernels `K` and `K′`, `P_(K ⊕ K′) = P_K ⊕ P_K′`.
- `∇^K = P_K ∇ P_K` is a connection on `K`, Hermitian and grading-preserving.

**Checks.**

- Over a point the degree-zero part is 2.5: `str exp(−t²X²) = rk K⁺ − rk K⁻ = m − n` for every
  `t`, and (b) holds with equality.
- `E⁺ = E⁻ = ℂ` trivial, `T = f` a nowhere-zero function: (a) gives `ch(𝔸₁) = d(…)` on all of `M`,
  consistent with `ch(ℂ) − ch(ℂ) = 0`.
- Without the rank condition (b) fails: on `M = ℝ²` with `E⁺ = E⁻ = ℂ`, `∇ = d` and `T = z`,
  `ch(𝔸_t) = −(t²/π) e^(−t²|z|²) dx ∧ dy` (from `str((dX)²) = 2 dz ∧ dz̄` under Convention 1), of
  integral `−1` for every `t > 0`; it concentrates at `0`, where the kernel jumps, and its limit is
  the current `−δ₀`, not a form.
- The rank condition is also needed for `P_K`: for the same `T = z`, `X` has eigenvalues `±|z|`.
  For any `ρ > 0`, on `|z| < ρ/2` the circle `|w| = ρ` avoids the spectrum but encloses both
  eigenvalues, so its Riesz projection is `1`, not the projection onto `ker X`, which is `0` at
  `z ≠ 0`; no fixed circle isolates exactly the zero eigenvalues near `0`, and the projection onto
  `ker X`, `1` at `z = 0` and `0` elsewhere, is not continuous. For `T` invertible, `P_K = 0` once
  `ρ` is below the smallest eigenvalue of `|X|`, and (b) is (a) with `K = 0`; for `T = 0`,
  `P_K = (2πi)⁻¹ ∮ w⁻¹ dw = 1`.

### Examples

- `M` a point: Layer 4 is Layer 2 with `A = ℂ`.
- The Koszul complex of a section `s` of a Hermitian bundle `F`: on `ΛF`, graded by parity,
  `c_s = (s∧) + (s∧)*` is odd and self-adjoint with `c_s² = |s|²`, so `∇ + t c_s`, for the
  connection `∇` induced on `ΛF`, is of the form 4.4 with `X = c_s` invertible off `s⁻¹(0)`. For
  `s = 1` on the trivial line, `c_s = [[0, 1], [1, 0]]` on `Λ⁰ ⊕ Λ¹` and
  `exp(−t² c_s²) = e^(−t²)`. Garcia 2018, §A.2–A.3, (A.11) and (A.15), pp. 24–25, uses
  `∇ + i(v + v*)` for the Koszul differential `v`, with the character `str exp(𝔸²)` of (A.6): the
  case `j = 0` of Convention 2's `𝔸′`. With the factor `i` and this roadmap's `exp(−𝔸²)`,
  `s = 1` would give `exp(+t²)`, which grows.

### Dependencies

4.1 ← 1.3, 2.3, Tau Ceti (`TauCeti.SmoothForm`, `TauCeti.SmoothBundleForm`,
`TauCeti.SmoothBundleForm.wedgeWith`), DifferentialGeometry Layers 0–1, SmoothBundlesConnections
B4.1; 4.2 ← 2.2, 4.1, Tau Ceti (`TauCeti.CurvatureForm`), SmoothBundlesConnections B3.3, B4.1;
4.3 ← 2.3, 2.4, 4.2, Tau Ceti (`TauCeti.hasFDerivAt_exp`, `TauCeti.expFDeriv_apply_eq_integral`,
`TauCeti.deRhamCohomology`), CharacteristicClasses C4, items 1–2, DifferentialGeometry Layer 6;
4.4 ← 2.5, 4.3, Tau Ceti (`TauCeti.expFDeriv_apply_eq_integral`), LieGroupoidsPoisson G0.1,
SmoothBundlesConnections B2.2, DifferentialGeometry Layer 6.

## Layer 5: Mathai–Quillen Euler and Thom forms

### 5.1 The fibrewise Berezin integral and the Euler form

For an oriented real vector bundle `E` of rank `r` with a Euclidean metric and a compatible
connection `∇` of curvature `R`, define the Berezin integral `∫_B : Ω(M, ΛE*) → Ω(M)` fibrewise
(3.1 in oriented orthonormal frames, multiplication by the orientation sign `o` in rank zero,
Convention 4) and prove that the Euler form `e(∇) = (2π)^(−r/2) ∫_B exp(½(·, R·))` is
CharacteristicClasses' Euler form (Conventions): in positive even rank it equals `Pf(R/2π)`,
computed in oriented orthonormal frames, CharacteristicClasses' Pfaffian form; it is `0` in odd
rank; and it is `o` in rank zero, where the Pfaffian of the empty matrix is `1` (Wu 2006, §2.2,
(2.3), p. 2; Wu 2006, §2.1, p. 1, for odd rank; Berline–Getzler–Vergne, §1.6). Route: 3.2
fibrewise; orthonormal frame changes have `det = 1`, so 3.1 makes `∫_B` frame-independent.
*Needs:* 3.1, 3.2; CharacteristicClasses Conventions, C4, item 2; SmoothBundlesConnections B2.2,
B4.1.

**API.**

- `Ω(M)`-linearity: `∫_B(ω ∧ α) = ω ∧ ∫_B α` for `ω ∈ Ω(M)` and `α ∈ Ω(M, ΛE*)`, with `Ω(M)`
  acting on the left of `Ω(M) ⊗̂ ΛE*`.
- Naturality: for a smooth map `f`, `∫_B f*α = f* ∫_B α` and `e(f*∇) = f* e(∇)`.
- Direct sums: for `E ⊕ E′` oriented by the orientation of `E` followed by that of `E′`,
  `e(∇ ⊕ ∇′) = e(∇) ∧ e(∇′)`; both sides vanish when `r` and `r′` are odd, since every term of
  `exp(½(·, R·))` has an even number of Grassmann variables of `E`.

**Checks.**

- `r = 2`, `R = [[0, −dα], [dα, 0]]`: `e(∇) = −dα/2π`, CharacteristicClasses' witness.
- Odd `r`: `∫_B` of an even element of `ΛE*` is `0`, so `e(∇) = 0`.
- Reversing the orientation of `E` reverses `∫_B` and `e(∇)`.
- Rank zero: for the zero bundle over a point with the negative orientation, `∫_B 1 = −1` and
  `e(∇) = −1`, CharacteristicClasses' orientation sign, while `Pf` of the empty matrix is `1`; a
  definition `e(∇) = Pf(R/2π)` in every rank would lose this sign.

### 5.2 The Mathai–Quillen Euler form of a section

For a smooth section `s`, define `e_(∇,s) = (−1)^(r(r+1)/2) (2π)^(−r/2) ∫_B exp(−S_(∇,s))` with
`S_(∇,s) = ½|s|² + (∇s, ·) + ½(·, R·)` (Wu 2006, §2.2, (2.4)–(2.5), p. 2, following
Berline–Getzler–Vergne, §1.6). Prove that it is closed, that `e_(∇,βs)` has a class independent of
`β ≥ 0`, with an explicit transgression form, and that `e_(∇,0) = e(∇)` for even `r`, which is
`o` in rank zero (Wu 2006, §2.2, the paragraph after (2.5), p. 2). Route: `exp(−S_(∇,s))` is
closed for the odd derivation `∇ + ι_s` of `Ω(M) ⊗̂ ΛE*`, where
`ι_s(ω ⊗ e) = (−1)^(|ω|) ω ⊗ ι_s e` is the contraction by `s` in the Grassmann variables with the
Koszul sign, since `(∇ + ι_s) S_(∇,s) = 0`; `∫_B` kills the image
of `ι_s` and turns `∇` into `d`; the `β`-derivative is `(∇ + ι_s)`-exact.
*Needs:* 3.1, 5.1; DifferentialGeometry Layer 6.

**API.**

- `Ω(M)`-linearity: `ι_s(ω ∧ α) = (−1)^(|ω|) ω ∧ ι_s α`, `ι_(fs + s′) = f ι_s + ι_s′` for smooth
  functions `f`, and `∇ + ι_s` is an odd derivation of `Ω(M) ⊗̂ ΛE*`.
- Naturality: for a smooth map `f`, `f* e_(∇,s) = e_(f*∇, f*s)`.
- Direct sums: `e_(∇ ⊕ ∇′, s ⊕ s′) = e_(∇,s) ∧ e_(∇′,s′)` for the orientation of 5.1's direct sums.
  Moving the Grassmann variables of `E` past the forms in the top part of `exp(−S_(∇′,s′))`, of
  degree `≡ r′`, gives `(−1)^(rr′)`, which the prefactors cancel:
  `(r + r′)(r + r′ + 1)/2 − r(r + 1)/2 − r′(r′ + 1)/2 = rr′`.

**Checks.**

- `s = 0`, `r` even and positive, in an oriented orthonormal frame:
  `(−1)^(r(r+1)/2) Pf(−R/2π) = (−1)^(r/2) (−1)^(r/2) Pf(R/2π) = e(∇)`; `r = 0`: `S_(∇,0) = 0` and
  `e_(∇,0) = ∫_B 1 = o = e(∇)`.
- `M = ℝʳ`, `E` trivial, `∇ = d`, `s = x`: `e_(d,x) = (2π)^(−r/2) e^(−|x|²/2) dx₁ ⋯ dx_r`
  (Convention 4), of integral `1` by 3.3.
- `s = βx` on `ℝʳ`: `(2π)^(−r/2) β^r e^(−β²|x|²/2) dx`, of integral `1` for every `β > 0` and
  concentrating at `0` as `β → ∞`.
- The sign of the operator: for `r = 1`, `E` trivial and flat, `S = ½s² + ds · e`; then
  `d(½s²) = s ds` and `ι_s(ds · e) = −ds · s = −s ds`, so `(d + ι_s)S = 0`, while
  `(d − ι_s)S = 2s ds`.
- Direct sums on `ℝ²` with `E = E′ = ℝ`, `∇ = d`, `s = x`, `s′ = y`: the second Check gives
  `(2π)^(−1/2) e^(−x²/2) dx ∧ (2π)^(−1/2) e^(−y²/2) dy = (2π)^(−1) e^(−|x|²/2) dx dy`, the value at
  `r = 2`; a direct-sum rule with the sign `(−1)^(rr′) = −1` would give `−1` times it.

### 5.3 Localization and Poincaré–Hopf

Let `M` be closed and oriented and `s` transverse to the zero section, with `Z = s⁻¹(0)` oriented
tangent-first: an oriented basis of `T_pZ` followed by normal vectors that `∇s(p)` maps to an
oriented basis of `E_p` is an oriented basis of `T_pM`; for even `r` the order is immaterial. This
is the orientation taken from CharacteristicClasses C2, item 3, and the one for which (b) holds
with `φ` to the left of `e_(∇,βs)`. Prove: (a) `∫_M ω ∧ e_(∇,s) = ∫_Z ω` for every closed `ω` of
degree `dim M − r`; (b) `∫_M φ ∧ e_(∇,βs) → ∫_Z φ` as `β → ∞` for every form `φ`; (c) for
`E = TM` with the Levi-Civita connection and a vector field `s` with nondegenerate zeros,
`∫_M e(∇) = ∑_(s(p)=0) sign det(∇s(p)) = χ(M)`, where `e(∇) = Pf(R/2π)` when `dim M` is even and
positive (Wu 2006, §2.2, (2.6), p. 2, for (a) and (b); Wu 2006, §1, p. 1, and CharacteristicClasses
C2, item 3, for (c)). Route: (a) by 5.2, which makes `e_(∇,s)` cohomologous to
`e_(∇,0) = e(∇)`, Stokes, CharacteristicClasses C5, item 5, which identifies the class of the Euler
form `e(∇)` (the Pfaffian form in positive even rank) with the real image of the Euler class, and
C2, item 3, which identifies the Euler class with the Poincaré dual of `Z`; (b) by the Gaussian
rescaling of 5.2's third Check in normal coordinates along `Z`; (c) from (a) with `ω = 1` and
`β = 0`, and C2, item 3's sum-of-local-indices formula with `e(TM)[M] = χ(M)`.
*Needs:* 3.3, 5.1, 5.2; CharacteristicClasses C2, item 3, C5, item 5; DifferentialGeometry Layers
2, 5.

**Checks.**

- `M = S²`, the height gradient: two zeros of index `+1`, `∫ Pf(R/2π) = (1/2π) ∫ K dA = 2`.
- `M = T²` flat: `R = 0`, and a constant field has no zeros; both sides `0`.
- Reversing the orientation of `E` changes both sides of (a) by a sign.
- `dim M = 0`, `M` a finite set of points with orientations `o(p)`: `TM = 0`, `e(∇) = o`, and
  `∫_M e(∇) = ∑ o(p)² = #M = χ(M)`, while `∫_M Pf = ∑ o(p)` would differ when some `o(p) = −1`.
- The orientation of `Z` in odd rank: `M = T² = ℝ²/ℤ²` oriented by `dx ∧ dy`, `E` the trivial
  oriented line, `∇ = d`, `s = sin 2πx`, so `Z = {x = 0} ⊔ {x = ½}`, and `φ = f dy`. Here
  `e_(d,βs) = g_β(s) s′ dx` with `g_β(u) = (2π)^(−1/2) β e^(−β²u²/2)`, of integral `1`, so
  `φ ∧ e_(d,βs) = −f g_β(s) s′ dx ∧ dy` and
  `∫_M φ ∧ e_(d,βs) → −∫ f(0, y) dy + ∫ f(½, y) dy`, since `s′ > 0` at `x = 0` and `s′ < 0` at
  `x = ½`. Tangent-first, `{x = 0}` is oriented by `−∂_y`, as `(−∂_y, ∂_x)` is an oriented basis
  and `ds(∂_x) > 0`, and `{x = ½}` by `∂_y`, as `(∂_y, −∂_x)` is oriented and `ds(−∂_x) > 0`, so
  `∫_Z φ` is that limit; orienting `Z` normal-first gives the opposite sign on both circles.

### 5.4 The Thom form

On the total space of `π : E → M`, with the tautological section `x` of `π*E`, define
`τ_∇ = e_(π*∇, x)` (Wu 2006, §2.2, (2.7), p. 2). Prove that `τ_∇` is closed, that its restriction to
each fibre is the Gaussian `(2π)^(−r/2) e^(−|x|²/2) dx₁ ⋯ dx_r` in oriented orthonormal coordinates
in positive rank and the orientation sign `o` in rank zero, with fibre integral `1` in every rank,
that `s*τ_∇ = e_(∇,s)` for every section `s`, in particular `0*τ_∇ = e(∇)`, and that for the
fibrewise radial diffeomorphism `ρ` from the open unit disc bundle onto `E`, `ρ*τ_∇` extends by
zero to a closed form with compact vertical support whose class is the real image of the Thom
class `U_E` (Wu 2006, §2.2, the paragraph after (2.7), p. 2; Berline–Getzler–Vergne, §1.6).
Route: closedness from 5.2;
the fibre value from Convention 4 and 3.3; `s*` by naturality of the construction; the class by
C2, item 5's compact-support comparison and the characterization of `U_E` by fibre integral `1`
(C2, item 1). The equivariant construction of `τ_∇` from the `SO(r)`-equivariant Gaussian on `ℝʳ`
(Wu 2006, §3.1, p. 3) is a second route.
*Needs:* 3.3, 5.2; CharacteristicClasses C2, items 1, 5; DifferentialGeometry Layer 5.

**API.**

- Naturality: for a smooth map `f : N → M` and the induced map `f̃ : f*E → E` of total spaces,
  `f̃*τ_∇ = τ_(f*∇)`.
- Orientation: reversing the orientation of `E` changes `τ_∇` into `−τ_∇`.
- Direct sums: on the total space of `E ⊕ E′`, with `p` and `p′` its projections onto the total
  spaces of `E` and `E′` and the orientation of 5.1's direct sums,
  `τ_(∇ ⊕ ∇′) = p*τ_∇ ∧ p′*τ_(∇′)`, by 5.2's direct-sum rule for the tautological sections.

**Checks.**

- `M` a point: `τ = (2π)^(−r/2) e^(−|x|²/2) dx` on `ℝʳ`, integral `1` by 3.3.
- Rank zero: for the zero bundle over a point with the negative orientation, the total space is
  the point, `τ_∇ = e(∇) = −1`, and the fibre integral over the point oriented by `−1` is
  `(−1)(−1) = 1`.
- Direct sums of trivial oriented lines over a point:
  `τ_(ℝ ⊕ ℝ) = (2π)^(−1/2) e^(−x²/2) dx ∧ (2π)^(−1/2) e^(−y²/2) dy`, which is
  `(2π)^(−1) e^(−(x²+y²)/2) dx ∧ dy`, the positive Gaussian of the first Check at `r = 2`.
- With `ρ(y) = y/√(1 − |y|²)`, `ρ*τ_∇` contains `exp(−|y|²/(2(1 − |y|²)))` times a power of
  `(1 − |y|²)⁻¹`, which tends to `0` with all derivatives at the unit sphere, so the extension by
  zero is smooth.
- `r = 1`, `E = M × ℝ`: `τ = (2π)^(−1/2) e^(−x²/2) dx` (Convention 4's sign at `r = 1` is absorbed),
  and `0*τ = 0 = e(∇)` in odd rank.

### Examples

- The Hopf bundle `O(−1)` over `ℂP¹` as a real rank-2 bundle: `∫ e(∇) = −1`.
- `TS²` with the round metric: 5.3 (c) gives `χ(S²) = 2`.

### Dependencies

5.1 ← 3.1, 3.2, CharacteristicClasses Conventions, C4, item 2, SmoothBundlesConnections B2.2,
B4.1;
5.2 ← 3.1, 5.1, DifferentialGeometry Layer 6; 5.3 ← 3.3, 5.1, 5.2, CharacteristicClasses C2,
item 3, C5, item 5, DifferentialGeometry Layers 2, 5; 5.4 ← 3.3, 5.2, CharacteristicClasses C2,
items 1, 5, DifferentialGeometry Layer 5.

## Layer 6: the Cayley transform and invariant character forms

### 6.1 The graded Cayley transform

Define `grading = 1 ⊕ −1` on `ℂ^(m|n)`, `cayley X = (1 + X)(1 − X)⁻¹` and
`cayleyInv g = (g − 1)(g + 1)⁻¹`. Prove `isUnit_one_sub_of_skew` (`1 − X` invertible for
`X* = −X`), `cayley_mem_unitaryGroup` and `grading_mul_cayley_mul_grading`: if moreover `X` is
odd, `εXε = −X`, then `εgε = g⁻¹`, so `εg` is a self-adjoint involution, the reflection `2P_W − 1`
in a subspace `W`. Prove the converse, `cayley_cayleyInv`: a unitary `g` with `εgε = g⁻¹` and
`−1 ∉ spec(g)` is `cayley X` for the odd skew-adjoint `X = cayleyInv g`. This is Quillen's
correspondence between odd skew-adjoint `X`, unitaries `g` with `εgε = g⁻¹` and `−1 ∉ spec(g)`,
and subspaces `W` with `W ∩ E⁻ = 0` and `dim W = m`: for `X = [[0, −T*], [T, 0]]`,
`W = (1 − X)E⁺` is the graph of `−T` (Quillen 1988, §2, p. 214, and Proposition 2.1, p. 215;
there the subspace is the `+1` eigenspace of `gε`, the graph of `T`, which `ε` carries to `W`).
Route: the eigenvalues of `X` are imaginary, so `1 − X` is invertible; `1 + X` and `1 − X` commute
and `(1 ± X)* = 1 ∓ X`, so `g*g = (1 + X)⁻¹(1 − X)(1 + X)(1 − X)⁻¹ = 1`; `ε(1 ± X)ε = 1 ∓ X` gives
`εgε = (1 − X)(1 + X)⁻¹ = g⁻¹`. For `W`, `v ∈ E⁺` gives
`εg(1 − X)v = ε(1 + X)v = (1 − X)εv = (1 − X)v`, and `v ∈ E⁻` gives `−(1 − X)v`, so
`W = (1 − X)E⁺`, and `(1 − X)(v, 0) = (v, −Tv)`. For the converse, with `X = cayleyInv g`,
`1 + X = 2g(g + 1)⁻¹` and `1 − X = 2(g + 1)⁻¹` give `cayley X = g`; `g* = g⁻¹` gives
`X* = (g⁻¹ − 1)(g⁻¹ + 1)⁻¹ = (1 − g)(1 + g)⁻¹ = −X`, and `εgε = g⁻¹` gives
`εXε = (g⁻¹ − 1)(g⁻¹ + 1)⁻¹ = −X`.
*Needs:* Mathlib `Matrix.unitaryGroup`, `Matrix.conjTranspose`, `Matrix.fromBlocks`.

**API.**

- `ε² = 1` and `ε* = ε`.
- `cayley 0 = 1`, and `cayley X` commutes with `X`.
- For skew-adjoint `X`, `(cayley X)* = cayley (−X) = (cayley X)⁻¹`, `cayley X + 1 = 2(1 − X)⁻¹`
  is invertible, and `cayleyInv (cayley X) = X`.

**Checks.**

- `X = 0`: `g = 1`, `εg = ε = 2P_(E⁺) − 1`, so `W = E⁺`.
- `m = n = 1`, `X = [[0, −a], [a, 0]]` with `a` real, that is `T = a`:
  `g = (1 + a²)⁻¹ [[1 − a², −2a], [2a, 1 − a²]]`, a rotation, and `εgε = gᵀ = g⁻¹`; `εg` fixes
  `(1, −a)`, so `W = (1 − X)E⁺` is the line spanned by `(1, −a)`, the graph of `−T`.
- `W = E⁻` is not in the correspondence: its reflection is `−ε`, so `εg = −ε` and `g = −1`, which
  `−1 ∉ spec(g)` excludes: `g + 1 = 0` is not invertible.
- An even skew-adjoint `X = diag(iθ, 0)` gives `g = diag((1 + iθ)/(1 − iθ), 1)`, which commutes
  with `ε`, and `εgε = g ≠ g⁻¹` for `θ ≠ 0`: oddness is needed.
- `X = (iθ)` on `ℂ`: `|(1 + iθ)/(1 − iθ)| = 1`; `g − 1 = 2iθ/(1 − iθ)` and `g + 1 = 2/(1 − iθ)`,
  so `cayleyInv g = iθ`; and `g = −U_(−iX)` with SelfAdjointSpectralTheory's `U_A` at `A = θ`
  (Convention 5), the comparison with the operator Cayley transform.

### 6.2 Invariant character forms on Grassmannians and unitary groups

Let `V = ℂ^N` with its standard Hermitian form, `Herm(V)` the real vector space of its
self-adjoint endomorphisms (Mathlib's `selfAdjoint`), `Gr_p(V)` the Grassmannian
`TauCeti.finiteGrassmannian ℂ p N` with GeneralizedCohomology G4.0b's smooth graph-chart
structure, of real dimension `2p(N − p)`, `Gr(V)` the disjoint union of the `Gr_p(V)`, and `U(V)`
the unitary group `Matrix.unitaryGroup` with LieGroups Layer 2's embedded Lie-subgroup structure.
Prove that `W ↦ F_W = 2P_W − 1`, `P_W` the
orthogonal projection onto `W`, is a smooth embedding (`Manifold.IsSmoothEmbedding`) of `Gr_p(V)`
into `Herm(V)`, whose image is the set of self-adjoint involutions of trace `2p − N`, a
`U(V)`-conjugation orbit, with tangent space `{Ḟ ∈ Herm(V) | FḞ + ḞF = 0}` at `F`; these images,
`0 ≤ p ≤ N`, are closed, pairwise disjoint, and cover `{F ∈ Herm(V) | F² = 1}`. Prove that the
tautological bundle `W`, with fibre `im P` at `F`, `P = (1 + F)/2`, is a smooth subbundle of the
trivial bundle with fibre `V` (LieGroupoidsPoisson G0.1, images of constant-rank bundle maps),
with the connection `s ↦ P ds`. Then prove that `tr(F(dF)^(2k))` on `Gr_p(V)` and
`tr((g⁻¹dg)^(2k−1))` on `U(V)` are closed and `U(V)`-invariant, and that for `k ≥ 1`
`tr(F(dF)^(2k)) = 2^(2k+1) tr(P(dP)^(2k))`, and that `(1/k!)(i/2π)^k tr(P(dP)^(2k))` is the
degree-`2k` Chern character form of `W` with the connection `P d P`, so the class of
`tr(F(dF)^(2k))` is `2^(2k+1) k! (2π/i)^k ch_k(W)`, `k ≥ 1` (Quillen 1988, §5.A: the forms
`γ_(2k)` on `Gr(V)` and `γ_(2k−1)` on `U(V)` in (5.1) and Proposition 5.2, p. 222; the class in
Proposition 5.5 and its proof, pp. 222–223). Route: in the graph chart at `W₀`, `W` is the graph of
`A ∈ Hom(W₀, W₀^⊥)` and
`P_W = [[(1 + A*A)⁻¹, (1 + A*A)⁻¹A*], [A(1 + A*A)⁻¹, A(1 + A*A)⁻¹A*]]` is smooth in `A`, with
`dF_W = 2[[0, Ȧ*], [Ȧ, 0]]` at `A = 0`, injective onto the part of `Herm(V)` anticommuting with
`F_(W₀)`; by 6.1 with `ε = F_(W₀)` and `X_T = [[0, −T*], [T, 0]]` on `W₀ ⊕ W₀^⊥`, the same chart
is `T ↦ ε cayley(X_T)`, `A = −T`; an injective immersion of the compact `Gr_p(V)` is a closed
embedding, two subspaces of the same dimension
differ by a unitary, and every self-adjoint involution is `F_W` for `W = ker(F − 1)`; `P` has
constant rank `p` on `Gr_p(V)`. For the forms, `F = 2P − 1` gives
`tr(F(dF)^(2k)) = 2^(2k+1) tr(P(dP)^(2k)) − 2^(2k) tr((dP)^(2k))`; `P dP P = 0` and `(dP)²` commutes
with `P`, so the curvature of `P d P` is `P dP dP` and its `k`-th power `P(dP)^(2k)`;
`tr((dP)^(2k)) = 0` by graded cyclicity of the trace on matrix-valued forms (1.3 with `n = 0`);
closedness from `d tr(F(dF)^(2k)) = tr((dF)^(2k+1))`, which vanishes because `F² = 1` makes `F`
anticommute with `dF`, so conjugating by `F` changes its sign.
*Needs:* 1.3, 4.3, 6.1; Tau Ceti `TauCeti.finiteGrassmannian`, `TauCeti.SmoothForm`,
`TauCeti.deRhamCohomology`; Mathlib `selfAdjoint`,
`Manifold.IsSmoothEmbedding`; CharacteristicClasses C4, item 2; DifferentialGeometry Layers 0–1, 6;
GeneralizedCohomology G4.0b; LieGroups Layer 2; LieGroupoidsPoisson G0.1.

**API.**

- Equivariance: `F_(uW) = u F_W u⁻¹` for `u ∈ U(V)`.
- Complements: `F_(W^⊥) = −F_W`, since `P_(W^⊥) = 1 − P_W`; for `V = ℂ` this is
  `F_0 = −1 = −F_ℂ`.
- Stabilization: for `V ⊂ V ⊕ V′`, the map `W ↦ W ⊕ 0` of `Gr_p(V)` into `Gr_p(V ⊕ V′)` pulls
  `tr(P(dP)^(2k))` back to itself, the projection being `P_W ⊕ 0`.
- The connection `P d P` is Hermitian for the metric induced on the tautological bundle.

**Checks.**

- `V = ℂ`: `Gr₀(ℂ)` and `Gr₁(ℂ)` are the points `F = −1` and `F = 1`, of trace `2p − 1` and
  dimension `2p(1 − p) = 0`; every form of positive degree vanishes, and
  `tr(F(dF)^(2k)) = 0 = ch_k(W)` for `k ≥ 1`.
- `V = ℂ²`: `(a + x·σ)² = a² + |x|² + 2a x·σ` for the Pauli matrices `σ`, so
  `{F ∈ Herm(V) | F² = 1} = {1} ⊔ {x·σ | |x| = 1} ⊔ {−1}`, of traces `2, 0, −2`; the middle part is
  `Gr₁(ℂ²) = ℂP¹ ≅ S²`, of dimension `2·1·1 = 2`, and at `F = σ₃` the tangent space
  `{Ḟ | σ₃Ḟ + Ḟσ₃ = 0}` is spanned by `σ₁`, `σ₂`, the tangent plane of `S²` at `(0, 0, 1)`.
- The preimage theorem does not give this structure: at `F = σ₃` the differential
  `Ḟ ↦ σ₃Ḟ + Ḟσ₃` of `F ↦ F²` has image spanned by `1` and `σ₃`, of rank `2`, not `4`, so
  `F² = 1` is not a regular level set; the components come from the Grassmannians.
- `k = 0` is excluded: `tr(F) = 2 dim W − dim V` while `2 tr(P) = 2 dim W`; the identity uses
  `tr((dP)^(2k)) = 0`, which needs `k ≥ 1`.
- `V = ℂ²`, `Gr₁(ℂ²) = ℂP¹`: `∫ (i/2π) tr(P dP dP) = −1`, the degree of the tautological
  `O(−1)`, matching CharacteristicClasses' `c₁(O(−1)) = −h`.
- `tr((g⁻¹dg)¹)` on `U(1)` is `i dθ`, of integral `2πi`; on `U(V)` the forms of even degree
  `tr((g⁻¹dg)^(2k))` vanish by cyclicity, so only odd degrees occur.

### Examples

- The Cayley transform of `X(x) = [[0, −T(x)*], [T(x), 0]]` over `M`: a map `M → Gr(V)` whose
  pullback of 6.2's forms is the object of Quillen's comparison (Scope, Out of scope).
- `Gr₁(ℂ^N) = ℂP^(N−1)`: 6.2 gives `ch(O(−1))` as an invariant form.

### Dependencies

6.1 ← Mathlib; 6.2 ← 1.3, 4.3, 6.1, Tau Ceti (`TauCeti.SmoothForm`, `TauCeti.deRhamCohomology`,
`TauCeti.finiteGrassmannian`), CharacteristicClasses C4, item 2, DifferentialGeometry Layers 0–1,
6, GeneralizedCohomology G4.0b, LieGroups Layer 2, LieGroupoidsPoisson G0.1.

## Downstream consumers

No roadmap consumes SuperconnectionsAndMathaiQuillenForms.
IndexTheory states its cohomological formula with CharacteristicClasses' Thom classes and Chern
characters (IndexTheory, Conventions) and builds its heat-kernel trace of Layer 8.2 for Dolbeault
Laplacians on its own; NoncommutativeGeometry puts the local index formula outside its scope.

## Research context

Quillen (1985) introduced superconnections to give a heat-kernel proof of a local index theorem for
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
Lawson's theory of characteristic currents (Harvey–Lawson 1993; announced in Harvey–Lawson 1994).
For a complex bundle `F` of rank `n` with connection, `0 ≤ k < n` and sections `s₀, …, s_k` whose
bundle map `α : ℂ^(k+1) → F` is `k`-atomic (Harvey–Lawson 1994, §7, p. 60), the current
`LD(s₀, …, s_k)` of their linear-dependence locus is defined and
`c_(n−k)(Ω_F) − LD(s₀, …, s_k) = dT` with `T` a canonical locally integrable form (§8, p. 61);
atomicity excludes, for instance, the identically zero section of a line bundle, whose zero set
has codimension `0`. Their Theorem B (§4, p. 59) gives a family of Thom forms that are closed, of
fibre integral `1`, equal to the Pfaffian form on the zero section, and converge to the current of
the zero section. The analytic input is
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
  298, Springer, 1992. doi:10.1007/978-3-642-58088-8. Zbl 0744.58001. Chapter 1, « Background on
  Differential Geometry », pp. 13–59, contains §1.3 (superspaces), §1.4 (superconnections) and
  §1.6 (the Euler and Thom classes); Chapter 9, « The Index Bundle », pp. 263–310, contains §9.1
  (the index bundle in finite dimensions); Chapter 10, « The Family Index Theorem », pp. 311–348.
- S. Wu, « Mathai–Quillen formalism », in *Encyclopedia of Mathematical Physics*, vol. 3,
  Elsevier, 2006, 390–399; arXiv:hep-th/0505003 (cited in the numbering and pages of arXiv
  version 1).
- L. E. Garcia, « Superconnections, theta series, and period domains », *Adv. Math.* 329 (2018),
  555–589; arXiv:1604.03897 (cited in the numbering and pages of arXiv version 1, Appendix A,
  pp. 23–25).
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
- D. E. Knuth, « Overlapping Pfaffians », *Electron. J. Combin.* 3 (1996), no. 2, Research Paper
  R5. doi:10.37236/1263. Zbl 0862.15007. arXiv:math/9503234 (cited in the numbering and pages of
  arXiv version 1).
- F. R. Harvey, H. B. Lawson Jr., *A Theory of Characteristic Currents Associated with a Singular
  Connection*, Astérisque 213, Soc. Math. France, 1993. Zbl 0804.53037.
- F. R. Harvey, H. B. Lawson Jr., « A theory of characteristic currents associated with a singular
  connection », *Bull. Amer. Math. Soc.* 31 (1994), 54–63. doi:10.1090/S0273-0979-1994-00497-5;
  arXiv:math/9407216.
- F. R. Harvey, S. Semmes, « Zero divisors of atomic functions », *Ann. of Math.* (2) 135 (1992),
  567–600. doi:10.2307/2946577.
- R. MacPherson, « Chern classes for singular algebraic varieties », *Ann. of Math.* (2) 100
  (1974), 423–432. doi:10.2307/1971080.
