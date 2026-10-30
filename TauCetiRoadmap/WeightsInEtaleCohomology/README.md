# Roadmap: weights in étale cohomology: arithmetic cohomology and eigenform applications

**Summary.** This roadmap connects weight theorems to the arithmetic representations that occur in good reduction, modular forms and local comparison theorems. It builds the comparisons that identify Frobenius on a representation with Frobenius on a geometric fibre, checks the coefficient and Tate-twist conventions, and applies the resulting weights to traces and Hecke eigensummands. The first prerequisite is **DeligneWeightsAndPurity**. Its Weil-number theory, independent curve and abelian Weil bounds, sheaf and complex weight theory, and absolute hard Lefschetz are imported at the individual layers that need them. The representation predicates lie in `TauCeti.Weights.GaloisRep`.

The arithmetic comparisons are substantial targets in their own right. A cohomology group does not become a representation with the desired local polynomial merely by being given the same dimension. A projector must come from the specified correspondence and commute with the arithmetic action. Likewise, continuity of a representation gives neither algebraicity of Frobenius eigenvalues nor a Weil bound. The roadmap makes these distinctions usable in a library, with positive examples, counterexamples and normalization tests.

The six layers are:

| Layer | Mathematical purpose | Main output |
| --- | --- | --- |
| R34.1 | Frobenius and representation weight conventions | Pure, integral and chosen-embedding predicates; operations and sheaf comparisons |
| R34.2 | Good reduction of curves and abelian varieties | Tate/`H¹` variance, integral cohomological polynomials and all-extension trace formulas |
| R34.3 | Arithmetic traits and specified degeneration models | Specialization, nodal comparisons, Picard–Lefschetz normalization and Saito's model |
| R34.4 | Finite-field pencil comparisons | Descent of pencil data and the original-coefficient monodromy hypotheses |
| R34.5 | Arithmetic cohomology with projectors | Parabolic purity, classical and Hilbert degree comparisons, weight two and hard Lefschetz |
| R34.6 | Eigenform applications | Ramanujan bounds, fixed-form good-prime polynomials and the restricted Hilbert local export |

The early route through the numerical part of R34.1 and R34.2 uses only DeligneWeightsAndPurity DWP.0–1. It supplies FaltingsFinitenessAndIsogenyTheorems R28.4 and the good-reduction input to MordellLawrenceVenkatesh LV.1. It does not require the later sheaf or complex suffix of R34.1, general Weil II, decomposition, or the local monodromy results. The trait and semistable-curve route is also distinguished from the late invariant-cycle route. These separations keep the arithmetic inputs independent of the theorems that consume them.

## Scope and ownership

### Boundaries with neighbouring roadmaps

DeligneWeightsAndPurity owns the general theory of Weil numbers, weights, cohomological bounds and weight transport. LefschetzPencilsAndVanishingCycles owns nearby and vanishing cycles, pencil geometry, the vanishing quotient, geometric monodromy, and the early semistable-curve/SNC comparisons. EtaleCohomologyFoundations §§F.5–F.7 owns cup products, trace pairings, Chern and cycle classes, weak Lefschetz and blowup comparisons. R34.1–4 instantiate those interfaces on arithmetic representations, fields and models; they do not construct a second version of them.

ArithmeticGaloisRepresentations §§1.1–1.12, 2.1–2.6 supplies continuous representations, their operations, decomposition and inertia groups, arithmetic Frobenius classes, tame characters and the arithmetic Weil–Deligne carrier. ArithmeticGaloisRepresentations §§6.1–6.2 supplies the Tate module functor and Weil pairing; NeronModelsAndSemistableAbelianVarieties §5.0a supplies good-reduction torsion specialization. AbelianSchemesAndArithmeticModuli A4 supplies the Tate/cohomology comparison, and A6 supplies endomorphism characteristic polynomials. NeronModelsAndSemistableAbelianVarieties §5.1 supplies Néron–Ogg–Shafarevich. The finite-field Weil bound comes from DWP.1; the genus-one comparison agrees with Tau Ceti's EllipticCurves, Layer 3, rather than providing a second proof of Hasse's theorem.

ModularCurvesPartII Layer 11 and R34.3's Hilbert model construction supply the actual bad-fibre models for R34.3. ModularCurvesPartII Layer 12 consumes the degeneration comparison and is not its model-construction prerequisite. PadicHodgeTheory §§8.1–8.2 owns the general finite-local-field semistable comparison, normalized monodromy, filtered de Rham agreement and geometric functoriality, using AInfCohomology §§AI.6.4–AI.6.6. R34.3 owns its application to Saito's specified model: verification of the model hypotheses, extension to L_μ, restriction by the specified L-coefficient correspondences, the chosen C_μ factor and descent preserving the original Weil action.

For eigenforms, ModularCurvesPartII §§14.1–14.4a supplies the parabolic coefficient realization and level/Hecke transport, and AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 supplies the primitive rank-two projector, coefficient descent and independent geometric Hecke polynomial. R34.5 constructs the classical Kuga–Sato compactification, Scholl correspondence and their good-prime models. ModularCurvesPartII §§16.1–16.4 supplies the weight-two modular abelian quotient. The Hilbert geometry and projector belong to R34.3's Hilbert model construction. R34.5–6 check their arithmetic realizations and apply weights. The geometric Eichler-congruence polynomial used as input must be supplied independently of the purity theorem here.

R34.6 states the exact compatible-family interface receiving the fixed-form polynomial theorem. The fixed-form good-prime polynomial theorem here supplies its common-polynomial input; it does not construct all the family’s local or Hodge-theoretic data. R34.6 proves the source-qualified Hilbert modular compatibility theorem at the residue characteristic, including its crystalline coefficient arguments and the normalization comparison.

## Conventions

### Frobenius, characteristic polynomials and weights

Let `K` be a number field, `G_K = Gal(K̄/K)`, and `v` a finite place with residue field of cardinality `q_v>1`. Fix a place of `K̄` above `v` when naming decomposition and inertia groups. Arithmetic Frobenius acts on the residue algebraic closure by `x ↦ x^{q_v}`. **Geometric Frobenius is its inverse**, and all weights below use geometric Frobenius. Replacing it by arithmetic Frobenius negates the weights. This choice follows [Deligne I, (1.15), p. 279][WI].

In every finite-field étale weight, duality, pencil and hard-Lefschetz statement, `q` is a prime power and `ℓ` is a prime different from `char(𝔽_q)`. The `ℓ = p` Hilbert comparison uses log-crystalline/Hyodo–Kato cohomology as specified separately.

For a finite field `k = 𝔽_q`, `Gal(k̄/k) ≃ ℤ̂`, and both arithmetic and geometric Frobenius are topological generators. Choosing one fixes the generator used in continuous finite-field characters.

For a finite-dimensional continuous `E`-representation `ρ`, unramified at `v`, write

`P_v(ρ; X) = det(X − ρ(F_v^geom)).`

This is a monic characteristic polynomial, with roots the Frobenius eigenvalues, counted with multiplicity. An Euler factor instead has the form

`L_v(ρ; T)⁻¹ = det(1 − ρ(F_v^geom) T) = T^{dim ρ} P_v(ρ; T⁻¹).`

The two polynomials must be distinguished in source comparisons. In particular, restoring a cohomological degree or using the symbol `P` from a source does not settle whether the polynomial is written in characteristic or reciprocal form.

The Tate representation `ℚ_ℓ(1)` has geometric eigenvalue `q_v⁻¹` and weight `−2`. A twist by `(n)` changes weight by `−2n`, a dual negates weight, and tensor products add weights. On a curve, `H¹` and the covariant Tate module are dual representations: the former has geometric weight `1`, the latter `−1`.

Four arithmetic properties have separate interfaces:

* algebraicity of every eigenvalue over `ℚ`;
* algebraic integrality of every eigenvalue over `ℤ`;
* descent of the whole monic characteristic polynomial to `ℤ[X]`;
* equality of the absolute values of all complex conjugates to `q_v^{w/2}`.

Algebraic-integral roots give coefficients integral over `ℤ` in a coefficient number field. They need not give rational coefficients. A monic factor of a polynomial in `ℤ[X]` lies in `ℤ[X]` if that factor is in `ℚ[X]`; a factor in a larger coefficient field does not satisfy that conclusion. This distinction matters for Hecke eigensummands and is tested explicitly below.

For a smooth variety of pure dimension `d`, the dualizing complex is `ℚ_ℓ(d)[2d]`. A pure lisse sheaf of punctual weight `r`, viewed as a complex in degree zero, has complex weight `r`. Its shift and twist `ℱ[a](b)` have complex weight `r + a − 2b`. Complex purity is defined using Verdier duality, as in DWP.8; a statement about arbitrary singular supports cannot be inferred just from this smooth lisse formula.

R34.k is an alias for Layer k of this roadmap. DWP.k denotes Layer DWP.k of DeligneWeightsAndPurity, and LPV.k denotes Layer LPV.k of LefschetzPencilsAndVanishingCycles. A4 and A6 refer to AbelianSchemesAndArithmeticModuli. All numerical subsection locators attached to these abbreviations are sections of the named supplier roadmap.

### Library vocabulary

The numerical interface uses Mathlib's `Representation`, `Representation.dual`, `Representation.ofDistribMulAction`, `LinearMap.charpoly` and `Matrix.charpoly`. A `Representation` is a monoid homomorphism into linear endomorphisms. Continuity and actual arithmetic local data are additional inputs from ArithmeticGaloisRepresentations §§1.1–1.12, 2.1–2.6. The contragredient dual acts by the transpose of the inverse action. `LinearMap.charpoly` supplies the characteristic polynomial for a finite free module; `Matrix.charpoly` is `det(XI − M)` on a finite index type over a commutative ring.

Mathlib's `IsArithFrobAt` is an algebraic Frobenius predicate for an action on a ring: modulo an ideal `Q`, the action is the power given by the cardinality of the residue quotient of the base ring. It is not itself the construction of the decomposition group of a number-field place. Its lemmas provide useful algebraic inputs to ArithmeticGaloisRepresentations §§2.1–2.6:

* `IsArithFrobAt.mul_inv_mem_inertia` places the quotient of two arithmetic Frobenius lifts in the ideal's inertia group.
* `IsArithFrobAt.conj` transports a Frobenius lift to the conjugate ideal.
* `IsArithFrobAt.exists_of_isInvariant` gives a lift for a prime ideal when the acting group is finite, the base algebra is invariant, and the residue quotient is finite.

Use these statements with their actual algebra and action hypotheses. The arithmetic adapters below add the continuous Galois representation, the place and its local groups; supplied group elements alone do not establish an arithmetic realization.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib at `6b7abb3` and Tau Ceti at `a91d3aa`. The numerical forms use `Representation`, `Representation.dual`, `Representation.ofDistribMulAction`, `Representation.prod`, `Representation.tprod`, `Representation.subrepresentation`, `Representation.quotient`, `LinearEquiv`, `LinearMap.charpoly`, `LinearMap.trace`, `Module.finrank`, `Matrix.charpoly`, `Polynomial.IsRoot`, `IsIntegral` and `Real.rpow`. Algebraicity over `ℚ` is expressed by `IsIntegral ℚ`; it is distinct from `IsIntegral ℤ`. A representation's action is invertible because its source is a group. Suggested.lean uses Tau Ceti's bundled newforms and coefficient fields, with Mathlib's polynomials, embeddings and real powers.

Mathlib `LinearEquiv.charpoly_conj` supplies invariance under coefficient-linear conjugacy; `Matrix.charpoly_units_conj` supplies its matrix form. Mathlib `IsArithFrobAt.mul_inv_mem_inertia`, `IsArithFrobAt.conj` and `IsArithFrobAt.exists_of_isInvariant` supply the ideal-action Frobenius facts on their algebraic domains described above. The arithmetic polynomial, independence of lifts and places, and its coefficient/restriction API are consumed from ArithmeticGaloisRepresentations §2.2. There is no second numerical polynomial definition or invariance API here.

For finite-dimensional `ρ` and a group element g, the consumed duality identity is `charpoly(ρ^∨(g))=charpoly(ρ(g⁻¹))`. Over an algebraically closed coefficient field the roots at `g⁻¹` are the inverses, with multiplicity, of the roots at g; invertibility excludes zero roots (DeligneWeightsAndPurity §§0.11, 0.13). If the entire subgroup I acts trivially and `t∈I`, the action at tg equals the action at g. If `e:V≃ₗW` intertwines every group element, e conjugates the two actions and `LinearEquiv.charpoly_conj` gives equal polynomials. The same library conjugacy theorem handles `g↦hgh⁻¹`. These are supplier contracts for the local polynomials used below.

### From arithmetic representations and abelian geometry

* ArithmeticGaloisRepresentations §§1.1–1.6, 1.12: continuous representations, coefficient extension, restriction, induction, duals, tensors, twists and lattices; §§2.1–2.4: actual place groups, arithmetic Frobenius, unramified characters and Weil–Deligne adapters; §2.6: monodromy filtration and graded purity; §§6.1–6.2: Tate modules, torsion specialization and cyclotomic/Weil pairings. Its Frobenius polynomial uses arithmetic Frobenius. Here the geometric polynomial is its polynomial on the dual, with the inverse-root convention made explicit.
* AbelianSchemesAndArithmeticModuli §§A4.1, A4.4 / `exteriorCohomology`: the integral Tate module and canonical Galois-equivariant `H¹`/Tate duality, cup-product exterior powers, finite-level reduction, functoriality and base-change naturality. Over a geometric field, `ℓ` is invertible and each finite-level `Hⁱ` is free of binomial rank; derived realization supplies the integral limit. Sections A6.10–A6.11 supply the integer endomorphism polynomial and its Tate realization, independently of coefficient prime. These are different inputs. Sources: [Milne I, Theorem 12.1 and Remark 12.5, pp. 55–56][AV].
* NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0c supplies finite-étale torsion specialization, the good-reduction arithmetic Frobenius/endomorphism polynomial and the geometric `H¹` Euler factor; §5.1 supplies Néron–Ogg–Shafarevich for abelian varieties over the stated local fields. EllipticCurves Layer 3 supplies the existing Hasse bound. JacobianChallenge Layers D–F supply the pointed Jacobian, principal polarization and Abel–Jacobi map. SchemeAndStackFoundations §3.6 supplies `Pic⁰`/Jacobian and `Pic¹` without a rational point; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1 supplies the finite-level curve–Jacobian `H¹` comparison and its rational realization. For a geometric Abel–Jacobi map, the addition-map coproduct of A4.4 proves that translations act trivially on `H¹`, making the comparison independent of that point and Galois-equivariant.

### From scheme cohomology and degeneration theory

* SchemeAndStackFoundations §§0.9, 2.15 supplies finite-presentation spreading and descent to a common finite residue extension; §0.29 supplies scheme Frobenius; Layers 0–1 supply the scheme and descent carriers. Its coherent-duality results do not supply étale base change.
* EtaleCohomologyFoundations §§F.0.1–F.0.3, F.0.A2 supply finite lisse sheaves, fundamental groups, Tate twists and the arithmetic sequence. Sections F.2.1–F.2.2 supply proper and smooth base change at finite level. Sections F.4.1–F.4.6 supply normalized adic systems, derived inverse-limit realization, finiteness, continuous actions and coefficient extension. In §F.4.5, on a connected normal Noetherian scheme with `ℓ` invertible, rational lisse sheaves agree with continuous finite-dimensional `π₁` representations with stable lattices. Sections F.10.1–F.10.2b identify descended geometric Frobenius and scheme pullback with all power, coefficient and twist compatibilities.
* EtaleCohomologyFoundations §§0.9–0.11, F.5–F.7 supply actual cycle/Chern classes, smooth purity, trace pairings, Verdier/Poincaré duality, blowup and weak-Lefschetz maps on their finite-Tor and invertible-coefficient domains. InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 / `VanishingCycles.etaleTraceFormula` supplies the rational compact-support fixed-point trace formula for every positive Frobenius power, using descended constructible coefficients. Curve–Jacobian identification uses §IG.0.T1 and the unpointed Jacobian and A4.4 contracts above.
* LefschetzPencilsAndVanishingCycles §§0.2–0.8 supply nearby and vanishing cycles, functoriality, constructibility, coefficient/trait change and adic realization; §§1.1–1.3, 2.1–2.8 supply tame monodromy and the parity-sensitive quadratic-singularity formulas; §§3.1–5.11 supply pencil geometry, the radical quotient, original-coefficient irreducibility, open monodromy and fibre polynomials. Sections 7a.1–7a.9 supply the early semistable normalization/specialization sequences, their choice/base-change compatibility and the prime-to-residue-characteristic étale SNC restriction/Gysin/monodromy spectral sequence. They supply no crystalline spectral sequence; R34.3 constructs that interface from CrystallineCohomology §§CR.6.1, CR.6.5. These do not use the late invariant-cycle branch §§7b.1–7b.11.
* EnhancedDerivedSheaves §§0.1–0.4 and DerivedModuleAlgebra §1.T.1 supply coherent derived sheaf limits and the Mittag–Leffler/Milnor comparison used for the specified coefficient towers. Bounds, finite-Tor hypotheses and transition compatibility must be verified on that tower.

### From weights and modular realizations

* RepresentationTheory/CharacterTheory Layer 3 supplies finite-group character projectors and their idempotence. R34.5 applies this supplied averaging identity to the torsion-translation, inversion and permutation correspondences on its actual equivariant compactification.
* DeligneWeightsAndPurity §§0.1–0.19 (DWP.0) supplies Weil numbers, ordinary and chosen-embedding endomorphism weights, embeddings, spectral operations, power criteria and the comparison with arithmetic graded purity. Sections 1.1–1.10 (DWP.1) supplies the independent curve/abelian estimates and point counts. Sections 2–4 supplies the fundamental estimate, rational pencil factors and smooth projective purity; §§5.1–5.19, 7.1–7.15, 8.1–8.24 supplies sheaf/complex weights, integrality, direct-image bounds and duality; §§9.1–9.12 supplies absolute hard Lefschetz; §§10.1–10.4 supplies transport to arithmetic subquotients. Numerical weight predicates are consumed from this roadmap; only the exceptional-set representation predicates are defined here.
* ModularCurvesPartII Layer 11 supplies its specified regular/semistable bad-prime models with geometric thicknesses, stabilizers, level maps and coefficient data. Layer 12 supplies modular degeneration applications. Sections 14.1–14.4a supply the universal symmetric-power local system, support map, parabolic image and finite/adic/characteristic-zero comparisons; §14.11 supplies its pairing within the stated coefficient domain; §§16.1–16.4 supply the weight-two modular abelian quotient and dimension. These inputs do not assert a Kuga–Sato compactification or a Hilbert–Shimura model.
* AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 supplies the primitive rank-two classical cohomological multiplicity, coefficient descent at every `λ`, independence of auxiliary full level and the geometric Hecke polynomial without using R34.6 purity. Its pairing/transpose identity, including the odd-weight character transport, fixes trace and determinant even for scalar Frobenius. R34.5 constructs and compares the classical Scholl realization rather than constructing a second primitive eigenprojector.
* StableReduction Layers 4, 5, 7 and 8 supply nodal resolution, minimal regular models, semistable reduction and stable-model existence/uniqueness, applied componentwise in geometric genus greater than one. R34.3 constructs the compatible ramified refinement to strictly semistable models and adds Saito’s abelian schemes, level maps, correspondences and descent data; the minimal regular semistable model and its stable contraction are distinct.
* CrystallineCohomology §CR.3:duality.1 supplies proper smooth crystalline trace, derived Poincaré duality, finite étale transfer, Gysin maps with projection/composition formulas and diagonal coevaluation. Consume its transitive prerequisites, including CR.4.7's finite/infinite crystalline de Rham–Witt comparison, CR.2.3's smooth-lift comparison, CR.3.2's perfectness, CR.3.3–CR.3.4's products/Künneth/Frobenius, and the cited coherent duality of SchemeAndStackFoundations Layer 2 and derived completion/tensor interfaces of DerivedModuleAlgebra, DerivedDeRhamCohomology and EnhancedDerivedSheaves. R34.3 constructs the additional cycle/intersection compatibilities and Weil-twisted correspondence-trace comparison on these supplied maps.
* PadicDifferentialEquationsAndRigidCohomology §RD.7.7 supplies equality of ordinary crystalline and prime-to-p étale Frobenius polynomials for descended smooth projective strata, hence their crystalline Frobenius weights. R34.3 constructs the additional correspondence trace theorem used for Saito’s Weil-twisted operators.
* PadicPeriodRings §§4.1–4.3 supplies the actual period rings, topologies, Galois/Frobenius/monodromy actions and invariant functors. CrystallineCohomology Layers CR.5–CR.6 supplies log crystalline and Hyodo–Kato complexes, base change and their structure maps. FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.0, R07.4.27–R07.4.28 supplies finite-local-field period-realization and descent-data interfaces. PadicHodgeTheory §§8.1–8.2 supplies the general finite-K semistable comparison with normalized monodromy, filtered B_dR agreement, pullback, products, duality and restriction by matching geometric projectors. Its underlying AInfCohomology §§AI.6.4–AI.6.6 contracts are the log-crystalline and Hyodo–Kato comparisons, canonical B_dR⁺ comparison, étale specialization and B_dR agreement. R34.3 verifies the Saito-model hypotheses and constructs the specified coefficient, correspondence and Weil-descent identifications on these maps.
* GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.3, R17.3.5–R17.3.8 supplies global Jacquet–Langlands transfer, split-place Hecke matching, strong multiplicity one, spectral multiplicity one and coefficient-model comparison. Use a coefficient field containing the conjugates of F, splitting the quaternion algebra and admitting the required models. R34.6 constructs Saito §3 Lemma 1’s cohomological decomposition and coefficient descent to its rank-two Galois multiplicity. Separately, §§R16.0.1, R16.3.1–R16.3.4 supplies rank-two local Langlands parameters and the Tate/unitary normalization bridge; R34.6 identifies Saito’s source-normalized parameter with this interface.

## How to read the build

The numerical part of R34.1 and the good-reduction comparisons of R34.2 use only the early scalar and abelian weight theory. R34.3 constructs the specified arithmetic models, coefficient filtrations and Saito-specific semistable-period identifications; R34.4 verifies the finite-field pencil inputs. R34.5 constructs the classical and Hilbert algebraic projector realizations and compares the supplied primitive classical multiplicity. R34.6 applies the resulting weights and proves the source-qualified Hilbert local comparison. Every geometric construction and its intended domain is a README target even when its carrier is absent from Suggested.lean.

## Layer 1: Frobenius, algebraicity and representation weights (R34.1)

The numerical portion of this layer gives the local-polynomial and weight API needed by the early arithmetic applications. Its two geometric comparisons have their own additional prerequisites: sheaf weights use DWP.5 and the integral-sheaf interface of DWP.7; complex normalization uses DWP.8 and smooth duality. A user of numerical representation weights need not acquire these suffixes.

### 1.1 Frobenius convention checks

For supplied group elements, use Mathlib's `LinearMap.charpoly` on the action directly. For actual unramified arithmetic places, use ArithmeticGaloisRepresentations §2.2's local polynomial with the dual representation to obtain the geometric convention fixed above. The relation between an inverse action and its contragredient retains multiplicities and excludes zero roots because a group action is invertible.

**Checks.**

* At residue cardinality 3, geometric Frobenius on `ℚ_ℓ(1)` has polynomial `X − 1/3`.
* The trivial representation of rank d has polynomial `(X − 1)^d`, including polynomial 1 at `d=0`.
* The scalar action of `ℂˣ` with full supplied inertia is ramified; changing the lift from 3 to `2 · 3` changes the polynomial.
* The inverse of a rank-two operator with polynomial `X² − aX + q`, q nonzero, has polynomial `X² − (a/q)X + 1/q`. Its inverse companion matrix gives a direct check.

These are numerical convention tests. Their sources are [Deligne I, (1.15), p. 279][WI] and [Deligne II, (1.1.13), p. 152][WII]. The arithmetic adapter requires ArithmeticGaloisRepresentations §§1.1–1.6, 2.1–2.2, not merely supplied group elements.

### 1.2 Pure and integral representations outside a finite set

For a finite extension `E/ℚ_ℓ` and a finite-dimensional continuous `E`-representation, let `T` be a finite set of finite places and `w ∈ ℤ`. Define **pure of weight `w` outside `T`** to mean that, for every `v ∉ T`, the representation is unramified at `v`, every root of `P_v` is algebraic over `ℚ`, and every complex embedding of the field generated by that root gives absolute value `q_v^{w/2}`. This uses DWP.0's Weil-number and endomorphism-weight definitions. The scalar clause can be expanded on an algebraically closed coefficient field; the representation-weight form to construct is `∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧ IsPure (q v : ℝ) w (ρ (F v))`, with DWP.0's `IsPure` (§0.7). The forms agree by §0.6 when `q_v > 1` outside T: a complex embedding gives the required cardinality bound, and §0.5 extends embeddings of each algebraic root field.

Define **integral Frobenius polynomials outside `T`** separately: for every `v ∉ T`, require unramifiedness and require `P_v` to be the coefficient-field image of a polynomial in `ℤ[X]`. The characteristic polynomial is already monic, so its integer preimage is monic. An integral representation in this sense has algebraic-integral eigenvalues. The converse needs rationality of the polynomial as an additional hypothesis.

For an isomorphism `ι:ℚ̄_ℓ ≃ ℂ` and a real number `r`, define **`ι`-pure of weight `r` outside `T`** by unramifiedness and the norm condition for roots under this chosen embedding. This predicate makes no algebraicity assertion. For the numerical forms define the predicates on any exceptional set of supplied places, without a finiteness condition; the arithmetic adapter restricts to finite T. The numerical purity forms explicitly require an algebraically closed characteristic-zero coefficient field containing `ℚ`, supplied inertia/Frobenius/cardinality functions, and, for all-embeddings purity, a nonempty type of ring embeddings to `ℂ`; chosen-embedding purity takes a specified ring embedding. The arithmetic form supplies the actual continuous representation and place data. The integer-polynomial predicate itself is defined over any characteristic-zero field with its `ℚ`-algebra structure. Algebraic closedness is essential for the purity predicates to inspect every eigenvalue; for a nonclosed field a polynomial can have no roots in that field. For example, `X²+1` has no real root, so testing only its real roots would give a vacuous condition. Embeddability into `ℂ` prevents vacuity of the all-embeddings quantifier; comparison with intrinsic scalar purity uses the embedding-extension theorem of DeligneWeightsAndPurity §0.5.

In `TauCeti.Weights.GaloisRep`, construct the three predicates with their expansion lemmas: all-embeddings purity includes algebraicity, the integer-polynomial predicate includes an integer preimage, and chosen-embedding purity makes no algebraicity assertion. Each predicate is preserved by enlarging the exceptional set. All-embeddings purity implies chosen-embedding purity at the same integer weight. Prove uniqueness of the weight for a nonzero representation when a place outside the exceptional set has residue cardinality greater than one and a complex embedding is supplied.

The rank-zero case is intentionally excluded from uniqueness. Its root set is empty, so it is pure of every weight and has characteristic polynomial `1`. Nor does uniqueness hold merely from a vacuous condition on an exceptional set containing every supplied place. The uniqueness theorem must require a place outside the set, positive rank and cardinality greater than one explicitly.

**Checks.** The following cases determine the intended predicate:

* `ℚ_ℓ(n)` has geometric weight `−2n`. At an unramified place its polynomial is `X − q_v^{−n}`.
* The trivial representation is pure of weight zero and has integer Frobenius polynomials.
* `ℚ_ℓ(1)` is pure of weight `−2`, while `X − q_v⁻¹ ∉ ℤ[X]` for `q_v>1`.
* The direct sum `ℚ_ℓ ⊕ ℚ_ℓ(1)` is not pure of any single integer weight at a place with `q_v>1`.
* A rank-zero representation is pure at every weight, has polynomial `1`, and satisfies the integer-polynomial predicate.

**Checks for the chosen-embedding predicate.**

* The trivial line has chosen-embedding weight zero, and the geometric Tate line at `q=3` has weight −2 under every ring embedding into `ℂ`.
* The rank-zero representation satisfies the predicate at every real weight, so no unconditional weight-uniqueness lemma is valid. Conversely the scalar 3 over `ℂ` fails chosen-embedding weight zero under the identity embedding, since its norm is 3 rather than 1.
* The algebraic-unit character from the quartic example below is pure of weight zero for an embedding taking its root to the unit circle, but fails that weight for an embedding taking it to the real root greater than one. This distinguishes chosen-embedding purity from all-embeddings purity.

At places away from `ℓ`, the Tate character tests apply with trivial inertia. For a nonzero Tate twist, the arithmetic exceptional set contains the places above `ℓ`. Such places can occur outside a general representation's exceptional set only when the representation is actually unramified there. Tate polynomials are integral for nonpositive twists; positive twists display the denominator obstruction.

The arithmetic definition follows [Lawrence–Venkatesh, §2.3 and Lemma 2.3, p. 9][LV], with the convention distinguished above. Prerequisites are the supplied Frobenius polynomial and DWP.0 endomorphism weights (§0.7), Weil numbers (§0.1), chosen-embedding weights (§0.4). Mathlib's `Representation.ofDistribMulAction` supplies the scalar numerical tests. The basic chosen-embedding language is [Deligne II, (1.2.6), p. 154][WII].

### 1.3 Linear algebra operations and rational integrality

For representations unramified outside the stated exceptional set, prove that a subrepresentation and a quotient of a pure representation remain pure of the same weight. For a short exact sequence, purity of the middle term implies purity of both ends. Conversely, if all three representations are unramified outside `T` and both ends are pure of the same weight `w`, the middle is pure of weight `w`. Unramified endpoints alone do not make an extension unramified: the middle term's local hypothesis must be supplied.

Direct sums of equal-weight representations have that weight. The dual of weight `w` has weight `−w`, a tensor product of weights `w,w'` has weight `w + w'`, and the determinant of a rank-`d` representation of weight `w` has weight `dw`. Twisting by `ℚ_ℓ(n)` changes the weight to `w − 2n`, after adjoining the places above `ℓ` to the exceptional set when required. Exterior and symmetric powers use the corresponding imported spectral operations. Retain multiplicity and the zero-rank conventions when deriving these statements.

The integer-polynomial statements form a separate family. They are preserved by direct sums, tensor products, determinants and nonpositive Tate twists. For subquotients, the characteristic-polynomial factor must be monic and rational before the integer-coefficient factor lemma applies. Arbitrary coefficient-field summands preserve algebraic-integral roots but can lose rational coefficients. Duality and positive Tate twists can introduce denominators, so they do not preserve the integer-polynomial predicate in general.

As a nonexample, take the diagonal operator with eigenvalues `√2` and `−√2`. Its full polynomial is `X² − 2 ∈ ℤ[X]`, while either invariant line has polynomial `X ∓ √2`, which is not rational. Together with the Tate-one test, this factorization prevents a false integrality API for arbitrary summands and duals.

For an elliptic curve at a good place, `H¹ ⊗ H¹` has weight two and integer Frobenius polynomials, while its dual has weight minus two and has a noninteger constant coefficient. Its determinant test is `det H¹ = ℚ_ℓ(−1)`, of weight two. These geometric examples supplement the scalar and factorization tests.

The numerical purity statements use an algebraically closed characteristic-zero coefficient field E admitting a complex embedding, including for duality. The extension equivalence carries unramifiedness of the middle representation. The separate integer-polynomial subrepresentation theorem requires a rational polynomial for each invariant-subspace action.

Sources are [Deligne II, (1.2.5)(ii), p. 154][WII], and [Lawrence–Venkatesh, §2.5, p. 13][LV]. Prerequisites are the predicates above and DWP.0 subquotient and extension weights (§0.9), tensor and contragredient spectra (§0.13), rank-one twists (§0.15), Weil-number arithmetic (§0.2). This target applies those numerical theorems to the arithmetic exceptional-set conditions; it does not reprove them.

### 1.4 Restriction and induction along a finite extension

Let `L/K` be finite. If `ρ` is pure of weight `w` outside `T`, its restriction to `G_L` is pure of weight `w` outside the places over `T`. For a place `u ∣ v` of residue degree `f = f(u/v)`, the local comparison is

`ρ(F_u^geom) = ρ((F_v^geom)^f),  q_u = q_v^f,`

where the Frobenius equality is first an equality modulo inertia and then an equality of actions because the original representation is unramified. Taking powers preserves the weight relative to the enlarged residue cardinality. It preserves integer Frobenius polynomials as well, by the symmetric polynomial expressions in powers of roots.

For a representation `τ` of `G_L`, define continuous induction using ArithmeticGaloisRepresentations Layer 1. At a place `v` unramified in `L`, and with `τ` unramified at all `u ∣ v`, prove

`P_v(Ind_{G_L}^{G_K} τ; X) = ∏_{u ∣ v} P_u(τ; X^{f(u/v)}).`

Prove the cyclic-block determinant used here: if an invertible F cyclically permutes `f≥1` equal-rank summands through maps `A_i:V_i→V_(i+1)`, then its characteristic polynomial is `det(X^f−A_(f−1)⋯A_0)` on `V_0`. The identity is independent of bases and of the starting summand. This local linear-algebra comparison is part of the present target; ArithmeticGaloisRepresentations §1.3 supplies continuous induction, its transversal model and Mackey decomposition, rather than this determinant identity. If `τ` has weight `w`, an `f`-th root of an eigenvalue of norm `(q_v^f)^{w/2}` has norm `q_v^{w/2}`, at every embedding. The induced representation therefore has the same weight after excluding the places under `T` and the places ramified in `L/K`. Integer polynomials are preserved by the displayed product. A ramified extension cannot be inserted into this unramified formula without an additional local theorem.

At `f=1` the cyclic formula is the original polynomial; at rank zero it is 1; at `f=2` with trivial rank-one return map it is `X²−1`. These checks distinguish `X^f` substitution from multiplying f unrelated copies of the original polynomial.

For `ℚ(i)/ℚ`, induction of the trivial character is `1 ⊕ χ₋₄`, pure of weight zero outside `{2}`. At an inert prime `p ≡ 3 (mod 4)`, its polynomial is `X² − 1`. The roots are `±1`, demonstrating both the cyclic block and preservation of weight zero; the two-by-two permutation matrix has zero diagonal and off-diagonal entries one.

Sources are [Deligne II, (1.2.5)(i), p. 154][WII], and [Lawrence–Venkatesh, §2.5, proof of Lemma 2.10, p. 14][LV]. Prerequisites are R34.1's predicates; DWP.0 finite-base-extension weights (§0.12), the power criterion (§0.12); ArithmeticGaloisRepresentations Layer 1 continuous induction (§1.3); ArithmeticGaloisRepresentations §§2.1–2.2 for decomposition groups and residue-degree restriction; and the cyclic-block determinant just stated.

### 1.5 Continuous Frobenius eigenvalues need not be algebraic

For a finite field `k = 𝔽_q`, the Galois group is `ℤ̂`. Given any `u ∈ ℤ_ℓˣ`, construct its continuous one-dimensional `ℓ`-adic representation whose geometric Frobenius acts by `u`. Construct the homomorphism through the finite unit quotients and their compatible inverse limit. On the pinned profinite-integer group `TauCeti.zHat`, with `TauCeti.zHat.gen` identified with geometric Frobenius, the character is supplied by `TauCeti.zHat.existsUnique_lift u`. The instances `PadicInt.compactSpace_units` and `PadicInt.totallyDisconnectedSpace_units` in `TauCeti.NumberTheory.Padics.PadicIntegers` make the unit group profinite. This does not require the whole unit group to be procyclic. The extension is determined by the image of the chosen topological generator. Compactness requires a unit; a representation of the Weil group alone can have any nonzero `ℚ̄_ℓ`-eigenvalue.

There are transcendental elements of `ℤ_ℓˣ`, since that set is uncountable whereas the elements algebraic over `ℚ` form a countable set. The resulting representation has finite dimension and is continuous, yet its Frobenius eigenvalue is not algebraic and it is not pure of any integer weight in the all-embeddings definition. This character counterexample uses the same profinite-integer presentation, with its eigenvalue in `ℚ_ℓ`. For a chosen embedding, it still has a real `ι`-weight `2 log_q|ι(u)|`.

An algebraic example separates finite dimension from integer-weight purity without a transcendental choice. For odd `ℓ`, take `u = 2` and an odd prime `q ≠ ℓ`. If this eigenvalue had integer weight `w`, then `4 = q^w`, impossible for an odd prime and integer `w`. Thus even algebraicity does not force integer-weight purity.

The rational unit `u = 1 + ℓ` gives another test: its chosen-embedding weight is `2 log_q(1 + ℓ)`, independent of the embedding, but an integer weight exists only when `1 + ℓ` is an integer power of `√q`. The profinite-unit construction also covers `ℓ = 2`.

Sources are [Deligne II, (1.2.3), (1.2.6)–(1.2.7), pp. 154–155][WII]. Prerequisites are the predicates, DWP.0 chosen-embedding weights (§0.4), ArithmeticGaloisRepresentations Layer 1 continuous representations (§1.1) and ArithmeticGaloisRepresentations §§2.1–2.6 unramified characters (§2.2).

### 1.6 Every embedding and a chosen embedding

For a representation over `ℚ̄_ℓ`, prove that all-embeddings purity at integer weight `w` is equivalent to `ι`-purity at weight `w` for every field isomorphism `ι:ℚ̄_ℓ ≃ ℂ`. The forward implication is immediate from the definition. The reverse implication uses the DWP.0 theorem that the norm constraint for every such isomorphism forces algebraicity; it must not silently assume the eigenvalues algebraic first. The construction and abundance of these isomorphisms use the cardinality and transcendence-basis argument in DWP.0 complex embeddings (§0.5). The equivalent numerical test uses all complex embeddings of the algebraically closed splitting coefficient field; its reverse implication includes algebraicity.

For a common coefficient number field `E`, an equivalent practical test is that every polynomial `σ(P_v)`, for every `σ:E ↪ ℂ`, has all its roots of the required norm. Roots are taken in an algebraic closure and with multiplicity. This is the form used for fixed-form coefficient descent in R34.6. If a polynomial is already rational, its full root set under one embedding contains every algebraic conjugate, so testing all of those roots suffices. Testing one eigenvalue under one embedding is a weaker assertion.

A chosen embedding can fail even at integer weight zero. Use

`f(X) = X⁴ − X³ − X² − X + 1.`

It is irreducible over `ℚ`, as seen by reduction modulo `2`. For a root `α`, put `t = α + α⁻¹`; then `t² − t − 3 = 0`. One real value of `t` lies in `(−2,2)` and gives a pair on the unit circle. The other exceeds `2` and gives reciprocal positive real roots, one greater than `1`. All roots are algebraic units, since the polynomial is monic with constant term `1`. A root gives a continuous finite-field rank-one character in a finite `ℓ`-adic coefficient extension. Choose the embedding carrying that root to the unit circle: the character is `ι`-pure of weight zero, but fails the all-embeddings condition because another conjugate has norm greater than one.

The example is a finite-field character, not a claim of a global number-field character with prescribed purity at every place. Irreducibility and the two norms also give chosen-embedding purity and failure of all-embeddings purity at weight zero for the scalar representation on a complex line with a unit-circle root as its supplied Frobenius eigenvalue. The continuous arithmetic character requires the finite-field construction above. Sources are [Deligne II, (1.2.6), p. 154][WII]. Prerequisites are the preceding character construction and DWP.0 the all-isomorphisms algebraicity criterion (§0.6), Weil numbers (§0.1), complex embeddings (§0.5).

As a positive coefficient-field test, the `H¹` polynomial of an elliptic curve with complex multiplication by `ℚ(i)` is rational. Testing its full root multiset over either embedding of that coefficient field gives the same all-conjugates assertion.

### 1.7 Representation–sheaf comparison on an arithmetic model

Let `U` be a normal connected arithmetic model over `ℤ[1/ℓ]`, with a specified generic geometric point, and let a continuous representation factor through its actual étale fundamental group. Under the lisse-adic sheaf/continuous fundamental-group representation equivalence, construct its corresponding sheaf `ℱ`. At every relevant closed point, identify the action on the geometric stalk with the local Frobenius action on the representation. Hence identify the two characteristic polynomials and transport punctual purity and chosen-embedding purity.

The model and the fundamental-group factorization are part of the hypotheses. Unramifiedness outside a finite set is not by itself a proof of a lisse extension over an arbitrary model. Equality of the root multisets also identifies the algebraic-integral-eigenvalue condition on the representation with sheaf integrality in DWP.7's sense. If the representation polynomial descends to `ℤ[X]`, it satisfies that condition. The converse from sheaf integrality to an integer polynomial needs rationality.

At a closed point of degree `d`, the comparison uses `F^d` and residue size `q^d`. The weight remains `w` relative to that size. Check this identification on both arithmetic and geometric Frobenius before applying the base-extension theorem. Retain compatibility with coefficient extension and the chosen embedding. The sheaf predicates are exactly those of DWP.5, not new predicates specialized to this model.

Check the constant rank-one sheaf, of weight zero, and the Tate sheaf `ℚ_ℓ(1)`, of weight minus two on its prime-to-`ℓ` arithmetic model. At degree-`d` points the weights remain zero and minus two, respectively.

Sources are [Deligne II, (1.1.13), (1.2.2)–(1.2.3), pp. 152–154][WII]. Prerequisites are the R34.1 Frobenius and weight definitions; DWP.0 finite-base-extension weights (§0.12); DWP.5 punctual purity (§5.3); DWP.7 integral sheaves (§7.2); and EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.2b's lisse-adic equivalence. The exact normal-scheme and lattice hypotheses are those of §F.4.5 in the supplier contracts above.

### 1.8 Arithmetic normalization of complex weights

Let `X₀/𝔽_q` be smooth of pure dimension `d`, with `ℓ ≠ char(𝔽_q)`, and let `K` be a bounded constructible adic complex with lisse cohomology sheaves. Use the duality comparison

`D_X K = RHom(K, ℚ_ℓ(d)[2d]).`

Prove the smooth-lisse specialization of DWP.8: `K` is pure of complex weight `w` if and only if `ℋⁱ(K)` is punctually pure of weight `w + i` for every `i`. For a lisse sheaf `ℱ` of weight `r`, obtain

`wt(ℱ[a](b)) = r + a − 2b.`

In particular `ℱ(d)[d]` has weight `r − d`, while `ℱ(N)[2N]` has the same weight as `ℱ`. Upper complex weight bounds are cohomological upper bounds; lower bounds are defined by duality, and the identification with punctual lower bounds uses the smooth lisse hypotheses. Do not export that identification for arbitrary constructible complexes on singular supports.

**Checks.**

* On a smooth curve, the weight-zero constant sheaf shifted by `[1]` has complex weight one; an additional twist `(1)` gives weight minus one.
* The normalization `ℱ(N)[2N]` retains the weight of `ℱ`.
* At `ℓ = p` on `ℙ¹_{𝔽̄_p}`, the étale sheaves `μ_{pⁿ}` are zero and constant-coefficient p-adic étale `H²` is zero, so this dualizing Tate line cannot be obtained by substituting p for `ℓ`. The vanishing follows from Artin–Schreier and `H^{>0}(ℙ¹,𝒪) = 0`.

Sources are [Deligne II, (6.2.1)–(6.2.5)(b), p. 247][WII]; the coefficient boundary uses [Stacks, Kummer, tag 03PL](https://stacks.math.columbia.edu/tag/03PL) and [Artin–Schreier, tag 0A3J](https://stacks.math.columbia.edu/tag/0A3J). Prerequisites are DWP.8 mixed complexes (§8.1), pure complexes (§8.2), smooth lisse purity (§8.9); EtaleCohomologyFoundations §F.6 smooth purity (§F.6); EtaleCohomologyFoundations §§F.5–F.6 trace pairings (§F.6), Galois equivariance (§F.4.6), rational Poincaré duality (§§F.5–F.6); and the preceding arithmetic sheaf comparison. This target has no place on the early numerical route to Faltings.

### Examples

The scalar Tate and trivial actions, the zero representation, the mixed-weight direct sum and the quartic unit give the positive and negative checks above. The factor `X−√2` of `X²−2` tests the rationality premise independently of integral roots.

### Dependencies

*Needs:* ArithmeticGaloisRepresentations §§1.1–1.12, 2.1–2.6; DeligneWeightsAndPurity DWP.0 for the numerical portion. The sheaf and complex comparisons additionally use DeligneWeightsAndPurity §§5.3, 7.2, 8.1–8.2, 8.9 and EtaleCohomologyFoundations §§F.0.2, F.4.5–F.6.

## Layer 2: Curves, abelian varieties and good reduction (R34.2)

This layer turns the independent curve and abelian estimates of DWP.1 into statements about number-field representations. The required geometric comparisons are Tate/`H¹` duality, exterior powers, specialization at good reduction, and the curve–Jacobian trace comparison. General Weil II and decomposition are not prerequisites of these targets.

### 2.1 Frobenius on the Tate module and first cohomology

Let `A/𝔽_q` be an abelian variety of dimension `g`, and let `ℓ` be different from the residue characteristic. Its Frobenius endomorphism `π_A` acts on geometric torsion points by the same power map as arithmetic Frobenius. This equality on points identifies their actions on `T_ℓ A`; it does not identify the endomorphism of the variety with an automorphism of the coefficient field. Write `P_{π_A}(X) ∈ ℤ[X]` for the degree-`2g` polynomial of the endomorphism, independent of `ℓ`.

The geometric Frobenius action on `V_ℓ A = T_ℓ A ⊗ ℚ_ℓ` is `π_A⁻¹`. The Galois-equivariant comparison

`H¹_ét(A_{𝔽̄_q}, ℚ_ℓ) ≃ Hom_{ℚ_ℓ}(V_ℓ A, ℚ_ℓ)`

therefore gives the geometric action on `H¹` the polynomial `P_{π_A}`. Import the all-conjugates Weil estimate for `π_A` from DWP.1. It gives geometric weight `1` on `H¹` and `−1` on `V_ℓ A`. This statement uses the contragredient action and the identification on torsion points, not an unspecified transpose.

For an elliptic curve, `P_{π_A} = X² − aX + q`, where `a = q + 1 − #A(𝔽_q)`. For example, `y² = x³ − x` over `𝔽₃` has four points, so `a = 0`, the cohomological polynomial is `X² + 3`, and its complex roots are `±i√3`. The geometric Tate roots are their inverses. The identity that the contragredient dual at the inverse element has the original characteristic polynomial, over any coefficient field, isolates precisely this variance convention.

Sources are [Milne, Chapter II, §1, Theorem 1.1 and its proof, pp. 75–76; Chapter I, Remark 12.5, p. 56][AV]. Prerequisites are R34.1's Frobenius and weight definitions; A6 the Tate polynomial (§A6.11); A4's equivariant `H¹` comparison; ArithmeticGaloisRepresentations §§6.1–6.2 the Tate module (§6.1), Tate functoriality (§6.1); ArithmeticGaloisRepresentations §§2.1–2.6 cyclotomic and finite characters (§1.2); DWP.0 tensor and contragredient spectra (§0.13); and DWP.1 the Frobenius adapter (§1.1), the abelian Weil estimate (§1.4). The A6 endomorphism-polynomial theorem alone does not supply A4's cohomology comparison.

### 2.2 Purity and integral polynomials at good reduction

Let `A/K` have dimension `g`, fix a coefficient prime `p`, and let `T` contain the places of bad reduction and the places above `p`. At each `v ∉ T`, require an actual abelian scheme over `𝒪_v` with generic fibre `A`. Néron–Ogg–Shafarevich gives unramifiedness of `V_p A`; smooth proper base change and Tate/`H¹` duality give the Frobenius-equivariant cohomological specialization.

The resulting assertions are:

* `H¹(A_K̄,ℚ_p)` is pure of weight `1` outside `T`, and its geometric Frobenius polynomial is `P_{π_{A_v}} ∈ ℤ[X]`, independent of the coefficient prime different from the residue characteristic.
* `V_p A` is pure of weight `−1`. If `g>0`, it fails the integer-polynomial predicate at every such place: the constant coefficient of its geometric polynomial is `q_v^{−g}`, which is not an integer.
* The equivariant cup-product isomorphism `Hⁱ ≃ ⋀ⁱ H¹` makes `Hⁱ` pure of weight `i`, with integer Frobenius polynomials. This includes the zero groups outside the cohomological range.
* `det H¹ ≃ ℚ_p(−g)` has weight `2g`. At `g = 0`, both degree-one representations have rank zero and polynomial `1`; the nonintegrality assertion does not apply.

The integer polynomials of exterior powers come from the specified abelian reduction polynomial and its symmetric expressions, not merely from purity. Track the coefficient embeddings and specialization maps so the statement applies to the genuine arithmetic representation. The noninteger constant coefficient at positive dimension and the rank-zero Check distinguish the strict dimension hypothesis and its boundary case.

For a smooth proper geometrically connected curve `C/K` with a smooth proper model at `v ∤ p`, apply smooth proper base change **to the curve itself**. Then use the Jacobian of its smooth residue curve and the finite-field curve–Jacobian comparison to obtain purity of its geometric `H¹` of weight `1`, and an integer polynomial. This route does not require a theorem asserting that the generic Jacobian has good reduction. The cohomological groups in degrees zero and two have weights zero and two. Singular reduction requires the degeneration layer instead.

These are the early inputs for FaltingsFinitenessAndIsogenyTheorems R28.4 and the good-reduction cohomology in MordellLawrenceVenkatesh LV.1. Semisimplicity and finiteness arguments belong to those consumers. Sources are [Lawrence–Venkatesh, equation (3.2), p. 16][LV]; [Milne, Chapter I, Theorem 12.1, p. 55, Remark 12.5, p. 56, Remark 17.2, p. 70; Chapter II, Corollary 1.5 and Remark 1.6(a), p. 78][AV]. Milne's `P_r(t)` in the latter passage is a reciprocal factor; convert it to the characteristic-polynomial convention used here.

For the curve `y² = x³ − x` over `ℚ`, good reduction holds outside `{2}`. At the place `3`, with coefficient prime different from `3`, the `H¹` polynomial is `X² + 3` and the geometric Tate polynomial is `X² + 1/3`. The top exterior-power test for a general `A` has polynomial `X − q_v^g`.

Prerequisites are the preceding finite-field comparison, R34.1 the exceptional-set predicates and the arithmetic linear-algebra operations; DWP.1 the abelian Weil estimate (§1.4), curve cohomology weights (§1.7); A6 the endomorphism polynomial (§A6.10); A4's `H¹`/exterior-power comparisons; NeronModelsAndSemistableAbelianVarieties §5.1 Néron–Ogg–Shafarevich (§5.1); ArithmeticGaloisRepresentations §§6.1–6.2 torsion specialization (NeronModelsAndSemistableAbelianVarieties §5.0a); and EtaleCohomologyFoundations §§F.0–F.4 smooth proper base change. The exact AbelianSchemesAndArithmeticModuli §A4.4 and EtaleCohomologyFoundations §§F.2, F.4 interfaces are specified in the supplier contracts above.

### 2.3 Point counts and traces at good places

For the reduction `A_v/𝔽_{q_v}`, let `α₁,…,α_{2g}` be the roots of `P_{π_{A_v}}`. Apply DWP.1's point-count theorem to obtain, for every `m ≥ 1`,

`#A_v(𝔽_{q_v^m}) = ∏_{j=1}^{2g} (1 − α_j^m).`

Its explicit estimate is

`|#A_v(𝔽_{q_v^m}) − q_v^{mg}| ≤ 2g q_v^{m(g−1/2)} + (2^{2g} − 2g − 1) q_v^{m(g−1)}.`

At `g = 1`, identify `a_v` with the trace of geometric Frobenius on `H¹`, and obtain `|a_v| ≤ 2√(q_v)`. Verify agreement with Tau Ceti's EllipticCurves Layer 3 Hasse theorem. The trace on the geometric Tate representation is instead `a_v/q_v`, by the inverse-root formula. The statement is about the finite-field reduction and its arithmetic specialization, not about counting points of the generic variety over a local field.

Sources are [Milne, Chapter II, Theorem 1.1, pp. 75–76][AV]. Prerequisites are R34.2's good-reduction comparison and DWP.1 abelian point counts (§1.5), the Hasse comparison (§1.8). The point-count proof and positivity input stay with DWP.1; this target identifies their arithmetic traces and retains the formula at every residue extension.

### 2.4 Curve traces over every residue extension

Let `C_v/𝔽_{q_v}` be the smooth proper geometrically connected reduction of a genus-`g` curve. Let `α₁,…,α_{2g}` be its geometric `H¹` roots. The fixed-point trace formula, including its curve–Jacobian identification, gives

`#C_v(𝔽_{q_v^m}) = 1 + q_v^m − ∑_j α_j^m,  |#C_v(𝔽_{q_v^m}) − (1 + q_v^m)| ≤ 2g q_v^{m/2}`

for every `m ≥ 1`. The degree-zero root is `1`, the degree-two root is `q_v`, and the `H¹` comparison with the Jacobian is the pullback along an Abel–Jacobi map over the appropriate geometric field. Without a rational point, use SchemeAndStackFoundations §3.6’s `Pic⁰` and `Pic¹` and the finite-level comparison of InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1. Geometric choices of Abel–Jacobi map differ by translation on `Pic⁰`. Prove from A4.4’s addition-map coproduct that translations act trivially on `H¹`, so their pullbacks agree, descend and intertwine Frobenius. For genus zero the `H¹` contribution is empty and the formula is exactly `q_v^m + 1`.

**Checks.**

* For `ℙ¹`, `Pic⁰` and `H¹` are zero and the count is `q_v^m + 1`.
* On an elliptic curve, changing the Abel–Jacobi base point translates its Jacobian and leaves `H¹` unchanged.
* For a smooth proper curve with no chosen rational point, geometric Abel–Jacobi maps give the same Frobenius-equivariant `H¹` comparison; the statement requires no supplied rational section of `Pic¹`.

For a rank-two polynomial `X² − aX + q`, define `t_m = α^m + β^m`. The tests use `t₀ = 2`, `t₁ = a`, and `t_m = at_{m − 1} − qt_{m − 2}` for `m ≥ 2`. The curve `y² = x³ − x` over `𝔽₅` has eight points, so `a = −2` and `t₂ = a² − 2q = −6`. Its point count over `𝔽₂₅` is `25 + 1 − (−6) = 32`. The eight points over `𝔽₅` consist of seven affine points and the point at infinity; the second-power identity follows from `α + β = a` and `αβ = q`.

Sources are [Deligne I, (1.5.1), p. 275, and (1.13)–(1.15), pp. 278–279][WI]. Prerequisites are the smooth-curve part of the preceding good-reduction target; DWP.1 curve cohomology weights (§1.7), the curve Weil estimate (§1.6); EtaleCohomologyFoundations §§F.2.1–F.2.2, F.4 for smooth proper base change; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 for the all-power trace formula; SchemeAndStackFoundations §3.6 for the unpointed Picard objects; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1 for the finite-level and rational curve–Jacobian comparison; and JacobianChallenge Layers D–F for pointed Abel–Jacobi, with AbelianSchemesAndArithmeticModuli §A4.4 for translation invariance. No trace construction or new Rosati positivity proof belongs here.

### Examples

For `y²=x³−x`, the residue fields `F₃` and `F₅` give the displayed `H¹` polynomials; at `F₂₅` the trace recurrence gives 32 points. At dimension zero the polynomial is 1 and the positive-dimension nonintegrality assertion does not apply.

### Dependencies

*Needs:* R34.1's numerical portion; DeligneWeightsAndPurity DWP.0–DWP.1; AbelianSchemesAndArithmeticModuli §§A4.1, A4.4, A6.10–A6.11; ArithmeticGaloisRepresentations §§6.1–6.2; NeronModelsAndSemistableAbelianVarieties §5.1; EtaleCohomologyFoundations §§F.2.1–F.2.2, F.4; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1, IG.0.T3; SchemeAndStackFoundations §3.6; JacobianChallenge Layers D–F; EllipticCurves Layer 3.

## Layer 3: Arithmetic specialization and comparison models (R34.3)

This layer identifies the traits, coefficient systems, specialization maps and inertia actions used by arithmetic applications. A general nearby-cycle theorem supplies a tool; applying it requires the actual mixed-characteristic model and verification of its coefficient and limit hypotheses. The early `LefschetzPencilsAndVanishingCycles §§7a.1–7a.9` exports are used independently of the later invariant-cycle branch.

### 3.1 Proper specialization over an arithmetic trait

Let `S = Spec 𝒪_L` be an excellent henselian mixed-characteristic trait with finite residue field, let `f:X → S` be proper of finite type, and let `ℓ` be invertible on `S`. For `Λ_n = ℤ/ℓⁿ`, take the actual bounded constructible finite-Tor coefficient complexes `ℱ_n`, their generic and special restrictions, and compatible transition morphisms. With geometric generic and special points, establish the arithmetic proper-base-change comparison

`RΓ(X_s̄, RΨℱ_{n,η̄}) ≃ RΓ(X_η̄, ℱ_{n,η̄}).`

Identify the specialization map from the special-fibre coefficients to nearby cycles. Apply the nearby/vanishing triangle and obtain the cohomological specialization sequence. All maps carry the correct decomposition-group and inertia actions, with the corresponding descended residue Galois action. The comparison is functorial for the coefficient and trait changes in LPV.0. Generic smoothness by itself does not give these arithmetic assertions, and replacing the trait by one with algebraically closed residue field loses the finite-residue arithmetic datum unless descent is also supplied.

For the adic and rational version, verify uniform constructibility and amplitude, finite-Tor conditions, derived completeness, and compatibility of the transition maps on the specified coefficient system. Take derived inverse limits before tensoring with `ℚ_ℓ`. Invoke Mittag–Leffler or the exact applicable derived-limit theorem before identifying cohomology of that limit with an ordinary inverse limit. An unchecked equality `Hⁱ(lim← ℱ_n) = lim← Hⁱ(ℱ_n)` is not a substitute.

At smooth proper good reduction with a lisse extension, vanishing cycles are zero, specialization is an isomorphism and inertia acts trivially. A nonproper affine degeneration is outside this proper comparison and would require the separately specified compact-support theorem.

Carayol's application uses nonconstant lisse coefficient sheaves at finite level, extended by his étale level covers. Prove the compatibility and finiteness conditions on those sheaves, not only on constant coefficients. The level maps and coefficient extensions are actual model data. The specialization sequence then applies to those coefficients and can be restricted to the relevant cuspidal eigensummand.

Sources are [Carayol, §4.1–§4.3, pp. 423–424][C]. Prerequisites are EtaleCohomologyFoundations §§F.0–F.4 proper base change and LPV.0 the nearby/vanishing triangle (§0.5), specialization functoriality (§0.6), constructibility (§0.7), coefficient and trait change (§0.7), adic realization (§0.8). LPV.1 supplies inertia, variation and `N`; it does not replace the adic realization or the verification of these coefficient hypotheses.

### 3.2 Normalization, nodes and the descended graph action

For an actual proper semistable curve over a trait, let `C_η̄` be the smooth geometric generic fibre, `Y` its geometrically reduced nodal special fibre, `ν:Ỹ → Y` its geometric normalization, and `Γ` its geometric dual graph. With constant `ℚ_ℓ`-coefficients, identify the Frobenius-equivariant sequences

`0 → H¹(Γ, ℚ_ℓ) → H¹(Y, ℚ_ℓ) → H¹(Ỹ, ℚ_ℓ) → 0,`

`0 → H¹(Y, ℚ_ℓ) → H¹(C_η̄, ℚ_ℓ) → H₁(Γ, ℚ_ℓ)(−1) → 0.`

The graph, components and branches are geometric. Frobenius may permute them, and the sequences carry that descended action; a graph built only from rational components can give the wrong representation. Import the specialization and normalization maps, their choice independence and their base-change compatibilities from the semistable-curve supplier.

Apply these formulas only after ModularCurvesPartII Layer 11 or R34.3's Hilbert model construction supplies the specified regular or semistable model, including any required finite extension and the node-thickness and level-cover data. No assertion that every modular or Drinfeld level model is nodal or semistable is included. ModularCurvesPartII Layer 11 is the model prerequisite; ModularCurvesPartII Layer 12's downstream degeneration results cannot supply it.

For Carayol's nonconstant coefficient sheaves, use his coefficient normalization sequence in §4.5. Retain the residual term `A` and remove it only after applying the cuspidal eigensummand result of §4.4. The constant-coefficient graph formula alone does not prove that removal. Construct this coefficient and eigensummand step as part of the present target, using Carayol §4.4–§4.5 and the actual model and Hecke action.

The tests distinguish a good-reduction fibre, whose graph has no cycle, from a split one-node genus-one fibre. In the latter, the graph line has weight zero and the vanishing quotient `ℚ_ℓ(−1)` has weight two. The generic representation therefore has a monodromy filtration rather than a good-reduction pure-weight-one decomposition. Its degree-one geometric monodromy satisfies `N² = 0` and the normalization in the next target.

Sources are [Carayol, §4.2–§4.5, pp. 423–425][C], and [Saito, §8, Claim 5, pp. 37–38][S]. Prerequisites are proper-trait specialization; LefschetzPencilsAndVanishingCycles §§7a.1–7a.9 normalization (§7a.1), specialization (§7a.2), base change (§7a.5); ModularCurvesPartII Layer 11; R34.3's Hilbert model construction; and the coefficient filtration constructed in this R34.3 target. These imports require no late invariant-cycle or hard Lefschetz theorem.

### 3.3 Mixed-characteristic Picard–Lefschetz normalization

Take a proper flat degeneration over the stated arithmetic trait, with regular total space and one isolated nondegenerate quadratic singularity in the special fibre. Specify the local smoothing equation `Q − b`, where `b` is the uniformizing parameter. The quadratic and regularity hypotheses, not just the existence of a singular point, are required to apply LPV.2.

For odd relative dimension `n = 2m + 1`, let `δ ∈ Hⁿ(X_η̄,ℚ_ℓ(m))` be the transported vanishing cycle. With the pairing in this twisted normalization, prove

`σx = x + (−1)^{m+1} ε_b(σ)(x, δ)δ,`

where `ε_b = t_ℓ` is the tame character of the trait for the uniformizer `b`, as in LPV.2 §2.8. In the untwisted convention the cup-product pairing has target `ℚ_ℓ(−n)`, and converting the formula must retain the resulting Tate factors. The mixed-characteristic Picard–Lefschetz and cup-product comparison are required LPV.2 theorems; they do not follow solely from the arithmetic quasi-unipotence theorem.

For even relative dimension, use the separate reflection formula and quadratic character, with the source's residue-characteristic restrictions. In residue characteristic two, use the Clifford-centre branch rather than a prime-to-two discriminant shortcut. An even-dimensional reflection need not be unipotent. The alternating odd-dimensional formula is not an even-dimensional symplectic statement.

Normalize the logarithmic operator with geometric Frobenius by

`FNF⁻¹ = q⁻¹N.`

For a curve, N maps the vanishing quotient to the graph subspace with twist `(−1)`, equivalently `N : Gr₁ V(1) → Gr₋₁ V` in the centred indexing, and gives `N² = 0`. Check the convention with `F = diag(1,q)` and `N = [[0, 1], [0, 0]]`, for `q ≠ 0`: N sends the second basis vector to the first and kills the first. The matrix test fixes the scaling and direction; it does not construct the degeneration or its tame inertia action.

**Checks.**

* For relative dimension one, the sign is minus; for dimension three it is plus.
* Replacing `b` by `−b` leaves the character on inertia unchanged: over the strict henselization the unit `−1` has compatible `ℓ`-power roots.
* For a split nodal curve, the matrices above give graph weight zero, vanishing weight two and `N² = 0`.

Sources are [Deligne I, (4.1), p. 287, and (4.2)–(4.3), pp. 288–289][WI]. Prerequisites are proper-trait specialization and LPV.2 odd Picard–Lefschetz (§2.8), even variation (§2.8), including their coefficient and cup-product compatibilities. Preserve the separate odd, even and characteristic-two branches when translating to an arithmetic local representation.

### 3.4 The crystalline weight spectral sequence

For the Hilbert targets in R34.3, R34.5 and R34.6, fix Saito's auxiliary coefficient number field L containing `E₀` and the conjugates of F and splitting the quaternion algebra; enlarge it to contain the Hecke eigenvalues and admit the transferred representation models used in R34.6. Retain the embeddings `ι_λ:L→L_λ` for `λ∣ℓ≠p` and `ι_μ:L→L_μ` for `μ∣p`. On the crystalline side retain the coefficient algebra `K₀⊗_{ℚ_p}L_μ`, where `K₀=W(k)[1/p]`. For Saito's completed-unramified realization also specify the embedding of the completed unramified base into `C_μ=(L_μ^nr)^∧` selecting the factor, as in [Saito §2, pp. 11–12 and §8, p. 35][S]. On the full coefficient algebra, Frobenius and the geometric descent action fix `L_μ`, and monodromy is zero on that coefficient factor. Semilinear Frobenius can permute the factors of the algebra; retain the full algebra for its compatibility. Select the `C_μ` factor for the linearized Weil action and monodromy, which preserve it. Coefficient extension and this factor selection commute with the stated correspondences and their images.

Construct **`saito-crystalline-weight-spectral-sequence`** for the special log fibre Y of a proper strictly semistable model over a complete mixed-characteristic DVR with perfect residue field k of characteristic p. Write `W=W(k)`, and let `Y^(r)` be the disjoint union of `(r+1)`-fold component intersections, with negative or absent strata zero. From CrystallineCohomology §§CR.6.1, CR.6.5 construct the finite filtered rational log-crystalline complex and its convergent sequence

`E₁^{a,b} = ⨁_{j≥max(0,−a)} H_crys^{b−2j}(Y^{(a+2j)}/W)[1/p](−j) ⇒ H_{log-crys}^{a+b}(Y/W)[1/p].`

Identify the filtration on this Hyodo–Kato abutment. Order the components and use the ordered residue coordinates: `d₁=δ*+δ_*`, with sign `(−1)^h` for deletion of the h-th index. Here `δ*` restricts to the next intersection stratum, while `δ_*` is Gysin in the opposite direction, of degree two and twist `(1)`. Prove `d₁²=0` and invariance under reordering. Construct the twisted map `N:E₁^{a,b}(1) → E₁^{a + 2,b − 2}`, the identity on common stratum summands and zero otherwise, and identify its abutment with raw uniformizer-normalized Hyodo–Kato monodromy `N_HK`. For `v_V(π) = 1` and `e = v_V(p)`, this is `N_π = eN_p` in the period comparison below. On a twist `(−j)`, crystalline Frobenius is multiplied by `p^j`; retain `Nφ = pφN`. For supplied model descent and correspondence data, prove compatibility with the semilinear Weil action, its linearization, finite étale level pullback/trace, the specified prime-to-p isogenies, permutations and Hecke correspondences. First establish these compatibilities for rational constituent correspondences, then extend L-linearly to Saito's projector e after extending the étale sequence to `L_λ` and the crystalline sequence to `K₀⊗_{ℚ_p}L_μ` and its chosen `C_μ` factor. Prove that coefficient extension commutes with the filtered complexes, differentials, monodromy and image of e. Under ramified base change of index d use CrystallineCohomology §CR.6.5’s comparison with raw monodromy divided by d.

For Saito’s model and L-coefficient projector e in the `L_λ` and chosen `C_μ` realizations, identify the five possible nonzero E₁ positions of §8, p. 37. After finite-residue descent, PadicDifferentialEquationsAndRigidCohomology §RD.7.7 and DWP §4.3 make the stratum terms pure of weight b and prove E₂ degeneration by weight separation. Prove Claim 5’s map

`ker(E₁^{−1,q₀+2} → E₁^{0,q₀+2})(1) —N→ coker(E₁^{0,q₀} → E₁^{1,q₀})`

is an isomorphism: use the graph pairing for constant coefficients, and construct §9’s vanishing/interior-weight argument for the actual nonconstant coefficient isocrystal. This identifies the projected filtration with the monodromy filtration. It asserts that identification for Saito’s projector and hypotheses, not for an arbitrary proper semistable variety.

Sources: [Saito, §8, pp. 35–38, Claim 5; §9, Proposition 1′, p. 39; crystalline preliminaries pp. 39–41; Lemmas 5–9, pp. 41–44, and the conclusion of the proof on p. 45 (Lemma 7’s proof uses universal deformation on p. 44; Lemma 9 identifies the connected part with a Lubin–Tate formal group and represents its extension functor)][S]; A. Mokrane, *La suite spectrale des poids en cohomologie de Hyodo-Kato*, Duke Math. J. 72 (1993), pp. 301–337, the crystalline sequence cited in Saito §8. Prerequisites are CrystallineCohomology §§CR.3.3–CR.3.4, CR.3:duality.1, CR.6.1, CR.6.5, the strictly semistable Hilbert model/projector construction, LPV §7a.3’s curve graph pairing and the stated stratum-weight suppliers, with DWP §0.12’s power criterion for the original Weil action after finite-residue descent. LPV §§7a.8–7a.9 supplies only the separate prime-to-p étale sequence.

**Checks.**

* At smooth proper good reduction only column `a=0` survives, the abutment is ordinary rational crystalline cohomology and `N=0`.
* For a split `I_n` genus-one fibre with `n≥2`, the component and node strata are smooth; after taking the d₁ kernel/cokernel the outer terms each have rank one and the nonzero twisted N agrees with the graph pairing. E₂ degeneration alone does not prove this isomorphism.
* For Saito’s abelian scheme over a semistable curve, `Y^(r)` is empty for `r>1`; the projector confines the terms to the five positions of §8 and the two maps in Claim 5.
* If L separates two embeddings of F, apply e only after extending coefficients through `ι_λ` or `ι_μ`; projecting before that extension need not define either separate embedding summand. Further extension of L preserves the five positions and the image filtration.
* A split `I₁` fibre has a self-node and a singular sole component. Use LPV’s normalized-branch curve formulation there, or make a ramified extension and resolve to `I_n` with `n≥2` before using this component-intersection sequence.
* Over `W(F̄₇)`, the regular minimal genus-two model `y²=(x²−7)∏_{i=1}⁴(x−i)` has an irreducible nodal special fibre. Its component is singular and has no distinct-component intersection; a ramified quadratic extension and resolution separate the branches into smooth components before this sequence applies.

### 3.5 Traces of the stratum correspondences

Construct **`saito-stratum-correspondence-trace`** for the smooth projective strata in Saito’s model, with their finite-residue descent and original Weil action. For the pure d-dimensional stratum union `Z=Y^(r)`, write `W = W(𝔽̄_q)` and orient a rational codimension-d correspondence `Γ` on `Z×Z` so its action is `(pr₁)_*(cl(Γ) ∪ pr₂^*(−))`; the graph `(x,f(x))` then acts by `f*`. Include the specified Hecke pullback/trace, prime-to-p isogeny and permutation compositions, not arbitrary endomorphisms of a cohomology space.

For `σ ∈ W⁺`, let `n(σ)≥0` be Saito’s geometric Frobenius exponent and `q=p^f` the residue size of the local field. The geometric morphism on the strata is `σ_geom = σ ∘ Fr_abs^{f n(σ)}`. Descend its composite with `Γ` to a common finite residue field. With G the graph `(x,σ_geom(x))`, define `Γ_σ = (pr₁₃)_*(pr₁₂^*[G] · pr₂₃^*Γ)`, using the projections from `Z³` to `Z²`; its action is `σ_geom^* ∘ Γ_*`. Prove, in the respective coefficient fields, that both alternating traces equal the image of the same rational intersection number:

`∑_i (−1)ⁱ Tr(σ ∘ Γ_* ∣ Hⁱ_ét(Z, ℚ_ℓ)) = deg(Γ_σ · Δ_Z) = ∑_i (−1)ⁱ Tr(σ^* φ^{f n(σ)} ∘ Γ_* ∣ Hⁱ_crys(Z/W)[1/p]),  ℓ ≠ p.`

The crystalline operator here is the linearized Weil operator; its semilinear factors separately have no ordinary linear trace. Consume CrystallineCohomology §CR.3:duality.1’s proper smooth crystalline trace, derived Poincaré duality, finite étale transfer, Gysin maps and diagonal coevaluation, specifically “Proper smooth crystalline Gysin maps”, clauses (2)–(3), for projection and composition, and “Diagonal class and crystalline coevaluation”, clause (2), for the identity action (with the two projections exchanged to match our correspondence convention). Construct here the additional compatibility of rational cycle classes with intersection and correspondence composition needed for this Weil-twisted trace equality. On the étale side derive the same correspondence trace identity from EtaleCohomologyFoundations §§F.2, F.5–F.6’s Künneth, cycle classes and duality. Match restrictions, Gysin maps and twists on both weight spectral sequences, including the factor `q^(j n(σ))` on `(−j)`. Their alternating total traces then give Saito §8 Claim 4(1); traces alone give no monodromy identification.

For the coefficient number field L and embeddings fixed above, extend this identity to `Γ_L=∑_t a_tΓ_t` with `a_t∈L` and rational constituent correspondences `Γ_t`. Set

`t_{σ,Γ_L} = ∑_t a_t deg((Γ_t)_σ · Δ_Z) ∈ L.`

The alternating trace on `Hⁱ_et(Z,L_λ)` is `ι_λ(t_{σ,Γ_L})`; on crystalline cohomology extended to the chosen `C_μ` factor it is `ι_μ(t_{σ,Γ_L})`. Prove independence of the expression for `Γ_L`, L-linearity, and compatibility with extension of L and the two spectral sequences. For an L-coefficient correspondence e acting idempotently and commuting with `σ` and `Γ_L`, the alternating trace on its image equals the ambient alternating trace of `σeΓ_L`. Apply this to Lemma 3's e and the auxiliary `e°`; the common projected traces lie in L and need not be rational. Descent to the Hecke coefficient field requires R34.6's separate multiplicity/model argument.

Sources: [Saito, §6, Lemma 3, pp. 30–31; §8, Claim 4(1) and proof, pp. 35–36][S]; H. Gillet–W. Messing, *Cycle classes and Riemann-Roch for crystalline cohomology*, Duke Math. J. 55 (1987), pp. 501–538; M. Gros, *Classes de Chern et classes de cycles en cohomologie de Hodge-Witt logarithmique*, Mém. Soc. Math. France (N.S.) 21 (1985), Chapter II §§3–4. Prerequisites are CrystallineCohomology §CR.3:duality.1 with its transitive prerequisites listed in the supplier contract above, EtaleCohomologyFoundations §§F.2, F.5–F.6, the model’s L-coefficient correspondence/descent data and the two weight spectral sequences. The supplied crystalline maps are used on smooth projective pure-dimensional strata over a perfect field and rationalized by inverting p; additional cycle classes agree with the supplied smooth-immersion classes. Ordinary crystalline Frobenius polynomials and weights are supplied separately by PadicDifferentialEquationsAndRigidCohomology §RD.7.7.

**Checks.**

* For `Z=P¹` and the m-th q-Frobenius, both alternating traces and the graph–diagonal intersection are `1+q^m`.
* For the identity correspondence, the trace is the Euler characteristic and the intersection is the diagonal self-intersection; no finite set of isolated fixed points is required. On P¹, the diagonal class is `h₁+h₂`: pushing its product with `pr₂*(1)` or `pr₂*(h)` along pr₁ gives respectively 1 and h, so the two trace contributions are 1 and 1. Projection and composition with this diagonal preserve both classes.
* On an elliptic stratum, identity and inversion act differently on `H¹` despite the same ordinary Frobenius polynomial of the stratum. Ordinary Frobenius-polynomial equality does not supply the `Γ`-trace equality.
* For Z the disjoint union of two rational points, rational correspondences act by 2×2 rational matrices. Let `A=[[0, 2], [1, 0]]`, `L=ℚ(√2)`, `a=√2` and `e=(1+A/a)/2`. Then `e²=e` and `Tr(A∣im e)=a∉ℚ`. The two embeddings of L give opposite traces. The projector and trace identities can be checked after embedding L in `ℂ`; each coefficient realization uses its specified embedding.

### 3.6 Saito's semistable model and period comparison

Use Saito's specified Hilbert–Shimura construction, with sufficiently small levels `K,H`, and assume every geometric component of the curve `M_K` has genus greater than one. The auxiliary imaginary quadratic field `E₀` splits at the prime `p`, and the chosen completion `E_𝔮` is identified with `F_𝔭`. Let `V` be a finite extension of the **completed maximal unramified extension** of that local field. It is not thereby a finite extension of `E_𝔮`; its residue field is algebraically closed. Consume StableReduction Layers 5, 7 and 8 componentwise for semistable reduction and the unique minimal regular semistable curve model over `𝒪_V`, together with its stable contraction. Use these supplied models for `M_K` and `M_K×N_H`.

Before using component-intersection strata, refine V by a finite ramified extension and take the minimal regular model so that each geometric special-fibre component is smooth and every node joins two distinct components. Construct this refinement from StableReduction Layer 4’s resolution of `xy=π^d`: a common ramification index `d≥2` followed by nodal resolution inserts chains separating both branches of each self-node. Prove that the refinement respects the level maps, extended abelian schemes, isogenies, projectors and original Weil descent. Use the common refinement for the curves and covers occurring in each correspondence; nodal resolution commutes with the finite étale level pullbacks, and uniqueness of the minimal regular model extends the descent action. Choose a Galois extension containing the refinement when carrying that action. Only these strictly semistable models supply the smooth component-intersection strata used here. The stable contraction can have a singular total space and does not replace the regular model.

Retain the exact local equalities in Lemma 4. A level morphism `(g,h)^*` extends uniquely to a finite étale morphism of the minimal semistable models when

`K_𝔭 = (g⁻¹K₁g)_𝔭,  H_𝔮 = H_{1,𝔮}.`

The specified abelian scheme extends over this model. For the lattice pairs defining its isogenies, require their `p`-components to remain unchanged; then the prime-to-`p` isogenies extend étale. Merely calling a map a change of prime-to-`p` level does not state all of these equalities. Write Lemma 3's projector as `e=∑_t a_tΓ_t` with `a_t∈L` and `Γ_t` the rational permutation/prime-to-p endomorphism correspondences. Extend and specialize these constituents, then form their L-linear combination through `ι_λ` and `ι_μ`. Prove compatibility with the model maps and descent, and cohomological idempotence in the `L_λ` and chosen `C_μ` realizations. No rational descent of e is assumed.

The resulting total variety is proper and is an abelian scheme over the strictly semistable curve. Its geometric special fibre has smooth projective strata `Y⁽⁰⁾` and `Y⁽¹⁾`, with no higher intersections. Instantiate LPV §§7a.8–7a.9 only for the prime-to-p étale restriction/Gysin differentials and monodromy. Use `saito-crystalline-weight-spectral-sequence` for the log-crystalline sequence and `saito-stratum-correspondence-trace` for the cross-coefficient traces; retain the curve comparison on these strata. Section 8 supplies the Galois descent action, after a suitable Galois choice of extension of the completed unramified base. Preserve that action in the étale and log-crystalline constructions and in the projector image.

Apply PadicHodgeTheory §§8.1–8.2’s semistable comparison through this layer’s Saito-specific period and descent identifications only after verifying its base, chart, coefficient and completion hypotheses for this model. Extend it to `L_μ` coefficients and the chosen `C_μ` factor, commuting with the L-coefficient e and auxiliary `e°`, coefficient extension, Galois/Weil action, Frobenius and twists. Identify raw `N_HK` with uniformizer-normalized period `N_π = e_VN_p`, where `e_V=v_V(p)`. If the comparison carrier requires a finite local field, supply descent to a finite local extension as a separate model theorem, retaining `e_V`, coefficient embeddings and the ramification-index conversion of N. To discuss weights of strata over finite fields, likewise descend the required equations, maps and rational constituent correspondences to a finite residue extension while preserving the L-action and original Weil action. There is no residue cardinality `#k(V)` to insert into a finite-field weight formula on the algebraically closed base itself.

The model verification exports to the semistable arithmetic realization. Construct the geometric comparison before its arithmetic realization, preserving its independent geometric hypotheses. The local Hilbert eigenform theorem in R34.6 uses these specific data and the auxiliary projector, rather than an arbitrary semistable variety with a vector-space idempotent.

Sources are [Saito, §7, Lemma 4 and proof, pp. 32–34; §8, Claim 4(1), pp. 35–36][S]; the ramified nodal resolution is [Stacks, Example 55.14.1, tag 0CDC](https://stacks.math.columbia.edu/tag/0CDC). Prerequisites are proper-trait specialization; StableReduction Layers 4, 5, 7 and 8; `saito-crystalline-weight-spectral-sequence` and `saito-stratum-correspondence-trace`; LefschetzPencilsAndVanishingCycles §§7a.1–7a.9 the prime-to-p étale SNC spectral sequence (§7a.8), restriction/Gysin differentials (§7a.8), SNC monodromy (§7a.9); PadicHodgeTheory §§8.1–8.2; AInfCohomology §§AI.6.4–AI.6.6; and this layer’s Hilbert model, projector and Saito-specific period and descent identifications. A generic SNC theorem neither constructs Saito's model nor verifies the finite-local-field hypotheses.

### 3.7 The specified coefficient system

Use LefschetzPencilsAndVanishingCycles §§0.5–0.8 for finite-level functoriality, constructibility, finite amplitude, coefficient/trait change and the adic nearby-cycle realization. For the **specified Carayol coefficient extensions**, verify uniform amplitude and constructibility, finite-Tor hypotheses, derived completeness and the transition-map/Mittag–Leffler conditions needed for derived inverse-limit specialization. R34.3's proper-trait comparison uses those verifications and preserves inertia equivariance. The general existence of an adic realization is not a verification of this system's hypotheses. Source: [Carayol, §4.1–§4.3, pp. 423–424][C].

### 3.8 Model-specific arithmetic data

Use the actual bad-prime classical modular curve model and its required regular or semistable extension from ModularCurvesPartII Layer 11, with geometric node thicknesses, level-cover morphisms and coefficient extension data. Those are the hypotheses used to instantiate LPV's formulas in R34.3. The model construction precedes the ModularCurvesPartII Layer 12 degeneration application and cannot be obtained from it. The exact level and model hypotheses must state where semistability holds, rather than assuming it for every level. The arithmetic comparison is sourced at [Carayol, §4.1–§4.5, pp. 423–425][C], with the source-qualified model data supplied by ModularCurvesPartII Layer 11.

### 3.9 Hilbert and Shimura models

Construct Carayol's named `M_{n,H}` integral model, its coefficient extensions and geometric special-fibre normalization. For Saito’s curve models consume StableReduction Layers 4, 5, 7 and 8 componentwise in geometric genus greater than one, retaining the minimal regular semistable model separately from its stable contraction. Construct R34.3’s common ramified refinement to strictly semistable curve models, preserving level maps, correspondences and Weil descent. Construct the additional data on Saito’s sufficiently small-level model with genus-greater-than-one geometric components, `E₀` split at `p`, unchanged local level and lattice components, and the abelian scheme and prime-to-`p` isogeny extensions of Lemma 4. Construct Lemma 3's actual L-coefficient algebraic projector, degree `q₀`, auxiliary character and equivariant comparison, retaining `ι_λ`, `ι_μ` and the chosen `C_μ` factor from R34.3. R34.3 and R34.5 use these distinct model inputs. Include finite-residue descent of strata and rational constituent correspondences preserving the L-action and original Weil action, and finite-local descent when the comparison carrier requires it, with `N_HK = e_VN_p`, `e_V=v_V(p)`, and ramification-index conversion. Sources: [Carayol, §4, pp. 423–425][C]; [Saito, §6, Lemma 3, pp. 30–31, §7, Lemma 4, pp. 32–34, and §8, pp. 34–38][S]; [Stacks, tag 0CDC](https://stacks.math.columbia.edu/tag/0CDC) for nodal resolution.

The intended model signature returns the named proper curve, its normalization, level morphisms and coefficient sheaves, together with identified generic fibre; the Hilbert projector is an L-linear combination of rational algebraic correspondences on the specified total abelian scheme, acting idempotently on cohomology. Its API includes identity/composition for level pullback, the finite-étale extension under Lemma 4's equalities, compatibility with prime-to-p isogenies and extension of L, cohomological projector idempotence and commutation with Hecke/Galois actions, and finite-local/residue descent retaining coefficient embeddings and the original Weil action. The `L_λ` and chosen `C_μ` image comparisons are compatible with further coefficient extension; descent of a rank-two multiplicity to `K_f` belongs to R34.6.

**Checks.**

* For `g=2` and `w=k₁=k₂=2`, `q₀=0` and the auxiliary twist is zero; the projected degree is one.
* Separate embedding factors in Lemma 3 use L-coefficient projectors; extending the rational constituent maps does not assert that their L-linear projector descends to `ℚ`.
* If a local level component changes, Lemma 4's finite-étale extension assertion does not apply to that morphism.
* Contracting a chain of rational components to obtain the stable model can produce a node of thickness greater than one and a singular total space; the contraction does not replace the regular semistable model in the SNC formulas.
* A self-node on an irreducible special component requires the common ramified refinement. The extended finite étale level maps and the original Weil action must commute with its nodal resolutions.
* Over the completed maximal unramified base the residue field is algebraically closed; finite-field strata weights require the separately constructed descent, and cannot use its infinite cardinality as q.

### 3.10 Saito-specific semistable-period identifications

Instantiate PadicHodgeTheory §§8.1–8.2’s semistable comparison on the actual proper strictly semistable Saito model over `𝒪_V`, with coefficient number field L, embedding `ι_μ:L→L_μ` and chosen `C_μ` factor of R34.3. Verify the base and semistable charts, and compatibility with Galois/Weil actions, Frobenius, twists and the L-coefficient correspondences, using `N_HK = N_π = e_VN_p`, `e_V=v_V(p)`. Where the chosen period carrier is over finite local fields, supply finite-local descent and compatibility with the original Weil action, retaining the coefficient embeddings, ramification index and normalized monodromy. Saito's finite extension of the completed maximal unramified base is not already such a field. This is the geometric input to R34.3, which then exports to the semistable arithmetic realization. Sources: [Saito, §7, pp. 32–34, and §8, Claim 4, pp. 35–36][S].

For a finite extension `K/ℚ_p` and a proper strictly semistable model `X/O_K` obtained by this descent, with `K₀` the maximal unramified subfield, use the supplied isomorphism between `B_st⊗_{ℚ_p}Hⁱ_et(X_K̄,ℚ_p)` and `B_st⊗_{K₀}Hⁱ_HK`. Here `e_K=v_K(p)` with `v_K(π)=1`; the total operators are `N_p^B⊗1` on the étale side and `N_p^B⊗1+1⊗(N_HK/e_K)` on the Hyodo–Kato side. The supplied comparison intertwines these operators and its B_dR extension agrees with the filtered de Rham comparison under the compatible uniformizer choice. Apply its Galois, Frobenius, twist, pullback, product and duality compatibilities to the actual maps on this model; derive proper pushforward compatibility by transposition under the normalized trace pairings and verify the cycle classes of the specified rational constituent correspondences. These verifications identify the same geometric operators on both realizations before any projector restriction. *Needs:* PadicHodgeTheory §§8.1–8.2; AInfCohomology §§AI.6.4–AI.6.6; this layer's model and correspondence targets.

For the number field L and `μ∣p` fixed in R34.3, extend both sides by `⊗_{ℚ_p}L_μ`, using `Hⁱ_et(X_K̄,L_μ)` and `D_HK,μ=Hⁱ_HK⊗_{ℚ_p}L_μ` over `K₀⊗_{ℚ_p}L_μ`. Prove that the comparison is `B_st⊗_{ℚ_p}L_μ`-linear, Frobenius and Galois act as the identity on `L_μ`, monodromy is zero on `L_μ`, and the induced filtration commutes with coefficient extension. Extend rational-correspondence compatibility L-linearly through `ι_μ`, so the comparison restricts to the images of Lemma 3's e and `e°`. For every further coefficient extension, identify the extension of `im(e)` with the image of the extended idempotent and prove naturality of this restricted structured comparison. Keep Frobenius compatibility on the full coefficient algebra, allowing it to permute factors. Retain the image and linearized Weil/monodromy identifications on the chosen `C_μ` factor over the completed unramified base. Its intended signature is an isomorphism of these structured period modules, functorial in the model and coefficient embeddings.

For an extension of K of ramification index d, raw HK monodromy scales by d; CrystallineCohomology §CR.6.5’s ramified base-change comparison divides that operator by d. Since `e_K` also multiplies by d, `N_HK/e_K` agrees with `N_p` under base change and finite-local descent, including on the `L_μ` and `C_μ` projector images. The supplied finite-K realization and this model’s completed-unramified descent are distinct assertions. Apply the theorem to Saito’s model only through the descent, coefficient and Weil-action identifications just stated. Sources: [Saito §2, pp. 11–12, §6, Lemma 3, pp. 30–31 and §7–§8, pp. 32–36][S]; PadicPeriodRings §4.1 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.0 for `N_π=e_KN_p`; CrystallineCohomology §§CR.6.3, CR.6.5 for raw Tate monodromy and ramified base change. The log crystalline/Hyodo–Kato objects come from CR.5–CR.6 and periods from PadicPeriodRings §§4.1–4.3.

**Checks.**

* At smooth proper good reduction `N=0` and the comparison restricts to the crystalline realization.
* For a split nodal genus-one degeneration N has rank one; replacing `B_st` by `B_cris` on the entire `H¹` loses the nonzero monodromy.
* For `L=ℚ(√2)`, the L-coefficient projector in the two-point Check restricts the comparison only after extension through `ι_μ`; its A-trace is `ι_μ(√2)`, rather than a rational number. Further coefficient extension preserves this image and its structured comparison.
* For the Tate curve `E_π` over ramified K with `e_K>1`, `N_HK` has coefficient `v_K(π)=1` and `N_p` has coefficient `1/e_K` in the valuation basis. An `I₁` model uses normalized branches for this calculation; a ramified refinement to a strict `I_d` model multiplies raw monodromy by d and its comparison divides by d. The identity `Nφ=pφN` holds for both scalar multiples and does not fix the factor `e_K`.
* For `E_p` over `ℚ_p`, raw `N_HK` has coefficient one in the valuation basis. After a ramified quadratic extension `K/ℚ_p`, `v_K(p)=2` and raw `N_HK` has coefficient two, while `N_p=N_HK/e_K` retains coefficient one. Their ranks alone do not distinguish the factor. Over `K=ℚ₅(√5)` with parameter `π=√5`, the raw coefficient is 1 and the normalized coefficient is `1/2`; after ramification index 3 they are 3 and `3/6=1/2`.

### Examples

Good reduction has no vanishing-cycle contribution; a split nodal genus-one fibre has graph weight zero and vanishing weight two. The displayed 2×2 matrices give `FNF⁻¹=q⁻¹N` with `N²=0`. Nonconstant coefficients retain Carayol's residual A before the cuspidal projector is applied.

### Dependencies

*Needs:* R34.1; EtaleCohomologyFoundations §§F.2.1, F.3a, F.4; LefschetzPencilsAndVanishingCycles §§0.2–2.8, 7a.1–7a.9; ModularCurvesPartII Layer 11; PadicHodgeTheory §§8.1–8.2; AInfCohomology §§AI.6.4–AI.6.6; PadicPeriodRings §§4.1–4.3; CrystallineCohomology §§CR.3.3–CR.3.4, CR.3:duality.1, CR.5–CR.6; StableReduction Layers 4, 5, 7 and 8; PadicDifferentialEquationsAndRigidCohomology §RD.7.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.0, R07.4.27–R07.4.28; EnhancedDerivedSheaves §§0.1–0.4; DerivedModuleAlgebra §1.T.1. The model-specific constructions and coefficient/descent identifications are targets of R34.3.

## Layer 4: Descended pencils and original-coefficient monodromy (R34.4)

This layer verifies the arithmetic inputs to the pencil arguments in DWP.2–4. The geometry comes from LPV.3–5 and EtaleCohomologyFoundations §§F.5–F.7. Finite-extension descent, removal of the radical, and openness in the original coefficient group are independent conditions; none can be replaced by a numerical example of a symplectic matrix.

### 4.1 A pencil over a common finite extension

Let `X₀/𝔽_q` be smooth, projective and geometrically connected of dimension `n + 1`, with a specified projective embedding. After a Veronese embedding of degree at least two, LPV.3 provides a geometrically nonempty open in the pencil parameter space. Take a closed point of that open. Its residue field is `𝔽_{q^d}` for some finite `d`; the construction does not promise an `𝔽_q`-rational point of the open.

Consume LPV §3.5’s common finite-field descent of the chosen axis, incidence blowup, critical-point data and smooth parameter open `U`. Verify that its supplied incidence/blowup identification and map to the parameter line are those of the selected pencil. Use its common field of definition for all equations and morphisms. EtaleCohomologyFoundations §F.7 supplies the axis blowup and weak-Lefschetz comparison maps; this target verifies their arithmetic application hypotheses.

If the model is further extended by degree `e`, Frobenius becomes `F^e` and the residue size becomes `q^{de}`. Transport cohomology with those precise operators and cardinalities. When an eigenvalue `α^d` is a Weil `q^d`-number of weight `w`, the DWP.0 power criterion shows that `α` is a Weil `q`-number of weight `w`. This descends a cohomological weight assertion for an already defined arithmetic action. It does not descend the chosen pencil itself to `𝔽_q`. Purely inseparable field extensions use étale invariance; the finite extensions of finite fields in this construction are separable.

Sources are [Deligne I, (5.6)–(5.7), pp. 291–292, and (6.1), pp. 294–295][WI]. Prerequisites are LPV.3 pencil data (§3.1), pencil existence (§3.4), common finite-field pencil/incidence descent (§3.5); EtaleCohomologyFoundations §F.7 weak Lefschetz (§F.7), the axis blowup (§F.7, applied to the LPV.3 incidence family); DWP.0 the power criterion (§0.12); and SchemeAndStackFoundations §§0.9, 2.15 for common finite-residue-field descent. This target verifies the hypotheses of the supplied descent on the chosen pencil; the weight induction remains in DWP.4.

### 4.2 The arithmetic vanishing quotient and its parity

For the smooth open of that pencil, take the original `ℚ_ℓ`-local system `Rⁿ f_* ℚ_ℓ`. In a geometric smooth fibre let `H = Hⁿ`, let `E ⊆ H` be the span of the transported vanishing cycles, and let `E^⊥` be its orthogonal complement for Poincaré duality. Take LPV §4.4’s radical quotient

`R = E ∩ E^⊥,  V = E/R.`

The induced pairing

`V ⊗ V → ℚ_ℓ(−n)`

is nondegenerate. It is alternating for odd `n` and symmetric for even `n`. A perfect pairing on `H` alone does not imply that its restriction to `E` is perfect; quotienting by the radical is essential. In odd fibre degree, consume DWP §3.1 for the arithmetic descent of E, R and V, their Tate-valued pairing and Frobenius multiplier; verify its hypotheses on the chosen pencil. For a degree-e point over the common field `𝔽_{q^d}`, that multiplier is `q^{den}`. DWP §3.1 has odd fibre dimension as a hypothesis. The even-degree statement here is the parity comparison with LPV §4.4’s symmetric pairing and EtaleCohomologyFoundations §F.4.6’s equivariance; it supplies no symplectic estimate. The descent and quotient constructions remain with their suppliers.

Retain the coefficient field and the pairing multiplier when applying a weight theorem. Even-dimensional symmetric pairings cannot be passed to an odd-dimensional transvection or symplectic argument. Characteristic-two variation likewise uses its specified geometric branch. If `E = 0`, then `V = 0`, and the quotient and weight assertions are vacuous; do not assert irreducibility of the zero representation. LPV.4's corresponding zero-cycle formula retains the extra skyscraper term in `R^{n + 1}f_*`, rather than substituting the nonzero branch's `j_*` expression.

Sources are [Deligne I, (5.8)–(5.9), pp. 292–293][WI]. Prerequisites are the preceding pencil descent; LPV.4 pencil direct images (§4.1), the radical quotient (§4.4); DWP §3.1 for odd-degree arithmetic descent and its Tate pairing/multiplier; EtaleCohomologyFoundations §F.6 smooth purity (§F.6); and EtaleCohomologyFoundations §§F.5–F.6 trace pairings (§F.6), Galois equivariance (§F.4.6), rational Poincaré duality (§§F.5–F.6). The arithmetic invariance and twisted pairing are the comparison inputs to the next target.

### 4.3 Open monodromy in the original coefficient group

In odd middle degree, for the nonzero quotient `V` over its original `ℚ_ℓ`-model, instantiate LPV.5's absolute irreducibility and Kazhdan–Margulis open-image theorems. The geometric monodromy image must be **open in the original symplectic `ℚ_ℓ`-group**. Zariski density is weaker, and scalar extension to a larger coefficient field does not preserve an assertion of openness in the required larger local group.

Use DWP.3 rational pencil factors (§3.10) on the actual descended local factors of `V`. Rationality is an independent hypothesis for the DWP.2 fundamental estimate and cannot be supplied by the desired purity conclusion. Together with the nondegenerate alternating pairing into `ℚ_ℓ(−n)`, these verifications instantiate the fundamental estimate with pairing weight `n`. Keep all local factors and residue-degree powers in the arithmetic field of definition. This target verifies the application hypotheses; DWP.2 owns the estimate and DWP.4 owns the ensuing Weil-bound induction.

Handle `V = 0` separately, with characteristic polynomial `1`, rather than using a nonzero irreducibility or open-monodromy premise. For even degree the pairing is symmetric and the symplectic estimate does not apply. These parity, zero-rank and coefficient restrictions are part of the theorem's interface, not choices to be suppressed in a generic monodromy assertion.

Sources are [Deligne I, (3.1)–(3.2), pp. 283–284, and (5.10), p. 293][WI]. Prerequisites are the preceding quotient; LPV.5 absolute irreducibility (§5.4), open image (§5.8); DWP.3 rational pencil factors (§3.10); and DWP.2 the fundamental estimate (§2.9). The original coefficient field must appear in the monodromy statement supplied to that theorem.

### Examples

A nonempty parameter open can have no `F_q` point but has a point over a finite extension. An alternating odd-degree vanishing quotient supports the symplectic estimate; an even-degree symmetric quotient does not. The zero quotient has polynomial 1 and is handled without a nonzero irreducibility assertion.

### Dependencies

*Needs:* R34.1; LefschetzPencilsAndVanishingCycles §§3.1–5.11; EtaleCohomologyFoundations §§F.5–F.7; SchemeAndStackFoundations §§0.9, 2.15; DeligneWeightsAndPurity DWP.0, DWP.2–DWP.4. R34.4 verifies the arithmetic inputs; the numerical estimates remain with their suppliers.

## Layer 5: Parabolic realizations, projectors and hard Lefschetz (R34.5)

These targets identify the particular arithmetic cohomology and correspondences used in eigenform applications. The classical higher-weight construction, the weight-two abelian quotient, and Saito's Hilbert construction have different degree and auxiliary-character formulas. Each comparison states its model, coefficient, degree and equivariance data before applying a general weight theorem.

### 5.1 Purity of parabolic cohomology

Let `S₀/𝔽_q` be a smooth curve, let `h:𝒜 → S₀` be an elliptic scheme, and assume `ℓ ∤ q`. For `k ≥ 2`, put `r = k − 2` and

`ℱ_r = Sym^r R¹h_* ℚ_ℓ,  W_r = Im(H_c¹(S_{𝔽̄_q}, ℱ_r) → H¹(S_{𝔽̄_q}, ℱ_r)).`

Use the actual lisse sheaf `R¹h_* ℚ_ℓ`, whose stalks have weight one by R34.2 and its abelian-fibre comparison. Its symmetric power has punctual weight `r`. The DWP.7 upper bound on `H_c¹` and smooth-lisse lower bound on `H¹` make their image pure of weight `r + 1 = k − 1`. It is the image, rather than the entire cohomology of the open curve, that has this exact weight: boundary contributions can give other weights in ordinary `H¹`.

For the arithmetic modular application, specify the good residue model, the coefficient embeddings, and the rational algebraic Hecke projector that commutes with Frobenius. The projected parabolic summand inherits the weight. Finite-character summands have weight zero and preserve the calculation under tensoring. Use the parabolic realization of ModularCurvesPartII §§14.1–14.4a and the primitive multiplicity of AlgebraicModularFormsAndSerreWeights R15.5A.1 to identify the actual arithmetic realization; an abstract image of vector spaces is not the geometric identification.

The degree count is `(k − 2) + 1 = k − 1`. Also retain the boundary test: removing the compact-support-to-ordinary image operation must not falsely make all ordinary open-curve cohomology pure. The statement needs both smoothness of the curve and lissity of the coefficient sheaf for the lower bound.

The weight-two input gives weight one; the weight-twelve input gives weight eleven. In the classical Kuga–Sato realization the latter lies in degree eleven of the eleven-dimensional compactification, with zero Tate twist.

Sources are [Deligne II, Corollary (3.3.6), p. 206, and (3.7.1), p. 215][WII]. The earlier [Deligne modular, Theorem 5.1 and Lemma 5.3, pp. 168–169][DM] gives the modular construction with its then-conditional Weil input; DWP supplies the unconditional weight theorem used here. Prerequisites are R34.2's `H¹` comparison; DWP.0 subquotient and extension weights (§0.9), tensor and contragredient spectra (§0.13); DWP.7 cohomological weight bounds (§7.12); and AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 the primitive parabolic realization (R15.5A.1).

### 5.2 Classical Kuga–Sato and Hilbert projector comparisons

For the classical branch, take a fine modular curve `Y(M)`, with `M ≥ 3`, its universal elliptic scheme `𝒜`, and `r = k − 2 ≥ 1`. Specify the smooth projective compactification `W_r` of the `r`-fold fibre power, together with its boundary resolution and good-prime model. Construct the rational algebraic Scholl projector specified below, including the full-level torsion translations. Its image identifies, Hecke- and Galois-equivariantly, the parabolic `Sym^r R¹` realization with the corresponding interior-image subquotient of

`H^{r+1}(W_{r,K̄}, ℚ_ℓ).`

At a prime of actual smooth proper reduction, away from the level, coefficient characteristic and required model denominators, the projector must extend as a correspondence and commute with Frobenius. DWP.4 smooth-projective purity makes its image pure of weight `r + 1`. A twist by `(b)` gives weight `r + 1 − 2b`. The point is the specified degree `r + 1`, not just the total dimension of a fibre power. Weight two, where `r = 0`, is the separate Jacobian target below.

Construct `W_r` and its good-prime extension here, comparing its parabolic coefficient system with ModularCurvesPartII §§14.1–14.4a, with the correspondence's denominator and boundary hypotheses. A rational algebraic projector does not automatically extend integrally at its denominator primes, give a saturated integral eigensummand, or establish unrestricted freeness. A CM-product construction `W_r×A^r` has total degree `2r + 1`; it does not replace the classical degree-`r + 1` comparison needed here.

For the Hilbert branch use Saito's actual `X_{K,H,T̂,R̂}`, curve `M_K`, auxiliary zero-dimensional scheme `N_H`, coefficient number field L and L-coefficient algebraic projector e from R34.3. For each specified embedding `ι_λ:L→L_λ`, `λ∣ℓ`, and `g = [F:ℚ]`, put `q₀ = (2g − 1)(w − 2)`. Lemma 3 identifies

`eH^q(X_Ē, L_λ) ≃ H^{q−q₀}(M_F̄, ℱ^{(k)}_λ) ⊗_{L_λ} H⁰(N_Ē, ℱ(χ₀^{(g−1)(w−2)})_λ).`

Retain the auxiliary character and its weight in this formula. After the specified L-coefficient auxiliary projector `e°`, it produces the Tate-twisted comparison used in R34.6. Prove compatibility with extension of L, its embeddings and projector images; for `μ∣p` identify the analogous projected HK realization through R34.3's `L_μ`-linear structured period comparison and its chosen `C_μ` factor. This is not the classical `r + 1` formula. R34.3's Hilbert model construction supplies the Hilbert model, projector and coefficient correspondence; the completed-unramified model and its descent requirements are as in R34.3. Projector images inherit weights only through the actual equivariant realization, not through an arbitrary vector-space idempotent or a Betti comparison.

**Checks for the Hilbert comparison.**

* For `g=2` and `w=k₁=k₂=2`, `q₀=0`, the auxiliary twist is zero and the projected degree is one.
* For `g=2` and `w=4`, `q₀=6` and the auxiliary twist is two; degree seven becomes weight three.
* An embedding projector defined over L need not descend to `ℚ`. The quadratic two-point correspondence Check in R34.3 gives different traces at the two coefficient embeddings; the `L_λ` and `C_μ` realizations compare through those embeddings, with no rational-trace conclusion.

Sources are [Deligne modular, Lemmas 5.2–5.4, pp. 168–169, and the resolution in the proof of Lemma 5.4 via Lemma 5.5, p. 170][DM] for the classical compactification/subquotient argument; [Scholl, §§1.1.0–1.2.1 and §1.3.3, pp. 1–3][Sch] for the full projector and boundary/interior identification; and [Saito, §6, Lemma 3, pp. 30–31][S]. Prerequisites are R34.5's classical compactification construction and ModularCurvesPartII §§14.1–14.4a for the classical model; R34.3's Hilbert model construction for the Hilbert construction; AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 for the supplied classical multiplicity and polynomial; DWP.4 smooth projective purity (§4.3); R34.1's linear-algebra operations; and the preceding parabolic purity target. These interfaces construct and identify the specific projectors; no second abstract Scholl projector is required.

### 5.3 Weight two and modular Jacobians

For a weight-two normalized cuspidal eigenform `f`, use the specified modular Jacobian quotient `J → A_f`, with coefficient-field action by `K_f`. ModularCurvesPartII §§16.1–16.4 supplies the quotient and its dimension before any aggregate theorem about the eigenform representation is used. At a place of good reduction away from the coefficient characteristic, R34.2 makes the full `H¹(A_f)` pure of weight one with integer Frobenius polynomials.

For a finite coefficient place `λ` and its specified embedding, the cohomological eigensummand `M_{f,λ}` inherits weight one and algebraic-integral geometric eigenvalues. Its polynomial over `K_{f,λ}`, or the common coefficient number field when supplied, need not be rational and need not lie in `ℤ[X]`. If `ρ_{f,λ} = M_{f,λ}^∨`, then `ρ` has geometric weight `−1`. Its arithmetic eigenvalues are the geometric eigenvalues of `M` and remain algebraic integers; its geometric eigenvalues are their inverses and need not be integral.

For rational coefficients, `A_f` is the corresponding elliptic quotient. For coefficient degree `d`, the modular quotient has dimension `d` and the coefficient eigensummand has rank two. Track the Hecke action and the coefficient descent explicitly; an integer polynomial for the full rank-`2d` cohomology does not make every rank-two coefficient-field factor rational.

Sources are [Diamond–Flach–Guo, §5.4, Lemma 5.7, pp. 58–59][DFG], for rank and coefficient realization, and [Milne, Chapter I, Remark 12.5, p. 56][AV], for equivariant duality. Prerequisites are ModularCurvesPartII §§16.1–16.4 the modular quotient (§16.2), its dimension (§16.4); R34.2's good-reduction theorem; and R34.1's linear-algebra operations. Higher-weight forms use the parabolic/Kuga–Sato branch, not an asserted abelian-variety realization.

### 5.4 Hard Lefschetz with arithmetic Tate twists

Let `X₀/𝔽_q` be smooth and projective of pure dimension `d`, with `ℓ ≠ char(𝔽_q)`, and let `ℒ` be an ample line bundle defined over `𝔽_q`. Its arithmetic Chern class is

`η = c₁(ℒ) ∈ H²(X_{𝔽̄_q}, ℚ_ℓ(1)).`

For `0 ≤ a ≤ d`, identify the actual cup-product map

`η^a ∪ − : H^{d−a}(X_{𝔽̄_q}, ℚ_ℓ) ≃ H^{d+a}(X_{𝔽̄_q}, ℚ_ℓ(a)).`

DWP.9 supplies its absolute hard Lefschetz isomorphism, while the arithmetic definition of the ample class supplies Frobenius equivariance. Restore the twists suppressed in Deligne II's algebraically closed convention: both sides have geometric weight `d − a`, because `(d + a) − 2a = d − a`. At `a = d` both sides have weight zero, including the top-degree Tate twist.

**Checks.**

* At `a=0` the map is the identity.
* At `a=d` the top-degree twist identifies weight-zero representations.
* For `ℙ¹/𝔽_p` and `ℓ = p`, `μ_{pⁿ} = 0` on the étale site, so the Kummer Chern class and this Lefschetz isomorphism are unavailable. Constant p-adic étale `H²` is zero by the Artin–Schreier calculation above.

For a projected summand, require that the specified arithmetic algebraic projector commute with `η^a ∪ −`; an arbitrary projector need not do so. The absolute isomorphism makes no assertion of arithmetic Frobenius semisimplicity and does not yield a relative hard Lefschetz or decomposition theorem without its own hypotheses. Relative hard Lefschetz and decomposition is not a prerequisite of this absolute arithmetic comparison.

Sources are [Deligne II, Theorem (4.1.1), p. 217][WII], with Tate twists restored. Prerequisites are DWP.9 the Lefschetz operator (§9.1), absolute hard Lefschetz (§9.6); DWP.4 smooth projective purity (§4.3); EtaleCohomologyFoundations §F.6 first Chern classes (§F.6); EtaleCohomologyFoundations §F.6 cycle classes (§F.6); and R34.1's complex-weight normalization. The theorem uses the actual arithmetic class and cup product, not just matching dimensions of two pure representations.

### 5.5 The classical compactification

Construct the actual classical `W_r` compactification and the denominator, boundary resolution and good-prime correspondence-extension data needed to instantiate the Scholl projector constructed in this layer. Preserve its Hecke/Galois-compatible parabolic étale comparison. Coordinate the classical geometry with ModularCurvesPartII §§14.1–14.4a. The degree-`2r + 1` CM-product construction does not supply the required degree-`r + 1` realization by itself, and the Hilbert projector remains in R34.3's Hilbert model construction. Sources are [Deligne modular, Lemmas 5.2–5.4, pp. 168–169, and the resolution in the proof of Lemma 5.4 via Lemma 5.5, p. 170][DM] for compactification/subquotients, and [Scholl, §§1.1.0–1.2.1 and §1.3.3, pp. 1–3][Sch] for the full projector and boundary comparison.

For `r≥1` and full level `M≥3` the intended signature returns a smooth projective equivariant compactification of the r-fold universal elliptic fibre power and a rational idempotent correspondence. Use the group `Γ_r=(((ℤ/Mℤ)²⋊{±1})^r)⋊S_r`: the torsion sections translate each factor, `{±1}` acts by inversion, and `S_r` permutes the factors. Let `ε` be trivial on translations, the product of the inversion signs and the permutation sign. Using RepresentationTheory/CharacterTheory Layer 3’s finite-group projector, construct `e_ε=|Γ_r|⁻¹∑_γ ε(γ)[Graph(γ)]` on the equivariant resolution. The averaging denominator divides `M^(2r)2^r r!`, with additional model denominators recorded separately. Prove idempotence, the relative-degree-r identification with `Sym^r R¹`, vanishing of the unwanted fibre degrees, and the global boundary/interior identification using this full projector. Inversion/permutation averaging alone selects the smooth-fibre symmetric-power piece. Prove commutation with Hecke, Galois, coefficient extension and good-fibre specialization. These form the API of the compactification/projector target; no saturated integral image is asserted from rational averaging alone.

**Checks.**

* At `r=1` the factor `(1−[−1])/2` keeps smooth-fibre `H¹` and kills `H⁰` and `H²`. Torsion translations act trivially there; the full projector’s parabolic realization lies in total degree two.
* At `r=2` the permutation sign compensates for graded commutativity, giving `Sym² H¹` of a two-dimensional fibre, of rank three, rather than its rank-one exterior square.
* At `r=0` the group-average formula alone does not identify the cuspidal weight-two realization; the separate Jacobian quotient target supplies it.
* For `k=12`, `r=10` and total degree eleven give weight eleven before any Tate twist; the CM product has a different total degree.
* For `r=1` and `M=3`, inversion swaps `C₁,C₂` in a cusp `I₃` fibre. The boundary divisor `D=C₁−C₂` has `D²=−6` and survives inversion averaging. Averaging the translations that cycle the components kills D.

### 5.6 The higher-weight model comparison

Use ModularCurvesPartII §§14.1–14.4a’s universal elliptic local system and parabolic realization. Construct its comparison with the higher-weight classical Kuga–Sato compactification and verify the good-prime/base-change and boundary/resolution data specified in R34.5. Coordinate these model inputs with R34.5's classical compactification construction and construct its full torsion-translation Scholl comparison as in R34.5. A weight-two Betti or cohomological construction is not a higher-weight algebraic model, and the `k = 2` Jacobian branch remains in ModularCurvesPartII §§16.1–16.4. Sources for the required realization: [Deligne modular, Lemmas 5.2–5.4, pp. 168–169, and the resolution in the proof of Lemma 5.4 via Lemma 5.5, p. 170][DM]; [Scholl, §§1.1.0–1.2.1 and §1.3.3, pp. 1–3][Sch].

### 5.7 Comparison with the supplied classical eigensummand

Use ModularCurvesPartII §§14.1–14.4a for the parabolic realization and AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 for the primitive projector, coefficient descent and independent polynomial comparison. Construct R34.5’s Scholl correspondence and identify its realization with the supplied primitive multiplicity at every finite coefficient place through an equivariant comparison. Transport the supplied **independent geometric** rank-two and Eichler-congruence comparison, with the actual auxiliary good-prime models, identifying normalized `M_{f,λ}`, its arithmetic dual, and the polynomial `X² − a_p(f)X + ψ(p)p^{k − 1}`. This comparison's premises must not include R34.6 purity. Identify the DFG character-twisted realization rather than identifying untwisted `M_g` by notation. Retain projector, boundary/resolution, coefficient-descent and denominator hypotheses; do not extend integral freeness or Fontaine–Laffaille comparisons to excluded coefficient primes. R34.6 uses this interface to prove weights and common good-prime polynomials. Sources: [Deligne modular, Theorems 5.1 and 5.6, pp. 168 and 170–171][DM]; [DFG, §§1.1–1.3, pp. 6–13, and §5.4, Lemma 5.7, pp. 58–59][DFG].

### Examples

Weight two gives parabolic weight one and the Jacobian branch; weight twelve gives degree eleven with zero twist in the classical compactification. The top hard-Lefschetz twist has weight zero. A nonrational coefficient-field eigenfactor can inherit integral roots without an integer polynomial.

### Dependencies

*Needs:* R34.1–R34.3; DeligneWeightsAndPurity DWP.0, DWP.4, DWP.7–DWP.9; EtaleCohomologyFoundations §§F.5–F.7; ModularCurvesPartII §§14.1–14.4a, 14.11, 16.1–16.4; AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2. The classical compactification, Scholl correspondence and Hilbert projector comparisons are R34.5 targets with the detailed contracts in §§3.9, 5.5–5.7.

## Layer 6: Eigenform purity, compatibility and the restricted local export (R34.6)

The final layer combines the particular arithmetic realizations of R34.3 and R34.5 with the general weight theorems. Good-prime compatibility is proved from a common Hecke polynomial. Local monodromy weights are proved only for the Hilbert modular forms and hypotheses of Saito's theorem. Neither equal root norms nor a general quasi-unipotence theorem proves these assertions.

### 6.1 Eigenform purity and the Ramanujan bound

Let `f` be a normalized cuspidal newform of weight `k ≥ 2`, level `N`, nebentypus `ψ`, and coefficient field `K_f`. For every finite place `λ ∣ ℓ` of `K_f`, use AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2's specified coefficient descent and projector to obtain the rank-two **normalized cohomological realization** `M_{f,λ}`. At every good prime `p ∤ Nℓ`, supply the geometric Hecke/Frobenius comparison

`P_p(M_{f,λ}; X) = X² − a_p(f)X + ψ(p)p^{k−1}.`

The polynomial comparison must come from the geometric construction independently of the purity theorem here. Its inputs are the actual rank-two eigensummand, model, coefficient embedding and Eichler-congruence relation. An aggregate construction whose proof already uses R34.6 cannot serve as this input. The parabolic, Scholl and coefficient-descent constructions identify the required realization without that circular dependence.

R34.5 gives `M_{f,λ}` geometric weight `k − 1`. For `ρ_{f,λ} = M_{f,λ}^∨`, geometric weight is `1 − k` and the **arithmetic** Frobenius polynomial is the displayed Hecke polynomial. For every complex embedding `σ:K_f ↪ ℂ`, both roots of the corresponding polynomial have norm `p^{(k − 1)/2}`. The triangle inequality gives

`|σ(a_p(f))| ≤ 2p^{(k−1)/2}.`

In Suggested.lean, `newformHeckePolynomial` defines this Hecke polynomial over Tau Ceti's coefficient field of the bundled newform. The theorem `newform_ramanujan` states both the root-norm equality and the coefficient bound for every complex embedding, every level and nebentypus, every weight `k ≥ 2`, and every prime away from the level. The geometric identification with the Frobenius polynomial is the separate realization target above.

This is the Ramanujan bound for the stated good primes and all coefficient embeddings. The geometric eigenvalues on `M`, equivalently the arithmetic eigenvalues on `ρ`, are algebraic integers through the cohomological realization. The geometric eigenvalues on `ρ` are their inverses. The coefficient-field polynomial is not asserted to be rational or in `ℤ[X]`. A Tate twist `M(b)` has weight `k − 1 − 2b`. There is no weight-one or noncuspidal extension of this target.

When using Diamond–Flach–Guo's conventions, identify `M_{f,λ}` with the actual normalized realization `(M_g ⊗ M_{ψ_g⁻¹})_λ` by a Hecke/Frobenius-equivariant comparison. Untwisted `M_g` has geometric determinant `ψ(p)⁻¹p^{k − 1}`; it is not identified with `M_{f,λ}` just by sharing a letter. The finite-character twist changes this determinant to the stated nebentypus convention and preserves weights and algebraic-integral eigenvalues. It does not establish rational coefficients.

DFG's characteristic-zero étale realizations and lattices exist at every coefficient prime. Its integral crystalline and Fontaine–Laffaille comparison data have the separate restriction `λ ∉ S_N`, where `S_N` consists of coefficient primes dividing `Nk!`. The good-prime purity assertion uses the specified étale eigensummand and geometric polynomial at every `λ`; it does not extend integral crystalline comparison, freeness or saturation through an excluded coefficient prime by changing coefficients.

For the discriminant form `Δ`, `k = 12`, `a₂ = −24`, and the polynomial is `X² + 24X + 2048`. Its geometric cohomological weight is `11`, and the geometric weight of the arithmetic dual is `−11`. The embedded Frobenius trace is bounded by `rank · p^{w/2}`, including rank zero, and this specializes to rank two and weight `k−1` here. The degree and polynomial comparisons are supplied by the actual geometric realization.

Sources are [Deligne modular, Theorems 5.1 and 5.6, pp. 168 and 170–171][DM]; [Deligne II, (3.7.1), p. 215][WII]; and [DFG, §§1.1–1.3, pp. 6–13, §5.4, Lemma 5.7, pp. 58–59][DFG], for the coefficient and normalization data. Prerequisites are R34.5's parabolic purity, classical projector and weight-two quotient targets; R34.1's every-embedding comparison; AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 the classical projector and coefficient descent (R15.5A.1–R15.5A.2) and the independent geometric polynomial interface; and DWP.10 stable-subquotient transport (§10.1).

### 6.2 The compatible-family input and its local domain

For a number field K, coefficient number field E, finite exceptional set S and rank n, take a family of continuous semisimple `E_λ` representations of `G_K`, one for every finite coefficient place `λ`, unramified outside S and the places above its residue characteristic. Define `HasCommonGoodPrimePolynomials` on this family to mean: for every finite v outside S there is a monic `P_v` in `E[X]` of degree n, and for every `λ` of different residue characteristic the geometric characteristic polynomial is the image of `P_v` under the specified embedding `E→E_λ`. The intended signature is a predicate on this actual indexed family, its coefficient maps and its common polynomials. Its API includes uniqueness of `P_v`, coefficient extension, equivariant family isomorphisms, restriction with residue-degree powers, and direct sum/tensor/dual polynomial transport. Over a common coefficient field, direct sums have rank `n+n′` and polynomial `P_vP′_v`, tensor products have rank `nn′` with roots the pairwise products, and duals have rank n with polynomial `X^nP_v(1/X)/P_v(0)`. Frobenius invertibility makes `P_v(0)` nonzero, including `P_v=1` in rank zero. Enlarge the exceptional set under a finite ramified field extension. This is precisely the fixed-source compatibility component proved above, with source [DFG §§1.1–1.3, pp. 6–13, §5.5, pp. 59–60][DFG].

To use the family in a full compatible-system assertion, supply separately the de Rham condition at `λ` above v, a common labeled Hodge–Tate multiset, crystallinity at the stated good places, and the specified bad-prime Weil–Deligne comparisons. The conclusion above does not discharge them. In the Hilbert source range the local comparisons are targets of the final subsection below; no general potential automorphy assertion is required.

**Checks.**

* The family of trivial rank-n representations has `P_v=(X−1)^n`, including `P_v=1` at `n=0`.
* A Tate family `Q_ℓ(1)` has common geometric polynomial `X−q_v⁻¹`, so rational compatibility does not assert integer coefficients.
* Two lines with geometric eigenvalues 1 and −1 have equal weight zero but polynomials `X−1` and `X+1`. Choosing these at different coefficient places fails the common-polynomial condition.
* A good-prime polynomial family without a supplied period comparison at a place of the same residue characteristic cannot establish the crystalline clause of a full system.

### 6.3 A fixed eigenform's common good-prime polynomials

For the fixed newform above and a good prime `p ∤ N`, set

`P_p(X) = X² − a_p(f)X + ψ(p)p^{k−1} ∈ K_f[X].`

For every coefficient place `λ ∤ p`, prove that its image in `K_{f,λ}[X]` is the geometric polynomial on `M_{f,λ}`, equivalently the arithmetic polynomial on `ρ_{f,λ}`. The coefficient field and polynomial are common because the realizations use the **same** Hecke eigenvalues and nebentypus. Equality of root norms alone does not imply equality of the trace, determinant or polynomial: `X − 1` and `X + 1` have roots of the same modulus but are distinct.

Supply the characteristic-zero coefficient realizations and the common geometric polynomial comparison at every finite `λ`. Any exceptional set needed by model denominators is enlarged explicitly at that geometric interface. The theorem concerns primes away from the level and the coefficient characteristic. Bad-prime Weil–Deligne data, and the realization at `λ ∣ p`, require their separate local comparison theorems.

The compatible-family interface above receives these common polynomials. A full compatible system additionally needs de Rham/crystalline conditions, labeled Hodge–Tate data and bad-prime comparisons; this target proves the fixed-source good-prime polynomial component. R34.6's Hilbert theorem supplies local data only within its source restrictions.

The DFG excluded set `S_N` still restricts its integral crystalline comparison. Its all-prime étale lattices do not remove that restriction. Retain the normalized `M_g ⊗ M_{ψ_g⁻¹}` identification when comparing coefficient realizations; twisting each member without fixing a common character would not give the specified common polynomial.

Sources are [DFG, §§1.1–1.3, pp. 6–13; §5.4, Lemma 5.7, and §5.5, pp. 58–60][DFG]. Prerequisites are the preceding eigenform theorem, AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 the classical projector and coefficient descent (R15.5A.1–R15.5A.2) and its independent polynomial comparison, and the compatible-family interface above. This is a fixed-eigenform theorem, not an existence or potential automorphy theorem for a general compatible system.

### 6.4 Transport through actual arithmetic comparisons

Given a coefficient-linear isomorphism between two specified arithmetic realizations, require that it intertwine their actual arithmetic Frobenius actions, equivalently their geometric inverses at an unramified place. Then their local characteristic polynomials and weights agree. An intertwining equation for every group element transports the numerical purity predicate. More generally, an arithmetic algebraic projector commuting with Frobenius has an invariant image that inherits the ambient purity. Apply DWP.10's general transport theorem to the actual Tate, parabolic and Kuga–Sato comparisons already constructed here.

For a finite extension of residue degree `d`, a comparison concerns `F^d` and `q^d`. Use DWP.0's power criterion to recover the original weight relative to `q`, with `q>1`, when the original Frobenius action is specified. This does not construct a descent datum for an otherwise unspecified representation or correspondence. Coefficient extension likewise needs the given coefficient map and the induced action; a bare vector-space isomorphism is insufficient.

Algebraic-integral eigenvalues pass to an invariant image. To conclude that its polynomial lies in `ℤ[X]`, add rationality of that image polynomial and the monic-factor argument of R34.1. A Betti projector alone supplies neither the arithmetic correspondence nor Frobenius equivariance. Semisimplicity is a separate Faltings-type hypothesis, and is not a consequence of purity or equality of weights.

The early good-reduction comparison may be used directly by the Faltings application through DWP.0–1 and R34.2; the position of this reusable transport target does not add general Weil II to that route. The target verifies particular arithmetic comparison inputs to the general owner theorem, not another proof of general weight transport.

Sources are [Lawrence–Venkatesh, §2.3, Lemma 2.3, pp. 9–10][LV], for the arithmetic use, and [Deligne II, (1.2.5)(i), p. 154][WII], for the weight operation. Prerequisites are DWP.10 stable-subquotient transport (§10.1); DWP.0 the power criterion (§0.12); R34.1's linear-algebra operations; R34.2's good-reduction comparison; and R34.5's actual projector comparison.

### 6.5 Hilbert eigensummands and local monodromy weights

Restrict to Saito's source range. Let `F` be totally real of degree `g>1` and let `f` be a cuspidal Hilbert eigennewform of multiweight `(k₁,…,k_g,w)`, with

`w ≥ k_i ≥ 2,  k_i ≡ w (mod 2).`

When `g` is even, retain Carayol's finite discrete-series hypothesis in Theorem 0. For the comparison at a fixed `𝔭`, retain the source's quadratic base-change reduction when it is used to obtain an auxiliary discrete-series place different from `𝔭`. Take the actual Hilbert model, coefficient sheaf, projector and auxiliary character constructed in R34.3; a general idempotent on a cohomology space does not supply them.

With `q₀ = (2g − 1)(w − 2)` and `b = (g − 1)(w − 2)`, verify the equivariant normalization

`e°e H^{q₀+1}(X_Ē, L_λ)(b) ≃ H¹(M_F̄, ℱ^{(k)}_λ).`

Its weight calculation is

`(q₀ + 1) − 2b = w − 1.`

Here L, `ι_λ` and `ι_μ` are the coefficient data of R34.3, and both e and `e°` are L-coefficient correspondences. The auxiliary projector and Tate twist are the ones in Saito's Lemma 3 and its use on p. 31. Prove this `L_λ`-linear comparison and its `L_μ`-linear period counterpart on the chosen `C_μ` factor, compatible with coefficient extension, Frobenius and monodromy: raw `N_HK = e_vN_p`, with `e_v` the absolute ramification index of the model field. An alternating trace identity without those data does not determine monodromy on a projected summand.

Construct **`hilbert-degreewise-trace-comparison`** at the sufficiently small level K of Saito §3, with `K=K_𝔫 K^𝔫`, the ideal 𝔫 containing 𝔭 and the auxiliary quaternionic ramification place when present, and the away-from-𝔫 Hecke algebra `𝕋^𝔫=L[T_𝔯 : 𝔯∤𝔫]`. Use the source range, coefficient field, embeddings, auxiliary projectors and period comparison just specified. For every `σ∈W⁺` and `T∈𝕋^𝔫`, construct common traces `t_i(σ,T)∈L`, for `i=0,1,2`, such that

`Tr(σT ∣ Hⁱ(M_K,F̄, ℱ^{(k)}_λ)) = ι_λ(t_i(σ,T)),`

`Tr(σT ∣ D_μ(Hⁱ(M_K,F̄, ℱ^{(k)}_μ))) = ι_μ(t_i(σ,T)).`

Here `D_μ` is the potentially semistable realization on the chosen `C_μ` factor, with the linearized Weil action supplied by the period comparison. First obtain the common alternating trace `t_alt` from `saito-stratum-correspondence-trace`, §8 Claim 4(1), and the auxiliary projector comparison of §6, p. 31. When converting the projected total-variety trace to curve cohomology, retain the factor `(−1)^q₀ q^{−b n(σ)}` from the degree shift and Tate twist.

If some `k_i>2`, prove that the actual coefficient sheaf has no geometrically constant subobject or quotient, using the geometric monodromy Lie algebra generated by the norm-one quaternionic group in §3, p. 16. Invariants and curve Poincaré duality then give `H⁰=H²=0` for both the `L_λ` and `L_μ` étale realizations. Their potentially semistable outer realizations vanish as well, so `t_0=t_2=0`. This is the generic-curve coefficient argument; the special-fibre isocrystal vanishing in §9 is a separate input to monodromy weights.

If `k₁=⋯=k_g=2`, put `a=(w−2)/2∈ℤ`. Identify the coefficient sheaf geometrically with `L_λ(−a)` and likewise with `L_μ(−a)`. Construct degree zero as the permutation module of the geometric connected components of M_K, tensored with this Tate line. Identify the components through the constant algebra `Γ(M_K,𝒪)` and its class-field description in §3. Retain the Galois permutation action and the Hecke pullback/trace action, including the coefficient norm-character factor: in Saito's finite-idele convention this is `N_{F/ℚ}^a ∘ Nrd`, normalized through `𝔸_fˣ/ℚ_{>0}ˣ ≃ ℤ̂ˣ`. Identify degree two by curve Poincaré duality with the dual of the untwisted component permutation module tensored with `L_λ(−a−1)`, and likewise at μ, retaining the coefficient action and the transposed Hecke pullback/trace correspondences under that duality. Establish the same component, Tate and Hecke descriptions after `D_μ`, through the stated coefficient embeddings. They give common outer traces `t_0,t_2`; these degrees need not vanish.

Subtract the two outer traces from the alternating identity to obtain `t_1=t_0+t_2−t_alt`. Prove compatibility with extension of L and L-linear combinations of the specified Hecke correspondences. Only this degree-one comparison enters Hecke isolation and division by `d>0` in the rank-two multiplicity argument below.

Source: [Saito, §3, Claim 2(1) and its reduction to Claim 1(1), pp. 15–17; §6, Lemma 3 and auxiliary projector, pp. 30–31; §8, Claim 4(1), pp. 35–36][S]. Prerequisites are R34.3's correspondence-trace comparison and Saito-specific period identifications (§3.10), R34.5's Hilbert projector comparison in all shifted curve degrees, EtaleCohomologyFoundations §§F.5–F.6's curve duality, and ClassFieldTheory Layers 11–12's global reciprocity and class-field correspondence. The component/Tate identifications and their arithmetic and Hecke compatibilities are part of this R34.6 target.

**Checks.**

* If some `k_i>2`, both outer groups vanish on each coefficient side, and the degree-one trace is `−t_alt`.
* At `k₁=⋯=k_g=w=2`, retain the component module in degree zero and its dual twisted by `(−1)` in degree two until their traces have been compared. For a connected component fixed by geometric Frobenius, with `T=1`, the two contributions are `1` and q; hence `t_1=1+q−t_alt`.
* On graded spaces `(H⁰,H¹,H²)=(A,A⊕B,B)`, an operator induced by operators on A and B has zero alternating trace while its degree-one trace is `Tr(A)+Tr(B)`. Taking scalar actions `(1,1)` and `(2,1)` gives degree-one traces two and three with the same alternating trace zero.
* For odd w, `q₀` is odd, so the total-variety alternating trace changes sign when shifted to the curve; the factor `(−1)^q₀` is necessary before outer-degree subtraction.

For `λ ∣ ℓ`, `ℓ ≠ p`, and `μ ∣ p`, prove `hilbert-modular-form-compatibility-at-p` over the specified completions of L and chosen `C_μ` factor. Use the same L as R34.3, enlarged to contain the eigenvalues of f and admit the transferred finite-part models. Consume GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.3, R17.3.5–R17.3.8 for global Jacquet–Langlands, split-place Hecke matching, strong multiplicity one, spectral multiplicity one and coefficient-model comparison. Construct Saito §3 Lemma 1’s cohomological decomposition, retaining Carayol’s construction and the local Galois action. Apply `hilbert-degreewise-trace-comparison` for every `σ∈W⁺` before choosing a Hecke element that isolates f in degree one. At level K with `d=dim(π′_f)^K>0`, identify the f-isotypic cohomology over `L_λ` with `(π′_f)^K` tensored with the rank-two Galois multiplicity, and likewise over `L_μ`; its dimension is `2d`. Construct the coefficient descent of that multiplicity using the actual models and Lemma 1’s model argument. If `K_f` is the Hecke coefficient field, compare all places over each place of `K_f` and descend to `K_f` only with a supplied `K_f`-model and compatible descent datum; otherwise state the result after extension to L. The L-valued projected traces alone do not supply this descent. Equality of rationality fields alone does not produce a model. Prove potential semistability at `μ`, comparison of the rank-two Frobenius-semisimplified Weil–Deligne realizations with the source-normalized `σ̌_h(π_{f,𝔭})`, and the monodromy-graded weight assertion. For residue size `q = N𝔭`, with geometric Frobenius `F`, use

`N² = 0,  FNF⁻¹ = q⁻¹N,`

and the filtration

`0 ⊆ Im N ⊆ ker N ⊆ V.`

The graded piece `Gr_i V` has weight `w − 1 + i`, and

`N : Gr₁ V(1) ≃ Gr₋₁ V.`

If `N = 0`, the representation has weight `w − 1`. If `N ≠ 0`, its kernel line has weight `w − 2` and its cokernel line has weight `w`. The twist from the upper piece to the lower piece gives `(w − 1 + 1) − 2 = w − 2`. Equality of Frobenius traces together with these source-qualified graded weights distinguishes the zero and nonzero monodromy cases; equal traces without the weight theorem do not by themselves prove equality of `N`.

In particular, `w = 2` and nonzero `N` give graded weights zero and two, consistent with the nodal curve calculation and the factor `q⁻¹` in geometric monodromy scaling.

Use the geometric normalization consistently on the `p`-adic side: `Nφ = pφN`. In the period Weil–Deligne export N denotes `N_p`; on a model over a finite local field `L_v` with `v_{L_v}(π) = 1`, compute it from the spectral sequence as `N_HK/e`, where `e = v_{L_v}(p)`. Retain this conversion in finite-local descent. After an extension of ramification index d, both raw HK monodromy and e multiply by d, so the p-normalized operator is preserved. Match the prime-to-p adapter’s tame-character normalization explicitly when comparing Weil–Deligne objects. The formulas printed on p. 12 of arXiv v2 with `φN = pNφ` and the opposite Frobenius exponent conflict with the geometric convention and the twisted graded isomorphism on p. 13. The comparison here uses the compatible inverse exponent `q⁻¹`. This is an explicit convention correction for that version; it does not identify a differently paginated journal text with this preprint.

Use `saito-stratum-correspondence-trace` to prove §8 Claim 4(1), `hilbert-degreewise-trace-comparison` to pass to the individual curve degrees before rank-two trace extraction, and `saito-crystalline-weight-spectral-sequence` for the filtered abutment, E₂ degeneration and projected monodromy isomorphism. The latter target includes Saito §9’s nonconstant coefficient vanishing with its actual isocrystal and interior-weight argument. Ordinary stratum Frobenius weights come from PadicDifferentialEquationsAndRigidCohomology §RD.7.7; equality of ordinary Frobenius polynomials supplies no trace comparison for an additional correspondence. R34.3's Saito-specific period identifications (§3.10), the Saito model and its descent hypotheses remain prerequisites. This target exports their application and the projected degree/twist normalization. It asserts no general mixed-characteristic weight–monodromy theorem beyond the source's Hilbert range.

Sources are [Saito, §2, Theorem 1, Claim 1 and Theorem 2, pp. 12–13; §3, Lemma 1 and proof, pp. 15–19; §6, Lemma 3 and its auxiliary projector, pp. 30–31; §8, Claims 4–5, pp. 35–38; §9, Proposition 1′, p. 39; crystalline preliminaries pp. 39–41; Lemmas 5–9, pp. 41–44, and the conclusion of the proof on p. 45 (Lemma 7’s proof uses universal deformation on p. 44; Lemma 9 identifies the connected part with a Lubin–Tate formal group and represents its extension functor)][S]. Prerequisites are R34.3’s `saito-crystalline-weight-spectral-sequence`, `saito-stratum-correspondence-trace`, strictly semistable Saito model, coefficient filtration and Saito-specific period identifications (§3.10); R34.5's Hilbert projector comparison; DeligneWeightsAndPurity §1.7 for curve cohomology weights; ArithmeticGaloisRepresentations §§2.4–2.6 for the actual Weil–Deligne adapter and graded purity; GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.3, R17.3.5–R17.3.8 for the global transfer, multiplicity and coefficient inputs; and its separate §§R16.0.1, R16.3.1–R16.3.4 for the local parameter and normalization bridge. Construct the Hilbert eigensummand and prove its source-qualified local comparison in this target; the compatible-family condition receives its export and supplies no premise to the proof.

**Checks.**

* If `d>1`, the full f-isotypic cohomology has rank `2d`; the rank-two representation is the Galois multiplicity, not that full space. After the degreewise comparison, divide the corresponding Hecke-isolated degree-one traces by d as in Saito §3, p. 17.
* A transferred finite-part representation with a descent obstruction over its rationality field requires a field extension admitting a model before the coefficient-model comparison applies.
* For even g, a form outside the discrete-series hypothesis at the chosen auxiliary finite place does not enter this quaternionic cohomological decomposition.

### Examples

For `Δ` at 2 the common cohomological polynomial is `X²+24X+2048` and the weight is eleven. Equal root norms do not identify `X−1` with `X+1`. In the Hilbert source range `w=2` and nonzero N give monodromy-graded weights zero and two.

### Dependencies

*Needs:* R34.1–R34.5; DeligneWeightsAndPurity DWP.0, DWP.1, DWP.10; AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2; ArithmeticGaloisRepresentations §§2.4–2.6; GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.3, R17.3.5–R17.3.8 for global transfer, multiplicities and coefficient models, and §§R16.0.1, R16.3.1–R16.3.4 for local parameters and normalization. The source-qualified Hilbert comparison and its degree/twist normalization are targets here; its crystalline spectral-sequence, correspondence-trace and coefficient-vanishing inputs are targets of R34.3.

## Suggested Lean forms

[Suggested.lean](Suggested.lean) states the R34.6 good-prime Hecke-root purity and Ramanujan bound for Tau Ceti's bundled newforms, at every complex embedding of their coefficient field. Its only supporting definition is the Hecke polynomial over that field. Both declarations are in the namespace `TauCetiRoadmap.WeightsInEtaleCohomology`. The README is the mathematical specification.

The representation–sheaf, good-reduction and geometric comparison theorems require rational adic cohomology with its continuous Galois action, Frobenius and specialization maps. Mathlib's integral pro-étale cohomology groups do not supply this interface. The module docstring identifies the other missing objects: nearby cycles and Hyodo–Kato cohomology, structured period modules, arithmetic vanishing-cycle local systems, algebraic cohomological projectors, parabolic and Kuga–Sato realizations, and Hilbert eigenform Galois and Weil–Deligne realizations. Those targets are specified in their layers, without substitute statements on arbitrary vector spaces or proposition-valued replacement fields.

## References

All page numbers in the targets are printed page numbers in the editions below. The fixed arXiv versions are specified because their numbering differs from other versions or journal editions.

* **[WI] Pierre Deligne**, *La conjecture de Weil. I*, Publications Mathématiques de l'IHÉS **43** (1974), pp. 273–307. [Public Numdam scan][WI]. For one-based PDF pages, printed page = PDF page + 271.
* **[WII] Pierre Deligne**, *La conjecture de Weil. II*, Publications Mathématiques de l'IHÉS **52** (1980), pp. 137–252. [Public Numdam scan][WII]. Printed page = one-based PDF page + 135.
* **[LV] Brian Lawrence and Akshay Venkatesh**, *Diophantine problems and p-adic period mappings*, arXiv:1807.02721 **v3**, 25 October 2019; published in Inventiones Mathematicae **221** (2020). [Public v3 PDF][LV]. The locators here refer to the preprint; printed and one-based PDF pages agree.
* **[AV] J. S. Milne**, *Abelian Varieties*, course notes, **version 2.00**, 16 March 2008. [Public notes][AV]. Chapter I is geometric and Chapter II arithmetic; printed page = one-based PDF page − 6.
* **[DM] Pierre Deligne**, *Formes modulaires et représentations l-adiques*, Séminaire Bourbaki, exposé **355**, 1968/69, pp. 139–172. [Public Numdam scan][DM]. Printed page = one-based PDF page + 137.
* **[S] Takeshi Saito**, *Hilbert modular forms and p-adic Hodge theory*, arXiv:math/0612077 **v2**, 11 December 2006. [Public v2 PDF][S]. Printed and one-based PDF pages agree. The theorem numbers and the monodromy normalization discussion here refer to this preprint, rather than assuming the 2009 journal edition has the same pagination or formulas.
* **[DFG] Fred Diamond, Matthias Flach and Li Guo**, *Adjoint motives of modular forms and the Tamagawa number conjecture*, arXiv:2512.02348 **v2**, December 2025. [Public v2 PDF][DFG]. Printed and one-based PDF pages agree. In particular, Lemma 5.7 is on pp. 58–59 of this expanded preprint; these are not page locators for the differently numbered 2004 journal article.
* **[C] Henri Carayol**, *Sur les représentations l-adiques associées aux formes modulaires de Hilbert*, Annales scientifiques de l'École normale supérieure (4) **19** (1986), pp. 409–468. [Public Numdam scan][C]. Printed page = one-based PDF page + 407.
* **[Sch] A. J. Scholl**, *Motives for modular forms*, Inventiones Mathematicae **100** (1990), pp. 419–430. [Author’s preprint][Sch], §§1.1.0–1.2.1 and §1.3.3, pp. 1–3. These locators use the preprint’s printed pagination.

[WI]: https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf
[WII]: https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf
[LV]: https://arxiv.org/pdf/1807.02721v3
[AV]: https://www.jmilne.org/math/CourseNotes/AV.pdf
[DM]: https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf
[S]: https://arxiv.org/pdf/math/0612077v2
[DFG]: https://arxiv.org/pdf/2512.02348v2
[C]: https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf
[Sch]: https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf
