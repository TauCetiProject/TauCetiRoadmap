# Roadmap: arithmetic statistics, Part I: families, heights and local specifications

**Summary.** Define the counting carriers, heights with `Northcott` finiteness, local specifications, binary-form conventions and exact function-field slices used throughout arithmetic statistics. Prove finite-sublevel and local-density identities before introducing any limiting arithmetic average.

## Scope and ownership

This part owns families, heights and local specifications. Layer 0 constructs the family interface, local coefficient statistics, finite bundle laws and exact function-field slices. Orbit dictionaries, global counts, Selmer means and limiting laws consume these objects. The API names below specify the library interfaces to build. `Suggested.lean` states headline results on the pinned carriers, with coefficient polynomials in `TauCetiRoadmap.ArithmeticStatisticsPartI.Coefficients`.

The following boundaries fix the carriers and prevent parallel versions of existing mathematics.

- TauCetiRoadmap.EllipticCurves Layers 1, 4–8 supply isogenies, local point groups, quadratic twists, Mordell–Weil, finite Selmer groups and their exact sequence, and the unique integral minimal short pair over `ℚ`. Here the new elliptic-family adapter sends that pair `(A,B)` to `(−3A,−27B)` and tracks the resulting height and local-density factors. Mathlib's pointwise `WeierstrassCurve.naiveHeight` is a height on points and is not this curve-family height.
- TauCetiRoadmap.GlobalNumberFields Layers 9–11 own discriminants, orders, Picard groups and the number-field lattice dictionary. GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3, 3.2 supplies primitive adapted bases and maximal-minor ideals for the integer saturation-index comparison here. Its §§2.2–2.8 and IntegralLattices supply the hermitian and integral-lattice comparisons used in polarization fibres.
- TauCetiRoadmap.NumberFieldArithmetic Layers 1, 4 and 6 and TauCetiRoadmap.LocalFieldsRamification Layer 3 supply splitting, relative discriminants, towers and local ramification. TauCetiRoadmap.ClassFieldTheory Layers 11–13 supplies number-field Artin reciprocity, unramified class fields and conductor characters. ArithmeticGaloisDuality §R02.3.2 supplies function-field reciprocity and finite S-class groups. The exact function-field slices retain the removed infinity places and their degrees.
- SchemeAndStackFoundations §§3.6–3.7 owns unpointed Picard schemes and their degree torsors, the Picard–Brauer obstruction, rational-divisor-class comparison, norm and high-degree Abel maps. The Picard quotient, carry and Hecke probability here are finite statistical specializations. AbelianSchemesAndArithmeticModuli:A3 supplies theta groups and Cartier-dual isogeny kernels; A6 supplies polarized automorphisms and the Rosati-positive-unit orbit description of principal polarizations. The finite counting fibres and their asymptotics are new.
- TauCetiRoadmap.AlgebraicVectorBundles L0 supplies finite locally free sheaves, their rank, tensor products and line-bundle comparison. JacobianChallenge Layers B–C supply curve cohomology, Riemann–Roch and finite pushforward; AlgebraicCurves Layers 7 and 10 supply double-cover genus and smooth models. The rank-two splitting and hyperelliptic bundle-index formulas needed for the probabilities are the specialization stated in [the bundle geometry contract](#support-bundle-geometry).
- InverseGaloisAndArithmeticFundamentalGroups:IG.3–IG.5 own reduced Schur multipliers and covers, arithmetic lifting invariants and Hurwitz components. They are imported with their marked central-cover choices and cyclotomic power actions. Here embedded wreath types, infinity rigidifications and the normalized component sums specify which arithmetic moments are counted.

The pointwise two-Selmer rank identity is supplied by EllipticCurves Layer 7's exact sequence and Layer 6's Mordell–Weil theorem: `dim Sel₂(E)=rank E(ℚ)+dim E(ℚ)[2]+dim Sha(E)[2]`. Its explicit descent cardinal formula and rank inequality are already `WeierstrassCurve.Affine.card_range_μ` and `WeierstrassCurve.Affine.pow_rank_le_card_of_range_μ_le` in `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup`, transported by EllipticCurves' explicit/cohomological comparison. These are pointwise inputs; an average additionally specifies its family and denominator.

AnalyticNumberTheoryPartI §§0.25–0.26, 2.3–2.5 and AnalyticNumberTheoryPartII §§5.4–5.7, 5.21, 5.28–5.29 supply the analytic and cubic input. The other supplier contracts are: SchemeAndStackFoundations; GeometryOfNumbersAndQuadraticArithmetic; AdelicAlgebraicGroups; DiophantineApproximationAndTranscendence; InverseGaloisAndArithmeticFundamentalGroups; AbelianSchemesAndArithmeticModuli; ReductiveGroupsPartII; SelmerIwasawaCohomology; ArithmeticGaloisDuality; NeronModelsAndSemistableAbelianVarieties; EtaleDualityAndPerverseSheaves; and DeligneWeightsAndPurity. Specialized facts needed here are local supporting targets.

## Conventions

All finite-field cardinalities `q` are prime powers greater than one. A letter `p` or `ℓ` declared prime is a natural prime. An integer modulus is positive unless its zero case is explicitly discussed. Empty products have value one, zero-dimensional vector spaces and the trivial group are retained, and any formula with `q^i-1` in a denominator specifies the positive index range. At characteristic two, alternating means zero diagonal as well as skew symmetry; polar isotropy alone is not quadratic isotropy.

A height includes its carrier and equivalence relation. Inclusive Northcott sublevels use `H≤X`; strict source counts use `H<X`. Passing between them requires the stated boundary estimate. A field is counted up to base-field isomorphism unless an embedded or rigid family is named. An orbit count is unweighted unless its reciprocal stabilizer or rational-orbit weight is displayed. A natural cardinal is used only after finiteness; the value zero of `Nat.card` on an infinite type never licenses division. The average of an empty finite sublevel is zero, but any limiting ratio theorem assumes the specified positive denominator.

Binary coefficients descend in x-degree, and changes of variables use row vectors. Cubics use the determinant-twisted GL2 action; quartics use either the ordinary GL2 action for integral orbit enumeration or the determinant-to-the-minus-two action of PGL2 for two-descent, as specified. For `(a,b,c,d,e)`, `I=12ae-3bd+c²`, `J=72ace+9bcd-27ad²-27b²e-2c³`, and the integral binary discriminant satisfies `27Δ=4I³-J²`. The fixed-degree binary discriminant is used when a leading coefficient vanishes. For the quartic `x⁴-y⁴`, `I=−12`, `J=0`, `Δ=−256`; this fixes the sign. With `E:y²=x³+Ax+B`, `(I,J)=(−3A,−27B)`, `H_E=max(4|A|³,27B²)` and `H_IJ=max(|I|³,J²/4)` satisfy `27H_E=4H_IJ`. Under the two-covering integral representative scaling `(I,J)↦(2⁴I,2⁶J)`, the invariant height scales by `2¹²`.

Coefficient lattices have additive Haar mass one locally. An algebraic-group Haar measure comes from the stated invariant differential; it is not independently renormalized during a product formula. The p-adic absolute value has `|p|_p=p⁻¹`. Archimedean coefficient regions use the displayed Euclidean or Lebesgue measure. Actual CRT residue proportions are used for coupled finite conditions; a product of marginal densities is valid only for independently imposed prime-power conditions.

Every arithmetic conjecture is a proposition, not an axiom or an unconditional distribution theorem. Distribution convergence does not imply convergence of unbounded moments. Fixed-q degree limits, fixed-degree large-q limits and iterated liminf/limsup limits are kept distinct. Selmer dimension, p-infinity Selmer corank and Mordell–Weil rank are distinguished; passing from corank to rank requires the stated condition on the divisible part of Sha. A degree-one Picard-scheme point, an actual degree-one divisor, and a point over an odd-degree extension are compared only under the explicit Brauer/local-solubility hypotheses.

## Exact supplier contracts

From Mathlib use `Northcott`, `Northcott.comp_of_finite_fibers`, finite sets and quotient/orbit types; `Polynomial.discr`, resultants, separability and `Squarefree`; `ClassGroup`, `NumberField.discr` and `NumberField.dedekindZeta_residue`; p-adic fields and integers; Haar measures, real and extended nonnegative integrals, filters, infinite sums and products; `QuadraticForm`, bilinear forms, matrices, ranks, finite-dimensional subspaces, finite abelian-group structure and Smith normal form. The prime-counting estimate is `Chebyshev.eventually_primeCounting_le` in `Mathlib.NumberTheory.Chebyshev`: for every `ε>0` and eventually x, `π(⌊x⌋)≤(log 4+ε)x/log x`. The new weighted prime-tail statements use partial summation from that estimate.

From `TauCeti.Order.Northcott.Basic` use `TauCeti.normLE`, `TauCeti.coe_normLE`, `TauCeti.summatory` and `TauCeti.eventually_summatory_indicator_sub_eq` for inclusive natural-height counts and finite changes of families.

For irreducible monic integral polynomials, `TauCeti.NumberTheory.NumberField.Index.DedekindCriterion` supplies `TauCeti.NumberField.IntegralPrimitiveElement.not_dvd_index_iff`: at a prime p, with distinct monic residue factors `φ_i` of positive multiplicities `e_i`, chosen monic lifts `Φ_i` and `pH=f−∏Φ_i^e_i`, p does not divide the order index exactly when every i has `e_i=1` or `φ_i∤H mod p`. The reducible separable-algebra extension and exact local proportions in §0.12 remain targets here.

The alternating-extension transfer consumes `TauCeti.NumberField.discr_emod_four_eq_zero_or_one` from `TauCeti.NumberTheory.NumberField.Discriminant.Stickelberger` and `NumberField.discr_eq_of_squarefree_of_mod_four_eq_one` from `TauCeti.NumberTheory.NumberField.Quadratic.RingOfIntegers`. The latter requires `minpoly ℤ θ=X²−d`, generation over `ℚ`, squarefree d and `d≡1 mod 4`. Mathlib's `NumberField.abs_discr_gt_two` rules out a nontrivial number field of absolute discriminant one. These are existing arithmetic inputs, not new targets.

From TauCetiRoadmap.EllipticCurves Layers 4–8 require the finite exact sequence `0→E(K)/nE(K)→Sel_n(E/K)→Sha(E/K)[n]→0`, compatibility with localization, naturality under isogenies, and rational torsion. Over Q require a unique integral short pair with no prime satisfying `p⁴|A` and `p⁶|B`, nonsingular discriminant, finiteness of bounded-height pairs and invariance under Q-isomorphism. Over `ℚ_p` require a finite-index open formal subgroup isomorphic to an open additive `ℤ_p` subgroup and the reduction/component/Tamagawa dictionary. Over R require the one- or two-component compact Lie-group description. These exact local groups, not only their cardinalities, enter the five-adic labels.

From TauCetiRoadmap.ClassFieldTheory Layers 11–13 require the unramified reciprocity quotient, including split real places for ordinary classes and allowed real ramification for narrow classes, the conductor–discriminant formula, and equivariance under field automorphisms. From NumberFieldArithmetic Layers 1, 4 and 6 require norm/extension compatibility and discriminant transitivity. From GlobalNumberFields Layer 11 require the finite order-class and overorder interfaces, trace duals, ideal norms, and discriminant/index-square identities. From GlobalQuadraticForms Layer 5 require the Hasse principle for nonsingular conics over number fields, used to compare quartic descent with the cohomological two-Selmer group.

ArithmeticGaloisDuality §R02.3.2 supplies `GlobalFunctionField.classFormation`, its global/local Artin compatibility and abelian norm-group correspondence, together with `sClassGroup` and `finite_sClassGroup`. For a finite nonempty removed-place set S, transport that reciprocity to `Pic(C)/⟨[v]:v∈S⟩`, imposing splitting at S and retaining its degree quotient `ℤ/gcd(deg(v):v∈S)ℤ` and degree-zero kernel, as in [the function-field adapter](#support-function-fields).

From GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3 require primitive adapted bases and covolume identities; §3.2’s `hermitianMaximalMinorIdeal` supplies the general maximal-minor ideal and basis-change API. The integer two-column gcd/index comparison is a target of §0.10 here. AdelicAlgebraicGroups AA.0 supplies restricted-product measure theory for countable families of second countable locally compact groups. The adeles of `𝔽_q(t)`, rational quotient, bundle correspondence and finite-volume measure are constructed in [function-field adelic bundle measure](#function-field-adelic-bundle-measure).

The finite-dimensional singular system is already owned by [TauCetiRoadmap.OperatorTheory, PolarDecomposition Part C](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md): PD-C09–PD-C18 supply right and left singular vectors and reconstruction. Its real invertible two-dimensional specialization gives `g=k diag(u,u⁻¹)l`, `u≥1`, for `|det g|=1`, with k,l orthogonal. This is the supplier used in compact binary transporters. Mathlib's `LinearMap.IsSymmetric.eigenvectorBasis` in `Analysis.InnerProductSpace.Spectrum` already supplies the underlying spectral theorem; no general singular-decomposition theory is planned here.

From SchemeAndStackFoundations Layers 0–3 and §§3.6–3.7 require representability and base change for the specified moduli problems, finite étale covers, smooth lifting, unpointed Picard degree torsors, and the Picard–Brauer exact sequence. From AbelianSchemesAndArithmeticModuli:A2–A3 require abelian isogenies, duality, polarizations and theta-group commutators, with fppf cohomology when the degree meets the characteristic; A6 gives the Rosati orbit description and finite polarized automorphism groups. Its §A6.4 supplies `simpleEndDivision`; §A6.5 supplies `poincareReducibility` and unique simple-factor multiplicities. ReductiveGroupsPartII §RG2.3.7 supplies Lang's theorem and torsor triviality for smooth connected groups over finite fields, specialized here to abelian varieties and Pic¹ torsors. From NeronModelsAndSemistableAbelianVarieties Layers 1–4 require local existence, semistable reduction, normalization/Picard exact sequences, graph monodromy and the identity-component comparison used in the twist parity formulas.

From SelmerIwasawaCohomology Layers 0–4 require continuous/fppf cohomology, Kummer localization, finite Selmer groups and torsors and the p-infinity corank interface. ArithmeticGaloisDuality §§D7, R02.4 supplies Poitou–Tate, local invariants and local pairings. SelmerIwasawaCohomology §4.29 supplies `CasselsTate`, `CasselsTate.isogeny_adjoint`, the maximal-divisible-radical statements and the finite nondegenerate primary quotients. SchemeAndStackFoundations §3.6 and JacobianChallenge Layer D supply the degree/index and Picard–Brauer comparison: a rational relative Picard point is identified with a line bundle only after its obstruction vanishes.

From InverseGaloisAndArithmeticFundamentalGroups:IG.0–IG.2 require finite embedding problems, quantitative Hilbert irreducibility and the fixed-model Lang–Weil estimate. IG.3 supplies `H₂(F,c)=H₂(F,ℤ)/Q_c`, a chosen reduced cover, functorial cyclotomic powers and the Tate-twisted component invariant. IG.4 supplies global arithmetic lifting invariants over number fields and the marked-extension and unramified Gamma-group carriers over global fields. IG.5 supplies Hurwitz components with their rational Frobenius action. A stable component formula is used only in its stable multidegree range; boundary components remain in the total profile.

From EtaleDualityAndPerverseSheaves §§0.5–0.6, 6.3 and DeligneWeightsAndPurity:DWP.7 require compactly supported cohomology, the trace formula, Poincaré duality, weights and the uniform Betti-bound hypotheses stated below. DeligneWeightsAndPurity §1.6 supplies `#C(𝔽_(q^m))=q^m+1-Σ_i α_i^m` and `|#C(𝔽_(q^m))-(q^m+1)|≤2gq^(m/2)` for a smooth proper geometrically connected curve. Its §1.4–1.5 supplies the weight-one abelian Frobenius roots and `#A(𝔽_(q^m))=det(1-π^m)`. Arithmetic Frobenius on the Tate module and geometric Frobenius on cohomology are not interchanged.

From AnalyticNumberTheoryPartII require the [binary-cubic action and discriminant](../AnalyticNumberTheoryPartII/README.md#s5-4) (§5.4), [projective cubic-algebra equivalence](../AnalyticNumberTheoryPartII/README.md#s5-5) (§5.5), [finite weighted cubic coefficients](../AnalyticNumberTheoryPartII/README.md#s5-6) (§5.6), [uniform small-degree field bound](../AnalyticNumberTheoryPartII/README.md#s5-7) (§5.7), [cubic analytic extension and residues](../AnalyticNumberTheoryPartII/README.md#s5-21) (§5.21), [pole-aware cubic convexity](../AnalyticNumberTheoryPartII/README.md#s5-28) (§5.28), and [quadratic large sieve and real-character moment](../AnalyticNumberTheoryPartII/README.md#s5-29) (§5.29). The projective equivalence includes nonprincipal rank-two modules, stabilizers and determinant-line discriminants; restricting to the free coefficient lattice does not discard those general inputs. The cubic descriptions below are import and compatibility contracts for those objects, with the displayed basis/sign adapters, rather than a second construction of them. The local selectors below use those carriers; global sieve applications retain a separate tail hypothesis. AnalyticNumberTheoryPartI §§2.3–2.5 supplies Hecke/Dedekind extension and residue comparisons; §§0.25–0.26 supplies prime-product bounds. Completed ArithmeticDirichletSeries Layers 6 and 9 supplies Abel/Perron summation and Wiener–Ikehara, retaining coefficient positivity, convergence domains, residues and continuous boundary remainders. DiophantineApproximationAndTranscendence §2.4 supplies finite-rank unit-equation bounds and §4.3 supplies effective Thue finiteness. Embedding-fibre applications keep their source-specific uniform degree-three bound, its numerical constant and the order/cross-ratio comparison as explicit additional hypotheses.

<a id="cubic-supplier-conventions"></a>

### Cubic supplier conventions

<a id="binary-cubic-forms-and-the-twisted-action"></a>

**Binary cubic forms and the twisted action.** For a commutative ring R, a binary cubic form over R is `f(x,y) = a x³ + b x² y + c x y² + d y³` with a, b, c, d in R, recorded by its four coefficients `(V₃(R) = R⁴)`. Its discriminant is `disc(f) = b² c² − 4 a c³ − 4 b³ d − 27 a² d² + 18 a b c d`, which is Mathlib's `Cubic.discr` of the coefficient vector (valid also when `a = 0`). The group `GL2(R)` acts on the left by the twisted action `(γ . f)(x,y) = (det γ)⁻¹ f((x,y) γ)`, where `(x,y) γ = (g00 x + g10 y, g01 x + g11 y)` for `γ = (g_ij)`. The action is faithful: the scalar `u.1` acts as multiplication by u. It satisfies `disc(γ . f) = (det γ)² disc(f)`, and it commutes with base change of coefficients along ring homomorphisms.

[AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md#s5-4) §5.4 supplies the action and ordinary discriminant; the coefficient/base-change API below is its arithmetic-family adapter. The formulas below fix the statistical coordinate convention.

R is a commutative ring; no assumption on 2 or 3 is made. Convention pinned: the substitution is by the row vector `(x, y)` times `γ`, and the twist is `(det γ)⁻¹`; with this convention the Delone-Faddeev correspondence is `GL2(R)`-equivariant for the change of basis of `R(f)/R`. The discriminant is the discriminant of the binary form, not of the dehomogenized polynomial: for `a = 0` it is `b² (c² − 4 b d)`, not the discriminant of a quadratic.

The supplier API is AnalyticNumberTheoryPartII §5.4’s `cubicAction.one`, `cubicAction.mul` and `cubicAction.discriminant_covariance`, with Mathlib’s `Cubic.discr`. Coefficient evaluation, scaling, dehomogenization and maps use that existing carrier; no `BinaryCubicForm` structure or transported copy of `Cubic` is introduced. Base change commutes with substitution and discriminant, and coefficient scaling by u multiplies the discriminant by `u⁴`.

Use AnalyticNumberTheoryPartII §5.4’s `cubicAction.one`, `cubicAction.mul` and `cubicAction.discriminant_covariance` on Mathlib’s `Cubic` carrier. Under ordinary substitution the discriminant gains `det(γ)⁶`; the twist contributes `det(γ)⁻⁴`, leaving `det(γ)²`. A scalar u contributes `u³` from substitution and `u⁻²` from the twist, hence acts by u. The faithfulness assertion concerns formal coefficients, including over small finite fields.

*Needs:* `Cubic` (Mathlib), `Cubic.discr` (Mathlib), `Matrix.GeneralLinearGroup` (Mathlib), `Matrix.GeneralLinearGroup.det` (Mathlib), `Matrix.GeneralLinearGroup.scalar` (Mathlib).

([[6]](#ref-6), Section 2, (9), printed p. 4; [[7]](#ref-7), Section 2, printed p. 2.)

**Checks.**

- The form `x² y − x y²` over `ℤ` has discriminant 1.

- The scalar matrix 2 in `GL2(ℚ)` sends `(a,b,c,d)` to `(2a,2b,2c,2d)`, not to `(8a,8b,8c,8d)` as the untwisted substitution would.

- The form `x³` has discriminant 0.

- The swap matrix `(0 1; 1 0)` in `GL2(ℤ)` sends `(a,b,c,d)` to `(−d,−c,−b,−a)`.

<a id="cubic-ring"></a>

**Cubic ring.** A cubic algebra over a commutative ring R is a commutative R-algebra A (with 1) equipped, up to change of basis, with an R-basis indexed by `Fin 3`; a cubic ring is a cubic `ℤ`-algebra. For nontrivial R this is equivalently `Module.Free R A`, `Module.Finite R A` and `Module.finrank R A = 3`. The basis formulation also applies to the zero ring, where finrank is zero and cannot express the intended rank. The discriminant of A with respect to a basis b is `Disc_b(A) = det(Tr_{A/R}(b_i b_j))`, Mathlib's `Algebra.discr R b`; a change of basis by P multiplies it by `(det P)²`, so it is a well-defined element of the orbit set of R under multiplication by unit squares, denoted `R/(Rˣ)²`, and for `R = ℤ` an integer independent of the basis. A ring A that is free of finite rank over `ℤ` is maximal at a prime p if every subring B with A subset B subset `A[1/p]` that is finitely generated as a `ℤ`-module equals A; it is maximal if it is maximal at every prime.

[AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md#s5-5) §5.5 supplies the general locally free cubic algebra; this free `Fin 3` specialization keeps maximality as its additional statistical predicate. The formulas below fix the statistical coordinate convention.

Rank 3 and freeness are part of the notion; over a PID or a local ring the quotient `A/R.1` is then free of rank 2 (quotient-by-scalars-is-free). Maximality at p is tested only against overrings inside `A[1/p]` (index a power of p); this is Bhargava-Shankar-Tsimerman's `R₁ = R' ∩ (R ⊗ ℤ[1/p])`. For a free `ℤ`-module A of finite rank the map `A → A[1/p]` is injective, so A is identified with its image.

Use Mathlib’s `Algebra.discr` and `Algebra.discr_of_matrix_mulVec` for the trace matrix and basis changes. AnalyticNumberTheoryPartII §5.5’s `projective_form_equiv_cubic_algebra` and `discriminant_ideal` supply the general algebra and its determinant-line discriminant; the free-coordinate discriminant is its value in the chosen basis. `CubicRing.IsMaximalAt`, `CubicRing.IsMaximal`, `isMaximal_iff_forall_isMaximalAt` and `isMaximal_ringOfIntegers` are the additional statistical API of §0.8.

Use `Algebra.discr` directly; the change-of-basis formula is Mathlib's `Algebra.discr_of_matrix_mulVec`, and over `ℤ` the unit determinant is `±1`, so the discriminant is basis-independent. Define `IsMaximalAt p A` by quantifying over the subrings of `Localization.Away (p : A)` containing the image of A and finitely generated over `ℤ`; `IsMaximal A` is maximality at every prime. The ring of integers of a number field is maximal: a subring of K finite over `ℤ` consists of integral elements, hence lies in the integral closure (Mathlib `NumberField.RingOfIntegers`).

*Needs:* `Algebra.discr` (Mathlib), `Algebra.discr_of_matrix_mulVec` (Mathlib), `Module.Free` (Mathlib), `Module.finrank` (Mathlib), `Localization.Away` (Mathlib), `NumberField.RingOfIntegers` (Mathlib).

([[6]](#ref-6), Section 2, printed p. 4, and Section 3, printed p. 6; [[6]](#ref-6), Proof of Lemma 13, printed p. 7; [[8]](#ref-8), Section 4, printed p. 116.)

**Checks.**

- The standard basis of `ℤ³` (as the ring `Fin 3 → ℤ`) has discriminant 1.

- Over the zero ring R, `R³` still has its `Fin 3`-indexed basis, but `Module.finrank R (R³)=0`. Requiring `finrank=3` without `Nontrivial R` would incorrectly exclude this base change.

- The power basis of `ℤ[x]/(x³ − 2)` has discriminant `−108`.

- `ℤ[x]/(x³)` is not maximal at 2.

- `Disc(ℤ³) = 1` in the standard basis; `Disc(ℤ[2^{1/3}]) = -108` in the power basis.

- `ℤ[x]/(x³)` is not maximal at 2: `ℤ + ℤ x + ℤ (x²/2)` is a ring strictly between it and its localization.

<a id="cubic-ring-of-a-binary-cubic-form"></a>

**Cubic ring of a binary cubic form.** For a binary cubic form `f = (a,b,c,d)` over a commutative ring R, let `R(f)` be the commutative R-algebra with R-basis `<1, ω, θ>` and multiplication `ω θ = -ad`, `ω² = -ac − b ω + a θ`, `θ² = -bd − d ω + c θ`. It is constructed as `R[X₀, X₁]/(X₀ X₁ + ad, X₀² + ac + b X₀ − a X₁, X₁² + bd + d X₀ − c X₁)`. It is associative and commutative, free of rank 3 with the stated basis; the constants `−ad`, `−ac`, `−bd` are the only ones compatible with associativity for a normal basis (`ω θ` in R). Moreover: `γ . f` gives an isomorphic R-algebra for `γ` in `GL2(R)`; the natural map `R(n f) → R(f)` has image `R + n R(f)`, and identifies these algebras when n is a non-zero-divisor in R; for `a = 1`, `R(f) = R[ω]` with `ω³ + b ω² + c ω + d = 0`; and `R(f) ⊗_R S = R(f_S)` for any R-algebra S.

[AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md#s5-5) §5.5 supplies the algebra and its base change; use its simultaneously negated normal basis to obtain the signs below. The formulas below fix the statistical coordinate convention.

Sign convention pinned (Bhargava-Shankar-Tsimerman (10)-(11)): `ω² = -ac − b ω + a θ`. Gross-Lucianovic and HCL III use the basis `<1, i, j> = <1, −ω, −θ>`, with `i² = -ac + b i − a j`; the index form of their basis is `−f`. No hypothesis on R.

The supplier’s `projective_form_equiv_cubic_algebra` supplies the free algebra, basis, equivariant algebra isomorphisms and base change. The adapter API is `cubicNegatedBasis`, the basis `(1,−ω,−θ)` giving the displayed signs; `cubicRingMonicEquiv`, identifying `a=1` with `R[X]/(X³+bX²+cX+d)`; and `cubicRingScaleHom`, taking `ω` and `θ` to n times their counterparts, with image `R+nR(f)` and injectivity exactly when n is a nonzerodivisor. The basis coordinates are `1, ω, θ` in that order, so basis evaluation and trace matrices use this fixed ordering.

AnalyticNumberTheoryPartII §5.5 supplies the associative free algebra, its basis and the change-of-basis and base-change isomorphisms. In the negated basis, the monic relation is `ω³+b ω²+c ω+d=0`. The content map has diagonal matrix `diag(1,n,n)`, image `R+nR(f)`, and is injective exactly when multiplication by n on R is injective. Thus `n=0` over a nonzero ring is excluded from the isomorphism-onto-image statement. These are basis and content adapters for the supplied algebra. Source locators and coefficient checks below fix the conventions.

*Needs:* [binary cubic forms and the twisted action](#binary-cubic-forms-and-the-twisted-action), [cubic ring](#cubic-ring), `MvPolynomial` (Mathlib), `Ideal.Quotient.mk` (Mathlib), `AdjoinRoot` (Mathlib).

([[6]](#ref-6), Proof of Theorem 9, (10)-(11), printed pp. 4-5; [[7]](#ref-7), Section 3, Examples 1-3, printed p. 4; [[9]](#ref-9), Introduction, printed p. 1332.)

**Checks.**

- `R(x² y − x y²)` is isomorphic to `ℤ³` as a `ℤ`-algebra.

- For `f = 0`: `ω² = θ² = ω θ = 0`.

- `R(x³ + 2 y³)` is isomorphic to `ℤ[x]/(x³ + 2)` (`AdjoinRoot`).

- For `f = y(x² + y²) (a = 0)`: `ω θ = 0` with `ω`, `θ` nonzero, so `R(f)` is not a domain.

- `R(x² y − x y²) = ℤ³` via `ω ↦ (−1,0,0)`, `θ ↦ (0,−1,0)` (BST, proof of Proposition 10).

<a id="discriminant-of-the-cubic-ring-of-a-form"></a>

**Discriminant of the cubic ring of a form.** For every binary cubic form f over a commutative ring R, the discriminant of `R(f)` with respect to its normal basis `<1, ω, θ>` equals `disc(f) = b²c² − 4ac³ − 4b³d − 27a²d² + 18abcd`.

[AnalyticNumberTheoryPartII](../AnalyticNumberTheoryPartII/README.md#s5-5) §5.5 supplies the discriminant comparison; the trace-matrix calculation below checks the chosen negated basis. The formulas below fix the statistical coordinate convention.

R is any commutative ring; the identity is a polynomial identity in `ℤ[a,b,c,d]`.

In the supplied algebra, traces in the basis `<1, ω, θ>`: `Tr(1) = 3`, `Tr(ω) = -b`, `Tr(θ) = c`, `Tr(ω²) = b² − 2ac`, `Tr(θ²) = c² − 2bd`, `Tr(ω θ) = -3ad` (from the multiplication table; Gan–Gross–Savin use `(α,β)=(−ω,−θ)`, so their linear traces are b and −c, while their squared and mixed traces agree with these). The determinant of the 3 x 3 trace matrix expands to `disc(f)` (a direct polynomial computation, as Bhargava-Shankar-Tsimerman state); the conceptual route through the uniqueness of the degree-4 SL2-invariant up to scalar is not needed.

*Needs:* [cubic ring of a binary cubic form](#cubic-ring-of-a-binary-cubic-form), [cubic ring](#cubic-ring), `Algebra.discr` (Mathlib).

([[6]](#ref-6), Proposition 10 and (12), printed p. 5; [[8]](#ref-8), Section 4, printed p. 116.)

**Checks.**

- `f = x² y − x y²`: `R(f) = ℤ³` and both discriminants are 1.

- `f = x³ + 2y³`: `-108 = Disc ℤ[2^{1/3}]`.

- For `f=x²y`, `Tr(ω)=−1` whereas `Tr(α)=1` for `α=−ω`; the basis sign changes the linear trace.

## How to read the build

The mathematical specification is this README; `Suggested.lean` states headline theorems on the pinned carriers, with the definitions needed to express them. The sections below state every target with its hypotheses, source locator, API and Checks. Definitions requiring new arithmetic or geometric carriers are README targets. Earlier-part supplier links point to their precise statements. The source counts retain their strict or inclusive cutoffs and their own denominators.

## Layer 0: Families, heights and local specifications

The first layer fixes what a sample point is. Its main deliverable is a family whose denominator is finite and whose local factors refer to the same objects. Local squareclass conditions, polarized-object counts and exact function-field slices require separate carriers. They cannot be replaced by the coefficient box merely because their representatives are polynomials.

### 0.1 Counting families and relative density

<a id="arithmetic-family"></a>

**Arithmetic family.** An arithmetic family is a pair `(ι, H)` in which `ι` is a type of arithmetic objects already taken up to the family's equivalence relation — a quotient type Quotient s of a type of representatives by a setoid s (integral models up to change of variables, number fields up to `ℚ`-isomorphism) or an orbit type `Γ\V = MulAction.orbitRel.Quotient Γ V` of a group action (integral binary quartic forms up to `GL₂(ℤ)`) — and H : `ι → ℝ` is a height with Mathlib's Northcott property: `{i : H(i) ≤ B}` is finite for every real B. For a weight w : `ι → M` into an additive commutative monoid, the weighted counting function is `N_H(w; X) := Σ_{H(i) ≤ X} w(i)`, a finite sum over `heightLE X = {i : H(i) ≤ X}`; the unweighted count of a subfamily `S ⊆ ι` is `N_H(S; X) := #{i ∈ S : H(i) ≤ X} = N_H(1_S; X)`; the strict-cutoff count written by the sources is `N_H^<(S; X) := #{i ∈ S : H(i) < X}`. Constructions: ofQuotient, from a class-invariant height on representatives whose induced height is Northcott; comap along a map f : `κ → ι` with finite fibres (Northcott by Mathlib's `Northcott.comp_of_finite_fibers`), with the multiplicity formula `N_{H∘f}(f⁻¹S; X) = N_H(#f⁻¹(·)·1_S; X)`, which is how an isomorphism multiplicity is made explicit; rescale by `c > 0`, with `N_{cH}(S; X) = N_H(S; X/c)`; ofNat for a natural-valued Northcott height N, whose carrier heightLE is Tau Ceti's normLE N and whose weighted count is Tau Ceti's summatory N w; ofMulHeight, the elements of a number field ordered by Mathlib's multiplicative Weil height `mulHeight₁` (Northcott by `NumberField.finite_setOfPred_mulHeight₁_le`). Proposed declaration: the structure `ArithmeticFamily` with fields `height` and `northcott`. Unlike the imported natural-height summatory functions, this interface also accepts real-valued Northcott heights.

The equivalence relation is built into the type `ι`: counts are counts of classes, never of representatives, unless comap is used with its explicit fibre multiplicities. Heights are real-valued. A natural-valued height enters through ofNat and then agrees with Tau Ceti's `normLE/summatory` carrier, so Tau Ceti's counting lemmas apply unchanged. The cutoff is inclusive `(H(i) ≤ X)`, as in Tau Ceti's normLE. The strict cutoff `H(i) < X` of the sources is countLT; relative densities do not depend on the choice ([relative density](#relative-density)).

- `ArithmeticFamily.finite_height_le`: `{i : H(i) ≤ X}` is finite for every real X.

- `ArithmeticFamily.heightLE`: The finset of members of height at most X (inclusive cutoff).

- `ArithmeticFamily.mem_heightLE`: `i ∈ heightLE X ↔ H(i) ≤ X`.

- `ArithmeticFamily.weightedCount`: `N_H(w; X) = Σ_{i ∈ heightLE X} w(i) for w : ι → M, M an additive commutative monoid`.

- `ArithmeticFamily.count`: `N_H(S; X) = #{i ∈ S : H(i) ≤ X} for a subfamily S ⊆ ι`.

- `ArithmeticFamily.countLT`: The strict-cutoff `count #{i ∈ S : H(i) < X}`.

- `ArithmeticFamily.count_eq_weightedCount_indicator`: `N_H(S; X) = N_H(1_S; X) (as reals)`.

- `ArithmeticFamily.count_mono_set`: `S ⊆ T ⇒ N_H(S; X) ≤ N_H(T; X)`.

- `ArithmeticFamily.count_mono`: `X ≤ Y ⇒ N_H(S; X) ≤ N_H(S; Y)`.

- `ArithmeticFamily.count_union_of_disjoint`: For disjoint S, T: `N_H(S ∪ T; X) = N_H(S; X) + N_H(T; X)`.

- `ArithmeticFamily.count_eq_zero_of_lt`: If every height is `≥ b` and `X < b` then `N_H(S; X) = 0`.

- `ArithmeticFamily.tendsto_count_atTop`: For infinite S, `N_H(S; X) → ∞` as `X → ∞`.

- `ArithmeticFamily.countLT_le_count`: `N_H^<(S; X) ≤ N_H(S; X)`.

- `ArithmeticFamily.ofQuotient`: The family on Quotient s from an s-invariant height on representatives whose induced height is Northcott.

- `ArithmeticFamily.comap`: Pull-back along f : `κ → ι` with finite fibres; height `H ∘ f`.

- `ArithmeticFamily.count_comap`: Isomorphism multiplicity: `N_{H∘f}(f⁻¹S; X) = Σ_{i ∈ S, H(i) ≤ X} #f⁻¹(i)`.

- `ArithmeticFamily.rescale`: The family (`ι`, cH) for `c > 0`.

- `ArithmeticFamily.count_rescale`: `N_{cH}(S; X) = N_H(S; X/c)`.

- `ArithmeticFamily.ofNat`: The family of a natural-valued Northcott height N, heights `(N i : ℝ)`.

- `ArithmeticFamily.heightLE_ofNat`: The finite height sublevel set for ofNat N equals the imported TauCeti.normLE N X.

- `ArithmeticFamily.ofMulHeight`: The elements of a number field K ordered by Mathlib's `mulHeight₁` (Northcott by `NumberField.finite_setOfPred_mulHeight₁_le`).

- `ArithmeticFamily.weightedCount_ofNat`: The weighted count for a natural Northcott height equals the imported TauCeti.summatory N w X, with inclusive cutoff.

For the proof, heightLE X is the toFinset of the finite set `{i : H(i) ≤ X}` given by the northcott field; weightedCount is the finite sum over it and count is Set.ncard of `{i ∈ S : H(i) ≤ X}`. `count_eq_weightedCount_indicator`, `count_mono_set`, `count_mono`, `count_union_of_disjoint` and `count_eq_zero_of_lt` are finite-set identities. `tendsto_count_atTop`: an infinite S is not contained in any bounded-height set (those are finite), so its members have unbounded height and the monotone count tends to infinity. comap is Northcott by mathlib:`Northcott.comp_of_finite_fibers` (the instance Filter.TendstoCofinite f is exactly finiteness of fibres); `count_comap` splits `{k : f(k) ∈ S, H(f(k)) ≤ X}` into the fibres over heightLE X. rescale: `{i : cH(i) ≤ B} = {i : H(i) ≤ B/c}`. ofNat: `{i : (N i : ℝ) ≤ B} ⊆ {i : N i ≤ ⌊B⌋₊}`, finite by Northcott N; its heightLE has the members of tauceti:TauCeti.normLE (tauceti:`TauCeti.coe_normLE`), so `weightedCount (ofNat N) w =` tauceti:TauCeti.summatory N w. ofMulHeight: the northcott field is mathlib:`NumberField.finite_setOfPred_mulHeight₁_le`.

*Needs:* `Northcott` (Mathlib), `Northcott.comp_of_finite_fibers` (Mathlib), `Filter.TendstoCofinite` (Mathlib), `Set.ncard` (Mathlib), `Height.mulHeight₁` (Mathlib), `NumberField.finite_setOfPred_mulHeight₁_le` (Mathlib), `TauCeti.normLE` (Tau Ceti), `TauCeti.coe_normLE` (Tau Ceti), `TauCeti.summatory` (Tau Ceti).

([[1]](#ref-1), §2, paragraph after (6), printed p. 7; [[3]](#ref-3), §2, printed p. 2.)

**Checks.**

- The integers ordered by |n| (a Northcott height) have count 7 at `X = 3`.

- For every family and every X, the count of the empty subfamily is 0.

- The function `x ↦ |x|` on `ℚ` is not Northcott, so the rationals ordered by absolute value are not an arithmetic family.

- For `ℕ` ordered by n (ofNat id) and `X ≥ 0`, the count of all members is `⌊X⌋`₊ `+ 1`, the cardinality of Tau Ceti's normLE id X.

- The rationals ordered by |x| are rejected: the absolute value of a representative is not Northcott. The same mistake in arithmetic form is ordering rational Weierstrass equations instead of `ℚ`-isomorphism classes (EllipticCurves Layer 8 records that bounded-height finiteness fails there).

- For ofNat N, weightedCount agrees with TauCeti.summatory N w at every X, so `eventually_summatory_indicator_sub_eq` and the Abel-summation interface of Tau Ceti apply to every natural-valued family.

- Representatives against classes: for the squareclass twist family of `y² = x³ − x` over `ℚ` the twist map has fibres `{t, t + [−1]}` ([isomorphism multiplicity of the twist family](#isomorphism-multiplicity-of-the-twist-family)), and `count_comap` records the factor 2 between counting squareclasses and counting isomorphism classes of twists.

<a id="relative-density"></a>

**Relative density.** Let `(ι, H)` be an arithmetic family and S, `T ⊆ ι`. The proportion of T lying in S at cutoff X is `r_X(S | T) := N_H(S ∩ T; X)/N_H(T; X)`, read as 0 when `N_H(T; X) = 0`. The upper relative density is `d̄(S | T) := limsup_{X→∞} r_X(S | T)`, the lower relative density (the lower limiting proportion) is `d̲(S | T) := liminf_{X→∞} r_X(S | T)`, and S has relative density d in T, HasDensity S T d, when `r_X(S | T) → d` as the real cutoff `X → ∞`. The strict-cutoff proportion `r^<_X(S | T)` uses `N_H^<`. Properties: `0 ≤ r_X ≤ 1`; HasDensity S T d if and only if `d̲(S | T) = d̄(S | T) = d`; if T is infinite then T has density 1 in itself; `∅` has density 0; for infinite T, the complement `T ∖ S` has density `1 − d` and disjoint S, `S′` have density `d + d′`; a finite set has density 0 in an infinite T, and changing S by a finite set does not change its density (the difference of the two counts is eventually constant, Tau Ceti's `eventually_summatory_indicator_sub_eq`); the inclusive and the strict cutoffs give the same density; H and cH `(c > 0)` give the same densities. Proposed declarations: `ArithmeticFamily.ratio`, `upperDensity`, `lowerDensity`, `HasDensity`, `ratioLT`.

The reference family T is always named: 'density one' is relative to a stated T. Burungale–Tian's 'density one subset of the positive square-free integers `n ≡ 1`, 2, 3 mod 8' is HasDensity A S 1 with S that family, not density one among all integers. A lower bound for the lower density (Burungale–Tian's 'at least 50%' in Proposition 1.3) is not the existence of a limit. The density depends on the height. For the same S and T, two heights give the same densities only when a comparison lemma applies ([constant rescaling of a height](#constant-rescaling-of-a-height), [piecewise rescaling of a height](#piecewise-rescaling-of-a-height)).

- `ArithmeticFamily.ratio`: `r_X(S | T) = N(S ∩ T; X)/N(T; X), with 0/0 = 0`.

- `ArithmeticFamily.upperDensity`: `limsup_{X→∞} r_X(S | T)`.

- `ArithmeticFamily.lowerDensity`: `liminf_{X→∞} r_X(S | T)`, the lower limiting proportion.

- `ArithmeticFamily.HasDensity`: `r_X(S | T) → d as X → ∞`.

- `ArithmeticFamily.ratioLT`: The strict-cutoff proportion `N^<(S ∩ T; X)/N^<(T; X)`.

- `ArithmeticFamily.ratio_nonneg`: `0 ≤ r_X(S | T)`.

- `ArithmeticFamily.ratio_le_one`: `r_X(S | T) ≤ 1`.

- `ArithmeticFamily.hasDensity_iff_lowerDensity_eq_upperDensity`: HasDensity `S T d ↔ d̲(S|T) = d` ∧ `d̄(S|T) = d`.

- `ArithmeticFamily.HasDensity.lowerDensity_eq`: HasDensity `S T d ⇒ d̲(S | T) = d`.

- `ArithmeticFamily.hasDensity_self`: T infinite `⇒` HasDensity T T 1.

- `ArithmeticFamily.hasDensity_empty`: HasDensity `∅ T 0`.

- `ArithmeticFamily.HasDensity.diff`: T infinite, HasDensity `S T d ⇒` HasDensity `(T ∖ S) T (1 − d)`.

- `ArithmeticFamily.HasDensity.union`: Disjoint `S S′`, HasDensity S T d, HasDensity `S′ T d′ ⇒` HasDensity `(S ∪ S′) T (d + d′)`.

- `ArithmeticFamily.hasDensity_zero_of_finite`: S finite, T infinite `⇒` HasDensity S T 0.

- `ArithmeticFamily.HasDensity.congr_finite`: Finite symmetric difference of S and `S′`, T infinite: HasDensity `S T d ⇒` HasDensity `S′ T d`.

- `ArithmeticFamily.hasDensity_iff_tendsto_ratioLT`: Inclusive and strict cutoffs give the same density.

- `ArithmeticFamily.hasDensity_rescale_iff`: For `c > 0` the densities for cH and for H coincide.

For the proof, Nonnegativity and `ratio_le_one`: `N_H(S ∩ T; X) ≤ N_H(T; X)`. `hasDensity_iff_lowerDensity_eq_upperDensity`: the proportion is bounded in `[0, 1]`, so limsup and liminf exist in `ℝ` and coincide exactly when the limit exists (mathlib:Filter.limsup and its order dual). `hasDensity_self` and `hasDensity_empty`: the proportion is eventually 1 (T infinite, so `N_H(T; X) > 0` eventually), respectively identically 0. diff and union: `N_H((T ∖ S) ∩ T; X) = N_H(T; X) − N_H(S ∩ T; X)` and additivity of counts on disjoint sets. `hasDensity_zero_of_finite` and `congr_finite`: the numerator is eventually constant (tauceti:`TauCeti.eventually_summatory_indicator_sub_eq` for natural-valued heights; the same finite-set argument in general) while the denominator tends to `∞` ([arithmetic family](#arithmetic-family), `tendsto_count_atTop`). `hasDensity_iff_tendsto_ratioLT`: local finiteness of height values gives, for each X, numbers `0 < ε₋`, `ε₊ ≤ 1` with `N^<(·; X) = N(·; X − ε₋)` and `N(·; X) = N^<(·; X + ε₊)`. Use the finite sublevel set at `X + 1` to choose both gaps. The shifted cutoffs tend to infinity because the shifts are bounded; this proves both implications without assuming a uniform spacing of heights. `hasDensity_rescale_iff`: `r_X(S | T)` for cH is `r_{X/c}(S | T)` for `H (count_rescale)`, and `X/c → ∞` with X.

*Needs:* [arithmetic family](#arithmetic-family), `Filter.limsup` (Mathlib), `Filter.Tendsto` (Mathlib), `TauCeti.eventually_summatory_indicator_sub_eq` (Tau Ceti).

([[2]](#ref-2), Theorem 1.2, printed p. 2 (arXiv v2); [[2]](#ref-2), Proposition 1.3, printed p. 2; [[1]](#ref-1), Theorem 1.8, printed p. 5.)

**Checks.**

- In `ℕ` ordered by n, the even numbers have relative density `1/2` in `ℕ`.

- In `ℕ` ordered by n, {0, 1, 2} has relative density 0 in `ℕ`.

- In `ℕ` ordered by n, the union of the blocks `[4^k, 2·4^k)` has no relative density in `ℕ` (its lower and upper densities are `1/3` and `2/3`); a definition that returns a limit unconditionally fails.

- In `ℕ` with height n for even n and `n²` for odd n, the even numbers have relative density 1, not `1/2`.

- Strict and inclusive cutoffs give the same limit, as the sources' `Σ(X) = {H < X}` and Burungale–Tian's `S(X) = {n ≤ X}` require.

- The empty ambient family has density 0 in itself under the `0/0` convention and cannot have density 1, whereas a singleton has density 1 in itself. Infinitude is sufficient but not necessary for self-density 1.

<a id="relative-density-is-multiplicative-in-towers"></a>

**Relative density is multiplicative in towers.** Let `S ⊆ T ⊆ U` be subfamilies of an arithmetic family. If S has relative density `α` in T and T has relative density `β` in U, then S has relative density `αβ` in U. Proposed declarations: `ArithmeticFamily.HasDensity.trans`.

No infinitude hypothesis is needed: the proportions are read with `0/0 = 0`.

For the proof, For `S ⊆ T ⊆ U` and every X: if `N(T; X) > 0` then `N(S; X)/N(U; X) = (N(S; X)/N(T; X))·(N(T; X)/N(U; X))`; if `N(T; X) = 0` then `N(S; X) = 0` and both sides vanish. So `r_X(S | U) = r_X(S | T)·r_X(T | U)` identically. Take limits with mathlib:Filter.Tendsto.mul.

*Needs:* [relative density](#relative-density), `Filter.Tendsto.mul` (Mathlib).

([[2]](#ref-2), Abstract and Theorem 1.2, printed pp. 1–2.)

**Checks.**

- With P the positive squarefree integers, `S ⊆ P` those `≡ 1`, 2, 3 (mod 8) and A of density one in S, A has density `1/2` in P ([density one in the even parity classes is half of all squarefree](#density-one-in-the-even-parity-classes-is-half-of-all-squarefree)): the passage from Burungale–Tian's Theorem 1.2 to the '50% of the positive square-free integers' of their abstract.

- With `α = 1/3` and `β = 1/2` (one residue class of S inside S, S inside P) the class `n ≡ 1 (mod 8)` has density `1/6` in P.

- For `S=T=U=∅` every proportion and the product are zero. This tests the tower identity without an infinite ambient family.

<a id="density-one-restricts-to-subfamilies-of-positive-lower-density"></a>

**Density one restricts to subfamilies of positive lower density.** Let `A ⊆ ι` and `U ⊆ T` be subfamilies of an arithmetic family. If A has relative density 1 in T and U has positive lower relative density in T, then `A ∩ U` has relative density 1 in U. Proposed declaration: `ArithmeticFamily.HasDensity.inter_of_lowerDensity_pos`.

Positivity of the lower density of U in T is necessary: a density-one set may miss a density-zero subfamily entirely.

For the proof, For every X with `N(U; X) > 0`: `r_X(U ∖ A | U) = N((U ∖ A); X)/N(U; X) ≤ N((T ∖ A); X)/N(U; X) = r_X(T ∖ A | T)/r_X(U | T)`. Positive lower density gives `r_X(U | T) ≥ d̲(U | T)/2 > 0` eventually; therefore `N(U; X)` and `N(T; X)` are eventually positive, whether T is finite or infinite. At these cutoffs the complement identity gives `r_X(T ∖ A | T) = 1 − r_X(A | T) → 0`. The displayed inequality and the positive lower bound squeeze `r_X(U ∖ A | U)` to zero, hence `r_X(A ∩ U | U)` to one.

*Needs:* [relative density](#relative-density).

([[2]](#ref-2), Theorem 1.2 and footnote 2, printed p. 2.)

**Checks.**

- Each residue class `n ≡ a (mod 8)`, `a ∈ {1, 2, 3}`, has relative density `1/3` in Burungale–Tian's family S ([even parity classes have half density](#even-parity-classes-have-half-density) and [squarefree integers in residue classes](#squarefree-integers-in-residue-classes)); so a density-one subset of S is of density one in each of the three classes. This is the input to the comparison with Goldfeld's ordering by fundamental discriminants.

- Necessity of positivity: in `ℕ` ordered by n, `A = ℕ ∖ {perfect squares}` has density 1 but `A ∩ U = ∅` for U the perfect squares.

- For `T=U={a}` and `a∈A`, both the lower density of U in T and the density of `A∩U` in U are 1. The conclusion also covers finite nonempty families.

<a id="constant-rescaling-of-a-height"></a>

**Constant rescaling of a height.** Let `(ι, H)` be an arithmetic family and `c > 0`, and let `H′ =` cH (ArithmeticFamily.rescale). Then `N_{H′}(S; X) = N_H(S; X/c)` for all S and X; relative densities (upper, lower, limiting) for `H′` and for H coincide; and if `N_H(S; X)/X^κ → C` as `X → ∞`, then `N_{H′}(S; X)/X^κ → C·c^(−κ)`. Applied to Bhargava–Shankar's two heights on elliptic curves, `H′ = (27/4)H` ([quartic to curve height normalisation](#quartic-to-curve-height-normalisation)): the curves with `H′(E) ≤ X` are those with `H(E) ≤ 4X/27`, the two heights order every set of curves identically, averages do not change, and an asymptotic constant C for the count by H becomes `(4/27)^(5/6)·C` for the count by `H′ (κ = 5/6)`. Proposed declaration: `ArithmeticFamily.tendsto_rescale_count_div_rpow`.

`c > 0` is a constant; a height comparable to H only up to bounded factors does not preserve densities (see [piecewise rescaling of a height](#piecewise-rescaling-of-a-height) for the piecewise-constant case).

For the proof, `count_rescale` ([arithmetic family](#arithmetic-family)): `{i ∈ S : cH(i) ≤ X} = {i ∈ S : H(i) ≤ X/c}`. Eventually `X > 0`, so real-power identities give `N_{H′}(S; X)/X^κ = (N_H(S; X/c)/(X/c)^κ)·c^(−κ)`. Since `X/c → ∞`, take limits. Densities: `hasDensity_rescale_iff` of [relative density](#relative-density).

*Needs:* [arithmetic family](#arithmetic-family), [relative density](#relative-density).

([[1]](#ref-1), §3 opening, printed p. 22.)

**Checks.**

- Bhargava–Shankar: an `X^(5/6)` constant for the ordering by H becomes `(4/27)^(5/6)` times itself for the ordering by `H′` (use the height change in this direction).

- The average of `#S₂(E)` over a large family is the same for H and `H′` (it is a ratio of two counts at the same cutoff).

- On N with height n, rescaling by `c=0` gives infinitely many elements below cutoff 0; it is excluded by `c>0`. Rescaling by `c=2` gives count 2 at cutoff 3, instead of count 4 before rescaling.

<a id="piecewise-rescaling-of-a-height"></a>

**Piecewise rescaling of a height.** Let H and `H′` be two heights on the same objects `ι` (families `F = (ι, H)`, `G = (ι, H′)`), let `k ≥ 1` and `T₁`, `…`, `T_k ⊆ ι` be pairwise disjoint and `c_j > 0` with `H′ = c_j·H` on `T_j`. Suppose that for some `κ > 0` and `a_j > 0`, `N_H(T_j; X)/X^κ → a_j` for every j, and that `A ⊆ ι` has relative density `d_j` in `T_j` for H. Then A has relative density `(Σ_j c_j^(−κ) a_j d_j)/(Σ_j c_j^(−κ) a_j)` in `T = ⋃_j T_j` for `H′`. In particular density one in every piece gives density one for `H′`. Proposed declaration: `ArithmeticFamily.hasDensity_piecewise_rescale`.

There is at least one piece `(k ≥ 1)`, so `Σ_j c_j^(−κ)a_j` is strictly positive. With no pieces the ratio is 0 by convention and the density-one corollary fails. The pieces must each have an `X^κ` asymptotic with the same exponent `κ` and positive constant; without it the weights of the pieces are not defined. The lemma compares two orderings of the same objects; it is the 'comparison' that the roadmap requires before a theorem for one height is used for another.

For the proof, On `T_j`, `N_{H′}(A ∩ T_j; X) = N_H(A ∩ T_j; X/c_j)` (`count_rescale` restricted to `T_j`). `N_H(A ∩ T_j; X/c_j) = r_{X/c_j}(A | T_j)·N_H(T_j; X/c_j) = (d_j + o(1))·(a_j + o(1))·c_j^(−κ)X^κ`. Sum over j: `N_{H′}(A ∩ T; X) = (Σ_j c_j^(−κ)a_j d_j + o(1))X^κ` and `N_{H′}(T; X) = (Σ_j c_j^(−κ)a_j + o(1))X^κ`; divide. The denominator constant is positive because the index set is nonempty and every summand is positive.

*Needs:* [relative density](#relative-density), [constant rescaling of a height](#constant-rescaling-of-a-height), [arithmetic family](#arithmetic-family).

([[2]](#ref-2), §1.0.2, printed p. 2.)

**Checks.**

- Goldfeld's ordering against Burungale–Tian's for E : `y² = x³ − x`. The twist by a fundamental discriminant d is the twist by its squarefree part `m = |d|` or `|d|/4` (the squareclass), and `E^(−m) = E^(m)` ([isomorphism multiplicity of the twist family](#isomorphism-multiplicity-of-the-twist-family)). Each positive squarefree m occurs for two fundamental discriminants (one of each sign) with `|d| = c·m`, `c = 1` for `d ≡ 1 (mod 4)` and `c = 4` otherwise: for `m ≡ 1 (mod 4)` the factors are 1 and 4, for `m ≡ 3 (mod 4)` they are 4 and 1, for `m ≡ 2 (mod 4)` both are 4. With `κ = 1` and `a_j = 1/π²` for each of the six classes of m modulo 8 ([squarefree integers in residue classes](#squarefree-integers-in-residue-classes)), the classes 1, 2, 3 (mod 8) (root number `+1`) carry weight `5/4 + 1/2 + 5/4 = 3` of the total 6, so exactly half of the fundamental discriminants ordered by |d| have root number `+1`, and a subset of density one in each of those classes for the ordering by m has density one among them for the ordering by |d| (with [density one restricts to subfamilies of positive lower density](#density-one-restricts-to-subfamilies-of-positive-lower-density)). A numerical count to `2·10⁶` gives the proportion 0.49999.

- With `k = 1` this is [constant rescaling of a height](#constant-rescaling-of-a-height).

- For natural height on ℕ, multiply the odd heights by 2 and keep the even heights fixed. The even numbers then have density `2/3`: the two denominator constants are `1/2` and `1/4`.

<a id="stabilizer-weighted-orbit-count"></a>

**Stabilizer weighted orbit count.** Let a group `Γ` act on a type V and let F be an arithmetic family on the orbit type `Γ\V = MulAction.orbitRel.Quotient Γ V` (for instance `GL₂(ℤ)` or `PGL₂(ℤ)` acting on integral binary quartic forms, with the class height H). The stabilizer weight of an orbit `Γv` is `w(Γv) := 1/#Stab_Γ(v)` (Nat.card, so an infinite stabilizer gets weight 0); it is well defined because `Stab_Γ(γv) = γ·Stab_Γ(v)·γ⁻¹` (Mathlib's `MulAction.stabilizer_smul_eq_stabilizer_map_conj`). The stabilizer-weighted orbit count of `S ⊆ Γ\V` is `N^w(S; X) := Σ_{Γv ∈ S, H(Γv) ≤ X} w(Γv) = weightedCount (1_S·w) X`; the unweighted count is `N(S; X) = count S X`. Properties: `w ≤ 1`; `w > 0` when the stabilizer is finite; `w = 1` exactly when the stabilizer is trivial; the mass formula `Σ_{orbits} w = #V/#Γ` for finite `Γ` and V (Mathlib's class formula `MulAction.card_eq_sum_card_group_div_card_stabilizer`); if a finite subgroup `Z ≤ Γ` acts trivially, `#Z·w(Γv) = 1/#(Stab_Γ(v)/Z)` is a coset-cardinality identity. When Z is normal it is the weight for the descended `Γ/Z`-action; that action is faithful precisely when Z is the full action kernel. For `GL₂(ℤ)` on binary quartic forms `−1` acts trivially ([binary quartic form](#binary-quartic-form)), every stabilizer of a nonsingular integral form is finite of even order `2r`, and Bhargava–Shankar's weight `1/r` is `2w = 1/#Stab_{PGL₂(ℤ)}(f)`. Proposed declarations: `stabilizerWeight`, `weightedOrbitCount`.

The orbit family, with its Northcott property, is an input. For `GL₂(ℤ)`-classes of irreducible integral binary quartic forms of bounded height, finiteness comes from reduction theory (Bhargava–Shankar §§2.1–2.2; they quote Borel–Harish-Chandra [10, Thm 6.9]); the height-zero locus, including all multiples of `x⁴` and `x³y`, must be excluded. The normalisation by a trivially acting subgroup is an explicit factor #Z, never absorbed silently: Bhargava–Shankar's `1/r` is twice the `GL₂(ℤ)`-stabilizer weight.

- `stabilizerWeight`: `w(Γv) = 1/#Stab_Γ(v) on Γ\V`.

- `stabilizerWeight_mk`: `w(Γv) evaluated at a representative v`.

- `stabilizerWeight_eq_one_iff`: For finite stabilizers, `w(Γv) = 1 ↔ Stab_Γ(v) = ⊥`.

- `stabilizerWeight_pos`: Finite stabilizer `⇒ 0 < w(Γv)`.

- `stabilizerWeight_le_one`: `w(Γv) ≤ 1`.

- `natCard_mul_stabilizerWeight`: For finite stabilizers and a finite trivially acting subgroup Z: `#Z·w(Γv) = 1/#(Stab_Γ(v)/Z)`, where the quotient denotes the set of cosets. If Z is normal this is the stabilizer weight for the descended `Γ/Z`-action; faithfulness additionally requires Z to be the whole kernel. For `Z = {±1}` in `GL₂(ℤ)` on nonsingular quartics this gives Bhargava–Shankar’s `1/r`.

- `finsum_stabilizerWeight`: Mass formula: `Γ` and V finite `⇒ Σ_{Γv} w(Γv) = #V/#Γ`.

- `weightedOrbitCount`: `N^w(S; X) = Σ_{Γv ∈ S, H(Γv) ≤ X} w(Γv)` for a family F on `Γ\V`.

For the proof, stabilizerWeight is Quotient.lift of `v ↦ (Nat.card Stab_Γ(v))⁻¹`; the lift condition is that conjugate subgroups have the same cardinality (mathlib:`MulAction.stabilizer_smul_eq_stabilizer_map_conj` and the conjugation equivalence). `stabilizerWeight_eq_one_iff`, `_pos`, `_le_one`: Nat.card of a finite nontrivial group is `≥ 2`; of the trivial group 1. `finsum_stabilizerWeight`: divide mathlib:`MulAction.card_eq_sum_card_group_div_card_stabilizer`, `#V = Σ_ω #Γ/#Stab(ω)`, by `#Γ`. `natCard_mul_stabilizerWeight`: `Z ≤ Stab_Γ(v)` for every v, and `#Stab_Γ(v) = #Z·#(Stab_Γ(v)/Z)` (Lagrange).

*Needs:* [arithmetic family](#arithmetic-family), `MulAction.orbitRel.Quotient` (Mathlib), `MulAction.stabilizer` (Mathlib), `MulAction.stabilizer_smul_eq_stabilizer_map_conj` (Mathlib), `MulAction.card_eq_sum_card_group_div_card_stabilizer` (Mathlib), `Nat.card` (Mathlib).

([[1]](#ref-1), §2.1, printed p. 9; [[1]](#ref-1), §2.1, (8), printed p. 9; [[5]](#ref-5), Theorem 7, printed p. 3 (arXiv v3).)

**Checks.**

- In the regular action of a group G on itself every orbit has stabilizer weight 1.

- For `(ℤ/3)ˣ = {±1}` acting on `ℤ/3`, the fixed orbit {0} has weight `1/2`.

- For `(ℤ/3)ˣ` acting on `ℤ/3` the orbit weights add up to `3/2 = #V/#Γ`; reciprocal orbit lengths instead assign 1 to {0} and `1/2` to {1,2}, reversing the two weights. Their total is also `3/2`, so the individual weights are essential to this test.

- For `{±1} = (ℤ/3)ˣ` acting on `ℤ/3` by multiplication, the orbits {0} and {1, 2} have weights `1/2` and 1, total `3/2 = #V/#Γ`; reciprocal orbit lengths give the same total but reverse those individual weights.

- Bhargava–Shankar p. 9: `n_i·N(V^(i); X)` is the number of integral points in the fundamental multiset, with orbits whose `GL₂(ℤ)`-stabilizer has order `2r` counted with weight `1/r`; that weight is `natCard_mul_stabilizerWeight` with `Z = {±1}`.

- The form `x³y` has `I=J=Δ=0` and height zero. Its distinct projective roots have multiplicities 3 and 1, preserved under invertible substitution, so it cannot become a nonzero scalar multiple of a fourth power of a linear form.

<a id="weighted-and-unweighted-orbit-counts"></a>

**Weighted and unweighted orbit counts.** In the setting of [stabilizer weighted orbit count](#stabilizer-weighted-orbit-count), if every stabilizer is finite then for every S and X: `0 ≤ N(S; X) − N^w(S; X) ≤ #{Γv ∈ S : H(Γv) ≤ X, Stab_Γ(v) ≠ 1}`. Hence N and `N^w` have the same asymptotics as soon as the orbits with nontrivial stabilizer are negligible. For binary quartic forms apply it to the faithful action of `PGL₂(ℤ)` (whose orbits on `V_ℤ` are the `GL₂(ℤ)`-orbits, Bhargava–Shankar (32)); the negligibility input is Bhargava–Shankar's Lemma 2.4 (`O(X^(3/4+ε))` orbits with stabilizer in `PGL₂(ℚ)` of size `> 1`), used as an explicit hypothesis when comparing asymptotics. Proposed declaration: `count_sub_weightedOrbitCount_le`.

Finite stabilizers; the bound is per orbit, `0 ≤ 1 − w(Γv) ≤ 1` with equality 0 exactly for trivial stabilizers.

For the proof, `N(S; X) − N^w(S; X) = Σ_{Γv ∈ S, H ≤ X} (1 − w(Γv))`. Each summand lies in `[0, 1] (stabilizerWeight_pos, stabilizerWeight_le_one)` and vanishes when `w = 1 (stabilizerWeight_eq_one_iff)`.

*Needs:* [stabilizer weighted orbit count](#stabilizer-weighted-orbit-count).

([[1]](#ref-1), Lemma 2.4, printed p. 10.)

**Checks.**

- For `GL₂(ℤ)` itself every stabilizer contains `±1`, so the lemma must be applied to `PGL₂(ℤ)` (or to the normalised weight `2w`); applied to `GL₂(ℤ)` directly it would compare with the trivial bound `N − N^w ≤ N`.

- With Lemma 2.4, the weighted and unweighted counts of Theorem 2.1 agree up to `O(X^(3/4+ε))`.

- A singleton orbit with stabilizer of order 2 has unweighted count 1, weighted count `1/2`, and exceptional-orbit count 1. The difference satisfies the bound.

### 0.2 Local specifications and acceptable weights

<a id="family-defined-by-local-conditions"></a>

**Family defined by local conditions.** Local conditions on a family `ι` over a set P of places consist of localisation maps `loc_v` : `ι → X_v` into local spaces and subsets `cond_v ⊆ X_v`; the family they define is `F_Σ = {i ∈ ι : loc_v(i) ∈ cond_v for all v ∈ P}`. It is defined by finitely many local conditions if `cond_v = X_v` for all but finitely many v. When the `X_v` carry topologies and measures `μ_v`, the conditions are regular if each `cond_v` is measurable with `μ_v(∂cond_v) = 0`, and the local density (local mass) at v is `μ_v(cond_v)`. Given bad loci `B_v ⊆ X_v`, the family is large relative to B if, for all but finitely many v, the closure of `loc_v(F_Σ)` contains `X_v ∖ B_v`. Instances. (1) Bhargava–Shankar's families of elliptic curves defined by congruence conditions: `X_p = ℤ_p²`, `loc_p(E) = (I(E), J(E))`, Haar probability measure, a sign condition at `∞`, and `B_p = {p² | Δ(I, J)}`, for which 'large relative to B' is their largeness ([elliptic families defined by congruence conditions](#elliptic-families-defined-by-congruence-conditions)). (2) Sets `S ⊆ V_ℤ` of integral binary quartic forms defined by congruence conditions, with `μ_p(S)` the p-adic density of the closure of S in `V_{ℤ_p}`, `μ_p(V_{ℤ_p}) = 1` (Bhargava–Shankar §2.5). (3) BKLOS's squareclass families `Σ = F×/F×² ∩ ∏_v Σ_v` with `X_v = F_v×/F_v×²`, the measure of the preimage in `O_{F_v}` at finite v and the discrete measure at infinite v. (4) Burungale–Tian's positive squarefree `n ≡ 1`, 2, 3 (mod 8), which is the squareclass family of `ℚ` with `Σ_∞ = {+1} ⊂ ℝ×/ℝ×²` and `Σ₂ =` the classes of 1, 3, 2, 10 in `ℚ₂×/ℚ₂×²` ([positive squarefree family over q](#positive-squarefree-family-over-q)). (5) Bhargava–Shankar–Tsimerman's local specifications `Σ_p` of isomorphism classes of orders in étale cubic `ℚ_p`-algebras (`X_p` discrete, masses `1/(Disc_p(R)·|Aut(R)|)`). Proposed declarations: the structure `LocalConditions` with `family`, `FinitelyMany`, `IsRegular`, `localDensity` and `IsLargeRel`.

The local spaces and measures are part of the data: 'density of a local condition' is meaningless until `μ_v` is fixed (Haar probability on `ℤ_p`-points, BKLOS's preimage measure on `F_v×/F_v×²`, counting masses weighted by `1/|Aut|` for étale algebras). Finitely many conditions and 'large' are different: the squarefree integers are cut out by a condition at every prime (not finitely many conditions) and still form a large family relative to `B_p = {p² | n}`. The sieve applications require regularity (boundary of measure zero); a condition with boundary of positive measure is excluded.

- `LocalConditions`: Localisation maps `loc_v` : `ι → X_v` and local conditions `cond_v ⊆ X_v`, `v ∈ P`.

- `LocalConditions.family`: `F_Σ = {i : ∀ v, loc_v(i) ∈ cond_v}`.

- `LocalConditions.mem_family`: `i ∈ F_Σ ↔` ∀ v, `loc_v(i) ∈ cond_v`.

- `LocalConditions.FinitelyMany`: `cond_v = X_v` for all but finitely many v.

- `LocalConditions.inf`: Imposing two collections of conditions with the same localisation maps.

- `LocalConditions.family_inf`: The family of the combined conditions is the intersection.

- `LocalConditions.family_eq_univ`: Trivial conditions cut out everything.

- `LocalConditions.IsRegular`: Every `cond_v` is measurable with boundary of `μ_v`-measure 0.

- `LocalConditions.localDensity`: The local mass `μ_v(cond_v)`.

- `LocalConditions.IsLargeRel`: Large relative to bad loci `B_v`: for all but finitely many v, `X_v ∖ B_v ⊆` closure(`loc_v(F_Σ)`).

For the proof, family, FinitelyMany, IsRegular, localDensity and IsLargeRel are direct definitions; `mem_family` unfolds family. `family_inf`: imposing two collections with the same localisation maps intersects the families; `family_eq_univ`: trivial conditions cut out everything.

*Needs:* [arithmetic family](#arithmetic-family), `MeasureTheory.Measure` (Mathlib).

([[1]](#ref-1), §3 opening, printed p. 22; [[1]](#ref-1), §2.5, printed p. 14; [[3]](#ref-3), §2, printed p. 2.)

**Checks.**

- With P the primes, `X_p = ℤ/p²`, `loc_p(n) = n mod p²` and `cond_p = {nonzero residues}`, the family is exactly the squarefree integers.

- The same conditions are not finitely many local conditions.

- With every condition the whole local space, the family is everything.

- Bhargava–Shankar's semistable family is defined by conditions at every prime and is large; the family `y² = x³ + Ax (B = 0)` is defined by congruence conditions and is not large ([elliptic families defined by congruence conditions](#elliptic-families-defined-by-congruence-conditions)).

<a id="acceptable-weight-function"></a>

**Acceptable weight function.** Following Bhargava–Shankar §2.7, let a family `ι` carry localisations `loc_p` : `ι → X_p` at the primes. A weight `φ` : `ι → [0, 1]` is defined by congruence conditions via local weights `φ_p` : `X_p → [0, 1]` if (1) for every i the Euler product `∏_p φ_p(loc_p(i))` converges to `φ(i)` (Mathlib's HasProd over the primes), and (2) each `φ_p` is locally constant outside a closed subset `S_p ⊆ X_p` of measure zero. Given bad loci `B_p ⊆ X_p`, `φ` is acceptable if for all sufficiently large p, `φ_p = 1` off `B_p`. For integral binary quartic forms `X_p = V_{ℤ_p}`, `loc_p` the inclusion and `B_p = {f : p² | Δ(f)}`; the characteristic function of the forms of squarefree discriminant is acceptable. Through the localisation `(I(E), J(E)) ∈ ℤ_p²`, the indicator of a large family of elliptic curves is acceptable relative to `B_p = {p² | Δ(I, J)}` (the local-weight input to Selmer averages). Proposed declarations: the structure `CongruenceWeight` with `weight`, `ConvergesTo`, `IsLocallyConstantAE`, `IsAcceptable`.

Weights take values in `[0, 1]`. Acceptability concerns all sufficiently large p; finitely many primes (2 and 3 among them) are unrestricted.

- `CongruenceWeight`: Localisations `loc_p` and local weights `φ_p` : `X_p → [0, 1]`.

- `CongruenceWeight.weight`: `φ(i) = ∏'_p φ_p(loc_p(i))`.

- `CongruenceWeight.ConvergesTo`: Condition (1): the Euler product converges (HasProd) to a given `φ` at every member.

- `CongruenceWeight.IsLocallyConstantAE`: Condition (2): each `φ_p` is locally constant off a closed `μ_p`-null set.

- `CongruenceWeight.IsAcceptable`: `φ_p = 1` off `B_p` for all but finitely many p.

- `CongruenceWeight.weight_mem_Icc`: A convergent weight lies in `[0, 1]`.

For the proof, weight is the tprod of the local weights; `weight_mem_Icc`: a convergent product of numbers in `[0, 1]` lies in `[0, 1]`. IsAcceptable of an indicator `1_{X_p ∖ B_p}` holds for every p by definition; the constant weight 1 is acceptable for every B.

*Needs:* [family defined by local conditions](#family-defined-by-local-conditions), `HasProd` (Mathlib), `MeasureTheory.Measure` (Mathlib).

([[1]](#ref-1), §2.7, printed p. 19.)

**Checks.**

- The constant local weight 1 is acceptable for any bad loci.

- The indicator of the complement of the bad loci (the squarefree-discriminant example for `B_p = {p² | Δ}`) is acceptable.

- The constant local weight `1/2` is not acceptable when every bad locus has nonempty complement.

For the coefficient-lattice specialization, fix `n ≥ 1` and a primitive polynomial `f ∈ ℤ[x₁, …, x_n]` (the discriminant: `Δ` on `V_ℤ ≅ ℤ⁵`, Disc on `U_ℤ ≅ ℤ⁴`). Let `μ_p` denote the Haar measure on `ℤ_p^n` of total mass 1. A function `φ` : `ℤ^n → [0, 1]` is defined by congruence conditions if there are functions `φ_p` : `ℤ_p^n → [0, 1]`, one for each prime p, such that (1) for every `v ∈ ℤ^n` the product `∏_p φ_p(v)` converges to `φ(v)`, and (2) each `φ_p` is locally constant outside a closed set `S_p ⊆ ℤ_p^n` with `μ_p(S_p) = 0`. Such `φ` is acceptable (for f) if there is `p₀` such that `φ_p(v) = 1` for every prime `p > p₀` and every `v ∈ ℤ_p^n` with `p² ∤ f(v)`. A set `S ⊆ ℤ^n` is defined by congruence conditions (resp. acceptable) if its characteristic function is, with `φ_p` the characteristic functions of sets `S_p ⊆ ℤ_p^n`; its p-adic density is `μ_p(S) := μ_p(closure of S in ℤ_p^n)`. S is defined by finitely many congruence conditions if `φ_p ≡ 1` for all but finitely many p and each `φ_p` is the characteristic function of a union of residue classes modulo a power of p.

`φ` takes values in `[0, 1]`; the local factors `φ_p` are part of the data (a function `φ` can have several presentations) Acceptability is relative to the polynomial f; for binary quartic forms `f = Δ`, for binary cubic forms `f = Disc` The weights `1/m_p(f)` of Bhargava-Shankar Section 3 and the local solubility conditions are functions of this kind; only their acceptability is used in this stage The local mass of a supplied factor is its integral. The measure of the p-adic closure of the global set is a different definition; identifying them requires a density argument for that presentation. Do not infer this from the existence of local factors alone.

- `CongruenceConditions`: The data `(φ_p)_p` of local factors `φ_p` : `(Fin n → ℤ_[p]) → [0, 1]` with conditions (1) and (2); `CongruenceConditions.toFun` is the global function `φ`.

- `CongruenceConditions.localMass`: The local integral `∫ φ_p dμ_p ∈ [0, 1]`.

- `CongruenceConditions.IsAcceptable`: `∃ p₀, ∀ p > p₀, ∀ v, ¬ p² ∣ f(v) → φ_p(v) = 1`.

- `CongruenceConditions.squarefree`: The presentation `φ_p = 1_{p² ∤ f}` of the characteristic function of `{f(v) squarefree}`; it is acceptable.

- `CongruenceConditions.ofResidues`: A set defined by finitely many congruence conditions (finitely many primes, residue classes modulo prime powers) as an acceptable presentation.

- `CongruenceConditions.localMass_ofResidues`: For `φ_p = 1` of a union of classes modulo `p^k`, `localMass = #(classes)/p^{kn}`.

- `CongruenceConditions.one_sub_localMass_le`: If `φ` is acceptable, then for `p > p₀`, `1 − localMass p ≤ μ_p{p² | f}` (`φ_p = 1` off that set).

- `CongruenceConditions.mul`: The pointwise product of two presentations is a presentation, acceptable when both are.

For the proof, For every v, the net of finite products of factors in `[0,1]` decreases and is bounded below by zero, hence converges (zero is allowed). For acceptable presentations and `f(v)≠0`, only finitely many factors differ from one. Points with `f(v)=0` use the monotone-net argument, not eventual equality to one. `μ_p` is Mathlib's additive Haar measure on the compact group `ℤ_p^n` (PadicInt), normalised to total mass 1. For `φ_p` the characteristic function of a union of classes modulo `p^k`, `∫φ_p dμ_p = #(classes)/p^{kn}`.

*Needs:* `PadicInt` (Mathlib), `Squarefree` (Mathlib), `MvPolynomial` (Mathlib).

([[1]](#ref-1), Section 2.7, printed p. 19; [[5]](#ref-5), Section 1, the definition before Theorem 7, p. 3.)

**Checks.**

- For `n = 1` and `f = x`, the squarefree presentation has `localMass p = 1 − p⁻²`, and `∏_p localMass p = 6/π²`.

- The constant presentation `φ_p ≡ 1` has `localMass p = 1` for every p and represents `φ ≡ 1`.

- For `n = 1`, `f = x` and `φ_p = 1_{x is a square in ℤ_p}`, the presentation is not acceptable: for every odd p a quadratic non-residue v mod p has `p² ∤ v` and `φ_p(v) = 0`.

- For finitely many distinct primes and a CRT-product set S whose allowed residues modulo `m=`product `p^{k_p}` are exactly the product of the prescribed local allowed sets, product `localMass p = #(S mod m)/m^n`. An arbitrary coupled subset of Z/mZ need not satisfy this product formula.

- A set defined by finitely many congruence conditions is acceptable (take `p₀` larger than every prime involved).

- For `n=1` and `f=x`, the characteristic function of integer squares has the presentation `φ_p=1_{x is a square in Z_p}`, locally constant off {0}, and this presentation is not acceptable. The same fixed presentation also fails acceptability relative to `f=1`, since `p²` never divides 1 but nonsquare units still have local weight zero. In contrast, changing the weight to the indicator that `f(v)` is a square with `f=1` gives the constant-one presentation, which is acceptable. Acceptability concerns the chosen local weights together with the reference polynomial.

### 0.3 Binary quartics and eligible invariants

<a id="binary-quartic-form"></a>

**Binary quartic form.** For a commutative ring R, a binary quartic form over R is `f(x, y) = a x⁴ + b x³y + c x²y² + d xy³ + e y⁴`, recorded by its coefficients `(a, b, c, d, e) ∈ R⁵` (the coefficient carrier `BinaryQuartic R = Fin 5 → R`), with evaluation `f(x, y)`, dehomogenisation `f(X, 1) ∈ R[X]` and the associated homogeneous polynomial of degree 4 in two variables. `GL₂(R)` acts on the left by linear substitution, `γ·f(x, y) := f((x, y)·γ)` with `(x, y)·γ = (γ₀₀x + γ₁₀y, γ₀₁x + γ₁₁y)` (Bhargava–Shankar (3)); for `γ` with rows `(p, q)` and `(r, s)` the new coefficients are `a′ = f(p, q)`, `e′ = f(r, s)`, `b′ = 4a p³r + b p³s + 3b p²`qr `+ 2c p²`qs `+ 2c` pq²r `+ 3d` pq²s `+ d q³r + 4e q³s`, `c′ = 6a p²r² + 3b p²`rs `+ 3b` pqr² `+ c p²s² + 4c` pqrs `+ c q²r² + 3d` pqs² `+ 3d q²`rs `+ 6e q²s²`, `d′ = 4a` pr³ `+ 3b` pr²s `+ b` qr³ `+ 2c` prs² `+ 2c` qr²s `+ d` ps³ `+ 3d` qrs² `+ 4e` qs³. The twisted action is `γ`⋆`f := (det γ)⁻²·f((x, y)·γ)` (Bhargava–Shankar (21), (32)): scalars act trivially, so it descends to the projective matrix quotient `GL₂(R)/Rˣ`, denoted `PGL₂(R)` in this subsection; for `det γ = ±1` the two actions agree, so on `V_ℤ` the `PGL₂(ℤ)`-orbits are the `GL₂(ℤ)`-orbits; `−1` acts trivially under both. Base change along ring homomorphisms is equivariant. `V_ℤ ⊂ V_ℝ` is the lattice of integral forms. Proposed declarations: `BinaryQuartic` R, `subst`, the `MulAction` instance, `twistedSMul`.

The action is by the row vector `(x, y)·γ`, a left action: `(γ₁γ₂)·f = γ₁·(γ₂·f)`. Using `γ·(x, y)ᵀ` instead gives a right action and different orbits formulas; the unit tests separate the two. Coefficients are arbitrary (Bhargava–Shankar allow all integer coefficients, not the even middle coefficients of classical conventions). The twisted action needs `det γ` invertible, which holds for every `γ ∈ GL₂(R)`. Over a general ring, the projective matrix quotient is the group used here; it is not identified with every R-point of the quotient group scheme. The two notions agree over fields and over Z, where the scalar-torsor obstruction vanishes.

- `BinaryQuartic`: Coefficients a, b, c, d, `e ∈ R`.

- Two forms are equal iff their five coefficients are.

- `BinaryQuartic.eval`: `f(x, y) = a x⁴ + b x³y + c x²y² + d xy³ + e y⁴`.

- `BinaryQuartic.dehomogenize`: `f(X, 1) = aX⁴` + bX³ + cX² + dX `+ e ∈ R[X]`.

- `BinaryQuartic.subst`: Linear substitution by `a 2 × 2` matrix, `(x, y) ↦ (x, y)·γ`.

- `BinaryQuartic.instMulAction`: The left action of `GL₂(R)` by `γ·f =` subst `γ f`.

- `(γ·f)(x, y) = f(γ₀₀x + γ₁₀y, γ₀₁x + γ₁₁y)`.

- `BinaryQuartic.scalarGL`: The scalar matrix `u·1 ∈ GL₂(R)` for `u ∈ Rˣ`.

- `BinaryQuartic.twistedSMul`: `γ`⋆`f = (det γ)⁻²·(γ·f)`.

- `(γδ)`⋆`f = γ`⋆(`δ`⋆f).

- Scalars act trivially under the twisted action.

- If `(det γ)² = 1` the twisted and untwisted actions agree (so `PGL₂(ℤ)`- and `GL₂(ℤ)`-orbits coincide).

- `(−1)·f = f`.

- `BinaryQuartic.map`: Base change of coefficients along a ring homomorphism.

- Base change is equivariant: `(γ·f)^φ = φ(γ)·f^φ`.

- `BinaryQuartic.toMvPolynomial`: The form as an element of MvPolynomial (Fin 2) R.

- It is homogeneous of degree 4 (Mathlib's IsHomogeneous).

For the proof, subst is the explicit polynomial map above; `one_smul` and `mul_smul` are polynomial identities in the coefficients (ring normalisation). twistedSMul multiplies the substituted coefficients by the unit `(det γ)⁻²`; `twistedSMul_scalar`: for `γ = u·1`, `f((x, y)·u) = u⁴f` and `det = u²`. Triviality of the minus-identity action follows from `f(−x, −y) = f(x, y)` since f is homogeneous of even degree. For equivariance of base change, ring homomorphisms commute with the polynomial formulas; evaluation after substitution follows by expansion.

*Needs:* `Matrix.GeneralLinearGroup` (Mathlib), `Matrix.GeneralLinearGroup.det` (Mathlib), `MvPolynomial.IsHomogeneous` (Mathlib).

([[1]](#ref-1), §2, (3), printed p. 7; [[1]](#ref-1), §2.6, (32), printed p. 16.)

**Checks.**

- Substituting the swap matrix (0 1; 1 0) sends `(a, b, c, d, e)` to `(e, d, c, b, a)`.

- Substituting (1 0; 1 1), i.e. `(x, y) ↦ (x + y, y)`, sends `x³y = (0, 1, 0, 0, 0)` to `(0, 1, 3, 3, 1)`.

- Substituting (1 1; 0 1) fixes `x⁴ = (1, 0, 0, 0, 0)`; a column-vector convention would give `(x + y)⁴` and fails.

- The identity of `GL₂(ℚ)` fixes every form.

<a id="binary-quartic-invariants"></a>

**Binary quartic invariants.** For `f = (a, b, c, d, e) ∈ V_R` put `I(f) = 12ae − 3bd + c²` and `J(f) = 72ace + 9bcd − 27ad² − 27`eb² `− 2c³` (Bhargava–Shankar (4)), and let the discriminant be the integral polynomial `Δ(f) = 256a³e³ − 192a²`bde² `− 128a²c²e² + 144a²`cd²e `− 27a²d⁴ + 144`ab²ce² `− 6`ab²d²e `− 80`abc²de `+ 18abcd³ + 16ac⁴e − 4ac³d² − 27b⁴e² + 18b³`cde `− 4b³d³ − 4b²c³e + b²c²d²`, so that `27·Δ(f) = 4I(f)³ − J(f)²` (Bhargava–Shankar write `Δ(f) = (4I³ − J²)/27`). Homogeneity: `I(rf) = r²I(f)`, `J(rf) = r³J(f)` and `Δ(rf)=r⁶Δ(f)` for the coefficientwise scaling rf. I and J commute with base change. For a pair `(I, J)` not assumed to come from a form, the conditions used downstream are stated with `4I³ − J² (= 27Δ)`, which carries the same p-adic information as `Δ` at `p ≠ 3`. Proposed declarations: `BinaryQuartic.invI`, `invJ`, `disc`.

`Δ` is the integral polynomial, not `(4I³ − J²)/27`: this makes it defined over every commutative ring (`ℤ_p`, `ℤ/p^k`, rings where 3 is not invertible) and makes `27Δ = 4I³ − J²` a theorem. This target defines the coefficient polynomials, proves their identity and homogeneity, and proves compatibility with coefficient ring maps.

- `BinaryQuartic.invI`: `I(f) = 12ae − 3bd + c²`.

- `BinaryQuartic.invJ`: `J(f) = 72ace + 9bcd − 27ad² − 27eb² − 2c³`.

- `BinaryQuartic.disc`: The integral discriminant polynomial `Δ(f)`.

- `27Δ(f) = 4I(f)³ − J(f)²`.

- `BinaryQuartic.scale`: The coefficientwise scaling rf.

- `I(rf) = r²I(f)`.

- `J(rf) = r³J(f)`.

- I commutes with base change.

- J commutes with base change.

For the proof, Expand the coefficient polynomials over the integers to prove `27Δ=4I³−J²`; homogeneity follows from their degrees. Specialize these polynomial identities to every commutative ring.

*Needs:* [binary quartic form](#binary-quartic-form).

([[1]](#ref-1), §2, (4), printed p. 7; [[1]](#ref-1), §1.2, printed p. 4.)

**Checks.**

- For `x³y − xy³ = (0, 1, 0, −1, 0)`: `I = 3`, `J = 0`, `Δ = 4`.

- For `x⁴ − y⁴`: `I = −12` and `Δ = −256`, the value of Mathlib's discriminant of `X⁴ − 1`.

- For the zero form and for `x⁴`: `I = J = Δ = 0`.

- Under the untwisted action of `2·1 ∈ GL₂(ℚ)` (determinant 4), `I(x³y − xy³)` becomes `4⁴·3 = 768`: I is not an absolute invariant of the untwisted action.

- The all-ones quartic `x⁴+x³y+x²y²+xy³+y⁴` has `(I,J,Δ)=(10,25,125)`.

- `x³y − xy³`: `I = 3`, `J = 0`, `Δ = 4` (roots 0, `±1`, `∞`).

- `x⁴ − y⁴`: `I = −12`, `J = 0`, `Δ = −256`, the polynomial discriminant of `X⁴ − 1`.

- `x⁴`: `I = J = Δ = 0` (the null cone contains forms with a fourfold root).

- Over `𝔽₃` the form `x³y−xy³` has `I=J=0` but `Δ=1`. The identity `27Δ=4I³−J²` remains valid and does not determine `Δ` in characteristic three; division by 27 is restricted to rings where it is invertible.

<a id="relative-invariance-of-i-and-j"></a>

**Relative invariance of i and j.** For every commutative ring R, `γ ∈ GL₂(R)` and `f ∈ V_R`: `I(γ·f) = (det γ)⁴·I(f)` and `J(γ·f) = (det γ)⁶·J(f)` (Bhargava–Shankar (5)).

Use the untwisted action of [binary quartic form](#binary-quartic-form). After proving relative invariance of I and J, deduce invariance of I, J and Δ under the determinant-to-the-minus-two action and the determinant weight 12 of Δ under the untwisted action.

- `I(γ⋆f) = I(f)`.

- `J(γ⋆f) = J(f)`.

- `Δ(γ·f) = (det γ)¹²Δ(f)`.

For the proof, Both identities are polynomial identities with integer coefficients in a, `…`, e and the entries p, q, r, s of `γ`: substitute the coefficient formulas of [binary quartic form](#binary-quartic-form) and compare (ring normalisation over `ℤ[a, …, e, p, q, r, s]`, then specialise). No invertibility of 2 or 3 is used. Next, homogeneity cancels the determinant factors for twisted invariance of I and J. Prove the determinant-weight formula for the discriminant from `27Δ=4I³−J²` over the universal integer polynomial ring, where 27 is a nonzerodivisor, and then specialize to R.

*Needs:* [binary quartic form](#binary-quartic-form), [binary quartic invariants](#binary-quartic-invariants).

([[1]](#ref-1), §2, (5), printed p. 7.)

**Checks.**

- For `γ = 2·1 ∈ GL₂(ℚ) (det γ = 4)` and `f = x³y − xy³`: `I(γ·f) = 256·3 = 768`; the weight `(det γ)²` fails.

- For `γ ∈ GL₂(ℤ)`, `det γ = ±1` and I, J are `GL₂(ℤ)`-invariant, so `H(f)` is a class invariant.

- Reversing coefficients of `x⁴+xy³` gives `y⁴+x³y`. Both have `I=0` and `J=−27`, so a determinant-sign factor in J would fail.

<a id="quartic-discriminant-is-the-polynomial-discriminant"></a>

**Quartic discriminant is the polynomial discriminant.** Let `f = (a, b, c, d, e) ∈ V_R` with `f(X, 1) = aX⁴` + bX³ + cX² + dX `+ e` of degree 4. Then `Δ(f) =` discr(`f(X, 1)`), Mathlib's Polynomial.discr (the signed Sylvester resultant with the leading-coefficient factor removed integrally, implemented by the modified matrix sylvesterDeriv; the sign makes polynomials over `ℝ` with all roots real have nonnegative discriminant). Over a field containing the roots `α₁`, `…`, `α₄` of `f(X, 1)`, `Δ(f) = a⁶∏_{i<j}(α_i − α_j)²`.

Degree exactly 4 (a is not a zero divisor suffices); for `a = 0` the form has the root [1 : 0] and `f(X, 1)` has lower degree.

For the proof, Reindex the `7 × 7` matrix sylvesterDeriv of a degree-4 polynomial to Fin 7 exactly as Mathlib does in degree 3 (mathlib:`Polynomial.discr_of_degree_eq_three`) and expand the determinant; compare with the sixteen-term polynomial `Δ`.

*Needs:* [binary quartic invariants](#binary-quartic-invariants), `Polynomial.discr` (Mathlib), `Polynomial.discr_of_degree_eq_three` (Mathlib).

([[1]](#ref-1), §2, printed p. 7.)

**Checks.**

- `Δ(x⁴ − y⁴) = −256 =` discr(`X⁴ − 1`) (the discriminant of `X⁴ + e` is `256e³`).

- The sign of `Δ` separates the real types: `Δ > 0` for four or zero real roots, `Δ < 0` for two (Bhargava–Shankar §2.1).

- For `(x²−y²)²`, both the quartic invariant discriminant and the discriminant of `(X²−1)²` vanish, since the roots are repeated.

- For `f(X,1)=2X⁴−2`, the discriminant is `−16384`, whereas its resultant with its derivative is `−32768`; the latter still contains the leading coefficient 2.

<a id="binary-quartic-height"></a>

**Binary quartic height.** For real I, J put `H(I, J) := max{|I|³, J²/4}`, and for an integral binary quartic form `H(f) := H(I(f), J(f))` (Bhargava–Shankar (6)). Properties: `H ≥ 0`, with `H(I, J) = 0 iff I = J = 0`; `H(t²I, t³J) = t⁶H(I, J)`, so `H(rf) = r⁶H(f)` (a 'degree 6' function of the coefficients) and `H(2⁴I, 2⁶J) = 2¹²H(I, J)` (the scaling in Theorem 3.5 and in the proof of Theorem 3.19); `H(I, J) ≤ X` implies `|I| ≤ X^(1/3)` and `|J| ≤ 2X^(1/2)`; for integers `4H(I, J) = max{4|I|³, J²} ∈ ℕ`, so the `ℕ`-valued carrier of [arithmetic family](#arithmetic-family) applies to 4H; `(I, J) ↦ H(I, J)` is Northcott on `ℤ²`; H is invariant under `GL₂(ℤ)`. Proposed declarations: `BinaryQuartic.pairHeight`, `BinaryQuartic.height`.

The factor `1/4` on `J²` is a normalisation; the constants `4/135`, `32/135`, `8/135` of Theorem 1.6 and `8/135`, `32/135` of Proposition 2.10 depend on it. H is a height on invariant pairs; on classes of forms it is well defined by `GL₂(ℤ)`-invariance. The null cone (height 0) contains the infinitely many classes of `kx⁴`, so orbit families exclude it (Bhargava–Shankar count irreducible forms only).

- `BinaryQuartic.pairHeight`: `H(I, J) = max{|I|³, J²/4}`.

- `BinaryQuartic.height`: `H(f) = H(I(f), J(f)) for f ∈ V_ℤ`.

- `0 ≤ H(I, J)`.

- `H(t²I, t³J) = t⁶H(I, J)`.

- `H(I, J) = 0 ↔ I = J = 0`.

- `H(I, J) ≤ X ⇒ |I| ≤ X^(1/3) ∧ |J| ≤ 2X^(1/2)`.

- For integers, `4H(I, J) = max{4|I|³, J²}` as a natural number.

- H is Northcott on `ℤ²`.

- `H(γ·f) = H(f) for γ ∈ GL₂(ℤ)`.

- `H(rf) = r⁶H(f)`.

For the proof, weighted homogeneity follows from `|t²I|³ = t⁶|I|³` and `(t³J)²/4 = t⁶J²/4`. The coordinate bounds follow from `|I|³ ≤ X` and `J²/4 ≤ X`. For Northcott finiteness, `{(I, J) ∈ ℤ² : H ≤ X}` lies in the box `|I| ≤ X^(1/3)`, `|J| ≤ 2X^(1/2)`. For height invariance, `det γ = ±1` for `γ ∈ GL₂(ℤ)`, so I and J are unchanged ([relative invariance of i and j](#relative-invariance-of-i-and-j)).

*Needs:* [binary quartic invariants](#binary-quartic-invariants), [relative invariance of i and j](#relative-invariance-of-i-and-j), `Northcott` (Mathlib).

([[1]](#ref-1), §2, (6), printed p. 7; [[1]](#ref-1), §1.2, printed p. 4.)

**Checks.**

- `H(1, 2) = 1`.

- `H(0, 0) = 0`.

- `H(2, 2) = 8`, not `max(|I|, |J|) = 2`.

- The number of integer pairs with `H(I, J) ≤ X` is about `(2X^(1/3))(4X^(1/2)) = 8X^(5/6)`; the eligible ones are `1/27` of them ([eligible pairs are nine lattice translates](#eligible-pairs-are-nine-lattice-translates)).

<a id="eligible-invariant-pairs"></a>

**Eligible invariant pairs.** A pair `(I, J) ∈ ℤ²` is eligible if it occurs as `(I(f), J(f))` for an integral binary quartic form f. The eligibility congruences are: `(a) I ≡ 0 (mod 3)` and `J ≡ 0 (mod 27)`; `(b) I ≡ 1 (mod 9)` and `J ≡ ±2 (mod 27)`; `(c) I ≡ 4 (mod 9)` and `J ≡ ±16 (mod 27)`; `(d) I ≡ 7 (mod 9)` and `J ≡ ±7 (mod 27)`. The invariant pair of every integral form is eligible by definition, and eligibility is preserved by `(I, J) ↦ (r²I, r³J)` for integers r (scale the form by r) — in particular by `(I, J) ↦ (2⁴I, 2⁶J) (r = 4)`, the scaling of Theorem 3.5. Proposed declarations: `BinaryQuartic.IsEligible`, `BinaryQuartic.EligibilityCongruence`.

Eligibility is a property of integer pairs; the equivalence with the congruences is Theorem 1.7 ([eligibility criterion modulo 27](#eligibility-criterion-modulo-27)).

- `BinaryQuartic.IsEligible`: `∃ f ∈ V_ℤ, (I(f), J(f)) = (I, J)`.

- `BinaryQuartic.EligibilityCongruence`: The disjunction of the congruences (a)–(d).

- `(I(f), J(f))` is eligible for every integral f.

- `(I, J)` eligible `⇒ (2⁴I, 2⁶J)` eligible.

For the proof, IsEligible and EligibilityCongruence are direct definitions; eligibility of form invariants is the witness f itself; preservation of eligibility under Selmer scaling uses homogeneity of I and J from [binary quartic invariants](#binary-quartic-invariants) with `r = 4`.

*Needs:* [binary quartic invariants](#binary-quartic-invariants).

([[1]](#ref-1), Theorem 1.7, printed pp. 4–5.)

**Checks.**

- `(1, 2)` is eligible.

- `(1, 0)` is not eligible.

- `(2, J)` is not eligible for any J.

- `(0, 0)` is eligible and has height 0.

- `(1, 2)` is eligible (`x³y − x²y²`, by [congruence pairs are eligible](#congruence-pairs-are-eligible)); `(1, 0)` is not; no pair with `I ≡ 2 (mod 3)` is eligible; `(0, 0)` is the pair of the zero form.

<a id="eligible-invariant-pairs-satisfy-the-congruences"></a>

**Eligible invariant pairs satisfy the congruences.** For every integral binary quartic form f, the pair `(I(f), J(f))` satisfies one of the eligibility congruences (a)–(d).

Only the coefficient formulas for I and J are used; no resolvent.

For the proof, Modulo 3, `I ≡ c²`. If 3 | c, write `c = 3c′`. Then `72ace = 216ac′e ≡ 0`, `9bcd = 27bc′d ≡ 0`, `2c³ = 54c′³ ≡ 0` and `27ad² ≡ 27`eb² `≡ 0` modulo 27, so `J ≡ 0 (mod 27)` and `I ≡ 0 (mod 3)`: case (a). If `3 ∤ c`, then modulo 9 and 27 respectively `I ≡ c² + 3w` and `J ≡ −2c³ − 9`cw, with `w ≡ ae − bd (mod 3)` (use `12 ≡ 3 mod 9`, `72 ≡ 18 mod 27`, and `2ae + bd ≡ −(ae − bd) mod 3`). For `c = 1 + 3k`: `c² ≡ 1 + 6k (mod 9)`, `c³ ≡ 1 + 9k (mod 27)`, so with `m ≡ 2k + w (mod 3)`, `I ≡ 1 + 3m (mod 9)` and `J ≡ −2 − 9m (mod 27)`. For `c = −1 + 3k`: with `m ≡ w − 2k`, `I ≡ 1 + 3m` and `J ≡ 2 + 9m`. As m runs over 0, 1, 2 this gives `(I mod 9, J mod 27) =` (1, ∓2), `(4, ±16)`, `(7, ±7)`: cases (b)–(d).

*Needs:* [eligible invariant pairs](#eligible-invariant-pairs), [binary quartic invariants](#binary-quartic-invariants).

([[1]](#ref-1), §2.8, proof of Theorem 1.7, printed pp. 21–22.)

**Checks.**

- The residues `(I mod 9, J mod 27)` of all `27⁵` coefficient vectors modulo 27 are exactly the nine eligible residue pairs.

- The form `x⁴` gives `(I,J)=(0,0)`, in case (a).

- The form `x²y²` gives `(I,J)=(1,−2)`, in case (b); the sign in J matters.

<a id="congruence-pairs-are-eligible"></a>

**Congruence pairs are eligible.** If `(I, J) ∈ ℤ²` satisfies one of (a)–(d), then there are integers r, s, t with `I(f) = I` and `J(f) = J` for `f = x³y + r x²y² + s xy³ + t y⁴ (a = 0, b = 1, c = r, d = s, e = t)`, for which `I(f) = r² − 3s` and `J(f) = −2r³ + 9`rs `− 27t`. Take `r = 0` in case (a); in cases (b)–(d) take `r = 1` when `J ≡ −2`, 16 or 7 (mod 27) and `r = −1` when `J ≡ 2`, `−16` or `−7 (mod 27)`; then `s = (r² − I)/3` and `t =` (`−2r³ + 9`rs `− J`)`/27` are integers.

The witness has `a = 0` (a rational root at [1 : 0]); eligibility says nothing about irreducibility.

For the proof, With `a = 0`, `b = 1`: `I = −3s + r²` and `J = 9`rs `− 27t − 2r³`. Case (a): `r = 0`, `s = −I/3`, `t = −J/27`. Cases (b)–(d): `r = ±1`, `s = (1 − I)/3 ∈ ℤ` since `I ≡ 1 (mod 3)`; then `J ≡ r(9s − 2) (mod 27)` holds exactly for the sign chosen above `(I ≡ 1, 4, 7 (mod 9) ⇔ s ≡ 0, 2, 1 (mod 3))`, so `t ∈ ℤ`.

*Needs:* [eligible invariant pairs](#eligible-invariant-pairs), [binary quartic invariants](#binary-quartic-invariants).

([[1]](#ref-1), §2.8, proof of Theorem 1.7, printed p. 21.)

**Checks.**

- `(1, 2)`: `r = −1`, `s = 0`, `t = 0`, i.e. `x³y − x²y²` has `I = 1`, `J = 2`.

- For `(I,J)=(3,0)`, take `(r,s,t)=(0,−1,0)`, giving `x³y−xy³`.

- For `(I,J)=(0,27)`, take `(r,s,t)=(0,0,−1)`, giving `x³y−y⁴`.

<a id="eligibility-criterion-modulo-27"></a>

**Eligibility criterion modulo 27.** A pair `(I, J) ∈ ℤ²` occurs as the invariants of an integral binary quartic form if and only if one of the following holds: `(a) I ≡ 0 (mod 3)` and `J ≡ 0 (mod 27)`; `(b) I ≡ 1 (mod 9)` and `J ≡ ±2 (mod 27)`; `(c) I ≡ 4 (mod 9)` and `J ≡ ±16 (mod 27)`; `(d) I ≡ 7 (mod 9)` and `J ≡ ±7 (mod 27)`. Proposed declaration: `BinaryQuartic.isEligible_iff`.

No other congruence condition and no condition at primes other than 3 is needed. `BinaryQuartic.isEligible_iff` in `Suggested.lean` states this realizability classification.

For the proof, `⇒`: [eligible invariant pairs satisfy the congruences](#eligible-invariant-pairs-satisfy-the-congruences). ⇐: [congruence pairs are eligible](#congruence-pairs-are-eligible).

*Needs:* [eligible invariant pairs satisfy the congruences](#eligible-invariant-pairs-satisfy-the-congruences), [congruence pairs are eligible](#congruence-pairs-are-eligible).

([[1]](#ref-1), Theorem 1.7, printed pp. 4–5.)

**Checks.**

- `(1, 2)` is eligible and `(1, 0)` is not (Bhargava–Shankar's cases (b) and none).

- Eligibility depends only on `(I mod 9, J mod 27)` and is therefore decidable; the eligible residues are exactly nine ([eligible pairs are nine lattice translates](#eligible-pairs-are-nine-lattice-translates)).

- The pair `(4,16)` is eligible, witnessed by `x³y+x²y²−xy³−y⁴`.

<a id="eligible-pairs-are-nine-lattice-translates"></a>

**Eligible pairs are nine lattice translates.** There is a set `R ⊂ ℤ/9 × ℤ/27` of exactly nine residue pairs, `R = {(0, 0), (3, 0), (6, 0), (1, 2), (1, −2), (4, 16), (4, −16), (7, 7), (7, −7)}`, such that `(I, J) ∈ ℤ²` is eligible `iff (I mod 9, J mod 27) ∈ R`. So the eligible pairs are a union of 9 distinct translates of `9ℤ × 27ℤ` and have density `9/243 = 1/27` in `ℤ²`.

Case (a) is a condition on I modulo 3, i.e. three residues modulo 9.

For the proof, By [eligibility criterion modulo 27](#eligibility-criterion-modulo-27), eligibility depends only on `(I mod 9, J mod 27)`; list the residues of (a)–(d): `3 + 2 + 2 + 2 = 9`.

*Needs:* [eligibility criterion modulo 27](#eligibility-criterion-modulo-27).

([[1]](#ref-1), Lemma 2.9, printed p. 14.)

**Checks.**

- The count of eligible pairs with `H(I, J) < X` is `(1/27) ×` the area of `{|I| < X^(1/3), |J| < 2X^(1/2)}` with the sign condition, up to the boundary error (Bhargava–Shankar Proposition 2.10).

- Case (a) contributes all three pairs `(0,0)`, `(3,0)` and `(6,0)` modulo `(9,27)`, rather than one pair.

- Adding `(9,27)` preserves eligibility; the ineligible pair `(2,0)` and its translate `(11,27)` both remain outside the nine classes.

### 0.4 Elliptic invariant families

<a id="elliptic-curves-over-q-ordered-by-height"></a>

**Elliptic curves over q ordered by height.** Let Carrier be the set of integral short Weierstrass equations W : `y² = x³ + Ax + B` over `ℤ` that are minimal pairs in the sense of EllipticCurves Layer 8 (IsMinimalPairNF: short normal form, and no prime `ℓ` with `ℓ⁴ | A` and `ℓ⁶ | B`) and elliptic over `ℚ (4A³ + 27B² ≠ 0)`. By Layer 8's `exists_minimalPairModel` and `minimalPairModel_unique`, `W ↦ [W ⊗ ℚ]` is a bijection from Carrier onto the `ℚ`-isomorphism classes of elliptic curves over `ℚ` (toIsoClass, into Mathlib's orbit type of the VariableChange action). The arithmetic family of elliptic curves over `ℚ` is `(Carrier, H)` with `H(E_{A,B}) = max{4|A|³, 27B²}` (Layer 8's shortEquationHeight, i.e. its naiveHeight of the curve), Northcott by Layer 8's bounded-height finiteness. Its invariant map is `E ↦ (I(E), J(E)) := (−3A, −27B)` (Bhargava–Shankar (48)); it is injective, takes values in `3ℤ × 27ℤ`, hence in the eligible pairs (case (a) of Theorem 1.7), and satisfies `4I³ − J² = −27(4A³ + 27B²)`, so `Δ(I(E), J(E)) = −(4A³ + 27B²) = Δ_E/16` with Mathlib's `Δ_E = −16(4A³ + 27B²)`. The curve height of Bhargava–Shankar §3 is `H′(E) := H(I(E), J(E)) = max{|I(E)|³, J(E)²/4}` ((49)). The localisation at a prime p is `(I(E), J(E)) ∈ ℤ_p²` ([elliptic families defined by congruence conditions](#elliptic-families-defined-by-congruence-conditions)). Proposed declarations: `EllipticFamily.Carrier`, `EllipticFamily.family`, `EllipticFamily.invariants`, `EllipticFamily.heightPrime`.

The carrier is Layer 8's minimal pair, not a DVR-minimal long model and not a bare rational equation: on rational short models the expression `max{4|A|³, 27B²}` is not an isomorphism invariant and bounded-height finiteness fails (Layer 8). This construction imports Layer 8's predicate, height and finiteness; it adds only the invariant map, `H′` and the family structure. Every elliptic curve over `ℚ` has a short model (Mathlib's `exists_variableChange_isShortNF`, characteristic 0), which Layer 8 minimises.

- `EllipticFamily.Carrier`: Minimal-pair integral short equations with `4A³ + 27B² ≠ 0` (Layer 8's IsMinimalPairNF).

- `EllipticFamily.family`: The arithmetic family `(Carrier, max{4|A|³, 27B²})`.

- `EllipticFamily.invariants`: `(I(E), J(E)) = (−3A, −27B)`.

- `EllipticFamily.heightPrime`: `H′(E) = H(I(E), J(E))`.

- `EllipticFamily.invariants_injective`: The invariant map is injective.

- `EllipticFamily.invariants_eligible`: `(I(E), J(E))` is eligible (case (a)).

- `EllipticFamily.pairDisc_invariants`: `4I³ − J² = −27(4A³ + 27B²)`.

- `EllipticFamily.sixteen_mul_pairDisc_invariants`: `16·(−(4A³ + 27B²)) = Δ_E`, Mathlib's discriminant.

- `EllipticFamily.toIsoClass`: `E ↦` its `ℚ`-isomorphism class (orbit of the VariableChange action).

- `EllipticFamily.toIsoClass_injective`: Distinct minimal pairs are non-isomorphic over `ℚ` (Layer 8's uniqueness).

- `EllipticFamily.exists_toIsoClass_eq`: Every elliptic curve over `ℚ` is isomorphic to a member (Layer 8's existence).

For the proof, family: height `=` Layer 8's shortEquationHeight; northcott from Layer 8's theorem `Set.Finite {W | IsMinimalPairNF W ∧ (W.baseChange ℚ).IsElliptic ∧ shortEquationHeight W ≤ X}` (requested from Layer 8). `toIsoClass_injective` and `exists_toIsoClass_eq`: Layer 8's `minimalPairModel_unique` and `exists_minimalPairModel`. `invariants_injective`: `(−3A, −27B)` determines `(A, B)`. `invariants_eligible`: `3 | −3A` and `27 | −27B`, case (a) of [eligibility criterion modulo 27](#eligibility-criterion-modulo-27). `pairDisc_invariants`: `4(−3A)³ − (−27B)² = −108A³ − 729B² = −27(4A³ + 27B²)`; `sixteen_mul_pairDisc_invariants`: Mathlib's mathlib:WeierstrassCurve.`Δ_of_isShortNF`.

*Needs:* [arithmetic family](#arithmetic-family), [binary quartic height](#binary-quartic-height), [eligibility criterion modulo 27](#eligibility-criterion-modulo-27), `WeierstrassCurve.IsShortNF` (Mathlib), `WeierstrassCurve.Δ_of_isShortNF` (Mathlib), `WeierstrassCurve.exists_variableChange_isShortNF` (Mathlib), `WeierstrassCurve.VariableChange` (Mathlib), `MulAction.orbitRel.Quotient` (Mathlib).

([[1]](#ref-1), §1.1, printed p. 1; [[1]](#ref-1), §3, (48)–(49), printed p. 22.)

**Checks.**

- For `y² = x³ − x`: `H = 4`, `(I, J) = (3, 0)` and `H′ = 27`.

- `(A, B) = (0, 0)` fails `4A³ + 27B² ≠ 0` and is not in the carrier.

- `(A, B) = (16, 64)` is not a minimal pair (`2⁴ | 16` and `2⁶ | 64`); the change of variables with `u = 2` gives the minimal pair `(1, 1)`, of height `max(4, 27) = 27`.

<a id="quartic-to-curve-height-normalisation"></a>

**Quartic to curve height normalisation.** For every `E = E_{A,B}` in the family of elliptic curves over `ℚ`: `27·H(E) = 4·H′(E)`, where `H(E) = max{4|A|³, 27B²}` and `H′(E) = max{|I(E)|³, J(E)²/4}`. Hence `H′ = (27/4)·H` is a constant rescaling ([constant rescaling of a height](#constant-rescaling-of-a-height)): the two heights order every set of curves identically, the count of curves with `H′(E) ≤ X` is the count with `H(E) ≤ 4X/27`, averages agree, and `N_H(F; X) ~ C·X^(5/6)` gives `N_{H′}(F; X) ~ (4/27)^(5/6)·C·X^(5/6)`. Proposed declaration: `EllipticFamily.twentySeven_mul_height`.

The absolute value on `I(E)³` matters. The coefficient identity is `27 max(4|A|³,27B²)=4H(−3A,−27B)` for real A,B; specializing to the minimal integral pair gives the curve-family identity.

For the proof, `|I(E)|³ = 27|A|³ = (27/4)·4|A|³` and `J(E)²/4 = 729B²/4 = (27/4)·27B²`; take the maximum. The consequences are [constant rescaling of a height](#constant-rescaling-of-a-height) with `c = 27/4`.

*Needs:* [elliptic curves over q ordered by height](#elliptic-curves-over-q-ordered-by-height), [binary quartic height](#binary-quartic-height), [constant rescaling of a height](#constant-rescaling-of-a-height).

([[1]](#ref-1), §3 opening, printed p. 22.)

**Checks.**

- `y² = x³ − x`: `27·4 = 108 = 4·27`.

- `y² = x³ + 1`: `H = 27`, `(I, J) = (0, −27)`, `H′ = 729/4` and `27·27 = 4·729/4`.

- For `y²=x³+x`, `(I,J)=(−3,0)` and `H′=27`, while `H=4`; using `I³` without absolute value would fail.

<a id="elliptic-families-defined-by-congruence-conditions"></a>

**Elliptic families defined by congruence conditions.** For each prime p let `Σ_p` be a subset of `{(I, J) ∈ ℤ_p² : Δ(I, J) ≠ 0}`, closed in it, with boundary of Haar measure 0, and let `Σ_∞` be one of `{Δ > 0}`, `{Δ < 0}`, `{Δ ≠ 0}`. The family `F_Σ` consists of the E in the family of elliptic curves over `ℚ` with `(I(E), J(E)) ∈ Σ_p` for all p and `(I(E), J(E)) ∈ Σ_∞`. For `S ⊆ Carrier`, Inv(S) `= {(I(E), J(E)) : E ∈ S}`, `Inv_p(S) =` (closure of Inv(S) in `ℤ_p²`) `∖ {Δ = 0}`, and `Inv_∞(S)` is the sign set. S is large if, for all but finitely many p, `Inv_p(S) ⊇ {(I, J) ∈ ℤ_p² : p² ∤ Δ(I, J)}`; for `p ≠ 3` the condition `p² ∤ Δ(I, J)` is `p² ∤ 4I³ − J²`. This is [family defined by local conditions](#family-defined-by-local-conditions) for the family of elliptic curves with `X_p = ℤ_p²`, `loc_p = (I, J)`, the Haar probability measure, and `B_p = {p² | Δ}`. Largeness is monotone. The family of all curves is large ([all elliptic curves form a large family](#all-elliptic-curves-form-a-large-family)); every nonempty family defined by finitely many congruence conditions on `(A, B)` is large; the curves semistable at every prime `ℓ ≥ 5` (for a minimal pair: `ℓ ∤ gcd(A, B)`) form a large family — the arithmetic content of Bhargava–Shankar's remark that the semistable family is large, since conditions at the finitely many primes 2, 3 (reduction types of EllipticCurves Layer 4) do not affect largeness. The curves with `B = 0 (j = 1728)` form a family defined by congruence conditions that is not large. Proposed declarations: `EllipticFamily.invLocal`, `IsLarge`, `congruenceFamily`.

Largeness allows infinitely many local conditions but forbids excluding, at infinitely many p, pairs with `p² ∤ Δ`; the semistable family excludes a set of positive measure at every p (additive reduction, where `p² | Δ`) and is still large. Largeness is a property of the closure of the actual invariants of the family, not of the sets `Σ_p` alone.

- `EllipticFamily.invLocal`: `Inv_p(S) =` closure of the invariants of S in `ℤ_p²`, minus `Δ = 0`.

- `EllipticFamily.IsLarge`: For all but finitely many p, every `(I, J) ∈ ℤ_p²` with `p² ∤ 4I³ − J²` lies in `Inv_p(S)`.

- `EllipticFamily.SignCondition`: The three sign conditions at `∞`: `Δ > 0`, `Δ < 0`, none.

- `EllipticFamily.congruenceFamily`: `F_Σ` from local sets `Σ_p ⊆ ℤ_p²` and a sign condition.

- `EllipticFamily.IsLarge.mono`: Largeness passes to larger families.

- `EllipticFamily.isLarge_semistableAwayFromSix`: The curves with `ℓ ∤ gcd(A, B)` for every prime `ℓ ≥ 5` form a large family.

For the proof, invLocal, IsLarge and congruenceFamily are direct definitions over Mathlib's `ℤ_p` (mathlib:PadicInt). IsLarge.mono: `Inv_p` is monotone in S. `isLarge_semistableAwayFromSix`: for `p ≥ 5` and a prescribed pair `(A₀, B₀)` with `p²` not dividing `4A₀³ + 27B₀²`, fix `k ≥ 2` and a nonzero integer B congruent to `B₀` modulo `p^k`. For each prime `ℓ ≥ 5` dividing B with `ℓ ≠ p` impose `A ≡ 1` modulo `ℓ`; impose the same at 2 and 3 when they divide B to ensure minimality there. These finitely many conditions are compatible with `A ≡ A₀` modulo `p^k` by CRT. If p divides B, the good discriminant forces p not to divide `A₀`. Thus every resulting pair is minimal and semistable away from 6. The progression of A is infinite, and at most three A satisfy `4A³ + 27B² = 0`. This proves density in each required p-adic neighbourhood. The `j = 1728` non-example: `Inv_p({B = 0}) ⊆ ℤ_p × {0}` misses `(0, 1)`, where `p² ∤ Δ = −1/27` for `p ≠ 3`.

*Needs:* [family defined by local conditions](#family-defined-by-local-conditions), [elliptic curves over q ordered by height](#elliptic-curves-over-q-ordered-by-height), [binary quartic invariants](#binary-quartic-invariants), `PadicInt` (Mathlib).

([[1]](#ref-1), §3 opening, printed p. 22; [[1]](#ref-1), §3, after Theorem 3.1, printed p. 22.)

**Checks.**

- The family `{B = 0}` is not large.

- With every `Σ_p` the whole plane and no sign condition, `F_Σ` is everything.

- The family `{A ≡ 1 (mod 5)}` is large.

- With `Σ_p = ℤ_p² ∖ {Δ = 0}` for all p and no sign condition, `F_Σ` is the whole family.

<a id="all-elliptic-curves-form-a-large-family"></a>

**All elliptic curves form a large family.** The whole family of elliptic curves over `ℚ` (the carrier of minimal pairs) is large: for every prime `p ≥ 5` and every `(I, J) ∈ ℤ_p²` with `p² ∤ Δ(I, J)`, `(I, J)` is a p-adic limit of invariant pairs `(−3A, −27B)` of minimal pairs `(A, B)` with `4A³ + 27B² ≠ 0`. Proposed declaration: `EllipticFamily.isLarge_univ`.

Only `p ≥ 5` is needed (largeness ignores finitely many primes).

For the proof, For `p ≥ 5` put `(A₀, B₀) = (−I/3, −J/27) ∈ ℤ_p²`; `p² ∤ Δ(I, J) = −(4A₀³ + 27B₀²)` rules out `p⁴ | A₀` and `p⁶ | B₀`. Given a precision k, increase it to at least 2 and choose a nonzero integer B congruent to `B₀` modulo `p^k`. Only finitely many primes divide B. For every such prime `ℓ ≠ p` impose `A ≡ 1` modulo `ℓ`, together with `A ≡ A₀` modulo `p^k`. CRT gives an infinite progression of integers A. At p, if p divides B then p does not divide `A₀`, since otherwise `p²` divides the discriminant; hence every resulting pair is minimal at every prime. Exclude the at most three integer roots of `4A³ + 27B²`. This elementary construction supplies the required nonsingular minimal pair without an infinite-prime sieve estimate. Then `(−3A, −27B) ≡ (I, J) (mod p^k)`; let `k → ∞`.

*Needs:* [elliptic families defined by congruence conditions](#elliptic-families-defined-by-congruence-conditions), [elliptic curves over q ordered by height](#elliptic-curves-over-q-ordered-by-height).

([[1]](#ref-1), §3, after Theorem 3.1, printed p. 22.)

**Checks.**

- Consequently Theorem 3.1 contains Theorem 1.1 (the average of `#S₂(E)` over all curves is 3).

- At `p=5`, the minimal pair `(A,B)=(0,1)` realizes `(I,J)=(0,−27)` with discriminant a 5-adic unit.

- The pair `(I,J)=(0,0)` is singular and is excluded from the required p-adic locus. Largeness imposes no approximation condition there.

<a id="invariants-height-and-eligible-pairs"></a>

**Invariants height and eligible pairs.** This construction packages Layer 0's binary-quartic interface for the orbit, counting and Selmer arguments: the invariants I, J with weights `(det γ)⁴`, `(det γ)⁶` ([binary quartic invariants](#binary-quartic-invariants), [relative invariance of i and j](#relative-invariance-of-i-and-j)), the discriminant with `27Δ = 4I³ − J²`, equal to the polynomial discriminant ([quartic discriminant is the polynomial discriminant](#quartic-discriminant-is-the-polynomial-discriminant)), the height `H(I, J) = max{|I|³, J²/4}` ([binary quartic height](#binary-quartic-height)), the eligible pairs characterised modulo 27 ([eligibility criterion modulo 27](#eligibility-criterion-modulo-27); nine translates of `9ℤ × 27ℤ`, [eligible pairs are nine lattice translates](#eligible-pairs-are-nine-lattice-translates)) and the normalisation to curves ([quartic to curve height normalisation](#quartic-to-curve-height-normalisation)). Definition: the arithmetic family eligibleFamily of eligible pairs `(I, J) ∈ ℤ²` ordered by `H(I, J)` (Northcott because H is Northcott on `ℤ²`), with the map ofCurve sending `E_{A,B}` (EllipticCurves Layer 8's minimal pair) to its eligible invariant pair `(−3A, −27B)`, for which `27·H(E) = 4·H(ofCurve E)`. The sign of `Δ(I, J)` splits eligible pairs of nonzero discriminant into those counted by Proposition `2.10(a)` (`Δ > 0`: forms with four or no real roots) and (b) (`Δ < 0`: two real roots). Proposed declarations: `BinaryQuartic.eligibleFamily`, `BinaryQuartic.ofCurve`.

Eligible pairs include degenerate ones with `4I³ = J²`: `(0, 0)` (the zero form) and `(1, ±2)` (`x³y` ∓ `x²y² = x²y(x ∓ y)`, a double root); the three eligible pairs of height `≤ 1` are all of this kind. Counts in Theorem 1.8 restrict to `(−1)^iΔ > 0`. The map ofCurve is not surjective: curve invariants lie in `3ℤ × 27ℤ`.

- `BinaryQuartic.eligibleFamily`: The eligible pairs as an arithmetic family ordered by `H(I, J)`.

- Its height is `H(I, J)`.

- `BinaryQuartic.ofCurve`: `E_{A,B} ↦ (−3A, −27B)` as an eligible pair.

- The real coefficient identity `27 max(4|A|³,27B²)=4H(−3A,−27B)`, giving `27·H(E) = 4·H(ofCurve E)` on the curve family.

For the proof, eligibleFamily: the subtype of `ℤ²` cut out by IsEligible with the height of [binary quartic height](#binary-quartic-height); Northcott finiteness for invariant pairs restricts to the subtype. ofCurve: [elliptic curves over q ordered by height](#elliptic-curves-over-q-ordered-by-height) `(invariants_eligible)`; the quartic-to-curve height identity is [quartic to curve height normalisation](#quartic-to-curve-height-normalisation).

*Needs:* [arithmetic family](#arithmetic-family), [binary quartic invariants](#binary-quartic-invariants), [relative invariance of i and j](#relative-invariance-of-i-and-j), [quartic discriminant is the polynomial discriminant](#quartic-discriminant-is-the-polynomial-discriminant), [binary quartic height](#binary-quartic-height), [eligible invariant pairs](#eligible-invariant-pairs), [eligibility criterion modulo 27](#eligibility-criterion-modulo-27), [eligible pairs are nine lattice translates](#eligible-pairs-are-nine-lattice-translates), [elliptic curves over q ordered by height](#elliptic-curves-over-q-ordered-by-height), [quartic to curve height normalisation](#quartic-to-curve-height-normalisation).

([[1]](#ref-1), Section 2, formulas (3)-(6), printed p. 7; Theorem 1.7, printed pp. 4-5; Section 1.1 and Section 3 opening, printed pp. 1 and 22; [[1]](#ref-1), Proposition 2.10, printed p. 14.)

**Checks.**

- Exactly three eligible pairs have height at most 1: `(0, 0)`, `(1, 2)`, `(1, −2)`.

- For `y² = x³ − x`, ofCurve gives `(3, 0)` of height 27.

- No curve has invariant pair `(1, 2)`.

### 0.5 Squareclasses and quadratic twists

<a id="squareclass-height"></a>

**Squareclass height.** Let F be a number field, `O_F` its ring of integers and `t ∈ F×/F×²` a squareclass (Tau Ceti's SquareClassGroup F). For a finite prime v (Mathlib's `HeightOneSpectrum O_F`) the parity of `ord_v(u)` for a representative `u ∈ F×` (Mathlib's valuationOfNeZero) depends only on t. The odd support of t is the finite set of v with `ord_v(t)` odd (finite by Tau Ceti's `finite_setOfPred_valuation_ne_one`), its support ideal is the squarefree integral ideal `𝔞(t) := ∏_{v odd} v`, and the squareclass height is `H(t) := ∏_{v : ord_v(t) odd} N v = N(𝔞(t)) ∈ ℕ` (`Ideal.absNorm`). Properties: `H(0) = 1` (trivial class); `H(s + t)·g² = H(s)·H(t)` with `g = N(gcd(𝔞(s), 𝔞(t)))` (the odd support of a product is the symmetric difference); `H(t) = 1 iff` every `ord_v(t)` is even, i.e. t lies in the Selmer group `K(∅, 2)` (Mathlib's selmerGroup with `S = ∅`, `n = 2`), which contains the classes of units and of generators of squares of ideals and is nontrivial in general; for `F = ℚ` the class of a squarefree integer n has `H = |n|`, so [1] and `[−1]` both have height 1 (BKLOS §2: 'the squareclasses of all squarefree integers of absolute value less than X'). H is not the norm of a representative and not the discriminant of `F(√t)`. Proposed declarations: `squareclassHeight`, `oddSupport`, `supportIdeal`.

F is a number field; only finite primes enter H (infinite places are local conditions, not height factors). The height is defined on squareclasses; representatives are used only through parities of valuations.

- `oddSupport`: The finite primes at which a unit has odd valuation.

- `oddSupport_finite`: The odd support is finite.

- `unitHeight`: `∏_{v ∈ oddSupport(u)} N v` for a unit u.

- `squareclassHeight`: `H(t), the unit height of any representative`.

- `supportIdeal`: `𝔞(u) = ∏_{v ∈ oddSupport(u)} v`.

- `squareclassHeight_mk`: `H([u]) = unitHeight(u)`.

- `squareclassHeight_zero`: `H(trivial class) = 1`.

- `unitHeight_eq_absNorm_supportIdeal`: unitHeight(u) `= N(𝔞(u))`.

- `squareclassHeight_add_mul_sq`: `H(s + t)·g² = H(s)·H(t) for g = N(gcd(𝔞(s), 𝔞(t)))`.

- `squareclassHeight_eq_one_iff`: Height 1 iff all valuations even, i.e. the class lies in `K(∅, 2)`.

- `squareclassHeight_rat`: Over `ℚ`, the class of a squarefree integer n has height |n|.

For the proof, oddSupport is a subset of the finite set of v with `ord_v(u) ≠ 0` (tauceti:`IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one`). Independence of the representative: `u′ = u·w²` changes every `ord_v` by an even number (valuationOfNeZero is a homomorphism; tauceti:`TauCeti.squareClass_eq_iff_isSquare_mul`). `squareclassHeight_add_mul_sq`: the odd support of `uu′` is the symmetric difference of the odd supports, and N is multiplicative on coprime products. `squareclassHeight_rat`: for squarefree n the odd support is the set of primes dividing n, and `N(pℤ) = p`.

*Needs:* `IsDedekindDomain.HeightOneSpectrum` (Mathlib), `IsDedekindDomain.HeightOneSpectrum.valuationOfNeZero` (Mathlib), `Ideal.absNorm` (Mathlib), `IsDedekindDomain.selmerGroup` (Mathlib), `TauCeti.SquareClassGroup` (Tau Ceti), `TauCeti.squareClass` (Tau Ceti), `TauCeti.squareClass_eq_iff_isSquare_mul` (Tau Ceti), `IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one` (Tau Ceti).

([[3]](#ref-3), §2, printed p. 2 (author version); [[3]](#ref-3), §2, printed p. 2; [[2]](#ref-2), Proposition 1.3, printed p. 2.)

**Checks.**

- Over `ℚ`, `H([12]) = 3`.

- Over `ℚ`, `H([−1]) = 1`, as `H([1])`.

- Over `ℚ`, `H([3]) = 3`, not the discriminant 12 of `ℚ(√3)`.

- `ℚ(i)`: `K(∅, 2) = {[1], [i]}` (`−1 = i²` is a square, the class number is 1) and `[2] = [−i(1 + i)²] = [i]` has height 1.

<a id="squareclass-height-fibres-are-selmer-cosets"></a>

**Squareclass height fibres are selmer cosets.** For u, `u′ ∈ F×`: 𝔞(u) `=` 𝔞(`u′`) `iff ord_v(u/u′)` is even for every finite prime v, i.e. iff the class of `u/u′` lies in the Selmer group `K(∅, 2) = {x ∈ F×/F×² : ord_v(x) ≡ 0 (mod 2) for all v}` (Mathlib's selmerGroup with `S = ∅`). Hence the fibres of `t ↦` 𝔞(t) on `F×/F×²` are the cosets of `K(∅, 2)`. Proposed declaration: `supportIdeal_eq_iff`.

The squarefree ideal 𝔞(u) determines the odd support (unique factorisation of ideals).

For the proof, 𝔞(u) `=` 𝔞(`u′`) iff the odd supports agree `iff ord_v(u) ≡ ord_v(u′) (mod 2)` for every `v iff ord_v(u/u′)` is even for every v. Membership of the class of `u/u′` in `selmerGroup ∅ 2` is the vanishing of valuationOfNeZeroMod 2 at every v, which tauceti:`IsDedekindDomain.HeightOneSpectrum.valuationOfNeZeroMod_mk_eq_one_iff` turns into `2 | ord_v`.

*Needs:* [squareclass height](#squareclass-height), `IsDedekindDomain.selmerGroup` (Mathlib), `IsDedekindDomain.HeightOneSpectrum.valuationOfNeZeroMod` (Mathlib), `IsDedekindDomain.HeightOneSpectrum.valuationOfNeZeroMod_mk_eq_one_iff` (Tau Ceti).

([[3]](#ref-3), §2, printed p. 2.)

**Checks.**

- Over `ℚ`, `K(∅, 2) = {[1], [−1]}`, so each positive squarefree n and `−n` have the same support ideal.

- Over `ℚ(i)`, the distinct classes `[1]` and `[i]` have the same empty odd support, so a support fibre need not be a singleton.

- Over Q, `[2]` and `[3]` have different support ideals; their quotient has odd valuations at 2 and 3 and is outside `K(∅,2)`.

<a id="finiteness-of-squareclasses-of-bounded-height"></a>

**Finiteness of squareclasses of bounded height.** For every number field F the squareclass height is Northcott: `{t ∈ F×/F×² : H(t) ≤ X}` is finite for every X. Precisely, `t ↦` 𝔞(t) maps onto the squarefree ideals whose class lies in Cl(F)², with fibres the cosets of `K(∅, 2)`, so `#{t : H(t) ≤ X} = #K(∅, 2)·#{squarefree 𝔞 : N𝔞 ≤ X, [𝔞] ∈ Cl(F)²} ≤ #K(∅, 2)·#{ideals of norm ≤ X}`. Proposed declaration: `northcott_squareclassHeight`.

The finiteness is for squareclasses under their height, not for representatives: each class has infinitely many representatives in `F×`.

For the proof, `K(∅, 2)` is finite: tauceti:`IsDedekindDomain.finite_selmerGroup_of_numberField` (class number theorem and Dirichlet's unit theorem, via the exact sequence `1 → O_F×/O_F×² → K(∅, 2) →` Cl(F)`[2] → 0`). The fibres of `t ↦` 𝔞(t) are cosets of `K(∅, 2)` ([squareclass height fibres are selmer cosets](#squareclass-height-fibres-are-selmer-cosets)), hence finite. The absolute norm is Northcott on nonzero ideals (tauceti:TauCeti.instNorthcottAbsNormNonZeroDivisors, from mathlib:`Ring.HasFiniteQuotients.finite_absNorm_le`). `H = N ∘` 𝔞 is Northcott by mathlib:`Northcott.comp_of_finite_fibers`. Image: `(u) =` 𝔞(u)`·`𝔟² for a fractional ideal 𝔟, so [𝔞(u)] `=` [𝔟]⁻² `∈` Cl²; conversely if 𝔞𝔟² `= (u)` then 𝔞(u) `=` 𝔞 for squarefree 𝔞.

*Needs:* [squareclass height](#squareclass-height), [squareclass height fibres are selmer cosets](#squareclass-height-fibres-are-selmer-cosets), [arithmetic family](#arithmetic-family), `IsDedekindDomain.finite_selmerGroup_of_numberField` (Tau Ceti), `TauCeti.instNorthcottAbsNormNonZeroDivisors` (Tau Ceti), `Ring.HasFiniteQuotients.finite_absNorm_le` (Mathlib), `Northcott.comp_of_finite_fibers` (Mathlib).

([[3]](#ref-3), §2, printed p. 2.)

**Checks.**

- `F = ℚ`: `#{t : H(t) ≤ X} = 2·#{1 ≤ n ≤ X squarefree} ~ (12/π²)X`.

- `F = ℚ(i)`: `K(∅, 2) = {[1], [i]}`, so every squarefree ideal of `norm ≤ X` is 𝔞(t) for exactly two classes.

- For `X<1` the sublevel is empty: the norm of every nonzero integral support ideal is at least 1.

<a id="quadratic-twist-squareclass-family"></a>

**Quadratic twist squareclass family.** Let F be a number field and E : `y² = x³ + Ax + B` an elliptic curve over F in short form (Tau Ceti's shortCurve A B; every elliptic curve over F has one, Mathlib's `exists_variableChange_isShortNF`). For a squareclass `t ∈ F×/F×²` with representative u, the quadratic twist `E^(t)` is the class of the model `u y² = x³ + Ax + B`, equivalently `E^(u)` : `y² = x³ + u²A x + u³B`, modulo F-isomorphism (Mathlib's orbit type of the VariableChange action). It is well defined: replacing u by us² changes the model by the change of variables with `u_C = s`; the trivial class gives E; `E^(u)` is Tau Ceti's quadraticTwistOf `0 (−u)` (the model `y² = x³ + 16u²A x + 64u³B`) after the change of variables with `u_C = 2` (the inverse change `u_C = 1/2` sends the standard twist to Tau Ceti’s model), and for `u ∉ F×²` it is F-isomorphic to Tau Ceti's quadraticTwist `E F(√u)` (`exists_smul_quadraticTwist_eq` with the generator `√u`, of trace 0 and `norm −u`); `Δ(E^(u)) = u⁶Δ(E)` and `j(E^(u)) = j(E)`. The squareclass twist family of E is the arithmetic family `(F×/F×², H)` with H the squareclass height ([squareclass height](#squareclass-height); Northcott by [finiteness of squareclasses of bounded height](#finiteness-of-squareclasses-of-bounded-height)), together with the twist map `t ↦ [E^(t)]`. It is unweighted: each squareclass is counted once, whatever the multiplicity of the twist map ([isomorphism multiplicity of the twist family](#isomorphism-multiplicity-of-the-twist-family)). Proportions of twists 'ordered by `H(t)`' (Burungale–Tian Proposition 1.3 and Theorem 3.5; BKLOS Theorems 2.1–2.7) are relative densities in this family, and its subfamilies defined by local conditions on `F_v×/F_v×²` are instances of [family defined by local conditions](#family-defined-by-local-conditions). Proposed declarations: `twistModel`, `twistClass`, `twistFamily`.

F has characteristic 0, so the short model exists and the twist is elliptic exactly when E is `(Δ(E^(u)) = u⁶Δ(E))`. The trivial class is included. The family counts squareclasses. Distinct squareclasses yield isomorphic twists exactly when `j = 1728` and `−1` is nonsquare in F; in that case the two classes t and `−t` have the same image. For `F = ℚ` the family is ordered by |n| for squarefree n of both signs; Burungale–Tian's congruent-number family is its positive part ([positive squarefree family over q](#positive-squarefree-family-over-q)).

- `twistModel`: `E^(u)` : `y² = x³ + u²A x + u³B`.

- `twistClass`: `t ↦ [E^(t)] ∈ F`-isomorphism classes.

- `twistFamily`: The family `(F×/F×², H)` of twists.

- `twistModel_one`: `E¹ = E`.

- `twistClass_zero`: The trivial class gives [E].

- `exists_smul_twistModel_mul_sq`: `E^(us²) ≅ E^(u)` by the change of variables `u_C = s`.

- `twistModel_Δ`: `Δ(E^(u)) = u⁶Δ(E)`.

- `twistModel_j`: `j(E^(u)) = j(E)`.

- `exists_smul_twistModel_eq_quadraticTwistOf`: `E^(u) ≅ (16u²A, 64u³B)`, the value of Tau Ceti's quadraticTwistOf `0 (−u)` on shortCurve A B.

- `twistModel_rat_congruent`: Over `ℚ`, the twist of `y² = x³ − x` by n is `y² = x³ − n²x`.

For the proof, twistModel is the short curve with coefficients `u²A`, `u³B`; `exists_smul_twistModel_mul_sq`: the change of variables with `u_C = s` sends `(u²s⁴A, u³s⁶B)` to `(u²A, u³B)` (mathlib:`WeierstrassCurve.variableChange_a₄`, `variableChange_a₆`). twistClass is the lift of `u ↦` [twistModel u] to `F×/F×²`, well defined by the previous step. `twistModel_Δ`: mathlib:WeierstrassCurve.`Δ_of_isShortNF` gives `−16(4u⁶A³ + 27u⁶B²)`; `twistModel_j`: `j = 6912·a₄³/(4a₄³ + 27a₆²)` is unchanged by `(A, B) ↦ (u²A, u³B)`. Compatibility with Tau Ceti's twist: tauceti:WeierstrassCurve.quadraticTwistOf with `(t, n) = (0, −u)` gives `(16u²A, 64u³B)`; the change of variables with `u_C = 2` returns `(u²A, u³B)`; tauceti:`WeierstrassCurve.exists_smul_quadraticTwistOf_eq` (generator change `a = s`, `b = 0`) and tauceti:`WeierstrassCurve.exists_smul_eq_quadraticTwistOf_add_mul` (the split case `u = 1`) give the same well-definedness on Tau Ceti's side; tauceti:`WeierstrassCurve.exists_smul_quadraticTwist_eq` with `θ = √u (trace 0, norm −u)` relates Tau Ceti's quadraticTwist `E F(√u)` to `E^(u)` for `u ∉ F×²`. twistFamily is the family of [finiteness of squareclasses of bounded height](#finiteness-of-squareclasses-of-bounded-height).

*Needs:* [arithmetic family](#arithmetic-family), [squareclass height](#squareclass-height), [finiteness of squareclasses of bounded height](#finiteness-of-squareclasses-of-bounded-height), `WeierstrassCurve.shortCurve` (Tau Ceti), `WeierstrassCurve.quadraticTwistOf` (Tau Ceti), `WeierstrassCurve.exists_smul_quadraticTwistOf_eq` (Tau Ceti), `WeierstrassCurve.exists_smul_eq_quadraticTwistOf_add_mul` (Tau Ceti), `WeierstrassCurve.quadraticTwist` (Tau Ceti), `WeierstrassCurve.exists_smul_quadraticTwist_eq` (Tau Ceti), `WeierstrassCurve.VariableChange` (Mathlib), `WeierstrassCurve.variableChange_a₄` (Mathlib), `WeierstrassCurve.variableChange_a₆` (Mathlib), `WeierstrassCurve.variableChange_j` (Mathlib), `WeierstrassCurve.Δ_of_isShortNF` (Mathlib), `WeierstrassCurve.exists_variableChange_isShortNF` (Mathlib), `MulAction.orbitRel.Quotient` (Mathlib).

([[3]](#ref-3), §1, printed p. 1; [[2]](#ref-2), §1.0.2, printed p. 2; [[2]](#ref-2), Proposition 1.3, printed p. 2.)

**Checks.**

- The trivial squareclass has height 1.

- Over `ℚ`, the twist of `y² = x³ − x` by 5 is `y² = x³ − 25x`.

- Over `ℚ`, the twist by 4 is isomorphic to E (a square class is trivial).

- Over `ℚ`, the twist of `y² = x³ − x` by 5 is `y² = x³ − 25x`, Burungale–Tian's `E⁵` : `5y² = x³ − x`.

- Over `ℚ` the classes of height `≤ X` are the squareclasses of squarefree n with `|n| ≤ X`.

<a id="isomorphism-multiplicity-of-the-twist-family"></a>

**Isomorphism multiplicity of the twist family.** Let F be a number field and E : `y² = x³ + Ax + B` with `4A³ + 27B² ≠ 0`. (a) If `B ≠ 0` (so `j(E) ≠ 1728`; `j = 0` included), the twist map `t ↦ [E^(t)]` on `F×/F×²` is injective: `E^(u) ≅_F E^(u′) iff u′/u ∈ F×²`. (b) If `B = 0 (j = 1728)`, `E^(−u)` and `E^(u)` are the same model `y² = x³ + u²A x`, and `E^(u) ≅_F E^(u′) iff u′/u ∈ ±F×²`; so when `−1 ∉ F×²` every fibre of the twist map is `{t, t + [−1]}`, of size 2, and the unweighted squareclass count counts each isomorphism class of twists twice (`count_comap` of [arithmetic family](#arithmetic-family)). In particular for `y² = x³ − x` over `ℚ`, `E^(n) = E^(−n)`, which is why Burungale–Tian index their family by positive squarefree n. Proposed declaration: `twistClass_injective_or_neg`.

Characteristic 0 (a number field): short models and the shape of changes of variables between them use 2, 3 invertible.

For the proof, A change of variables between two short models over F has `s = r = t = 0`: `a₁′ = u_C⁻¹·2s`, then `a₂′ = u_C⁻²·3r` and `a₃′ = u_C⁻³·2t` must vanish (mathlib:`WeierstrassCurve.variableChange_a₁`, `variableChange_a₂`, `variableChange_a₃`); then `(a₄′, a₆′) = (u_C⁻⁴a₄, u_C⁻⁶a₆)` (`variableChange_a₄`, `variableChange_a₆`). So `E^(u) ≅ E^(u′) iff` there is `w ∈ F×` with `u′²A = w⁴u²A` and `u′³B = w⁶u³B`. Let `q = u′/u`. If A, `B ≠ 0`: `q² = w⁴` and `q³ = w⁶` give `q = q³/q² = w² ∈ F×²`. If `A = 0` (then `B ≠ 0`): `q³ = w⁶` gives `q = ζw²` with `ζ³ = 1`, and `ζ = (ζ²)²` is a square. If `B = 0` (then `A ≠ 0`): `q² = w⁴` gives `q = ±w²`. Conversely `q = w²` (and, when `B = 0`, `q = −w²`) gives the isomorphism with `u_C = w⁻¹`. Cross-check (not needed for the proof): Tau Ceti's tauceti:`WeierstrassCurve.not_exists_smul_quadraticTwist_eq` says that for `j ∉ {0, 1728}` a twist by a nontrivial quadratic extension is not F-isomorphic to E.

*Needs:* [quadratic twist squareclass family](#quadratic-twist-squareclass-family), [arithmetic family](#arithmetic-family), `WeierstrassCurve.variableChange_a₁` (Mathlib), `WeierstrassCurve.variableChange_a₂` (Mathlib), `WeierstrassCurve.variableChange_a₃` (Mathlib), `WeierstrassCurve.variableChange_a₄` (Mathlib), `WeierstrassCurve.variableChange_a₆` (Mathlib), `WeierstrassCurve.not_exists_smul_quadraticTwist_eq` (Tau Ceti).

([[2]](#ref-2), Abstract, printed p. 1.)

**Checks.**

- `y² = x³ − x` over `ℚ`: `E^(n) = E^(−n) = y² = x³ − n²x`; over `ℚ(i)` (`−1` a square) the twist map is injective.

- `y² = x³ + 1 (j = 0)` over `ℚ`: `E^(u) ≅ E^(u′)` only for `u′/u ∈ ℚ×²`, although `Aut(E over ℚ̄)` has order 6.

- For `E/ℚ:y²=x³+x+1`, the twists by 2 and −2 are not Q-isomorphic: their ratio −1 is not a square and `B≠0`.

### 0.6 Squarefree integer denominators

<a id="positive-squarefree-family-over-q"></a>

**Positive squarefree family over q.** Over `ℚ`, squareclasses correspond to squarefree integers `n ↦ [n]`, with `H([n]) = |n|` ([squareclass height](#squareclass-height)). Burungale–Tian's families are P, the positive squarefree integers ordered by n — the squareclasses of `ℚ` positive at the real place (local condition `Σ_∞ = {+1} ⊂ ℝ×/ℝ×²`) — and `S ⊆ P`, the positive squarefree `n ≡ 1`, 2, 3 (mod 8): the squareclasses with `Σ_∞ = {+1}` and `Σ₂ = {[1], [3], [2], [10]} ⊂ ℚ₂×/ℚ₂×²` (for squarefree n the class of n in `ℚ₂×/ℚ₂×²` determines n mod 8 when n is odd and `n/2 mod 8` when n is even, and `n ≡ 2 (mod 8) iff n/2 ≡ 1` or 5 (mod 8)). Both are ordered by n with the cutoff `n ≤ X` (Burungale–Tian's `S(X) = {0 < n ≤ X}`), realised as subsets of `ℕ` in the family natFamily `= (ℕ, n)`; 'density one in this family' is HasDensity A S 1 ([relative density](#relative-density)). No positive squarefree n is `≡ 0` or 4 (mod 8). S is the family of positive squarefree n for which the twist `E^(n)` of `y² = x³ − x` has root number `+1` (Burungale–Tian footnote 2, from Birch–Stephens; the cited Birch–Stephens root-number computation gives this sign). Proposed declarations: `SquarefreeFamily.natFamily`, `posSquarefree`, `evenParityClasses`.

Positive n only: the class `[−n]` gives the same curve ([isomorphism multiplicity of the twist family](#isomorphism-multiplicity-of-the-twist-family)) and is excluded, not identified. The ordering is by n, not by the fundamental discriminant (n or `4n`); the comparison is [piecewise rescaling of a height](#piecewise-rescaling-of-a-height).

- `SquarefreeFamily.natFamily`: `ℕ` ordered by n.

- `SquarefreeFamily.posSquarefree`: `P = {n > 0 squarefree}`.

- `SquarefreeFamily.evenParityClasses`: `S = {n ∈ P : n ≡ 1, 2, 3 (mod 8)}`.

- `S ⊆ P`.

- `n ∈ P ⇒ n` ≢ 0, 4 (mod 8).

- P is infinite.

- For `n ∈ P` the squareclass height of [n] is n.

For the proof, natFamily is ofNat id; posSquarefree and evenParityClasses are subsets of `ℕ`. The subset inclusion is immediate, and 4 | n contradicts squarefreeness. Infinitude follows because primes are squarefree. The positive squarefree height comparison follows from [squareclass height](#squareclass-height) `(squareclassHeight_rat)`. The local description at 2: `ℚ₂×/ℚ₂×²` is represented by `±1`, `±3`, `±2`, `±6` (unit classes mod 8 times {1, 2}); for n odd, `[n] = [n mod 8]`; for `n = 2m`, `[n] = [2]·[m mod 8]`.

*Needs:* [arithmetic family](#arithmetic-family), [family defined by local conditions](#family-defined-by-local-conditions), [squareclass height](#squareclass-height), `Squarefree` (Mathlib).

([[2]](#ref-2), Theorem 3.3, printed p. 6; [[2]](#ref-2), Footnote 2, printed p. 2.)

**Checks.**

- 1, 2, `11 ∈ S` and 5, `9 ∉ S`.

- S has 7 members up to 20.

- Only `n = 1` has height `≤ 1` in P: the class `[−1]`, also of height 1, is not in the positive family.

- The members up to 20 are 1, 2, 3, 10, 11, 17, 19 (7 of the 13 positive squarefree `n ≤ 20`).

<a id="squarefree-indicator-as-a-moebius-sum"></a>

**Squarefree indicator as a moebius sum.** For every integer `n ≥ 1`, `Σ_{d ≥ 1, d² | n} μ(d) = 1` if n is squarefree and 0 otherwise.

`n ≥ 1`.

For the proof, Write `n = b²m` with m squarefree (mathlib:`exists_sq_mul_squarefree`). `d² | n iff d | b`: if `p^(2k) | b²m` with m squarefree then `p^k | b` (compare p-adic valuations, `v_p(m) ≤ 1`). `Σ_{d | b} μ(d) = [b = 1]` (mathlib:`ArithmeticFunction.moebius_mul_coe_zeta`), and `b = 1 iff n` is squarefree.

*Needs:* `ArithmeticFunction.moebius` (Mathlib), `ArithmeticFunction.moebius_mul_coe_zeta` (Mathlib), `exists_sq_mul_squarefree` (Mathlib), `Squarefree` (Mathlib).

([[4]](#ref-4), §1, (1.1), printed p. 1 (arXiv v2).)

**Checks.**

- `n = 12 = 2²·3`: the divisors d with `d² | 12` are 1, 2 and `μ(1) + μ(2) = 0`.

- At `n=1`, only `d=1` contributes and the sum is 1.

- At `n=36`, the terms for `d=1,2,3,6` sum to `1−1−1+1=0`.

<a id="squarefree-integers-in-residue-classes"></a>

**Squarefree integers in residue classes.** For integers `q ≥ 1` and a with `gcd(a, q) = 1` there is `C_q` such that for all `X ≥ 1`: `|#{1 ≤ n ≤ X : n squarefree, n ≡ a (mod q)} − (6/π²)·q⁻¹·∏_{p | q}(1 − p⁻²)⁻¹·X| ≤ C_q·√X`. Proposed declaration: `SquarefreeFamily.squarefree_residue_count`.

`SquarefreeFamily.squarefree_residue_count` in `Suggested.lean` states the error bound directly as a count of natural numbers. The modulus q is fixed (the constant depends on q; Hooley's bound `O((X/q)^(1/2) + q^(1/2+ε))` is uniform but not needed here). `gcd(a, q) = 1`; non-coprime classes reduce to coprime ones by factoring out the common part (for `q = 8`, `a = 2`: `n = 2m` with `m ≡ 1 (mod 4)`).

For the proof, By [squarefree indicator as a moebius sum](#squarefree-indicator-as-a-moebius-sum) the count is `Σ_{d ≤ √X} μ(d)·#{n ≤ X : d² | n, n ≡ a (mod q)}`. If `gcd(d, q) > 1` the inner set is empty (`d² | n` and `gcd(n, q) = 1` force `gcd(d, q) = 1`); otherwise it is one residue class modulo qd² and has `X/(qd²) + θ` elements with `|θ| ≤ 1`. Hence the count is `(X/q)·Σ_{d ≤ √X, (d,q)=1} μ(d)d⁻² + O(√X)`, and the tail `Σ_{d > √X} d⁻² ≤ 2/√X` costs another `O(√X)`. `Σ_{d ≥ 1, (d,q)=1} μ(d)d⁻² = L(χ₀μ, 2) = 1/L(χ₀, 2)` for the trivial Dirichlet character `χ₀ mod q` (mathlib:`DirichletCharacter.LSeries.mul_mu_eq_one` and mathlib:`DirichletCharacter.LFunction_eq_LSeries` at `s = 2`), and `L(χ₀, 2) = ∏_{p|q}(1 − p⁻²)·ζ(2)` (mathlib:`DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta`) with `ζ(2) = π²/6` (mathlib:`riemannZeta_two`).

*Needs:* [squarefree indicator as a moebius sum](#squarefree-indicator-as-a-moebius-sum), [positive squarefree family over q](#positive-squarefree-family-over-q), [arithmetic family](#arithmetic-family), `DirichletCharacter.LSeries.mul_mu_eq_one` (Mathlib), `DirichletCharacter.LFunction_eq_LSeries` (Mathlib), `DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta` (Mathlib), `riemannZeta_two` (Mathlib).

([[4]](#ref-4), §1, (1.1), printed p. 1 (arXiv v2); [[4]](#ref-4), §1, (1.3), printed p. 1.)

**Checks.**

- `q = 8`: each odd class has main term `(6/π²)(1/8)(4/3)X = X/π²`.

- `q = 1`: `6X/π² + O(√X)`.

- Numerically to `2·10⁶` the classes 1, 2, 3, 5, 6, 7 (mod 8) each contain `(1.000 ± 0.001)·X/π²` squarefree integers.

<a id="even-parity-classes-have-half-density"></a>

**Even parity classes have half density.** Among the positive squarefree integers ordered by n, Burungale–Tian's family S of `n ≡ 1`, 2, 3 (mod 8) has relative density `1/2`: `#{n ≤ X : n ∈ S}/#{n ≤ X : n ∈ P} → 1/2`.

The six squarefree classes modulo 8 (1, 2, 3, 5, 6, 7) have equal density `1/6`; the eight residue classes do not (0 and 4 contain no squarefree integer).

For the proof, Classes 1 and 3 (mod 8): [squarefree integers in residue classes](#squarefree-integers-in-residue-classes) with `q = 8` gives `X/π² + O(√X)` each. Class 2 (mod 8): `n = 2m` with m squarefree and `m ≡ 1 (mod 4)`; the count is `#{m ≤ X/2 : m squarefree, m ≡ 1 (mod 4)} = (6/π²)(1/4)(4/3)(X/2) + O(√X) = X/π² + O(√X) (q = 4)`. So `#S(X) = 3X/π² + O(√X)`, while `#P(X) = 6X/π² + O(√X) (q = 1)`; the ratio tends to `1/2` ([relative density](#relative-density)).

*Needs:* [squarefree integers in residue classes](#squarefree-integers-in-residue-classes), [positive squarefree family over q](#positive-squarefree-family-over-q), [relative density](#relative-density).

([[2]](#ref-2), Abstract and Theorem 1.2, printed pp. 1–2.)

**Checks.**

- Up to 20: 7 members of S among 13 positive squarefree integers; to `2·10⁶` the proportion is 0.49999.

- Counting all eight residue classes with equal weight would give `3/8`, the wrong answer.

- The complementary squarefree residues 5, 6 and 7 modulo eight also have combined relative density `1/2`.

<a id="density-one-in-the-even-parity-classes-is-half-of-all-squarefree"></a>

**Density one in the even parity classes is half of all squarefree.** If `A ⊆ S` has relative density one in S (positive squarefree `n ≡ 1`, 2, 3 (mod 8), ordered by n), then A has relative density `1/2` in the positive squarefree integers P.

`A ⊆ S`; the conclusion is an exact limit `1/2`, not a lower bound.

For the proof, [relative density is multiplicative in towers](#relative-density-is-multiplicative-in-towers) with `S ⊆ P`, `α = 1` and `β = 1/2` ([even parity classes have half density](#even-parity-classes-have-half-density)).

*Needs:* [even parity classes have half density](#even-parity-classes-have-half-density), [relative density is multiplicative in towers](#relative-density-is-multiplicative-in-towers).

([[2]](#ref-2), Abstract, printed p. 1.)

**Checks.**

- This is the passage from Burungale–Tian's Theorem 1.2 (density one in S) to the '50% of the positive square-free integers' of their abstract, for the set of n with analytic rank zero; the complementary analytic-rank statement uses root number `−1` on `P ∖ S`.

- Taking `A=S` gives relative density `1/2` in P.

- Taking `A=S∖{1}` leaves density one in S and density `1/2` in P; deleting one curve parameter does not change the limit.

### 0.7 Discriminant-ordered fields

<a id="number-fields-ordered-by-discriminant"></a>

**Number fields ordered by discriminant.** Fix a field A of characteristic 0 (an algebraic closure of `ℚ` for counting). The embedded number fields are the intermediate fields `ℚ ⊆ K ⊆ A` that are finite-dimensional over `ℚ`; ordered by `|Disc(K)|` they form an arithmetic family (embeddedFamily), Northcott by Hermite's theorem (Mathlib's `NumberField.finite_of_discr_bdd`; Tau Ceti's explicit bound `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`). `ℚ`-isomorphism is an equivalence relation on embedded fields (isoSetoid); its classes ordered by |Disc| form the family of number fields up to isomorphism (isoFamily; Northcott because each class of bounded discriminant has a representative among the finitely many embedded fields of bounded discriminant). A class carries its degree `n = [K : ℚ]` (isoDegree) and its automorphism weight `w(K) := n/#Aut(K/ℚ)` (autWeight). This is the convention of Bhargava–Shankar–Tsimerman's Theorems 1 and 3 ('cubic fields K, up to isomorphism') and of discriminant-ordered Davenport–Heilbronn counts. Proposed declarations: `NumberFieldFamily.embeddedFamily`, `isoFamily`, `autWeight`.

The counted objects are isomorphism classes; embedded subfields of `ℚ̄` are counted with multiplicity `n/#Aut(K)` ([embedded and isomorphism class counts of number fields](#embedded-and-isomorphism-class-counts-of-number-fields)). The discriminant is Mathlib's NumberField.discr of the ring of integers, an isomorphism invariant. Restricting further by the Galois group of the normal closure (as in `N_n(G, X)`) is not part of this node.

- `NumberFieldFamily.Embedded`: Finite-dimensional intermediate fields `ℚ ⊆ K ⊆ A`.

- `NumberFieldFamily.embeddedFamily`: Embedded number fields ordered by |Disc|.

- `NumberFieldFamily.isoSetoid`: `ℚ`-isomorphism of embedded fields.

- `NumberFieldFamily.isoFamily`: Number fields up to isomorphism ordered by |Disc|.

- `NumberFieldFamily.degree`: The degree-n subfamily of embedded fields.

- `NumberFieldFamily.isoDegree`: The degree of an isomorphism class.

- `NumberFieldFamily.autWeight`: `w(K) = [K : ℚ]/#Aut(K/ℚ)`.

For the proof, embeddedFamily: height `K ↦ |`discr K|, northcott from mathlib:`NumberField.finite_of_discr_bdd` (monotone in the bound). isoSetoid: AlgEquiv is reflexive, symmetric and transitive; isoFamily's height is well defined since isomorphic fields have equal discriminants. isoFamily is Northcott: every class of height `≤ X` contains an embedded field of height `≤ X`, and there are finitely many of those. autWeight and isoDegree are well defined: isomorphic fields have the same degree and isomorphic automorphism groups.

*Needs:* [arithmetic family](#arithmetic-family), `IntermediateField` (Mathlib), `NumberField.discr` (Mathlib), `NumberField.finite_of_discr_bdd` (Mathlib), `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` (Tau Ceti).

([[5]](#ref-5), Theorem 1 (Davenport–Heilbronn), printed p. 1 (arXiv v3); [[1]](#ref-1), §1.2, printed p. 3.)

**Checks.**

- The bottom field `ℚ` has height 1.

- A Galois field of degree `n ≥ 1` has automorphism weight 1.

- A cubic field with trivial automorphism group has weight 3, not 1: counting embedded cubic fields is not counting isomorphism classes.

- Bhargava–Shankar–Tsimerman Theorem 1: `N₃(0, X)` counts totally real cubic fields up to isomorphism with `0 < Disc < X`.

<a id="embedded-and-isomorphism-class-counts-of-number-fields"></a>

**Embedded and isomorphism class counts of number fields.** Let A be algebraically closed of characteristic 0. For every n and X: `#{embedded K ⊆ A : [K : ℚ] = n, |Disc(K)| ≤ X} = Σ_{[K] : [K : ℚ] = n, |Disc(K)| ≤ X} n/#Aut(K/ℚ)`. Equivalently, each isomorphism class of degree n has exactly `n/#Aut(K)` embedded representatives. Proposed declaration: `NumberFieldFamily.count_degree_eq_weightedCount`.

A algebraically closed (so every degree-n field has exactly n embeddings into A).

For the proof, The `ℚ`-embeddings `K → A` number n (mathlib:AlgHom.card). `Aut(K/ℚ)` acts freely on `Hom(K, A)` by precomposition, and two embeddings have the same image iff they differ by an automorphism; so the embedded copies of K, the images, number `n/#Aut(K)`. Sum over the classes of bounded discriminant (the discriminant is an isomorphism invariant) using `count_comap` of [arithmetic family](#arithmetic-family) for the map from embedded fields to classes.

*Needs:* [number fields ordered by discriminant](#number-fields-ordered-by-discriminant), [arithmetic family](#arithmetic-family), `AlgHom.card` (Mathlib).

([[5]](#ref-5), Theorem 3, printed p. 2 (arXiv v3).)

**Checks.**

- A non-Galois cubic field has three embedded copies in `ℚ̄`, a cyclic cubic field one: counting subfields of `ℚ̄` weights `S₃`-cubic fields by 3.

- Degree 2: every quadratic field is Galois, so embedded and isomorphism-class counts agree.

- In degree one and cutoff `X=1`, both counts are 1, contributed by Q with weight 1.

### 0.8 Cubic statistical adapters

Use the [cubic supplier conventions](#cubic-supplier-conventions) and AnalyticNumberTheoryPartII §§5.4–5.5 on their full commutative-ring and projective-module carriers. `CubicRing` in the contract denotes the supplied algebra, with its stated free-coordinate adapter. No new form or algebra carrier is requested here. The additional statistical predicate is `CubicRing.IsMaximalAt`: for an integral free finite-rank algebra A, every Z-finite overring inside `A[1/p]` containing A equals A. Define `CubicRing.IsMaximal` by requiring this at every prime; prove `isMaximal_iff_forall_isMaximalAt` and `isMaximal_ringOfIntegers`. The coefficient adapter transports evaluation and base change, the simultaneously negated normal basis, and content maps `R(nf)→R(f)` with image `R+nR(f)`; the contract states their exact hypotheses and Checks. ([[6]](#ref-6), §2, (9)–(12), pp.4–5, and proof of Lemma 13, p.7; [[7]](#ref-7), §3, pp.3–4.)

**Checks.**

- `Z³` is maximal at every prime: an integral element of `Q³` has all three coordinates integral.
- `Z[x]/(x³)` is not maximal at 2: adjoining `x²/2` gives a strictly larger Z-finite overring.
- The content map for `n=0` over a nonzero ring is not injective; n a nonzerodivisor gives the stated isomorphism onto its image.

*Needs:* AnalyticNumberTheoryPartII §§5.4–5.5; Mathlib `Algebra.discr`, `Localization.Away` and `NumberField.RingOfIntegers`.

### 0.9 Squarefree polynomials over finite fields

<a id="count-of-squarefree-monic-polynomials-over-a-finite-field"></a>

**Count of squarefree monic polynomials over a finite field.** For a finite field `𝔽_q` the number `s_n` of squarefree monic polynomials of degree n over `𝔽_q` is `s₀ = 1`, `s₁ = q` and `s_n = q^n − q^{n−1}` for `n ≥ 2`.

Squarefree means Mathlib's Squarefree in the monoid `𝔽_q[X]` (no square of a nonunit divides it). `monicSquarefreePolysOfDegree` is the monic squarefree degree-n slice; `card_monicSquarefreePolysOfDegree` in `Suggested.lean` states its finiteness and the formula for `n≥2`. The degree-zero and degree-one counts are 1 and q.

For the proof, Every monic g has a unique factorisation `g = e²·d` with e monic and d monic squarefree (existence: mathlib:`exists_sq_mul_squarefree`, normalised to monic factors; uniqueness from unique factorisation). Counting monic polynomials of degree n by the degree k of e gives `q^n = Σ_{0 ≤ k ≤ n/2} q^k s_{n−2k}`. The generating functions satisfy `(1 − qt)⁻¹ = (1 − qt²)⁻¹ S(t)`, so `S(t) = (1 − qt²)/(1 − qt)`, whose coefficients are 1, q, `q^n − q^{n−1}`.

*Needs:* `exists_sq_mul_squarefree` (Mathlib), `Squarefree` (Mathlib).

([[37]](#ref-37), §8.7, printed pp.776–777, the squarefree-monic count preceding (8.7.5); degrees zero and one follow directly from the definition.)

**Checks.**

- `q = 2`, `n = 2`: the squarefree monic quadratics over `𝔽₂` are `x² + x` and `x² + x + 1`, so `s₂ = 2 = 4 − 2`.

- `q = 3`, `n = 3`: `s₃ = 27 − 9 = 18`.

- At `q=2`, the unique monic degree-zero polynomial is 1 and both monic linear polynomials are squarefree, giving `s₀=1` and `s₁=2`.

### 0.10 Hypersurface local-density moments

<a id="coefficient-vector-form"></a>

**Coefficient vector form.** Fix integers `n ≥ 0` and `d ≥ 0` and let `M_{d,n}` be the set of exponent vectors `m = (m₀, …, m_n) ∈ ℕ^{n+1}` with `m₀ + ⋯ + m_n = d`, so that `N_{d,n} := #M_{d,n} = binom(n+d, d)`. For a commutative ring R and a coefficient vector `a = (a_m) ∈ R^{M_{d,n}}`, the form with coefficient vector a is `f_a = Σ_{m ∈ M_{d,n}} a_m X₀^{m₀}⋯X_n^{m_n} ∈ R[X₀, …, X_n]`, homogeneous of degree d. The Veronese vector of `x ∈ R^{n+1}` is `ν_{d,n}(x) = (x^m)_{m ∈ M_{d,n}} ∈ R^{M_{d,n}}`, with unweighted monomials (no multinomial or square-root weights), so that `f_a(x) = ⟨a, ν_{d,n}(x)⟩ = Σ_m a_m x^m`. For u, `w ∈ R^I` the `2×2` minors are `u_i w_j − u_j w_i (i, j ∈ I)`; over `ℤ` define `G(u,w):=FormDensity.minorGCD u w` as their nonnegative gcd, with value 0 when all minors vanish. For independent pairs this is the positive `k = 2` invariant of BLS Definition 3.7. GeometryOfNumbersAndQuadraticArithmetic §3.2 supplies the general maximal-minor ideal; identifying its positive integer generator with the saturation index is the two-column adapter here. The source orders monomials lexicographically; indexing by exponent vectors makes that order immaterial.

R a commutative ring n, `d ≥ 0` integers

- `FormDensity.Monomials`: `M_{d,n}`: the finite set of exponent vectors of degree-d monomials in `n+1` variables.

- `FormDensity.form`: `f_a = Σ_m a_m X^m for a coefficient vector a ∈ R^{M_{d,n}}`.

- `FormDensity.veronese`: `ν_{d,n}(x) = (x^m)_m, unweighted`.

- `FormDensity.minors`: The `2×2` minors `u_i w_j − u_j w_i` of a pair of vectors.

- `FormDensity.eval_form`: `f_a(x) = Σ_m a_m ν_{d,n}(x)_m`.

- `FormDensity.form_isHomogeneous`: `f_a is homogeneous of degree d`.

- `FormDensity.coeff_form`: The coefficient of `X^m` in `f_a` is `a_m`; hence `a ↦ f_a` is injective.

- `FormDensity.form_add`: `f_{a+b} = f_a + f_b`.

- `FormDensity.form_smul`: `f_{c·a} = c·f_a`.

- `FormDensity.map_form`: For a ring homomorphism `φ`: `R → S`, `φ(f_a) = f_{φ∘a}` (reduction modulo Q).

- `FormDensity.veronese_smul`: `ν_{d,n}(c·x) = c^d·ν_{d,n}(x)`.

- `FormDensity.card_monomials`: `#M_{d,n} = binom(n+d, d)`.

For the proof, Define `M_{d,n}` as the finite set of finitely supported functions `{0, …, n} → ℕ` with total d (Mathlib Finset.finsuppAntidiag over the full index set). Define `f_a` as the finite sum of the monomials `X^m` with coefficients `a_m`; it is homogeneous of degree d since every exponent vector has total d (Mathlib MvPolynomial.IsHomogeneous). Define `ν_{d,n}(x)_m = ∏_i x_i^{m_i}`; evaluating the monomials gives `f_a(x) = Σ_m a_m ν_{d,n}(x)_m` (Mathlib MvPolynomial.eval). Distinct exponent vectors give distinct monomials, so the coefficient of `X^m` in `f_a` is `a_m` and `a ↦ f_a` is an isomorphism onto the degree-d forms; `#M_{d,n} = binom(n+d, d)` by stars and bars. The two-column minors are the coordinate expressions `u_i w_j − u_j w_i`. For a finite coordinate set I, let L be the Z-span of u,w in `Z^I` and let `L_sat=(span_Q(u,w))∩Z^I`. Prove `FormDensity.minorGCD_eq_index`: for Q-linearly independent u,w, the finite group `L_sat/L` has cardinality `minorGCD u w`. Use Mathlib’s `Submodule.exists_smith_normal_form_of_le` and the supplier’s primitive adapted bases; the two Smith factors multiply both to this index and to the gcd of the maximal minors. Prove `minorGCD_basisChange`, invariance under `GL₂(Z)` on the pair and `GL_I(Z)` on coordinates, and `minorGCD_eq_zero_iff`, vanishing exactly for dependent pairs. No positivity or finite-index claim is assigned to a dependent pair.

*Needs:* `Finset.finsuppAntidiag` (Mathlib), `MvPolynomial.IsHomogeneous` (Mathlib), `MvPolynomial.eval` (Mathlib), `Submodule.exists_smith_normal_form_of_le` (Mathlib), GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3, 3.2.

([[46]](#ref-46), arXiv v1, §1, p.1; [[46]](#ref-46), arXiv v1, §5.2, p.55; [[46]](#ref-46), arXiv v1, Lemma 3.11, p.12.)

**Checks.**

- For `n = d = 1` the coefficient vector `(1, 0)` gives `f = X₀`.

- The zero coefficient vector gives the zero form.

- `#M_{2,1} = 3`: three monomials `X₀²`, `X_0X₁`, `X₁²`.

- The all-ones vector in degree 2 and two variables gives `X₀² + X_0X₁ + X₁²`, not `(X₀ + X₁)²`: no multinomial weights.

- `f_{c·a} = c·f_a`, and `ν_{d,n}(c·x) = c^d ν_{d,n}(x)`.

- Reduction modulo Q commutes with `a ↦ f_a` (a ring homomorphism `R → S` maps `f_a` to `f_{φ∘a}`).

- For `u=(1,0)`, `w=(0,1)`, `minorGCD=1` and L is saturated.

- For `u=(2,0)`, `w=(0,3)`, `minorGCD=6` and `L_sat/L` has six elements; a constant-one gcd fails.

- For `u=(1,2)`, `w=(2,4)`, `minorGCD=0` and the pair is dependent; no positive-index formula applies.

<a id="local-density-of-a-form-modulo-q"></a>

**Local density of a form modulo q.** For integers `Q ≥ 1`, n, `d ≥ 0` and a coefficient vector `a ∈ (ℤ/Qℤ)^{M_{d,n}}` (or `a ∈ ℤ^{M_{d,n}}` reduced modulo Q), `σ(a; Q) = Q^{−n} · #{b ∈ R_{n+1}(Q) : f_a(b) ≡ 0 mod Q}`, where `R_{n+1}(Q) = {b ∈ (ℤ/Qℤ)^{n+1} : gcd(Q, b₀, …, b_n) = 1}` is the set of primitive residue vectors defined by this node. Equivalently `σ(a; Q) = Q^{−n} #{b ∈ R_{n+1}(Q) : a ∈ Λ^{(Q)}_{ν_{d,n}(b)}}`. It depends only on a mod Q, is multiplicative in Q over coprime factors `(σ(a; Q) = ∏_{p^r ∥ Q} σ(a; p^r))`, is positive exactly when `f_a` has a primitive zero modulo Q, and is a normalized count, not a probability: it can exceed 1.

`Q ≥ 1` a a coefficient vector of degree d in `n+1` variables, modulo Q

- `FormDensity.localDensity`: `σ(a; Q) for a ∈ (ℤ/Qℤ)^{M_{d,n}}`.

- `FormDensity.localDensity_nonneg`: `σ(a; Q) ≥ 0`.

- `FormDensity.localDensity_le`: `σ(a; Q) ≤ Q (at most Q^{n+1} zeros)`.

- `FormDensity.localDensity_mul`: (5.11): `σ(a; Q_1Q₂) = σ(a; Q₁)σ(a; Q₂)` for coprime `Q₁`, `Q₂` and integral a.

- `FormDensity.localDensity_pos_iff`: `σ(a; Q) > 0 iff f_a has a primitive zero modulo Q (for Q = p^r: iff a ∈ F^loc(p^r))`.

- `FormDensity.localDensity_smul_unit`: `σ(u·a; Q) = σ(a; Q) for a unit u, so σ is a function of the hypersurface modulo Q`.

- `FormDensity.primitiveVectors`: For `Q≥1`, the finite set `R_m(Q)` of vectors whose coordinates with Q generate the unit ideal.

- `FormDensity.mem_primitiveVectors`: Membership is `gcd(Q,b₁,…,b_m)=1`; for `Q=p^r` with `r≥1` it means at least one coordinate is a unit modulo p.

- `FormDensity.primitiveVectors_crt`: For coprime positive Q1,Q2, Chinese remainders identify `R_m(Q1Q2)` with `R_m(Q1)×R_m(Q2)`.

- `FormDensity.card_primitiveVectors_primePow`: For prime p, `r≥1` and `m≥0`, `#R_m(p^r)=p^(rm)−p^((r−1)m)`; when `m=0` both sides are 0. For `Q=1`, `R_m(1)` is a singleton, including `m=0`.

For the proof, Define `σ(a; Q)` as `Q^{−n}` times the number of primitive residue vectors `b ∈ R_{n+1}(Q)` with `f_a(b) = 0` in `ℤ/Qℤ`. The reformulation through `Λ^{(Q)}_{ν(b)}` is `f_a(b) = ⟨a, ν_{d,n}(b)⟩` (coefficient-vector-form). Multiplicativity (5.11): the Chinese remainder theorem identifies `(ℤ/Q_1Q₂)^{n+1}` with `(ℤ/Q₁)^{n+1} × (ℤ/Q₂)^{n+1}`, primitive vectors with pairs of primitive vectors and zeros with pairs of zeros. For `p^r`, the nonprimitive vectors are precisely the m-tuples divisible by p: there are `p^((r−1)m)` of them inside `p^(rm)` vectors. The CRT equivalence preserves the generated unit ideal. Modulus 1 is handled separately.

*Needs:* [coefficient vector form](#coefficient-vector-form).

([[46]](#ref-46), arXiv v1, §5.1, (5.2)–(5.3), p.50; [[46]](#ref-46), arXiv v1, §5.2, (5.11), p.53.)

**Checks.**

- `σ(a; 1) = 1`.

- `f = X₀`, `n = 1`, `Q = 5`: `σ = 4/5`.

- `f = X₀²`, `n = 1`, `Q = 9`: `σ = 2`, so `σ` is not a probability.

- `f = X₀² + X₁²`, `Q = 3`: `σ = 0` (no primitive zero modulo 3).

- For `f = X₀²` in two variables and `Q = 9`: `σ = 2 > 1` (zeros `(b₀, b₁)` with `3 | b₀` and `3 ∤ b₁`).

### 0.11 Exact quadratic function-field slices

<a id="odd-degree-quadratic-function-field-family"></a>

**Odd degree quadratic function field family.** Let q be an odd prime power, `K = 𝔽_q(t)` and `n ≥ 0`. Let `P_n` be the set of squarefree polynomials `f ∈ 𝔽_q[t]` of degree exactly n, and let `(𝔽_q^×)²` act on `P_n` by multiplication. The family `S_n` is the quotient `P_n/(𝔽_q^×)²`, and its element [f] is the quadratic extension `L_f = K[y]/(y² − f)` of K (a field whenever n is odd, since then f is not a square in K). For odd n, `L_f` is ramified at the place `∞` of K and its discriminant divisor has degree `n + 1`; `L_f` and `L_{f'}` are K-isomorphic exactly when f' `= u²f` for a unit `u ∈ 𝔽_q^×`. The ring `O_{L_f}` is the integral closure of `𝔽_q[t]` in `L_f`. The monic representatives `P_n^mon ⊂ P_n` are recorded as part of the data: for even q the square classes of `𝔽_q^×` collapse and the parametrisation is not the one used here.

q odd (the Kummer description `y² = f` needs characteristic `≠ 2`) `n ≥ 0`; `S_n` is the EVW family for n odd squarefree means squarefree in `𝔽_q[t]`; degree is natDegree

- `squarefreePolysOfDegree`: `P_n = {f ∈ 𝔽_q[t] : f squarefree, natDegree f = n}`.

- `monicSquarefreePolysOfDegree`: `P_n^mon = {f ∈ P_n : f monic}`.

- `squareClassSetoid`: f ~ f' `⇔` ∃ `u ∈ 𝔽_q^×`, f' `= C(u²)·f`, an equivalence relation on `P_n`.

- `quadraticFamily`: `S_n := P_n/~, the family of quadratic extensions L_f`.

- `quadraticPoly`: The polynomial `y² − f` over the rational function field `𝔽_q(t)`.

- `quadraticFunctionField`: `L_f := 𝔽_q(t)[y]/(y² − f)`.

- `irreducible_quadraticPoly`: For f squarefree of odd degree, `y² − f` is irreducible over `𝔽_q(t)`, so `L_f` is a field.

- `quadraticFamily_mk_eq_iff`: `[f] =` [f'] in `S_n ⇔` ∃ `u ∈ 𝔽_q^×`, f' `= u² f`.

- `card_quadraticFamily_fiber`: For odd q every class of `S_n` has exactly `(q − 1)/2` representatives in `P_n`.

For the proof, Define `P_n` and `P_n^mon` as sets of polynomials, and the setoid f ~ f' `⇔` ∃ `u ∈ 𝔽_q^×`, f' `= u² f`; `S_n` is its quotient type. Define the quadratic polynomial `y² − f` over the rational function field and `L_f` as its adjoining field; irreducibility for odd n is the lemma that an odd-degree polynomial is not a square in `𝔽_q(t)` (compare degrees), making AdjoinRoot a field. The K-isomorphism criterion: two Kummer extensions `K(√f)`, `K(√f')` of a field of characteristic `≠ 2` coincide iff f'/f is a square in K; for squarefree f, f' of the same degree this forces f'/`f ∈ (𝔽_q^×)²` (unique factorisation).

*Needs:* `Squarefree` (Mathlib), `Polynomial.Monic` (Mathlib), `RatFunc` (Mathlib), `FunctionField` (Mathlib), `integralClosure` (Mathlib), [arithmetic family](#arithmetic-family).

([[37]](#ref-37), §8.7, p.776 (Annals 183); [[37]](#ref-37), Proposition 8.7, p.774 (Annals 183).)

**Checks.**

- For q odd, the family `S₁` has exactly `2q` elements.

- For q odd, `S₀` (nonzero constants modulo squares) has exactly 2 elements.

- For q even every element of `𝔽_q^×` is a square, so `S_n` has as many elements as there are monic squarefree polynomials of degree n; the odd-q formula `2(q^n − q^{n−1})` fails (`q = 2`, `n = 3` gives 4, not 8).

- For q odd, the map `P_n^mon → S_n` is injective and its image has exactly half the classes of `S_n`.

- `S₁` has `2q` elements (q monic linear polynomials, two square classes of leading coefficients), not `2(q − 1)`.

- Each class of `S_n` contains exactly `(q − 1)/2` polynomials, so averages over `S_n` equal averages over `P_n`.

<a id="size-of-the-odd-degree-quadratic-family"></a>

**Size of the odd degree quadratic family.** Let q be odd. For every odd `n ≥ 3`, `|S_n| = 2(q^n − q^{n−1})`; for `n = 1`, `|S₁| = 2q`.

q odd n odd; the case `n = 1` is stated separately

For the proof, Each class of `S_n` has exactly `(q − 1)/2` representatives in `P_n` (API `card_quadraticFamily_fiber`: `u² f = f` forces `u = ±1` since `f ≠ 0`). `P_n = ⊔_{a ∈ 𝔽_q^×} a·P_n^mon`, so `|P_n| = (q − 1)|P_n^mon|`. By [count of squarefree monic polynomials over a finite field](#count-of-squarefree-monic-polynomials-over-a-finite-field), `|P_n^mon| = q^n − q^{n−1}` for `n ≥ 2` and q for `n = 1`. Therefore `|S_n| = |P_n|/((q − 1)/2) = 2|P_n^mon|`.

*Needs:* [count of squarefree monic polynomials over a finite field](#count-of-squarefree-monic-polynomials-over-a-finite-field), [odd degree quadratic function field family](#odd-degree-quadratic-function-field-family).

([[37]](#ref-37), (8.7.5), p.777 (Annals 183).)

**Checks.**

- `q = 3`, `n = 3`: `|S₃| = 2(27 − 9) = 36`.

- `q = 3`, `n = 1`: `|S₁| = 6`; applying the `n≥3` formula would give `2(3 − 1) = 4`.

- At `q=5`, `n=3`, the exact slice has `2(125−25)=200` classes.

### 0.12 Coefficient boxes and local discriminants

<a id="coefficient-box"></a>

**Coefficient box.** For `n≥0` use integral vectors `a∈Z^(n+1)`, representing `Σ a_i x^(n−i)y^i`. `H_box(a)=max_i |a_i|` is natural valued and Northcott. The inclusive box has `(2B+1)^(n+1)` elements at natural cutoff B; it counts vectors, without quotienting by a change-of-variables group.

- `H_box(a)≤B iff` every coordinate has absolute value at most B.

- The maximum height on a fixed finite coefficient vector is Northcott.

- The inclusive box has `(2B+1)^m` vectors.

- Changing all signs preserves height.

For the proof, Bound each coordinate in the finite integer interval `[−B,B]`. The box is their Cartesian product. Apply the ofNat adapter; do not reuse weighted monic height.

*Needs:* `Northcott` (Mathlib), `TauCeti.normLE` (Tau Ceti).

([[59]](#ref-59), §1 p.2, height convention.)

**Checks.**

- A single integer has seven choices in the box of height 3.

- Only the zero vector has height 0.

- The native real-cutoff carrier is empty below zero.

<a id="monic-weighted-height"></a>

**Monic weighted height.** For `a=(a₁,…,a_n)` define `f_a=x^n+Σ_{i=1}^n a_i x^(n−i)` and `H_w(a)=max_i |a_i|^(1/i)`, with the maximum of the empty vector 0. For `X≥0`, `H_w≤X iff |a_i|≤X^i`. Thus the inclusive count is `∏_{i=1}^n(2⌊X^i⌋+1)`, and the strict count for `n≥1` is `2^n X^(n(n+1)/2)+O_n(X^(n(n+1)/2−1))`. This ordering is not the coefficient maximum used by ABZ.

Nonnegative X in the coordinate and floor formulas; `n≥1` in the stated asymptotic.

- `Coefficients.weightedHeight`: The maximum of `|a_i|^(1/(i+1))`; empty maximum 0.

- At `X≥0`, the height bound is equivalent to all weighted coefficient bounds.

- The weighted height is Northcott.

- `Coefficients.monicPolynomial`: The polynomial with descending monic coefficients.

- Over a nontrivial commutative ring, the constructed polynomial is monic of degree n.

- `Coefficients.weightedBox`: The strict coefficient region `|a_i|<X^(i+1)`.

- For `X>0` this region is finite with cardinality `∏_{i=1}^n(2⌈X^i⌉−1)`, including the empty product at n=0.

For the proof, Construct `f_a` from the finite coefficient tuple. Real roots of the nonnegative absolute values give the height. Monotonicity of powers converts sublevel sets to anisotropic integer boxes; multiply interval counts. The strict-cutoff asymptotic follows by expanding the product.

*Needs:* `Northcott` (Mathlib), `Polynomial.discr` (Mathlib), [coefficient box](#coefficient-box).

([[58]](#ref-58), §1 p.1, definition of H and first counting display.)

**Checks.**

- `x²+4` has weighted height 2, though its coefficient maximum is 4.

- At cutoff 1 the degree-two monic family has nine elements.

- The degree-zero polynomial is 1 and its coefficient height is 0.

<a id="binary-discriminant"></a>

**Binary discriminant.** For `n≥2` the universal binary discriminant `D_n∈Z[a₀,…,a_n]` is the integral homogeneous polynomial of degree `2n−2` agreeing with `Disc(Σ a_i x^(n−i))` when `a₀` is invertible and the polynomial has degree n. Evaluation defines `Δ_n` over every commutative ring, including `a₀=0`. At `n=0`,1 use `Δ_n=1`. Its covariance under `γ∈GL₂` is `det(γ)^(n(n−1))`; for `n≥1`, `Δ_{n+1}(xf)=Δ_n(f) f(0,1)²`. A leading-zero vector must never be evaluated with the discriminant of its lower-degree affine polynomial.

- `ArithmeticStatisticsPartI.binaryDisc`: Evaluate the universal integral invariant in an arbitrary coefficient ring.

- `ArithmeticStatisticsPartI.binaryDisc_monic`: For leading coefficient 1, binary discriminant agrees with Mathlib polynomial discriminant.

- `ArithmeticStatisticsPartI.binaryDisc_map`: Evaluation commutes with every ring homomorphism.

- `ArithmeticStatisticsPartI.binaryDisc_scale`: Scalar multiplication contributes `c^(2n−2)` for `n≥2`.

- `ArithmeticStatisticsPartI.binaryDisc_add_root`: For `n≥1`, multiplication by x adds the root (0:1) and contributes the square of `f(0,1)`.

For the proof, Construct the universal polynomial through the resultant of the universal polynomial and its derivative, cancel the leading coefficient integrally, and prove base change. The root-product identity on the generic coefficient ring gives homogeneity, covariance and the added-root formula; injectivity into its fraction field extends them across the leading-zero locus.

*Needs:* `Polynomial.discr` (Mathlib).

([[59]](#ref-59), §1 p.2 and Appendix A pp.54–55.)

**Checks.**

- The quadratic vector `(a,b,c)` has discriminant `b²−4ac`.

- The binary quadratic xy has discriminant 1 although its leading coefficient is zero.

- The binary quadratic `y²` has a repeated projective root and discriminant zero.

- At `n=0` and `f=2`, `Δ₁(2x)=1` whereas `Δ₀(2)f(0,1)²=4`. The added-root identity therefore starts at `n=1`.

<a id="binary-local-proportion"></a>

**Binary local proportion.** For `n≥2` and prime p, `α_n(p)` is the fraction of all `(n+1)`-tuples modulo `p²` whose fixed-degree binary discriminant is nonzero modulo `p²`. All tuples are included, including zero and leading-zero reductions. This finite count equals normalized Haar measure on `ℤ_p^(n+1)`.

- `ArithmeticStatisticsPartI.binaryLocalProportion_nonneg`: The proportion is nonnegative.

- `ArithmeticStatisticsPartI.binaryLocalProportion_le_one`: For p positive the proportion is at most one.

- `ArithmeticStatisticsPartI.binaryLocalProportion_lift`: The numerator agrees with integer representatives satisfying `p²∤Δ`.

For the proof, Evaluate the universal discriminant directly in `Z/p²Z`. Count its nonzero locus and divide by `p^(2n+2)`. Modulus invariance identifies this with the p-adic cylinder.

*Needs:* [binary discriminant](#binary-discriminant), `ZMod` (Mathlib), `Fintype.card` (Mathlib).

([[59]](#ref-59), Appendix A, Proposition A.1 pp.53–54.)

**Checks.**

- Binary quadratics at 2 have density `1/2`.

- Binary cubics at 2 have density `3/8`.

- Binary quartics at 3 have density `176/243`.

<a id="monic-local-proportions"></a>

**Monic local proportions.** For `n≥0`, prime p and `j≥0`, `ν_j(n,p)` is the fraction of monic coefficient vectors modulo `p^(j+1)` for which `p^j` divides the integral discriminant and `p^(j+1)` does not. Compute the discriminant using any integer lifts; congruence makes this independent of lifts. For `j=0` reduction modulo p suffices, for `j=1` use `p²`. Degree zero and one have `Δ=1`.

- `ArithmeticStatisticsPartI.monicProportion`: The exact valuation-j residue proportion, with positive natural modulus p and canonical integer coefficient lifts. Prime-modulus results carry primality explicitly.

- `ArithmeticStatisticsPartI.monicProportion_nonneg`: A finite discriminant proportion is nonnegative.

- `ArithmeticStatisticsPartI.monicProportion_le_one`: At a positive modulus the proportion is at most one.

- `ArithmeticStatisticsPartI.monicDisc_lift`: Discriminants of congruent monic coefficient tuples are congruent.

For the proof, Choose canonical integer representatives, evaluate the integral polynomial discriminant, and filter the finite tuple space. Change of lifts alters the invariant by a multiple of the modulus. Uniform residue measure agrees with normalized p-adic Haar measure.

*Needs:* [monic weighted height](#monic-weighted-height), `ZMod` (Mathlib), `Fintype.card` (Mathlib).

([[60]](#ref-60), §2 p.368; §6 Propositions 6.4,6.7 and Theorem 6.8 pp.371–372.)

**Checks.**

- Every monic linear discriminant is a unit.

- No monic linear discriminant has valuation one.

- A quadratic discriminant at 2 has zero valuation-one probability.

- The valuation-one probability for monic quartics at 3 is `8/81`, not `80/729`.

<a id="strong-weak-discriminant"></a>

**Strong weak discriminant.** For an integral polynomial invariant D on a fixed coefficient vector, `D(a)` is strongly `p²`-divisible when every vector congruent to a modulo p still has `p²|D`. It is weakly `p²`-divisible when `p²|D(a)` but strong divisibility fails. For squarefree m, `W_m^(i)=`intersection over p|m of the corresponding strong or weak loci. These notions are coefficient-space notions; they are not defined by first factoring the affine polynomial.

p is prime for the arithmetic interpretation; the predicates themselves make sense for every natural p.

- `Coefficients.StrongSquareDivides`: Every coefficient perturbation by p preserves square divisibility.

- `Coefficients.WeakSquareDivides`: Square divisibility without strong divisibility.

- `ArithmeticStatisticsPartI.squareDiv_partition`: Every square-divisible vector lies in exactly one of the two loci.

- `ArithmeticStatisticsPartI.strongSquareDiv_residue`: Strong divisibility is unchanged by adding p times a vector.

- `ArithmeticStatisticsPartI.SquarefreeDivLocus`: The m-locus is the intersection of the selected prime loci.

For the proof, Express all same-residue vectors as a+pb. Strong is residue-class stable. Weak is the difference between the full square-divisibility set and the strong locus. Form intersections for squarefree m.

*Needs:* [binary discriminant](#binary-discriminant), [family defined by local conditions](#family-defined-by-local-conditions).

([[58]](#ref-58), §1.1 pp.4–5; [[59]](#ref-59), §1 pp.2–3.)

**Checks.**

- `x²+9` is weakly `3²`-divisible.

- `x³` is strongly `3²`-divisible.

- `x²` is strongly `2²`-divisible; adding 2 to its constant coefficient keeps `4|Δ`.

<a id="local-maximality"></a>

**Local maximality.** A monic integral f is p-maximal exactly when it is not contained in the ideal (`p²`, pu, `u²`) for any monic integral u whose reduction is irreducible over Fp. Equivalently use Dedekind’s `gcd(f_corr,g,h)=1` criterion, where g,h lift the distinct-factor product and its complementary multiplicity product. The ideal condition is determined modulo `p²` and extends to separable products. Its finite coefficient proportion is `1−p⁻²` for every `n≥2`, and 1 for `n=0`,1. Global independence in ABZ is a heuristic, whereas BSW’s global result uses its tail theorem.

- `ArithmeticStatisticsPartI.pMaximal_modulus`: The local predicate depends only on coefficients modulo `p²`.

- `ArithmeticStatisticsPartI.pMaximal_unit_disc`: A discriminant not divisible by p forces local maximality.

- `ArithmeticStatisticsPartI.pMaximal_proportion`: The exact degree-n local proportion is `1−1/p²` for `n≥2`.

`pMaximal_proportion` in `Suggested.lean` states this exact local mass for every prime and `n≥2`, using the polynomial ideal obstruction.

For the proof, Define the explicit polynomial ideal obstruction. Count intersections indexed by distinct irreducible factors of total degree d: zero if `2d>n`, otherwise `p⁻³d` (Proposition 3.4). Inclusion–exclusion and the polynomial `zeta` Euler product give `(1−t²/p²)/(1−t)`. For irreducible f, the order interpretation is `TauCeti.NumberField.IntegralPrimitiveElement.not_dvd_index_iff` in `TauCeti.NumberTheory.NumberField.Index.DedekindCriterion`. For separable reducible f, prove the criterion for its order in the finite étale Q-algebra using integral closure componentwise.

*Needs:* [monic weighted height](#monic-weighted-height).

([[60]](#ref-60), Lemma 3.1, Corollary 3.2 pp.368–369; Proposition 3.5 pp.369–370.)

**Checks.**

- Every linear monic polynomial is p-maximal.

- `x²` is not p-maximal.

- `x²−3` is 3-maximal despite its discriminant being divisible by 3.

<a id="kappa-acceptable-specifications"></a>

**Kappa acceptable specifications.** Fix `n≥1` and `κ≥2`. A finite-place specification assigns to each prime p a set of monic coefficient residues modulo `p^κ`. Its p-adic condition is the inverse image of that residue set. It is `κ`-acceptable when, for all sufficiently large primes, it contains every coefficient tuple with `p²∤Δ`. The integral finite-place family is their intersection. A separately supplied real root stratum may then be intersected with this family through the local-conditions interface; acceptability concerns only the finite places. Finite modification preserves acceptability. An Euler-product asymptotic takes an infinite-prime tail estimate as an additional hypothesis.

`κ≥2` so squarefree-discriminant safety is visible in the modulus. Real root strata are supplied by the polynomial root-count API.

- `ArithmeticStatisticsPartI.localSpecificationFamily`: The integral family satisfying every local residue condition.

- `ArithmeticStatisticsPartI.kappaAcceptable_univ`: The unconstrained specification is acceptable whenever `κ≥2`.

- `ArithmeticStatisticsPartI.kappaAcceptable_inter`: Intersecting two acceptable specifications preserves acceptability.

- `ArithmeticStatisticsPartI.localSpecificationFamily_mono`: Enlarging each local specification enlarges the global family.

- `ArithmeticStatisticsPartI.kappaAcceptable_finite_modification`: Changing the residue sets at finitely many primes preserves `κ`-acceptability; no nonemptiness of the resulting global family is implied.

For the proof, Use actual residue subsets at each prime. Pull them back along coefficient reduction. The exceptional primes are finite; outside their union both specifications contain the safe locus.

*Needs:* [monic weighted height](#monic-weighted-height), [family defined by local conditions](#family-defined-by-local-conditions).

([[58]](#ref-58), §4 local specifications pp.20–21.)

**Checks.**

- The full degree-two residue family is 2-acceptable.

- An empty specification at every prime is not acceptable, even for linear polynomials.

- Imposing an empty condition only at 2 still gives an acceptable specification, although the resulting global family is empty.

### 0.13 Projective hypersurface families

<a id="primitive-hypersurface-family"></a>

**Primitive hypersurface family.** Let `M=`binomial(`n+d`,d), with the monomial ordering of [§0.10](#coefficient-vector-form). Take nonzero primitive vectors in `Z^M` (the gcd of all coefficients is 1), modulo a∼`−a`, and order classes by the Euclidean `norm (Σ a_i²)^(1/2)`. They parametrize equations of degree-d hypersurfaces in fixed `P^n`. There is no quotient by `PGL_(n+1)`, and singular equations remain in the ambient family. Each class has precisely two primitive vectors; the Euclidean norm descends and is Northcott.

- `ArithmeticStatisticsPartI.coefficientSignSetoid`: Two primitive vectors are equivalent exactly when equal or opposite.

- `ArithmeticStatisticsPartI.HypersurfaceCoefficients`: The coefficient carrier is the sign quotient.

- `ArithmeticStatisticsPartI.euclideanHeightSq`: The squared Euclidean height on integer vectors.

- `ArithmeticStatisticsPartI.euclideanHeightSq_neg`: The squared norm is invariant under the sign relation.

- `ArithmeticStatisticsPartI.hypersurfaceHeightSq`: The squared height descends to the quotient.

- `ArithmeticStatisticsPartI.hypersurfaceHeight_northcott`: The squared height on classes is Northcott.

- `ArithmeticStatisticsPartI.primitiveSign_fiber`: Every coefficient class has two primitive representatives.

- `ArithmeticStatisticsPartI.hypersurfaceHeight`: The source real height is the square root of the descended natural-valued squared height.

- `ArithmeticStatisticsPartI.hypersurfaceHeight_le`: For `X≥0`, the real-height cutoff `H≤X` is exactly the squared-height cutoff `H²≤X²`.

- `ArithmeticStatisticsPartI.hypersurfaceHeight_real_northcott`: The real Euclidean height on coefficient classes is Northcott.

For the proof, Use primitive gcd and a nonzero condition, then the two-element sign action. The squared Euclidean norm is a natural Northcott height; taking square roots gives the specified real height. Coordinate bounds prove finiteness; `a=−a` over Z forces `a=0`, excluded by primitivity.

*Needs:* [coefficient box](#coefficient-box), [coefficient vector form](#coefficient-vector-form), [arithmetic family](#arithmetic-family).

([[61]](#ref-61), §1 pp.1–3.)

**Checks.**

- The zero vector is not primitive in any dimension.

- The vector `(1,1)` has squared Euclidean height 2 and box height 1.

- Primitive vectors `(1,2)` and `(−1,−2)` define one class; `(1,2)` and `(2,1)` need not.

<a id="finite-local-hypersurface-set"></a>

**Finite local hypersurface set.** For `Q≥1`, let `R_M(Q)` be [§0.10’s primitive coefficient residue vectors](#local-density-of-a-form-modulo-q). `F_loc(Q)` consists of `a∈R_M(Q)` such that for each prime power `p^r` exactly dividing Q the homogeneous equation `f_a` has a primitive zero modulo `p^r`. By CRT this is equivalent to having a primitive zero modulo Q and to [§0.10’s local density](#local-density-of-a-form-modulo-q) `σ(a;Q)>0`. It is a finite-level condition; it does not alone assert a Qp-point. At `Q=1` the primitive condition is vacuous and `F_loc` is the singleton residue vector.

- `ArithmeticStatisticsPartI.finiteLocal_mem`: Membership requires both a primitive coefficient vector and a primitive root.

- `ArithmeticStatisticsPartI.finiteLocal_finite`: The finite-level family is a finite coefficient set.

- `ArithmeticStatisticsPartI.finiteLocal_positive_count`: A primitive-root count is positive exactly on this coefficient set, for primitive a.

For the proof, Import the primitive residue vectors and coefficient-to-form evaluator. Apply CRT to both coefficient and root vectors and to the gcd conditions. Record `Q=1` separately.

*Needs:* [local density of a form modulo q](#local-density-of-a-form-modulo-q), [coefficient vector form](#coefficient-vector-form).

([[61]](#ref-61), Local coefficient set and primitive residue conventions p.55.)

**Checks.**

- Modulo 1 every tuple is primitive and the equation has a primitive root.

- The constant polynomial 1 has no root modulo 2.

- The zero coefficient vector modulo 2 is excluded even for an identically zero evaluator.

### 0.14 Hyperelliptic model families

<a id="hyperelliptic-model-family"></a>

**Hyperelliptic model family.** For `g≥1` let the carrier be integral coefficient vectors of degree `2g+2` with `Δ≠0`, representing `z²=f(x,y)`, ordered by the coefficient maximum. They are models in fixed coordinates, each counted once; there is no quotient by `GL₂(Z)`, rational curve isomorphism or scalar multiplication. Bounded-height finiteness is inherited from the coefficient box. AlgebraicCurves Layers 7 and 10 supplies the smooth projective model and the separable double-cover genus formula.

- `ArithmeticStatisticsPartI.modelHeight`: Height is the maximum of the model coefficients.

- `ArithmeticStatisticsPartI.modelHeight_northcott`: Each fixed-genus model family has Northcott height.

- `ArithmeticStatisticsPartI.model_count_le_box`: The model count is bounded by its ambient coefficient box.

For the proof, Take the nonzero-discriminant subtype. Restrict the box Northcott proof. A coordinate transformation may preserve the curve without identifying elements of this carrier.

*Needs:* [coefficient box](#coefficient-box), [binary discriminant](#binary-discriminant).

([[57]](#ref-57), §1 pp.1–2; §3 p.9.)

**Checks.**

- The zero coefficient vector is excluded.

- `x⁴+y⁴` and `4x⁴+4y⁴` are distinct integral models of isomorphic curves over `Q (z↦2z)`.

- The two models have heights 1 and 4.

<a id="odd-root-criterion"></a>

**Odd root criterion.** For odd p and a monic degree-n integral polynomial, strong `p²`-divisibility is equivalent to its reduction having either at least two distinct repeated roots over Fp-bar or a root of multiplicity at least three. Among `p²`-divisible polynomials, weak divisibility means exactly one repeated root, which is an Fp-rational double root. For binary forms use projective roots, including infinity. The zero reduction is handled separately as strongly divisible for degree at least two. At `p=2` this root criterion is not asserted.

p odd; monic case has full degree. Nonzero binary reduction for the projective factorization statement.

For the proof, Factor over the residue algebraic closure and apply the discriminant-product formula. The codimension-two singular locus is the two-double-root/triple-root locus. The unique double root is Frobenius fixed. Translation to that root makes the last two coefficients divisible by p and `p²`, respectively.

*Needs:* [strong weak discriminant](#strong-weak-discriminant).

([[58]](#ref-58), §1.1, p.4 (strong and weak divisibility and the unique multiple root); [[59]](#ref-59), §1 pp.2–3.)

**Checks.**

- `x²+9` is weak at 3, `x³` is strong at 3, and `x²` is strong at 2 despite its single double root; this detects the odd-prime restriction.

- Modulo 3, `x²(x−1)²` has two distinct double roots and is strongly square-divisible at 3.

- The polynomial `x²−x` has discriminant 1, so it belongs to neither square-divisibility stratum at 3.

<a id="density-denominator-comparisons"></a>

**Density denominator comparisons.** Skorobogatov–Sofos relative coefficient density is computed inside the stated degree-pattern ambient coefficient family, with both numerator and denominator intersected with that family and the same box cutoff. BLS global and everywhere-local ratios both divide by all projective coefficient classes, so the conditional ratio global/local is their quotient only when the local density is positive. A density-one statement inside a positive-density subfamily transfers by the density tower; no conclusion is justified from a zero-density denominator.

No transfer across a zero-density denominator.

For the proof, Identify both finite counting carriers with the family. Write the finite identity `N(S∩T)/N(U)=[N(S∩T)/N(T)]·[N(T)/N(U)]` when `N(T)>0`. Positivity of its limiting relative density makes this denominator eventually nonzero.

*Needs:* [relative density](#relative-density), [relative density is multiplicative in towers](#relative-density-is-multiplicative-in-towers), [density one restricts to subfamilies of positive lower density](#density-one-restricts-to-subfamilies-of-positive-lower-density), [primitive hypersurface family](#primitive-hypersurface-family).

([[67]](#ref-67), Published §1, height conventions and Theorems 1.1–1.2 pp.674–675; [[61]](#ref-61), §1 pp.1–3.)

**Checks.**

- A numerator of 30 inside a constrained family of 40 has relative density `3/4`, rather than `3/10` in a larger family of 100.

- If global and local counts are 3 and 4 among 10 ambient classes, the conditional global fraction is `3/4`.

- Finite ratios with an empty denominator are assigned zero, never one.

### 0.15 Restricted radicands and squareclass denominators

<a id="negative-pell-radicands"></a>

**Negative pell radicands.** Let D be the positive squarefree integers all of whose prime factors are either 2 or 1 modulo 4. `D(X)` uses `d≤X`. The unit 1 belongs to this radicand carrier; a quadratic-field subfamily excludes it explicitly. The negative-Pell subset consists of d with integers x,y solving `x²−`dy²=`−1`. A radicand and its quadratic-field discriminant are not one constant multiple throughout D: `disc=d` for `d≡1 mod4` and `4d` otherwise.

- `ArithmeticStatisticsPartI.NegativePellSoluble`: The soluble subset uses an actual integral solution.

- `ArithmeticStatisticsPartI.pellRadicand_finite`: At every cutoff only finitely many radicands occur.

- `ArithmeticStatisticsPartI.quadraticRadicandDisc`: For `d>1`, the positive quadratic-field discriminant on this squarefree family; assign value 1 at the unit radicand as a convention.

- `ArithmeticStatisticsPartI.pell_no_three_mod_four`: No prime 3 modulo 4 divides an admitted radicand.

For the proof, Restrict the squarefree Northcott carrier by the prime-factor condition. Define the soluble subset by the integral equation. Partition into odd and even radicands before converting to discriminant order; invoke the piecewise-rescaling theorem only with its sector-density hypotheses.

*Needs:* [positive squarefree family over q](#positive-squarefree-family-over-q), [piecewise rescaling of a height](#piecewise-rescaling-of-a-height).

([[62]](#ref-62), §1 pp.1–2.)

**Checks.**

- 1,2,5,10 all belong to the radicand family.

- 3 and 6 are excluded.

- Radicands 2 and 5 have discriminants 8 and 5.

- The radicand 1 solves the negative-Pell equation with `x=0`,`y=1` and has assigned discriminant 1, but it gives no quadratic field. The field carrier excludes it.

<a id="twist-denominator-frontier"></a>

**Positive squareclass denominator.** For a number field F, the squareclass height `H(t)=`product of norms of finite primes with odd valuation has finite fibers. For a nonempty admissible finite set of local conditions `Σ`, one needs `#Σ(X)=c_(F,Σ) X+o(X)`, `c_(F,Σ)>0`, where each squareclass is counted once. Admissible means local conditions are compatible with global squareclasses, not merely that each local set is individually nonempty. Its ideal-counting proof must distinguish classes modulo Cl(F)² and the finite unit/Selmer fibers. Prove this denominator asymptotic from the squarefree ideal count and compatible ray-class conditions below; Northcott finiteness alone does not imply it.

For the proof, Expand squarefree ideals in each ray class and use finite-order Hecke characters to select compatible classes. Count unit/Selmer fibers and local squareclass conditions explicitly. Analytic extension and a Tauberian/ideal equidistribution theorem must produce the residue and its strict positivity. Use [AnalyticNumberTheoryPartI §§2.3–2.5](../AnalyticNumberTheoryPartI/README.md#s2-3) for the Hecke analytic extension, line-one comparison and Dedekind residue, and GlobalNumberFields Layer 3 for ray-class ideal counts. Completed ArithmeticDirichletSeries Layer 9 supplies `wienerIkehara`, with nonnegative coefficients, half-plane `LSeriesHasSum`, nonnegative residue and a separately defined continuous boundary remainder. The squarefree support-ideal expansion, the compatible Selmer fibers and the residue calculation remain the explicit arithmetic application here.

*Needs:* [squareclass height](#squareclass-height), [finiteness of squareclasses of bounded height](#finiteness-of-squareclasses-of-bounded-height), [AnalyticNumberTheoryPartI §§2.3–2.5](../AnalyticNumberTheoryPartI/README.md#s2-3), GlobalNumberFields Layer 3, Completed ArithmeticDirichletSeries Layer 9.

([[68]](#ref-68), §2 p.2, squareclass height and `Σ(X)`.)

**Checks.**

- Over Q with no local restriction, both signs occur and `#Σ(X)=(12/π²)X+o(X)`. Imposing `Σ_∞={+1}` gives the positive squarefree denominator `(6/π²)X+o(X)`. Compatibility and residue positivity, rather than mere local nonemptiness, must be established for general F.

- At height at most 1 over Q, the unrestricted classes are [1] and `[−1]`; the positive real-place condition retains only [1]. A count with one class in the unrestricted family has lost its sign multiplicity.

- An empty local set makes every finite count zero and cannot satisfy a positive-residue conclusion. Finitely many compatible conditions select an inhabited global family; a condition at every prime forcing even valuation is a different, infinite set of restrictions.

### 0.16 Finite-field abelian-variety counting families

<a id="unpolarized-abelian-count"></a>

**Unpolarized abelian count.** For a finite field k and `g≥0`, `B(k,g)` counts k-isomorphism classes of dimension-g abelian varieties, once per class. Use the native Tau Ceti category and dimension; do not count geometric classes, isogeny classes or `1/Aut` stack mass. Finiteness is imported from the finite-field arithmetic-moduli classification.

- `ArithmeticStatisticsPartI.UnpolarizedClasses`: Native dimension-g abelian varieties modulo k-isomorphism.

- `ArithmeticStatisticsPartI.unpolarizedCount`: The unweighted number of classes, used only with the finite-field finiteness theorem.

- `ArithmeticStatisticsPartI.unpolarizedClasses_finite`: Over a finite field the class carrier is finite.

- `ArithmeticStatisticsPartI.unpolarized_iso`: Two representatives have the same class precisely when k-isomorphic.

- `ArithmeticStatisticsPartI.unpolarizedCountOn`: For a subfamily S of native class objects, its unweighted count is Set.ncard S; finiteness is required before treating ncard as a count.

- `ArithmeticStatisticsPartI.unpolarizedCountOn_univ`: Counting the full class subfamily recovers unpolarizedCount.

`unpolarizedClasses_finite` in `Suggested.lean` states finiteness on the native abelian-variety category modulo k-isomorphism, in every dimension.

For the proof, Restrict the native category by dimension and quotient by categorical isomorphism. Import finite-field classification to obtain finiteness before interpreting Nat.card as a counting function. The dimension-zero variety is the identity object.

*Needs:* `TauCeti.AlgebraicGeometry.AbelianVariety` (Tau Ceti), [finite-field abelian counting inputs](#support-abelian-counts).

([[63]](#ref-63), Introduction §0, Theorem 0.1, pp.1–2 (arXiv v1).)

**Checks.**

- There is one dimension-zero abelian-variety class over a finite field.

- Isomorphic representatives contribute one class.

- For an actual native dimension-g object A with `#Aut(A)=2`, the singleton class subfamily has unpolarizedCountOn=1, differing from its inverse-automorphism mass `1/2`.

<a id="principally-polarized-count"></a>

**Principally polarized count.** `A(k,g)` is the number of k-isomorphism classes of pairs `(A,λ)`, with A a dimension-g abelian variety and `λ` a principal polarization defined over k. An isomorphism f identifies the pairs when `f∨ λ′ f=λ`. Polarization means the ample line-bundle-induced symmetric isogeny, with the descent convention of AbelianSchemesAndArithmeticModuli §A2; its native type is imported. This is an unweighted count, not the coarse moduli space k-point count or inverse-automorphism mass.

- `ArithmeticStatisticsPartI.ppavClasses`: The type of k-isomorphism classes of dimension-g principally polarized pairs.

- `ArithmeticStatisticsPartI.ppavCount`: Nat.card of ppavClasses, after the finite-field finiteness input.

- `ArithmeticStatisticsPartI.ppav_forget`: Forget `λ` to the unpolarized class.

- `ArithmeticStatisticsPartI.ppavCount_fiber_sum`: `A(k,g)=Σ_[A] #` (principal polarizations of A modulo `Aut_k(A)`).

For the proof, Use the imported principal-polarization type and pair-isomorphism relation. Prove the forgetful fiber is the `Aut(A)`-orbit set of principal polarizations. Import finiteness from the arithmetic-moduli classification, then count.

*Needs:* AbelianSchemesAndArithmeticModuli:A2, AbelianSchemesAndArithmeticModuli:A6 (Rosati polarization orbits), [unpolarized abelian count](#unpolarized-abelian-count).

([[63]](#ref-63), Introduction §0 pp.1–2; §4.4 Proposition 4.11 p.20 (arXiv v1).)

**Checks.**

- `A(k,0)=1`.

- `A(k,1)=B(k,1)`: elliptic curves have a canonical principal polarization.

- For a principally polarized elliptic curve with automorphism group of order 2, its class contributes 1 and its mass contributes `1/2`.

<a id="polarization-fiber-count"></a>

**Polarization fiber count.** For a fixed abelian variety `A/k`, the fiber of the forgetful class map consists of `Aut_k(A)`-orbits of principal polarizations, acting by `λ↦u`∨`λu`. The orbit set may be finite although `Aut_k(A)` is infinite. Given `λ₀`, The finite-field adapter of Proposition 4.11 identifies it with Rosati-conjugacy orbits of integral symmetric ample automorphisms in `End_k(A)`. Restrict AbelianSchemesAndArithmeticModuli §A6.19’s geometric comparison to k-defined maps, using vanishing of the finite-field Brauer obstruction for line-bundle descent. The geometry is supplied by AbelianSchemesAndArithmeticModuli §§A6.18–A6.19; hermitian or integral-lattice comparisons use GeometryOfNumbersAndQuadraticArithmetic §§2.2–2.8 and Completed IntegralLattices Layers 1–4.

- `ArithmeticStatisticsPartI.polarizationOrbitCount_empty`: An empty polarization type has zero orbits.

- `ArithmeticStatisticsPartI.polarizationOrbitCount_single`: A singleton polarization type has one orbit.

- `ArithmeticStatisticsPartI.polarizationOrbitCount_finite`: For a finite polarization carrier, orbit count is at most its cardinality.

For the proof, Use transport of `λ` along an isomorphism from a fixed representative. Two transports differ by `Aut_k(A)`, giving the fiber-orbit bijection. The finite orbit-set cardinality is appropriate even if the acting group is infinite.

*Needs:* [principally polarized count](#principally-polarized-count), [finite-field abelian counting inputs](#support-abelian-counts), AbelianSchemesAndArithmeticModuli:A2, GeometryOfNumbersAndQuadraticArithmetic §§2.2–2.8, IntegralLattices §0G (the positive E₈ Gram matrix), `MulAction.orbitRel` (Mathlib).

([[63]](#ref-63), Proposition 4.11, Examples 4.12–4.13 p.20.)

**Checks.**

- An abelian variety with no principal polarization has empty fiber.

- A single canonical principal polarization gives one orbit.

- The orbit-set count is meaningful for an infinite automorphism group with a singleton carrier; no inverse group cardinal is involved.

- For `E/𝔽₅:y²=x³−x`, `End_𝔽₅(E)=ℤ[i]`: E is ordinary with trace −2 and has the automorphism `(x,y)↦(−x,2y)`. On `E⁸`, the identity and the positive definite unimodular E₈ Gram matrix give distinct principal-polarization orbits. The identity represents 1 on `ℤ[i]⁸`; writing a Gaussian vector as `x+iy`, the E₈ norm is `xᵀE₈x+yᵀE₈y`, always even. The orbit count is therefore at least two.

- On the same `E⁸`, let `U=I+E₁₂∈GL₈(ℤ[i])`. The distinct forms I and `UᵀU`, whose leading block is `(1 1;1 2)`, define the same polarization orbit. Counting forms individually overcounts this fibre.

### 0.17 Bundle probabilities

<a id="natural-bundle-law"></a>

**Natural bundle law.** Over `𝔽_q`, `q>1`, normalized rank-two bundle classes on `P¹` modulo tensoring by line bundles are indexed by `ν=|a−b|`. Their natural inverse-automorphism probability is `μ_q(0)=(q−1)/(2q)`, and `μ_q(n)=(q²−1)/(2q^(n+1))` for `n≥1`. Each parity has mass `1/2`. The `GL₂` automorphism orders are `(q²−1)(q²−q)` at `n=0` and `(q−1)²q^(n+1)` at `n>0`; their inverse masses have total `2/((q−1)³(q+1))`, while the `PGL₂` weights have total `2/((q−1)²(q+1))`. Scalar automorphisms cancel in the passage to `PGL₂`.

`q>1`; the geometric interpretation requires q the order of a finite field.

- `ArithmeticStatisticsPartI.bundleMass`: The displayed mass at the normalized splitting index. Its analytic identities hold for every real `q>1`.

- `ArithmeticStatisticsPartI.bundleLaw`: The mass function defines a probability mass function for `q>1`.

- `ArithmeticStatisticsPartI.bundleMass_nonneg`: All masses are nonnegative.

- `ArithmeticStatisticsPartI.bundleMass_sum`: The total mass is one.

- `ArithmeticStatisticsPartI.bundleMass_parity`: Even and odd classes each carry half the mass.

- `ArithmeticStatisticsPartI.bundleAutOrder`: The natural automorphism order has a separate balanced-bundle case.

- `ArithmeticStatisticsPartI.bundleAutOrder_inverse_sum`: For `q>1`, the `GL₂` inverse-automorphism weights sum to `2/((q−1)³(q+1))`; the `PGL₂` sum has one fewer factor `q−1`.

- `ArithmeticStatisticsPartI.bundleMass_from_aut`: Dividing the `GL₂` inverse-automorphism weight by its total gives the stated probability.

For the proof, Use the rank-two splitting target in [the bundle geometry contract](#support-bundle-geometry) and compute upper-triangular bundle automorphisms: `n+1` global sections in the off-diagonal entry for `n>0`. Sum the geometric series, retaining the exceptional balanced bundle. The scalar quotient rescales all inverse masses by one common factor.

*Needs:* [stabilizer weighted orbit count](#stabilizer-weighted-orbit-count), [weighted and unweighted orbit counts](#weighted-and-unweighted-orbit-counts), [bundle geometry](#support-bundle-geometry).

([[64]](#ref-64), §4, bundle measure display pp.29–30.)

**Checks.**

- At `q=3` the balanced bundle has mass `1/3`.

- At `q=3` the next two masses are `4/9` and `4/27`.

- At `q=3` the balanced and first unbalanced `GL₂` automorphism orders are 48 and 36.

- At `q=3`, the total `GL₂` inverse-automorphism weight is `1/16`.

<a id="bundle-parity-tails"></a>

**Bundle parity tails.** For `d≥1`, `μ_q({d,d+2,d+4,…})=1/(2q^(d−1))`; the even tail starting at `d=0` has mass `1/2`. Consequently `μ_q({a+1,a+3,…})=1/(2q^a)` for `a≥0`. The `d=0` exception is required by the balanced-bundle weight.

`q>1`, as in the natural-bundle-law prerequisite; q is a prime power in the finite-field specialization. The target includes both the positive-start formula and the d=0 exception.

For the proof, Sum the unbalanced geometric series with common ratio `q⁻²`. At `d=0` add the exceptional `n=0` term to the positive even tail.

*Needs:* [natural bundle law](#natural-bundle-law).

([[64]](#ref-64), §4 tail display pp.29–30.)

**Checks.**

- At `q=3` the tail `{1,3,…}` has mass `1/2`, the tail `{2,4,…}` has mass `1/6`, and the even tail starting at 0 has mass `1/2`.

- At `q=3`, the tail `{3,5,…}` has mass `1/18`.

- At `q=5`, the tails starting at 2 and 4 have masses `1/10` and `1/250`, respectively.

### 0.18 Picard quotients and Hecke pushforwards

<a id="finite-picard-quotient"></a>

**Finite picard quotient.** For a smooth geometrically connected hyperelliptic `C/𝔽_q`, let `κ` be its degree-two pencil and `P=`Pic(C) of rational line bundles. `Q=P/Zκ` has two parity sectors. Over a finite field Pic¹(C)`(𝔽_q)` is nonempty by Lang’s theorem on its Jacobian torsor and Brauer obstruction vanishing, even when `C(𝔽_q)` is empty. Thus deg:`P→Z` is onto, `Pic⁰(C)=J(𝔽_q)` is finite of size h, and Q is finite of size `2h`. Uniform probability on Q assigns `1/(2h)` per class; conditioning on either parity assigns `1/h`.

- `ArithmeticStatisticsPartI.picClass`: The canonical class map into the quotient.

- `ArithmeticStatisticsPartI.picParity`: Degree modulo 2 descends to the quotient.

- `ArithmeticStatisticsPartI.picQuotient_finite`: Surjective degree and finite degree-zero kernel make Q finite.

- `ArithmeticStatisticsPartI.picQuotient_card`: For an additive commutative group P, a surjective homomorphism `deg:P→ℤ` with finite kernel, and κ with `deg κ=2`, the quotient `P/ℤκ` is finite with cardinality `2#ker(deg)`. This specializes to the Picard quotient.

- `ArithmeticStatisticsPartI.picParity_class`: The parity of a class is degree modulo 2.

For the proof, Use the rational Picard-to-line-bundle comparison over a finite field. Apply ReductiveGroupsPartII §RG2.3.7's torsor triviality to Pic¹ under the Jacobian, and SchemeAndStackFoundations §3.6's finite-field Brauer obstruction vanishing to obtain rational line bundles. Abstractly, for an additive group P with onto degree map and `deg κ=2`, each parity sector is `a Pic⁰` torsor, giving the cardinality `2h`.

*Needs:* ReductiveGroupsPartII §RG2.3.7 (Lang and torsor triviality), SchemeAndStackFoundations §3.6 (Picard–Brauer comparison), JacobianChallenge Layer D, `QuotientGroup.lift` (Mathlib), [finite-field abelian counting inputs](#support-abelian-counts).

([[64]](#ref-64), §4 Picard quotient and probability discussion pp.30–32.)

**Checks.**

- For `P=Z`, degree=id and `κ=2` the quotient has two elements.

- Degree 0 and degree 1 remain distinct in the quotient.

- Tensoring by the pencil preserves a class.

<a id="picard-representatives-and-carry"></a>

**Picard representatives and carry.** Each class of Q has a unique representative of degree `r∈{0,1}`: `L−((deg L−r)/2)κ`. Choosing `D₀` of degree one identifies Q as a set with `Pic⁰×{0,1}`. If `c=κ−2D₀`, addition is `(x,r)+(y,s)=(x+y−floor((r+s)/2)c,(r+s) mod2)`. This need not be a direct-product group decomposition; c must be divisible by 2 in `Pic⁰` for such a split after changing `D₀`.

- `ArithmeticStatisticsPartI.pic_carry`: Two odd representatives create the carry `−c`.

For the proof, Subtract an integer multiple of `κ` to normalize degree. Uniqueness follows by comparing degrees of two representatives differing by `mκ`. Express their sum in normalized coordinates: replace `2D₀` with `κ−c`. The resulting carry has a minus sign.

*Needs:* [finite picard quotient](#finite-picard-quotient).

([[64]](#ref-64), §4 pp.30–32, Picard quotient construction.)

**Checks.**

- In `P=Z×Z/2` with `κ=(2,1)` and `D₀=(1,0)`, the class of `D₀` has order four: Q is not the direct product of its two order-two sectors.

- In `P=Z` with `κ=2` and `D₀=1`, `Pic⁰=0` and `Q=Z/2`; adding two degree-one representatives gives the degree-zero identity.

- In `P=Z×Z/3` with degree the first coordinate, `κ=(2,1)` and `D₀=(1,0)`, `c=(0,1)`. Thus `(0,1)+(0,1)=(2,0)` in `Pic⁰×{0,1}`. A carry `+c` would give `(1,0)`, so this example detects the minus sign.

- In the preceding P, the representative `(−1,0)` normalizes to `(1,1)` by adding `κ`. The degree-one coordinate is 1, rather than the discarded degree `−1`.

<a id="finite-joint-bundle-mass"></a>

**Finite joint bundle mass.** Given the two quotient-invariant bundle indices `ν(L⊗M₁)` and `ν(L⊗M₂)`, push the uniform law on Q to `N×N`. Its mass at `(i,j)` is the fiber cardinality divided by `2h`, not h. Uniform translation makes it depend on `M₂−M₁`. The ratio and inverse-line-bundle conventions used in `θ` intersections must be compared using the hyperelliptic involution identity `σL=(deg L)κ−L` and invariance of the pushforward under `σ`; replacing only the second factor by inversion is not a general property of joint measures.

- `ArithmeticStatisticsPartI.jointFiberMass`: For maps f,g from a finite source Q to ℕ, the mass at `(i,j)` is `#{x:f(x)=i,g(x)=j}/#Q`; the bundle indices give its geometric specialization.

- `ArithmeticStatisticsPartI.jointFiberMass_nonneg`: Joint masses are nonnegative.

- `ArithmeticStatisticsPartI.jointFiberMass_equiv`: Relabeling the uniform source by a bijection preserves the joint law.

- `ArithmeticStatisticsPartI.jointFiberMass_no_fiber`: An empty fiber has zero mass.

- `ArithmeticStatisticsPartI.jointFiberMass_total`: For a nonempty finite source the sum of the masses is one.

For the proof, Use finite uniform counting on Q. Translate the common variable by `M₁`. Import the involution relation and bundle-index invariance for the ratio/inverse convention comparison. Each marginal is the corresponding uniform bundle pushforward.

*Needs:* [finite picard quotient](#finite-picard-quotient), [bundle geometry](#support-bundle-geometry).

([[64]](#ref-64), §4 joint distribution and `θ` intersection formulas pp.30–33.)

**Checks.**

- Uniform Fin 2 pushed forward diagonally gives mass `1/2` at `(0,0)`.

- The same diagonal law has zero mass at `(0,1)`.

- A constant pair pushed from two source classes has mass 1, not 2; the denominator includes both classes.

<a id="theta-tail-normalization"></a>

**Theta tail normalization.** Let `h=#J(𝔽_q)`. For `a≥0`, the event `ν(L)∈a+1+2N` in uniform Q has probability `#Θ_(g−a)(𝔽_q)/(2h)`, with `Θ_d` empty for `d<0`. For a,`b≥0`, write `d₁=g−a`,`d₂=g−b`. If deg M and `d₁+d₂` have different parity the joint event for `ν(L)`,`ν(M⊗L⁻¹)` is empty. Otherwise set `M′=M⊗κ^((d₁+d₂−deg M)/2)`; the event is in bijection with `Θ_d₁ ∩ (M′−Θ_d₂)`, and its probability is that intersection count divided by `2h`. Conditional on its parity sector the denominator is h.

For the proof, For a split pushforward `O(u)`⊕`O(v)`, use `u+v=deg L−g−1` and `h⁰(C,L)=h⁰(P¹,π_*L)`. Normalize the degree by `κ` to `d=g−a`. A nonzero section is equivalent to membership in `Θ_d`. Repeat for `M⊗L⁻¹`; degree parity determines whether simultaneous normalization is possible. Count distinct rational line-bundle classes, not individual divisors or sections.

*Needs:* [finite joint bundle mass](#finite-joint-bundle-mass), [picard representatives and carry](#picard-representatives-and-carry), [bundle geometry](#support-bundle-geometry).

([[64]](#ref-64), §4 pp.30–33, single and joint `θ`-tail displays.)

**Checks.**

- In the pointless genus-two `𝔽₃` example, `Θ₀` contributes `1/8` to the unconditional `ν≥3` odd tail, while its conditional odd-sector probability is `1/4`.

- For `a>g`, `Θ_(g−a)` is empty, so the corresponding tail has probability zero.

- For `g=2`, `a=b=2` and `deg M=1`, the two degree-zero section conditions have incompatible parity, so the joint event is empty.

<a id="parity-product-candidate"></a>

**Parity product candidate.** Let `δ` be the parity of `deg(M₂−M₁)`. Define `μ_r(n)=2μ_q(n)` when `n≡r mod2` and 0 otherwise. The candidate joint law is `1/2[μ₀⊗μ_δ+μ₁⊗μ_(1+δ)]`. Equivalently its mass is `2μ_q(i)μ_q(j)` when `i+j≡δ` and zero otherwise. It has both marginals `μ_q` and total mass 1. This construction states the candidate only; equidistribution requires a separate geometric comparison with its stated hypotheses.

`q>1`, as in the natural-bundle-law prerequisite; q is a prime power in the finite-field specialization.

- `ArithmeticStatisticsPartI.parityProduct`: The displayed candidate mass, with `δ∈ℤ/2ℤ`.

- `ArithmeticStatisticsPartI.parityProduct_support`: Incompatible parity has zero mass.

- `ArithmeticStatisticsPartI.parityProduct_marginal`: Each first-coordinate marginal is the natural bundle law.

- `ArithmeticStatisticsPartI.parityProduct_total`: The joint mass sums to one.

For the proof, Use the half-mass parity sectors. Normalize each conditional marginal by 2, and average the two allowed sector products with coefficient `1/2`.

*Needs:* [natural bundle law](#natural-bundle-law), [bundle parity tails](#bundle-parity-tails).

([[64]](#ref-64), §4 pp.31–33, parity-conditioned limit alternatives.)

**Checks.**

- At `q=3` and `δ=0` the `(0,0)` mass is `2/9`.

- At `q=3` and `δ=1` the `(0,1)` mass is `8/27`.

- The `(0,0)` mass vanishes for `δ=1`.

<a id="function-field-adelic-bundle-measure"></a>

**Function-field adelic bundle measure.** Fix a finite field `𝔽_q`, `q>1`, and `F=𝔽_q(t)`. Construct its completions `F_v` and valuation rings `O_v` at every closed point of `P¹`, including infinity, and its adele ring `A=∏′_v F_v`. Construct `G=PGL₂(A)` as `∏′_v PGL₂(F_v)` relative to `PGL₂(O_v)`, with compact open subgroup `K=∏_v PGL₂(O_v)`. Prove local compactness, second countability and unimodularity, and discreteness of the diagonal `Γ=PGL₂(F)`. Construct the right-invariant quotient measure on `X=Γ\G`, independent of the measurable fundamental domain. With Haar measure normalized by `vol(K)=1`, prove that X has finite nonzero volume.

- `ArithmeticStatisticsPartI.functionFieldAdeles`: The topological adele ring of `𝔽_q(t)` and its diagonal embedding.
- `ArithmeticStatisticsPartI.pgl2FunctionField_discrete`: The diagonal rational subgroup of G is discrete.
- `ArithmeticStatisticsPartI.adelicBundleEquiv`: The equivalence from `Γ\G/K` to rank-two bundles on `P¹` modulo tensoring by line bundles, followed by their splitting index in ℕ.
- `ArithmeticStatisticsPartI.adelicBundleQuotientMeasure`: The right-invariant quotient measure with the displayed Haar normalization.
- `ArithmeticStatisticsPartI.adelicBundleQuotientMeasure_volume`: Its total volume is `2/((q−1)²(q+1))`.
- `ArithmeticStatisticsPartI.adelicBundleMeasure_map`: After dividing by this volume, the pushforward to splitting indices is `bundleLaw`.

For the proof, use AdelicAlgebraicGroups AA.0 for restricted-product measure theory. Establish the function-field diagonal properties here on the valuation carriers. Apply `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul` from `TauCeti.MeasureTheory.Group.ProperlyDiscontinuous` to the free rational translation action, and use Mathlib's `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq` for independence of the domain. Prove right invariance from unimodularity. Glue local lattices to obtain the GL₂ bundle correspondence; quotienting by scalar ideles tensors by line bundles. The local central quotients identify this with `Γ\G/K`. The bundle equivalence is measurable for the discrete bundle-class sigma algebra. A K-orbit indexed by E has measure `1/#Aut(P(E))`, with automorphisms covering the identity of `P¹`; this group is `Aut(E)/𝔽_qˣ`. Thus its mass is `(q−1)/bundleAutOrder E`. Sum the masses using the splitting theorem and the balanced-bundle exception in natural bundle law. This proves finite nonzero quotient volume and the normalized pushforward, including the stabilizer factors.

*Needs:* AdelicAlgebraicGroups AA.0 (restricted-product measure theory), [bundle geometry](#support-bundle-geometry), [natural bundle law](#natural-bundle-law), `TauCeti.MeasureTheory.Group.ProperlyDiscontinuous`, Mathlib valuation completions, Haar measures and quotient-measure interfaces.

([[64]](#ref-64), Appendix A.1 pp.36–37 and A.4 pp.38–39; §4 pp.29–30 for the stabilizer masses. The quotient-volume formula follows here by summing those masses with `vol(K)=1`.)

**Checks.**

- At `q=3`, the balanced and first unbalanced K-orbits have measures `2/48=1/24` and `2/36=1/18`, respectively; a uniform law on bundle classes gives different weights.
- At `q=3`, the quotient volume is `1/8`. Normalization gives masses `1/3` and `4/9` at indices 0 and 1, agreeing with `bundleLaw`.
- Tensoring `O(3)⊕O(1)` by `O(−1)` preserves its double-coset class and index 2. Determinant degree modulo two distinguishes the balanced class from index 1; quotienting by line bundles preserves both parity sectors.

<a id="hecke-pushforward"></a>

**Hecke pushforward.** Fix `F=𝔽_q(t)`, A and K as in [function-field adelic bundle measure](#function-field-adelic-bundle-measure). For effective D on `P¹/𝔽_q`, choose local uniformizers and set `g_D=(diag(1,π_v^{ord_v D}))_v`. Push the normalized invariant finite-volume probability on `X=PGL₂(F)\PGL₂(A)` through `x↦(xK,xg_DK)`. This is `μ_D` on the pair of bundle classes. Its marginals are the natural inverse-automorphism law. Uniformly choosing neighboring isomorphism classes does not generally give this law: multiplicities and stabilizers must remain in the pushforward.

- `ArithmeticStatisticsPartI.heckePairPushforward_marginal`: The first marginal of a measurable pair map is its first pushforward.

- `ArithmeticStatisticsPartI.heckePairPushforward_probability`: A measurable pair pushforward of a probability is a probability.

- `ArithmeticStatisticsPartI.heckePairPushforward_dirac`: A point mass maps to the corresponding pair point mass.

For the proof, Use the quotient of `PGL₂(A)` for `F=𝔽_q(t)` and the normalized measure constructed in [function-field adelic bundle measure](#function-field-adelic-bundle-measure). Measurable quotient maps define the pushforward; right-translation invariance gives the second marginal.

*Needs:* [function-field adelic bundle measure](#function-field-adelic-bundle-measure), [natural bundle law](#natural-bundle-law), [stabilizer weighted orbit count](#stabilizer-weighted-orbit-count), `MeasureTheory.Measure.map` (Mathlib).

([[64]](#ref-64), Appendix A.4, Hecke Measures, pp.38–39 (arXiv v1).)

**Checks.**

- Identity translation gives a diagonal measure.

- A constant correspondence pushes every point to its constant pair.

- For distinct b,c, the pair pushforward of a Dirac mass along constant maps b,c differs from the reversed Dirac mass at `(c,b)`.

- For a rational degree-one divisor D, `μ_D(0,1)=μ_q(0)=(q−1)/(2q)`: every elementary modification of `O²` has splitting index 1. Indeed, the kernel of a surjection `O²→k(D)` is `O⊕O(−1)`, since constant changes of basis act transitively on its nonzero fibre functionals. At `q=3` this mass is `1/3`, whereas the parity-product candidate gives `8/27`.

### 0.19 Embedded types and infinity markings

<a id="wood-outside-involutions"></a>

**Wood outside involutions.** Use the already built Tau Ceti wreath product `W=G`≀`S₂` with its coordinate-permutation action. For `H≤W` define `c(H)={w∈H : w²=1 and its top permutation is nontrivial}`. These elements have exact order two. The canonical swap is (1,swap). Conjugacy means conjugacy by H, not by the ambient W.

- `ArithmeticStatisticsPartI.canonicalSwap`: The wreath element with trivial base and transposed coordinates.

- `ArithmeticStatisticsPartI.outside_ne_one`: An outside involution is not the identity.

- `ArithmeticStatisticsPartI.outside_conjugate`: Conjugating by H preserves the outside-involution set.

- `ArithmeticStatisticsPartI.outside_finite`: For finite G the outside set is finite.

For the proof, Reuse WreathProduct and its projections, multiplication and functorial map. Nontrivial top projection excludes the identity. The canonical swap has order two.

*Needs:* `TauCeti.WreathProduct` (Tau Ceti), `TauCeti.WreathProduct.map` (Tau Ceti).

([[50]](#ref-50), §1 p.1; §2.1 p.5, arXiv v2.)

**Checks.**

- The canonical swap is an outside involution in the full wreath group.

- The identity is excluded even though its square is one.

- When G is trivial, the full wreath group has one outside involution.

<a id="wood-admissible-type"></a>

**Wood admissible type.** For a finite G, `H≤G`≀`S₂` is admissible if it contains the canonical swap, is generated by its outside involutions, and the first-coordinate projection of ker(`H→S₂`) is onto G. All three conditions are required. Types are embedded subgroups, not abstract isomorphism classes.

- `ArithmeticStatisticsPartI.admissible_outside_nonempty`: Admissibility guarantees at least one outside involution.

- `ArithmeticStatisticsPartI.admissible_coordinate_surjective`: The top-kernel first coordinate is onto G.

- `ArithmeticStatisticsPartI.admissible_generated`: The outside involutions generate exactly H.

For the proof, Express generation as subgroup closure of the outside set, and the coordinate condition by elements of the top kernel. This definition uses the existing wreath structure.

*Needs:* [wood outside involutions](#wood-outside-involutions).

([[50]](#ref-50), §1 p.1; §2.2 Proposition 2.2 p.8, arXiv v2.)

**Checks.**

- For trivial G, the full `S₂` wreath group is admissible.

- The identity subgroup is not admissible.

- For nontrivial G the subgroup generated only by the canonical swap fails the coordinate condition.

- For `G=C₂`, the full wreath group contains the canonical swap and has surjective kernel-coordinate projection, but is not admissible: its two outside involutions generate only the order-four diagonal-times-swap subgroup, whereas the full wreath group has order eight.

<a id="wood-good-type"></a>

**Wood good type.** An admissible H is good when `c(H)` is one H-conjugacy class. This permits the common rigidification multiplicity `|c(H)|·|Aut_H(G)|`. Ambient conjugacy is insufficient, and the condition on the outside class is additional to admissibility.

- `ArithmeticStatisticsPartI.good_admissible`: Good types are admissible.

- `ArithmeticStatisticsPartI.good_conjugate`: Any two outside involutions are conjugate inside H.

- `ArithmeticStatisticsPartI.good_single_outside`: An admissible subgroup with at most one outside element is good.

For the proof, Use conjugation by elements of the subgroup itself. Admissibility supplies nonemptiness of the outside set, preventing a vacuous empty-class definition.

*Needs:* [wood admissible type](#wood-admissible-type).

([[50]](#ref-50), §1 p.1; Lemma 2.1 p.7, arXiv v2.)

**Checks.**

- The full wreath group for trivial G is good.

- The empty outside set in the identity subgroup is not good.

- For `G=C₂`, the diagonal G times swap subgroup is admissible but not good: its two outside involutions are distinct central elements.

<a id="wood-type-automorphisms"></a>

**Wood type automorphisms.** `Aut_H(G)` is the subgroup of `Aut(G)` whose diagonal functorial action on G≀`S₂` fixes H as an embedded subgroup. It is not `Aut(H)`. For an imaginary unrigid extension of type H, exactly `|Aut_H(G)|` rigid markings have the same embedded type.

- `ArithmeticStatisticsPartI.typeAutomorphisms_mem`: Membership is setwise preservation under the induced wreath map.

- `ArithmeticStatisticsPartI.typeAutomorphisms_finite`: The type-preserving automorphism group is finite for finite G.

- `ArithmeticStatisticsPartI.typeAutomorphisms_full`: Every automorphism preserves the full wreath subgroup.

For the proof, Use the already built wreath map induced by `α`:`G≃*G` on both base coordinates and identity on the top permutation. Identity, composition and inverse preserve the setwise stabilizer.

*Needs:* [wood admissible type](#wood-admissible-type), `TauCeti.WreathProduct.map` (Tau Ceti).

([[50]](#ref-50), §2.1.1 pp.5–6, arXiv v2.)

**Checks.**

- For `G=1`, the type automorphism count is one.

- For `G=C₂` the type automorphism count is one, although the full wreath group has eight elements.

- For `G=C₃` and H the full wreath subgroup, both automorphisms of `C₃` preserve H, so `|Aut_H(G)|=2`. A constant-one count fails this example.

- For `G=S₃`, `a=(12)`, let H be the graph `{(g,aga⁻¹):g∈G}` extended by the canonical swap. Type preservation requires commuting with conjugation by a. Since S₃ has trivial centre and all its automorphisms are inner, `|Aut_H(G)|=|C_G(a)|=2`, while `|Aut(G)|=6`.

<a id="wood-continuous-surjections"></a>

**Wood continuous surjections.** For a profinite `Γ` and finite discrete G, `Sur_c(Γ,G)` is the type of continuous surjective group homomorphisms. A kernel specifies an unmarked finite G-extension; the identifications of its quotient with G form an `Aut(G)`-torsor. A type-preserving fiber has `Aut_H(G)`-torsor size. Finiteness in the arithmetic application is a separate Hermite/Hurwitz theorem, not a consequence of G being finite.

- `ArithmeticStatisticsPartI.continuousSurjectionKernel`: The kernel is a subgroup; normality is inherited from the homomorphism.

- `ArithmeticStatisticsPartI.continuousSurjection_aut_action`: Postcomposition by an automorphism preserves surjectivity, and continuity when G is discrete.

- `ArithmeticStatisticsPartI.continuousSurjection_same_kernel`: Maps with the same kernel differ by a unique automorphism of G.

- `ArithmeticStatisticsPartI.continuousSurjectionPostcompose`: For discrete G, postcompose a continuous surjection with `α∈Aut(G)` to obtain another element of ContinuousSurjections `Γ G`.

- `ArithmeticStatisticsPartI.continuousSurjectionPostcompose_apply`: The underlying map evaluates to `α(ρ(x))`.

- `ArithmeticStatisticsPartI.continuousSurjectionPostcompose_kernel`: Postcomposition by `α` leaves the kernel unchanged.

For the proof, Take the surjective subtype of Mathlib’s continuous monoid homomorphisms; group domains make these group homomorphisms. Two maps with equal kernels differ by exactly one automorphism of the finite quotient. Use the type automorphism subgroup when preserving the embedded image.

*Needs:* `ContinuousMonoidHom` (Mathlib), [wood type automorphisms](#wood-type-automorphisms).

([[50]](#ref-50), §1.4 p.5; §2.1 pp.5–7, arXiv v2.)

**Checks.**

- There is one continuous surjection to the trivial group.

- There is no surjection from the trivial group to a nontrivial finite group.

- The reduction `C₄→C₂` is an element of ContinuousSurjections with nontrivial kernel; replacing the carrier by continuous embeddings fails this test.

<a id="wood-infinity-and-type-adapter"></a>

**Wood infinity and type adapter.** For Q or `𝔽_q(t)`, fix a separable closure and the specified infinity embedding. `K^(un,∞)` is the maximal extension unramified at every finite place and split at all places above infinity; it is the full extension, without a prime-to quotient. Imaginary number fields have nonsplit archimedean infinity; in the function-field case choose specifically the completion `𝔽_q((t⁻¹))(√t)`, excluding the other nonsplit squareclass. Real means infinity splits. An imaginary marked surjection obtains a canonical outside involution from infinity and hence an actual embedded wreath image H. In the real case one instead chooses an outside order-two twist y; the rigid object is the pair `(ρ,y)`.

- `ArithmeticStatisticsPartI.woodFullUnramifiedInfinityGroup`: Full profinite Galois group of `K^(un,∞)/K`, with its finite-quotient classification.

- `ArithmeticStatisticsPartI.woodImaginaryType`: Image of the infinity-marked normal-closure embedding in the built wreath product.

- `ArithmeticStatisticsPartI.woodRealTwistType`: Image of the normal-closure embedding attached to a real pair `(ρ,y)`.

- `ArithmeticStatisticsPartI.woodType_admissible`: Every resulting embedded type is admissible (Wood Proposition 2.2).

For the proof, Import the marked arithmetic extension and normal-closure embedding. Verify the full universal extension has the continuous finite-quotient classification. Construct the full group here as the Galois group of the union of all finite unramified split-infinity extensions; prove its finite-quotient universal property and its maximal prime-to-`Δ` comparison with InverseGaloisAndArithmeticFundamentalGroups §IG.4. For an index-two kernel and chosen `y²=1` outside it, the two base coordinates are restriction to L and its y-conjugate; y maps to the canonical swap.

*Needs:* [wood continuous surjections](#wood-continuous-surjections), [wood outside involutions](#wood-outside-involutions), InverseGaloisAndArithmeticFundamentalGroups:IG.4/marked-arithmetic-extensions, InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-`γ`-groups, InverseGaloisAndArithmeticFundamentalGroups:IG.4.

([[50]](#ref-50), §2.1 pp.5–7, arXiv v2.)

**Checks.**

- With `Δ=3`, a continuous unramified split-infinity quotient `C₃` is retained by the full group. Its homomorphisms all become trivial after replacing that group by its maximal prime-to-3 quotient; the full interface cannot use that replacement.

- Over `𝔽₃((t⁻¹))`, the ramified quadratic completions obtained by adjoining `√t` and `√(2t)` have different squareclasses, since 2 is a nonsquare unit. Only the first satisfies the chosen imaginary-infinity condition.

- In the admissible `C₂²` type for `G=C₂`, both `τ` and `(g,g)τ`, with g the nonidentity element of `C₂`, are outside involutions and differ. For split real infinity the pair `(ρ,y)` retains this choice rather than selecting an inertia generator.

### 0.20 Exact quadratic function-field slices

<a id="imaginary-exact-slice-parametrization"></a>

**Imaginary exact slice parametrization.** Let q be odd and `n ≥ 1`. The quadratic extensions K of `𝔽_q(t)` whose completion at `∞` is `𝔽_q((t⁻¹))(√(t))` (Wood's imaginary infinity type) and whose discriminant has `norm q^{2n}` (Wood's slice `IQ_{=q^{2n}}`) are exactly the fields `𝔽_q(t)(√f)` for f monic squarefree of degree `2n − 1`, each obtained from exactly one f. Consequently `#IQ_{=q^{2n}} = q^{2n−1} − q^{2n−2}` for `n ≥ 2` and `= q` for `n = 1`.

q odd `n ≥ 1` Wood's imaginary infinity type fixes the square class of the leading coefficient (the completion at `∞` is the one generated by `√t`)

For the proof, A quadratic extension of `𝔽_q(t)` is `𝔽_q(t)(√f)` with `f ∈ 𝔽_q[t]` squarefree, unique up to `(𝔽_q^×)²` ([odd degree quadratic function field family](#odd-degree-quadratic-function-field-family)). The place `∞` ramifies iff deg f is odd; for odd deg f the completion at `∞` is `𝔽_q((t⁻¹))(√(a t))` with a the leading coefficient, and it equals the prescribed one iff a is a square; choosing the square-class representative with `a = 1` gives a unique monic f. The discriminant divisor is the zero divisor of f plus the ramified place `∞`, of degree `deg f + 1`, so `norm q^{2n} ⇔ deg f = 2n − 1`. The count is [count of squarefree monic polynomials over a finite field](#count-of-squarefree-monic-polynomials-over-a-finite-field) in degree `2n − 1`.

*Needs:* [odd degree quadratic function field family](#odd-degree-quadratic-function-field-family), [count of squarefree monic polynomials over a finite field](#count-of-squarefree-monic-polynomials-over-a-finite-field), [wood infinity and type adapter](#wood-infinity-and-type-adapter).

([[50]](#ref-50), Proof of Theorem 4.8, p.24 (arXiv v2; Duke 168, p.408).)

**Checks.**

- `n = 1`: `IQ_{=q²}` consists of the q fields `𝔽_q(t)(√(t − c))`, `c ∈ 𝔽_q`.

- The other ramified square class at `∞` (leading coefficient a nonsquare) is excluded from IQ; it belongs to neither IQ nor RQ (Wood §2 p.5).

- For `q=3` and `n=2`, the count is `3³−3²=18`. The factor-two count of all odd-degree leading squareclasses would give 36 and is incorrect for this infinity slice.

<a id="real-exact-slice-parametrization"></a>

**Real exact slice parametrization.** Let q be odd and `n ≥ 1`. The quadratic extensions K of `𝔽_q(t)` split completely at `∞` and with discriminant of `norm q^{2n}` (Wood's slice `RQ_{=q^{2n}}`) are exactly the fields `𝔽_q(t)(√f)` for f monic squarefree of degree `2n`, each from exactly one f. Hence `#RQ_{=q^{2n}} = q^{2n} − q^{2n−1}`. The place `∞` contributes nothing to the discriminant.

q odd `n ≥ 1`

For the proof, `∞` splits in `𝔽_q(t)(√f) iff deg f` is even and the leading coefficient is a square in `𝔽_q`; normalise it to 1. `∞` is then unramified, so the discriminant divisor is the zero divisor of f, of degree deg f; `norm q^{2n} ⇔ deg f = 2n`. Count by [count of squarefree monic polynomials over a finite field](#count-of-squarefree-monic-polynomials-over-a-finite-field) in degree `2n ≥ 2`.

*Needs:* [odd degree quadratic function field family](#odd-degree-quadratic-function-field-family), [count of squarefree monic polynomials over a finite field](#count-of-squarefree-monic-polynomials-over-a-finite-field), [wood infinity and type adapter](#wood-infinity-and-type-adapter).

([[50]](#ref-50), Proof of Theorem 4.8, real case, p.25 (arXiv v2; Duke 168, p.410).)

**Checks.**

- `n = 1`: `q² − q` fields.

- The discriminant exponent is `Σ n_i = 2n`, not `Σ n_i + 1`.

- The case `n=0` is excluded: the monic constant 1 defines the split algebra `𝔽_q(t)×𝔽_q(t)`, not a quadratic field in RQ.

### 0.21 Rigid averages and root-of-unity refinements

<a id="wood-average-normalizations"></a>

**Wood average normalizations.** Use the discriminant family, restricting its base to the prescribed imaginary or real infinity type. The imaginary rigid numerator sums type-H continuous surjections; the real numerator sums type-H pairs `(ρ,y)`. Divide both by the number of quadratic base fields in the same carrier. Over Q use `|Disc(K)|≤X` for a height average; over `𝔽_q(t)` use exact `|Disc(K)|=q^(2n)` slices when applying [§0.20’s exact parametrizations](#imaginary-exact-slice-parametrization). A genuinely empty slice is assigned zero at the finite level; a claimed limiting statement must specify a sequence of inhabited slices. For fixed unmarked extensions the imaginary multiplicity is `|Aut_H(G)|`; in the good real case it is `|c(H)|·|Aut_H(G)|`.

For the proof, Restrict the base carrier, then use the weighted count with the exact rigid fiber count as weight. Kernel fibers give the imaginary torsor factor. For real good H, Wood Lemma 2.1 conjugates twists inside the top kernel and counts `c(H)` choices, each with the same type-preserving automorphism fiber. Do not identify exact and cumulative slices. The function-field imaginary monic family is one leading-coefficient squareclass, not all odd-degree squarefree equations.

*Needs:* [number fields ordered by discriminant](#number-fields-ordered-by-discriminant), [imaginary exact slice parametrization](#imaginary-exact-slice-parametrization), [real exact slice parametrization](#real-exact-slice-parametrization), [wood good type](#wood-good-type), [wood type automorphisms](#wood-type-automorphisms), [wood infinity and type adapter](#wood-infinity-and-type-adapter), InverseGaloisAndArithmeticFundamentalGroups:IG.4.

([[50]](#ref-50), §§2.1.1–2.1.2 pp.5–7, Lemma 2.1 p.7, arXiv v2.)

**Checks.**

- For `G=1` on an inhabited imaginary slice each base contributes one surjection and the average is one.

- An empty finite slice has assigned average zero.

- Two markings per extension multiply the numerator but not the base denominator.

<a id="wood-root-unity-and-tame-comparison"></a>

**Wood root unity and tame comparison.** Wood’s correction is the `|μ_K|`-torsion subgroup of the reduced multiplier `H₂(H,c)`, where `μ_K` is the roots-of-unity group of the base global field K. Over Q use 2; over `𝔽_q(t)` use `q−1`. Use InverseGaloisAndArithmeticFundamentalGroups:IG.3 for the reduced multiplier. Restricting the quadratic base to the tame subfamily changes the denominator too. Moment counts refined by invariant value partition the rigid numerator; summing them does not by itself prove the arithmetic distribution law.

Over Q, compare with the global arithmetic lifting invariant of IG.4, retaining its tame, good/admissible, marked-cover and infinity hypotheses. Over `𝔽_q(t)`, define the `q−1` torsion correction and partition tame marked-cover counts using IG.3's Tate-twisted component invariant and IG.5's Hurwitz-component interface. In this finite-field construction require characteristic coprime to |H| and retain the chosen reduced cover, exact class degrees and infinity marking. Components are identified with invariant values only in the supplier's stable generating multidegree range, and rational components require Frobenius-fixed values.

For the proof, Reuse the reduced multiplier and its torsion subgroup. Check root-of-unity orders for the two bases. Apply finite partition identities to the already defined rigid fibers and the same tame base slice.

*Needs:* InverseGaloisAndArithmeticFundamentalGroups:IG.3 (reduced multiplier, marked cover and Tate-twisted arithmetic lifting invariants), IG.4 (global arithmetic lifting invariant over Q), IG.5.6 (specialization and component lifting invariants), [wood average normalizations](#wood-average-normalizations).

([[50]](#ref-50), Conjecture 1.1 p.1 and §3 Definition 3.1 pp.8–9, arXiv v2. The predicted distribution remains conjectural.)

**Checks.**

- For a reduced multiplier `C₃`, 2-torsion has size 1 while 6-torsion has size 3; the `q−1` correction can depend on q.

- For a reduced multiplier `C₄`, the torsion subgroup has size 2 over `𝔽₃(t)` and size 4 over `𝔽₅(t)`. Using the characteristic instead of `q−1` gives the wrong sizes.

- If four base fields include two tame ones and the tame rigid numerator is 2, the tame average is `2/2=1`. Dividing that numerator by all four base fields would instead give `1/2` and is a different average. An empty tame slice has finite-level average zero.

### 0.22 Symmetric pencils and binary-form orders

<a id="refinement-symmetric-pencil"></a>

**Symmetric pencil.** Let `Wₙ(R)` be pairs `(A,B)` of symmetric `n×n` matrices over a commutative ring. Define `f_A`,`B(x,y)=(−1)^{n(n−1)/2}det(xA−yB)`, represented by coefficients `f_i` of `x^{n−i}y^i`. `SLₙ` acts by simultaneous congruence. For even `n≥2` the scalar `μ₂` acts trivially, giving a group-scheme action of `SLₙ/μ₂`. Its R-points generally exceed `SLₙ(R)/μ₂(R)`. For `n≥1`, over C the invariant ring of `SLₙ` is the polynomial ring in the `n+1` determinant coefficients.

`ArithmeticOrbitRefinement.symmetricPencil_invariants` in `Suggested.lean` states generation and algebraic independence over C by unique polynomial expressions in the determinant coefficients. The geometric actions and invariant-ring theorem require `n≥1`; the coefficient constructor and its determinant identities allow `n=0`, when the sole coefficient is 1 and the invariant ring over C is C. No halving of off-diagonal entries: these are bilinear Gram matrices. Arithmetic solubility later requires a field of characteristic not2 and nonzero discriminant.

- `ArithmeticOrbitRefinement.pencilInvariant`: For any two `n×n` matrices, return the `n+1` coefficients of the signed determinant; restrict to symmetric matrices for `Wₙ`.

- Replacing A,B by `gAgᵀ`,`gBgᵀ` multiplies every coefficient by `det(g)²`.

- For `A=aIₙ` and `B=bIₙ` the invariant is `(−1)^{n(n−1)/2}(ax−by)ⁿ`.

For the proof, Expand the determinant universally, checking homogeneity. Congruence multiplies the invariant by `det(g)²`. The two scalar factors cancel for the `μ₂` action. The invariant-ring theorem is used over C as in the source; an integral invariant-ring theorem is not inferred from it.

*Needs:* `Matrix.IsSymm` (Mathlib), `Matrix.det` (Mathlib).

([[73]](#ref-73), §2, (1)–(2), pp.6–7; BSWII §3.1, (1), pp.7–8.)

**Checks.**

- For `n=1`, the coefficient vector is `(a,−b)`.

- For `n=3` and `A=I₃`,`B=0`, `f=−x³`; the sign is not positive.

- For `n≥1`, `A=B=0` gives the zero binary form.

- At `n=0`, the empty determinant gives the coefficient vector `(1)`. The relation `f₀−1=0` excludes algebraic independence; the invariant ring is C.

<a id="refinement-binary-discriminant"></a>

**Binary discriminant.** Use the fixed-degree universal binary discriminant `Δ_n` of [binary discriminant](#binary-discriminant). For `n≥2`, identify it with the signed universal resultant quotient `Res(F,F′)/a₀`, where the universal divisibility is established before specializing `a₀`. At degree 3 it agrees with the binary-cubic discriminant, at degree 4 with Layer 0’s quartic invariant discriminant. The later refinement-binary-form-order target supplies the trace-discriminant equality for its associated rank-n order, using this normalization. Leading-zero specializations use `Δ_n`, not the lower-degree affine discriminant. ArithmeticOrbitRefinement.binaryDiscriminant is the evaluation interface for the same Layer 0 polynomial, not a second construction.

The homogeneous degree n is fixed even when the dehomogenized polynomial drops degree.

- `ArithmeticOrbitRefinement.binaryDiscriminant`: Evaluate the universal discriminant supplied by Layer 0 in the symmetric-pencil coefficient convention.

- Coefficient ring maps commute with `Δₙ`.

- For `n≥2`, `Δₙ(tf)=t^{2n−2}Δₙ(f)`.

For the proof, Compare the Layer 0 discriminant polynomial with the signed universal resultant quotient over Z, establishing divisibility before evaluating the leading coefficient. Compare on a splitting algebra with `f₀^{2n−2}` times the squared product of root differences, then specialize the polynomial identity. The associated-order comparison is proved in refinement-binary-form-order after that order is constructed.

*Needs:* [binary discriminant](#binary-discriminant), [symmetric pencil](#refinement-symmetric-pencil), [discriminant of the cubic ring of a form](#discriminant-of-the-cubic-ring-of-a-form), [invariants height and eligible pairs](#invariants-height-and-eligible-pairs), `Matrix.det` (Mathlib), `MvPolynomial.eval₂` (Mathlib).

([[72]](#ref-72), §2.1, p.3; BGW §2, pp.6–7.)

**Checks.**

- For `ax²+bxy+cy²` the value is `b²−4ac`.

- For the cubic `xy(x−y)`, with leading coefficient zero, `Δ₃=1`.

- For `n≥2`, `Δₙ(xⁿ)=0`.

<a id="refinement-binary-form-order"></a>

**Binary form order.** Let D be a Dedekind domain with fraction field K, `n≥3`, and f a binary n-ic form with `f₀≠0` and `Δ≠0`. In `L=K[t]/(f(t,1))`, with `θ` the image of t, set `ζ_i=Σ_{j=0}^{i−1}f_j θ^{i−j}`. The D-lattice `R_f=⟨1,ζ₁,…,ζ_{n−1}⟩` is a ring. For `0≤k≤n−1`, `I_f(k)=⟨1,θ,…,θᵏ,ζ_{k+1},…,ζ_{n−1}⟩` is an `R_f`-stable full lattice. `Disc R_f=Δ(f)`, and `f′(θ)⁻¹I_f(n−2)` is its trace dual. L can be a product of fields; it is not assumed a domain.

D is a Dedekind domain; `char K≠2` for the consuming pencil theorem. The quotient has degree n and is separable. `ArithmeticOrbitRefinement.formIdeal_traceDual` in `Suggested.lean` states the trace-dual formula on a finite-dimensional commutative K-algebra generated by a root of f; it allows products of fields.

- `ArithmeticOrbitRefinement.formOrder`: The D-subalgebra generated by 1 and `ζ_i`; its underlying module equals their D-span under the hypotheses.

- `ArithmeticOrbitRefinement.formIdeal`: Return the displayed D-span defining `I_f(k)`.

- `ArithmeticOrbitRefinement.formIdeal_traceDual`: Under the trace pairing, the dual order is `f′(θ)⁻¹I_f(n−2)`.

- If `θ` satisfies `f(θ,1)=0` and `n≥3`, the underlying D-module of formOrder is the D-span of 1,`ζ₁`,`…`,`ζ_{n−1}`. This identifies the subalgebra constructor with the displayed order lattice.

- For `0≤k≤n−1` and `f(θ,1)=0`, multiplication by each element of formOrder preserves `formIdeal f θ k`.

For the proof, Construct the lattices as native D-submodules of the quotient algebra. Check their multiplication on the displayed generators. The triangular change from power coordinates establishes full rank, the discriminant equality and the trace-dual formula. Treat general ideals as lattices in a finite étale algebra, not FractionalIdeal D L with an invalid field assumption.

*Needs:* [binary discriminant](#refinement-binary-discriminant), `Submodule.span` (Mathlib), `Algebra.adjoin` (Mathlib), `Algebra.trace` (Mathlib), `AdjoinRoot.root` (Mathlib), `IsFractionRing` (Mathlib), `IsDedekindDomain` (Mathlib), `LinearMap.mulLeft` (Mathlib).

([[73]](#ref-73), §2, pp.6–7, before Theorem16.)

**Checks.**

- If `f₀=1`, `R_f=D[θ]`.

- `I_f(0)` is the D-module of `R_f`.

- For `f=2x⁴−y⁴` over Z, `R_f` has basis 1,`2θ`,`2θ²`,`2θ³` and does not contain `θ`, even though `θ` lies in its rational algebra.

### 0.23 Binary discriminant congruences and monic local formulas

<a id="stickelberger-binary"></a>

**Stickelberger binary.** For every integral binary n-ic form with `n≥2`, `Δ_n` is congruent to 0 or 1 modulo 4. `binaryDisc_mod_four` in `Suggested.lean` states the universal congruence. In particular `2|Δ_n` implies `4|Δ_n`, so weak square divisibility at 2 is empty. The theorem includes leading-zero forms.

- `ArithmeticStatisticsPartI.binary_no_weak_two`: The binary weak `2²`-locus is empty.

For the proof, establish the universal binary polynomial congruence before specialization, so the degree-two and leading-zero cases are included. For `n≥3`, nonzero leading coefficient and nonzero discriminant, the binary-form order of §0.22 gives the equivalent trace-discriminant proof. That order's hypotheses are not imposed on the universal statement. The polynomial discriminant modulo 4 is the square of an integral polynomial modulo 4, so it depends only on the coefficients modulo 2. Thus if 4 divides one discriminant, it divides every discriminant in that coefficient class modulo 2, which is precisely strong divisibility.

*Needs:* [binary discriminant](#binary-discriminant), [binary form order](#refinement-binary-form-order), [strong weak discriminant](#strong-weak-discriminant).

([[59]](#ref-59), §1 p.2 and Appendix A pp.54–55.)

**Checks.**

- The leading-zero quadratic xy has `Δ=1`, so it belongs to neither square-divisibility locus at 2.

- The leading-zero quadratic `y²` has `Δ=0`. Every coefficient perturbation modulo 2 has discriminant divisible by 4, so it belongs to the strong locus.

- The quadratic `x²−y²` has `Δ=4` and is strongly divisible at 2; it is not a weakly divisible example. In contrast `x²+xy−y²` has `Δ=5`, in the other allowed residue class modulo 4.

<a id="monic-density-formulas"></a>

**Monic density formulas.** For prime p, `ν₀(0,p)=ν₀(1,p)=1` and `ν₀(n,p)=1−1/p` for `n≥2`. At `p=2`, `ν₁(n,2)=0`. For odd p, `ν₁(0,p)=ν₁(1,p)=0`, `ν₁(2,p)=p⁻¹(1−p⁻¹)`, and for `n≥3`, `ν₁(n,p)=(1−p⁻¹)²(1−(−p)^(2−n))/(p+1)`. Thus `λ_n(p)=ν₀+ν₁` equals 1 for `n≤1`, `1/2` at `p=2`,`n≥2`, `1−1/p²` for `n=2`, odd p, and `1−[3p^(n−1)−p^(n−2)+(−1)^n(p−1)²]/[p^n(p+1)]` for `n≥3`, odd p. The exponent `2−n` is essential.

- `monic_nu_zero` in `Suggested.lean`: the unit-discriminant formula for `n≥2`. Degrees zero and one have unit-discriminant mass one.

- The valuation-one formula has exponent `2−n`, with p=2 and degrees at most one assigned zero.

- `monic_nu_one` in `Suggested.lean`: for `n≥2` the finite count equals the displayed valuation-one formula, including the prime-two and quadratic cases.

For the proof, Squarefree residue polynomials give generating series `(1−t²/p)/(1−t)`. A single repeated linear factor, a squarefree complementary factor avoiding it, and a nonvanishing first-order lift give `H(t)=(p−1)t²/p² · (1−t²/p)/((1−t)(1+t/p))`. Extract coefficients; this yields exponent `2−n`, also at `n=3`. Combine the two strata algebraically.

*Needs:* [monic local proportions](#monic-local-proportions), [stickelberger binary](#stickelberger-binary).

([[60]](#ref-60), Proposition 6.4 p.371; Proposition 6.7 and Theorem 6.8 with proof pp.372–373; [[58]](#ref-58), §1 pp.1–2, formulas for `λ_n(p)`.)

**Checks.**

- The monic quartic at `p=3` has `ν₀=2/3`, `ν₁=8/81` and `λ=62/81`; these counts disagree with exponent `−n`.

- In degrees zero and one the discriminant is 1: `ν₀=λ=1` and `ν₁=0` at every prime. The degree-zero polynomial is the constant 1.

- Among the 81 monic quadratics modulo 9, 54 have discriminant prime to 3 and 18 have valuation exactly one; thus `ν₀=2/3`, `ν₁=2/9` and `λ=8/9`.

- At `p=2` in degree two, `ν₀=1/2`, `ν₁=0` and `λ=1/2`. A residue class of valuation exactly one would contradict the discriminant congruence modulo 4.

### 0.24 Monic local Euler factors

<a id="monic-euler-products"></a>

**Monic euler products.** For `n≥2` set `λ_n=`product over all primes of `λ_n(p)`, with `λ_n(p)=ν₀(n,p)+ν₁(n,p)`. The product converges to a strictly positive real number because its factors are positive and `1−λ_n(p)=O_n(p⁻²)`. As `n→∞` it tends to `(1/2)` times the product over odd primes of `[1−(3p−1)/(p²(p+1))]`. For degree two `λ₂=4/π²`. Identifying these local Euler constants with global family densities requires an infinite-prime tail estimate as a hypothesis.

- `ArithmeticStatisticsPartI.monicEulerProduct`: The product over prime local factors.

- `monicEulerProduct_converges_pos` in `Suggested.lean`: for `n≥2` the prime factors form a convergent product with strictly positive value.

- `monicEulerProduct_limit` in `Suggested.lean`: the products tend to the limiting odd-prime product.

For the proof, Separate the factor at 2. Bound the defect at odd p by a summable constant times `p⁻²` uniformly for `n≥2`. Establish nonzero convergence from positivity and the defect bound. Pointwise convergence plus the uniform product tail permits exchanging the degree limit and the product.

*Needs:* [monic density formulas](#monic-density-formulas).

([[58]](#ref-58), §1 pp.1–2, constants `λ_n` and limiting `λ`.)

**Checks.**

- At 2 every degree≥2 monic factor is `1/2`.

- The monic quartic factor at 3 is `62/81`.

- The quadratic global local-product constant is `4/π²`.

### Supporting constructions

<a id="support-bundle-geometry"></a>

For the rank-two bundle probability, prove `p1RankTwo_split`: over a field k every rank-two finite locally free sheaf E on `P¹` has a unique ordered splitting type `(a,b)`, `a≥b`, with `E≅O(a)`⊕`O(b)`. The vector-bundle carrier, tensor and degree are those of AlgebraicVectorBundles L0 and JacobianChallenge A–C. Define `p1BundleIndex E=a−b`; prove `p1BundleIndex_tensor`, invariance under tensoring by `O(m)`, and `p1BundleIndex_eq`, agreement with the normalized bundle-class index. To prove splitting, choose the largest a with a nonzero section of `E(−a)`. Saturation gives a line subbundle `O(a)`, with quotient `O(b)`. Maximality and `H¹(O(−1))=0` force `b≤a`; then `H¹(O(a−b))=0` splits the extension. Existence of the extremal twist uses coherent-sheaf finiteness and generation after a sufficiently positive twist. This is the rank-two projective-line theorem consumed here. ([[64]](#ref-64), §1 pp.3–4; §4 p.29.)

For a finite flat separable double cover `π`:`C→P¹` with C smooth, proper and geometrically connected of genus g, prove `hyperelliptic_pushforward_rank_two` and `hyperelliptic_pushforward_degree`: `π_*L` is rank two and has degree `deg L−g−1` for every line bundle L. Prove `hyperelliptic_pushforward_sections`, the equality of section spaces, and `hyperelliptic_involution_index`: `σL=(deg L)κ−L` in Pic(C), where `κ=π*O(1)`, and `π_*σL≅π_*L`. The norm identity `L⊗σ*L≅π`*Nm(L) and Pic(`P¹`)`=Z` give the former; `πσ=π` gives the latter. Define `thetaClasses d` as the degree-d line-bundle classes admitting a nonzero section, with the empty set for `d<0`. These are the `Θ_d` used in the `θ`-tail counts. The finite-field statistical formulas use these targets with `k=𝔽_q`. ([[64]](#ref-64), §4 Lemma 4.1 pp.29–30 and `θ` displays pp.30–33.)

**Checks.**

- `E=O(3)`⊕`O(1)` has ordered type `(3,1)` and index 2. Tensoring by `O(−1)` gives type `(2,0)` and the same index; using `a+b` as the index fails.
- For the genus-zero double cover `P¹→P¹` of degree two, `π_*O_C=O`⊕`O(−1)`, of degree `−1` and index 1; a degree-one line bundle on C pushes to O⊕O, of degree 0 and index 0.
- `Θ₀` consists only of the trivial line bundle and `Θ_d` is empty for `d<0`. On the pointless genus-two curve of [the regression example](#pointless-curve-regression), `Θ₁(𝔽₃)` is empty although Pic¹(`𝔽₃`) has four classes; all Picard classes cannot be used in place of the section locus.

<a id="support-squareclasses"></a>

For the number-field squareclass height, prove the finite-fibre description over a squarefree support ideal using `Cl(F)[2]`, units modulo squares and the prescribed archimedean signs. In each nonempty finite local rectangle prove `#Σ(H<X)=c_Σ X+o(X)` with `c_Σ>0`, counting each squareclass once. Representatives are chosen by finitely many ideal classes and a unit fundamental domain; the nonarchimedean local measure is the pullback of additive Haar on integral representatives. Decompose finite unions of coupled residue conditions into disjoint rectangles. The zero-mass and empty cases remain separate. BKLOS §2 p.2 ([[3]](#ref-3)) fixes the height and local-measure convention. Prove the denominator expansion here: expand the squarefree condition by ideal Möbius inversion, express finite local conditions and support-class constraints using characters of a fixed ray class group, and apply GlobalNumberFields Layer 3's ray-class ideal counts and AnalyticNumberTheoryPartI §§2.3–2.5's Hecke/Dedekind residue comparisons. The nontrivial character main terms cancel; the square-ideal tail is summable, giving the residue constant and an `o(X)` remainder. Prove positivity for inhabited local rectangles from their local masses. Over Q the six squarefree residues modulo eight have equal relative mass `1/6`.

**Checks.**

- Over Q, the positive and negative squareclass families each have count `X/ζ(2)+o(X)` at absolute squarefree height X; the unrestricted constant is `2/ζ(2)`.
- Positive squarefree integers in each of the six admissible residues modulo eight have count `X/(6ζ(2))+o(X)`; the union of residues 1, 2 and 3 has half the positive-squarefree denominator.
- A local condition excluding every squareclass gives zero count at every cutoff. It has no positive leading constant.

<a id="support-abelian-counts"></a>

For finite-field abelian counts, use the native isogeny and polarization carriers. Import `simpleEndDivision` from AbelianSchemesAndArithmeticModuli §A6.4 and `poincareReducibility`, including unique simple-factor multiplicities, from §A6.5. Prove the finite-field Honda–Tate classification: simple isogeny classes correspond to conjugacy classes of Weil q-numbers, with the endomorphism division algebra's local invariants and the dimension specified by [[74]](#ref-74), Theorem 1(i)–(ii), p.96. The additional counting targets here are integral class-set finiteness within each isogeny class, finiteness of unpolarized classes at fixed q and dimension, and finiteness of principal-polarization orbits. Use Lipnowski–Tsimerman ([[63]](#ref-63)), §§2–3 pp.5–13 for isogeny/isomorphism finiteness and §4.4 Proposition 4.11 p.20 for the polarization-orbit description, imported geometrically from AbelianSchemesAndArithmeticModuli §§A6.18–A6.19. Import Lang and torsor triviality from ReductiveGroupsPartII §RG2.3.7 to obtain `H¹(𝔽_q,A)=0`, and use SchemeAndStackFoundations §3.6 for finite-field line-bundle descent. Retain `#pol(A)` when changing the probability denominator.

**Checks.**

- Dimension zero has one unpolarized class and one principally polarized class, with empty simple-factor decomposition; it is not a simple abelian variety.
- For an elliptic curve E, `E²` has simple-factor multiplicity two and rational endomorphism algebra `M₂(End⁰(E))`, not a division algebra. Unique multiplicities and division apply on the imported simple factors.
- On `E⁸/𝔽₅` for `E:y²=x³−x`, the polarization fibre has at least two orbits by [polarization fiber count](#polarization-fiber-count). Its finiteness does not make it a singleton or justify replacing its size by 1.

<a id="support-function-fields"></a>

For a smooth proper geometrically connected curve C over an odd finite field `𝔽_q`, relate rational divisor classes, ideal classes after removing infinity, and `J(𝔽_q)` by the degree exact sequence. A rational relative Picard point descends to a line bundle because the finite-field Brauer obstruction vanishes. ArithmeticGaloisDuality §R02.3.2 supplies `GlobalFunctionField.classFormation`, global/local Artin compatibility, abelian norm-group correspondence, `sClassGroup` and `finite_sClassGroup`. For a finite nonempty removed-place set S, transport that reciprocity to `Pic(C)/⟨[v]:v∈S⟩`: unramified abelian covers split at every v in S precisely when their Artin maps kill these classes. With `d=gcd(deg(v):v∈S)` and `L=⟨[v]:v∈S⟩`, retain the exact sequence `0→J(𝔽_q)/(L∩J(𝔽_q))→Pic(C)/L→ℤ/dℤ→0`. Use the supplied norm compatibility for pushforward of divisors. For a quadratic hyperelliptic model distinguish ramified infinity, split infinity and nonsplit infinity. The real exact slice counts the split case and its marked points, not all even-degree equations. Sources are EVW, §8, pp. 776–782, and Wood, §§2–4, pp. 4–25 in arXiv:`1702.04644v2`. The Picard/Brauer machinery comes from SchemeAndStackFoundations §§3.6–3.7; the field and infinity specialization is proved here.

**Checks.**

- On `P¹/𝔽_q`, removing a rational place gives trivial S-class group: Pic is ℤ and the removed class has degree one.
- On `P¹/𝔽_q`, removing a single degree-two place gives S-class group `ℤ/2ℤ`. The unramified constant quadratic extension splits at this place; replacing the quotient by `J(𝔽_q)=0` loses it.
- Removing places of degrees two and three on `P¹/𝔽_q` gives trivial S-class group since their degrees generate ℤ. For two rational infinity places on a hyperelliptic curve, the degree quotient is trivial and the kernel is `J(𝔽_q)/⟨[∞₁−∞₂]⟩`.

The hypersurface adapter identifies degree-d homogeneous forms with the native monomial-indexed coefficient space of rank `binomial(n+d,d)` using the Veronese monomials, not an arbitrary enumeration with a hidden degree shift. For the local statistic `σ(a;Q)=Q^(−n)# {primitive x mod Q:f_a(x)=0}`, prove residue dependence, CRT multiplicativity for coprime positive moduli and the normalization at `Q=1`. It is an intensity, not necessarily a probability. These are the interfaces used by the later incidence and variance calculations ([[46]](#ref-46), Definition 2.1 p.4 for the monomial-indexed Veronese vector; (5.2)–(5.3) p.50 for primitive residues and σ; (5.11) p.53 for CRT multiplicativity). At `Q=1` the sole residue vector is primitive and solves every equation, so `σ(a;1)=1` follows directly from the finite count here.

### Examples

For integers of height absolute value, the inclusive count at three is seven and the strict count is five. The height on a rational coefficient line is not Northcott without a denominator restriction: infinitely many rationals lie in `[0,1]`.

The coefficient reversal sends `x⁴-y⁴` to `y⁴-x⁴`, preserves I, J and `Δ`: the substitution determinant is `−1` and its fourth, sixth and twelfth powers are all 1. The nonzero-J witness `x⁴+xy³` reverses to `y⁴+x³y`, and both have `J=−27`. In contrast a scalar substitution multiplies the ordinary invariants by powers eight and twelve. A scalar matrix acts trivially for the determinant-to-the-minus-two action. The pair `(I,J)=(−12,0)` has `27Δ=−6912=4(−12)³`, fixing the discriminant convention.

At degree zero the monic polynomial is one, with discriminant one; a strict weighted box at a positive bound has one empty vector. Over `𝔽_q` the squarefree monic counts begin `1,q,q²-q`, so the formula `q^n-q^(n-1)` is restricted to `n≥2`. The odd quadratic exact slice at its smallest degree has q monic polynomials, not `q-1`.

In characteristic three, comparing `x³y−xy³` with the zero form gives equal I and J but distinct discriminants. Thus the integral identity `27Δ=4I³−J²` cannot recover Δ by division in characteristic three. The finite-field squarefree count has separate degree-zero and degree-one formulas; the strict weighted-box count retains its ceiling cutoff.

<a id="pointless-curve-regression"></a>

#### A curve without rational points

For the smooth projective model `C/𝔽₃` of `y²=2((x³−x)²+1)`, take the explicit point data `#C(𝔽₃)=0` and `#C(𝔽₉)=14` as hypotheses. Its genus is 2 and Riemann–Roch then gives `#J(𝔽₃)=4`. Consequently Q has eight elements. Its exact bundle pushforward has `μ_C(0)=1/2`, `μ_C(1)=3/8`, `μ_C(3)=1/8` and all other masses zero. This finite worked example distinguishes its exact law from the limiting natural `μ₃`. It detects both a spurious rational-point assumption on Pic¹ and a denominator h in place of `2h`.

For the proof, In characteristic 3 the defining sextic has derivative `2(x³−x)`, coprime to the sextic, so its smooth projective hyperelliptic model has genus 2. The point data refer to `𝔽₉=𝔽₃[u]/(u²+1)` and include the two geometric points above infinity, whose equation is `y²=2`; they are explicit hypotheses of this example. Since `N₁=0`, the seven Frobenius pairs among `C(𝔽₉)` are exactly the rational effective divisors of degree 2. Riemann–Roch and Serre duality give `h⁰(L)=1` for every degree-two class except the canonical class `κ`, where `h⁰(κ)=2`. Thus the canonical Abel fiber has `#P¹(𝔽₃)=4` divisors and every other fiber has one. Hence #Pic²(`𝔽₃`)`=7−4+1=4`; translation by `κ` identifies it with `J(𝔽₃)`. This proof needs no `zeta`-function theorem. The degree-two Picard quotient has `2h=8` elements even though `C(𝔽₃)` is empty. `Θ₀` is a singleton, `Θ₁` has no rational points, and the higher tails are empty. Applying the one-tail formula and the half-mass of each parity sector gives masses `1/2`,`3/8`,`1/8` at `ν=0`,1,3.

*Needs:* [theta tail normalization](#theta-tail-normalization), [finite picard quotient](#finite-picard-quotient), TauCetiRoadmap.JacobianChallenge Layer B.

([[64]](#ref-64), §4 Picard and `θ` normalization pp.30–33.)

**Checks.**

- With `N₁=0`,`N₂=14`, the effective-divisor count and Riemann–Roch give `h=4`,`Q=8`; the exact bundle masses sum to one.

### Dependencies

Mathlib's finite counts, polynomial invariants, p-adic measures and number-field finiteness; Tau Ceti's `Northcott/summatory` interface; EllipticCurves Layers 5 and 8; GlobalNumberFields and ClassFieldTheory; ReductiveGroupsPartII §RG2.3.7; SchemeAndStackFoundations Layers 0–3; GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3; AbelianSchemesAndArithmeticModuli Layers A2, A3 and A6; and InverseGaloisAndArithmeticFundamentalGroups Layers IG.3–IG.5 for embedded arithmetic markings. All local coefficient and exact-slice definitions needed later are constructed in this layer.

## Downstream consumers

ArithmeticStatisticsPartII, ArithmeticStatisticsPartIII, ArithmeticStatisticsPartIV, ArithmeticStatisticsPartV, ArithmeticStatisticsPartVI, ArithmeticStatisticsPartVII and ArithmeticStatisticsPartVIII consume the family carriers, local specifications, invariant conventions, exact slices and probability normalizations here. They identify their family, height, equivalence relation and local weights before applying an average. Their analytic-rank criteria retain residual ordinarity and ramification as explicit hypotheses on the representations of ArithmeticGaloisRepresentations §§1.9, 2.2. Probability convergence alone supplies no unbounded moment identity. The orbit dictionaries, global sieve tails, Selmer means and limiting comparisons belong to those consumers; none is a supplier for this part.

## References

<a id="ref-1"></a>

[1] Manjul Bhargava and Arul Shankar. [Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves](https://arxiv.org/abs/1006.1002v3). arXiv:1006.1002v3 (latest version), dated 24 December 2013, 36 pp.; published in Annals of Mathematics 181 (2015), 191–242.

<a id="ref-2"></a>

[2] Ashay A. Burungale and Ye Tian. [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2). arXiv:2506.03465v2 (latest version), 11 October 2025, 7 pp.; Annals of Mathematics 203 (2026), no. 1, 1–13.

<a id="ref-3"></a>

[3] Manjul Bhargava, Zev Klagsbrun, Robert J. Lemke Oliver and Ari Shnidman. [Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf). Author version (25 pp.) of Duke Mathematical Journal 168 (2019), 2951–2989.

<a id="ref-4"></a>

[4] Ramon M. Nunes. [Squarefree numbers in arithmetic progressions](https://arxiv.org/abs/1402.0684). arXiv:1402.0684v2 (6 July 2014); Journal of Number Theory 153 (2015).

<a id="ref-5"></a>

[5] Manjul Bhargava, Arul Shankar and Jacob Tsimerman. [On the Davenport-Heilbronn theorems and second order terms](https://arxiv.org/abs/1005.0672). arXiv:1005.0672v3 (20 June 2012), 38 pp.; published in Inventiones Mathematicae 193 (2013), 439-499.

<a id="ref-6"></a>

[6] Manjul Bhargava, Arul Shankar and Jacob Tsimerman. [On the Davenport-Heilbronn theorems and second order terms](https://arxiv.org/abs/1005.0672). arXiv:1005.0672v3 (20 June 2012); Inventiones Mathematicae 193 (2013), 439-499.

<a id="ref-7"></a>

[7] Benedict H. Gross and Mark Lucianovic. [On cubic rings and quaternion rings](https://people.math.harvard.edu/~gross/preprints/cubquat.pdf). Journal of Number Theory 129 (2009), 1468-1478; author preprint (11 pp.).

<a id="ref-8"></a>

[8] Wee Teck Gan, Benedict Gross and Gordan Savin. [Fourier coefficients of modular forms on G2](https://www.math.utoronto.ca/~ila/GanGrossSavin.pdf). Duke Mathematical Journal 115 (2002), 105-169 (published version).

<a id="ref-9"></a>

[9] Manjul Bhargava. [Higher composition laws III: The parametrization of quartic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf). Annals of Mathematics 159 (2004), 1329-1360 (published version, open access).

<a id="ref-37"></a>

[37] Jordan S. Ellenberg, Akshay Venkatesh, Craig Westerland. [Homological stability for Hurwitz spaces and the Cohen-Lenstra conjecture over function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf). Annals of Mathematics 183 (2016), no. 3, 729–786 (published PDF); compared with arXiv 0912.0325v4 (1 Dec 2015).

<a id="ref-46"></a>

[46] Tim Browning, Pierre Le Boudec, Will Sawin. [The Hasse principle for random Fano hypersurfaces](https://arxiv.org/pdf/2006.02356v1). arXiv:2006.02356v1 (3 June 2020, 66 pp.); published Annals of Mathematics 197 (2023), 1115–1203.

<a id="ref-50"></a>

[50] Melanie Matchett Wood (appendix with Philip Matchett Wood). [Nonabelian Cohen–Lenstra moments](https://arxiv.org/pdf/1702.04644v2). arXiv 1702.04644v2 (13 July 2018).

<a id="ref-57"></a>

[57] Bhargava, Gross, Wang. [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2). arXiv:1310.7692v2.

<a id="ref-58"></a>

[58] Bhargava, Shankar, Wang. [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3). arXiv:1611.09806v3.

<a id="ref-59"></a>

[59] Bhargava, Shankar, Wang. [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf). published Forum of Mathematics Pi 13 (2025), e17.

<a id="ref-60"></a>

[60] Ash, Brakenhoff, Zarrabi. [Equality of Polynomial and Field Discriminants](https://drive.google.com/uc?export=download&id=1lZ2HQrPDEugaMn1J3ERpqDp9g6C-t6Vd). published Experimental Mathematics 16 (2007), 367–374; public author link.

<a id="ref-61"></a>

[61] Browning, Le Boudec, Sawin. [The Hasse principle for random Fano hypersurfaces](https://arxiv.org/pdf/2006.02356v1). arXiv:2006.02356v1.

<a id="ref-62"></a>

[62] Koymans, Pagano. [On Stevenhagen's conjecture](https://arxiv.org/pdf/2201.13424v1). arXiv:2201.13424v1.

<a id="ref-63"></a>

[63] Lipnowski, Tsimerman. [How large is `A_g(𝔽_q)`?](https://arxiv.org/pdf/1511.02212v1). arXiv:1511.02212v1.

<a id="ref-64"></a>

[64] Shende, Tsimerman. [Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1). arXiv:1307.8237v1.

<a id="ref-65"></a>

[65] Melanie Matchett Wood. [Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050). published Duke Mathematical Journal 168 (2019), 377–427; NSF author manuscript. The accessible [arXiv v2 version](https://arxiv.org/pdf/1702.04644v2) is [50]; locators above use its pagination.

<a id="ref-67"></a>

[67] Skorobogatov, Sofos. [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf). published Inventiones Mathematicae 231 (2023),673–739.

<a id="ref-68"></a>

[68] Bhargava, Klagsbrun, Lemke Oliver, Shnidman. [3-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf). public author copy (2019).

<a id="ref-72"></a>

[72] Melanie Matchett Wood. [Quartic rings associated to binary quartic forms](https://arxiv.org/pdf/1007.5501v2). arXiv:1007.5501v2, 31 March 2011, 15 pages.

<a id="ref-73"></a>

[73] Manjul Bhargava, Benedict H. Gross, Xiaoheng Wang. [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2). arXiv:1310.7692v2, 24 February 2017, 42 pages.

<a id="ref-74"></a>

[74] John Tate. [Classes d'isogénie des variétés abéliennes sur un corps fini (d'après T. Honda)](https://www.numdam.org/item/SB_1968-1969__11__95_0.pdf). Séminaire Bourbaki, exposé 352 (1968–1969), pp.95–110.
