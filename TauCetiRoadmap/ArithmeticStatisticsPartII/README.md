# Roadmap: arithmetic statistics, Part II: integral orbit dictionaries

**Summary.** Construct the integral orbit dictionaries for cubic, quartic and quintic rings, genus-one coverings and symmetric pencils. Keep the change-of-variables convention, stabilizer, integral representative and local Kummer comparison in every parametrization.

## Scope and ownership

This part owns integral orbit dictionaries. Its numbered subsections retain the common layer notation: Layer 0 is the family interface, Layer 1 the orbit dictionaries, Layer 2 the counts, Layer 3 the field and finite-group tools, Layer 4 the Selmer means, and Layer 5 the probability and geometric comparisons. An exact link identifies the supplying part whenever a layer is shared between two parts.

The following boundaries fix the carriers and prevent parallel versions of existing mathematics.

- ArithmeticStatisticsPartI Layer 0 owns arithmetic families, coefficient lattices, binary cubic and quartic coefficients, invariant heights and local proportions. Its “Cubic supplier conventions”, “Refinement binary form order”, “Refinement symmetric pencil” and “Strong weak discriminant” targets supply the exact carriers and normalizations used below. AnalyticNumberTheoryPartII §§5.4–5.5 owns the twisted cubic action and the general projective cubic-algebra equivalence. The based index forms here are sign adapters to those suppliers.
- EllipticCurves Layers 1, 5–8 owns isogenies, quadratic twists, Mordell–Weil, finite Selmer groups, their exact sequence and integral minimal short models. This part constructs orbit dictionaries and their comparison with the native explicit two-descent interface; ArithmeticStatisticsPartI §0.5 owns the elliptic-family height adapter.
- PolynomialGaloisGroups Layers 0, 2, 4 and 6 owns root permutation actions, generic orbit resolvents and transitive-group predicates. Tau Ceti's quartic three-element and quintic six-element resolvents below are reused. The integral resolvent-order comparisons retain their lattices, quadratic maps and orientations. A monic integral sextic resolvent polynomial alone does not specify the sextic lattice or its discriminant factor 16.
- GlobalNumberFields Layer 11 owns the number-field-order specialization of orders, Picard groups, overorders, trace duals and ideal norms. The full-lattice order comparison below covers finite étale product algebras; degenerate rings use the localization predicates below over Z or a DVR. GlobalQuadraticForms Layer 5 owns the Hasse principle used in two-descent. OrthogonalSpinGroups Layer 0 owns the general orthogonal group; §1.13 here specializes it to a fixed arithmetic matrix and lattice. GeometryOfNumbersAndQuadraticArithmetic §0.2 owns adapted primitive lattice bases; the representation-specific minor fibres remain here.
- SchemeAndStackFoundations §§3.6–3.7 owns unpointed Picard schemes, degree torsors, the Picard–Brauer obstruction and rational-divisor comparisons. JacobianChallenge Layers A and D supplies the pointed Jacobian comparison. AbelianSchemesAndArithmeticModuli Layers A2–A3 owns abelian isogenies, duality, theta groups and Cartier-dual kernels. The new targets here compare those objects with the orbit representations, retaining the generalized modulus and the precise scalar kernel.
- `TauCeti.NumberField.IsMonogenic` and `isMonogenic_iff_exists_index_eq_one` in `TauCeti.NumberTheory.NumberField.Monogenic` supply ordinary monogenicity of maximal number-field orders. The monogenized cubic resolvent in §1.11 retains a chosen generator modulo integer translation and includes nonmaximal and nonétale rings.

The later arithmetic-statistics parts consume these dictionaries.

HeightsRationalPointsAndObstructions §3.18a is a downstream consumer of the Integral pencil orbits, Pencil fano torsor, Locally soluble pencil orbits and Integral soluble pencils here; it introduces no second orbit, Fano or integral-representative construction.

AnalyticNumberTheoryPartII §§5.4–5.5 supplies the cubic dictionaries and takes no input from the statistics parts.

## Conventions

All finite-field cardinalities `q` are prime powers greater than one. A letter `p` or `ℓ` declared prime is a natural prime. An integer modulus is positive unless its zero case is explicitly discussed. Empty products have value one, zero-dimensional vector spaces and the trivial group are retained, and any formula with `q^i-1` in a denominator specifies the positive index range. At characteristic two, alternating means zero diagonal as well as skew symmetry; polar isotropy alone is not quadratic isotropy.

A height includes its carrier and equivalence relation. Inclusive Northcott sublevels use `H≤X`; strict source counts use `H<X`. Passing between them requires the stated boundary estimate. A field is counted up to base-field isomorphism unless an embedded or rigid family is named. An orbit count is unweighted unless its reciprocal stabilizer or rational-orbit weight is displayed. A natural cardinal is used only after finiteness; the value zero of `Nat.card` on an infinite type never licenses division. The average of an empty finite sublevel is zero, but any limiting ratio theorem assumes the specified positive denominator.

Binary coefficients descend in x-degree, and changes of variables use row vectors. Cubics use the determinant-twisted `GL2` action; quartics use either the ordinary `GL2` action for integral orbit enumeration or the determinant-to-the-minus-two action of `PGL2` for two-descent, as specified. For `(a,b,c,d,e)`, `I=12ae-3bd+c²`, `J=72ace+9bcd-27ad²-27b²e-2c³`, and the integral binary discriminant satisfies `27Δ=4I³-J²`. The fixed-degree binary discriminant is used when a leading coefficient vanishes. For the quartic `x⁴-y⁴`, `I=-12`, `J=0`, `Δ=-256`; this fixes the sign. Cremona–Fisher [11] instead writes `Δ_CF=4I³-J²=27Δ`. In the present normalization its fixed-degree homogeneous resultant identities are `Res(g,g₄)=81Δ²` and `Res(g,g₆)=Δ³`; the cubic `X³-3IX+J` has discriminant `729Δ`. These factors are retained even when the quartic leading coefficient is zero ([11], §2, Lemma 3, pp.2–3). With `E:y²=x³+Ax+B`, `(I,J)=(-3A,-27B)`, `H_E=max(4|A|³,27B²)` and `H_IJ=max(|I|³,J²/4)` satisfy `27H_E=4H_IJ`. Under the two-covering integral representative scaling `(I,J)↦(2⁴I,2⁶J)`, the invariant height scales by `2¹²`.

Coefficient lattices have additive Haar mass one locally. An algebraic-group Haar measure comes from the stated invariant differential; it is not independently renormalized during a product formula. The p-adic absolute value has `|p|_p=p⁻¹`. Archimedean coefficient regions use the displayed Euclidean or Lebesgue measure. Actual CRT residue proportions are used for coupled finite conditions; a product of marginal densities is valid only for independently imposed prime-power conditions.

Every arithmetic conjecture is a proposition, not an axiom or an unconditional distribution theorem. Distribution convergence does not imply convergence of unbounded moments. Fixed-q degree limits, fixed-degree large-q limits and iterated liminf/limsup limits are kept distinct. Selmer dimension, p-infinity Selmer corank and Mordell–Weil rank are distinguished; passing from corank to rank requires the stated condition on the divisible part of Sha. A degree-one Picard-scheme point, an actual degree-one divisor, and a point over an odd-degree extension are compared only under the explicit Brauer/local-solubility hypotheses.

## Exact supplier contracts

From Mathlib use `Cubic` and `Cubic.discr` for ordinary binary cubics; `Polynomial.discr`, resultants, separability and `Squarefree`; `Algebra.discr`, `Algebra.trace` and `Algebra.norm` on finite free algebras; `Basis`, `Module.Free`, `Module.Finite` and `Module.finrank`; `QuadraticForm`, `LinearMap.BilinMap.toQuadraticMap`, matrices, exterior powers, submodules and Smith normal form; `Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup` and `Matrix.ProjGenLinGroup`; `MulAction.stabilizer` and `MulAction.orbitRel`; `AdjoinRoot`, `Polynomial.modByMonic`, p-adic integers and fields and number-field completions. The fixed-degree binary discriminant comes from ArithmeticStatisticsPartI, rather than from the affine polynomial after a degree drop.

From Tau Ceti's `TauCeti.FieldTheory.GaloisGroups.Resolvent.Quartic.Basic` use `TauCeti.quarticD4Invariant`, `quarticD4Spec`, `quarticD4Spec_specialize` and `resolventCubic`. Its `.Quartic.Discriminant` supplies `discr_quarticD4Spec_specialize`, `discr_resolventCubic` and `separable_resolventCubic_iff`. These are the three-element Galois-set resolvent and polynomial discriminant identity consumed in §1.15. From `.Quintic.Basic` use `TauCeti.quinticF20Invariant`, `quinticF20Spec`, `card_renameOrbit_quinticF20Invariant` and `resolventSextic`, with `monic_resolventSextic` and `natDegree_resolventSextic`. This supplies the six-element `S₅/F₂₀` polynomial resolvent; distinct specialized values require its separation hypothesis. Section 1.10 constructs the distinct integral sextic resolvent lattice with discriminant `(16 Disc R)³`.

From `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.XSubT` use `WeierstrassCurve.Affine.A`, `M`, `μ`, `μX_of_eval_f_ne_zero`, `μX_of_eval_f_eq_zero`, `ker_μ_eq`, `normM` and `range_μ_le_ker_normM`. Its `LocalCondition` module supplies `localRes`, `localCondition` and `localRes_comp_μ`; its `SelmerGroup` module supplies `selmerGroup₂` and `mem_selmerGroup₂_iff`; its `TwoTorsion` module supplies `card_ker_nsmul_two`. The local restriction maps act on the same unit-squareclass quotient. No second étale-algebra squareclass or explicit Selmer carrier is constructed. The abbreviations `BinaryQuartic.etaleAlgebra`, `squareClasses` and `restrictSquareClasses` below only specialize this interface to the curve `curveIJ`.

From EllipticCurves Layers 1, 5–8 require isogenies, quadratic twists and their two-torsion identifications, the finite exact sequence `0→E(K)/nE(K)→Sel_n(E/K)→Sha(E/K)[n]→0`, localization, variable-change naturality and the explicit/cohomological two-descent comparison. Over `Q_p` its formal-group, component-group and reduction interfaces specify the local Kummer images. These are prerequisites to orbit comparisons; no statistical rank identity is inferred from them alone.

From GlobalNumberFields Layer 11 require the number-field-order specialization only. For finite étale product algebras use the full-lattice order comparison below on native `Subalgebra` and `Submodule`, the localization predicates and determinant-lattice `ArithmeticOrbitRefinement.idealNorm` defined in that comparison, and Mathlib `Algebra.discr_of_matrix_mulVec`. Noninvertible ideals remain modules. Degenerate ring maximality uses the Z-finite predicate over Z and the D-finite uniformizer predicate over a DVR, without a `NumberFieldOrder` instance. From GlobalQuadraticForms Layer 5 require the Hasse principle for nonsingular conics over number fields. GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3 supplies adapted primitive bases, saturation and covolume comparisons. Its §4.1 supplies the bounded semialgebraic lattice estimate with translates, projections and multiplicities for downstream counting applications.

From SchemeAndStackFoundations Layers 0–3 and §§3.6–3.7 require finite étale covers, smooth lifting, unpointed Picard degree torsors and the Picard–Brauer exact sequence. AlgebraicModuliForArithmeticGeometry §§1.1–1.3 supplies projective and Grassmannian representability; this part constructs the regular-pencil Fano loci on that carrier. JacobianChallenge Layers A and D supplies pointed Jacobians and their Picard comparison. AbelianSchemesAndArithmeticModuli Layers A2–A3 supplies abelian isogenies, duality, polarizations and theta-group commutators, with fppf cohomology when the degree meets the characteristic. NeronModelsAndSemistableAbelianVarieties Layers 1–4 supplies the local models, components and Picard comparison used in §1.16; §§4.8–4.12 supplies `BgwSmoothHyperellipticModel`, `BgwNodalPinch`, `BgwGeneralizedJacobian`, `BgwTwoTorsion`, `BgwOddFactorTorsors` and `BgwBoundaryCupProduct` for the pencil comparisons in §1.12.

SchemeAndStackFoundations Layer 2 supplies fppf cohomology and torsors. From SelmerIwasawaCohomology §2.12a require number-field abelian Kummer localization and finite Selmer groups, specifically `abelianKummer`, `abelian_localH1_comparison`, `abelianDescent_exact` and `abelianSelmerGroup_finite`. The global-function-field Jacobian adapter below constructs the prime-to-characteristic comparison using ArithmeticGaloisDuality §R02.4.5. ArithmeticGaloisDuality Layer R02.4 supplies the global-to-local Brauer injection used by the marked quartic embedding. The degree-one-divisor assertions retain SchemeAndStackFoundations §3.6's Brauer obstruction: a rational Picard point is not identified with a line bundle until it vanishes.

From AnalyticNumberTheoryPartII require [binary-cubic action and discriminant](../AnalyticNumberTheoryPartII/README.md#s5-4) (§5.4) and [projective cubic-algebra equivalence](../AnalyticNumberTheoryPartII/README.md#s5-5) (§5.5), including nonprincipal rank-two modules, stabilizers, determinant-line discriminants and the nonzero-discriminant étale comparison. ArithmeticStatisticsPartI's “Cubic supplier conventions” specializes this interface to free coefficient lattices. The based index-form and normal-basis statements below fix signs and weights for that specialization. DiophantineApproximationAndTranscendence §4.3 supplies effective Thue finiteness; the uniform bound N in §1.8 is an explicit additional hypothesis, with its source constants retained there. Its §2.4 supplies finite-rank unit-equation bounds for the order/cross-ratio comparisons consumed by downstream statistical applications.

### From earlier arithmetic-statistics parts

From ArithmeticStatisticsPartI require [binary cubic forms and the twisted action](../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action), [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring), [cubic ring of a binary cubic form](../ArithmeticStatisticsPartI/README.md#cubic-ring-of-a-binary-cubic-form), [discriminant of the cubic ring of a form](../ArithmeticStatisticsPartI/README.md#discriminant-of-the-cubic-ring-of-a-form), [binary quartic form](../ArithmeticStatisticsPartI/README.md#binary-quartic-form), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), [relative invariance of i and j](../ArithmeticStatisticsPartI/README.md#relative-invariance-of-i-and-j), [invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), [quartic discriminant is the polynomial discriminant](../ArithmeticStatisticsPartI/README.md#quartic-discriminant-is-the-polynomial-discriminant), [binary local proportion](../ArithmeticStatisticsPartI/README.md#binary-local-proportion), [monic density formulas](../ArithmeticStatisticsPartI/README.md#monic-density-formulas), [local maximality](../ArithmeticStatisticsPartI/README.md#local-maximality), [refinement binary form order](../ArithmeticStatisticsPartI/README.md#refinement-binary-form-order), [refinement symmetric pencil](../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil), [strong weak discriminant](../ArithmeticStatisticsPartI/README.md#strong-weak-discriminant), [refinement binary discriminant](../ArithmeticStatisticsPartI/README.md#refinement-binary-discriminant). Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

## How to read the build

The mathematical specification is this README; `Suggested.lean` states headline acceptance theorems on the pinned carriers. Its quartic coordinate definitions use Mathlib multivariate polynomials and the native elliptic-point, cubic-algebra and Selmer carriers. The sections below specify the full library development, including its hypotheses, source locators, basic theory and prose Checks. Arithmetic and geometric constructions whose objects are absent from the pins remain targets of these sections. Earlier-part supplier links point to their precise statements. The source counts retain their strict or inclusive cutoffs and their own denominators.

## Layer 1: Integral orbit dictionaries

The arithmetic dictionaries retain integral bases, orientations, resolvent data and group-scheme stabilizers until the relevant quotient is taken. Discriminant identities are polynomial identities, including degenerate tensors. Étale comparisons and Selmer interpretations impose their nonzero-discriminant hypotheses separately. This order is essential for the later p-adic masses.

<a id="full-lattice-order-comparison"></a>

**Full-lattice order comparison.** Let D be a Dedekind domain with fraction field K and L a finite étale K-algebra of degree n. Represent a D-order by a `Subalgebra D L` whose underlying `Submodule D L` is finite and spans L over K. Overorders are inclusions of such full lattices. Construct the comparison with abstract finite projective D-algebras whose rationalization is L, transporting multiplication, inclusions and localization. The trace dual is the lattice of elements x with `Tr(xO)⊂D`; prove it is full and finite using the nondegenerate trace pairing. Fractional O-ideals are O-stable full D-submodules of L, with multiplier rings; no inverse is assigned to a noninvertible ideal.

For D=Z or a DVR, given bases of O⊂O′ and inclusion matrix M, prove `Disc(O)=det(M)² Disc(O′)`. Over Z, `|det(M)|=[O′:O]`; over a DVR its valuation is the module length. Over Z compare finite p-primary overorders with Part I’s Z-finite maximality predicate inside `O[1/p]`. For a DVR D with uniformizer π and any finite free D-algebra O, define `ArithmeticOrbitRefinement.IsMaximalAtUniformizer` to mean that every D-finite overring containing O inside `O[1/π]` equals O. Prove its equivalence with absence of proper finite overorders in the rational algebra, and specialize to π=p over Z_p. These localization predicates also apply to degenerate finite free algebras, without an étale trace-dual assertion.

Define `ArithmeticOrbitRefinement.idealNorm` for a D-submodule I of L relative to a specified K-basis b: it is the D-span in K of all determinants of coordinate columns of n vectors of I. This definition does not require stability or invertibility. If `b′=bM`, prove `N_b′(I)=det(M)⁻¹N_b(I)`; for `c∈L×` prove `N_b(cI)=N_{L/K}(c)N_b(I)`. For full finite lattices these are fractional D-lattices; no generator is assumed. On a number field compare these constructions with GlobalNumberFields Layer 11, preserving its invertibility restrictions.

*Needs:* ArithmeticStatisticsPartI “Cubic supplier conventions” (finite-rank localization maximality); GlobalNumberFields Layer 11 (number-field specialization); Mathlib `Subalgebra`, `Submodule`, `Algebra.trace`, `Algebra.norm`, `Algebra.discr_of_matrix_mulVec` and Smith normal form.

([[53]](#ref-53), §2, Definition2.1, Theorem2.2 and §2.1, lattices, duals and algebras over a Dedekind domain; Mathlib `Algebra.discr_of_matrix_mulVec` for the displayed basis identity; [[73]](#ref-73), Theorem16 and its determinant-norm construction, pp.7–8.)

**Checks.**

- The split quartic order `Z⁴⊂Q⁴` is a full-lattice order although its ambient algebra is not a number field.
- For `O=Z+2Z⁴⊂O′=Z⁴`, the index is 8 and `Disc(O)=64 Disc(O′)`.
- In `O=Z+2Z²⊂Q²`, the stable lattice `I=Z²` has multiplier ring `Z²` and is not invertible as an O-ideal. Relative to the O-basis `((1,1),(2,0))`, its determinant norm is `(1/2)Z`.
- In Q³ with its standard basis, `N(2Z×Z×Z)=2Z`; multiplying that lattice by the rational-algebra unit `(3,1,1)` gives norm `6Z`.
- For `D=F₅[[t]]`, `O=D²` is maximal in `F₅((t))²` under the uniformizer-t predicate. It is outside Part I’s Z-finite predicate; inverting the integer 5 gives the zero ring.
- For `O=D[ε]/(ε²)` over a DVR, adjoining `ε/π` gives a proper D-finite overorder inside `O[1/π]`, so the uniformizer predicate rejects it even though no nondegenerate trace pairing exists.

### 1.1 Binary cubics and cubic algebras

<a id="quotient-by-scalars-is-free"></a>

**Quotient by scalars is free.** Let R be a principal ideal domain or a local ring and A an R-algebra that is free of rank `n ≥ 1` as an R-module. Then `R → A`, `r ↦ r.1`, is injective, the quotient `A/R.1` is free of rank `n - 1`, and 1 extends to an R-basis `<1, a_2, ..., a_n>` of A. For `n = 3` there is a basis b of A indexed by Fin 3 with `b 0 = 1`.

R is a PID or a local ring (over an arbitrary base the quotient is only projective, and the parametrization must be phrased with rank-2 projective modules; that generality is not used by any consumer and is outside this free-basis specialization).

For the proof, Injectivity: if `r.1 = 0` then r annihilates the nonzero free module A, so `r = 0`. Local case: 1 is nonzero modulo mA (else `A = mA` and Nakayama gives `A = 0`); extend its image to a basis of `A/mA` and lift; by Nakayama the lift is a basis. PID case: `A/R.1` is finitely generated and torsion-free (if `r a = s.1` with `r ≠ 0` then a is integral over R and equals `s/r` in A tensor `Frac(R)`; a PID is integrally closed, so `s/r` is in R), hence free by the structure theorem (Mathlib `Module.free_of_finite_type_torsion_free'`); a basis of the quotient lifts, together with 1, to a basis of A.

*Needs:* `Module.free_of_finite_type_torsion_free'` (Mathlib), `Module.Free` (Mathlib).

([[7]](#ref-7), Lemma 1.1 and its proof, printed pp. 1-2.)

**Checks.**

- For `A = ℤ[x]/(x^3 - 2)`: the basis `<1, x, x^2>` has first vector 1.

- For `R = ℤ/4` (local) and `A = R^3` the vector `(1,1,1)` extends to a basis.

- For `A=R` of rank one, the scalar map is the identity and the quotient is the zero module, of rank zero.

<a id="index-form-of-a-based-cubic-ring"></a>

**Index form of a based cubic ring.** Let A be an R-algebra with an R-basis `b = <1, b_1, b_2>`. For u, v in A let `D_b(u, v)` be the determinant of the coordinate vectors of 1, u, v in b. The index form of b is the binary cubic form `I_b(x, y) = D_b(ξ, ξ^2)` for `ξ = x b_1 + y b_2`, i.e. `1 ^ ξ ^ ξ^2 = I_b(x,y) (1 ^ b_1 ^ b_2)` in the top exterior power; its coefficients are `(D(b_1, b_1^2), D(b_2, b_1^2) + 2 D(b_1, b_1 b_2), 2 D(b_2, b_1 b_2) + D(b_1, b_2^2), D(b_2, b_2^2))`. It depends only on the images of `b_1`, `b_2` in `A/R.1`; a change of basis of `A/R.1` by `γ` in `GL2(R)` replaces `I_b` by `γ . I_b` (twisted action); the normal basis `<1, ω, θ>` of `R(f)` has index form f; and over `ℤ`, `|I_b(m, n)|` is the index of `ℤ[m b_1 + n b_2]` in A when it is nonzero.

**Supplier ownership.** [AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md#s5-5) §5.5 supplies the inverse index-form construction; the chosen based formula below is the required sign adapter. The following based specialization fixes its signs and arithmetic weights.

The determinant is taken in the coordinates of the same basis b, which is what produces the twist `(det γ)^{-1}`. Orientation convention: with Bhargava-Shankar-Tsimerman's table the normal basis has index form `+f`; with Gross-Lucianovic's basis `<1, i, j> = <1, -ω, -θ>` the index form is -f.

The required API is:

- `CubicRing.det3`: `det3 b u v = det(coords 1, coords u, coords v)` in the basis b.

- `CubicRing.indexForm`: The index form of a basis indexed by Fin 3.

- `CubicRing.eval_indexForm`: `(indexForm b)(x,y) = det3 b ξ ξ^2` for `ξ = x b_1 + y b_2`.

- `CubicRing.indexForm_translate`: Translating `b_1`, `b_2` by scalars does not change the index form.

- `CubicRing.indexForm_eq_smul`: Two bases with first vector 1 have index forms in one twisted `GL2(R)`-orbit.

- `CubicRing.indexForm_cubicRing_basis`: The normal basis of `R(f)` has index form f.

- `CubicRing.index_adjoin_eq_natAbs_indexForm`: Over `ℤ`: `[A : ℤ[m b_1 + n b_2]] = |I_b(m, n)|` when nonzero.

For the proof, Polarization of the trilinear expression `D(ξ, ξ^2)` gives the four coefficients. Translation invariance: adding scalars to `b_1`, `b_2` changes `ξ` by a scalar and `ξ^2` by a scalar plus a multiple of `ξ`, which do not change the determinant with first row the coordinates of 1. Change of basis: take the column of new basis vectors to be `γ` times the column `(b_1,b_2)`, modulo scalars. Then the row of coordinates `(x,y)` is replaced by `(x,y) γ` and `D_{b'} = (det γ)^{-1} D_b`; hence `I_{b'} = γ . I_b`. With a row of basis vectors transformed on the right, the acting matrix would instead be `γ` transposed. For the normal basis of `R(f)` the coefficients are computed from the multiplication table: `I(x,y) = det(1; ξ; ξ^2) = f(x, y)` (the footnote of Gross-Lucianovic). Index formula (Gan-Gross-Savin, Lemma 5.3): `<1, ξ, ξ^2>` spans `ℤ[ξ]`, and its coordinate matrix in b has determinant `I_b(m, n)`.

*Needs:* [binary cubic forms and the twisted action](../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action), [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring), [cubic ring of a binary cubic form](../ArithmeticStatisticsPartI/README.md#cubic-ring-of-a-binary-cubic-form), `Matrix.det` (Mathlib), `Basis` (Mathlib).

([[6]](#ref-6), Proof of Theorem 9, printed p. 5; [[8]](#ref-8), Lemma 5.3, printed pp. 117-118.)

**Checks.**

- For the basis `<1, e_0, e_1>` of `ℤ^3` the index form is `(0, -1, 1, 0) = x y^2 - x^2 y`.

- The normal basis of `R(x^3 + 2y^3)` has index form `x^3 + 2y^3`.

- Over Q, fixing 1 and replacing `b_1`,`b_2` by `2b_1`,`2b_2` multiplies the index form by 2, whereas untwisted substitution multiplies it by 8. Thus the determinant twist is necessary.

- For the basis `<1, e_0, e_1>` of `ℤ^3` (`e_i` idempotents) the index form is `x y^2 - x^2 y`.

- Negating `b_1` and `b_2` negates the index form (the twisted action of -1).

<a id="normal-bases-of-a-cubic-ring"></a>

**Normal bases of a cubic ring.** Let A be an R-algebra with basis `<1, b_1, b_2>`. There are unique r, s in R such that `b'_1 = b_1 + r`, `b'_2 = b_2 + s` satisfy `b'_1 b'_2` in R (a normal, or good, basis). For a normal basis `<1, ω, θ>` with index form `f = (a, b, c, d)` the multiplication table is `ω θ = -ad`, `ω^2 = -ac - b ω + a θ`, `θ^2 = -bd - d ω + c θ`; in particular A is isomorphic to `R(f)` by `ω ↦ ω`, `θ ↦ θ`.

**Supplier ownership.** [AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md#s5-5) §5.5 supplies local normal-basis normalization; the scalar shifts below pin the free-basis specialization. The following based specialization fixes its signs and arithmetic weights.

A is associative and commutative; the basis contains 1.

For the proof, Write `b_1 b_2 = n + s b_1 + t b_2` with n, s, t in R; then `(b_1 - t)(b_2 - s) = n + st` is in R, so `b'_1 = b_1 - t`, `b'_2 = b_2 - s` is normal (Gross-Lucianovic, proof of Proposition 2.1: `i = omega_2 - t`, `j = omega_3 - s`). Uniqueness: if `(b'_1 + u)(b'_2 + v)` is also in R then `v b'_1 + u b'_2` is in R, so `u = v = 0` because `<1, b'_1, b'_2>` is a basis. In a normal basis write `ω^2 = m + β ω + α θ` and `θ^2 = l + δ ω + γ θ`; the coefficients of the index form are then read off (the determinant computation of the index form), identifying `(α, β, γ, δ)` with `(a, -b, c, -d)`. Associativity forces the constants n, m, `l = -ad`, -ac, -bd (as in the construction of `R(f)`).

*Needs:* [index form of a based cubic ring](#index-form-of-a-based-cubic-ring), [cubic ring of a binary cubic form](../ArithmeticStatisticsPartI/README.md#cubic-ring-of-a-binary-cubic-form).

([[7]](#ref-7), Proof of Proposition 2.1, printed p. 3.)

**Checks.**

- `ℤ[x]/(x^3 - 2)` with basis `<1, x, x^2>` is already normal `(x . x^2 = 2)`; its index form is `x^3 - 2y^3` in the pinned determinant convention.

- In the same ring, `b₁=x+1` and `b₂=x²+2` satisfy `b₁b₂=−2+2b₁+b₂`. The unique shifts are `−1` and `−2`, yielding the original normal basis; interchanging the two shift coefficients fails this computation.

- In `ℤ[ε,η]/(ε²,εη,η²)`, the basis `(1,ε,η)` is normal. The translated basis `(1,ε+1,η)` has product `η` and normalizes by shifts `(−1,0)`. Returning zero shifts for every basis fails this degenerate example.

<a id="delone-faddeev-parametrization-of-cubic-rings"></a>

**Delone faddeev parametrization of cubic rings.** Let R be a principal ideal domain or a local ring (e.g. `ℤ`, `ℤ_p`, Q, `Q_p`, R, `F_p`). The map `f ↦ R(f)` induces a bijection between the `GL2(R)`-orbits (twisted action) on binary cubic forms over R and the isomorphism classes of cubic R-algebras. The inverse sends A to the index form of any basis `<1, b_1, b_2>` (which exists by quotient-by-scalars-is-free); `disc(R(f)) = disc(f)`, so the discriminant (in `R/(R^x)^2`; in `ℤ` for `R = ℤ`) is preserved. Concretely: every cubic R-algebra A is isomorphic to `R(f)` for some f; and `R(f)` is isomorphic to `R(g)` if and only if `g = γ . f` for some `γ` in `GL2(R)`.

**Supplier ownership.** [AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md#s5-5) §5.5 supplies the more general projective equivalence; the PID/local statement below is its free-lattice specialization. The following based specialization fixes its signs and arithmetic weights.

R a PID or a local ring (Gross-Lucianovic's hypothesis); over `ℤ` this is Delone-Faddeev (for nonzero discriminant) and Gan-Gross-Savin (in general). The action is the twisted action; with the untwisted action the statement is false (the scalar u would act by `u^3`).

For the proof, Existence: choose a basis `<1, b_1, b_2>` (quotient-by-scalars-is-free), normalize it (normal-bases-of-a-cubic-ring), and send `ω ↦ b_1`, `θ ↦ b_2`; the multiplication tables agree, giving `A = R(I_b)`. Well-definedness of the inverse on isomorphism classes: an isomorphism `A → A'` carries bases to bases, and two bases of `A/R.1` differ by `γ` in `GL2(R)`, changing the index form to `γ . I` (index-form-of-a-based-cubic-ring). `R(γ . f) = R(f)` (cubic-ring-of-a-binary-cubic-form); combining: `R(f) = R(g)` iff g is in the orbit of f. Discriminant: discriminant-of-the-cubic-ring-of-a-form.

*Needs:* [binary cubic forms and the twisted action](../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action), [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring), [quotient by scalars is free](#quotient-by-scalars-is-free), [cubic ring of a binary cubic form](../ArithmeticStatisticsPartI/README.md#cubic-ring-of-a-binary-cubic-form), [discriminant of the cubic ring of a form](../ArithmeticStatisticsPartI/README.md#discriminant-of-the-cubic-ring-of-a-form), [index form of a based cubic ring](#index-form-of-a-based-cubic-ring), [normal bases of a cubic ring](#normal-bases-of-a-cubic-ring).

([[6]](#ref-6), Theorem 9, printed p. 4; [[7]](#ref-7), Proposition 2.1, printed p. 4; [[6]](#ref-6), End of Section 2, printed p. 6.)

**Checks.**

- disc is preserved: the orbit of `x^2 y - x y^2 (disc 1)` corresponds to `ℤ^3`.

- The zero form corresponds to `ℤ + ℤ ω + ℤ θ` with all products 0 (content ∞); `x^3` corresponds to `ℤ[x]/(x^3)`.

- Over `F_p` the five `GL2(F_p)`-orbit types of nonzero forms with distinct factorization patterns `(111)`, `(12)`, `(3)`, `(1^2 1)`, `(1^3)` give `F_p^3`, `F_p x F_{p^2}`, `F_{p^3}`, `F_p[t]/(t^2) x F_p`, `F_p[t]/(t^3)` (Bhargava-Shankar-Tsimerman, Section 4).

<a id="automorphisms-of-cubic-rings-are-stabilizers"></a>

**Automorphisms of cubic rings are stabilizers.** For a binary cubic form f over a PID or local ring R, the group of R-algebra automorphisms of `R(f)` is isomorphic to the stabilizer of f in `GL2(R)` under the twisted row-variable action. If `T_sigma` is the usual column-coordinate matrix of `σ` on `R(f)/R` in the basis `<ω, θ>`, the group homomorphism sends `σ` to (`T_sigma` inverse) transposed. Conversely each stabilizer element determines a unique automorphism.

**Supplier ownership.** [AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md#s5-5) §5.5 supplies stabilizer/automorphism compatibility; this statement fixes the arithmetic weight used by later counts. The following based specialization fixes its signs and arithmetic weights.

Twisted action; R a PID or local ring.

For the proof, The image basis has column of vectors `T_sigma` transposed times the original column, and hence index form (`T_sigma` transposed) . f. Automorphisms preserve the index form, so this equals f. The inverse matrix also stabilizes f. Since `T_`(`σ` tau) `= T_sigma T_tau`, inverse-transpose, unlike transpose alone, respects multiplication for the chosen left action. A stabilizer element determines the quotient matrix by inverse-transpose. Lift its two basis vectors and normalize them; normality uniquely determines the scalar translates. The multiplication table then gives the unique algebra automorphism, inverse to the preceding construction.

*Needs:* [delone faddeev parametrization of cubic rings](#delone-faddeev-parametrization-of-cubic-rings), `MulAction.stabilizer` (Mathlib).

([[6]](#ref-6), Proposition 12 and proof, printed p. 6.)

**Checks.**

- For `f = x^2 y - x y^2`, `R(f) = ℤ^3` has automorphism group `S_3`, and the stabilizer of `x^2 y - x y^2` in `GL2(ℤ)` has order 6.

- For irreducible f defining a non-Galois cubic field the stabilizer is trivial.

<a id="reducible-forms-and-zero-divisors"></a>

**Reducible forms and zero divisors.`** (a)` For a nonzero integral binary cubic form f, `R(f)` is an integral domain if and only if `f(x, y) ≠ 0` for all `(x, y)` in `ℤ^2 \ {0}`, i.e. f has no linear factor over Q (f is irreducible over Q). `(b)` Over a field K, `R(f)` is a field if and only if `f ≠ 0` and f has no zero in `P^1(K)`. In particular the irreducible integral forms correspond to the orders `R(f)` whose fraction algebra `R(f)` tensor Q is a cubic field.

`f ≠ 0` in `(a)`; for `f = 0` the ring has nilpotents.

For the proof, Over a field K, a projective zero can be moved to `(1:0)` by `GL2(K)`. Then `a = 0` and `ω θ = 0`, with both `ω` and `θ` nonzero basis vectors. If f has no projective zero, `a = f(1,0)` is nonzero. Scaling f by the unit a inverse preserves `R(f)` up to isomorphism. For `a = 1` the multiplication table gives `θ = omega² + b ω + c` and `omega³ + b omega² + c ω + d = 0`. Thus `R(f)` is `K[t]/(t³ + bt² + ct + d)`, which is a field because a cubic without a K-root is irreducible. For integral f, `R(f)` is torsion-free and embeds in `R(f)` tensor Q. A nontrivial zero-divisor relation in the latter can have its denominators cleared to give one in `R(f)`; hence `R(f)` is a domain exactly when its rational algebra is. Apply the field argument, and clear denominators in projective roots to obtain the stated integral criterion. This avoids treating a primitive element of R as a primitive class in `R/ℤ`.

*Needs:* [delone faddeev parametrization of cubic rings](#delone-faddeev-parametrization-of-cubic-rings), [normal bases of a cubic ring](#normal-bases-of-a-cubic-ring).

([[6]](#ref-6), Proposition 11 and proof, printed pp. 5-6.)

**Checks.**

- `f = y(x^2 + y^2)` gives `ω θ = 0`.

- `f = x^3 - 2 y^3` gives the domain `ℤ[2^{1/3}]`.

<a id="nondegenerate-forms-and-etale-cubic-algebras"></a>

**Nondegenerate forms and etale cubic algebras.** For a binary cubic form f over a field K, `R(f)` is an etale K-algebra if and only if `disc(f) ≠ 0`. Over `ℤ`, `disc(f) ≠ 0` if and only if `R(f)` tensor Q is a product of number fields (an order in an etale cubic Q-algebra); forms of discriminant 0 are the degenerate locus.

**Supplier ownership.** [AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md#s5-5) §5.5 supplies the nonzero-discriminant étale comparison; the field and integral statements below specify its statistical domain. The following based specialization fixes its signs and arithmetic weights.

K any field.

For the proof, `disc(f) = Disc R(f)` is the determinant of the trace form (discriminant-of-the-cubic-ring-of-a-form). A finite-dimensional commutative K-algebra is etale iff it is a finite product of finite separable field extensions iff its trace form is nondegenerate: separable extensions have nondegenerate trace form (Mathlib `Algebra.traceForm_nondegenerate`), and a nonzero nilpotent or an inseparable residue extension lies in the kernel of the trace form.

*Needs:* [discriminant of the cubic ring of a form](../ArithmeticStatisticsPartI/README.md#discriminant-of-the-cubic-ring-of-a-form), `Algebra.Etale` (Mathlib), `Algebra.traceForm_nondegenerate` (Mathlib), `LinearMap.BilinForm.nondegenerate_iff_det_ne_zero` (Mathlib).

([Stacks Project, Lemma49.3.1, tag0BJF](https://stacks.math.columbia.edu/tag/0BJF), applied to `Spec R(f)→Spec K`, with the supplied equality of cubic-form and trace discriminants.)

**Checks.**

- `x^3` over K: disc 0 and `R(f) = K[t]/(t^3)` is not etale.

- `x^2 y - x y^2`: disc 1 and `R(f) = K^3`.

- Over `K=F₃(t)`, `x³−ty³` gives the purely inseparable algebra `K[u]/(u³−t)`: its discriminant vanishes and it is not étale, although it is a field.

### 1.2 Cubic maximality and index-p switching

<a id="davenport-heilbronn-sets"></a>

**Davenport heilbronn sets.** For a prime p, `U_p` is the set of integral binary cubic forms f such that `(i) f` is not congruent to 0 modulo p, and `(ii)` no `GL2(ℤ)`-translate `γ . f` has `p^2 | a` and `p | b`. `U_p` is `GL2(ℤ)`-invariant, is defined by congruence conditions modulo `p^2` (membership depends only on f mod `p^2`), and contains every form with `p^2` not dividing `disc(f)`. The same definition over `ℤ_p` (with `GL2(ℤ_p)`) gives an open compact subset of `V_3(ℤ_p)` whose intersection with `V_3(ℤ)` is `U_p`.

p prime; the twisted and untwisted actions give the same divisibility conditions over `ℤ` since `det =` ±1.

The required API is:

- `BinaryCubicForm.U`: The set `U_p`.

- `BinaryCubicForm.mem_U_iff`: Membership unfolded into `(i)` and `(ii)`.

- `BinaryCubicForm.smul_mem_U`: `U_p` is `GL2(ℤ)`-invariant.

- `BinaryCubicForm.mem_U_of_modEq`: Membership depends only on the coefficients modulo `p^2`.

- `BinaryCubicForm.mem_U_of_not_dvd_disc`: If `p^2` does not divide disc f then f is in `U_p`.

For the proof, Invariance: immediate from the definition (orbits are closed under `GL2(ℤ)`). Dependence modulo `p^2`: conditions `(i)` and `(ii)` only involve the coefficients modulo `p^2` after substitution by integral matrices. `p^2` not dividing disc: condition `(ii)` forces `p^2 | disc` (`disc(g)` with `p^2 | a`, `p | b` is divisible by `p^2` term by term), and `(i)` likewise; so `p^2` not dividing `disc(f)` implies f in `U_p`. For equality with the `ℤ_p` definition, reduce a bad `GL2(ℤ_p)` matrix modulo `p²`. Multiplying on the left by a suitable diagonal unit matrix normalizes its determinant to 1 while preserving the conditions `p² | a` and `p | b`. Every matrix in `SL2(ℤ/p²Z)` lifts to `SL2(ℤ)`: over this local ring elementary row operations reduce it to a diagonal unit matrix, itself a product of elementary matrices, and each elementary entry lifts to `ℤ`. The lift acts identically modulo `p²`. The reverse implication is immediate by extension of scalars.

*Needs:* [binary cubic forms and the twisted action](../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action).

([[6]](#ref-6), After Lemma 13, printed p. 7.)

**Checks.**

- `x^3 + 2y^3` is in `U_3` (`ℤ[2^{1/3}]` is the maximal order of `Q(2^{1/3})`, of discriminant -108).

- `x^3 + y^3` is not in `U_3` although it is not divisible by 3: condition `(ii)` fails after `y → y - x`.

- The zero form is not in `U_p`.

- `x^3 + 2y^3` is in `U_3`; `x^3 + y^3` is not (the substitution `y → y - x` gives `3x^2 y - 3 x y^2 + y^3`).

- The zero form is in no `U_p`.

<a id="nonmaximal-cubic-rings-have-small-overrings"></a>

**Nonmaximal cubic rings have small overrings.** If a cubic ring `R = R(f)` is not maximal at p, there is a basis `<1, ω, θ>` of R such that `ℤ + ℤ(ω/p) + ℤ θ` or `ℤ + ℤ(ω/p) + ℤ(θ/p)` is a ring. Equivalently, in terms of the form: either all coefficients of f are divisible by p, or some `GL2(ℤ)`-translate of f has `p^2 | a` and `p | b`.

p prime; R free of rank 3 over `ℤ`.

For the proof, Choose a finite overring R′ with nontrivial p-primary quotient over R by intersecting an overring with `R[1/p]`. Let `m ≥ 1` be the least integer with `p^m R′` contained in R. Then `S = R + p^(m−1)R′` is a ring, strictly contains R, and pS is contained in R. The ring property follows by expanding products; every cross term lies in `p^(m−1)R′`. The unit 1 is primitive in S because a finite ℤ-algebra has no nonintegral rational scalars. Smith normal form on `R/ℤ` inside `S/ℤ`, followed by normalization of the chosen basis, gives the shapes `(ω/p,θ)` and `(ω/p,θ/p)`. The multiplication table gives `p² | a` and `p | b` in the first shape, and `p | a`,b,c,d in the second. Their indices are p and `p²` respectively. This argument avoids the exponent-reduction iteration and any negative congruence exponents. When normalizing a Smith basis after the overring has been chosen, closure of the divided basis implies that each scalar translation of `alpha_i` used to impose the normal-basis convention is divisible by `p^{e_i}`. Thus the translation preserves the scaled overring lattice; arbitrary integral translations would not suffice.

*Needs:* [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring), [normal bases of a cubic ring](#normal-bases-of-a-cubic-ring), [delone faddeev parametrization of cubic rings](#delone-faddeev-parametrization-of-cubic-rings).

([[6]](#ref-6), Lemma 13 and proof, printed pp. 6-7.)

**Checks.**

- `R(x^3 + y^3)`: the translate `3x^2 y - 3xy^2 + y^3` has `p^2 | a = 0` and `3 | b`, so `ℤ[x]/(x^3+1)` is not maximal at 3.

<a id="davenport-heilbronn-maximality-criterion"></a>

**Davenport heilbronn maximality criterion.** For an integral binary cubic form f and a prime p, the cubic ring `R(f)` is maximal at p if and only if f is in `U_p`. Hence `R(f)` is maximal if and only if f is in `U_p` for every prime p. (The identification of the maximal cubic domains with the rings of integers of cubic fields is the integral-closure characterization of the ring of integers.)

p prime; f integral.

For the proof, If f is not in `U_p`: in case `(i) f = p g` and `R(f) = ℤ + p R(g)` is contained in `R(g)` with index `p^2` (content relation of cubic-ring-of-a-binary-cubic-form); in case `(ii)` the basis with `p^2 | a`, `p | b` makes `ℤ + ℤ(ω/p) + ℤ θ` a ring (congruences `(14)` with `(i,j) = (1,0)`). So `R(f)` is not maximal at p. If `R(f)` is not maximal at p then f is not in `U_p` (nonmaximal-cubic-rings-have-small-overrings). Maximality at all primes: the definition of IsMaximal.

*Needs:* [davenport heilbronn sets](#davenport-heilbronn-sets), [nonmaximal cubic rings have small overrings](#nonmaximal-cubic-rings-have-small-overrings), [cubic ring of a binary cubic form](../ArithmeticStatisticsPartI/README.md#cubic-ring-of-a-binary-cubic-form), [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring).

([[6]](#ref-6), Theorem 14, printed p. 7.)

**Checks.**

- `x^3 + 2y^3` is in `U_2` and `U_3`, and `ℤ[2^{1/3}]` is the ring of integers of `Q(2^{1/3})`.

- `x^3 + y^3` is not in `U_3` and `ℤ[x]/(x^3 + 1)` is not maximal at 3 (index 3 in `ℤ x ℤ[(1+sqrt(-3))/2]`).

<a id="index-p-subrings-of-a-cubic-ring"></a>

**Index p subrings of a cubic ring.** For an integral binary cubic form f and a prime p, the number of subrings of `R(f)` of index p equals the number `omega_p(f)` of zeros of f modulo p in `P^1(F_p)` (with the convention that `f = 0` mod p has `p + 1` zeros).

p prime.

For the proof, If S subset `R' = R(f')` has index p, then `S = ℤ +` pR' `+ ℤ θ` for `θ` well defined in `(R'/ℤ)/p`; extending to a normal basis `<1, ω, θ>` of R', `S = <1, p ω, θ>` is a ring iff `d' = 0` mod p, i.e. the image of `θ` is a zero of f' mod p. Then `f(x, y) = a' p^2 x^3 + b' p x^2 y + c' x y^2 + (d'/p) y^3` is the form of the basis `<1, p ω, θ>` (BST, proof of Propositions `15-16`).

*Needs:* [cubic ring of a binary cubic form](../ArithmeticStatisticsPartI/README.md#cubic-ring-of-a-binary-cubic-form), [normal bases of a cubic ring](#normal-bases-of-a-cubic-ring).

([[6]](#ref-6), Proposition 15, printed p. 7.)

**Checks.**

- `f = x²y − xy²` mod p has three distinct projective zeros. The three index-p subrings of `Z³` are {`(x_0,x_1,x_2)` : `x_i` ≡ `x_j` mod p}, one for each unordered pair {i,j}.

<a id="index-p-overrings-of-a-cubic-ring"></a>

**Index p overrings of a cubic ring.** For an integral binary cubic form f and a prime p, the number of cubic rings in `R(f)` tensor Q containing `R(f)` with index p equals the number of double zeros `α` in `P^1(F_p)` of f mod p such that `f(α') = 0` mod `p^2` for all lifts `α'` of `α`.

p prime.

For the proof, If R subset R' with index p, write `R = ℤ +` pR' `+ ℤ θ` and normalize; with f the form of the basis `<1, p ω, θ>` of R, the module spanned by 1, `ω`, `θ` is a ring iff `p^2 | a` and `p | b`, i.e. the image of `p ω` is a double zero with `f(p ω) = 0` mod `p^2` (BST, proof of Proposition 16). The form of R' is then `f' = (a/p^2) x^3 + (b/p) x^2 y + c x y^2 + d p y^3`.

*Needs:* [cubic ring of a binary cubic form](../ArithmeticStatisticsPartI/README.md#cubic-ring-of-a-binary-cubic-form), [normal bases of a cubic ring](#normal-bases-of-a-cubic-ring).

([[6]](#ref-6), Proposition 16, printed p. 7.)

**Checks.**

- `x^3 + y^3` mod 3 has the double zero `(1 : -1)` with `f(1, -1 + 3t) = 0` mod 9: `ℤ[x]/(x^3+1)` has exactly one overring of index 3.

### 1.3 Quartic rings and cubic resolvents

<a id="pairs-of-ternary-quadratic-forms"></a>

**Pairs of ternary quadratic forms.** For a commutative ring R, an (integer-valued) ternary quadratic form is `Q(x) = sum_{i<=j} a_ij x_i x_j` with `a_ij` in R (with Gram matrix having `a_ii` on the diagonal and `a_ij/2` off it when 2 is invertible), and `W(R) = (Sym² R³ ⊗ R²)*` is the module of pairs `(A, B)`. The group `GL3(R) x GL2(R)` acts by `(g_3, g_2) . (A, B) = (r A' + s B', t A' + u B')` with `A' = g_3 A g_3^T`, `B' = g_3 B g_3^T` and `g_2 = (r s; t u)`. Attached invariants: `4 Det(Q) = 4 a_11 a_22 a_33 + a_12 a_13 a_23 - a_11 a_23^2 - a_22 a_13^2 - a_33 a_12^2`; the cubic resolvent form `f_{(A,B)}(x, y) = 4 Det(A x - B y)`, a binary cubic form over R; the discriminant `Disc(A, B) = disc(f_{(A,B)})`; the fifteen `SL₂`-invariants `λ^{ij}_{kl} = a_ij b_kl - a_kl b_ij`; and, over `ℤ`, the content `ct(A, B) = gcd` of the `λ^{ij}_{kl}`. One has `f_{(g . (A,B))} = (det g_3)^2` (`f_{(A,B)}` composed with the substitution by `(r -s; -t u)`), hence `Disc(g . (A,B)) = (det g_3)^8 (det g_2)^6 Disc(A, B)`.

Integer-valued convention (Bhargava HCL III `(11)`, `(19)`): diagonal coefficients integral, off-diagonal Gram entries half-integral; `4 Det` has integer coefficients. Over a general coefficient ring, define `det4` by the displayed integral coefficient polynomial; neither half-Gram entries nor division by four is performed in R. Congruence acts by substitution on the polynomial coefficients, and specializes to Gram congruence when 2 is invertible. Sign convention pinned: the resolvent form is `4 Det(Ax − By)` (Bhargava-Shankar); HCL III writes `4 Det(Ax + By)`, which differs by `(x, y) ↦ (x, -y)` and is inconsistent with its own multiplication table. Over `ℤ`, `GL3(ℤ) = {±1} × SL3(ℤ)` and -1 acts trivially on pairs, so `GL3(ℤ) x GL2(ℤ)`-orbits are the `GL2(ℤ) x SL3(ℤ)`-orbits of Bhargava-Shankar.

The required API is:

- `TernaryQuadraticForm`: Integer-valued ternary quadratic forms, six coefficients.

- `TernaryQuadraticForm.eval`: `Q(t) = sum_{i<=j} a_ij t_i t_j`.

- `TernaryQuadraticForm.det4`: `4 Det Q`.

- `TernaryQuadraticForm.comp`: The form `t ↦ Q(M^T t)`, Gram matrix `M G M^T`.

- `TernaryQuadraticForm.lincomb`: `x A + y B`.

- `TernaryQuadraticForm.toQuadraticForm`: The Mathlib QuadraticForm `R (Fin 3 → R)` with the same values.

- `TernaryQuadraticForm.toQuadraticForm_apply`: toQuadraticForm `Q t = Q.eval t`.

- `TernaryQuadraticForm.det4_comp`: `4 Det (Q o M^T) = (det M)^2 4 Det Q`.

- `TernaryQuadraticPair`: Pairs `(A, B)`.

- `TernaryQuadraticPair.instMulAction`: The `GL3 x GL2` action of HCL III `(11)`.

- `TernaryQuadraticPair.resolventForm`: The binary cubic form `4 Det(Ax − By)`.

- `TernaryQuadraticPair.disc`: `Disc(A, B) = disc` of the resolvent form.

- `TernaryQuadraticPair.coeffA`: The symmetric coefficient `a_ij`.

- `TernaryQuadraticPair.coeffB`: The symmetric coefficient `b_ij`.

- `TernaryQuadraticPair.lam`: `λ^{ij}_{kl} = a_ij b_kl - a_kl b_ij`.

- `TernaryQuadraticPair.content`: Over `ℤ`: the gcd of the `λ^{ij}_{kl}`.

- `TernaryQuadraticPair.resolventForm_A_eq`: The `x³`-coefficient of the resolvent form is `4 Det A`.

- `TernaryQuadraticPair.disc_smul`: `Disc(g . (A,B)) = (det g_3)^8 (det g_2)^6 Disc(A,B)`.

- `TernaryQuadraticPair.lam_smul_SL2`: The `λ^{ij}_{kl}` are invariant under `SL2`.

- `TernaryQuadraticPair.lam_eq_zero_iff`: All `λ` vanish iff A, B span a space of dimension `≤ 1` (over Q).

For the proof, Define the six-coefficient ternary forms with evaluation, linear combination and composition `t ↦ Q(M^T t)` (coefficients by polarization at `e_i` and `e_i + e_j`); the pair action is then explicit; its axioms are polynomial identities. Transformation of `4 Det`: `Det(g A g^T) = det(g)^2 Det(A)`; for the `GL2` part, `4 Det((r A + s B) x - (t A + u B) y) = f(r x - t y, -s x + u y)` (expand). Disc: disc of a binary cubic form scales by `c^4` under multiplication by c and by `det(M)^6` under substitution by M.

*Needs:* [binary cubic forms and the twisted action](../ArithmeticStatisticsPartI/README.md#binary-cubic-forms-and-the-twisted-action), `QuadraticForm` (Mathlib), `LinearMap.BilinMap.toQuadraticMap` (Mathlib), `Matrix.GeneralLinearGroup` (Mathlib).

([[9]](#ref-9), Section 3.1, (11), printed pp. 1339-1340; [[9]](#ref-9), Section 3.1, printed p. 1340; [[9]](#ref-9), Section 3.2, (20), printed p. 1342.)

**Checks.**

- For `(x_1 x_3 - x_2^2, a x_1^2 + b x_1 x_2 + c x_2^2 + d x_2 x_3 + e x_3^2)` the resolvent form is `(1, c, bd - 4ae, a d^2 + b^2 e - 4ace)`.

- `4 Det(x_1^2 + x_2^2 + x_3^2) = 4` (not 1: the Gram matrix of an integer-valued form has half-integral off-diagonal entries and the factor 4 makes `Det` integral).

- The pair `(Q, Q)` has discriminant 0.

- For `A_1 = x_1 x_3 - x_2^2` and `B = a x_1^2 + b x_1 x_2 + c x_2^2 + d x_2 x_3 + e x_3^2` the resolvent form is `x^3 + c x^2 y + (bd - 4ae) x y^2 + (a d^2 + b^2 e - 4ace) y^3` (monic).

- `4 Det(x_1^2 + x_2^2 + x_3^2) = 4`.

- Proportional pairs `(Q, Q)` have all `λ = 0` and discriminant 0.

- Over `F₂`, `Q=xy+xz+yz` has det4`=1` by the integral polynomial. Its polar bilinear form has determinant zero in odd dimension. Defining det4 as that polar determinant would therefore fail.

<a id="quartic-ring-and-cubic-resolvent"></a>

**Quartic ring and cubic resolvent.** A quartic ring is a commutative ring free of rank 4 over `ℤ`. Following HCL III Definitions `19-20`, a cubic resolvent of a quartic ring Q is a cubic ring C together with an isomorphism `ξ : ∧³(Q/ℤ) → ∧²(C/ℤ)` and a quadratic map `φ` : `Q/ℤ → C/ℤ` such that `(29) ξ(x ^ y ^ xy) = φ(x) ^ φ(y)` for all x, y in Q, and `(34)` the binary cubic form that C corresponds to under Delone-Faddeev is `Disc(φ)` (this implies `ξ(x ^ x^2 ^ x^3) = φ(x) ^ φ(x)^2`, identity `(25)`; the converse requires that the image of `φ` span rank two and fails for degenerate rank-smaller images). In bases `<1, alpha_1, alpha_2, alpha_3>` of Q and `<1, omega_1, omega_2>` of C, with `φ(Σ_i t_i α_i) = B(t) ω₁ + A(t) ω₂` modulo `ℤ`, the data is a pair `(A, B)` in `W(ℤ)` and the conditions read: `det(1, x, y, xy) = B(x) A(y) - A(x) B(y)` for all x, y in Q (coordinates of x on `alpha_1`, `alpha_2`, `alpha_3`), and the index form of `<1, omega_1, omega_2>` is `−4 Det(Ax − By)` (in the orientation of index-form-of-a-based-cubic-ring). The content `ct(Q)` is the supremum in `ℕ ∪ {∞}` of positive integers n for which `Q = ℤ + n Q′` inside `Q ⊗ ℚ`, where Q′ is an overring free of rank four over `ℤ`. The trivial square-zero quartic ring has infinite content.

Base `ℤ` (the coordinate-free definition works over `ℤ_p` and `F_p` verbatim; HCL III, Appendix). The orientation `ξ` is part of the data; with the pinned orientation the sign in `(29)` is +. Degenerate quartic rings (discriminant 0) are included: the definition does not use `S₄`-closures. Retain the full discriminant/index-form condition `(34)`. Identity `(25)` alone does not specify the cubic ring when the image of `φ` has rank at most one (HCL III, p. 1351).

The required API is:

- `QuarticRing.coords`: Coordinates of x on `alpha_1`, `alpha_2`, `alpha_3`.

- `QuarticRing.IsResolventPair`: The based conditions `(12)` and the index-form identity for `(bQ, bC, (A,B))`.

- `QuarticRing.HasCubicResolvent`: C is a cubic resolvent of Q: some bases and pair satisfy IsResolventPair.

- `QuarticRing.ringContent`: The supremum in ENat of positive n such that the image of Q in its rational algebra equals `ℤ + n Q′` for a rank-four overring Q′. Overrings are essential: using a subring of Q would give 1 for every quartic ring.

- `QuarticRing.isResolventPair_smul`: Changing bases realizes every `(g_3, g_2)`-translate of the pair.

For the proof, State the based conditions (determinant identity `(12)` and the index-form identity) and the coordinate-free Definition 20; show that changing bases of `Q/ℤ` and `C/ℤ` by `(g_3, g_2)` replaces `(A, B)` by `(g_3, g_2) . (A, B)`, so the based notion descends to the coordinate-free one. The discriminant comparison is proved in [quartic ring of a pair](#quartic-ring-of-a-pair) after constructing its multiplication table. Content: define as the supremum; it is finite for nondegenerate rings and ∞ only for the trivial ring `ℤ + ℤ x_1 + ℤ x_2 + ℤ x_3` with all `x_i x_j = 0`.

*Needs:* [pairs of ternary quadratic forms](#pairs-of-ternary-quadratic-forms), [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring), [index form of a based cubic ring](#index-form-of-a-based-cubic-ring), [delone faddeev parametrization of cubic rings](#delone-faddeev-parametrization-of-cubic-rings), `Basis` (Mathlib).

([[9]](#ref-9), Section 3.9, Definitions 19-20, printed pp. 1351-1352; [[9]](#ref-9), Lemma 9 and (13), printed pp. 1340-1341; [[53]](#ref-53), Theorems 8.4 and 8.7.)

**Checks.**

- `ℤ^4` has the cubic resolvent `ℤ^3`.

- For a based cubic resolvent the index form is `−4 Det(Ax − By)` and differs from `+4 Det(Ax − By)` whenever the latter is nonzero.

- The content of `ℤ^4` is 1.

- For the trivial quartic ring `ℤ ⊕ ℤ³` with square-zero ideal and `φ = 0`, both `(29)` and `(25)` hold for every cubic ring C. Condition `(34)` instead forces the cubic index form to vanish, so `C = Z³` is excluded.

- `Q = {(x₀,x₁,x₂,x₃) ∈ ℤ⁴ : all coordinates agree modulo 2} = ℤ + 2ℤ⁴` has content 2. The overring `Z⁴` strictly contains Q.

- The trivial quartic ring `ℤ ⊕ ℤ³` with square-zero ideal has infinite content: each positive n occurs using the overring generated by `epsilon_i/n`.

- A based cubic resolvent has index form `−4 Det(Ax − By)`, never `+4 Det(Ax − By)` when the latter is nonzero.

- `ℤ^4` has content 1.

<a id="quartic-ring-of-a-pair"></a>

**Quartic ring of a pair.** For a pair `(A, B)` of ternary quadratic forms over a commutative ring R, `Q(A, B)` is the R-algebra with basis `<1, alpha_1, alpha_2, alpha_3>` and `alpha_i alpha_j = c^0_ij + sum_k c^k_ij alpha_k`, where for every permutation `(i, j, k)` of `(1, 2, 3)` with sign `ε`: `c^i_ii = ε λ^{ik}_{ij} + C_i`, `c^j_ii = ε λ^{ii}_{ik}`, `c^i_ij = ε (1/2) λ^{ik}_{jj} + (1/2) C_j`, `c^k_ij = ε λ^{jj}_{ii}`, with `C_1 = λ^{23}_{11}`, `C_2 = -λ^{13}_{22}`, `C_3 = λ^{12}_{33}`, and `c^0_ij = sum_r (c^r_jk c^k_ri - c^r_ij c^k_rk)` for any `k ≠ i`. All `c^k_ij` are integral polynomials in the coefficients (the halves cancel: `c^1_12 = c^2_12 = c^1_13 = 0`, `c^3_13 = λ^{23}_{11}`, `c^2_23 = λ^{12}_{33}`, `c^3_23 = -λ^{13}_{22}`); the basis is normal `(c^1_12 = c^2_12 = c^1_13 = 0)`. The cubic resolvent ring is `R(A, B) = R(−4 Det(Ax − By))` (Delone-Faddeev); with `φ(Σ_i t_i α_i) = B(t) ω₁ + A(t) ω₂` the triple is a based cubic resolvent, and `Disc Q(A,B) = Disc R(A,B) = Disc(A,B)`.

The index condition in the formula for `c^0_ij` is `k ≠ i`; HCL III prints `k ≠ j`, for which the expression depends on k and the table is not associative. The sign of the resolvent form: with the table above and HCL III's normal basis of the resolvent, identity `(25)` holds for `4 Det(Ax − By)`, not `4 Det(Ax + By)` as printed in `(26)`.

The required API is:

- `TernaryQuadraticPair.structConst`: The structure constants `c^k_ij` (`k = 0` the constant term).

- `TernaryQuadraticPair.quarticRingIdeal`: The ideal of relations in `R[X_1, X_2, X_3]`.

- `TernaryQuadraticPair.quarticRing`: `Q(A, B)` as a quotient ring.

- `TernaryQuadraticPair.quarticBasis`: The normal basis `<1, alpha_1, alpha_2, alpha_3>`.

- `TernaryQuadraticPair.quarticBasis_zero`: quarticBasis `0 = 1`.

- `TernaryQuadraticPair.mul_quarticBasis`: `alpha_i alpha_j = c^0_ij + sum_k c^k_ij alpha_k`.

- `TernaryQuadraticPair.structConst_normal`: `c^1_12 = c^2_12 = c^1_13 = 0`: the basis is normal.

- `TernaryQuadraticPair.discr_quarticBasis`: `Disc Q(A, B) = Disc(A, B)`.

- `TernaryQuadraticPair.cubicResolventRing`: `R(A, B) = R(−4 Det(Ax − By))`.

- `TernaryQuadraticPair.isResolventPair_quarticRing`: `(Q(A,B), R(A,B), (A,B))` is a based cubic resolvent.

- `QuarticRing.discr_eq_of_isResolventPair`: `Disc(bQ)=Disc(bC)=Disc(A,B)` for every based resolvent pair, by the uniquely forced multiplication table and cubic index form.

For the proof, The structure constants are forced by Lemma 9 (identity `(12)`) with `φ = (B, A)`: equating the coefficients of the degree-4 polynomials `p = q` in `r_1`, ..., `s_3` (HCL III `(17)-(18)`) gives the linear system with the unique solution `(21)-(22)`; associativity then forces `(23)`. Associativity of the resulting table, the independence of `c^0_ij` from `k ≠ i` and integrality are universal polynomial identities in `ℤ[a_ij, b_ij]`. `Disc Q(A,B) = Disc(A,B)`: explicit polynomial identity (HCL III Proposition 10), by universal expansion. For the generic nondegenerate pair, identity `(25)` gives the cubic index form `−4 Det`(`Ax −` By) in the pinned orientation. Verify that equality as an integral polynomial identity, so it also holds after specialization to degenerate pairs and arbitrary base rings. Together with identity `(29)`, this supplies the full discriminant/index-form condition `(34)`. Identity `(25)` alone does not determine a resolvent for a degenerate pair. Construct `Q(A,B)` as `R[X_1, X_2, X_3]` modulo the six relations `X_i X_j - c^0_ij - sum_k c^k_ij X_k`; freeness of rank 4 is the Groebner-basis argument as for cubic rings.

*Needs:* [pairs of ternary quadratic forms](#pairs-of-ternary-quadratic-forms), [quartic ring and cubic resolvent](#quartic-ring-and-cubic-resolvent), [cubic ring of a binary cubic form](../ArithmeticStatisticsPartI/README.md#cubic-ring-of-a-binary-cubic-form), [delone faddeev parametrization of cubic rings](#delone-faddeev-parametrization-of-cubic-rings), `MvPolynomial` (Mathlib), `Algebra.discr` (Mathlib).

([[9]](#ref-9), Section 3.2, (21)-(23), printed pp. 1342-1343; [[9]](#ref-9), Propositions 10-11, printed pp. 1343-1344.)

**Checks.**

- For the zero pair every structure constant is 0.

- For `(x_1 x_3 - x_2^2, x_1^2 + x_2 x_3)`, Algebra.discr of the normal basis of `Q(A,B)` equals `Disc(A,B)`.

- `c^1_11 = λ^{13}_{12} + λ^{23}_{11}`, a polynomial with integer coefficients (no division by 2).

- The zero pair gives the ring with all `alpha_i alpha_j = 0`.

- `Disc Q(A,B) = Disc(A,B)` for `(x_1 x_3 - x_2^2, x_1^2 + x_2 x_3)`.

- `c^1_11 = λ^{13}_{12} + λ^{23}_{11}`.

<a id="refinement-quartic-minors"></a>

**Quartic minors.** Write the coefficient rows of the pair of ternary integral quadratic forms in the order 11,12,13,22,23,33, using the integral polynomial coefficients, including cross terms without halving. Set `λ(i,j)=a_i b_j−a_j b_i`. The 15 entries with `i<j` give the oriented `SL₂`-invariant wedge of the two coefficient rows.

Base `ℤ` scalar extension to any commutative ring preserves the formulas.

The required API is:

- `ArithmeticOrbitRefinement.quarticMinors`: For `a 2×6` integral coefficient matrix M, return `λ(i,j)=M(0,i)M(1,j)−M(0,j)M(1,i)`.

- `ArithmeticOrbitRefinement.quarticMinors_swap`: Swapping i and j negates `λ(i,j)`.

- `ArithmeticOrbitRefinement.quarticMinors_plucker`: For `i<j<k<l`, `λ(i,k)λ(j,l)=λ(i,j)λ(k,l)+λ(i,l)λ(j,k)`.

- `ArithmeticOrbitRefinement.quarticMinors_mul`: For `h a 2×2` integer matrix, `quarticMinors(hM)=det(h)·quarticMinors(M)`. In particular determinant-one row operations preserve the fixed-label fibre.

For the proof, Expand the two-by-two determinants. Row operations of determinant one preserve them; expanding four columns gives `λ(i,k)λ(j,l)=λ(i,j)λ(k,l)+λ(i,l)λ(j,k)`. No symmetric-matrix denominators enter.

*Needs:* [pairs of ternary quadratic forms](#pairs-of-ternary-quadratic-forms), `Matrix.det` (Mathlib).

([[70]](#ref-70), §3.7, (20),(27), pp.1347–1348.)

**Checks.**

- For rows `(1,0,0,0,0,0)` and `(0,1,0,0,0,0)`, `λ(0,1)=1`.

- Interchanging those two rows gives `λ(0,1)=−1`.

- If the second row is an integer multiple of the first, all `λ(i,j)=0`.

<a id="refinement-integral-minor-fibres"></a>

**Integral minor fibres.** Every nonzero integral alternating `6×6` array satisfying the four-index Plücker equations is the minors array of an integral `2×6` matrix. If `d>0` is the gcd of its entries, its fibre modulo `SL₂(ℤ)`, with the six coefficients fixed, is in bijection with index-d sublattices of the saturated oriented rank-two coefficient lattice, and has `Σ_{a|d}a` elements. The zero array is excluded from this finite-count theorem. This is a based coefficient assertion, not a quotient by quartic-ring automorphisms.

At least one prescribed minor is nonzero. The six coefficient labels remain fixed; only the two rows change basis.

For the proof, Choose a nonzero minor to reconstruct the rational rank-two plane and use the Plücker equations to check its remaining coordinates. Saturate its intersection with `Z⁶`. The primitive minors specify an oriented basis of this lattice; minors scaled by d specify oriented sublattices of index d. Hermite normal forms count them by the divisor sum.

*Needs:* [quartic minors](#refinement-quartic-minors), `Basis` (Mathlib), `Submodule.span` (Mathlib), `Submodule.smithNormalForm` (Mathlib).

([[70]](#ref-70), Lemmas16–17 and their proofs, pp.1348–1349.)

**Checks.**

- For primitive minors the fibre is a single `SL₂(ℤ)`-orbit.

- For gcd 2 there are three oriented lattice classes.

- A zero minors array includes many dependent pairs; no finite divisor-sum formula is assigned to it.

<a id="bhargava-parametrization-of-quartic-rings"></a>

**Bhargava parametrization of quartic rings.** There is a canonical bijection between `GL3(ℤ) x GL2(ℤ)`-orbits on `W(ℤ) =` (Sym`^2 ℤ^3` tensor `ℤ^2`)* and isomorphism classes of pairs `(Q, R)` with Q a quartic ring and R a cubic resolvent ring of Q; it sends `(A, B)` to `(Q(A,B), R(A,B))` and a pair `(Q, R)` to the pair of ternary quadratic forms representing the resolvent map `φ` : `Q/ℤ → R/ℤ` in bases. It preserves discriminants: `Disc(A, B) = Disc(Q) = Disc(R)`. In based form: every pair `(A, B)` is the resolvent pair of a based quartic ring and cubic resolvent, unique up to isomorphisms preserving the chosen quotient bases modulo scalar translates, and changing the bases realizes exactly the `GL3(ℤ) x GL2(ℤ)`-orbit.

Base `ℤ` (the same proof works over `ℤ_p` and `F_p` with the appendix's definition). Cubic resolvents in the sense of quartic-ring-and-cubic-resolvent; degenerate pairs included. A cubic resolvent includes its quadratic map and orientation. Keeping only the isomorphism classes of the two underlying rings can identify different resolvent data. Based uniqueness refers to bases of `Q/ℤ` and `C/ℤ`; arbitrary lifts can differ by scalars, and exact equality of lifted bases requires normality.

For the proof, `(A,B) ↦ (Q(A,B), R(A,B))` is a based cubic resolvent (quartic-ring-of-a-pair). Conversely, for a based cubic resolvent the identity `(12)` determines the structure constants of the normal basis as in `(21)-(23)`, so Q is `Q(A,B)` (HCL III Proposition 10), and `(34)` determines R as `R(A,B)` by Delone-Faddeev (Proposition 11; in the degenerate case by the appendix's definition). The two constructions are mutually inverse on based objects; changing bases of `Q/ℤ` and `R/ℤ` by `(g_3, g_2)` acts on `(A,B)` by the action of pairs-of-ternary-quadratic-forms, so isomorphism classes correspond to orbits. Discriminants: quartic-ring-of-a-pair.

*Needs:* [quartic ring of a pair](#quartic-ring-of-a-pair), [quartic ring and cubic resolvent](#quartic-ring-and-cubic-resolvent), [pairs of ternary quadratic forms](#pairs-of-ternary-quadratic-forms), [delone faddeev parametrization of cubic rings](#delone-faddeev-parametrization-of-cubic-rings).

([[9]](#ref-9), Theorem 1, printed p. 1330; [[9]](#ref-9), Proposition 13, printed p. 1345.)

**Checks.**

- `ℤ^4` corresponds to the orbit of a pair of conics through four points of `P^2(Q)` in general position, with `R = ℤ^3`.

- The trivial ring `ℤ + ℤ x_1 + ℤ x_2 + ℤ x_3` (all products 0) corresponds to the pairs spanning a space of dimension `≤ 1`.

- The zero pair gives the square-zero quartic and cubic rings with the zero quadratic map; the all-discriminant parametrization retains this pair.

<a id="refinement-quartic-invariant-index"></a>

**Quartic invariant index.** For an integral quartic order Q of nonzero discriminant with cubic resolvent R, the subring generated by the scalar element and the quadratic resolvent map image is the cubic invariant order `R_inv(Q)`, independent of the choice of R inside the rational resolvent algebra. Its index in R equals the content of Q. Thus `R_inv(Q)=R` exactly when Q has content one. For `Q=ℤ+`nQ′ with primitive Q′, the invariant order is `ℤ+n²R_inv(Q′)`.

Use the based quadratic resolvent map and scalar-compatible orientation. Content is the maximal positive integer n with `Q=ℤ+`nQ′. Nonzero discriminant ensures finite positive content and a full-rank invariant order; the infinite-content boundary is a separate obligation.

For the proof, construct the rational cubic invariant algebra from the three pairings of four embeddings as in [70], §2.3, (8)–(9), pp.1337–1339. The conjugate formula for the quadratic map places its scalar-and-image span in this fixed algebra, independently of a resolvent choice; verify multiplication closure there. The gcd of coefficient minors equals content. In the primitive case the six coefficient columns generate the entire rank-two quotient of R, so the map image generates R. For content n, use the integral minor fibre to realize the primitive array `λ/n`; the multiplication table constructs the associated primitive quartic overorder Q′ and its cubic resolvent R′ without the general existence theorem. The quadratic map scales by `n²`. The invariant-order index in the primitive resolvent is `n⁴` and the given resolvent index is `n³`; divide to obtain n.

*Needs:* [quartic ring and cubic resolvent](#quartic-ring-and-cubic-resolvent), [bhargava parametrization of quartic rings](#bhargava-parametrization-of-quartic-rings), [integral minor fibres](#refinement-integral-minor-fibres).

([[70]](#ref-70), Corollary18 and proof, §3.8, p.1350.)

**Checks.**

- For primitive Q and any specified cubic resolvent R, its invariant order equals R.

- Scaling a primitive quartic order by n scales the rank-two invariant quotient by `n²`, not n.

- The square-zero quartic ring has zero discriminant and infinite content. It is outside this invariant-order construction and its finite index formula.

<a id="existence-and-number-of-cubic-resolvents"></a>

**Existence and number of cubic resolvents.`** (a)` Every quartic ring Q has at least one cubic resolvent ring. `(b)` The number of cubic resolvent rings of Q (with Q fixed: isomorphisms of resolvent data must induce the identity on Q) depends only on the content `n = ct(Q)` and equals `σ(n) = sum_{d | n} d`, the number of index-n sublattices of `ℤ^2`. `(c)` In particular a primitive quartic ring (content 1), hence every maximal quartic ring and every ring of integers of a quartic field, has a unique cubic resolvent ring up to isomorphism, and, when `Disc(Q)≠0`, it is the cubic invariant ring `R_inv(Q)`. `(d)` Two pairs give the same quartic ring iff they are related by `GL3(ℤ) x GL2^`{±1}`(Q)`.

Q nontrivial for `(b)-(d)` (the trivial ring has infinite content). Maximal quartic rings of nonzero discriminant are Gorenstein and have content 1. The count `σ(n)` retains the fixed quartic ring Q. Quotienting also by `Aut(Q)`, as in the unbased `GL3 x GL2` orbit classification, can identify these resolvent structures and changes the count.

For the proof, The structure constants of a normal basis of Q determine the fifteen `λ^{ij}_{kl}` by `(21)`, and associativity gives the Pluecker syzygies `(27)` (HCL III Section 3.8). Lemma 16: fifteen constants satisfying `(27)`, not all zero, are the λ-invariants of a unique `SL2(C)`-orbit, which contains an integral point when the constants are integers (elementary divisors). With a fixed normal basis of Q, the fifteen λ-invariants are fixed. Their nonzero gcd n specifies an orientation of the pencil. The relevant `SL2(ℤ)`-orbits, not full `GL3(ℤ) x GL2(ℤ)`-orbits, correspond to index-n sublattices in the maximal integral pencil lattice, with the induced orientation. Hermite normal form counts these as `Σ_(d|n) d`. Arbitrarily oriented bases would produce both `λ` and `−λ`, so the orientation is retained throughout. Apply the based parametrization and then forget the chosen basis of the fixed ring Q, transporting it by the identity of Q. This counts resolvent structures over Q without quotienting by its automorphisms. The gcd of `λ` is `ct(Q)` by `(21)`–`(23)`. Maximal rings: a ring `ℤ +` nQ' with `n > 1` is not maximal (contained in Q'), so maximal rings are primitive.

*Needs:* [integral minor fibres](#refinement-integral-minor-fibres); [quartic invariant index](#refinement-quartic-invariant-index) only for the nonzero-discriminant identification; [bhargava parametrization of quartic rings](#bhargava-parametrization-of-quartic-rings), [quartic ring of a pair](#quartic-ring-of-a-pair), [pairs of ternary quadratic forms](#pairs-of-ternary-quadratic-forms), [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring).

([[9]](#ref-9), Corollaries 4-5, printed p. 1333; [[9]](#ref-9), Lemma 17, printed p. 1349; [[53]](#ref-53), Corollary 8.5 and Example 8.10.)

**Checks.**

- A maximal quartic order has exactly one resolvent.

- `ℤ + 2 ℤ^4` (content 2) has `σ(2) = 3` cubic resolvents.

- A primitive ring of discriminant zero still has a unique resolvent; the identification with the rational invariant order is asserted only when the discriminant is nonzero.

<a id="maximality-of-quartic-rings-at-p"></a>

**Maximality of quartic rings at p.** If a quartic ring Q is not maximal at p, there is a `ℤ`-basis `<1, alpha_1, alpha_2, alpha_3>` of Q such that `ℤ + ℤ(alpha_1/p) + ℤ alpha_2 + ℤ alpha_3`, or `ℤ + ℤ(alpha_1/p) + ℤ(alpha_2/p) + ℤ alpha_3`, or `ℤ + ℤ(alpha_1/p) + ℤ(alpha_2/p) + ℤ(alpha_3/p)` is a ring. For `Q = Q(A, B)` these read, after `a GL3(ℤ) x GL2(ℤ)`-change of the pair: `(i) λ^{11}_{22}`, `λ^{11}_{23}`, `λ^{11}_{33}`, `λ^{12}_{13} = 0` mod p and `λ^{11}_{12}`, `λ^{11}_{13} = 0` mod `p^2`; `(ii) λ^{11}_{13}`, `λ^{11}_{23}`, `λ^{12}_{13}`, `λ^{12}_{23}`, `λ^{13}_{22}`, `λ^{22}_{23} = 0` mod p and `λ^{11}_{12}`, `λ^{11}_{22}`, `λ^{12}_{22} = 0` mod `p^2`; (iii) all `λ = 0` mod p. `Q(A, B)` is maximal at p iff `(A, B)` is in the set `U_p` of pairs for which none of `(i)`-(iii) can be achieved; the `U_p` are defined by congruence conditions modulo `p^2`.

p prime; quartic rings of nonzero discriminant for the geometric reading of `(i)`, `(ii)` (double intersection points, double lines) in HCL III Section 4.2.

For the proof, Choose a finite p-primary overring Q′ and let `m ≥ 1` be minimal with `p^m Q′` contained in Q. Then `S = Q + p^(m−1)Q′` is a proper overring and pS is contained in Q (expand products to see that S is a ring). Since 1 is primitive in these finite ℤ-algebras, Smith normal form on `Q/ℤ` inside `S/ℤ` gives a basis containing 1 and the three displayed possibilities. This direct construction replaces the incomplete exponent-reduction iteration in the printed proof of HCL III Lemma 22. Translate the three shapes into congruences on the `λ` through the explicit `c^k_ij` (quartic-ring-of-a-pair). Conversely each of `(i)`-(iii) exhibits the overring, so `Q(A,B)` is not maximal. When normalizing a Smith basis after the overring has been chosen, closure of the divided basis implies that each scalar translation of `alpha_i` used to impose the normal-basis convention is divisible by `p^{e_i}`. Thus the translation preserves the scaled overring lattice; arbitrary integral translations would not suffice.

*Needs:* [full-lattice order comparison](#full-lattice-order-comparison); [quartic ring of a pair](#quartic-ring-of-a-pair), [pairs of ternary quadratic forms](#pairs-of-ternary-quadratic-forms), [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring).

([[9]](#ref-9), Lemma 22, printed p. 1356; [[9]](#ref-9), Section 4.2, printed p. 1357.)

**Checks.**

- A pair with `p |` all coefficients gives a nonmaximal Q (case (iii)).

- Pairs with `Disc(A,B)` not divisible by `p^2` give Q maximal at p.

- The square-zero quartic ring has a proper finite overring obtained by dividing one nilpotent basis vector by p. The localization maximality predicate detects it without a number-field carrier.

<a id="splitting-types-of-pairs-of-ternary-quadratic-forms"></a>

**Splitting types of pairs of ternary quadratic forms.** For a pair `(A, B)` over `ℤ` (or `ℤ_p`, `F_p`) whose conics `A = 0`, `B = 0` meet in four points of `P^2` over `𝔽̄_p` counted with multiplicity, let `((A,B), p) = (f_1^{e_1} f_2^{e_2} ...)` record the residue degrees and multiplicities of the intersection points. Then `(A,B)` is in `T_p(σ)` iff `Q(A,B)/(p) = F_{p^{f_1}}[t_1]/(t_1^{e_1}) + ...`, except for `σ = (1^4)`, where `Q(A,B)/p` may also be `F_2[x,y]/(x^2, xy + y^2)`, `F_p[x,y]/(x^2, y^2)` or `F_p[x,y]/(xy, x² + νy²)` for odd p, where `ν∈F_p×` is a fixed quadratic nonresidue. At p=2 use the separately displayed `F₂`-algebra and `F₂[x,y]/(x²,y²)`. In particular `Disc(A,B)` is nonzero mod p iff the conics meet in four distinct points iff `Q(A,B)/p` is etale over `F_p`; for maximal `Q(A,B)`, `((A,B), p)` is the splitting type of p.

p prime; the two conics have no common component, so their intersection is zero-dimensional of length four. This allows discriminant-zero and nonreduced intersections; it does not require four distinct geometric points.

For the proof, The ring `Q(A,B)/p` depends only on the `GL3(F_p) x GL2(F_p)`-orbit of `(A,B)` mod p (base change of quartic-ring-of-a-pair). Write the multiplication table at one representative of each of the eleven orbit types (HCL III Section 4.1, 'direct calculation'). Nonzero discriminant mod p: four distinct intersection points, and `Disc(Q/p) = Disc(A,B)` mod p is nonzero, so `Q/p` is etale.

*Needs:* [quartic ring of a pair](#quartic-ring-of-a-pair), [nondegenerate forms and etale cubic algebras](#nondegenerate-forms-and-etale-cubic-algebras), `Algebra.Etale` (Mathlib).

([[9]](#ref-9), Section 4.1, (36)-(37), printed p. 1353.)

**Checks.**

- Four `𝔽_p`-rational points in general position give `F_p^4`.

- A double line in the pencil gives one of the non-reduced types (over-ramified cases).

- For odd p and nonzero ν, the exceptional quotient has basis `1,x,y,y²`; setting ν=0 instead leaves every power of y and gives an infinite-dimensional algebra.

### 1.4 Quintic rings and alternating tensors

<a id="quadruples-of-quinary-alternating-forms"></a>

**Quadruples of quinary alternating forms.** For a commutative ring R, `V(R) = R⁴ ⊗ ∧² R⁵` is the module of quadruples `A = (A_1, ..., A_4)` of alternating 5 x 5 matrices over R (recorded by their entries above the diagonal). The group `GL4(R) x SL5(R)` acts by `(g_4, g_5) . A = (Σ_s (g_4)_{rs} g_5 A_s g_5^T)_r`. The 4 x 4 sub-Pfaffian map `Q(X) = (Q_1(X), ..., Q_5(X))`, `Q_i(X) = (-1)^{i-1} Pf`(X with row and column i deleted), is a quadratic covariant: `X Q(X) = 0` for every alternating X, and `Q(cX) = c^2 Q(X)`. The `SL5`-invariants `{ijklm} = Q(A_i, A_j)^T A_k Q(A_l, A_m)` (Q(.,.) the symmetric bilinear form with `Q(X,X) = 2Q(X)`) determine the multiplication table of the quintic ring `R(A)`; the fundamental relative invariant is the degree-40 discriminant `Disc(A)`, with `Disc((g_4,g_5) . A) = det(g_4)^10 Disc(A)`. Thus it is invariant under `GL4(ℤ) x SL5(ℤ)`, but is generally only a relative invariant over other base rings. The same matrix formula extends to `GL4(R) x GL5(R)`, with relative discriminant weight `det(g_4)^10 det(g_5)^16`. Over `ℤ` this has the same orbits as `GL4(ℤ) x SL5(ℤ)`, since replacing a determinant-minus-one `g_5` by `−g_5` leaves its congruence action unchanged. Over a field the full rational orbit for minimality uses this extended group.

The discriminant is not written out as a polynomial (degree 40); it is characterized in HCL IV Section 3 and equals `Disc R(A)`. The displayed `GL4 x SL5` action can have a nontrivial kernel away from `ℤ`: `(ζ^(-2) I_4, ζ I_5)` acts trivially whenever `ζ^5 = 1`. Do not identify its stabilizers or rational orbits with those of the effective quotient without accounting for this kernel and descent.

The required API is:

- `QuinaryAlternatingQuadruple`: Quadruples of alternating 5 x 5 matrices by upper-triangular entries.

- `QuinaryAlternatingQuadruple.toMatrix`: The r-th alternating matrix.

- `QuinaryAlternatingQuadruple.ofMatrices`: The quadruple with given matrices (upper triangle).

- `QuinaryAlternatingQuadruple.instMulAction`: The `GL4 x SL5` action.

- `QuinaryAlternatingQuadruple.subPfaffian`: The signed 4 x 4 sub-Pfaffians.

- `QuinaryAlternatingQuadruple.toMatrix_transpose`: Each matrix is alternating: `A_r^T = -A_r`.

- `QuinaryAlternatingQuadruple.subPfaffian_smul_scalar`: `Q(cX) = c^2 Q(X)`.

- `QuinaryAlternatingQuadruple.mulVec_subPfaffian`: `X Q(X) = 0`.

For the proof, Define the entries, the matrices, the action and the sub-Pfaffians explicitly; the action axioms are matrix identities. `X Q(X) = 0`: the Pfaffian expansion of the 6 x 6 alternating matrix with a repeated row (by expansion with the sign convention `(-1)^{i-1}`). The invariants `P^+` and `P⁻` of HCL `IV (11)-(14)` and the brackets `{ijklm}` `(18)` are polynomial `SL₅`-invariants of degree 5.

*Needs:* `Matrix.SpecialLinearGroup` (Mathlib), `Matrix.GeneralLinearGroup` (Mathlib).

([[10]](#ref-10), Theorem 1 and Section 4, printed pp. 54 and 66; [[10]](#ref-10), (18), printed p. 67.)

**Checks.**

- The diagonal entries of toMatrix are 0.

- ofMatrices (toMatrix A) `= A`.

- For the alternating matrix with `x_12 = x_34 = 1` (0-indexed `(1,2)`, `(3,4)`) the sub-Pfaffian vector is `(1, 0, 0, 0, 0)`.

- For the matrix with `x_12 = x_34 = 1` (0-indexed entries `(1,2)`, `(3,4)`) the sub-Pfaffian vector is `(1, 0, 0, 0, 0)`.

- The diagonal of each `A_r` is zero.

- Over `F₂` the alternating matrix with entries `(0,1)=(1,0)=1` and all others zero is nonzero and has zero diagonal. A definition using only skew symmetry would also admit the identity matrix, which is not alternating.

- For the preceding integer matrix with sub-Pfaffian vector `(1,0,0,0,0)`, scaling by 2 gives vector `(4,0,0,0,0)`, not `(2,0,0,0,0)`.



### 1.5 Quartic covariants and rational orbits

<a id="pgl2-orbits-and-stabilizers-of-binary-quartic-forms"></a>

**Pgl2 orbits and stabilizers of binary quartic forms.** Let R be a commutative ring and `V(R)` the binary quartic forms over R (ArithmeticStatisticsPartI Layer 0), with the twisted action `γ * f = (det γ)^{-2} f((x,y) γ)` of `GL2(R)` (ArithmeticStatisticsPartI Layer 0), on which the centre acts trivially. It therefore induces an action of `PGL2(R) = GL2(R)/`centre (Mathlib's Matrix.ProjGenLinGroup). The invariants I and J are `PGL2(R)`-invariant, so the orbit space `PGL2(R)\V(R)` maps to R x R; its fibre over `(I, J)` is the set of orbits of forms with invariants I, J. The stabilizer of f is `Stab_{PGL2(R)}(f)`. Over `ℤ` (and any ring whose units have square 1) the PGL2-orbits are the orbits of `GL2` under plain substitution.

The twist exponent is -2, so that I and J are invariant (ArithmeticStatisticsPartI Layer 0 records the untwisted weights `(det γ)^4`, `(det γ)^6`). `PGL2` here means Mathlib’s quotient by the full centre of `GL2(R)`. Agreement with the R-points of the projective general linear group scheme is used only over fields, PIDs or local rings, where `Pic(R)=0`; over a general ring these two meanings need not agree. This convention does not identify the points of the central `SL_n/μ₂` quotient with a naive pointwise quotient.

The required API is:

- `BinaryQuartic.instPGLAction`: The `PGL2(R)`-action induced by the twisted action.

- `mk γ . f =` twistedSMul `γ f`.

- I is PGL2-invariant.

- J is PGL2-invariant.

- `BinaryQuartic.PGLOrbit`: The orbit space `PGL2(R)\V(R)`.

- `BinaryQuartic.PGLOrbit.invariants`: The invariants `(I, J)` of an orbit.

- Over `ℤ`, PGL2-orbits are `GL2(ℤ)`-orbits under plain substitution.

For the proof, Define the action through a set-theoretic section of `GL2(R) → PGL2(R)`; well-definedness is ArithmeticStatisticsPartI Layer 0’s `twistedSMul_scalar` (scalars act trivially); the action axioms follow from `twistedSMul_mul`. Invariance of I and J: the twisted action multiplies I by `(det γ)^4 (det γ)^{-4}` (ArithmeticStatisticsPartI Layer 0 relative invariance). Over `ℤ`: `det γ =` ±1 so the twist is trivial and the orbits agree with those of the plain action.

*Needs:* [binary quartic form](../ArithmeticStatisticsPartI/README.md#binary-quartic-form), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), [relative invariance of i and j](../ArithmeticStatisticsPartI/README.md#relative-invariance-of-i-and-j), `Matrix.ProjGenLinGroup` (Mathlib), `Matrix.ProjGenLinGroup.mk_surjective` (Mathlib), `Matrix.GeneralLinearGroup.center_eq_range_scalar` (Mathlib), `MulAction.stabilizer` (Mathlib), `MulAction.orbitRel` (Mathlib).

([[1]](#ref-1), Section 2.6, (32), printed p. 16; [[1]](#ref-1), Section 2.6, printed p. 16.)

**Checks.**

- The class of a scalar matrix acts trivially.

- `diag(2, 1)` sends `(a,b,c,d,e)` to `(4a, 2b, c, d/2, e/4)`.

- `x^3 y - y^4` is not `PGL2(Q)`-equivalent to its negative (J changes sign), although both have the same I.

- Scalars act trivially.

- `diag(2, 1)` in `PGL2(Q)` sends `(a, b, c, d, e)` to `(4a, 2b, c, d/2, e/4)`.

- `x^3 y - y^4 (J = 27)` and its negative `(J = -27)` lie in different orbits.

<a id="soluble-binary-quartic-forms"></a>

**Soluble binary quartic forms.** A binary quartic form f over a field K is K-soluble if `z^2 = f(x, y)` has a solution with x, y, z in K and `(x, y) ≠ (0, 0)`. Over a number field K, f is (everywhere) locally soluble if f is `K_v`-soluble for every completion `K_v`: at every finite place (Mathlib's adicCompletion at each height-one prime of `O_K`) and at every infinite place (Mathlib's InfinitePlace.Completion). Over Q this means `ℝ`-soluble and `ℚ_p`-soluble for every prime p; an integral form is locally soluble if its rational form is. The rational-linear-factor locus consists of forms with a zero in `P^1(Q)`; this is only part of the polynomial-reducible locus, which also includes products of two quadratic factors. Ordinary irreducible forms have `a ≠ 0` and `f(X, 1)` irreducible over Q. Solubility is invariant under `PGL2(K)`, stable under field extension, and holds whenever f has a zero in `P^1(K)` or its leading coefficient is a square.

`(x, y) ≠ (0, 0)` is required; z may be 0. When `char K ≠ 2`, for forms of nonzero discriminant, K-solubility is equivalent to the genus-one curve `z^2 = f(x, y)` having a K-point, but the definition does not refer to curves.

The required API is:

- `BinaryQuartic.IsSoluble`: K-solubility.

- `BinaryQuartic.IsEverywhereLocallySoluble`: Solubility over every completion of a number field.

- `BinaryQuartic.IsLocallySolubleQ`: A rational form: `ℝ`-soluble and `ℚ_p`-soluble for all p.

- `BinaryQuartic.IsLocallySoluble`: An integral form is locally soluble: its rational form is IsLocallySolubleQ.

- `BinaryQuartic.HasRationalLinearFactor`: An integral form has a zero in `P¹(Q)`, the rational-linear-factor locus corresponding to the identity Selmer class. It is not the whole polynomial-reducible locus.

- `BinaryQuartic.IsIrreducibleOverQ`: An integral form is irreducible over Q (`a ≠ 0` and `f(X,1)` irreducible).

- An integral form is locally soluble iff it is `ℝ`-soluble and `ℚ_p`-soluble for every prime p.

- Solubility is `PGL2(K)`-invariant.

- `BinaryQuartic.IsSoluble.map`: Solubility is preserved by field homomorphisms.

- A zero in `P^1(K)` gives solubility.

- A square leading coefficient gives solubility.

- Unfolding of local solubility over Q.

For the proof, PGL2-invariance: if `f(x,y) = z²`, then its twisted transform has the solution (`(x,y) γ` inverse, `z/(det γ)`). The inverse transformation proves the converse. Base change: a solution over K maps to one over L. Zeros of f give solutions with `z = 0`; `f(1, 0) = a` a square gives (1, 0, sqrt a).

*Needs:* [binary quartic form](../ArithmeticStatisticsPartI/README.md#binary-quartic-form), `IsDedekindDomain.HeightOneSpectrum.adicCompletion` (Mathlib), `NumberField.InfinitePlace.Completion` (Mathlib), `NumberField.InfinitePlace` (Mathlib), `Padic` (Mathlib).

([[1]](#ref-1), Section 3.1, printed p. 23.)

**Checks.**

- `−x⁴ − y⁴` is not `ℝ`-soluble.

- `x^3 y + y^4` is Q-soluble (zero at `(1, 0)`).

- `2x^4 - 34y^4` (Lind-Reichardt) is locally soluble over Q but not Q-soluble.

- `x^3 y + y^4` has the rational linear factor y and is locally soluble.

- `(x²+y²)(x²+2y²) = x⁴+3x²y²+2y⁴` is reducible over Q but has no rational projective zero.

- `x^3 y + y^4` is Q-soluble.

- Lind's quartic `2x^4 - 34y^4` is locally soluble over Q but not Q-soluble.

<a id="covariants-of-a-binary-quartic"></a>

**Covariants of a binary quartic.** For `g = (a, b, c, d, e)`, the quartic covariant is `g_4 = (3b^2 - 8ac) X^4 + 4(bc - 6ad) X^3 Y + 2(2c^2 - 24ae - 3bd) X^2 Y^2 + 4(cd - 6be) X Y^3 + (3d^2 - 8ce) Y^4` (`= -(1/3)` times the Hessian determinant of g where 3 is invertible), and the sextic covariant is `g_6 = (b^3 + 8a^2 d - 4abc) X^6 + 2(16a^2 e + 2abd - 4ac^2 + b^2 c) X^5 Y + 5(8abe + b^2 d - 4acd) X^4 Y^2 + 20(b^2 e - ad^2) X^3 Y^3 - 5(8ade + bd^2 - 4bce) X^2 Y^4 - 2(16ae^2 + 2bde - 4c^2 e + cd^2) X Y^5 - (d^3 + 8be^2 - 4cde) Y^6`. Under the twisted action they transform as `g_4(γ * g) = γ * g_4(g)` (weight -2 twist, like g) and `g_6(γ * g)(x,y) = (det γ)^{-3} g_6(g)((x,y) γ)`.

Cremona-Fisher normalization; the seminvariants are `p = 3b^2 - 8ac = g_4(1,0)`, `r = b^3 + 8a^2 d - 4abc = g_6(1,0)`.

The required API is:

- `BinaryQuartic.hessian`: The quartic covariant `g_4`.

- `BinaryQuartic.sexticCoeff`: The seven coefficients of `g_6`.

- `BinaryQuartic.sextic`: Evaluation of `g_6`.

- `g_4` is equivariant for the twisted action.

- `g_6` transforms with the factor `(det γ)^{-3}`.

- `g_4 = -(1/3)(F_xx F_yy - F_xy^2)`.

For the proof, Define by the explicit coefficients. Equivariance: Cremona-Fisher Lemma 5 (a proper equivalence `(M, λ)` sends `g_4` to `λ^2 g_4^M` and `g_6` to `λ^3 μ^3 g_6^M`); a polynomial identity. The Hessian relation: expand `F_xx F_yy - F_xy^2`.

*Needs:* [binary quartic form](../ArithmeticStatisticsPartI/README.md#binary-quartic-form), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants).

([[11]](#ref-11), Section 1, printed p. 2.)

**Checks.**

- `g_4(x^3 y) = 3x^4`.

- `g_6(x^3 y) = x^6`.

- At the root `(1, 1)` of `x^4 - y^4` the Hessian covariant is `48 ≠ 0`.

- `g_4(x^3 y) = 3x^4` and `g_6(x^3 y) = x^6`.

- `g_4(x^4 - y^4)(1, 1) = 48`.

<a id="syzygy-of-binary-quartic-covariants"></a>

**Syzygy of binary quartic covariants.** For every binary quartic g over a commutative ring, `27 g_6(x,y)^2 = g_4(x,y)^3 - 48 I(g) g(x,y)^2 g_4(x,y) - 64 J(g) g(x,y)^3`.

Polynomial identity in `ℤ[a, b, c, d, e, x, y]`.

For the proof, Expand both sides as an integral polynomial identity (Cremona-Fisher Section 1).

*Needs:* [covariants of a binary quartic](#covariants-of-a-binary-quartic), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants).

([[11]](#ref-11), Section 1, printed p. 2.)

**Checks.**

- At `(1, 0)`: `27 r^2 = p^3 - 48 I a^2 p - 64 J a^3` (the seminvariant syzygy).

<a id="cubic-invariant-of-a-binary-quartic"></a>

**Cubic invariant of a binary quartic.** Let K be a field of characteristic not 2 or 3 and I, J in K with `4I^3 - J^2 ≠ 0`. Let `E_{I,J}` : `y^2 = x^3 - 27 I x - 27 J` (a short Weierstrass curve, the Jacobian of `z^2 = g(x,y)`) and `A_{I,J} = K[T]/(T^3 - 27 I T - 27 J)`, which is Tau Ceti's W.A for `W = E_{I,J}`; `M_{I,J} = A^x/(A^x)^2` is W.M. For a binary quartic g with invariants I, J put `φ = -T/3` (a root of `X^3 - 3IX + J`) and `G(x, y) = (4 φ g(x,y) + g_4(x,y))/3` in `A_{I,J}`. Then `N(G(x, y)) = g_6(x, y)^2`; `G(x, y)` is a unit iff `g_6(x, y) ≠ 0`; and the class `z(g) = [G(x, y)]` in `M_{I,J}` does not depend on the choice of `(x, y)` with `g_6(x, y) ≠ 0` (such a point exists when K is not `F_5`). z commutes with base change along field homomorphisms (the restriction of square classes, Tau Ceti's localRes).

char K not 2, 3; `#K ≠ 5` for the existence of a point with `g_6 ≠ 0` (`P^1(F_5)` has 6 points and `g_6` has degree 6). The curve is `E_{I,J}` : `y^2 = x^3 - 27 I x - 27 J`, isomorphic to Bhargava-Shankar's `y^2 = x^3 - (I/3) x - J/27` by `(x, y) ↦ (x/9, y/27)`.

The required API is:

- `BinaryQuartic.curveIJ`: The curve `y^2 = x^3 - 27 I x - 27 J`.

- `BinaryQuartic.etaleAlgebra`: Abbreviation of the imported (curveIJ I J).toAffine.A, the cubic étale algebra.

- `BinaryQuartic.squareClasses`: Abbreviation of the imported (curveIJ I J).toAffine.M, the square classes of units in the cubic algebra.

- `BinaryQuartic.curvePoly`: The cubic `T^3 - 27 I T - 27 J`.

- `BinaryQuartic.restrictSquareClasses`: The native localRes for the Algebra induced by the field map, transported along the base-change identification of the curve; no copied descent quotient.

- `BinaryQuartic.irrationalCovariant`: `G(x, y) = (4 φ g(x,y) + g_4(x,y))/3` with `φ = -T/3`.

- `BinaryQuartic.cubicInvariant`: `z(g)`, the class of G at an admissible point.

- `z(g)` is the class of `G(x,y)` for every admissible `(x,y)`.

- `G(x,y)` is a unit when `g_6(x,y) ≠ 0`.

- `N(G(x,y)) = g_6(x,y)^2`.

- An admissible point exists when `#K ≠ 5` and `Δ ≠ 0`.

- The invariant z commutes with restriction along field homomorphisms.

For the proof, `N(G) = g_6^2`: the norm of a linear element `u + v φ` is `u^3 - 3 I u v^2 - J v^3`; substituting and using the syzygy gives `g_6^2` (the polynomial identity `Res(3G, X^3 - 3IX + J) = 27 g_6^2`). Independence: Cremona-Fisher Lemma 1, `G(x_1, y_1) G(x_2, y_2) = F(x_1, y_1, x_2, y_2)^2` with F in `A[x_1, y_1, x_2, y_2]` explicit; hence the classes at two admissible points agree. Existence of an admissible point for `#K ≠ 5`: `g_6` has at most 6 zeros in `P^1(K)` (it is nonzero when the discriminant is nonzero: `Res(g, g_6) = Δ^3` in the ordinary binary-discriminant normalization). Base change: the formula is polynomial in the coefficients.

*Needs:* [covariants of a binary quartic](#covariants-of-a-binary-quartic), [syzygy of binary quartic covariants](#syzygy-of-binary-quartic-covariants), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), `AdjoinRoot` (Mathlib), `powMonoidHom` (Mathlib), `Algebra.norm` (Mathlib), `AdjoinRoot.map` (Mathlib), `WeierstrassCurve.Affine.A` (Tau Ceti), `WeierstrassCurve.Affine.M` (Tau Ceti), `WeierstrassCurve.Affine.localRes` (Tau Ceti).

([[11]](#ref-11), Section 2, Lemma 1, Proposition 2, printed pp. 2-3; [[14]](#ref-14), Section 2, printed pp. 2-3.)

**Checks.**

- `z(x^3 y - x y^3) = 1` in `M_{3,0}`.

- `G(1, 0) = ((3b^2 - 8ac)/3) - (4a/9) T`.

- `N(G(1,2)) = g_6(1,2)^2` for `x^4 - y^4 (I = -12, J = 0)`.

- For `x^3 y - x y^3` (`I = 3`, `J = 0`, a linear factor) `z = 1`.

- At `(1, 0)`, `G = (4 a φ + 3b^2 - 8ac)/3`.

- `N(G)` is always a square.

- For `g=x⁴−y⁴`, `g₄=48x²y²` and `g₆=−32xy(x⁴+y⁴)`. Their resultants with g are `5308416=81·(−256)²` and `−16777216=(−256)³`; inserting `Δ` into the source formulas without converting `Δ_CF` fails both values.

- For `g=x³y−xy³` the fixed-degree quartic discriminant is 4, although `g(X,1)` has degree three. The homogeneous resultants are 1296 and 64; leading-zero coefficients must not change the prescribed degrees.

<a id="cubic-invariant-is-an-orbit-invariant"></a>

**Cubic invariant is an orbit invariant.** If g has invariants I, J and `γ` is in `PGL2(K)`, then `z(γ * g) = z(g)`.

Same hypotheses as the construction of z.

For the proof, `G(γ * g)(x, y) = (det γ)^{-2} G(g)((x, y) γ)` by the equivariance of g and `g_4` (Cremona-Fisher Lemma 5); `(det γ)^{-2}` is a square, and `(x,y) γ` is admissible for g when `(x, y)` is admissible for `γ * g` (equivariance of `g_6`).

*Needs:* [cubic invariant of a binary quartic](#cubic-invariant-of-a-binary-quartic), [covariants of a binary quartic](#covariants-of-a-binary-quartic), [pgl2 orbits and stabilizers of binary quartic forms](#pgl2-orbits-and-stabilizers-of-binary-quartic-forms).

([[11]](#ref-11), Proposition 6, printed p. 5.)

**Checks.**

- A diagonal substitution rescales G by a square.

<a id="linear-factor-forms"></a>

**Linear factor forms.** Let g have invariants I, J with `4I^3 - J^2 ≠ 0`. `(a) z(g) = 1` if and only if g has a linear factor over K (a zero in `P^1(K)`). `(b)` Every such g is `PGL2(K)`-equivalent to the normal form `q_0 = (1/27) Y (27 X^3 - 9 I X Y^2 - J Y^3) = X^3 Y - (I/3) X Y^3 - (J/27) Y^4`; hence the forms with a linear factor and invariants I, J form one orbit.

char K not 2,3, and `#K ≠ 5` for the chosen admissible-evaluation construction of z.

For the proof, (a, linear factor implies `z = 1`) At a zero `(x, y)` of g, `g_4(x, y) ≠ 0` and `g_6(x,y) ≠ 0` (fixed-degree homogeneous resultants `81 Δ^2` and `Δ^3`), and the syzygy gives `G(x, y) = g_4(x,y)/3 = (3 g_6/g_4)^2`, a square (Cremona-Fisher Lemma 3). (a, `z = 1` implies linear factor) If `a = 0` the factor Y already gives the conclusion; otherwise, with `r = g_6(1, 0) ≠ 0` after a proper change, `z = G(1,0)` has characteristic polynomial `ℤ^3 - pZ^2 + qZ - r^2`; if `z = z_1^2` then `h(ℤ^2) = -h_1(ℤ) h_1(-ℤ)` and -`(u + b)/(4a)` is a root of g (Cremona-Fisher Proposition 8). `(b)` Move the linear factor to Y, translate X to kill c, and rescale with `(M, λ)` of determinant 1 (Cremona-Fisher Proposition 7).

*Needs:* [cubic invariant of a binary quartic](#cubic-invariant-of-a-binary-quartic), [syzygy of binary quartic covariants](#syzygy-of-binary-quartic-covariants), [pgl2 orbits and stabilizers of binary quartic forms](#pgl2-orbits-and-stabilizers-of-binary-quartic-forms).

([[11]](#ref-11), Proposition 7, printed p. 5; [[11]](#ref-11), Proposition 8, printed p. 6.)

**Checks.**

- `x^3 y - x y^3` has `z = 1` and is the normal form with `I = 3`, `J = 0`.

<a id="auxiliary-quartic-root-from-equal-cubic-invariants"></a>

**Auxiliary quartic root from equal cubic invariants.** Let `g_1`, `g_2` have the same invariants I, J with `4I³−J²≠0`, with seminvariants `a_i = g_i(1,0)`, `p_i = g_{i,4}(1,0)`, `r_i = g_{i,6}(1, 0)`, and suppose `r_1`, `r_2 ≠ 0`. If `z(g_1) = z(g_2)`, then the binary quartic `p_1 g_2 - a_1 h_2` (`h_2` the Hessian covariant of `g_2`) has a zero in `P^1(K)`.

char K not 2, 3.

For the proof, Put `z_i = (4 a_i φ + p_i)/3`; `h(X) = N(X - z_1^{-1} z_2) = X^3 - pX^2 + qX - r^2` with `p = s_1/(3 r_1)^2`, `q = s_2/(3r_1)^2`, `r = r_2/r_1`. `z(g_1) = z(g_2)` gives w with `w^2 = z_1^{-1} z_2` and `N(w) = r`; comparing coefficients in `h(X^2) = -h_0(X) h_0(-X)` with `h_0 = N(X - w) = X^3 - uX^2 + vX - r` gives `(u^2 - p)^2 - 8ru - 4q = 0`, i.e. `3 r_1 u` is a root of g~`(X) = X^4 - 2 s_1 X^2 - 216 r_1^2 r_2 X + s_1^2 - 36 r_1^2 s_2`. g~`(X) = (1/a) g(X + b, -4a)` for `g = p_1 g_2 - a_1 h_2` with coefficients `(a, b, ...)` when `a ≠ 0` (a polynomial identity), so g has a zero; if `a = 0` then `(1, 0)` is a zero.

*Needs:* [cubic invariant of a binary quartic](#cubic-invariant-of-a-binary-quartic), [covariants of a binary quartic](#covariants-of-a-binary-quartic).

([[11]](#ref-11), Lemma 9, printed p. 6.)

**Checks.**

- For nonsingular `g_1 = g_2` with `r≠0`, the comparison form `p g - a h` vanishes at a point of `P^1(K)`.
- For `g_1=g_2=X⁴+XY³`, `I=0,J=−27`, `a=1,p=0,r=8`; the comparison form is `−h`, which vanishes at `(1,0)`.
- The pair `g_1=X³Y`, `g_2=0` has equal zero invariants but is outside the nonzero-discriminant domain of the comparison chain.

<a id="linear-factor-of-the-comparison-quartic-gives-equivalence"></a>

**Linear factor of the comparison quartic gives equivalence.** Let `g_1`, `g_2` have the same invariants I,J with `4I³−J²≠0` and `r_1 = g_{1,6}(1, 0) ≠ 0`. If `p_1 g_2 - a_1 h_2` has a zero in `P^1(K)`, then `g_1` and `g_2` are `PGL2(K)`-equivalent.

char K not 2, 3.

For the proof, Move the zero to `(1, 0)` by a proper change of `g_2`: `p_1 a_2 = a_1 p_2`. If `a_1 = 0` then `p_1 ≠ 0`, so `a_2 = 0` and both forms have a linear factor: equivalent by linear-factor-forms. Otherwise `a_1 ≠ 0`. Also `a_2 ≠ 0`, since `a_2 = p_2 = 0` would force `b_2 = 0` and make `g_2` singular. Put `t = a_2/a_1`, so `p_2 = t p_1`, without dividing by `p_1` (which may be zero). The seminvariant syzygy gives `r_2² = t³ r_1²`. Since t and `r_1` are nonzero, `r_2` is nonzero and `t = (r_2/(t r_1))²`. A proper diagonal change makes `a_2 = a_1`, `p_2 = p_1` and `r_2 = r_1`; a shift makes `b_2 = b_1`. Then p,r,I recover c,d,e successively because `a_1`,2,3 are invertible, so `g_2 = g_1`.

*Needs:* [linear factor forms](#linear-factor-forms), [covariants of a binary quartic](#covariants-of-a-binary-quartic), [syzygy of binary quartic covariants](#syzygy-of-binary-quartic-covariants), [pgl2 orbits and stabilizers of binary quartic forms](#pgl2-orbits-and-stabilizers-of-binary-quartic-forms).

([[11]](#ref-11), Lemma 10 and proof, printed pp. 6-7.)

**Checks.**

- For nonsingular `g_1 = g_2` with `r₁≠0`, the identity equivalence is found.
- For `g_1=g_2=X³Y−XY³`, `a₁=0,p₁=3,r₁=1` and the comparison form has the zero `(1,0)`; the linear-factor branch applies without division by a₁.
- Over Q, `g_1=X³Y` and `g_2=0` have `I=J=0`, `a₁=0,p₁=3,r₁=1` and zero comparison quartic. They are not equivalent because an invertible action preserves nonzeroness; the discriminant hypothesis excludes them.

<a id="cubic-invariant-determines-the-orbit"></a>

**Cubic invariant determines the orbit.** Let K be a field of characteristic not 2 or 3, `K ≠ F_5`, and `g_1`, `g_2` binary quartics with the same invariants I, J, `4I^3 - J^2 ≠ 0`. Then `z(g_1) = z(g_2)` if and only if `g_1` and `g_2` are `PGL2(K)`-equivalent.

`Suggested.lean` states this classification as `BinaryQuartic.cubicInvariant_determines_orbit`.

Includes the cases `I = 0` or `J = 0`, where equivalence by `GL2 x GL1` with the same invariants need not be proper; the theorem is about `PGL2(K)` (proper) equivalence.

For the proof, `⇐`: cubic-invariant-is-an-orbit-invariant. `⇒`: if `z = 1` both have linear factors (linear-factor-forms). Otherwise neither has a linear factor; after proper changes `r_1`, `r_2 ≠ 0`; auxiliary-quartic-root-from-equal-cubic-invariants gives a zero of `p_1 g_2 - a_1 h_2`, and linear-factor-of-the-comparison-quartic-gives-equivalence concludes.

*Needs:* [cubic invariant is an orbit invariant](#cubic-invariant-is-an-orbit-invariant), [linear factor forms](#linear-factor-forms), [auxiliary quartic root from equal cubic invariants](#auxiliary-quartic-root-from-equal-cubic-invariants), [linear factor of the comparison quartic gives equivalence](#linear-factor-of-the-comparison-quartic-gives-equivalence).

([[11]](#ref-11), Theorem 11, printed p. 7.)

**Checks.**

- The proper transformation `diag(2,1)` sends `x⁴−y⁴` to `4x⁴−y⁴/4`. Both have `I = −12`, `J = 0` and a rational linear factor, hence cubic invariant 1.

- When `J ≠ 0`, g and `−g` have different pairs `(I,J)`, so their cubic invariants live in different specified cubic algebras and are not compared by this theorem.

### 1.6 Quartics of points and two-descent

<a id="quartic-of-a-point"></a>

**Quartic of a point.** For P in `E_{I,J}(K)` define `q(O) = X^3 Y - (I/3) X Y^3 - (J/27) Y^4` (the linear-factor normal form) and, for `P = (ξ, η)`, `q(P) = X^4 - (ξ/6) X^2 Y^2 - (η/27) X Y^3 + ((36 I - ξ^2)/432) Y^4`. Then `q(P)` has invariants I and J, is K-soluble (its leading coefficient is 1, or it has the linear factor Y), and `q(-P)` is `PGL2(K)`-equivalent to `q(P)`. In Bhargava-Shankar's normalization `y^2 = x^3 - (I/3) x - J/27` the same quartic is `(1/4) X^4 - (3/2) ξ' X^2 Y^2 + 2 η' X Y^3 + (I/3 - (3/4) ξ'^2) Y^4` with `(ξ', η') = (ξ/9, η/27)`, up to `PGL2(K)`.

char K not 2, 3.

The required API is:

- `BinaryQuartic.quarticOfPoint`: `P ↦ q(P)`.

- `I(q(P)) = I`.

- `J(q(P)) = J`.

- `q(P)` is K-soluble.

- `q(-P)` is `PGL2(K)`-equivalent to `q(P)`.

- `BinaryQuartic.linearFactorForm`: The normal form `X^3 Y - (I/3) X Y^3 - (J/27) Y^4 = q(O)`.

For the proof, Invariants: direct computation using `η^2 = ξ^3 - 27 I ξ - 27 J` (a polynomial identity, also for the Bhargava-Shankar formula). Solubility: `(1, 0, 1)` is a solution for affine P; `q(O)` vanishes at `(1, 0)`. `q(-P)`: the substitution `Y → -Y` (determinant -1, trivial twist) changes the sign of the η-term. The Bhargava–Shankar representative is exactly the twisted transform of the Cremona–Fisher representative by `diag(−1/2,1)`; substitute `(ξ′,η′) = (ξ/9,η/27)`.

*Needs:* [cubic invariant of a binary quartic](#cubic-invariant-of-a-binary-quartic), [soluble binary quartic forms](#soluble-binary-quartic-forms), [linear factor forms](#linear-factor-forms), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), `WeierstrassCurve.Affine.Point` (Mathlib).

([[11]](#ref-11), Section 6, printed p. 10; [[1]](#ref-1), Theorem 3.2, printed p. 23.)

**Checks.**

- `q(O)(1, 0) = 0`.

- On `y^2 = x^3 - 27x`, `q((0,0)) = X^4 + Y^4/12`, with `I = 1`, `J = 0`.

- The leading coefficient of `q(P)` at an affine point is 1.

- `q(O)` vanishes at `(1, 0)`.

- On `y^2 = x^3 - 27x` the 2-torsion point `(0, 0)` gives `X^4 + Y^4/12`.

<a id="cubic-invariant-of-the-quartic-of-a-point"></a>

**Cubic invariant of the quartic of a point.** For P in `E_{I,J}(K)`, `z(q(P)) = μ(P)` in `M_{I,J}`, where `μ` is Tau Ceti's descent map `WeierstrassCurve.Affine.μ`: for `P = (ξ, η)` with `η ≠ 0` it is the class of `ξ - T`; at a 2-torsion point `(ξ, 0)` it is the class of the corrected representative `ξ - T + (T^2 + ξ T + ξ^2 - 27 I)` (Tau Ceti's fCofactor); and `μ(O) = 1`.

char K not 2, 3; the identification `φ = -T/3` of the resolvent root. `#K ≠ 5` for the chosen construction of z by an admissible evaluation. The `F_5` orbit parametrization is handled separately without invoking this construction.

The required API is:

- `BinaryQuartic.cubicInvariant_quarticOfPoint_eq_mu` in `Suggested.lean`: Under `char≠2`,3, `#K≠5` and ellipticity, `z(q(P))` equals native `WeierstrassCurve.Affine.μ` at every point, including ∞ and rational two-torsion.

For the proof, For `η ≠ 0`: `G(1, 0) = (4 φ + p)/3` with `p = g_4(1,0) = 3.0 - 8.1`.`(-ξ/6) = 4 ξ/3`, so `G(1,0) = (4/9)(ξ + 3 φ) = (2/3)^2 (ξ - T)` (Cremona-Fisher Theorem `13(1)`; `g_6(1, 0) = 8(-η/27) ≠ 0`). For `η = 0` (so `g_6(1, 0) = 0`) evaluate G at another admissible point; the resulting class agrees with the corrected representative (the conjugate of G at the vanishing coordinate is replaced by the product of the other two, Cremona-Fisher Section 2 remarks), matching Tau Ceti's `μX_of_eval_f_eq_zero`. `μ(O) = 1` and `q(O)` has a linear factor, so `z = 1` (linear-factor-forms).

*Needs:* [quartic of a point](#quartic-of-a-point), [cubic invariant of a binary quartic](#cubic-invariant-of-a-binary-quartic), [linear factor forms](#linear-factor-forms), `WeierstrassCurve.Affine.μ` (Tau Ceti), `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero` (Tau Ceti), `WeierstrassCurve.Affine.μX_of_eval_f_eq_zero` (Tau Ceti).

([[11]](#ref-11), Proof of Theorem 13(1), printed pp. 10-11; [[11]](#ref-11), Section 6, printed p. 10.)

**Checks.**

- On `y²=x³−43x+42` (roots 1,6,`−7`), `P=(−3,12)` gives values `(−4,−9,4)`, hence square classes `(−1,−1,1)`, for both `z(q(P))` and `μ(P)`.

- At `P=O` the quartic-of-a-point construction has a linear factor and `z(q(O))=1=μ(O)`. The identity cannot be replaced by the zero square class.

- On `E_(3,0):y²=x³−81x`, with roots 0,9,`−9`, `P=(0,0)` is two-torsion. The corrected representative has values `(−81,−9,9)`, hence square classes `(−1,−1,1)`. The uncorrected values `(0,−9,9)` do not even define a unit square class; this tests the cofactor correction.

<a id="binary-quartic-parametrization-of-e-mod-2e"></a>

**Binary quartic parametrization of e mod 2e.** Let K be a field of characteristic not 2 or 3 and I, J in K with `4I^3 - J^2 ≠ 0`. The map `P ↦ PGL2(K) . q(P)` induces a bijection between `E_{I,J}(K)/2E_{I,J}(K)` and the set of `PGL2(K)`-orbits of K-soluble binary quartic forms with invariants I and J; the identity class corresponds to the orbit of forms with a linear factor over K. When `#K ≠ 5`, equivalently, z restricted to soluble orbits is a bijection onto the image of Tau Ceti's `μ`, and `z o q = μ`.

char K not 2, 3; the case `K = F_5` is included in the orbit statement independently of the evaluation construction of z.

`Suggested.lean` states the soluble-orbit bijection and its exact point fibres as `BinaryQuartic.solubleOrbit_bijection`, including the case `K=F₅`.

For the proof, Well-defined and injective: `z(q(P)) = μ(P)` (cubic-invariant-of-the-quartic-of-a-point), z is injective on orbits (cubic-invariant-determines-the-orbit) and `ker μ = 2E(K)` (Tau Ceti `ker_μ_eq`); so `q(P)` ~ `q(Q)` iff `μ(P) = μ(Q)` iff `P - Q` in `2E(K)`. Surjective onto soluble orbits: a soluble g with a zero is in the linear-factor orbit `= q(O)`; otherwise a proper change gives leading coefficient 1 and `b = 0`, and then `(ξ, η) = (-6c, -27d)` lies on `E_{I,J}` and `q(ξ, η) = g` (Cremona-Fisher Theorem `13(2)`, using the formulas for I, J). Identity: `q(O)` is the linear-factor form (linear-factor-forms). For `K = F_5` prove that, in each nonsingular invariant fibre, the point-quartic map has image all soluble orbits and identifies two points exactly when their difference lies in `2E(F_5)`.

*Needs:* [quartic of a point](#quartic-of-a-point), [cubic invariant of the quartic of a point](#cubic-invariant-of-the-quartic-of-a-point), [cubic invariant determines the orbit](#cubic-invariant-determines-the-orbit), [linear factor forms](#linear-factor-forms), [soluble binary quartic forms](#soluble-binary-quartic-forms), `WeierstrassCurve.Affine.ker_μ_eq` (Tau Ceti), `WeierstrassCurve.Affine.μ` (Tau Ceti).

([[1]](#ref-1), Theorem 3.2, printed p. 23; [[11]](#ref-11), Theorem 13, printed p. 10.)

**Checks.**

- Over R: `#E(R)/2E(R) = #E(R)[2]/2`, which is 1 if `Δ < 0` and 2 if `Δ > 0`; so there are that many `PGL2(R)`-orbits of `ℝ`-soluble forms with given invariants.

- Over `F_p (p ≥ 5)`: `#E(F_p)/2E(F_p) = #E(F_p)[2]`, and every nondegenerate quartic over `F_p` is soluble.

<a id="bilinear-factor-criterion-for-proper-equivalence"></a>

**Bilinear factor criterion for proper equivalence.** Let `g_1`, `g_2` be binary quartics with the same invariants and Hessians `h_1`, `h_2`, and `F_{g_1,g_2}(X_1, Y_1, X_2, Y_2) = g_1(X_1,Y_1) h_2(X_2,Y_2) - g_2(X_2,Y_2) h_1(X_1,Y_1)`. Then `g_1` and `g_2` are `PGL2(K)`-equivalent iff F has a K-rational bilinear factor `(X_1 Y_1) A (X_2 Y_2)^T` with A in `GL2(K)`; the factor with matrix A gives the equivalence `M = A^T (0 1; -1 0)`. Moreover `F_{g,g} = -3 (X_1 Y_2 - Y_1 X_2) R(X_1X_2, X_1Y_2 + X_2Y_1, Y_1Y_2)` with R a ternary cubic form that is, up to a nonzero constant, the norm from `L = K[φ]` of an L-linear form; hence over K-bar, `F_{g,g}` has exactly three further bilinear factors, one for each root `phi_i` of `X^3 - 3IX + J`, and such a factor is K-rational iff `phi_i` is in K.

char K not 2,3, and the common discriminant is nonzero. The proof using a preliminary sextic-nonzero evaluation assumes `#K ≠ 5`; the same equivalence over `F_5` is a separate finite-field assertion.

For the proof, If `g_2 = det(M)^{-2} g_1^M` then `F_{g_1,g_2} = det(M)^{-2} F_{g_1,g_1}(X_1, Y_1, (X_2,Y_2)M)`, and `F_{g_1,g_1}` has the factor `X_1 Y_2 - Y_1 X_2`. Conversely a bilinear factor, specialized at `(X_1, Y_1) = (1, 0)` (after making `r_1 ≠ 0`), gives a zero of `p_1 g_2 - a_1 h_2`, and linear-factor-of-the-comparison-quartic-gives-equivalence applies. The factorization of `F_{g,g}` and of R as a norm from `L = K[φ]` (Cremona–Fisher §5, Theorem 12, Remark 1 and the following identities, pp.9–10) identifies the nontrivial bilinear factors with the conjugates of an L-linear factor. For `K = F_5` prove directly, for every nonsingular common invariant fibre, that the invertible bilinear factors modulo scalars correspond exactly to proper equivalences through the displayed matrix formula. The preliminary-evaluation argument can fail on `P¹(F_5)`.

*Needs:* [covariants of a binary quartic](#covariants-of-a-binary-quartic), [linear factor of the comparison quartic gives equivalence](#linear-factor-of-the-comparison-quartic-gives-equivalence), [cubic invariant of a binary quartic](#cubic-invariant-of-a-binary-quartic).

([[11]](#ref-11), Theorem 12, printed p. 9; [[11]](#ref-11), Remark 1 after Theorem 12, printed p. 9.)

**Checks.**

- For `g = X^4 - Y^4` the proper self-equivalences over `Q(i)` are 4 in number.

<a id="stabilizer-of-a-binary-quartic-is-two-torsion"></a>

**Stabilizer of a binary quartic is two torsion.** Let K be a field of characteristic not 2 or 3 and f a binary quartic over K with invariants I, J and `4I^3 - J^2 ≠ 0` (not necessarily K-soluble). Then `Stab_{PGL2(K)}(f)` is isomorphic to `E_{I,J}(K)[2]`. It is an elementary abelian 2-group of order `1 + #`{roots of `X^3 - 3IX + J` in K}; over R it has order 4 if `Δ(f) > 0` and 2 if `Δ(f) < 0` (never 1).

char K not 2, 3; the discriminant is nonzero.

`BinaryQuartic.stabilizer_twoTorsion` in `Suggested.lean` states the group isomorphism as an injective homomorphism from native two-torsion into `PGL₂(K)` whose image is exactly the proper stabilizer.

For the proof, Order: stabilizer elements are the proper self-equivalences; by bilinear-factor-criterion-for-proper-equivalence they correspond to the K-rational bilinear factors of `F_{f,f}`: the trivial one and one for each K-rational root of the resolvent. Exponent 2: each nonidentity self-equivalence is represented by `M = (-alpha_2 alpha_1; -alpha_3 alpha_2)` (Cremona–Fisher §5, Remark 1 and the factorization following Theorem 12, pp.9–10). Its trace is 0, so `M^2 = -det(M) I` is scalar. The identity class is handled separately. `E(K)[2]`: its order is `1 + #`{roots of `x^3 - 27Ix - 27J` in K} (Tau Ceti `card_ker_nsmul_two`), and the roots correspond to those of `X^3 - 3IX + J` under `T = -3 φ`. Elementary abelian 2-groups of equal order 1, 2 or 4 are isomorphic. Over R: the resolvent has three real roots iff its discriminant `729 Δ` is positive.

*Needs:* [bilinear factor criterion for proper equivalence](#bilinear-factor-criterion-for-proper-equivalence), [pgl2 orbits and stabilizers of binary quartic forms](#pgl2-orbits-and-stabilizers-of-binary-quartic-forms), `WeierstrassCurve.Affine.card_ker_nsmul_two` (Tau Ceti).

([[1]](#ref-1), Theorem 3.2, second paragraph, printed p. 23; [[15]](#ref-15), Remark 4.3, printed p. 26.)

**Checks.**

- Over R: order 4 if `Δ > 0`, 2 if `Δ < 0`; these give Bhargava-Shankar's `GL2(R)`-stabilizer orders 8 and 4 (Lemma 2.2) and `n_0 = 4`, `n_1 = 2`, `n_`{2±} `= 4`.

- `x^4 - y^4` over Q: resolvent `X^3 + 36X` has one rational root `(0)`, so the stabilizer has order 2.

- The identity matrix has trace 2 over Q and gives the trivial self-equivalence of every quartic. The other self-equivalence of `x⁴−y⁴` is represented by `diag(1,−1)`, which has trace zero and square `I₂`. Thus trace zero describes the nonidentity representatives, rather than every stabilizer element.

<a id="image-of-the-cubic-invariant"></a>

**Image of the cubic invariant.** Let K be a field of characteristic not 2 or 3 with `#K ≠ 5`, I, J with `4I^3 - J^2 ≠ 0`, and m in `A_{I,J}^x` with square norm. Then the following are equivalent: `(a) [m] = z(g)` for a binary quartic g with invariants I, J; `(b) m` is represented by a unit linear in T (`m w^2 = u + v φ` for a unit w); `(c)` the ternary quadratic form `Q_m(t) =` coefficient of `T^2` in `m (t_0 + t_1 T + t_2 T^2)^2` (reduced modulo `T^3 - 27IT - 27J`) has a nontrivial zero. `Q_m` is regular: its Gram determinant is exactly -`N(m)` in the displayed power basis. If `v ≠ 0` and `N(u + v φ) = r^2`, Simon's quartic `(1/(12 v))(X^4 - 6u X^2 Y^2 + 8r X Y^3 + (12 I v^2 - 3 u^2) Y^4)` has invariants I, J and cubic invariant `(u + v φ)/(9 v^2)`.

char K not 2, 3, `#K ≠ 5`.

For the proof, `(a) => (b)`: `z(g)` is represented by `G(x, y)`, which is linear in `φ`. `(b) => (a)`: if `v = 0` the norm condition makes m a square, take the linear-factor form; otherwise Simon's quartic works (the invariant and squareclass identities of Cremona-Fisher Theorem `13(3)`). `(b) <=> (c)`: a unit w satisfies `m w²` linear iff its `T²`-coefficient vanishes. Given a nontrivial zero, the regular conic has a K-point and hence is isomorphic to `P¹_K`. It has more than six K-points since `char K ≠ 2`,3 and `#K ≠ 5`. Over an algebraic closure the nonunits lie on three projective lines, each meeting the smooth conic in at most two points. Thus a K-point outside their union supplies a unit w. Regularity: `det Q_m = -N(m)` for a depressed cubic (an integral polynomial identity).

*Needs:* [cubic invariant of a binary quartic](#cubic-invariant-of-a-binary-quartic), [linear factor forms](#linear-factor-forms), `Polynomial.modByMonic` (Mathlib), `QuadraticMap.Anisotropic` (Mathlib), `QuadraticMap.not_anisotropic_iff_exists` (Mathlib).

([[11]](#ref-11), Theorem 13(3) and proof, printed pp. 10-11; [[18]](#ref-18), Introduction, printed p. 5.)

**Checks.**

- For `m = 1`, `Q_m=t₁²+2t₀t₂+27I t₂²` has determinant `−1` and the nontrivial zero `t=(1,0,0)`.

- For `I=3`, `J=0` and `m=u+v φ` of square norm `r²` with `v≠0`, Simon's quartic has invariants `(3,0)`. Explicitly `m=28+7phi` has norm `9604=98²`; its quartic has coefficients `(1/84,0,−2,28/3,−7)`, with `I=3`, `J=0` and `Δ=4`.

- Over Q, `m=2` has norm 8, which is not a square. Its conic is still isotropic, but m is outside the theorem’s square-norm domain; conic isotropy alone must not produce an orbit with the prescribed invariants.

<a id="locally-soluble-quartics-and-the-two-selmer-group"></a>

**Locally soluble quartics and the two selmer group.** Let K be a number field and I, J in K with `4I^3 - J^2 ≠ 0`. The cubic invariant z induces a bijection between the `PGL2(K)`-orbits of everywhere locally soluble binary quartic forms over K with invariants I, J and Tau Ceti's 2-Selmer group `selmerGroup_2` of `E_{I,J}` (relative to `O_K` and the family of completions at the infinite places); the orbit of forms with a linear factor goes to 1. Equivalently (coefficient form): z is injective on these orbits, and a square class m of square norm is the cubic invariant of a locally soluble global form iff for every place v the restriction of m is the cubic invariant of a `K_v`-soluble form with invariants I, J.

K a number field; Tau Ceti's `selmerGroup_2` is defined by the norm condition and the local conditions localRes m in range(`μ` over `K_v`) at all finite places and at the infinite completions. At complex places every form is soluble and the local condition is automatic.

The required API is:

- `BinaryQuartic.mem_selmerGroup₂_iff` in `Suggested.lean`: A class m in native W.M lies in `W.selmerGroup₂ (O_K)` (archimedean completions) iff it is the cubic invariant of an everywhere locally soluble quartic with invariants I,J.

For the proof, Into the Selmer group: for locally soluble g, `z(g)` has square norm, and at each place v, localRes `z(g) = z_v(g)` (cubic-invariant-of-a-binary-quartic, base change) is in `z_v`(soluble orbits) `= range(mu_v)` (binary-quartic-parametrization-of-E-mod-2E over `K_v`, Tau Ceti `localRes_comp_μ`); this is membership in `selmerGroup_2` (Tau Ceti `mem_selmerGroup₂_iff`). Injective: cubic-invariant-determines-the-orbit (K is infinite). Surjective: for m in `selmerGroup_2`, at each place `m_v = mu_v(P_v) = z_v(q(P_v))` is represented by a linear unit, so the conic `Q_m` is isotropic over every `K_v` (image-of-the-cubic-invariant over `K_v`); it is regular, so by Hasse-Minkowski for ternary forms (GlobalQuadraticForms Layer 5) it is isotropic over K; hence `m = z(g)` for some g with invariants I, J (image-of-the-cubic-invariant over K). Then `z_v(g) = m_v = z_v(q(P_v))`, so g is `PGL2(K_v)`-equivalent to the soluble `q(P_v)` (injectivity over `K_v`): g is locally soluble. Identity: linear-factor-forms.

*Needs:* [binary quartic parametrization of e mod 2e](#binary-quartic-parametrization-of-e-mod-2e), [cubic invariant determines the orbit](#cubic-invariant-determines-the-orbit), [image of the cubic invariant](#image-of-the-cubic-invariant), [cubic invariant of a binary quartic](#cubic-invariant-of-a-binary-quartic), [soluble binary quartic forms](#soluble-binary-quartic-forms), [linear factor forms](#linear-factor-forms), `WeierstrassCurve.Affine.selmerGroup₂` (Tau Ceti), `WeierstrassCurve.Affine.mem_selmerGroup₂_iff` (Tau Ceti), `WeierstrassCurve.Affine.localRes_comp_μ` (Tau Ceti), `WeierstrassCurve.Affine.localCondition` (Tau Ceti), `WeierstrassCurve.Affine.normM` (Tau Ceti), `WeierstrassCurve.Affine.range_μ_le_ker_normM` (Tau Ceti).

([[1]](#ref-1), Proposition 3.3, printed p. 23; [[14]](#ref-14), Lemma 2.1, printed p. 2; [[18]](#ref-18), Introduction, printed pp. 4-5.)

**Checks.**

- Over Q for `E = 571a1 (I = 44608, J = 18842960)`: the three nontrivial Selmer elements are represented by the quartics `g_1`, `g_2`, `g_3` of Fisher's Example 3.4, and the product of their cubic invariants is a square.

- Lind's quartic `2x^4 - 34y^4 (I = -816, J = 0)` is locally soluble with no rational point: its cubic invariant lies in `selmerGroup_2` of `y^2 = x^3 + 22032 x` but not in the image of `μ`.

- The quartic `x³y−xy³` has `(I,J)=(3,0)` and the rational zero `(x,y,z)=(1,0,0)`. It represents the identity in the two-Selmer group of `y²=x³−81x`, over Q and after every localization; the orbit of a form with a linear factor must not be counted as nonidentity.

### 1.7 Integral two-covering representatives

<a id="primitive-vectors-extend-to-special-linear-matrices"></a>

**Primitive vectors extend to special linear matrices.** Let O be a principal ideal domain and v in `O^3` with coordinates generating the unit ideal (a primitive vector). Then for every j there is M in `SL3(O)` whose j-th column is v; in particular `SL3(O)` acts transitively on `P^2(Frac O)` (on primitive vectors up to units).

O a PID `(ℤ, ℤ_p, ℤ_(p))`. Primitivity means `Ideal.span (Set.range v) = ⊤`; the column j remains prescribed.

For the proof, `O^3/Ov` is finitely generated and torsion-free (v primitive), hence free of rank 2 over the PID (Mathlib `Module.free_of_finite_type_torsion_free'`); so v extends to a basis of `O^3`. First permute the extended basis so that v is its j-th column. Its determinant is a unit u; multiply a different column by `u^{-1}`. This preserves the chosen column and makes the determinant 1, including the sign of the permutation.

*Needs:* `Module.free_of_finite_type_torsion_free'` (Mathlib), `IsCoprime.exists_SL2_col` (Mathlib), `Matrix.SpecialLinearGroup` (Mathlib).

([[12]](#ref-12), Lemma 3.13, printed pp. 14-15.)

**Checks.**

- `v = (1290, -383, 1000)` (the point `2(3,5)` of `y^2 = x^3 - 2` in projective coordinates) is a column of a matrix in `SL3(ℤ)`.

- For each j, the standard vector `e_j` is column j of the identity matrix.

- Over `ℤ`, `v=(2,0,0)` is not primitive and cannot be a column of a determinant-one matrix: its entries generate `2ℤ`.

<a id="ternary-cubic-forms-and-their-invariants"></a>

**Ternary cubic forms and their invariants.`** A` ternary cubic over a commutative ring R is `U = a x^3 + b y^3 + c z^3 + a_2 x^2 y + a_3 x^2 z + b_1 x y^2 + b_3 y^2 z + c_1 x z^2 + c_2 y z^2 + m x y z`. Its invariants `c_4(U)` (25 terms, degree 4) and `c_6(U)` (103 terms, degree 6) are the integer polynomials in the coefficients determined by Fisher's normalization `H(λ U + μ H) = 3(c_4 λ^2 μ + 2 c_6 λ μ^2 + c_4^2 μ^3) U + (λ^3 - 3 c_4 λ μ^2 - 2 c_6 μ^3) H`, where `H(U) = -(1/2) det`(Hessian of U); `c_4 = -216 abcm + 144 abc_1c_2 + ... + m^4` and `c_6 = 5832 a^2b^2c^2 - 3888 a^2 b b_3 c c_2 + ... - m^6`. For the Weierstrass cubic `y^2 z - x^3 - A x z^2 - B z^3` they are `c_4 = -48A` and `c_6 = -864B`, the usual invariants of `y^2 = x^3 + Ax + B`; and `c_4^3 - c_6^2 = 1728 Δ`. Substitution: `(U o M)(x, y, z) = U(M^T (x, y, z))`.

Construct these as universal polynomials over `ℤ`, then evaluate their coefficients in R. The Hessian identity determines them over characteristic zero; neither division by 2 or 1728 nor uniqueness from that identity is asserted after specialization to characteristic two or three. Their leading terms agree with Fisher's printed partial expansions.

The required API is:

- `TernaryCubicForm`: Ternary cubics by ten coefficients (Fisher's coordinates).

- `TernaryCubicForm.eval`: Evaluation.

- `TernaryCubicForm.c4`: The invariant `c_4`.

- `TernaryCubicForm.c6`: The invariant `c_6`.

- `TernaryCubicForm.comp`: The cubic `U(M^T (x,y,z))`.

- `TernaryCubicForm.eval_comp`: Evaluation of the substituted cubic.

- `TernaryCubicForm.weierstrass`: The Weierstrass cubic `y^2 z - x^3 - A x z^2 - B z^3`.

- `TernaryCubicForm.c4_weierstrass`: `c_4 = -48 A`.

- `TernaryCubicForm.c6_weierstrass`: `c_6 = -864 B`.

- `TernaryCubicForm.c4_cube_sub_c6_sq`: `c_4^3 - c_6^2` is divisible by 1728 (defines `Δ`).

For the proof, Compute `H(U)`, the first and second directional derivatives of H at U in the direction `H(U)`, and read off `c_4`, `c_6` from the `λ^2 μ` and `λ μ^2` coefficients (exact polynomial division by the coefficient a). Evaluate on the Weierstrass cubic.

*Needs:* `Matrix.det` (Mathlib).

([[13]](#ref-13), Section 7.2, printed p. 27; [[12]](#ref-12), Lemma 3.11, printed pp. 13-14.)

**Checks.**

- `c_4(x^3 + y^3 + z^3) = 0`.

- `c_6(x^3 + y^3 + z^3) = 5832`.

- `c_4(y^2 z - x^3 + x z^2) = 48`, not -48: the sign of Fisher's normalization is pinned.

- Fermat cubic `x^3 + y^3 + z^3`: `c_4 = 0`, `c_6 = 5832`.

- `y^2 z = x^3 - x z^2`: `c_4 = 48`.

- The zero cubic has `c₄=c₆=Δ=0`. The singular cubic xyz instead has `c₄=1`, `c₆=−1` and `Δ=0`. Thus vanishing discriminant does not force both invariants to vanish; the integral coefficient polynomials remain defined in characteristic two and three even though division by 1728 is unavailable there.

<a id="invariance-of-ternary-cubic-invariants"></a>

**Invariance of ternary cubic invariants.** For a ternary cubic U and a 3 x 3 matrix M over a commutative ring, `c_4(U o M) = det(M)^4 c_4(U)` and `c_6(U o M) = det(M)^6 c_6(U)`.

Polynomial identities in the coefficients of U and the entries of M.

For the proof, Both sides are polynomials; the identities are multiplicative in M, so it suffices to check them for elementary transvections and diagonal matrices over Q (these generate `GL3(Q)`, which is Zariski dense), and they then hold over every commutative ring (Cremona-Fisher-Stoll Theorem `2.8(i)`; Fisher, Section 4).

*Needs:* [ternary cubic forms and their invariants](#ternary-cubic-forms-and-their-invariants).

([[12]](#ref-12), Theorem 2.8(i), printed p. 6.)

**Checks.**

- `c_4` of the Weierstrass cubic moved by any M in `SL3(ℤ)` is still -48A.

<a id="projection-of-a-plane-cubic-from-a-rational-point"></a>

**Projection of a plane cubic from a rational point.** Let U be a ternary cubic with `b = 0`, i.e. with `(0:1:0)` on `U = 0`, written `U = f_1(x,z) y^2 - f_2(x,z) y - f_3(x,z)` with `f_1 = b_1 x + b_3 z`, `f_2 = -(a_2 x^2 + m x z + c_2 z^2)`, `f_3 = -(a x^3 + a_3 x^2 z + c_1 x z^2 + c z^3)`. Its projection quartic is the binary quartic `F_U = f_2^2 + 4 f_1 f_3` in `(x, z)` (the discriminant in y of U along the line through `(0:1:0)` with slope `(x : z)`). If U is integral then `F_U` is integral, and `I(F_U) = c_4(U)`, `J(F_U) = 2 c_6(U)`. For the Weierstrass cubic of `y^2 = x^3 + Ax + B`, `F = 4(x^3 z + A x z^3 + B z^4)`, with invariants `(-48A, -1728B) = (2^4 I, 2^6 J)` for `I = -3A`, `J = -27B`.

`U(0,1,0) = b = 0`. The generalized quartic `y^2 + f_2 y = f_1 f_3` of Cremona-Fisher-Stoll `(3.4)` becomes `F_U` after completing the square (times 4), which is how integrality at 2 is kept.

The required API is:

- `TernaryCubicForm.projectionQuartic`: `F_U = f_2^2 + 4 f_1 f_3` as a binary quartic.

- `TernaryCubicForm.invI_projectionQuartic`: `I(F_U) = c_4(U)` when `b = 0`.

- `TernaryCubicForm.invJ_projectionQuartic`: `J(F_U) = 2 c_6(U)` when `b = 0`.

- `TernaryCubicForm.projectionQuartic_eval`: `F_U(x, z) = (a_2 x^2 + m x z + c_2 z^2)^2 - 4 (b_1 x + b_3 z)(a x^3 + a_3 x^2 z + c_1 x z^2 + c z^3)`.

For the proof, Lines through `(0:1:0)` are parametrized by `(x:z)`. Their residual homogeneous quadratic has discriminant `F_U`. In characteristic different from 2, when `f_1(x,z) ≠ 0` its two residual intersection points are rational (with multiplicity) iff `F_U(x,z)` is a square. The direction `f_1(x,z)=0` requires the separate linear/tangent case; the polynomial construction and invariant identities impose neither restriction. `I(F_U) = c_4(U)` and `J(F_U) = 2 c_6(U)` for `b = 0`: polynomial identities (Cremona-Fisher-Stoll: 'a generic computation shows that the genus one models `(3.4)` and `(3.5)` have the same discriminant', here with `c_4`, `c_6` themselves).

*Needs:* [ternary cubic forms and their invariants](#ternary-cubic-forms-and-their-invariants), [binary quartic form](../ArithmeticStatisticsPartI/README.md#binary-quartic-form), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants).

([[12]](#ref-12), Lemma 3.14, printed p. 15; [[12]](#ref-12), Proof of Lemma 3.10(i), printed p. 16.)

**Checks.**

- For the Weierstrass cubic, `F = (0, 4, 0, 4A, 4B)`.

- For `A = -7`, `B = 10`: `I(F) = 336` and `J(F) = -17280`.

- Projection commutes with the base change `ℤ → Q`.

- Weierstrass cubic: `F = (0, 4, 0, 4A, 4B)`.

- `A = -7`, `B = 10`: `I(F) = 336`, `J(F) = -17280`.

- Integrality is compatible with base change to Q.

<a id="cubic-invariant-of-the-projected-quartic"></a>

**Cubic invariant of the projected quartic.** Let E : `y² = x³ + Ax + B` be nonsingular over a field K of characteristic different from 2 and 3 with `#K ≠ 5`. Let `P=(ξ,η)` in `E(K)` and M in `SL3(K)` whose middle row is `λ·(ξ,η,1)`, for some `λ` in `K×` (equivalently `Mᵀe_2` represents P). The projection quartic F of the row-substituted cubic `U∘M` has invariants `I(F)=−48A`, `J(F)=−1728B` and is `PGL2(K)`-equivalent to `q(P′)`, where `P′=(36xi,216eta)` on `E_{−48A,−1728B}`. Consequently its cubic invariant is `μ(P′)`, with the corrected representative at 2-torsion. For `P=O` the same construction has a rational linear factor and cubic invariant 1. The orbit statement itself also holds over `F_5`; only the evaluation construction of z excludes that field.

`char K ≠ 2`,3 and `4A³+27B² ≠ 0`; `#K ≠ 5` when expressing the conclusion using z. The middle row represents the projective point: a nonzero scalar multiple is allowed, as required for primitive integral coordinates.

For the proof, Invariants follow from `det(M)=1`, the ternary-cubic transformation laws, and `I(projection U)=c₄(U)`, `J(projection U)=2c₆(U)`. For affine P take `M_0` with rows `(1,0,0)`, `(ξ,η,1)`, `(0,−1,0)`; `det(M_0)=1`. Substituting `(X,Y,ℤ)=(x+ξ·y,η·y−z,y)` and using `η²=ξ³+Aξ+B` gives `U∘M₀=−((3ξ²+A)x+2η·z)y²+(z²−3ξ·x²)y−x³`. Its projection is `z⁴−6ξ·x²z²−8η·x³z−(3ξ²+4A)x⁴`, exactly `q(P′)(z,x)`. The variable swap has determinant `−1` and trivial determinant-square twist. For any permitted M, `L=M M_0^{-1}` has middle row `(0,λ,0)`. Write its other rows as `(a,b,c)`,`(d,e,f)`. The induced change in `(x,z)` is `Γ=((a,c),(d,f))`, and `det(Γ)=λ⁻¹`. Translation of y by `bx+ez` leaves the quadratic discriminant unchanged; scaling y by `λ` multiplies it by `λ²`. Thus `projection(U∘M)=Γ twistedSMul projection(U∘M₀)`. This also proves independence of the primitive projective representative. Apply `z(q(P′))=μ(P′)` and invariance of z under `PGL2`. This identity handles 2-torsion without evaluating a nonunit representative. For O, the original Weierstrass projection `4(x³z+Axz³+Bz⁴)` has the factor z; the same block-matrix calculation proves the assertion for every M representing O.

*Needs:* [projection of a plane cubic from a rational point](#projection-of-a-plane-cubic-from-a-rational-point), [invariance of ternary cubic invariants](#invariance-of-ternary-cubic-invariants), [cubic invariant of a binary quartic](#cubic-invariant-of-a-binary-quartic), [binary quartic parametrization of e mod 2e](#binary-quartic-parametrization-of-e-mod-2e), `WeierstrassCurve.Affine.μ` (Tau Ceti).

([[12]](#ref-12), Section 3.2, printed p. 13.)

**Checks.**

- For `A = -43`, `B = 42` and `P = (-3, 12)` the square classes of `z(F)` and `(ξ - e_i)` are both `(-1, -1, 1)`.

<a id="local-integral-representatives-of-soluble-quartics"></a>

**Local integral representatives of soluble quartics.** Let p be a prime, A, B in `ℤ_p` with `4A^3 + 27B^2 ≠ 0`, and f a `ℚ_p`-soluble binary quartic over `Q_p` with `I(f) = -48A` and `J(f) = -1728B`. Then f is `PGL2(Q_p)`-equivalent to a binary quartic with coefficients in `ℤ_p` (with the same invariants).

p arbitrary (including 2 and 3): the factor 4 in `F = f_2^2 + 4 f_1 f_3` is what makes the argument uniform at 2. This is the `n = 2` case of the Cremona-Fisher-Stoll Minimisation Theorem (minimal level 0 for soluble models), in the normalization with invariants `(2^4 I, 2^6 J)`.

`Suggested.lean` states this local existence theorem as `BinaryQuartic.exists_integral_local`, including p=2 and p=3.

For the proof, By binary-quartic-parametrization-of-e-mod-2e over `Q_p` (for `E_{-48A,-1728B}`), f ~ `q(P')` for some `P' = (36 ξ, 216 η)`, `P = (ξ, η)` in `E_{A,B}(Q_p)`, or f has a linear factor `(P = O)`. Write P projectively as a primitive vector `(X_0 : Y_0 : ℤ_0)` in `ℤ_p^3` and choose M in `SL3(ℤ_p)` with row 1 equal to it (primitive-vectors-extend-to-special-linear-matrices, applied to the transpose). The Weierstrass cubic o M is integral with `b = 0`; its projection quartic F is integral with invariants `(-48A, -1728B)` and cubic invariant `μ(P')` (cubic-invariant-of-the-projected-quartic). `z(F) = z(q(P')) = z(f)`, so F ~ f by cubic-invariant-determines-the-orbit (`Q_p` is infinite).

*Needs:* [binary quartic parametrization of e mod 2e](#binary-quartic-parametrization-of-e-mod-2e), [primitive vectors extend to special linear matrices](#primitive-vectors-extend-to-special-linear-matrices), [cubic invariant of the projected quartic](#cubic-invariant-of-the-projected-quartic), [cubic invariant determines the orbit](#cubic-invariant-determines-the-orbit), [soluble binary quartic forms](#soluble-binary-quartic-forms), `PadicInt` (Mathlib).

([[12]](#ref-12), Theorem 3.4, printed p. 10; [[12]](#ref-12), Theorem 3.8, printed p. 12.)

**Checks.**

- `y^2 = x^3 - 2` over `Q_2`: the class of `2(3, 5) = (129/100, -383/1000)` is represented by an integral quartic with invariants `(0, 3456)`.

<a id="integrality-from-local-integrality"></a>

**Integrality from local integrality.** Let f be a binary quartic over Q such that for every prime p there is `gamma_p` in `PGL2(Q_p)` with `gamma_p * f` integral over `ℤ_p`. Then there is `γ` in `PGL2(Q)` with `γ * f` integral over `ℤ`.

Twisted action; scalars act trivially, so lattices up to scaling suffice.

For the proof, For almost all p, f is already `ℤ_p`-integral (finitely many denominators); take `γ_p = 1` there. Lift each `γ_p` to `GL2(Q_p)`, using the identity at almost all p, and set `Λ_p=ℤ_p² γ_p`. Choose a positive integer D supported on the finite exceptional set such that `D ℤ_p² ⊂ Λ_p ⊂ D^{-1}ℤ_p²` for all p. Set `Λ={v ∈ D⁻¹ℤ² : v ∈ Λ_p for every p}`. It lies between `D ℤ²` and `D⁻¹ℤ²`. The Chinese remainder theorem on these finite quotient lattices shows `Λ ⊗ ℤ_p = Λ_p` for each p; density at a single prime alone would not establish simultaneous compatibility. `Λ` is free (`ℤ` a PID): `Λ = ℤ² γ` for `γ` in `GL2(Q)`; then `γ_p = k_p γ` with `k_p` in `GL2(ℤ_p)`. `γ * f = k_p^{-1} * (γ_p * f)` is `ℤ_p`-integral for every p (`GL2(ℤ_p)` preserves `V(ℤ_p)`), hence integral.

*Needs:* [pgl2 orbits and stabilizers of binary quartic forms](#pgl2-orbits-and-stabilizers-of-binary-quartic-forms), `Module.free_of_finite_type_torsion_free'` (Mathlib), `PadicInt` (Mathlib), `Padic` (Mathlib).

([[1]](#ref-1), Proposition3.6 and proof, §3.2, pp.24–25, for the local-to-global transporter argument; the CRT lattice argument above also covers degenerate quartics.)

**Checks.**

- If a rational local matrix `γ` at the only bad prime p also belongs to `GL2(ℤ_q)` at every `q ≠ p` (equivalently `γ` and `γ^{-1}` have entries in `ℤ[1/p]`), it works globally. Rationality alone is insufficient: `diag(1/3,1)` is integral and invertible over `ℤ_2`, but sends `x⁴+y⁴` to `x⁴/9+9y⁴`, introducing a denominator at 3.

<a id="integral-representatives-of-locally-soluble-quartics"></a>

**Integral representatives of locally soluble quartics.** Let f in `V_Q` be locally soluble with integral invariants I, J such that `2^4 . 3 | I` and `2^6 . 3^3 | J` (equivalently `I = -48A`, `J = -1728B` with A, B in `ℤ`) and `4I^3 - J^2 ≠ 0`. Then f is `PGL2(Q)`-equivalent to an integral binary quartic form.

Only `ℚ_p`-solubility for every p is used (`ℝ`-solubility is not needed for integrality).

`Suggested.lean` states this global existence theorem as `BinaryQuartic.exists_integral`, assuming solubility at every finite prime and writing the integral invariants as `I=−48A`, `J=−1728B`.

For the proof, Put `A = -I/48`, `B = -J/1728` in `ℤ`. For every p, f is `ℚ_p`-soluble, so local-integral-representatives-of-soluble-quartics gives `gamma_p`. integrality-from-local-integrality.

*Needs:* [local integral representatives of soluble quartics](#local-integral-representatives-of-soluble-quartics), [integrality from local integrality](#integrality-from-local-integrality), [soluble binary quartic forms](#soluble-binary-quartic-forms).

([[1]](#ref-1), Lemma 3.4, printed p. 23.)

**Checks.**

- Every 2-Selmer element of `y^2 = x^3 - 2` is represented by an integral quartic with invariants `(0, 3456)`.

<a id="binary-quartic-parametrization-of-two-selmer"></a>

**Binary quartic parametrization of two selmer.** Let `E = E_{A,B}` : `y^2 = x^3 + Ax + B` with A, B in `ℤ`, `4A^3 + 27B^2 ≠ 0`, and `I = I(E) = -3A`, `J = J(E) = -27B`. Then the elements of the 2-Selmer group of E are in bijection with the `PGL2(Q)`-equivalence classes of locally soluble integral binary quartic forms with invariants `2^4 I = -48A` and `2^6 J = -1728B`. The bijection sends the class of g to `z(g)`, an element of Tau Ceti's `selmerGroup_2` of `E_{2^4 I, 2^6 J}` : `y^2 = x^3 + 1296 A x + 46656 B`, transported to E by the variable change `x ↦ 36x`, `y ↦ 216y`. The integral forms with a rational linear factor and these invariants form one `PGL2(Q)`-class, corresponding to the identity. Stabilizers: `Stab_{PGL2(Q)}(g)` is isomorphic to `E(Q)[2]` for every such g.

A, B integers (the minimal-pair condition is not needed; it pins the curve within its isomorphism class, as in EllipticCurves Layer 8). The rescaling by `2^4`, `2^6` is forced: Lemma 3.4's divisibility hypotheses hold for `(2^4 I, 2^6 J)` and not in general for `(I, J)`. `PGL2(Q)`-classes of rational forms, each represented by integral forms; two integral forms in one class need not be `GL2(ℤ)`-equivalent (the rational-orbit weights used by downstream Selmer means count this).

For the proof, Apply locally-soluble-quartics-and-the-two-selmer-group over Q to `I' = 2^4 I`, `J' = 2^6 J`: locally soluble orbits with these invariants correspond to `selmerGroup_2` of `E_{I',J'}`, the linear-factor orbit to 1. Each such orbit contains an integral form: integral-representatives-of-locally-soluble-quartics `(I' = -48A, J' = -1728B)`. Transport to `E_{A,B}`: `E_{I',J'}` is `E_{A,B}` rescaled by `u = 1/6`; the explicit Selmer group, `μ` and the local conditions are compatible with this variable change (EllipticCurves Layers 6–7, variable-change naturality). Stabilizers: stabilizer-of-a-binary-quartic-is-two-torsion, and `E_{I',J'}(Q)[2] = E(Q)[2]`.

*Needs:* [locally soluble quartics and the two selmer group](#locally-soluble-quartics-and-the-two-selmer-group), [integral representatives of locally soluble quartics](#integral-representatives-of-locally-soluble-quartics), [stabilizer of a binary quartic is two torsion](#stabilizer-of-a-binary-quartic-is-two-torsion), [linear factor forms](#linear-factor-forms), [invariants height and eligible pairs](../ArithmeticStatisticsPartI/README.md#invariants-height-and-eligible-pairs), `WeierstrassCurve.Affine.selmerGroup₂` (Tau Ceti).

([[1]](#ref-1), Theorem 3.5, printed p. 23; [[1]](#ref-1), Theorem 3.5, second paragraph, printed p. 23.)

**Checks.**

- `y^2 = x^3 - x (A = -1, B = 0)`: `Sel_2` has order `4 = #E(Q)[2]`; the classes are those of the integral quartics `q(P')` for the three 2-torsion points and the linear-factor class.

- Scaling check: the quartics with invariants `(I, J)` themselves (without `2^4`, `2^6`) need not have integral representatives.

<a id="comparison-with-the-cohomological-two-selmer-group"></a>

**Comparison with the cohomological two selmer group.** For an elliptic curve `E_{I,J}` over a number field K, the composite of the bijection (locally soluble quartic classes) `→ selmerGroup_2` (locally-soluble-quartics-and-the-two-selmer-group) with the EllipticCurves Layer 7 identification of the explicit etale-algebra 2-Selmer group `selmerGroup_2` with `Sel_2(E/K)` in `H^1(K, E[2])` is a bijection onto `Sel_2(E/K)`; it sends the class of `q(P)` to the Kummer image `δ(P)` and the linear-factor class to 0, so the classes of K-soluble quartics are exactly the image of `E(K)/2E(K)` in `Sel_2` and the locally soluble classes without K-points map onto `Sha(E/K)[2] \ {0}` under `Sel_2 → Sha[2]`.

Uses only the EllipticCurves Layer 7 comparison milestone and exact sequence; no new cohomology is built here.

For the proof, Compose the two bijections; the image of `E(K)/2E(K)`: `z o q = μ` (cubic-invariant-of-the-quartic-of-a-point) and EllipticCurves Layer 7 matches `μ` with the Kummer map. The exact sequence `0 → E(K)/2E(K) → Sel_2 → Sha[2] → 0` (EllipticCurves Layer 7) gives the statement about Sha.

*Needs:* [locally soluble quartics and the two selmer group](#locally-soluble-quartics-and-the-two-selmer-group), [cubic invariant of the quartic of a point](#cubic-invariant-of-the-quartic-of-a-point), `WeierstrassCurve.Affine.selmerGroup₂` (Tau Ceti).

([[17]](#ref-17), Proposition 1.4 and the case `n = 2`, printed p. 10; [[11]](#ref-11), Remarks after Theorem 13, printed p. 11.)

**Checks.**

- For 571a1 over Q: `Sel_2` has order 4, `E(Q)/2E(Q)` is trivial, and the three nonzero classes (Fisher's `g_1`, `g_2`, `g_3`) map onto `Sha[2] \ {0}`.

### 1.8 Ternary-pair embedding and its fibres

<a id="embedding-into-pairs-of-ternary-quadratic-forms"></a>

**Embedding into pairs of ternary quadratic forms.** Let `A_1 = x_1 x_3 - x_2^2` (Gram matrix `antidiag(1/2, -1, 1/2)`) and, for `f = (a, b, c, d, e)` in `V_Z`, `B_f = a x_1^2 + b x_1 x_2 + c x_2^2 + d x_2 x_3 + e x_3^2` (Gram matrix `(a, b/2, 0; b/2, c, d/2; 0, d/2, e)`). Then `φ(f) = (A_1, B_f)` in `W_{ℤ,1} = {(A_1, B)}` (Bhargava-Shankar `(30)`). `φ` is injective, its image is the set of `(A_1, B)` with `B_13 = 0`, and every `F_{ℤ,1}`-class of `W_{ℤ,1}` (`F_{ℤ,1}` the lower unitriangular matrices of `GL2(ℤ)`, acting by `(A_1, B) ↦ (A_1, B + r A_1)`) has a unique representative in the image. `φ` preserves discriminants, and `4 Det(A_1 x - B_f y) = x^3 + c x^2 y + (bd - 4ae) x y^2 + (a d^2 + b^2 e - 4ace) y^3` is the monic cubic resolvent of f (same I, J). With `ρ(γ) = (det γ)^{-1} (a^2, ab, b^2; 2ac, ad + bc, 2bd; c^2, cd, d^2)` for `γ = (a b; c d)`, `ρ` : `GL2(ℤ) → SO(A_1, ℤ)` is a homomorphism and `φ(γ . f) = ρ(γ) . φ(f)` modulo `F_{ℤ,1}`. The induced map psi : `PGL2(ℤ)\V_Z → (GL2(ℤ) x SL3(ℤ))\W_Z` is the composite of the orbit bijection with forgetting the slice.

`ρ` is written in the coordinate order that makes `φ` equivariant for the action `g . B = g B g^T`; the matrix printed as `(31)` in Bhargava-Shankar has the coordinates in the reverse order. The resolvent form is `4 Det(A x - B y)`; the `Det(Ax − By)` printed on p. 16 has leading coefficient `1/4`.

The required API is:

- `BinaryQuartic.veroneseForm`: `A_1 = x_1 x_3 - x_2^2`.

- `BinaryQuartic.embed`: `φ(f) = (A_1, B_f)`.

- `BinaryQuartic.rho`: `ρ` : `GL2(ℤ) → SL3(ℤ)`, in the coordinate order compatible with `(30)`.

- `BinaryQuartic.slice`: `W_{ℤ,1} = {(A, B) : A = A_1}`.

- `φ` is injective.

- The image of `φ` is `{(A_1, B) : B_13 = 0}`.

- Each `F_{ℤ,1}`-class of the slice meets the image of `φ` exactly once.

- `Disc φ(f) = Disc f`.

- `4 Det(A_1 x - B_f y) = x^3 + c x^2 y + (bd - 4ae) x y^2 + (ad^2 + b^2 e - 4ace) y^3`.

- `det ρ(γ) = 1`.

- `ρ(γ)` preserves `A_1`.

- `φ(γ . f) = ρ(γ) . φ(f)` modulo `F_{ℤ,1}`.

- `BinaryQuartic.unipotentT`: The element `(1 1; 0 1)` of `GL2(ℤ)`.

For the proof, `φ` and the slice: explicit; the `(1,3)`-entry of `B + r A_1` is `B_13 + r/2` in half-integral units, so exactly one r makes it 0. Discriminant and resolvent: expand `4 Det(A_1 x - B_f y)` (an integral polynomial identity); its I, J equal `I(f)`, `J(f)` and its discriminant is `disc(f)`. `ρ` is a homomorphism into `SO(A_1)`: `ρ(γ) A_1 ρ(γ)^T = A_1` and `det ρ(γ) = 1` (polynomial identities). Equivariance: `ρ(γ) B_f ρ(γ)^T - B_{γ . f}` is a multiple of `A_1`, proved on the generators `(1 1; 0 1)`, `(0 1; 1 0)`, `(1 0; 0 -1)` of `GL2(ℤ)` and hence for every `γ`.

*Needs:* [pairs of ternary quadratic forms](#pairs-of-ternary-quadratic-forms), [pgl2 orbits and stabilizers of binary quartic forms](#pgl2-orbits-and-stabilizers-of-binary-quartic-forms), [binary quartic form](../ArithmeticStatisticsPartI/README.md#binary-quartic-form), [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), [quartic discriminant is the polynomial discriminant](../ArithmeticStatisticsPartI/README.md#quartic-discriminant-is-the-polynomial-discriminant), `Matrix.SpecialLinearGroup` (Mathlib), `Matrix.SpecialLinearGroup.toGL` (Mathlib).

([[1]](#ref-1), (30)-(31), printed p. 16; [[1]](#ref-1), Section 2.6, printed p. 16; [[1]](#ref-1), Section 2.8, printed p. 21.)

**Checks.**

- The resolvent form of `φ(x^3 y)` is `x^3`.

- `ρ(1 1; 0 1) = (1 1 1; 0 1 2; 0 0 1)`.

- The `x_1^`2-coefficient of `ρ(T) . B_{y^4}` equals that of `B_{(x+y)^4} = B_{T . y^4}`, namely 1; with the printed order of `(31)` it would be 0.

- `φ(x^3 y) = (A_1, x_1 x_2)` with resolvent `x^3`.

- The `x_1^`2-coefficient of `ρ(T) . B_{y^4}` equals that of `B_{(x+y)^4}`, namely 1 (the printed order gives 0).

<a id="special-orthogonal-group-of-the-veronese-form"></a>

**Special orthogonal group of the veronese form.** An element M of `SL3(ℤ)` preserves `A_1 = x_1 x_3 - x_2^2 (M A_1 M^T = A_1)` if and only if `M = ρ(γ)` for some `γ` in `GL2(ℤ)`; `ρ` has kernel {±1}, so it induces an isomorphism `PGL2(ℤ) = SO(A_1, ℤ)`.

The coordinate order of `ρ` as in the embedding node.

For the proof, Over a field K of characteristic not 2: M in `SO(A_1)(K)` preserves the conic `A_1 = 0`, parametrized by `(s : t) ↦ (s^2 : st : t^2)`; M restricted to the conic is `(Q_1 : Q_2 : Q_3)` with `Q_2^2 = Q_1 Q_3` and `Q_1`, `Q_3` coprime binary quadratics, so `Q_1 = L_1^2`, `Q_3 = L_2^2`, `Q_2 = L_1 L_2` up to a scalar, and M agrees with `ρ(γ)` (`γ` given by the linear forms `L_1`, `L_2`) on the conic, which spans `P^2`; hence `M = λ ρ(γ)`, and `det = 1` with `M A_1 M^T = A_1` forces `λ = 1`. Integrality: if `ρ(γ)` is integral with `γ = (a b; c d)` scaled to be a primitive integral matrix, then `ad - bc` divides `a^2`, `b^2`, `c^2`, `d^2`, so every prime dividing `ad - bc` divides a, b, c, d; hence `ad - bc =` ±1 and `γ` is in `GL2(ℤ)`. Kernel: `ρ(γ) = 1` forces `γ` scalar, and scalars in `GL2(ℤ)` are ±1.

*Needs:* [embedding into pairs of ternary quadratic forms](#embedding-into-pairs-of-ternary-quadratic-forms), `Matrix.SpecialLinearGroup` (Mathlib).

([[1]](#ref-1), Section 2.6, printed p. 16; [[16]](#ref-16), Lemma 3.2, printed p. 6.)

**Checks.**

- `ρ(-1) = 1`.

- `ρ(0 1; 1 0)` reverses the coordinates up to sign and preserves `A_1`.

<a id="orbit-bijection-for-the-embedding"></a>

**Orbit bijection for the embedding.** The map `φ` induces a canonical bijection between `PGL2(ℤ)`-orbits on `V_Z` and `F_{ℤ,1} x SO(A_1, ℤ)`-orbits on `W_{ℤ,1}`. Equivalently: f and g are `GL2(ℤ)`-equivalent iff there are M in `SL3(ℤ)` preserving `A_1` and r in `ℤ` with `B_g = r A_1 + M B_f M^T`.

`F_{ℤ,1}` (acting on the pair) and `SO(A_1, ℤ)` (acting on the variables) commute.

For the proof, `φ` induces a bijection `V_Z → F_{ℤ,1}\W_{ℤ,1}` (embedding node). This bijection intertwines `γ` with `ρ(γ) (embed_smul)`, and `ρ(GL2(ℤ)) = SO(A_1, ℤ)` (special-orthogonal-group-of-the-veronese-form); so orbits correspond.

*Needs:* [embedding into pairs of ternary quadratic forms](#embedding-into-pairs-of-ternary-quadratic-forms), [special orthogonal group of the veronese form](#special-orthogonal-group-of-the-veronese-form).

([[1]](#ref-1), Theorem 2.14, printed p. 16.)

**Checks.**

- `x^3 y` and `x^3 y + x y^3` are not equivalent, and neither are their images.

<a id="fibres-of-the-embedding-are-uniformly-bounded"></a>

**Fibres of the embedding are uniformly bounded.** Let N be an upper bound for #{`(x, y)` in `ℤ^2` : `g(x, y) = 1`} over all integral binary cubic forms g of nonzero discriminant (`N = 12` by Delone and Evertse; `N = 10` by Bennett [80], Theorem1.4, p.1509). An element of `(GL2(ℤ) x SL3(ℤ))\W_Z` of nonzero discriminant has at most 2N preimages in `PGL2(ℤ)\V_Z` under psi.

Nonzero discriminant. The source states the bound `12 = N`; its argument gives 2N. Any uniform bound suffices for Bhargava-Shankar Theorem 2.20 and the uniformity estimate.

For the proof, By orbit-bijection-for-the-embedding it suffices to bound the `F_{ℤ,1} x SO(A_1, ℤ)`-classes in `W_{ℤ,1}` inside `a GL2(ℤ) x SL3(ℤ)`-orbit w; fix `(A_1, B_0)` in w and let `g = 4 Det(A_1 x - B_0 y)` (monic). An element `(A_1, B) = (g_2, g_3) . (A_1, B_0)` of the slice has first form `p A_1 + q B_0` transformed to `A_1`, so `4 Det(p A_1 + q B_0) = 1`, i.e. `g(p, -q) = 1` for the first row `(p, q)` of `g_2` (`4 Det` is multiplied by `det(g_3)^2 = 1`). Two such elements with the same first row differ by `g_2' g_2^{-1} = (1 0; r s)` with `s =` ±1 and by an element of `SO(A_1, ℤ)`: for `s = 1` they are `F_{ℤ,1} x SO(A_1, ℤ)`-equivalent, for `s = -1` they differ by `(A_1, B) ↦ (A_1, -B)` (the forms f and -f). Hence the number of classes is at most `2 #{(x, y) : g(x, y) = 1} ≤ 2N`.

*Needs:* [orbit bijection for the embedding](#orbit-bijection-for-the-embedding), [pairs of ternary quadratic forms](#pairs-of-ternary-quadratic-forms), DiophantineApproximationAndTranscendence §4.3 (Thue finiteness); the displayed uniform bound N is an additional hypothesis.

([[1]](#ref-1), Proposition 2.16 and proof, printed p. 17; [[1]](#ref-1), Proof of Proposition 2.16, printed p. 17.)

**Checks.**

- For f with `J(f) ≠ 0`, f and -f are distinct classes in the same fibre `(J(-f) = -J(f))`.

- For the resolvent `x^3 - x^2 y - 2 x y^2 + y^3` (disc 49, 9 solutions of `g = 1` ([80], p.1510), automorphism group of order 3) the fibre has at most 18 elements by this argument.

- Taking `N=10` gives the uniform bound 20; `N=12` gives 24. The orbit argument retains N as a hypothesis.



### 1.9 Coefficient boxes and local discriminants

<a id="binary-quadratic-order-and-local-maximality"></a>

**Binary quadratic order and local maximality.** For a binary quadratic `f=ax²+bxy+cy²` over a commutative ring D, construct the rank-two algebra `D[t]/(t²+bt+ac)` with basis `(1,t)` and discriminant `b²−4ac`. Over `Z_p`, use finite-rank localization maximality. The order is nonmaximal exactly when some `r mod p` satisfies `p|(2r+b)` and `p²|(r²+br+ac)`. The second condition is independent of the lift of r under the first. This criterion includes nonunit or zero leading coefficient a. Prove its maximality proportion over the three coefficient coordinates is `β₂(p)=(1−p⁻¹)(1+p⁻¹−p⁻³)`, including `β₂(2)=11/16`.

For the proof, an index-p overring has basis `1,(t−r)/p`; expanding its square gives the two divisibility conditions. Every proper quadratic overorder contains one of index p by the scalar-first Smith basis. Count the resulting residue classes modulo p², or split by the multiplicity of the projective root at infinity as in Proposition A.2. Degenerate discriminant is included in the ring construction and maximality predicate.

*Needs:* Mathlib `AdjoinRoot`, `Algebra.discr`; ArithmeticStatisticsPartI “Cubic supplier conventions” (finite-rank localization maximality); [full-lattice order comparison](#full-lattice-order-comparison) on the nonzero-discriminant locus.

([[59]](#ref-59), Appendix A, Proposition A.2 and its degree-two computation, pp.54–55; the quadratic presentation and overring criterion follow by the displayed basis calculation.)

**Checks.**

- The nonmonic form `xy` has algebra `D[t]/(t²+t)≃D×D`, discriminant 1, and is maximal over `Z_p` for every p.
- For odd p, `x²−py²` gives the ramified maximal order `Z_p[t]/(t²−p)`; at p=2, `x²−2y²` is maximal by the same criterion.
- The form `x²−p²y²` has the proper index-p overring generated by `t/p`, so it is nonmaximal despite defining a rank-two algebra.

<a id="binary-density-formulas"></a>

**Binary density formulas.** For `n≥2`, `α₂(2)=1/2` and `α_n(2)=3/8` for `n≥3`. For odd p, `α₂(p)=(1−p^−1)(1+p^−1−p^−3)`, `α₃(p)=(1−p^−1)²(1+p^−1)²`, and `α_n(p)=(1−p^−1)²(1+p^−1)(1+p^−1−p^−2)` for every `n≥4`. The density of p-maximal rank-n binary-form rings is `β₂(p)=(1−p^−1)(1+p^−1−p^−3)` and `β_n(p)=(1−p^−2)(1−p^−3)` for `n≥3`, at every prime. The special printed degree-four `α` formula is replaced by the `n≥4` formula.

For n=2 use the quadratic order and criterion immediately above. For `n≥3` consume Part I’s binary form order only with `f₀≠0` and `Δ≠0`. In the coefficient Haar space the excluded loci `f₀=0` and `Δ=0` have measure zero: a nonzero polynomial over `Q_p` has zero set of additive Haar measure zero, by induction on the number of coordinates and Fubini. Prove this comparison before transferring the order density to the full coefficient space.

The required API is:

- For [binary local proportion](../ArithmeticStatisticsPartI/README.md#binary-local-proportion), prove the prime-2 formula with separate degree-two and degree `≥3` cases.

For the proof, Partition into `a₀` unit; `a₀∈p`,`a₁` unit; and `a₀`,`a₁∈p`. For odd p their contributions are `(1−p^−1)λ_n`, `p^−1(1−p^−1)λ_{n−1}`, and `p^−2(1−p^−1)²ν₀(n−2,p)`. Substitute corrected `ν₁`; degree zero has `ν₀=1`. At 2 use the mod-4 restriction and squarefree projective root count. For `β`, the local order criterion at a root of ∞ of multiplicity `≥2` is failure of `p²|a₀`; sum over its multiplicity.

*Needs:* [binary quadratic order and local maximality](#binary-quadratic-order-and-local-maximality); [binary local proportion](../ArithmeticStatisticsPartI/README.md#binary-local-proportion), [monic density formulas](../ArithmeticStatisticsPartI/README.md#monic-density-formulas), [local maximality](../ArithmeticStatisticsPartI/README.md#local-maximality), [binary form order](../ArithmeticStatisticsPartI/README.md#refinement-binary-form-order).

([[59]](#ref-59), Appendix A Propositions A.1–A.2 pp.53–55.)

**Checks.**

- At `(n,p)=(4,3)`, `α=176/243`: exactly 42,768 of the `9⁵` coefficient tuples modulo 9 have discriminant not divisible by 9. The degree-four odd factor agrees with `n≥5` after correction.

- At `(n,p)=(4,2)`, `α=3/8`: exactly 384 of the `4⁵` coefficient tuples modulo 4 have discriminant not divisible by 4.

- In degree two at `p=2`, `α₂(2)=1/2` whereas `β₂(2)=11/16`. Squarefree discriminant and maximality are different local predicates.

- In degree three at `p=3`, `α₃(3)=64/81` whereas `β₃(3)=208/243`. Substituting the degree`≥4` squarefree formula in degree three gives the wrong factor.

### 1.10 Integral quintic multiplication and sextic resolvents

<a id="refinement-quintic-multiplication"></a>

**Quintic multiplication.** For the integral alternating quadruple A, construct the commutative ring `R(A)` on `Z⁵` with identity `e₀` and the usual additive group. Normalize `c¹₁₂=c²₁₂=c³₃₄=c⁴₃₄=0`. The remaining nonconstant coefficients in `e_i e_j` are the unique solution of HCL `IV (21)`, with permutation signs and bracket denominators cancelled as integral polynomials. Define `c⁰_ij=Σ_{r=1}⁴(cʳ_jk cᵏ_ri−cʳ_ij cᵏ_rk)`, choosing `k≠i`; this is independent of that choice. The multiplication is associative at every A, including `A=0`.

A has zero diagonal and opposite off-diagonal entries; characteristic two is handled by the integral polynomial specialization.

The required API is:

- `ArithmeticOrbitRefinement.quinticRing`: Return a commutative ring structure on the coordinate carrier `Z⁵`.

- `ArithmeticOrbitRefinement.quinticRing_add`: Its addition is componentwise and its identity is `e₀`.

- `ArithmeticOrbitRefinement.quinticCoeff_scale`: `A↦tA` scales each nonconstant normalized structure coefficient by `t⁵`, and each constant coefficient by `t¹⁰`.

For the proof, Use `Q(X,Y)=Q(X+Y)−Q(X)−Q(Y)` from the Pfaffian covariant. The bracket is `Q(A_i,A_j)ᵀ A_k Q(A_l,A_m)`. Repeated indices give divisibility by two or four before specializing. Solve `(21)` with the four normalization constraints, then impose the constant-coefficient associativity equation. Prove the remaining identities as universal integral polynomial identities, first on the dense nondegenerate locus and then identically.

*Needs:* [quadruples of quinary alternating forms](#quadruples-of-quinary-alternating-forms), `Matrix.det` (Mathlib), `Algebra.trace` (Mathlib).

([[71]](#ref-71), §4, (16)–(22), pp.67–69.)

**Checks.**

- At `A=0`, `e_i e_j=0` for all i,`j>0`, so `R(0)=ℤ⊕ℤ⁴` with square-zero augmentation ideal.

- For every A, `e₀ e_i=e_i`; using the all-ones vector as identity fails this test.

- Take `A₁=E₁₂−E₂₁+E₃₄−E₄₃`, `A₂=E₄₅−E₅₄`, `A₃=E₁₂−E₂₁+E₃₅−E₅₃`, `A₄=0`. The coefficient of `e₄` in `e₁e₃` is 1, by `(19)`.

<a id="refinement-sextic-multiplication"></a>

**Sextic multiplication.** Construct `S(A)` on `Z⁶` with the usual addition and identity `e₀`. Form the `4×4` determinants `δ` of the four coefficient rows of A. Use the cubic contractions D of `(35)`, but only the integral combinations specified in `(36)`: individual D expressions need not be integral. Normalize `d¹₁₂=d²₁₂=d³₃₄=d⁴₃₄=d⁴₄₅=0` and recover constant terms from the associative equation `(38)`, choosing `k≠i`. The resulting table is integral and associative for all A. Its discriminant is `(16 Disc(R(A)))³`.

The identity and all six coordinates are retained. No nonzero-discriminant assumption is made for the polynomial table.

The required API is:

- `ArithmeticOrbitRefinement.sexticRing`: Return the commutative ring structure on `Z⁶` associated to A.

- `ArithmeticOrbitRefinement.sexticRing_add`: The addition is componentwise and the identity is `e₀`.

- `ArithmeticOrbitRefinement.sextic_discriminant`: `Disc S(A)=4096(Disc R(A))³`.

For the proof, The `δ` determinants are degree four. Lemma7 identifies the degree-twelve integral combinations as multiplication indices on the nondegenerate resolvent lattice. Normalization fixes translation ambiguity. Extend the table identities and discriminant identity polynomially to the zero-discriminant locus.

*Needs:* [quintic multiplication](#refinement-quintic-multiplication), `Matrix.det` (Mathlib), `Algebra.trace` (Mathlib).

([[71]](#ref-71), §6, (34)–(38), Lemma7, pp.77–79; (33), p.76.)

**Checks.**

- For `A=0`, all products `e_i e_j` with i,`j>0` vanish.

- The identity is `e₀`, and `e₀ e₅=e₅`.

- If `Disc R(A)=1`, `Disc S(A)=4096`, so `S(A)` cannot be the split ring `Z⁶` of discriminant 1.

<a id="refinement-based-sextic-resolvent"></a>

**Based sextic resolvent.** For based quintic and sextic rings R,S with scalar-first normalized bases, a resolvent map is a ℤ-linear `φ:R/ℤ→∧²(S/ℤ)`. Its 40 coordinates form the quadruple A. Require that the normalized multiplication tables recovered from A equal the given tables of both R and S. Based changes use `GL₄(ℤ)×SL₅(ℤ)`, after compatible orientations are chosen. This defines the all-discriminant resolvent data; an abstract sextic ring without `φ` does not suffice.

Ranks 5 and 6 with primitive scalar vector in each chosen basis. Bases and orientation convention are explicit.

The required API is:

- `ArithmeticOrbitRefinement.IsBasedSexticResolvent`: For a coefficient quadruple A and normalized coordinate ring structures R,S, the condition is `R=R(A)` and `S=S(A)`. This coordinate predicate represents `φ` through its coefficients.

- `ArithmeticOrbitRefinement.basedSexticResolvent_self`: The pair `R(A)`,`S(A)`, with map having coordinates A, is resolvent data.

- `ArithmeticOrbitRefinement.basedSexticResolvent_disc`: Resolvent data satisfies `Disc S=4096(Disc R)³`.

For the proof, Identify `R/ℤ` and `S/ℤ` with their free coordinate modules through the chosen bases. Use the native exterior-power wedge basis to read `φ` as 40 coefficients. Compare multiplication and identity, rather than requiring equality of carrier types. Independence of normalized lifts follows from the translation rules in §§4 and6.

*Needs:* [quintic multiplication](#refinement-quintic-multiplication), [sextic multiplication](#refinement-sextic-multiplication), `exteriorPower.ιMulti` (Mathlib), `exteriorPower.map` (Mathlib).

([[71]](#ref-71), Definitions10–11, §9, pp.82–83.)

**Checks.**

- `A=0` gives resolvent data between the two square-zero rings of ranks 5 and6.

- At `A=0` keep `R=Z⊕Z⁴` square-zero and replace S by `Z[t]/(t⁶)` in its scalar-first power basis. Both sextic discriminants are zero, but `e₁²=e₂` in the replacement and zero in `S(0)`, so `IsBasedSexticResolvent` rejects it.

- At `A=0` keep `S=S(0)` and replace R by `Z[t]/(t⁵)` in its scalar-first power basis. Its nonzero nilpotent products force rejection despite equal zero discriminants.

<a id="rational-quintic-symmetric-closure"></a>

**Rational quintic symmetric closure.** For every degree-five finite étale Q-algebra L, construct `ArithmeticOrbitRefinement.quinticSymmetricClosure` as the Q-algebra of Galois-equivariant Qˢ-valued functions on the Galois set of bijective labelings of the five embeddings of L into Qˢ. It has dimension 120, with S₅ acting by permutation of labels. Evaluation of a labeled embedding gives five Q-algebra embeddings of L into this closure. For the order-20 subgroup `F₂₀⊂S₅`, construct its fixed algebra of dimension six and identify its geometric factors with the supplied six-element resolvent Galois set. Comparison with a specialized resolvent polynomial retains the supplier’s separation hypothesis.

Prove independence of the separable closure, compatibility with field extension and trace: each labeled copy of L has relative degree 24 in the closure, and the fixed algebra has relative degree 20. Thus absolute traces of embedded elements multiply by 24 and 20 respectively. The construction accepts product algebras, without choosing a field normal closure.

For the proof, Apply finite étale descent to the algebra of functions on the 120 labelings. The commuting Galois and S₅ actions descend the labeled embeddings and identify fixed functions with functions on the six F₂₀-orbits. Over a splitting field all trace assertions are sums over finite sets.

*Needs:* PolynomialGaloisGroups Layers 0,2,4,6 (permutation actions and the six-element resolvent); SchemeAndStackFoundations Layers 0–2 (finite étale descent); Mathlib `Algebra.trace`.

([[71]](#ref-71), §§5.1–5.2, pp.71–73.)

**Checks.**

- For `L=Q⁵`, the closure is `Q¹²⁰` and its F₂₀-fixed algebra is `Q⁶`; a field normal closure cannot supply this input.
- For a cyclic quintic field L, the closure is a product of 24 copies of L; the six-element resolvent algebra is `Q×L`, from one fixed point and one orbit of length five.
- After extension to a separable closure, each of the five labeled embeddings repeats each coordinate 24 times. The closure trace of 1 is 120, whereas the fixed-algebra trace of 1 is 6.

<a id="refinement-nondegenerate-resolvent-comparison"></a>

**Nondegenerate resolvent comparison.** For `Disc R≠0`, compare the all-discriminant map definition with a rank-six lattice S in the M-fixed part of the rational `S₅`-closure, where M is the order-20 metacyclic subgroup. Require 1 primitive, `Disc S=(16 Disc R)³`, and integral image of the alternating trace-dual map `g:∧²(ann(1)⊂S*)→ann(1)⊂R*`. With compatible oriented bases, its coordinates recover R and S and the lattice is closed under multiplication. The image condition and discriminant condition are both necessary.

Nonzero discriminant; the rational `S₅`-closure and its permutation labels are specified.

For the proof, The alternating trilinear determinant f of `(23)`, divided by 16 Disc R, is integral exactly when its orientation-dual bilinear map g is integral. The trace-zero dual modules have ranks four and five. Formula `(32)` and compatible orientations recover the quintic table; Lemma7 recovers the sextic table and proves ring closure.

*Needs:* [rational quintic symmetric closure](#rational-quintic-symmetric-closure); [full-lattice order comparison](#full-lattice-order-comparison); [based sextic resolvent](#refinement-based-sextic-resolvent), `Algebra.trace` (Mathlib), `exteriorPower.map` (Mathlib).

([[71]](#ref-71), Definition5, Proposition6, §§5.3–7, pp.73–80.)

**Checks.**

- The sextic discriminant is a cube with the factor 16 present.

- The map targets the annihilator of 1 in the dual, not the quintic ring itself.

- For `R=Z⁵`, the sextic lattice has discriminant 4096, while the maximal split order `Z⁶` has discriminant 1; replacing the lattice by its rational algebra loses the comparison.

<a id="refinement-integral-quintic-realization"></a>

**Integral quintic realization.** An integral set of normalized nonconstant quintic structure coefficients that occurs among the `SL₅` invariants of a complex alternating quadruple has an integral quadruple with those same coefficients. Applied to quintic rings, this supplies the existence part imported from the correspondence.

The integral coefficients belong to the complex invariant image; associativity alone must first be proved to imply this.

First prove the supporting targets `ArithmeticOrbitRefinement.quinticComplexRealization` and `ArithmeticOrbitRefinement.quinticRationalRealization`. For `K=C` and `K=Q` respectively, every commutative associative unital K-algebra on `K⁵` with scalar-first basis and normalized coefficients `c¹₁₂=c²₁₂=c³₃₄=c⁴₃₄=0` is `R(A)` for an alternating quadruple A over K, with every normalized nonconstant coefficient unchanged. Neither target assumes nonzero discriminant. The complex statement supplies the invariant-image hypothesis for a quintic ring after base change; the rational statement supplies the rational quadruple needed by Lemma14. Construct the étale case from the trace-dual resolvent and prove the nonétale cases by decomposing into local Artinian factors and treating their nilpotent multiplication types. These are realization targets, not an assumption that a complex solution descends to Q. HCL IV §10, p.84 states both assertions but omits the nonétale rational proof; completing that case analysis is part of `quinticRationalRealization`.

For the proof, Lemma13 produces coefficients multiplied by an integer through row/column scaling after finding a common isotropic pair. Apply `quinticRationalRealization` before Lemma14 clears rational denominators up to a multiplier. Lemma15 lowers a positive multiplier at a prime through its two Pfaffian normal forms. Induction yields multiplier one. In the common-isotropic-pair argument choose v in the left kernel of `A₁` and intersect the kernels of `vᵀA₂`,`vᵀA₃`,`vᵀA₄`; three linear conditions leave dimension at least 2 and include v.

*Needs:* [quintic multiplication](#refinement-quintic-multiplication), [rational quintic symmetric closure](#rational-quintic-symmetric-closure), [nondegenerate resolvent comparison](#refinement-nondegenerate-resolvent-comparison) (étale realization), `Basis` (Mathlib).

([[71]](#ref-71), Theorem12 and Lemmas13–15, §§10–11, pp.83–88.)

**Checks.**

- The chosen integral realization preserves every normalized coefficient, not merely the discriminant.

- Scaling all four matrices by n alone gives `n⁵` coefficients and does not prove Lemma13.

- The normalized basis `(1,t,t²,t³,t⁴)` of `Q[t]/(t⁵)` has zero discriminant and still requires a rational realization. An argument using only the étale trace-dual construction leaves this case untreated.

- The square-zero algebra `ℚ⊕ℚ⁴` has realization `A=0`, whereas the split algebra `Q⁵` has discriminant 1 and requires a nonzero tensor. Preserving only the algebra dimension cannot satisfy the realization target.

<a id="refinement-quintic-minimal-model"></a>

**Quintic minimal model.** For a nondegenerate rational alternating quadruple, minimal absolute integral discriminant in its `GL₄(Q)×GL₅(Q)`-orbit corresponds to the maximal quintic order. For a fixed maximal quintic ring and fixed normalized quotient basis, its integral realizations form a single `SL₅(ℤ)`-orbit. This strengthens the parent’s unbased `GL₄(ℤ)×SL₅(ℤ)` uniqueness with the basis fixed.

Nonzero discriminant; minimality uses the full `GL₅` rational action, for the full rational representation.

For the proof, Use the 252 maximal minors of the five Pfaffian quadrics: divisibility at a prime either exhibits content or the alternative normal form yielding an overring with quotient `(ℤ/pZ)³`. Maximality excludes both. The quadrics then span the saturated integral lattice in their common rational plane, so the transition matrix is integral unimodular.

*Needs:* [quintic multiplication](#refinement-quintic-multiplication), [integral quintic realization](#refinement-integral-quintic-realization), [sextic multiplication](#refinement-sextic-multiplication), [full-lattice order comparison](#full-lattice-order-comparison).

([[71]](#ref-71), Lemma16, Theorem17 and Corollaries18–19, pp.88–89.)

**Checks.**

- The maximality congruences, including primes2 and3, are retained.

- No uniqueness claim is made for arbitrary nonmaximal rings.

- A proper overorder of index p has smaller absolute discriminant by the factor `p²`, so its integral realization prevents minimality.

<a id="bhargava-parametrization-of-quintic-rings"></a>

**Bhargava parametrization of quintic rings.`** (a)` There is a canonical bijection between `GL4(ℤ) x SL5(ℤ)`-orbits on `V(ℤ) = ℤ^4` tensor wedge`^2 ℤ^5` and isomorphism classes of pairs `(R, S)` with R a quintic ring and S a sextic resolvent ring of R (HCL IV Theorems 1 and 8; for nondegenerate pairs `Disc(A) = Disc(R) = (1/16) Disc(S)^{1/3}`); the sextic resolvent is defined by HCL IV Definitions `10-11` (a sextic ring S with a ℤ-linear map `φ` : `R/ℤ →` wedge`^2(S/ℤ)` such that `R(φ) = R` and `S(φ) = S`). `(b)` Every quintic ring is `R(A)` for some A, so every quintic ring has a sextic resolvent (Theorem 17, Corollary 18). `(c)` If R is maximal, A is unique up to `GL4(ℤ) x SL5(ℤ)`, so a maximal quintic ring has a unique sextic resolvent (Theorem 17, Corollary 19). `(d)` The classical resolvent map of Cayley is 4 times the sub-Pfaffian covariant (Theorem 9).

The multiplication tables of `R(A)` (HCL IV Section 4, `(16)-(25)`) and `S(A)` (Section 6) are part of the statement; they are specified by the source and not re-derived here.

For the proof, From A, Lemma 4 expresses the determinants built from conjugates through the invariants `P^+`, `P⁻` and the brackets `{ijklm}`, which determines the normalized structure constants of `R(A)` (Section 4) and of `S(A)` (Section 6). The fundamental map g : wedge`^2 S`~ `→ R`~ realizes the inverse (Sections 5 and 7), giving Theorem 8 for nondegenerate elements; the appendix-style Definitions `10-11` extend it to all elements (Section 9). Existence and uniqueness for maximal rings: the invariant theory of Section 10 (Theorem 12 and Lemmas `13-16`) constructs an integral A with prescribed structure constants and shows uniqueness when R is maximal (minimal integral model), giving Theorem 17 and Corollaries `18-19`.

*Needs:* [based sextic resolvent](#refinement-based-sextic-resolvent), [nondegenerate resolvent comparison](#refinement-nondegenerate-resolvent-comparison), [integral quintic realization](#refinement-integral-quintic-realization), [quintic minimal model](#refinement-quintic-minimal-model); [quadruples of quinary alternating forms](#quadruples-of-quinary-alternating-forms), [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring).

([[10]](#ref-10), Theorem 1, printed p. 54; [[10]](#ref-10), Theorem 2 and Corollary 3, printed p. 55.)

**Checks.**

- `ℤ^5` corresponds to the quadruple whose sub-Pfaffians vanish at five points of `P^3` in general position.

- A maximal quintic ring has exactly one sextic resolvent.

- The zero quadruple gives the two square-zero rings, with their zero resolvent map; the correspondence includes this discriminant-zero pair.

<a id="maximality-of-quintic-rings-at-p"></a>

**Maximality of quintic rings at p.** For A in `V(ℤ)`, `R(A)` is maximal iff A is in `U_p` for every prime p, where `U_p` is the union of the seventeen sets `U_p(σ)` of elements of splitting type `σ` whose ring is maximal at p (defined by congruence conditions modulo `p^2`); `R(A)` is maximal exactly when A is a minimal integral model (smallest nonzero absolute discriminant in its `GL4(Q) x GL5(Q)`-orbit meeting `V(ℤ)`).

p prime; nondegenerate A. Minimality is in the full `GL4(Q) x GL5(Q)` orbit and orders by absolute discriminant. Restricting to `GL4(Q) x SL5(Q)` only allows discriminants to scale by tenth powers and can miss an overring of index p.

For the proof, For a proper finite p-primary overring R′, choose `m ≥ 1` minimal with `p^m R′` contained in R. Then `S = R + p^(m−1)R′` is a proper overring with pS contained in R. Smith normal form on `R/ℤ` inside `S/ℤ` gives four shapes, of indices p,`p²`,`p³`,`p⁴`, dividing a nonempty subset of the four nonconstant basis vectors by p. Ring closure is detected by structure-constant congruences modulo `p²`. Use the polynomial multiplication table and normalize determinant units before lifting elementary basis changes from `ℤ/p²Z` to `ℤ`. Section 12 supplies the splitting-type decomposition; it does not state the erroneous three-shape index-p assertion. Theorem 12 and Lemma 16 (minimal integral models) give maximality iff minimality.

*Needs:* [quintic minimal model](#refinement-quintic-minimal-model), [quintic multiplication](#refinement-quintic-multiplication), [full-lattice order comparison](#full-lattice-order-comparison); [bhargava parametrization of quintic rings](#bhargava-parametrization-of-quintic-rings), [quadruples of quinary alternating forms](#quadruples-of-quinary-alternating-forms), [cubic ring](../ArithmeticStatisticsPartI/README.md#cubic-ring).

([[10]](#ref-10), Theorem 21, printed p. 92.)

**Checks.**

- Elements with `p^2` not dividing `Disc(A)` are in `U_p`.

- An overorder of index p lowers the discriminant by `p²`, even though this scaling need not be a tenth power; the full rational `GL₅` factor is needed.

- The zero quadruple is excluded from the minimal-nonzero-discriminant criterion.

### 1.11 Monogenized cubic resolvents

<a id="refinement-monogenized-resolvent"></a>

**Monogenized resolvent.`** A` monogenization of a cubic ring C is an element `ω` modulo `ℤ·1` with a lift w such that 1,w,`w²` is a ℤ-basis. Two lifts differing by an integer define the same monogenization. For a quartic ring, retain the full cubic-resolvent map and orientation as well as this monogenization. Isomorphisms must preserve `ω`, rather than merely the underlying monogenic ring.

C is free of rank3 over `ℤ`; no discriminant restriction.

The required API is:

- `ArithmeticOrbitRefinement.IsMonogenizing`: For a cubic ℤ-algebra C and `w∈C`, 1,w,`w²` are ℤ-linearly independent and span C.

- `ArithmeticOrbitRefinement.monogenizing_translate`: `IsMonogenizing(w+k)=IsMonogenizing(w)` for `k∈ℤ`.

- `ArithmeticOrbitRefinement.monogenizing_adjoin`: A monogenizing w satisfies `ℤ[w]=C`.

For the proof, Translate the lift and compare the three power-basis columns by a unipotent integer matrix. The same determinant-one calculation gives the subgroup N of changes fixing the first quotient basis vector.

*Needs:* [quartic ring and cubic resolvent](#quartic-ring-and-cubic-resolvent), `Basis` (Mathlib), `Algebra.adjoin` (Mathlib), `AdjoinRoot` (Mathlib), `LinearIndependent` (Mathlib).

([[72]](#ref-72), Defining paragraph p.5, Proposition2.3 p.6 and Proposition4.1 p.7.)

**Checks.**

- In `ℤ[t]/(t³)`, t is monogenizing.

- In `ℤ[t]/(t³)`, `t+1` is monogenizing and gives the same quotient generator class.

- In `ℤ[t]/(t³)`, `t²` is not monogenizing: its square is zero and its power basis misses t.

<a id="refinement-wood-ring-interpretation"></a>

**Wood ring interpretation.** The `PGL₂(ℤ)`-orbit embedding into pairs of ternary integral quadratic forms has the following ring interpretation: its image parametrizes quartic rings equipped with a monogenized cubic resolvent. For Wood’s ordinary `GL₂(ℤ)` action the determinant-square twist is trivial on integral unimodular matrices, and scalar `−1` acts trivially on quartics. Thus Wood’`s GL₂(ℤ)`-orbit set is the `PGL₂(ℤ)`-orbit set. Transport the generator class and cubic-resolvent map through the induced cubic basis change; the ring discriminant is preserved.

Integral unimodular groups; this equivalence of action conventions is not asserted over arbitrary fields.

For the proof, Wood uses `A₀=z²−xy`, with `4det A₀=−1`, and `B=e x²+a y²+c z²+d xz+b yz`. Substitute `(x,y,z)=(z′,x′,y′)`, a determinant-one cyclic permutation: `A₀` becomes `y′²−`x′z′`=−A₁` and B becomes `a x′²+b` x′y′`+c y′²+d` y′z′`+e z′²`. Then apply `diag(−1,1)` to the pair of forms to obtain `(A₁,B)`. This is `a GL₂×SL₃` adapter, not a congruence of `A₀` to `A₁`: `4det A₁=+1`. The induced cubic-ring basis change must also transport the chosen resolvent generator. Independently, Wood’s cubic multiplication convention is converted to the one here by negating both nonconstant basis vectors. Monogenization first gives a form integrally congruent to Wood’`s A₀`; apply the full pair adapter only after that normalization. The stabilizer calculation then identifies the two orbit problems, retaining the corrected quartic multiplication and the minus sign in 4det(`Ax−`By).

*Needs:* [monogenized resolvent](#refinement-monogenized-resolvent), [embedding into pairs of ternary quadratic forms](#embedding-into-pairs-of-ternary-quadratic-forms), [orbit bijection for the embedding](#orbit-bijection-for-the-embedding), GeometryOfNumbersAndQuadraticArithmetic Layers 0–1.

([[72]](#ref-72), Theorems1.1,2.5,3.1; Lemma3.2; §5 proof, pp.1,6–8.)

**Checks.**

- Dropping the generator class loses information and changes the orbit problem.

- Wood’`s A₀` and the Veronese `A₁` are related by the cyclic permutation and first-form negation above. The two determinants `−1` and `+1` forbid an integral unimodular congruence of the first forms alone.

- At `f=0` the resolvent is `ℤ[t]/(t³)`, with its monogenizing class. This degenerate quartic remains in the ring dictionary; a separability restriction would incorrectly delete it.

### 1.12 Symmetric pencils and Jacobian torsors

Consume ArithmeticStatisticsPartI §0.22’s `ArithmeticOrbitRefinement.pencilInvariant`, `pencilInvariant_congr` and `pencilInvariant_scalar`; this part introduces no second determinant-coefficient API. Its supplier Checks retain `(a,−b)` at n=1, `−x³` for `(I₃,0)`, zero for the positive-dimensional zero pair, and `(1)` at n=0.

<a id="refinement-common-isotropic"></a>

**Common isotropic.** For any field K, `n×n` matrices A,B and `r≥0`, define `F_r(K)` to be the set of dimension-r K-submodules `U⊂Kⁿ` on which both bilinear forms vanish identically. This coordinate definition includes degenerate pencils and nonsymmetric matrices. Use full bilinear restriction on U, including all mixed values.

The required API is:

- `ArithmeticOrbitRefinement.commonIsotropic`: Return the set of rank-r submodules with both bilinear restrictions zero.

- `ArithmeticOrbitRefinement.commonIsotropic_congr`: Congruence by an invertible matrix transports common isotropic subspaces by the inverse transpose.

- `ArithmeticOrbitRefinement.commonIsotropic_zero`: For the zero pencil the set consists of every dimension-r subspace.

For the proof, The coordinate predicate is finite rank and `∀ u,v ∈ U, uᵀAv=uᵀBv=0`. Transport both bilinear restrictions under inverse-transpose change of subspace and compute the zero-pair restrictions directly.

*Needs:* [symmetric pencil](../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil), `Submodule.span` (Mathlib), `Module.finrank` (Mathlib), `Matrix.toLin'` (Mathlib).

([[73]](#ref-73), §4, pp.12–13, before Theorem23.)

**Checks.**

- Every line in `K³` is common isotropic for `(0,0)`.

- For `(I₃,0)` over R there is no common isotropic line.

- If the first `g×g` blocks of both matrices vanish, the span of the first g coordinate vectors is common isotropic. Over Q, the line spanned by `(1,0,0)` works for the two nonzero matrices `A=[[0,1,0],[1,0,0],[0,0,1]]`, `B=[[0,0,1],[0,1,0],[1,0,0]]`.

- In characteristic two, `A=[[0,1],[1,0]]` has `uᵀAu=0` for every u, but `e₀ᵀAe₁=1`. The whole two-dimensional space is therefore not common bilinear-isotropic for `(A,0)`.

- At `n=r=0` the set contains the unique zero submodule; for `r>n` it is empty.

<a id="regular-pencil-fano-geometry"></a>

**Regular pencil Fano geometry.** For symmetric A,B over a field K with `char K≠2`, `f₀Δ(f)≠0` and `g≥1`, construct `ArithmeticOrbitRefinement.pencilFanoGeometry` on the Grassmannian: its closed Fano locus has K-points `commonIsotropic g A B`. For `n=2g+1`, prove it is a finite étale torsor under `ker(N:Res_{L/K}μ₂→μ₂)`, of geometric order `2^{2g}`. For `n=2g+2`, construct its smooth, geometrically connected J-torsor F of dimension g and the four-component commutative group `J⊔F⊔J¹⊔F`, with `2[F]=[J¹]`. Here a g-dimensional vector subspace gives a projective `(g−1)`-plane.

For an even pencil, augment on `Kⁿ⊕K²` by `A′=A⊕diag(1,0)` and `B′=B⊕[[0,1],[1,0]]`. Its invariant is `fy²`. Construct the open Fano locus F_m of common `(g+1)`-dimensional subspaces avoiding the radical line of A′. Prove smoothness, dimension `g+1`, and the simply transitive action of the supplied generalized Jacobian J_m. Construct the four-component generalized group and its doubling map `F_m→J_m¹`. These constructions precede any assertion that a pencil with prescribed f exists.

For the proof, Impose vanishing of the two universal bilinear restrictions on the tautological Grassmannian bundle. Over a splitting field use residual intersection and the two rulings of each quadric to construct the curve action and its Picard relations; prove regularity on the incidence charts and descend the action. For the augmented pencil remove the subspaces through the node and use the supplied nodal Picard comparison to obtain the generalized action and doubling map.

*Needs:* [common isotropic](#refinement-common-isotropic); [symmetric pencil](../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil); AlgebraicModuliForArithmeticGeometry §§1.1–1.3 (Grassmannians); SchemeAndStackFoundations §§3.6–3.7 (Picard degree torsors and descent); NeronModelsAndSemistableAbelianVarieties §§4.8–4.12 (BGW smooth and generalized Jacobians).

([[73]](#ref-73), §§4–5, Theorem23 and the regular augmented construction, pp.12–14.)

**Checks.**

- For `n=3`, `A=I₃`, `B=diag(1,2,3)` over Q, the geometric Fano scheme has four points, even though its rational points need not be inhabited.
- For `n=4` the Fano locus is the smooth intersection of the two quadrics itself, of dimension one; its augmentation has dimension two and is not proper.
- For a positive-dimensional zero pencil the coordinate set still exists, but its discriminant is zero and neither the finite-torsor nor the smooth-Jacobian assertion applies.

<a id="refinement-oriented-ideal-triples"></a>

**Oriented ideal triples.** For the preceding `(D,K,L,f)`, an oriented orbit triple is `(I,α,s)`, with I an `R_f`-stable full D-lattice in L, `α∈L×` and `s∈K×`, such that `I²⊂αI_f(n−3)`, `N(I)=sD` and `N(α)=s²f₀^{n−3}`. Here `N(I)` specializes the preceding `ArithmeticOrbitRefinement.idealNorm` to the basis 1,`ζ₁`,…,`ζ_{n−1}`. Equivalence for `SLₙ` is `(I,α,s)∼(cI,c²α,N(c)s)`. Retain s itself; replacing it with its principal ideal forgets orientation.

`n≥3`; `n=2` needs the negative-index ideal convention and the separately stated boundary convention. L is finite étale over K and I is full finite projective.

The required API is:

- `ArithmeticOrbitRefinement.IsOrbitTriple`: Require `n≥3`, `f(θ,1)=0` and compatibility of the chosen basis with 1,`ζ₁`,…,`ζ_{n−1}`, together with lattice stability, finite/full rank, product inclusion, norm-ideal equality and the scalar norm identity. The dictionary additionally uses the preceding nonzero-leading-coefficient and nonzero-discriminant hypotheses.

- `ArithmeticOrbitRefinement.orbitTriple_rescale`: Multiplication by `c∈L×` sends the triple to cI,`c²α`,`N(c)s` and preserves its conditions.

For the proof, Use Submodule D L and the determinant line, with `R_f` stability expressed by multiplication. For free I, `N(I)=sD` chooses an oriented basis; over a Dedekind domain principal determinant gives freeness. Scalar multiplication changes the determinant by `N(c)`, making the equivalence compatible with every constraint.

*Needs:* [full-lattice order comparison](#full-lattice-order-comparison); [binary form order](../ArithmeticStatisticsPartI/README.md#refinement-binary-form-order), `Algebra.norm` (Mathlib), `Basis` (Mathlib), `Submodule.span` (Mathlib), `LinearMap.mulLeft` (Mathlib), `Module.Finite` (Mathlib).

([[73]](#ref-73), Theorem16 and its construction, pp.7–8.)

**Checks.**

- For a monic f, the triple `(R_f,1,1)` satisfies the conditions.

- Both s and `−s` satisfy the same norm and ideal constraints; their identification requires an explicit norm-minus-one square root, rather than equality of the principal ideals.

- The zero lattice fails the full-rank condition and cannot have norm ideal sD with `s≠0`.

- For a rank-two algebra and a coefficient vector of degree2, IsOrbitTriple is false; the `n≥3` condition rejects the negative-index boundary.

- The natural-exponent interface rejects `n=2`, where `I_f(−1)` would be required; it must not replace that exponent by zero.

<a id="refinement-integral-pencil-orbits"></a>

**Integral pencil orbits.** For `n≥3`, Theorem16 identifies `SLₙ(D)`-orbits with the oriented ideal triples above, preserving f. The stabilizer is the norm-one 2-torsion units of `End_{R_f}(I)⊂L`. For even `n≥4`, `SLₙ/μ₂(D)` uses the additional relation `(I,α,s)∼(MI,tα,t^{n/2}s)` where `tD=M²`. The latter stabilizer contains `End_{R_f}(I)×[2]_{N=1}/D×[2]`, but need not equal it; the `Pic(D)[2]` and unit-square extensions must be retained.

`f₀` and `Δ(f)` are nonzero; `char K≠2`. The acting integral group is the group scheme’s D-points.

For the proof, Given a triple, extract the `ζ_{n−1}` and `ζ_{n−2}` coefficients of `λμ/α` on `I_f(n−3)`; these define the two Gram matrices in a basis with determinant s. Conversely `A^{-1}B` gives `θ`’s action on the rational module; the integral polynomial ζ-actions preserve the lattice. Track bases and `α` to prove both composites. The Kummer exact sequence explains the M,t extension.

*Needs:* [symmetric pencil](../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil), [oriented ideal triples](#refinement-oriented-ideal-triples).

([[73]](#ref-73), Theorems16–17, Remark18, pp.7–8.)

**Checks.**

- A product étale algebra and a noninvertible `R_f`-ideal remain allowed.

- The central quotient is not implemented as the naive quotient of integral `SLₙ` points.

<a id="refinement-oriented-norm-pairs"></a>

**Oriented norm pairs.** For a degree-n finite étale K-algebra L, `n≥3` and `f₀∈K×`, define pairs `(α,s)∈L××K×` with `N(α)=s²f₀^{n−3}`. The `SLₙ` relation is `(α,s)∼(c²α,N(c)s)`. For even `n≥4` the central-quotient relation also allows `t∈K×` and sends the pair to `(c²tα,N(c)t^{n/2}s)`. Both signs of s are retained until the relevant equivalence identifies them.

Finite free étale algebra, not an arbitrarily large algebra on which a default norm has no intended meaning.

The required API is:

- `ArithmeticOrbitRefinement.NormPair`: Construct from `n≥3`, `Module.finrank K L=n`, Algebra.IsSeparable K L, `α∈L×` and `s∈K×` satisfying the norm equality, in a finite free K-algebra. The degree and étale conditions are part of the data.

- `ArithmeticOrbitRefinement.NormPair.rescale`: Rescale by `c∈L×` as specified above.

- `ArithmeticOrbitRefinement.normPair_sign_iff`: The pairs `(α,s)` and `(α,−s)` are `SLₙ`-equivalent exactly when some `c∈L×` satisfies `c²=1` and `N(c)=−1`.

- `ArithmeticOrbitRefinement.NormPair.ext`: Two norm pairs over the same degree-n algebra and `f₀` are equal if their `α` and s fields are equal; proof fields add no data.

For the proof, Specialize the triple classification to a field, where all full lattices are the whole algebra after choosing a generator. Use the determinant norm, and verify both rescaling formulas directly.

*Needs:* [oriented ideal triples](#refinement-oriented-ideal-triples), `Algebra.norm` (Mathlib), `Module.finrank` (Mathlib), `Algebra.IsSeparable` (Mathlib).

([[73]](#ref-73), Corollaries19–20, pp.8–9.)

**Checks.**

- If `f₀=1`, the pair `(1,1)` satisfies the norm equation.

- In characteristic different from 2 with `f₀=1`, `(1,−1)` satisfies the norm equation and its retained orientation differs from1; the constructor must not discard the sign.

- In `L=K³`, `c=(−1,1,1)` has `c²=1` and `N(c)=−1`, so the two unit orientations are `SL₃`-equivalent.

- NormPair with `L=K`, `n=3` and `f₀=1` is empty. The actual algebra degree must agree with n.

- If `f₀=1`, `(1,−1)` also satisfies it; the constructor must not discard the sign.

- `L=K` has K-dimension1 and must admit no NormPair with declared degree3, even when the displayed norm equation alone has a solution.

<a id="refinement-field-pencil-stabilizers"></a>

**Field pencil stabilizers.** For `n≥3` and `f₀Δ≠0`, field `SLₙ`-orbits with invariant f are the oriented norm-pair classes. Their stabilizer group scheme is `ker(N:Res_{L/K}μ₂→μ₂)`. Forgetting s maps to squareclasses with norm `f₀^{n−3}` modulo `K×²` (norm `f₀` in even degree) one-to-one if f has an odd degree K-factor and two-to-one otherwise. For even `n≥4` use the central-quotient pair relation; the stabilizer scheme is `ker(N)/μ₂`, with the analogous fibre criterion involving odd factorizations, including quadratic-conjugate factors.

Field characteristic not 2. Do not equate quotient-scheme K-points to the quotient of K-points.

For the proof, Corollaries19–20 give the orbit correspondence. A square-one unit changes the orientation by its norm. The root-factor description of such units and the central quotient supply the fibre criteria and scheme stabilizers.

*Needs:* [oriented norm pairs](#refinement-oriented-norm-pairs), [symmetric pencil](../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil).

([[73]](#ref-73), Corollaries19–20, pp.8–9; Proposition22, pp.11–12.)

**Checks.**

- The split even degree n fibre has geometric stabilizer order `2^{n−2}`.

- Counting squareclasses alone can undercount oriented orbits by a factor of two.

<a id="refinement-pencil-existence"></a>

**Pencil existence.** For `n=2g+2≥4`, `char K≠2` and `f₀Δ≠0`, the following eight conditions are equivalent: (a) a generic pencil with invariant f exists; (b) a regular augmented pencil with invariant `fy²` exists; `(c) f₀∈(K×)²N(L×)`; `(d)` the degree-one generalized Picard torsor `J_m¹` is 2-divisible in `H¹(K,J_m)`; `(e)` the generalized Weierstrass class `W_m[2]` lifts under doubling from `H¹(K,J_m[4])`; (f) a two-cover `F_m→J_m¹` of homogeneous spaces exists; `(g)` the maximal unramified abelian exponent-two cover of C minus its two points at ∞ descends from `Kˢ` to K; `(h)` the maximal abelian exponent-two cover of C, ramified only at those two points, descends from `Kˢ` to K. Both covers have degree `2^{2g+1}`. The smooth `J¹` being 2-divisible alone does not replace these conditions. Theorem25 identifies their common obstruction in `H²(K,J_m[2])`, obtained from the connecting image of `f₀` in `K×/((K×)²N(L×))`.

m is the two-point divisor above ∞, with its quadratic splitting algebra. Use NeronModelsAndSemistableAbelianVarieties §§4.8–4.12: `BgwSmoothHyperellipticModel`, `BgwNodalPinch`, `BgwGeneralizedJacobian`, `BgwTwoTorsion`, `BgwOddFactorTorsors` and `BgwBoundaryCupProduct`. The orbit comparisons preserve their normalization, degree-one torsors, norm-one torus `T=ker(N:Res_{K∞/K}G_m→G_m)` for `K∞=K[t]/(t²−f₀)`, and Brauer boundary ([73], §3, (4)–(5), pp.10–12).

For the proof, The norm criterion follows from oriented norm pairs. On `V⊕K²` augment A by the block `diag(1,0)`, and B by the block with entries `B₁₂=B₂₁=1` and zero diagonal. The signed determinant becomes `f·y²`. Use the preceding regular augmented-pencil Fano torsor and generalized Picard doubling map; prove its obstruction comparison. BGW Theorem25 identifies the common `H²` obstruction.

*Needs:* NeronModelsAndSemistableAbelianVarieties §§4.8–4.12 (BGW curve, generalized Jacobian, two-torsion and boundary); [field pencil stabilizers](#refinement-field-pencil-stabilizers), [regular pencil Fano geometry](#regular-pencil-fano-geometry), SchemeAndStackFoundations §§3.6–3.7 (unpointed Picard degree torsors), TauCetiRoadmap.JacobianChallenge Layer D (pointed comparison).

([[73]](#ref-73), Theorems24–25, pp.14–16.)

**Checks.**

- If `f₀` is a square then `K∞` is split quadratic étale and `T≃G_m`. Replacing `K∞` by the field K would incorrectly give trivial T.
- For `f₀=−1` over R, `T(R)` is the norm-one circle in `C×`, whereas for `f₀=1` it is `R×`. The modulus torus cannot always be split.
- Over a separable closure `J_m` has dimension `g+1` and J has dimension g. Their degree-one torsors retain this dimension difference; replacing `J_m¹` by `J¹` loses the modulus obstruction.

- For a negative definite real even-degree f, L is a product of C and the negative leading coefficient is not a norm times a square; there is no rational pencil.

<a id="refinement-pencil-fano-torsor"></a>

**Pencil fano torsor.** For an even generic pencil `n=2g+2≥4`, use the preceding Fano schemes, their smooth and generalized Jacobian actions and doubling maps. For `SLₙ`, solubility uses the augmented regular-pencil Fano variety `F_m` and gives `J_m¹(K)/2J_m(K)`; for `SLₙ/μ₂` it uses F and gives `J¹(K)/2J(K)`. In both cases soluble orbits exist exactly when C has a K-rational divisor of odd degree. These are torsor coset sets unless a basepoint is chosen.

`f₀Δ≠0`, characteristic not 2; rational divisor, not merely a rational geometric divisor class.

For the proof, Use Theorem23’s Fano group law. The regular augmentation realizes generalized doubling. The `x−T` Kummer map associates oriented norm pairs to actual divisors; the Brauer obstruction must vanish to pass from a rational Picard class to a divisor. The two group actions give the two distinct coset sets.

*Needs:* NeronModelsAndSemistableAbelianVarieties §§4.8–4.12 (BGW curve, generalized Jacobian, two-torsion and boundary); [regular pencil Fano geometry](#regular-pencil-fano-geometry), [pencil existence](#refinement-pencil-existence), SchemeAndStackFoundations §§3.6–3.7 (unpointed Picard degree torsors), TauCetiRoadmap.JacobianChallenge Layer D (pointed comparison), TauCetiRoadmap.JacobianChallenge Layer A.

([[73]](#ref-73), Theorem23, pp.12–13; Theorems28–29, pp.18–20; Proposition21, pp.10–11.)

**Checks.**

- Vector dimension g is not `g+1`.

- For the negative definite real genus-two example, `J¹(R)` can be nonempty while no odd rational divisor exists, so no soluble pencil exists.

- The smooth Fano torsor has dimension g; the augmented generalized torsor has dimension `g+1`.

<a id="jacobian-kummer-and-selmer-adapter"></a>

**Jacobian Kummer and Selmer adapter.** Let K be a global field of characteristic different from two, and J the Jacobian of the smooth genus-g curve supplied by `BgwSmoothHyperellipticModel`, `g≥1`. Construct Kummer maps, completion restriction and finite `Sel₂(J)` and `Sel₄(J)` with their descent exact sequences. Over number fields specialize SelmerIwasawaCohomology §2.12a’s `abelianKummer`, `abelian_localH1_comparison`, `abelianDescent_exact` and `abelianSelmerGroup_finite` to [2] and [4] on J.

Over a global function field of odd characteristic construct the corresponding prime-to-characteristic Jacobian adapter: the finite étale Kummer sequences and their torsor interpretation, restriction to every completion, and the comparison of restricted geometric-point H¹ with completion H¹. Prove the latter by smooth torsor approximation over henselian local fields. At good places the local Kummer image is the unramified subgroup, using smooth proper reduction and Lang’s theorem on the finite-field special fibre. For a finite nonempty S containing the bad places, Selmer embeds into the finite `H¹(G_{K,S},J[n])`, `n=2,4`, supplied by ArithmeticGaloisDuality §R02.4.5. This proves finiteness without a number-field hypothesis.

For the supplied degree-one J-torsor `J¹`, define `Sel₂(J¹)` as isomorphism classes of everywhere locally soluble J[2]-covers of `J¹`, equivariant under [2] after geometric trivialization. Construct twisting by H¹(K,J[2]); the difference of two locally soluble covers lies in `Sel₂(J)`. Thus the cover set, if inhabited, is a finite simply transitive `Sel₂(J)`-set. Preserve restriction and the [4] to [2] maps needed to compare the lift of `W[2]`.

*Needs:* SelmerIwasawaCohomology §2.12a (number fields); ArithmeticGaloisDuality §R02.4.5 (prime-to-characteristic function-field cohomology and finiteness); SchemeAndStackFoundations Layer 2 (torsors and cohomology); NeronModelsAndSemistableAbelianVarieties §§4.8–4.12; AbelianSchemesAndArithmeticModuli Layers A2–A3 (isogenies and kernels).

([[73]](#ref-73), §8, Theorems30–31, pp.21–24; Milne, *Arithmetic Duality Theorems*, I §6, Lemma6.1 and Proposition6.4, pp.73–75, for the Kummer descent construction.)

**Checks.**

- At `g=2` over `F₅(t)`, the Jacobian of `z²=x⁶−t y⁶` has finite 2- and 4-Selmer groups and completion-compatible Kummer maps; it is outside the elliptic number-field supplier.
- Over a number field and at `g=1` with a chosen rational point, the adapter recovers the elliptic Kummer and Selmer carriers.
- An empty `Sel₂(J¹)` has no distinguished cover. Choosing one cover identifies an inhabited set with `Sel₂(J)`; changing the cover translates this identification.

<a id="refinement-locally-soluble-pencil-orbits"></a>

**Locally soluble pencil orbits.** Over a global field K of characteristic not 2, `n=2g+2≥4` and `f₀Δ≠0`, assume `Div¹(C)` has a point at every completion. Locally soluble `SLₙ/μ₂(K)`-orbits of invariant f correspond to `Sel₂(J¹)`, the set of locally soluble two-covers of `J¹`. This set is nonempty exactly when `W[2]` lifts under doubling from `Sel₄(J)`. When nonempty it is a finite torsor under `Sel₂(J)`, not canonically the group `Sel₂(J)`.

Local solubility includes every archimedean and nonarchimedean place. `F(K_v)≠∅` is the pencil’s local solubility condition.

For the proof, The norm/generalized-Picard existence criterion gives a rational orbit after the Selmer lift. Twisting by `H¹(K,J[2])` changes its Fano torsor class. The obstruction is cup product with `W[2]`; local Kummer classes and the Hasse principle put `Sel₂(J)` in its kernel. Thus twisting gives the simply transitive Selmer action and identifies the two-cover set.

*Needs:* NeronModelsAndSemistableAbelianVarieties §§4.8–4.12 (BGW curve, generalized Jacobian, two-torsion and boundary); [pencil fano torsor](#refinement-pencil-fano-torsor), [field pencil stabilizers](#refinement-field-pencil-stabilizers), SchemeAndStackFoundations §§3.6–3.7 (unpointed Picard degree torsors), TauCetiRoadmap.JacobianChallenge Layer D (pointed comparison), [Jacobian Kummer and Selmer adapter](#jacobian-kummer-and-selmer-adapter).

([[73]](#ref-73), Theorems14,30–31, pp.5,21–24.)

**Checks.**

- Choosing a soluble orbit identifies the torsor with `Sel₂(J)`; changing that choice translates the identification.

- A rational orbit need not be locally soluble.

- Over `F₅(t)` at genus two, the Selmer torsor uses the prime-to-characteristic Jacobian adapter, including all completions.

<a id="refinement-integral-soluble-pencils"></a>

**Integral soluble pencils.** Let `n=2g+2≥4` and `f∈ℤ[x,y]` have `f₀Δ≠0` and locally soluble `Div¹`. If `2^{4i}` divides `f₀^{i−1}f_i` for `1≤i≤n`, every locally soluble rational `SLₙ/μ₂` orbit of invariant f has an integral representative. In particular coefficients in `16ℤ` suffice; this gives `κ=4` for the invariant `16f` in Theorem15. It asserts representatives of rational orbits, not uniqueness of integral orbits.

The divisibility hypothesis uses integral binary coefficients and every local place.

For the proof, Apply the displayed coefficient condition at `p=2` and the source’s explicit local ideals at all p. A local divisor of degree one supplies an ideal I with `I²⊂αI_f(n−3)` and the required norm. Patch the local lattices in L; since `ℤ` is a PID the determinant orientation becomes principal. Use the integral orbit classification.

*Needs:* [oriented ideal triples](#refinement-oriented-ideal-triples), [locally soluble pencil orbits](#refinement-locally-soluble-pencil-orbits).

([[73]](#ref-73), Theorem15, p.5; Proposition34 and its proof, pp.26–28.)

**Checks.**

- If 16 divides each `f_i`, then `16^i` divides `f₀^{i−1}f_i`.

- The general statement does not demand an integral representative at the unscaled invariant f.

<a id="quartic-monicization"></a>

**Quartic monicization.** For ordinary coefficients `f=(a,b,c,d,e)` over a commutative ring, define `BinaryQuartic.monicize f` to have coefficients `(1,b,ac,a²d,a³e)`. This is a polynomial operation, including at `a=0`. Over a field with `a≠0` its binary polynomial is `a⁻¹f(x,ay)`. Its invariants are `a²I(f)`, `a³J(f)` and `a⁶Δ(f)`. Over Q, for separable f with `a≠0`, its double cover is the quadratic twist by a of `C_f`, after changing y to ay. Its Jacobian therefore need not be isomorphic to `Jac(C_f)`; the two-torsion schemes are canonically identified, while the Selmer subgroups of `H¹` need not coincide.

The interface exposes:

- The leading coefficient is 1.
- A monic quartic is unchanged.
- The I, J and discriminant identities hold over every commutative ring, without cancelling 27.
- For a nonsingular rational quartic with `a≠0`, identify the quadratic twist and its two-torsion, preserving the stated direction of the coordinate change.

*Needs:* [binary quartic invariants](../ArithmeticStatisticsPartI/README.md#binary-quartic-invariants), TauCetiRoadmap.EllipticCurves Layer 5.

([[33]](#ref-33), §1.2, pp.3–4, and §3.1, p.13; the polynomial identities follow by substitution.)

**Checks.**

- For `(2,3,5,7,11)`, the new tuple is `(1,3,10,28,88)`, not coefficientwise division by 2.
- For `a=1`, all five coefficients are unchanged; for `a=0`, the tuple is `(1,b,0,0,0)` and has zero discriminant, so the twist comparison cannot extend to this case.
- For `f=2x⁴−2y⁴`, the new form is `x⁴−16y⁴`: I changes from `−48` to `−192` and `Δ` from `−16384` to `−1048576`. These are factors `a²` and `a⁶` respectively.
- For `f=−x⁴−y⁴`, the monicized form `x⁴+y⁴` has real points although `C_f` has none. Local solubility of an arbitrary covering cannot be inferred from its monicization.

<a id="marked-quartic-selmer-embedding"></a>

**Marked quartic Selmer embedding.** Let f be a separable integral binary quartic, with `a≠0`, whose curve `C_f` is soluble over every completion of Q. There is a natural injection from `Sel₂(Jac(C_f))` into rational `(SL₄/μ₂)`-orbits of pairs of symmetric matrices `(A,B)` with `det(xA+yB)=f^{mon}`. There is a fixed positive integer k, independent of f, such that, after replacing `f(x,y)` by `g(x,y)=f(x,ky)`, every image orbit for g has an integral representative with A the antidiagonal matrix of ones. The coordinate change identifies `C_g` with `C_f` and hence their Selmer groups. The central quotient means rational points of the quotient group scheme. For the signed-minus pencil convention above, replace B by `−B`; in dimension four the determinant sign is `+1`.

Prove the injection through the étale quartic algebra and the norm-one squareclass description of the two-torsion cohomology. Identify the local Kummer images of the original curve before monicization. The obstruction to a rational orbit lies in `H²(Q,μ₂)`; local solubility kills its images at every place, and the global-to-local Brauer injection kills the global obstruction. The first quadratic form is split at every place; the quadratic-form Hasse principle makes it split over Q. Obtain integral representatives from the inverse-different ideal-square-root dictionary, patching its local lattices; the fixed coordinate scaling clears the denominators uniformly. Fixing A then identifies these orbits, and their stabilizers, with `PSO_A`-orbits of B. This construction transports the original Selmer elements into a different orbit representation; it does not identify `Sel₂(Jac(C_f))` with `Sel₂(Jac(C_{f^{mon}}))`.

*Needs:* NeronModelsAndSemistableAbelianVarieties §§4.8–4.12 (BGW curve, generalized Jacobian, two-torsion and boundary); [quartic monicization](#quartic-monicization), [oriented ideal triples](#refinement-oriented-ideal-triples), [symmetric pencil](../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil), SelmerIwasawaCohomology Layers 0–2, ArithmeticGaloisDuality Layer R02.4 (the global-to-local Brauer injection), TauCetiRoadmap.GlobalQuadraticForms Layer 5, [full-lattice order comparison](#full-lattice-order-comparison), GlobalNumberFields Layer 11 (number-field specialization).

([[33]](#ref-33), Theorem 1.4, p.4; Proposition 2.2, p.8; §§3.1–3.2, pp.13–19.)

**Checks.**

- The fixed A has determinant 1; therefore the `x⁴` coefficient of its pencil is 1, agreeing with `f^`mon.
- The substitution `y↦ky` preserves the isomorphism class of `C_f`, whereas multiplication of f by an arbitrary nonsquare need not do so.
- Distinct original Selmer elements give distinct rational orbits; integral orbit counts still require the rational-orbit weight.

### 1.13 Weak-discriminant lifts and marked hyperdeterminants

<a id="refinement-weak-discriminant-divisibility"></a>

**Weak discriminant divisibility.** Specialize [strong weak discriminant](../ArithmeticStatisticsPartI/README.md#strong-weak-discriminant) to the fixed-degree binary discriminant `Δ_n` and the Layer 1 coefficient order. For a prime p and integral fixed-degree coefficient vector f, `p²` strongly divides `Δ(f)` if `p²` divides `Δ(f+p h)` for every integral coefficient vector h. It weakly divides if `p²` divides `Δ(f)` and some h makes `Δ(f+p h)` indivisible by `p²`. For a positive squarefree m, `W_m^(2)` imposes weak divisibility at every prime factor of m. For binary forms the `p=2` weak locus is empty. These are the same strong and weak loci as ArithmeticStatisticsPartI Layer 0; this interface transports them to pencils and projective-root criteria.

Binary homogeneous discriminant with fixed degree `n≥2`. Monic specialization permits only monic-family perturbations where the source specifies that family.

The required API is:

- `ArithmeticOrbitRefinement.StrongSquareDivides`: Every p-multiple coefficient perturbation still has discriminant divisible by `p²`.

- `ArithmeticOrbitRefinement.WeakSquareDivides`: The original discriminant is divisible by `p²` and there is a perturbation violating divisibility.

- `ArithmeticOrbitRefinement.weak_strong_exclusive`: Weak and strong square divisibility cannot both hold.

For the proof, Define perturbations in the actual coefficient lattice. Reduce the discriminant polynomial modulo `p²`; for odd p, the source characterizes the weak locus by a unique simple double root over `F_p`. Use `Δ`≡0 or1 modulo4 for the binary `p=2` convention.

*Needs:* [strong weak discriminant](../ArithmeticStatisticsPartI/README.md#strong-weak-discriminant), [binary discriminant](../ArithmeticStatisticsPartI/README.md#refinement-binary-discriminant).

([[75]](#ref-75), Introduction p.3 and §3.4 p.12; BSW I §1 p.4.)

**Checks.**

- For odd p, `f=x³−x²y+p²y³` is weak: changing its constant coefficient by p makes the discriminant nonzero modulo `p²`.

- For `f=x³`, every coefficient perturbation by a prime p has discriminant divisible by `p²`.

- No integral binary form has weak discriminant divisibility by4.

<a id="refinement-q-hyperdeterminant"></a>

**`Q` hyperdeterminant.** For `g≥1` and two `g×(g+1)` matrices U,V, remove column i from `xU−yV` and form the signed maximal minor `(−1)^i det((xU−yV)_{without_i})`, indexed from zero. Put their coefficients of `x^{g−j}y^j` into `a (g+1)×(g+1)` matrix and define `Q(U,V)` as its determinant. For a symmetric pair with upper-left `g×g` blocks zero, Q means this polynomial on the top-right blocks. It has degree `g(g+1)`, is `SL₂×SL_g×SL_{g+1}`-invariant, and transforms under row and column changes with weights `det(h)^{g+1}det(k)^g`.

Coefficient and minor order are fixed, so the sign is testable.

The required API is:

- `ArithmeticOrbitRefinement.qHyperdeterminant`: Return the signed-minor coefficient determinant.

- `ArithmeticOrbitRefinement.qHyperdeterminant_transform`: `Q(hUkᵀ,hVkᵀ)=det(h)^{g+1}det(k)^gQ(U,V)`.

- `ArithmeticOrbitRefinement.qHyperdeterminant_scale`: `Q(tU,tV)=t^{g(g+1)}Q(U,V)`.

- `ArithmeticOrbitRefinement.qHyperdeterminant_sl2`: If `ad−bc=1`, `Q(aU+bV,cU+dV)=Q(U,V)`. This is the invariance needed to undo the binary-variable change in the odd weak lift.

For the proof, Compute signed maximal minors in the universal polynomial ring, extract their coefficient matrix, and take its determinant. Row and column transformations give the determinant weights. Binary-variable changes have determinant weight `g(g+1)/2` and hence disappear for `SL₂`.

*Needs:* [symmetric pencil](../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil), `Matrix.det` (Mathlib).

([[75]](#ref-75), §3.2, (4)–(5), pp.9–10; BSWI (6), p.7.)

**Checks.**

- For `g=1`, `U=(1,0)`,`V=(0,1)`, `Q=−1` with the stated descending coefficient order.

- For `U=[[1,0,0],[0,1,0]]`,`V=[[0,1,0],[0,0,1]]`, `Q=−1`.

- If `g≥1` and `U=V=0`, `Q=0`.

<a id="refinement-q-discriminant-divisibility"></a>

**`Q` discriminant divisibility.** On the universal integral coordinate ring of pairs of symmetric `(2g+1)×(2g+1)` matrices with zero upper-left `g×g` blocks, `Q²` divides `Δ(f_A,B)`. Consequently every integral evaluation satisfies `Q(A,B)² | Δ(f_A,B)`. This polynomial divisibility is stronger than a statement at one prime.

`g≥1`; universal integral coordinates before evaluation.

For the proof, The Q polynomial is irreducible and primitive. A generic point of `Q=0` can be put into the special minor normal form, which forces a double root of f. Perturbing a suitable entry gives a first-order Q zero but a second-order discriminant zero. This proves divisibility by Q twice over the fraction field; primitivity and Gauss’s lemma descend it to `ℤ`.

*Needs:* [q hyperdeterminant](#refinement-q-hyperdeterminant), [binary discriminant](../ArithmeticStatisticsPartI/README.md#refinement-binary-discriminant).

([[75]](#ref-75), Theorem3.5 and proof, pp.11–12.)

**Checks.**

- The `g=1` polynomial identity is valid with arbitrary lower-right blocks.

- The stronger printed Gram-determinant assertion in Proposition3.6 is not used.

<a id="refinement-marked-q"></a>

**Marked q.** For an integral symmetric pair `(A,B)` in odd dimension2g`+1` with nonzero discriminant, mark a common rational g-plane U and its saturated lattice `Λ=U∩ℤ^{2g+1}`. Complete a ℤ-basis of `Λ` to a unimodular ambient basis and evaluate `|Q|` on the transformed top-right blocks. This is independent of the integral completion and is invariant on marked `SL_{2g+1}(ℤ)`-orbits. Forget `Λ` only when uniqueness of the common isotropic plane has been proved, e.g. for irreducible odd-degree f.

The marking is a saturated lattice; arbitrary rational bases are not permitted.

The required API is:

- `ArithmeticOrbitRefinement.markedQ`: Evaluate absolute Q after an explicitly adapted unimodular matrix; retain the marking as data.

- `ArithmeticOrbitRefinement.markedQ_independent`: Two unimodular completions of the same primitive isotropic lattice give equal absolute Q.

- `ArithmeticOrbitRefinement.markedQ_equivariant`: Integral determinant-one congruence and the transported marking preserve markedQ.

For the proof, Primitivity permits unimodular completion. Any two completions differ by an integral parabolic matrix whose determinant on the first block is ±1; the Q character therefore preserves the absolute value. The odd irreducible invariant has trivial rational Jacobian two-torsion, giving uniqueness of the marked plane.

*Needs:* [q hyperdeterminant](#refinement-q-hyperdeterminant), [common isotropic](#refinement-common-isotropic), `Matrix.toLin'` (Mathlib), `Submodule.smithNormalForm` (Mathlib).

([[75]](#ref-75), §3.4, definition after Theorem3.7 and Proposition3.8, pp.13–14.)

**Checks.**

- In dimension3, top blocks `U=(1,0)`,`V=(0,1)` give markedQ`=1` for the standard coordinate line.

- For the preceding `g=1` blocks, `Q=−1`. The determinant-one completion `diag(−1,−1,1)` gives blocks `(1,0)`,`(0,−1)`, hence `Q=+1` and markedQ`=1`.

- The completion `diag(−1,1,1)` has first-block determinant `−1` but total determinant `−1`. It negates both top blocks and leaves `Q=−1`, so first-block determinant alone does not determine the sign. Both completions preserve absolute Q.

- In dimension3 the rational determinant-one congruence `diag(2,1,1/2)` changes the preceding top blocks to `(2,0)`,`(0,1)`, giving `|Q|=2`. Rational adapted bases therefore do not define the integral marked invariant.

<a id="refinement-weak-lift-odd"></a>

**Weak lift odd.** Let `n=2g+1≥3` and m be an odd positive squarefree integer. There is a map `σ_m:W_m^(2)→W₀(ℤ)` with `f_{σ_m(f)}=f` and `|Q|(σ_m(f))=m`. On irreducible forms it induces an injection into integral `SLₙ` orbit classes; images for distinct m are disjoint. Extend an even-m domain only as the empty domain, rather than using division by2 in an integral formula.

The weak binary discriminant locus and zero-block target use the conventions above.

For the proof, Choose an `SL₂(ℤ)` variable change giving coefficients (`m²b₀`,`mb₁`,`b₂`,…,`b_n`), with `gcd(m,b₀)=1`. Solve `m|2rb₀+b₁`, then choose the other entries recursively so the determinant coefficients match. Undo the variable change. The banded maximal-minor formula gives `|Q|=m`. The invariant recovers f; uniqueness of the marked plane gives injectivity and separation of different m.

*Needs:* [weak discriminant divisibility](#refinement-weak-discriminant-divisibility), [q hyperdeterminant](#refinement-q-hyperdeterminant), [marked q](#refinement-marked-q).

([[75]](#ref-75), Theorem3.7 and Proposition3.8, pp.12–14.)

**Checks.**

- For `m=1` the lift has `|Q|=1`.

- No claim is made that every integral orbit of invariant f lies in the image.

<a id="refinement-one-matrix-slice"></a>

**One matrix slice.** Fix the split anti-diagonal `A₀` of size n with entries1. The signed determinant `f_{A₀,B}(x,1)` is monic. Congruence by the existing split `SO(A₀)` preserves it, and top-block Q specializes to the BSWI Q-invariant. For odd `n≥3` and `Δ≠0` the stabilizer is the two-torsion of the Jacobian of `y²=f_B(x)`; the curve has its rational point at ∞. BSWI weak-divisibility lifts occupy the specified half-integral lattice for odd n and quarter-integral lattice in the even-degree construction, rather than all integral symmetric matrices.

For the even-degree BSW I one-matrix injection restrict to irreducible polynomials that do not factor as `h·h̄` over any quadratic extension of Q ([74], Theorem3.3, p.17). Retain the marking outside this domain; irreducibility alone does not supply the unmarked Q invariant. The binary even-degree lift below is the separate BSW II construction. The one-matrix construction uses the specified fixed matrix `A₀` and integral lattice.

For the proof, Specialize the symmetric pencil at `A₀`. Its determinant is `(−1)^{n(n−1)/2}`, proving monicity. Match the top blocks and Q character with BSWI `(6)`–`(8)`; the stabilizer follows the odd-degree finite étale factor description. Read the lattice restrictions in Theorems2.3–2.4 and3.3 before using the injection.

*Needs:* [symmetric pencil](../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil), [q hyperdeterminant](#refinement-q-hyperdeterminant), [field pencil stabilizers](#refinement-field-pencil-stabilizers).

([[74]](#ref-74), §2.1–2.2, pp.6–11; §3.1–3.2, pp.15–17.)

**Checks.**

- For every n, the invariant’s leading coefficient is1.

- The even-degree injection requires both irreducibility and absence of quadratic-conjugate factors.

- `x⁴+1` is irreducible over Q but equals `(x²+√2 x+1)(x²−√2 x+1)` over `Q(√2)`, so it is excluded from the even-degree unmarked injection.

<a id="refinement-even-weak-lift"></a>

**Even weak lift.** For `n=2g+2≥4`, odd positive squarefree m and f in the weak locus with `gcd(m,f(0,1))=1`, lift xf by the odd-degree `σ_m` into pairs of size `n+1`. On the flag-adapted locus `W₁`, the `first(g+1)²` block of A and `first(g+2)²` block of B vanish; B has one-dimensional kernel nonisotropic for A. The polynomial q is Q divided by the determinant of the top-right `(g+1)×(g+1)` block of B. For irreducible f and any primitive isotropic flag `Λ⊂Λ′`, `|q|=m`, independently of the flag; `|Q|` can be m or `|f(0,1)|m`. Thus the even lift retains a flag until this independence is proved.

The generic condition `gcd(m,f(0,1))=1` and `Δ(f)≠0` are retained. q is a polynomial quotient on `W₁`, not pointwise division at a zero denominator.

For the proof, Use `Δ(xf)=Δ(f)f(0,1)²` to preserve weak divisibility. Define `W₁` by the two zero blocks and nondegenerate kernel; show the block determinant divides Q universally. Two isotropic planes are reflections across the B-kernel with respect to A. Compare integral bases of their saturated flags to obtain the two Q values and common q value. In the even-constant-term basis use `e_{n+1}`, correcting the source’s coordinate convention.

*Needs:* [weak lift odd](#refinement-weak-lift-odd), [marked q](#refinement-marked-q).

([[75]](#ref-75), §3.5, (10),(12), Proposition3.9, pp.14–16.)

**Checks.**

- Distinct m give disjoint `SL_{n+1}(ℤ)`-orbit images on this irreducible generic domain.

- No lift to `W_n(ℤ)` of the same form f is asserted in even degree.

### 1.14 Genus-one stabilizer group schemes

<a id="refinement-genus-one-stabilizer-schemes"></a>

**Genus one stabilizer schemes.** Over a field of characteristic different from 2,3,5, the nondegenerate binary quartic, ternary cubic, pair of quaternary quadrics and quintuple of quinary alternating matrices give the degree `d=2`,3,4,5 line-bundle presentations of smooth genus-one curves. Their full linear-group stabilizers are extensions of `Aut(Jac(C))` (automorphisms fixing its elliptic origin) by the `θ` group `Θ_{Jac(C),d}`, which extends `Jac(C)[d]` by `G_m`. For rational-divisor formulations quotient the central `G_m` of line-bundle scalings; the stabilizer becomes the corresponding extension by `Jac(C)[d]`. In degree two this means `PGL₂×2G_m`, retaining the `μ₂` kernel of the square-scaling action: dividing out every ineffective element would also lose the hyperelliptic involution. In degree three use `PGL₃×G_m`, and in degrees four and five use the displayed one-dimensional central quotient. For fixed invariants and the differential-preserving degree2 `PGL₂` action, recover the `E[2]` stabilizer with Galois action. These are different acting groups and must not be conflated. The acting groups are `GL₂` twisted by `det⁻²` times the weight-two scalar `G_m` for degree2; `GL₃` twisted by `det⁻¹` times `G_m` for degree3; `GL₂×GL₄` for degree4; and `GL₅×GL₅` for degree5. The last two act naturally on `2⊗Sym²(4)` and `5⊗∧²(5)`; their ineffective scalar kernel is `(a,b)` with `ab²=1`.

The conservative common characteristic restriction is stronger than each degree2–4 source theorem and avoids the degree5 exceptional characteristic. Degree d line bundles and rational divisor classes are distinguished where the Brauer obstruction matters.

For the proof, Use the complete linear system of the degree-d line bundle for the geometric inverse. For `d=3` this is the plane cubic; for `d=4` the two-dimensional space of quadrics cuts out the curve; for `d=5` the alternating presentation comes from its codimension-three resolution. Identify the automorphism group of the framed geometric data and then remove frames. Track the scalar kernel and differential to compare to the stabilizer. Use the group-scheme and differential comparison stated in this layer.

*Needs:* [symmetric pencil](../ArithmeticStatisticsPartI/README.md#refinement-symmetric-pencil), [common isotropic](#refinement-common-isotropic), [ternary cubic forms and their invariants](#ternary-cubic-forms-and-their-invariants), [stabilizer of a binary quartic is two torsion](#stabilizer-of-a-binary-quartic-is-two-torsion), SchemeAndStackFoundations §§3.6–3.7 (unpointed Picard degree torsors), TauCetiRoadmap.JacobianChallenge Layer D (pointed comparison), TauCetiRoadmap.JacobianChallenge Layer A, TauCetiRoadmap.EllipticCurves Layer 7.

([[76]](#ref-76), Theorems4.1,4.5,4.11,4.14 and Remarks4.3,4.13,4.15, §§4.1–4.4, preprint pp.24–31.)

**Checks.**

- For degree5 there are five alternating matrices, while the quintic-ring representation has four.

- The extension need not split, particularly at special j-invariants.

- In degrees four and five, the central pair `(t⁻²I,tI)` acts trivially: its scalar on each tensor is `t⁻²t²=1`. Counting this full stabilizer as a finite group would retain a spurious `G_m`.

- Over an algebraically closed characteristic-zero field at `j≠0`,1728, the rational-divisor groups just specified have stabilizer order `2d²`, whereas the differential-preserving subgroup has order `d²`. In degree two `PGL₂×2G_m` has stabilizer order 8 and fixed-invariant `PGL₂` has order 4. The element `(1,−1)` acts trivially on quartic coefficients but remains in the former stabilizer; quotienting this `μ₂` away would give a different group.

### 1.15 Quartic étale resolvents


<a id="refinement-quartic-etale-resolvent"></a>

**Quartic etale resolvent.** Given a quartic ℤ-order Q of nonzero discriminant and a specified cubic resolvent order R, identify `R⊗ℚ` with the existing cubic étale resolvent algebra of `Q⊗ℚ` specified in Scope and ownership. Tensor products here are over `ℤ`. The new assertion is this comparison with the integral quadratic resolvent map and its lattice: `Disc(Q)=Disc(R)`, without assuming either order maximal. A quartic field may have a reducible rational resolvent, so no field hypothesis is imposed on `R⊗ℚ`.

Both orders are free ℤ-algebras of their prescribed ranks; their rationalizations are étale. An integral resolvent map is specified for the discriminant comparison.

For the proof, identify the source’s resolvent-map conjugates with the values of the imported quartic resolvent specification. Descend this identification to K, retaining the lattice given by R. Compare the integral discriminant forms through the orientation in the quartic/cubic resolvent data; the polynomial discriminant identity alone would not identify the order lattice.

*Needs:* [quartic ring and cubic resolvent](#quartic-ring-and-cubic-resolvent), [nondegenerate forms and etale cubic algebras](#nondegenerate-forms-and-etale-cubic-algebras).

([[70]](#ref-70), §2.3, (8)–(9), pp.1337–1339.)

**Checks.**

- For the split quartic order `Z⁴`, its cubic resolvent order `Z³` rationalizes to the imported split algebra `Q³`.

- A cubic resolvent order attached to an order in a cyclic quartic number field rationalizes to Q times a quadratic algebra, agreeing with the imported resolvent and not a cubic field.

### 1.16 Good-prime integral pencils

<a id="refinement-good-prime-integral-pencils"></a>

**Good prime integral pencils.** Let p be odd, f an integral binary form of even degree `n≥4` over `ℤ_p` with `f₀≠0` and `p²` not dividing `Δ(f)`. If the curve `z²=f` has an actual degree-one rational divisor over `Q_p`, extension of scalars gives a bijection from all `SL_n/μ₂(ℤ_p)`-orbits with invariant f to the soluble `SL_n/μ₂(Q_p)`-orbits with invariant f. For each integral representative, its integral and rational stabilizer point groups are equal. This is a local uniqueness theorem under the discriminant restriction, unlike the unrestricted existence theorem.

p odd, `p²∤Δ(f)`, `f₀≠0`. `Div¹(C)(Q_p)` is nonempty, rather than only a degree-one Picard class.

For the proof, The discriminant restriction makes `R_f` maximal and the projective model regular. Proposition34 supplies integral representatives because powers of2 are units. Integral ideal-pair classes are the norm-one quotient of order units. Compare this group with `J(Q_p)/2J(Q_p)` through the connected Néron model. Norm-one two-torsion units are integral. In the n divisible by4 case, an additional quadratic splitting field is unramified, so the central quotient adds no nonintegral stabilizer.

*Needs:* NeronModelsAndSemistableAbelianVarieties §§4.8–4.12 (BGW curve, generalized Jacobian, two-torsion and boundary); [integral soluble pencils](#refinement-integral-soluble-pencils), [integral pencil orbits](#refinement-integral-pencil-orbits), [field pencil stabilizers](#refinement-field-pencil-stabilizers).

([[73]](#ref-73), Proposition35 and proof, §9, p.29.)

**Checks.**

- Dropping `p²∤Δ` removes the asserted uniqueness.

- The equal stabilizers are point groups for the central quotient; no equality of integral group schemes is asserted.

- At p=2 this target supplies no uniqueness assertion, even if the rational curve has a degree-one divisor.

### Supporting descent and integral realization

**Degree-three, four and five descent.** Let K have characteristic different from 2,3 for degree three or four, and from 2,3,5 for degree five. Fix nonsingular `E:y²=x³−(I/3)x−J/27`. Construct the K-soluble orbit bijection with `E(K)/nE(K)`, the stabilizer scheme `E[n]` for the differential-preserving effective group, and localization of the corresponding `E[n]`-coverings. Over Q, locally soluble rational orbits identify with `Sel_n(E)`; every such orbit at the invariants `I(E)=−3A`, `J(E)=−27B` of an integral short model has an integral representative. Integral representatives are still identified by the rational group, so this asserts neither one integral orbit per Selmer element nor equality of integral and rational stabilizers without further hypotheses.

For every degree use the Fisher invariants `I=c₄/16`, `J=c₆/32`, so an integral short model has `(I,J)=(−3A,−27B)`. For `n=3` use determinant-twisted `PGL₃` on ternary cubics ([77], §1, p.2). For `n=4` use integer-valued quaternary quadrics, including their half-integral Gram matrices. The acting group scheme is `{(g₂,g₄):det(g₂)det(g₄)=1}/G_m`, with scalar embedding `t↦(t⁻²I₂,tI₄)`, and the binary resolvent is `F=16det(xA+yB)`. With the half-integral Gram matrices of the integer-valued quadrics, Fisher [13], §7.3, p.27 gives `c₄=I(F)`, `c₆=J(F)/2`; hence `(I(F),J(F))=(16I,64J)`. For `n=5` take the ordered group factors as `(h,g)`, with h mixing the five matrices and g acting by congruence. The group scheme is `{(h,g):det(h)det(g)²=1}/G_m`, with `t↦(t⁻²I₅,tI₅)`, on `5⊗Λ²5`. The polynomial invariants in [79], §2, `(1)`–`(3)`, p.5 satisfy `(I_BS,J_BS)=(3⁴c₄,2·3⁶c₆)=(6⁴I,6⁶J)`. Transport its orbit and integral-model statements with these factors: the identification from the fixed E to the source curve at that fibre is `(x,y)↦(36x,216y)`. Retain the Fisher c₄,c₆ coefficient-lattice normalization of [13], Lemma4.15, p.13. The 40-dimensional quintic-ring representation has four matrices and is a different carrier. Evaluate quotient group schemes on K, rather than silently quotienting K-points.

The required API is `GenusOneModel.solubleOrbitEquiv`, `GenusOneModel.stabilizerEquiv`, `GenusOneModel.localizeCovering`, `GenusOneModel.selmerOrbitEquiv`, and `GenusOneModel.exists_integral`, together with `GenusOneModel.invariantComparison` carrying the degree-four resolvent and degree-five source scale factors above. The identity corresponds to a rational flex for `n=3` and the identity Kummer covering in all degrees. For `n=4`, the quartic resolvent has a K-rational linear factor exactly when the induced two-cover is the identity. On soluble classes this is `2E(K)/4E(K)`, the kernel of `E(K)/4E(K)→E(K)/2E(K)`; for Selmer classes it is the kernel of `Sel₄(E)→Sel₂(E)`. This subgroup need not contain every class of order at most two. Use the induced-cover construction in the proof of [78], Proposition7; an order-based reformulation requires injectivity of the map from the two-Selmer group to the four-Selmer group. Keep all invariant, discriminant and coefficient-lattice scale factors in these maps ([77], Propositions28–30, §3.1, pp.15–16; [78], Propositions7–9, §2, pp.4–5; [79], Theorems7–10, §2, pp.5–6). *Needs:* the ternary invariants above; SchemeAndStackFoundations Layers 0–3, AbelianSchemesAndArithmeticModuli Layers A2–A3 and EllipticCurves Layers 1,7 for the covering and Selmer carriers.

**Checks.**

- For `E:y²=x³−x`, the identity degree-three model `y²z−x³+xz²` has `c₄=48`,`c₆=0` and hence `I=3`,`J=0`, with its rational flex at ∞. Forgetting the factors 16 and 32 changes the elliptic curve.
- The degree-four scalar pair `(t⁻²I₂,tI₄)` and degree-five pair `(t⁻²I₅,tI₅)` act trivially and satisfy the displayed determinant constraints. A quotient by a finite scalar subgroup leaves the wrong stabilizer.
- The integral identity degree-five model of `E:y²=x³−x` has Fisher `(c₄,c₆)=(48,0)`, hence `(I,J)=(3,0)` and source `(I_BS,J_BS)=(3888,0)`. The source fibre `I_BS=3` has no integral model, since 81 divides I_BS on integral quintic models.
- Over R, `E:y²=x³−x` has two components; `(0,0)` gives a nonidentity order-two class in `E(R)/4E(R)` whose image modulo 2 is nonzero. Its point quartic `X⁴+Y⁴/4` has no real projective zero. The degree-four model `zt−xy=0`, `y²−xt−z²=0` for `(E,3O+(0,0))` has resolvent `u⁴+4v⁴`, with binary invariants `(48,0)=(16I,64J)` and no real zero ([12], Lemma3.12, p.14). Thus order two alone does not imply a linear factor.
- An integral representative belongs to a rational equivalence class in the integral lattice. Counting integral equivalence classes directly can give multiple representatives of one Selmer element.

The BSS marked genus-one statistic requires an *even-degree monicization* adapter: from a locally soluble irreducible binary quartic and a two-covering of its Jacobian, construct the associated monic invariant and the integral self-adjoint/symmetric data with their leading-coefficient scaling. Prove injectivity at the required orbit level, describe every integral multiplicity and stabilizer, and identify the increasingly sparse congruence support as the leading coefficient grows. This is BSS, §§3–4 and the monicization steps in §§6–7, pp. 13–47. The odd-degree symmetric-pencil dictionary does not supply this even-degree map. Its local support supplies the downstream sparse quaternary count.

**Divided-coefficient cubic discriminant.** Over any commutative ring R, the coordinate vector `(a,b,c,d)` denotes `ax³+3bx²y+3cxy²+dy³`. Define `Cubic.normalizedDisc` by `D=a²d²−6abcd−3b²c²+4ac³+4b³d`. Its API is `normalizedDisc_smul` (coefficient scaling by u multiplies D by `u⁴`), invariance under `SL₂` and determinant-six covariance under the divided-coefficient substitution `Cubic.dividedSubst`, and `ordinaryDisc_eq`: the fixed-degree ordinary binary discriminant is `−27D`. For the affine Mathlib `Polynomial.discr` comparison, assume `a≠0`; otherwise degree can fall. These are integral polynomial identities, so require no division by 3, even in small characteristic ([3], §3, pp.5–6). Construct `Cubic.dividedSubst g v` by the integral symmetric-trilinear formulas. For `g=((r,s),(t,u))`, its coordinates are
`(ar³+3br²s+3crs²+ds³, ar²t+b(r²u+2rts)+c(2rsu+ts²)+ds²u, art²+b(2rtu+t²s)+c(ru²+2tsu)+dsu², at³+3bt²u+3ctu²+du³)`.
The API `Cubic.dividedSubst_one`, `Cubic.dividedSubst_mul` and `Cubic.dividedSubst_map` gives the identity, left-action composition and base-change laws. `Cubic.normalizedDisc_dividedSubst` states `D(dividedSubst g v)=det(g)⁶D(v)` for every 2×2 matrix, hence SL₂-invariance. The coefficient map `(a,b,c,d)↦(a,3b,3c,d)` intertwines this substitution with ordinary binary-cubic substitution; undo Part I’s determinant twist before comparing. The coefficient map is not injective in characteristic three. *Needs:* `Fin 4 → R`, Mathlib matrices and `Polynomial.discr`; ArithmeticStatisticsPartI “Binary cubic forms and the twisted action” for the ordinary-coefficient comparison only.

**Checks.**

- Over Q, `(0,1,0,s/4)` has normalized discriminant s, while `(1,0,0,1)` has `D=1` and ordinary cubic discriminant `−27`.
- The vector `(1,0,0,0)` has `D=0`. For `(0,1,0,1)`, `D=4`, but its affine polynomial `3X²+1` has discriminant `−12`, rather than `−108`. This is the negative control for the leading-coefficient hypothesis.
- Modulo 3, `(1,0,0,1)` still has `D=1`, although the ordinary discriminant is zero. Modulo 2 its normalized and ordinary discriminants both equal 1. Multiplying `(1,0,0,1)` by 2 over `ℤ` gives `D=16`, not 4.
- For `T=((1,1),(0,1))`, `dividedSubst T (1,0,0,1)=(2,1,1,1)` and D remains 1. Ordinary coefficient substitution on that same tuple would give `(2,3,3,1)`, whose normalized D is −23.
- Over `F₃`, `(0,1,0,0)` and the zero divided vector have identical ordinary coefficient vectors; they remain distinct divided vectors.
- Swapping variables sends `(1,2,3,5)` to `(5,3,2,1)`, with D=5 on both sides.
- `diag(2,1)` sends `(1,0,0,1)` to `(8,0,0,1)`, changing D from 1 to 64 as required by determinant-six covariance.

**Three-isogeny mirror dictionary.** All cubic orbits and stabilizers in this target, including the integral dictionary and multiplicity, use `Cubic.dividedSubst` on the divided coefficients above. Let F be a field of characteristic different from 2,3 and `φ:A→A′` a degree-three isogeny of abelian varieties. Write `K₀=F[t]/(t²−D)` for the quadratic étale algebra describing the action on `A[φ]`, taking the split algebra for the constant kernel. Define its mirror `K=F[t]/(t²−Dhat)`, `Dhat=−3D`. Require the API `ThreeIsogeny.mirrorKernelEquiv`: `A[φ]≃ker(N:Res_{K/F}μ₃→μ₃)`; `ThreeIsogeny.cubicOrbitEquiv`: `H¹(F,A[φ])≃SL₂(F)\{f:D(f)=4Dhat}`; and `ThreeIsogeny.solubleOrbitEquiv`: the φ-soluble subset identifies with `A′(F)/φA(F)`, with localization commuting. Here φ-soluble means that the cohomology class lies in the actual isogeny Kummer image; it is not the reducibility or field-discriminant predicate. The neutral orbit is `3x²y+Dhat y³`. Quadratic twist by s changes Dhat to Dhat·s ([3], Proposition4.1, Theorem4.2, pp.6–7; Definition5.1 and Theorem5.3, pp.8–9).

For integral orbits over a Dedekind domain R with fraction field F of characteristic different from 2,3 and nonzero integral Dhat, retain ideal triples `(I,δ,α)`, with `I³⊂δS`, `N(I)=αR` and `N(δ)=α³` for `S=R[t]/(t²−Dhat)`. Rescaling by `κ` sends `(I,δ,α)` to `(κI,κ³δ,N(κ)α)`. Stabilizers are norm-one cube-torsion units in `End_S(I)`, not an assumed constant group of order three. For a DVR and maximal S, unit norm-one cubeclasses give exactly the integral orbits ([3], Theorem3.1, Proposition3.5, p.6). For `R=O_v` in a finite extension `F_v/Q_p`, define `ThreeIsogeny.integralMultiplicity(f)` as `Σᵢ |Stab_{SL₂(F_v)}(f)|/|Stab_{SL₂(O_v)}(fᵢ)|` over the finitely many integral orbits in the rational orbit of f. Its API includes invariance on a rational orbit, finiteness of this integral fibre, and the mass identity `Σᵢ 1/(m(f)·|Stab(fᵢ)|)=1/|Stab(f)|` when that fibre is nonempty. This is the binary-cubic specialization of the rational/integral orbit weight in [1], §3.2, definitions of m and `m_p` on p.24 and Proposition3.6, pp.24–25, using [3], Theorem3.1 for its fibre. The soluble rational mass is `Σ` over φ-soluble `SL₂(F_v)`-orbits of `1/|Stab(f)|=|A′(F_v)/φA(F_v)|/|A(F_v)[φ]|` by [3], Theorems4.2,5.3, pp.7,9; this is the local factor used in [3], Theorem8.1, pp.12–13. It is not the multiplicity of a single integral orbit.

At `p>3`, the local integral-representative theorem assumes a twist of good reduction and `v(Dhat)<2` ([3], Theorem6.2, pp.9–10). For arbitrary finite places, including those above 2 and 3, one may choose a single integral representative of the squareclass Dhat, depending on `φ`, so that every soluble local orbit for integral s with `v(s)<2` has an integral representative ([3], Theorem7.2, p.11). The global integral assertion is made over Q for squarefree s in a fixed finite-congruence family, after one uniform choice of Dhat, and extends to class-number-one fields; no unrestricted principal-basis assertion over every number field is made ([3], Theorem7.3, Corollary7.4 and Remark7.5, p.11). The Selmer/rational-orbit dictionary itself holds over every number field ([3], Theorem7.1, p.10). *Needs:* AbelianSchemesAndArithmeticModuli Layers A2–A3 isogenies, SelmerIwasawaCohomology Layers 0–4 Kummer maps, and GlobalNumberFields Layer 11’s number-field fractional ideals and norms, and the [full-lattice order comparison](#full-lattice-order-comparison) for the quadratic étale mirror algebra.

**Checks.**

- A constant kernel has `D=1` and mirror `F(√−3)`, not the split algebra over Q. Conversely `D=−3` gives a split mirror. This distinguishes the kernel algebra from its mirror.
- The neutral form `3x²y+Dhat y³` has coordinate vector `(0,1,0,Dhat)` and normalized discriminant `4Dhat`; its ordinary discriminant is `−108Dhat`.
- In a split mirror, `δ=(u,u⁻¹)` has norm one; `δ=(2,1)` over Q has norm 2, which is not a rational cube, and is excluded from the norm-one cubeclass kernel.
- A nonprincipal ideal cannot be replaced by a chosen generator. Integral local representatives over a number field with nontrivial class group do not by themselves supply a global free-basis representative.
- A single integral orbit with the same stabilizer as its rational orbit has `m=1` and unchanged mass. Two integral orbits with that same stabilizer have `m=2`, so their two half-weights sum to one rational-orbit weight.
- If one integral orbit has trivial stabilizer and its rational stabilizer has order three, `m=3` and its weighted mass is `1/3`. Thus both the orbit number and the stabilizer ratio are needed in the definition.

Quintic integral realization also includes rational *nonétale* algebras. Prove the polynomial multiplication construction is associative and unital over every coefficient ring, not merely after checking the generic `S₅` closure. Compare the nonzero-discriminant locus with the trace-dual resolvent construction and then extend the universal identities by polynomial density. The based sextic discriminant is `(16 disc R)³`. Sources are HCL IV, §§2–4, including its multiplication and resolvent formulas. When checking the quartic structure formula, the summed index condition is `k≠i`; swapping it to `k≠j` fails the ring identities.

### Examples

For `xy(x-y)` the integral twisted cubic stabilizer has six elements, so the order-three-or-trivial assertion must assume rational irreducibility. A zero cubic remains a cubic-ring tensor with degenerate discriminant; it is not an étale algebra. The cubic `x³-x` has nonzero discriminant four, and its reduction modulo two is not squarefree, illustrating why maximality and squarefree polynomial discriminant are distinct predicates.

The point-quartic construction sends the point at ∞ to the specified linear-factor orbit. For a finite point the denominators 6, 27 and 432 require the characteristic exclusions in the formula. For pencils, a vector-space isotropic g-plane is a projective `(g-1)`-plane. At `p=2` a polar-isotropic plane need not make the quadratic form vanish. The quotient `(SL_n/μ₂)(Q)` must be evaluated as rational points of a group scheme; it can exceed `SL_n(Q)/{±1}`.

Proportional coefficient rows have zero quartic minors, and the characteristic-two alternating plane with matrix `[[0,1],[1,0]]` fails the full bilinear common-isotropy condition. The first explains the excluded zero fibre in the finite minor-fibre count; the second exhibits the mixed values lost by testing only `uᵀAu`.

### Dependencies

ArithmeticStatisticsPartI Layer 0 and its symmetric-pencil and binary-order targets; polynomial resultants and finite free algebras; the full-lattice order comparison and GlobalNumberFields Layer 11’s number-field specialization; EllipticCurves Layers 1, 6 and 7; GlobalQuadraticForms Layer 5; SchemeAndStackFoundations Layers 2–3, AbelianSchemesAndArithmeticModuli Layers A2–A3; GeometryOfNumbersAndQuadraticArithmetic ArithmeticStatisticsPartI Layer 0; and DiophantineApproximationAndTranscendence §4.3 (Thue finiteness), with the uniform bound N assumed in §1.8. Symmetric group closures, genus-one integral-model dictionaries and the specialized mirror-algebra adapter are supporting constructions of this layer.

## Downstream consumers

The later arithmetic-statistics parts use the exact targets supplied here. Field and Selmer comparisons identify their family, height, equivalence relation and local weights before applying an arithmetic average. Probability convergence alone supplies no unbounded moment identity. AnalyticNumberTheoryPartII §§5.4–5.5 supplies the cubic dictionaries and takes no input from the statistics parts.

## References

<a id="ref-1"></a>

[1] Manjul Bhargava and Arul Shankar. [Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves](https://arxiv.org/abs/1006.1002v3). arXiv:1006.1002v3 (version 3), dated 24 December 2013, 36 pp.; published in Annals of Mathematics 181 (2015), 191–242.

<a id="ref-6"></a>

[6] Manjul Bhargava, Arul Shankar and Jacob Tsimerman. [On the Davenport-Heilbronn theorems and second order terms](https://arxiv.org/abs/1005.0672). arXiv:1005.0672v3 (20 June 2012); Inventiones Mathematicae 193 (2013), 439-499.

<a id="ref-7"></a>

[7] Benedict H. Gross and Mark Lucianovic. [On cubic rings and quaternion rings](https://people.math.harvard.edu/~gross/preprints/cubquat.pdf). Journal of Number Theory 129 (2009), 1468-1478; author preprint (11 pp.).

<a id="ref-8"></a>

[8] Wee Teck Gan, Benedict Gross and Gordan Savin. [Fourier coefficients of modular forms on G2](https://www.math.utoronto.ca/~ila/GanGrossSavin.pdf). Duke Mathematical Journal 115 (2002), 105-169 (published version).

<a id="ref-9"></a>

[9] Manjul Bhargava. [Higher composition laws III: The parametrization of quartic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf). Annals of Mathematics 159 (2004), 1329-1360 (published version, open access).

<a id="ref-10"></a>

[10] Manjul Bhargava. [Higher composition laws IV: The parametrization of quintic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf). Annals of Mathematics 167 (2008), 53-94 (published version, open access).

<a id="ref-11"></a>

[11] J. E. Cremona and T. A. Fisher. [On the equivalence of binary quartics](https://www.dpmms.cam.ac.uk/~taf1000/papers/quarticequiv.pdf). Journal of Symbolic Computation 44 (2009), 673-682; author preprint dated 3 December 2008.

<a id="ref-12"></a>

[12] J. E. Cremona, T. A. Fisher and M. Stoll. [Minimisation and reduction of 2-, 3- and 4-coverings of elliptic curves](https://arxiv.org/abs/0908.1741). arXiv:0908.1741v1 (12 August 2009); Algebra & Number Theory 4 (2010), 763-820.

<a id="ref-13"></a>

[13] Tom Fisher. [The invariants of a genus one curve](https://arxiv.org/abs/math/0610318). arXiv:math/0610318v1 (10 October 2006); Proceedings of the London Mathematical Society (3) 97 (2008), 753-782.

<a id="ref-14"></a>

[14] Tom Fisher. [On binary quartics and the Cassels-Tate pairing](https://arxiv.org/abs/2208.14977). arXiv:2208.14977v1 (31 August 2022); Research in Number Theory 8 (2022).

<a id="ref-15"></a>

[15] Manjul Bhargava and Wei Ho. [Coregular spaces and genus one curves](https://arxiv.org/abs/1306.4424). arXiv:1306.4424v1 (19 June 2013); Cambridge Journal of Mathematics 4 (2016).

<a id="ref-16"></a>

[16] Melanie Matchett Wood. [Quartic rings associated to binary quartic forms](https://arxiv.org/abs/1007.5501). arXiv:1007.5501 (15 pp.); International Mathematics Research Notices 2012, no. 6, 1300-1320.

<a id="ref-17"></a>

[17] Michael Stoll. [Descent on elliptic curves](https://arxiv.org/abs/math/0611694). arXiv:math/0611694v1 (22 November 2006); Panoramas et Syntheses 36 (2012), 151-179.

<a id="ref-18"></a>

[18] J. E. Cremona, T. A. Fisher, C. O'Neil, D. Simon and M. Stoll. [Explicit n-descent on elliptic curves I. Algebra](https://www.mathe2.uni-bayreuth.de/stoll/papers/paperI-01-03-06.pdf). Journal fuer die reine und angewandte Mathematik 615 (2008), 121-155; preprint from M. Stoll's web page.

<a id="ref-33"></a>

[33] Manjul Bhargava, Arul Shankar, Ashvin A. Swaminathan. [The second moment of the size of the 2-Selmer group of elliptic curves](https://arxiv.org/pdf/2110.09063v1). arXiv:2110.09063v1 (18 October 2021).

<a id="ref-53"></a>

[53] Evan M. O’Dorney. [Rings of small rank over a Dedekind domain and their ideals](https://link.springer.com/article/10.1186/s40687-016-0054-0). Research in the Mathematical Sciences 3, 8 (2016), published HTML, DOI 10.1186/s40687-016-0054-0.

<a id="ref-59"></a>

[59] Bhargava, Shankar, Wang. [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf). published Forum of Mathematics Pi 13 (2025), e17.

<a id="ref-70"></a>

[70] Manjul Bhargava. [Higher composition laws III: The parametrization of quartic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf). Annals of Mathematics 159 (2004), 1329–1360.

<a id="ref-71"></a>

[71] Manjul Bhargava. [Higher composition laws IV: The parametrization of quintic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf). Annals of Mathematics 167 (2008), 53–94.

<a id="ref-72"></a>

[72] Melanie Matchett Wood. [Quartic rings associated to binary quartic forms](https://arxiv.org/pdf/1007.5501v2). arXiv:1007.5501v2, 31 March 2011, 15 pages.

<a id="ref-73"></a>

[73] Manjul Bhargava, Benedict H. Gross, Xiaoheng Wang. [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2). arXiv:1310.7692v2, 24 February 2017, 42 pages.

<a id="ref-74"></a>

[74] Manjul Bhargava, Arul Shankar, Xiaoheng Wang. [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3). arXiv:1611.09806v3, 31 December 2021, 29 pages.

<a id="ref-75"></a>

[75] Manjul Bhargava, Arul Shankar, Xiaoheng Wang. [Squarefree values of polynomial discriminants II](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf). Author-hosted PDF dated 4 April 2025.

<a id="ref-76"></a>

[76] Manjul Bhargava, Wei Ho. [Coregular spaces and genus one curves](https://arxiv.org/pdf/1306.4424v1). arXiv:1306.4424v1, 19 June 2013, 82 pages; published text.


<a id="ref-3"></a>

[3] Manjul Bhargava, Zev Klagsbrun, Robert J. Lemke Oliver and Ari Shnidman. [Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf). Author version, 25 pp.; Duke Mathematical Journal 168 (2019), 2951–2989.

<a id="ref-77"></a>

[77] Manjul Bhargava and Arul Shankar. [Ternary cubic forms having bounded invariants, and the existence of a positive proportion of elliptic curves having rank 0](https://arxiv.org/pdf/1007.0052v2). arXiv:1007.0052v2, 24 December 2013.

<a id="ref-78"></a>

[78] Manjul Bhargava and Arul Shankar. [The average number of elements in the 4-Selmer groups of elliptic curves is 7](https://arxiv.org/pdf/1312.7333v1). arXiv:1312.7333v1, 27 December 2013.

<a id="ref-79"></a>

[79] Manjul Bhargava and Arul Shankar. [The average size of the 5-Selmer group of elliptic curves is 6, and the average rank is less than 1](https://arxiv.org/pdf/1312.7859v1). arXiv:1312.7859v1, 29 December 2013.

<a id="ref-80"></a>

[80] M. A. Bennett. [On the representation of unity by binary cubic forms](https://personal.math.ubc.ca/~bennett/B-Cubic.pdf). Transactions of the AMS 353 (2001), 1507–1534, Theorem 1.4, p.1509; the discriminant-49 example is on p.1510.
