# Roadmap: p-adic local Langlands for `GL₂(ℚ_p)`

**Summary.** Build the representation-theoretic form of the two-dimensional p-adic local Langlands correspondence for `GL₂(ℚ_p)`, from the mirabolic action on étale `(φ,Γ)`-modules to Colmez's Montreal functor, Banach representations, algebraic vectors, blocks and Breuil–Mézard cycles. The endpoints include the all-prime correspondence, the case-sensitive local cycle theorems, and the Breuil–Strauch interpretation through the Drinfeld tower. Exact source hypotheses govern every endpoint; the global comparison and arithmetic patching inputs are kept explicit where a local proof does not supply them.

## Scope and ownership

This roadmap owns Colmez's `GL₂(ℚ_p)` constructions: canonical lattices, restriction and gluing on `ℙ¹`, the Montreal functor, its reconstruction theorem and the construction of `Π(D)`. It also owns the `GL₂`-specific finite-length theorem, locally algebraic-vector comparisons, projective-envelope applications, block-to-Galois dictionary, local cycle arguments and geometric representation comparisons.

General smooth categories, smooth and compact induction and their adjunctions belong to **SmoothRepresentationsOfLocalGroups**, SR.0 and SR.2. Its SR.0d.1 gives a Grothendieck category and enough injectives. The locally admissible fixed-central-character subcategory and its envelopes require the separate `GL₂` theorem in §2.2. The same supplier's SR.5.2, “Shared raw Weil–Deligne parameters” and “Classical parameters and the generic convention”, owns the classical `GLₙ` correspondence, its characteristic-zero coefficient descent, monodromy and Frobenius semisimplification. **ReductiveGroupsPartII**, RG2.4, supplies Iwasawa and Cartan decompositions. Section 1.7 here compares Colmez's full reducible classical factor with the irreducible Langlands quotient, retaining all normalisation twists.

**PhiGammaModulesAndIwasawaCohomology** §§1.0–1.0c, 2.2–2.6, 3.4a–3.5 and 7.1–7.5 supply the coefficient rings, covariant Fontaine equivalence, overconvergence, `ψ`, field cohomology, rank-one classification and saturated triangulations. **PadicPeriodRings** §§1.1–1.5 and 4.1–4.3 supply the period carriers, topologies, invariant functors and rational admissibility predicates. **NoncommutativeAndEquivariantIwasawa** §F.6 supplies all-rank, all-prime de Rham semistabilization, `D_pst` and the generic period-to-Weil–Deligne functor, with coefficient descent, tensor, dual and tower comparisons. The supporting foundations in Layer 0 construct the additional p-adic Hodge comparison dictionaries, locally analytic representation theory, coefficient-linear duality, local deformation rings and cycle algebra required here. They keep arbitrary finite local base fields and arbitrary representation rank wherever the source theorem permits them. The `GL₂`-specific Serre-weight and compact-induction interfaces are built in §§2.7–2.8, and the p-adic inertial `K`-type occurrence theorem, including its dyadic reduction statement, is §4.4.

Degree-two determinant laws, their characteristic coefficients, henselian reconstruction and the algebraic universal Cayley–Hamilton quotient come from **IntegralHeckeAndGaloisDeterminants** §§0.1–0.5, 1.1–1.3 and 1.5. Section 5.4 here constructs their continuous residual completion and closed Cayley–Hamilton ideal; algebraic representability alone does not supply continuous pseudodeformation representability.

Tau Ceti supplies completed group algebras and compact-module actions in `TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic` and `.Module`; **ProfiniteProPGroups**, Layer 9, supplies their general context. **PadicMeasuresIwasawaAlgebras** §§1.6–1.7 and 2.2 supply coefficient extension, the measure/completed-algebra comparison and the Amice operator calculus, using **PadicFunctionalAnalysis** §3.4 for bounded Mahler duality. Section 5.2 of PadicMeasuresIwasawaAlgebras supplies topological Nakayama and the compact inverse-system comparison. The categorical `TauCeti.IsEssentialMono` and `TauCeti.IsEssentialEpi` vocabulary and injective/projective objects are reused for envelopes. Existence in the representation category remains §2.2, and the Gabriel–Morita theorem remains §§5.1 and 5.3.

**ClassFieldTheory**, Layers 5 and 7–9, supplies finite local duality, reciprocity and the local Weil group. **LocalGaloisGroups**, Layers 0–3 and 5–7, supplies the topology of `G_K`, cyclotomic orientation and the finiteness of pro-`p` generators. **LocalFieldsRamification**, Layers 0–3, supplies inertia and tame ramification; §0.3 here adds the fundamental-character and peu/très ramifié dictionary used by BCDT.

Completed cohomology and modularity lifting consume the local interfaces here. They are not prerequisites used to close the local construction. The supercuspidal smooth-factor identification has a global proof; its uses carry the **supercuspidal comparison input** described in Layer 4, alongside the local comparison target there. Likewise the all-residual cycle theorems use the **arithmetic patching inputs** stated in Layer 6. Neither dependency is replaced by an upward citation to a consuming roadmap.

The shared foundations required by this roadmap have one construction each. Sections 0.1–0.5 own the analytic, duality, filtered-period, deformation and affine-cycle APIs used below, except for the supplied monodromy and generic period realization. The names with `AnalyticSupport`, `DualitySupport`, `DeformationSupport` and `CycleSupport` prefixes denote these shared APIs or their specialization maps, not independent carriers for each consumer. The block and type-ring constructions of §§5.1–5.6 and 5.12 likewise supply the common contracts `GL2Block.projectiveEnvelope`, `GL2Block.centre`, `GL2Block.residualGalois`, `MontrealFunctor.torsionEtaleRealization` and `WDTypeRing`. The `Block` and `KisinRingLL` notation below specializes those constructions. Every specialization retains the original coefficient, determinant and topology hypotheses.

The table assigns a single construction owner on each stated domain, including the general foundations rather than only their Colmez adapters. The foundational order is §§0.1–0.5 before the local constructions of Layers 1–6 and then the applications in the downstream roadmaps. These foundations do not import those applications or their foundational sections. On an overlapping domain a downstream presentation uses the construction here; an agreement theorem transports its notation, topology and normalization, without commissioning a second construction. Extensions to broader coefficient or base-field domains retain their full scope and restrict to this construction. Section 6.9 owns the general division-algebra transfer, including the inverse `D×` restriction. The downstream reuse contracts below specify the affected sections. On a common domain, exported consumer notation is a definitional abbreviation of the construction in the owner column, with all coefficient, base-field, rank, determinant, residual-basis and topology data supplied. A matrix presentation, a chart model or a maximal-ideal specialization gives a theorem about that chosen object; uniqueness of its universal property does not introduce a second carrier. Broader-domain extensions carry restriction comparisons to this object without losing their broader hypotheses.

| Common API | Construction owner | Specialization or extension |
| --- | --- | --- |
| `GL2Block.projectiveEnvelope`, `GL2Block.centre`, `GL2Block.residualGalois`, `MontrealFunctor.torsionEtaleRealization`, `WDTypeRing.*` | §§2.2–2.3, 3.1–3.3, 5.1–5.6, 5.12 | Finite residue coefficients for compact envelopes; absolute labels descend by coefficient orbits; full type retains Frobenius. |
| `LA(X,L)`, `D(H,L)`, `analyticPullback`, `analyticTensor_equiv`, strong biduality, `distributionConvolution` | §0.1 | Common locally convex limits and compact-manifold constructions; locally `F`-analytic and noncompact extensions use their chart and restriction comparisons. |
| Compact–discrete duality, Schikhof duality and admissible unitary Banach categories | §§0.1, 0.3 | `GL2Qp` specializations and the inverse-different trace adapter use these dualities. |
| `FilteredPhiNModule`, weak admissibility and semistable equivalence | §0.2 | General rank and perfect-residue base where stated; Colmez's sign and localized-period adapters preserve the filtration. The supplied `N_dR` remains the unfiltered differential-equation carrier. |
| P-adic monodromy, `D_pst` and generic period-to-Weil–Deligne realization | NoncommutativeAndEquivariantIwasawa §F.6 | Section 0.2's Colmez normalization adapter uses the same period invariants, coefficient component and period-ring monodromy. |
| `DeformationSupport.framed`, `unframed`, `fixedDeterminant`, `pstRing`, `crystallineRing`; continuous degree-two pseudodeformations of `G_(ℚ_p)` | §§0.4, 5.4 | General linear deformation problems; block residual completion and the centre comparison use these functors and rings. |
| `moduleCycle`, `moduleCycle_specialization`, Hilbert–Samuel multiplicity | §0.5 | `CycleSupport.*` are affine representation adapters with the same support, dimension and flatness hypotheses. |
| `SerreWeight`, `compactInduction`, `heckeOperatorT`, `endEquivPolynomial`, `compactInduction_free` over `ℚ_p` | §§2.7–2.8 | `NormalizerType.serreWeight` is the same finite weight; full-normalizer and Colmez-parameter comparisons are adapters. |
| `DivisionAlgebraTypes.jacquetLanglands` | §6.9 | The `m=1` correspondence from `D×` to `GL_d(F)` is the inverse of `DrinfeldComparison.localJacquetLanglands`; arbitrary `m` uses its general inner-form extension. |
| Supercuspidal `K`-type, occurrence and multiplicity one | §4.4 | Arbitrary nonarchimedean local fields and algebraically closed characteristic-zero coefficients; finite defining fields use the scalar-extension/descent comparison. |
| Finite-residue `fundamentalCharacter`, `peuRamifieH1`, `IsPeuRamifiee` | §0.3 | Fundamental characters include equal-characteristic local fields; the cyclotomic and unit-Kummer comparisons have their stated mixed-characteristic domains. BCDT uses the total Kummer subspace, while `IsPeuRamifiee` retains Serre's nontrivial-wild hypothesis. |

## Conventions

Let `p` be prime, `L/ℚ_p` a finite extension, `O=O_L, ϖ` a uniformiser and `k=O/ϖ`. Enlarge `L` or `k` when an absolute-irreducibility or splitting hypothesis needs it. Smooth torsion representations have discrete topology. Banach representations are complete nonarchimedean `L`-spaces with jointly continuous action and an open bounded invariant `O`-lattice. Finite length always means length in the indicated representation category, equivalently `O[G]`-length in the torsion setting; it does not mean finite `O`-length.

Write `G=GL₂(ℚ_p), K=GL₂(ℤ_p), B` for the upper triangular Borel, `P` for the mirabolic subgroup with lower row `(0,1), Z` for scalar matrices, and `P⁺` for the integral mirabolic monoid with nonzero upper-left entry. The Weyl element is `w=(0 1;1 0)`, with `w²=1` even at `p=2`. The BCDT normaliser element is instead `w_ℓ=(0 −1;ℓ 0)`, with `w_ℓ²=−ℓ`; its scalar eigenvalue must be retained in normaliser characters.

Use geometric reciprocity: `p` corresponds to geometric Frobenius and a unit `u` acts cyclotomically by `u`. If `x` is the identity character and `|p|=p⁻¹`, then `ε=x|x|` has `ε(p)=1` and `ε(u)=u`. The Galois cyclotomic character `χ` corresponds to `ε` and its reduction is `ω`. Thus `R(ε)` has `φ(e)=e, γ(e)=χ(γ)e`, whereas `R(x)` has `φ(e)=pe` and is not étale. Tau Ceti ClassFieldTheory's arithmetic Artin map must be inverted when forming the geometric map; fix this conversion before applying its Weil reciprocity equivalence.

Fontaine's `D(V)` is covariant. For a rank-two module `D`, put `δ_D=χ⁻¹det D` and `Ď=D∨(1)`, so `Ď≅D⊗δ_D⁻¹`. The contravariant module functor satisfies `D(Π(D))=Ď`. Colmez's covariant Galois functor takes a further Tate dual, so `V(Π(D))=V(Ď)∨(1)≅V(D)`, and `Π(V)=Π(D(V))`. These directions, and the twist in the compact functor `V̌`, must be checked on a principal series. The integral residue pairing takes values in `O`, the torsion pairing in `L/O`, and the rational pairing in `L`.

Use the Hodge–Tate convention in which `χ` has weight `+1`. For `a<b, W_{a,b−a}=Sym^{b−a−1}L²⊗det^a` has dimension `b−a`. For weights `(0,1)` it is trivial; equal weights do not define this algebraic factor. Frobenius semisimplification is performed only in the comparison with the classical irreducible correspondence. It does not erase `N` or change the filtered `(φ,N,G)`-module used to define a family of filtrations.

Parabolic inductions in Colmez's formulas are unnormalised unless a formula explicitly invokes §1.7’s unitary normalisation. In characteristic `p, B(δ₁,δ₂)=Ind_B^G(δ₂⊗δ₁ω⁻¹)`, so its central character is `ω⁻¹δ₁δ₂` and `V(B(δ₁,δ₂))=δ₁`. At `(r,λ,χ)=(0,1,1), Π(r,λ,χ)` has Steinberg subrepresentation and trivial quotient; at `(p−1,1,1)` the orientation is reversed. The first quotient is detected by augmentation. These conventions correct the reversed exceptional sequences in Colmez III.3.2 and CDN–Kisin Remark 1.1. At `p=2` the signs `±1` coincide, but `r=0` and `r=p−1` are still different parameters.

For compact projective `P_B` use `E_B=End(P_B)` with ordinary composition. Then `Hom(P_B,M)` is a right `E_B`-module and `P_B` is a left `E_B`-module, so evaluation is `Hom(P_B,M)⊗̂_{E_B}P_B→M`. Duality reverses arrows and replaces the endomorphism algebra by its opposite. At `p=2` use degree-two determinant laws, including determinant as well as trace; no division by 2 is allowed.

For potentially semistable type `(a,b;τ)` with distinct Hodge–Tate weights `a<b`, the fixed determinant is `ψε` and `ψ|_I=ε^{a+b−1}det τ`. Paškūnas 2015 calls this entire determinant `ψ_source`, so `ψ_source=ψε` here. A nonzero framed fixed-determinant type ring has absolute/generic-fibre/special-fibre dimensions `5/4/4`. When `End ρ̄=k`, the unframed dimensions are `2/1/1` and framing adds three variables. For repeated weights use §0.4’s flag-variety dimension formula. The zero ring is permitted. Scalar inertia has `σ(1)=`the inflated finite Steinberg of dimension `p`, while `σ^cr(1)=1`; they cannot be interchanged.

## Exact supplier contracts

### From Mathlib and the pinned Tau Ceti library

The headline statements in `Suggested.lean` use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `Matrix.GeneralLinearGroup` is the unit group of the matrix ring, `PadicInt` is the norm-at-most-one subring of `ℚ_p`, and `Subgroup` and `Submonoid` provide the bundled subset carriers. `ContinuousMonoidHom` supplies continuous multiplicative characters. `PowerSeries` supplies formal power series, with no implicit analytic convergence assertion. The file states Hilbert–Samuel polynomiality (§0.5) and the integral torsion finite-length theorem (§2.2); operation names elsewhere in this document specify target APIs.

`TopRep` bundles a representation by continuous linear endomorphisms. It alone does not assert joint continuity of the orbit map. `TauCeti.IsSmoothDiscrete` adds a discrete module topology and open point stabilisers, which give the required smooth action. `Field.absoluteGaloisGroup` carries the Krull topology; `cyclotomicCharacter` is applied to an algebraic closure with the required roots of unity, not to an arbitrary field that may have none. `IsUltrametricDist` supplies the nonarchimedean metric axiom. `CategoryTheory.IsGrothendieckAbelian` supplies the general categorical property, without asserting `GL₂`-specific local admissibility or envelope existence.

`AbstractMeasure X R E` is the continuous `R`-linear dual of `C(X,R)` with values in `E`. Mathlib's `AbstractMeasure.amiceTransform` is already `R`-linear for complete normed `ℤ_p`-algebras `R`; `AbstractMeasure.amiceTransformEquiv` is specifically a `ℤ_p`-linear equivalence with `ℤ_p⟦T⟧`. Reuse the convolution algebra and `AbstractMeasure.dirac_mul_dirac` from `Mathlib.NumberTheory.Padics.Measure.Monoid`. The `O_L`-valued equivalence, coefficient extension and affine-action comparisons are consumed from PadicMeasuresIwasawaAlgebras §§1.6–1.7 and 2.2 and PadicFunctionalAnalysis §3.4. In those conventions Dirac at a transforms to `(1+T)^a`, so `a=0,1` gives `1,1+T`, convolution of two `Dirac₁` gives `(1+T)²`, and translation/dilation gives multiplication/substitution. The scalar comparison is `O_L`-linear also for ramified `O_L`. These are supplier contracts, not a second measure-adapter target here.

The smooth-discrete carrier used in the Lean file is `TauCeti.IsSmoothDiscrete` from `TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic`. The coefficient carrier is Mathlib’s integer ring `𝒪[L]`, with the finite compatible extension specified by `TauCeti.FinitePadicExtension` from `TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex`. Mathlib’s `Submodule.torsionBy`, `Module.IsTorsion`, `Module.Finite`, `Module.length` and `IsFiniteLength` express torsion, admissibility, polynomial growth and representation length. In the compact-action API below the full names are `TauCeti.completedGroupAlgebra` and the operations in namespace `TauCeti.IsCompactModule`. Essential inclusions and covers come from `TauCeti.CategoryTheory.Injective.Envelope` and `TauCeti.CategoryTheory.Projective.Cover`.

### From the pinned Tau Ceti library

The inverse-limit `completedGroupAlgebra R Γ` and the module theory in the two completed-group-algebra modules above work for compact commutative coefficients and profinite `Γ`. `IsCompactModule` supplies the compatible finite quotients; `completedSMul_of`, `completedGroupAlgebraModule`, `isScalarTower_completedGroupAlgebraModule` and `continuousSMul_completedGroupAlgebraModule` give the extended action, module and continuity. Apply them with `R=O` and `Γ=H` compact open. They supply the carrier and action, while topological Nakayama and exactness of compact inverse systems require their separately stated hypotheses.

`TauCeti.IsEssentialMono` expresses an essential monomorphism through the reflection of monicity after composition; its dual `TauCeti.IsEssentialEpi` expresses the cover condition. An injective object plus an essential inclusion is an injective envelope, and dually a projective object plus an essential epimorphism is a projective cover. Reuse the categorical uniqueness-up-to-isomorphism results. None of these statements alone asserts existence inside the locally admissible central-character category.

<a id="fontaine-contract"></a>

### From PhiGammaModulesAndIwasawaCohomology, §§1.0–1.0c

Let `O_E` be the ring of Laurent series `Σ_{k∈ℤ} a_k T^k` with `a_k ∈ O_L` and `a_k → 0` as `k → −∞, E = O_E[1/p], O_E⁺ = O_L[[T]], E† ⊂ E` the overconvergent subfield and `R` the Robba ring over `L`, with the commuting actions `φ(T) = (1+T)^p − 1` and `σ_a(T) = (1+T)^a − 1 (a ∈ ℤ_p^× ≅ Γ)`. The categories in use are `ΦΓ^et_tors` (étale `(φ,Γ)`-modules of finite length over `O_E`), `ΦΓ^et(O_E), ΦΓ^et(E), ΦΓ^et(E†)` and `ΦΓ^et(R)` (slope 0, free of finite rank). The covariant Fontaine functors are `D(V) = (A ⊗_{ℤ_p} V)^H` and `V(D) = ((O_L·A) ⊗_{O_E} D)^{φ=1}`, with A the p-adic completion of the maximal unramified extension of `A_{ℚ_p}` and `H = ker χ`; they are exact quasi-inverse equivalences `Rep_tors G_{ℚ_p} ≅ ΦΓ^et_tors, Rep_{O_L} G_{ℚ_p} ≅ ΦΓ^et(O_E)` and `Rep_L G_{ℚ_p} ≅ ΦΓ^et(E) ≅ ΦΓ^et(E†) ≅ ΦΓ^et(R) (D ↦ D† ↦ D_rig = R ⊗ D†)`. The Tate dual of a representation is `V̌ = Hom(V, L ⊗ χ)` (resp. `Hom(V, O_L ⊗ χ), Hom(V, L/O_L ⊗ χ)`), and `V(Ď) = V̌` for the Tate dual `Ď` of [§1.3](#section-1-3). These choices fix these conventions for the whole roadmap; the rings, the equivalences and the overconvergence theorem are owned by PhiGammaModulesAndIwasawaCohomology §§1.0–1.0c and are not constructed here.

`p` any prime; `L/ℚ_p` finite. The overconvergence and Robba-ring steps are imported with their fixed-field hypotheses (§1.0) and Kedlaya's slope theory behind `ΦΓ^et(E†) ≅ ΦΓ^et(R)`.

Use the following named operations and compatibility results.

- `PhiGammaModuleEt.ofRep`: notation for the covariant specialization of PhiGammaModulesAndIwasawaCohomology §1.0’s `fieldEtaleRealization`, `D(V) = (A ⊗ V)^H`.
- `PhiGammaModuleEt.toRep`: `V(D) = ((O_L·A) ⊗ D)^{φ=1}`, the quasi-inverse.
- `PhiGammaModuleEt.ofRep_exact`: `D` is exact and commutes with tensor products and duals.
- `PhiGammaModuleEt.overconvergent`: `D ↦ D†` with `D = E ⊗ D†` (§1.0).
- `PhiGammaModuleEt.rig`: `D ↦ D_rig = R ⊗ D†`, an equivalence onto slope-zero modules over `R`.
- `PhiGammaModuleEt.toRep_tateDual`: `V(Ď) = V̌ = Hom(V(D), L ⊗ χ)`.

**Checks.**

- `PhiGammaModuleEt.ofRep_trivial`: `D(O_L) = O_E` with its own `φ` and `Γ`.
- `PhiGammaModuleEt.ofRep_cyclotomic`: `D(O_L(χ)) = O_E·e` with `φ(e) = e` and `σ_a(e) = a e`.
- `PhiGammaModuleEt.ofRep_zero`: `D(0) = 0` and `V(0) = 0`.
- `PhiGammaModuleEt.ofRep_not_contravariant`: `D` is covariant: a `G_{ℚ_p}`-map `V → W` gives `D(V) → D(W)`; the contravariant convention `D*(V) = Hom(V, A)^H` would send the cyclotomic character to the module with `σ_a(e) = a⁻¹e`.
- For `V = O_L` (trivial), `D(V) = O_E`.
- For `V = O_L(χ), D(V) = O_E ⊗ e` with `φ(e) = e` and `σ_a(e) = a e`.
- `D(V ⊗ W) = D(V) ⊗ D(W)` and `D` is exact.

[Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §4, Théorème 0.3, p. 8; §I.3.1, Théorème I.3.1, p. 33; [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §3, Théorème 0.1, p. 7.

<a id="rank-one-contract"></a>

### From PhiGammaModulesAndIwasawaCohomology, §§3.5 and 7.1–7.5

For `δ ∈ T̂(L), R(δ)` is the `(φ,Γ)`-module over the Robba ring `R = R_L` that is `R` itself with `φ` multiplied by `δ(p)` and `γ ∈ Γ` multiplied by `δ(χ(γ))`. (i) Every `(φ,Γ)`-module of rank 1 over `R` is isomorphic to `R(δ)` for a unique `δ ∈ T̂(L)`. (ii) `R(δ)` has Kedlaya slope `v_p(δ(p))`; it is étale (slope 0) iff `δ` is unitary, and then `R(δ) = D_rig(δ)` for `δ` viewed as a Galois character. (iii) `Ext¹(R(δ₂), R(δ₁)) = Ext¹(R, R(δ₁δ₂^{−1})) = H¹(δ₁δ₂^{−1})` is one-dimensional over `L` unless `δ₁δ₂^{−1}` is `x^{−i} (i ∈ ℕ)` or `|x|x^i (i ≥ 1)`, when it is two-dimensional, with projectivisation `ℙ¹(L)`.

`L/ℚ_p` finite. Sections 3.5 and 7.1–7.5 supply the field-coefficient rank-one classification and exceptional cohomology for every prime. The original Colmez 2008 proof assumes `p≠2`; its rank-two parameter-space theorem is separately scoped below. `L/ℚ_p` finite; `R = R_L` the Robba ring over `L`.

The following notation records the specialization of PhiGammaModulesAndIwasawaCohomology §7.1’s character line and §§7.2–7.4’s classification; it introduces no second rank-one carrier.

- `RobbaRankOne`: `R(δ)` for `δ ∈ T̂(L)`.
- `RobbaRankOne.classification`: Every rank-one `(φ,Γ)`-module over `R` is isomorphic to a unique `R(δ)`.
- `RobbaRankOne.slope`: `slope(R(δ)) = v_p(δ(p))`.
- `RobbaRankOne.isEtale_iff`: `R(δ)` is étale iff `δ` is unitary, and then `R(δ) ≅ D_rig(δ)`.
- `RobbaRankOne.tensor`: `R(δ₁) ⊗ R(δ₂) ≅ R(δ₁δ₂)` and `R(δ)^∨ ≅ R(δ^{−1})`.
- `RobbaRankOne.finrank_ext`: `dim_L Ext¹(R(δ₂), R(δ₁))` is 1, or 2 exactly when `δ₁δ₂^{−1} ∈ {x^{−i} : i ≥ 0} ∪ {|x|x^i : i ≥ 1}`.

**Checks.**

- `RobbaRankOne.normChar_eq_cyclotomic`: `R(x|x|) ≅ D_rig(L(χ))`.
- `RobbaRankOne.trivial`: `R(1) ≅ R`.
- `RobbaRankOne.finrank_ext_trivial`: `dim Ext¹(R, R) = 2`.
- `RobbaRankOne.x_not_etale`: `R(x) (δ(p) = p)` is not étale: its slope is 1.
- `R(x|x|) = D_rig(χ)`.
- `R(1) = R` and `R(x^{−i})` has `H⁰ ≠ 0` (contains `t^i`).
- `dim H¹(1) = 2 = dim Hom(ℚ_p^×, L)`.

[Pierre Colmez, COLMEZ08TRI](#ref-colmez08tri), §0.3, Théorème 0.2, p. 3; Proposition 3.1, p. 17; Théorème 2.9, p. 13 of the author's version; [Pierre Colmez, COLMEZ08TRI](#ref-colmez08tri), Remarque 0.3(i), p. 4.

PhiGammaModulesAndIwasawaCohomology §3.5 gives the exceptional dimensions via `H⁰, H²`, Tate duality and Euler characteristic, and its §§7.1–7.4 gives the classification at every prime. For `K=ℚ_p`, the checks are `H⁰(R)=L, H²(R(ε))=L` and `dim H¹(R)=2`. The all-prime supplier is Kedlaya–Pottharst–Xiao, [arXiv:1203.5718v3](https://arxiv.org/abs/1203.5718v3), Proposition 6.2.8 and Corollary 6.2.9, pp.58–59, and Theorem 6.2.14, pp.61–62. General saturated triangulations and parameter line bundles are its §7.5; the special rank-two Colmez parameter space and its redundancy relations remain Layer 1 here.

<a id="banach-contract"></a>

### Banach and analytic conventions for the supporting foundation §0.1

A unitary `L`-Banach representation `Π` of `G` is an `L`-Banach space with a continuous `G`-action admitting an open bounded `G`-stable `O`-lattice `Θ`; `Π` is admissible if `Θ/ϖΘ` is an admissible smooth `k`-representation (equivalently `Θ^d = Hom^{cont}_O(Θ, O)` is finitely generated over `O[[K]]`, equivalently `Π` restricted to one, hence every, compact open subgroup is admissible in the sense of Schneider–Teitelbaum). `Ban^{adm}_{G,ζ}(L)` is the category of admissible unitary `L`-Banach representations with central character `ζ`; it is abelian, being anti-equivalent through `Θ ↦ Θ^d ⊗ L` to finitely generated `L ⊗ O[[K]]`-modules with compatible `G`-action. `Π` is residually of finite length if `Θ/ϖΘ` has finite length (independent of `Θ`, with `Π̄^{ss} := (Θ/ϖΘ)^{ss}` independent of `Θ`); `Rep_L G` (Colmez, CDP) is the full subcategory of `Π` with a central character and residually of finite length, `Rep_{O_L}G` the p-adically complete separated `ϖ`-torsion-free `O[G]`-modules `Θ` with `Θ/ϖ^nΘ ∈ Rep^{tors}G`. An absolutely irreducible `Π` is ordinary if it is a subquotient of a unitary parabolic induction `(Ind_B^G η₁ ⊗ η₂)^{cont}` of unitary characters. Residual finite length is an additional predicate on the reduction of an invariant lattice; equivalence of admissibility with residual finite length in the finite-length central-character category uses the correspondence, not the definition of an admissible Banach object.

Coefficients `L/ℚ_p` finite; `Π` with central character for `Ban^{adm}_{G,ζ}(L)`.

Use the following named operations and compatibility results.

- `GL2Qp.UnitaryBanachRep`: An `L`-Banach space with continuous `G`-action and an open bounded `G`-stable `O`-lattice.
- `GL2Qp.UnitaryBanachRep.IsAdmissible`: `Θ/ϖΘ` admissible for an (equivalently every) open bounded `G`-stable lattice `Θ`.
- `GL2Qp.UnitaryBanachRep.isAdmissible_iff_fg`: `Π` admissible iff `Θ^d` is finitely generated over `O[[K]]` (§0.1).
- `GL2Qp.UnitaryBanachRep.abelian`: `Ban^{adm}_{G,ζ}(L)` is abelian.
- `GL2Qp.UnitaryBanachRep.IsResiduallyFiniteLength`: `Θ/ϖΘ` has finite length.
- `GL2Qp.UnitaryBanachRep.residualSemisimplification`: `Π̄^{ss} := (Θ/ϖΘ)^{ss}`, independent of `Θ`.
- `GL2Qp.UnitaryBanachRep.IsOrdinary`: Absolutely irreducible and a subquotient of a unitary parabolic induction of unitary characters.
- `GL2Qp.UnitaryBanachRep.reduction`: `Θ ↦ Θ/ϖ^nΘ` lands in `Mod^{l.adm}_{G,ζ}(O/ϖ^n)`.

**Checks.**

- `GL2Qp.UnitaryBanachRep.character_isAdmissible`: A unitary character `η∘det` is a one-dimensional admissible unitary Banach representation, ordinary, with `Π̄^{ss} = η̄∘det`.
- `GL2Qp.UnitaryBanachRep.zero`: The zero representation is admissible and residually of length 0.
- `GL2Qp.UnitaryBanachRep.not_unitary_of_central`: For a nonzero representation, a central character with `|ζ(p)| ≠ 1` excludes an open bounded `G`-stable lattice.
- `GL2Qp.UnitaryBanachRep.compat_compactDuality`: Restricted to `K, Π` is an admissible `K`-Banach representation in the sense of §0.1, and `Π ↦ Π′` matches the anti-equivalence of §0.1.
- The universal unitary completion of the smooth Steinberg is in `Ban^{adm}_{G,1}(L)`.
- A continuous principal series induced from unitary characters is admissible and residually of finite length; every absolutely irreducible subquotient is ordinary.
- A nonzero representation with non-unitary central character is never unitary. The zero representation satisfies every central-character equation and has the open bounded invariant lattice `{0}`.

[Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas, CDP14](#ref-cdp14), §1.1, p. 1; [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §1.1, p. 3; §4; [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §4, p. 8.

The `GL₂` residual finite-length and ordinary predicates in this contract are specialisations used below. They are not part of the definition of a general admissible Banach representation. In the category with finite length and central character, equivalence with residual finite length is a theorem of the correspondence. On a nonzero representation a non-unitary scalar character cannot preserve an open bounded lattice, already on the scalar `p`.

The analytic-vector contract for `Π^{an}` uses the orbit-map definition. It supplies an admissible locally analytic representation, dense in `Π`, and an exact functor on admissible unitary Banach representations, with strong dual coadmissible over `D(H,L)`. Its `GL₂` specialisation has the following names, all supplied by that general theory.

- `GL2Qp.analyticVectors`: `Π^{an}`, a `G`-stable subspace with its locally convex inductive-limit topology.
- `GL2Qp.analyticVectors_dense`: `Π^{an}` is dense in `Π` for `Π ∈ Ban^{adm}_G(L)`.
- `GL2Qp.analyticVectors_exact`: `Π ↦ Π^{an}` is exact on `Ban^{adm}_G(L)`.
- `GL2Qp.analyticVectors_zero`: `0^{an} = 0^{alg} = 0`.

Check `GL2Qp.analyticVectors_zero`: `0^{an}=0`, and the inclusion `Π^{an}→Π` is dense even when `Π^{alg}=0`. Density and exactness use §0.1’s faithful-flatness theorem for distributions over the compact Iwasawa algebra; they are not formal properties of a subspace of orbit maps. See Colmez–Dospinescu §0.1, pp.3–4, and the theorem of §0.1.

### From smooth representation theory and compact duality

Use SmoothRepresentationsOfLocalGroups SR.0.4 for admissibility at fixed `O/ϖⁿ` level, SR.0d.1 for Grothendieck and enough-injectives properties, and SR.2.1 for smooth/compact induction with Frobenius reciprocity. For general torsion modules, require finite `π^H[ϖⁿ]` at every compact open `H` and every `n`; a single finite coefficient level does not replace this condition. Use §0.3 for the coefficient-linear compact/discrete duality and its comparison with the underlying p-primary dual.

The `**O`-linear duality adapter** identifies `Hom_O(−,L/O)` with that underlying dual after keeping the inverse different in the trace pairing. Choosing a generator can trivialise the inverse different but is additional data. Prove exactness, continuous biduality, and `(g·f)(v)=f(g⁻¹v)`. On `O/ϖ` the `O`-dual has `k`-dimension one, on 0 it is 0, and applying duality twice recovers `O/ϖⁿ`; a bare circle-valued Pontryagin dual without the scalar structure does not supply these comparisons. The representation-category source is Paškūnas 2013, §2, pp.14–15. PadicMeasuresIwasawaAlgebras §5.2 supplies compact topological Nakayama and exactness of inverse systems with compactness, surjective-transition or Mittag–Leffler, and separation hypotheses stated before use.

### From period rings and classical local Langlands

PadicPeriodRings §§4.1–4.3 supplies `B_cris`, `B_st`, `B_dR`, their invariant functors and the rational crystalline, semistable and de Rham predicates. PhiGammaModulesAndIwasawaCohomology §1.0 supplies the rational Robba realisation and §5.6a the de Rham differential-equation module `N_dR(V)`. NoncommutativeAndEquivariantIwasawa §F.6 supplies de Rham semistabilization and the generic `D_pst`/Weil–Deligne realization. Section 0.2 constructs the weak-admissibility and differential-period dictionaries and compares Colmez's normalization with that supplied realization. All use covariance and `χ`-weight `+1` as fixed above.

SmoothRepresentationsOfLocalGroups SR.5.2, “Shared raw Weil–Deligne parameters”, “Operations on raw parameters”, “Frobenius semisimplification” and “Classical parameters and the generic convention”, supplies raw parameters, the operation retaining `N`, the classical `GLₙ` correspondence and characteristic-zero coefficient descent. Its reciprocity is arithmetic. Section 1.7 constructs the transported inverse `rec_geo(π)=rec_arith(π)∨`, where `rec_arith` is the representation-to-parameter inverse of the supplier's unitary correspondence, and sets `rec_geoᵀ(π)=rec_geo(π)⊗ν_geo^(-1/2)`. Here `ν_geo(w)=p^(deg w)` is the geometric Weil realization of `ν=|·|`; its arithmetic realization is `ν_geo⁻¹`. This duality transport precedes Colmez's induction and Tate/unitary comparisons. The p-adic occurrence theorem, multiplicity one, uniqueness for `p>2` and dyadic independence of semisimplified reductions after the algebraic factor are targets of §4.4 (Paškūnas 2016 §2.C, published pp.1325–1326).

For BCDT admittance, LocalGaloisGroups and LocalFieldsRamification supply the local Galois group, inertia and tame quotients. Section 0.3 supplies the fundamental-character and peu/très ramifié comparisons; §2.8 supplies the finite and normaliser representations. The Cartier dual is `ρ̄∨⊗ω`, and `ω₂^(p+1)=ω`. The BCDT inertia case table is stated in §5.13.

### Local deformation and cycle contracts

Section 0.4 constructs the framed lifting functor, fixed determinant, unframed comparison and the bounded Hodge/inertial-type quotients. The rank-two **dyadic fixed-determinant type-ring contract** requires the reduced `O`-torsion-free pointwise universal quotient for `det=ψε` at `p=2`, allowing zero. For distinct Hodge–Tate weights `a<b` and compatible determinant its nonzero rings have dimensions `5/4/4` framed and `2/1/1` unframed when `End ρ̄=k`; repeated weights use §0.4’s flag-variety dimension formula. It does not split determinant variables using 1/2. Paškūnas 2016 §2.C and Tung's all-prime type-ring statements specify this case.

IntegralHeckeAndGaloisDeterminants §§0.1–0.5 supplies determinant polynomial laws, trace/determinant identities and continuity through finite quotients; §§1.1–1.3 supplies Cayley–Hamilton ideals and henselian irreducible reconstruction, and §1.5 supplies the algebraic universal quotient. Over a ring in which 2 is not invertible retain `d` explicitly in `g²−T(g)g+d(g)`. Section 5.4 constructs the continuous residual completion, fixes `d=δε`, proves its noetherian representability and forms the closed ideal on the native completed group algebra. Section 0.5 constructs cycle groups, effective-cycle lengths, specialization and Hilbert–Samuel multiplicities. Equality of multiplicities alone does not imply equality of cycles.

## How to read the build

Layer 0 constructs the supporting analytic and arithmetic comparisons; Layer 1 fixes Colmez's normalizations. In Layer 2 construct §2.1's categories and §2.8's finite types, then §§2.6–2.7 and the finiteness/duality results of §§2.1–2.3. Section 2.5 at this stage supplies only the completion definition and conditional coherent-lattice criterion. Construct the torsion Montreal functor of §§3.1–3.3, then the envelope and Morita machinery of §§5.1 and 5.3 before the correspondence. Construct the compatible-module gluing of §§3.4–3.5 and the compatible-pair analytic-radius construction of §3.11 before the correspondence proof. For the Paškūnas `p≥5` route prove §5.5(i)–(ii) first. The all-prime CDP residual-finiteness route uses the envelope-module and rational-commutativity arguments of §3.8 without presupposing a deformation-ring identification. Independently prove §3.6a’s residual density and coefficient/lattice descent, then §3.6’s family stability and §3.7’s existence and reconstruction. The scalar dyadic case uses CDP-WILD Theorem 10.1 in these conventions. Combine existence with CDP’s separate residual-finiteness and injectivity arguments for §3.8, then prove the irreducible analytic comparisons of §3.11. The dyadic identification §5.5(iii) follows on this route. The Banach consequences of §5.5(iv)–(v) follow after the correspondence. Prove the `GL₂` H-coherence and analytic universal-completion conclusions of §2.5 from the compatible-module analytic result after §3.11. In Layer 4 construct §4.1k’s almost-de-Rham Kirillov maps and conditional structural results, then §4.1a’s localization, restriction-surjectivity and reciprocity comparisons, followed by §4.2(i)’s nonvanishing criterion. Section 4.7 contains the subsequent de Rham Kirillov consequences. On the nonempty irreducible locus `F_irr`, construct §4.2a’s action on `N_rig⊠ℙ¹` and prove VI.6.41, then §4.2b’s algebraic filtration independence (VI.6.42), followed by the remaining type comparisons of §4.2 and §4.11’s analytic quotient (VI.6.43). The action construction uses only §4.2(i), not its filtration-independence consequence. Layer 4 also compares de Rham deformations; the remaining Layer 5 targets compare centres, type rings and cycles. Layer 6 makes case-specific local and conditional global deductions; before §6.1, construct §6.0’s ratio-`ω` compact deformation and §6.0a’s ratio-`ω⁻¹` envelope comparison separately. Carriers determine which targets admit signatures in Suggested.lean; this README is the specification.

## Layer 0: Supporting analytic and arithmetic foundations

These targets precede their uses in Layers 1–6. The period rings, smooth categories, classical correspondence, measure algebra and algebraic determinant laws are consumed through the exact contracts above. The additional comparisons below construct the mathematical objects and prove their universal properties on those carriers.

<a id="support-analytic"></a>

### 0.1 Locally analytic functions, distributions and Banach duality

For a finite extension `F/ℚ_p`, a complete discretely valued coefficient extension `L/F` and a locally `F`-analytic manifold `X`, construct the shared space `LA(X,L)`, written `AnalyticSupport.functions X L` in the representation adapters, the locally convex space of locally analytic functions, from analytic charts and their Banach radius spaces. Give restriction, pullback, gluing, finite products, continuous evaluation, chart independence and the continuous dual with its strong topology. For compact locally analytic `H`, use the shared strong-dual carrier `D(H,L)`, written `AnalyticSupport.distributions H L` in these adapters, with convolution obtained by the transpose of multiplication on `H`. Prove the Dirac, pushforward, convolution, completed projective tensor and open-subgroup comparisons. Develop the locally convex inductive/projective limits and compact-type/nuclear duality needed to identify these duals; an algebraic union of analytic functions does not specify its strong dual. PadicFunctionalAnalysis Layers 0–4 supplies the nonarchimedean Banach analysis and one-variable analytic stages; this target owns the common manifold and locally convex comparisons (Schneider–Teitelbaum, **ST03**, §§2–4 and 6).

**Checks.**

- For `X` a point the function space and its strong dual are `L`, and evaluation at that point is the identity.
- On `H=ℤ_p`, Dirac at a sends a function `f` to `f(a)`, and `δ_a*δ_b=δ_(a+b)`; its restriction to continuous functions agrees with the measure supplier's bounded dual.
- For a nonidentity embedding `σ:F→L`, the function `x↦σ(x)` on `O_F` is `ℚ_p`-analytic but not `F`-analytic for the chosen inclusion `F⊂L`; the `F`-analytic quotient must retain this distinction.
- On a noncommutative compact `H`, `δ_g*δ_h=δ_(gh)`, and switching `g,h` changes the answer when `gh≠hg`. The empty manifold has zero function space and zero dual.
- The locally analytic distribution with Amice transform `log(1+T)` on `ℤ_p` is not a bounded measure: its coefficients `(-1)^(n+1)/n` are unbounded. Thus the distribution algebra must contain more than the bounded measure algebra.

The common compact-manifold API includes `analyticPullback`, `analyticTensor_equiv`, strong biduality and `distributionConvolution`; their GL₂ uses are specialization maps on the same spaces. For noncompact `X` construct the sheaf and locally convex topology by restrictions to compact charts. For locally `F`-analytic functions use the `F`-linear chart condition and its quotient of the underlying `ℚ_p`-analytic distribution algebra; do not identify these two analytic structures when `F≠ℚ_p`.

For compact `H` and discretely valued `L`, prove that `D(H,L)` is Fréchet–Stein, with noetherian Banach radius algebras and flat transitions. Define `AnalyticSupport.Coadmissible M` by compatible finite modules over these stages, recovered by inverse limit. Prove independence of a cofinal radius sequence, the abelian and exact finite-stage API, and the strong-dual anti-equivalence with admissible locally analytic `H`-representations. For a locally analytic group `G`, define admissibility by restriction to a compact open `H` and prove independence of `H`. For locally `ℚ_p`-analytic `H`, prove faithful flatness of `L⊗_O O[[H]]→D(H,L)`; no faithful-flatness assertion for a general `F`-analytic quotient with `F≠ℚ_p` is inferred. Sources: ST03, §3, Theorems 4.9–4.11, 5.1–5.2 and 6.3; the uniform pro-`p` models retain the source's `p`-valuation hypotheses, including the smaller uniform subgroup at `p=2`.

**Checks.**

- The zero module is coadmissible, and the regular `D(H,L)`-module is recovered from its regular Banach stages.
- A finite-dimensional analytic character has a coadmissible dual; forgetting its character and retaining only its dimension loses the distribution action.
- For `H` a point, coadmissible modules are finite-dimensional `L`-spaces. An infinite-dimensional discrete direct sum of copies of `L` fails this condition.

The common Banach/Schikhof foundation is constructed here once, alongside §0.3's compact–discrete duality. For any p-adic Lie group `G` and finite `L/ℚ_p`, construct the category of unitary Banach representations with jointly continuous action and its admissible subcategory. For compact open `H` prove Schikhof duality with finitely generated `L⊗_O O[[H]]`-modules, with the dual lattice and its topology retained; transport compatible `G`-action and fixed central character. Define `AnalyticSupport.vectors Π` by locally analytic orbit maps with its natural locally convex topology. On admissible Banach objects prove density, exactness, admissibility and the dual base-change identification with `D(H,L)`. These give the Banach and analytic conventions above and their `GL₂` specialisations. Sources: Schneider–Teitelbaum, **ST02**, §§1–3, especially Theorem 3.5; ST03, Theorem 7.1; Paškūnas 2013 §4.

**Checks.**

- The trivial Banach representation `L` has dual `L` and all its vectors are analytic; zero gives zero on both sides.
- A unitary analytic character has all vectors analytic and the correct inverse character on its continuous dual.
- For translation on `C(ℤ_p,L)`, the analytic vectors are the locally analytic functions and form a dense proper subspace. The nonanalytic continuous function is not made analytic by completeness.
- On a nonzero scalar Banach action with `|ζ(p)|≠1`, no open bounded invariant lattice exists, matching the unitary predicate in the Banach contract.

*Needs:* PadicFunctionalAnalysis Layers 0–4; PadicMeasuresIwasawaAlgebras §§1.6–1.7 and 5.2; SmoothRepresentationsOfLocalGroups SR.0 and SR.2; Tau Ceti completed group algebras.

<a id="support-hodge"></a>

### 0.2 Filtered periods, differential modules and Weil–Deligne comparison

Use the period carriers, invariant functors and crystalline/semistable/de Rham predicates of PadicPeriodRings §§4.1–4.3. For a complete discretely valued characteristic-zero field `K` with perfect residue field of characteristic `p` and a chosen Cohen subfield `K₀` with Frobenius, construct the shared carrier `FilteredPhiNModule K`: finite-dimensional `K₀`-spaces with invertible semilinear `φ`, nilpotent `N` satisfying `Nφ=pφN`, and an exhaustive separated decreasing filtration on `K⊗_(K₀)D`. Include finite Galois descent data for potentially semistable objects. Morphisms preserve all these structures. Define weak admissibility by `t_H(D)=t_N(D)` and `t_H(D')≤t_N(D')` for every `φ,N`-stable subobject with induced filtration. Prove tensor, dual, Tate twist, exact-category, scalar-change and descent APIs, and that the supplied `D_st` is a fully faithful equivalence from semistable representations onto weakly admissible objects. Use this same carrier and equivalence in every filtered-period comparison; the Colmez adapter converts its filtration jumps to the weight convention here. Retain the general-rank equivalence; rank two is the filtration-line Check. Sources: Brinon–Conrad, **BC09**, §§8.1–8.3, Proposition 9.2.14, Theorem 9.3.4 and Remark 11.3.4; Colmez–Fontaine's weakly-admissible/admissible theorem as proved there.

**Checks.**

- The trivial representation gives the rank-one filtered unit, with `φ=1, N=0` and its unique filtration jump at 0.
- For `χ` the period basis is `t⁻¹e_χ`, with `φ=p⁻¹` and filtration jump `−1`, while its Hodge–Tate weight here is `+1`. This differs from the basis of its étale `(φ,Γ)`-module, on which `φ=1`.
- Zero is weakly admissible. A one-dimensional object with `φ=1` and filtration jump 1 fails `t_H=t_N`.
- In rank two equality of total Hodge and Newton numbers does not suffice: a `φ`-stable line with `t_H>t_N` violates weak admissibility.

For finite `K/ℚ_p`, use NoncommutativeAndEquivariantIwasawa §F.6's all-rank, all-prime de Rham semistabilization and generic period realization. The notation `HodgeSupport.Dpst V` denotes its `D_pst(V)`, with the same raw Weil–Deligne carrier from SR.5.2; exactness, tensor, dual, coefficient descent and independence of the semistable extension are supplied properties. Construct the normalization comparison `HodgeSupport.Dpst_WD` by the identity on the actual `B_st` invariants over a common semistable extension and the same coefficient component. Preserve semilinear descent, the filtered de Rham comparison and the period-ring operator `N_p`; a uniformizer-normalized presentation with `N_K=e_K N_p` is transported by dividing by `e_K` before this comparison. The maps compose in field towers and commute with coefficient change, tensor products, duals and twists. The geometric-reciprocity dictionary of §1.7 is a separate normalization transport. Construct `D_dif^+(V)` and `D_dif(V)` with their cyclotomic `Γ`-action, localization maps and connection, the Sen operator and generalized Hodge–Tate weights; prove that de Rhamness is equivalent to a full horizontal basis of `D_dif`. Prove `D_cris(V)=(D_rig(V)[1/t])^Γ` and `D_st(V)=(D_log(V)[1/t])^Γ`, where `D_log(V)` is the logarithmic Robba realization with its monodromy. Retain inversion of `t` in twists and coefficient change. Identify the unfiltered differential equation with PhiGammaModulesAndIwasawaCohomology §5.6a's supplied `N_dR(V)`; the original filtered lattice is not identified with its unfiltered extension. Sources: BC09, Theorem 9.3.5 and §§15.1–15.4, especially Definition 15.4.14 and Proposition 15.4.15; Berger, **BERGER02**, Theorems 0.2 and 0.4 and §5. The additional APIs include `Ddif_deRham_iff`, `Robba_crystalline`, `Robba_semistable`, `Sen_twist` and compatibility with all finite field and coefficient extensions.

For finite `K/ℚ_p` and `L` containing its embeddings, classify crystalline characters through reciprocity: in the geometric convention their restriction to units is `u↦∏_σ σ(u)^(n_σ)` with integral labelled weights `n_σ`, with the unramified factor and unitary extension condition retained. Prove the arithmetic-reciprocity formula by inversion. Use Conrad, [Lifting global representations with local properties](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), Appendix B, Proposition B.4(i)–(ii), pp.35–36, and Example B.5, p.36, for the coefficient-linear classification and its crystalline periods. Construct the labelled period/Sen decomposition on `L⊗ K`, with one factor for each embedding, and its local-algebraicity criterion. Compare each embedded Lubin–Tate character with its crystalline period: its labelled weight is 1 at that embedding and 0 at the others. Tensor these periods and their inverses; a remaining finite inertia character is crystalline only if unramified. Algebraicity on an open subgroup of units gives de Rhamness, while crystallinity requires the displayed formula on all units.

**Checks.**

- The unramified unit-valued character has all weights zero; over `ℚ_p` the character `ε=x|x|` has weight `+1` and geometric reciprocity sends `p` to value 1.
- For `[K:ℚ_p]>1`, an embedded Lubin–Tate character has unequal labelled weights; a common Tate twist cannot replace it. A nontrivial finite ramified character has all weights zero and is de Rham, but is not crystalline.
- The crystalline period of `L(χ)` is `t⁻¹e_χ`, absent from the unlocalized Robba line; the localized invariant formula recovers it.
- The character `x` has the same unit restriction but value `p` at `p` and does not extend continuously to `G_(ℚ_p)`; the unitary extension condition is essential.
- A semistable noncrystalline representation has nonzero `N`, retained by its raw `WD` parameter and by Frobenius semisimplification; erasing `N` changes its classical smooth factor.
- The trivial and zero representations have respectively the unit and zero differential equations; a representation without full-rank `D_dR` cannot acquire a full horizontal basis.
- Over `K` with `e_K=2`, a Tate-curve parameter with `N_K≠0` has `N_p=N_K/2`. A ramified quadratic extension doubles `N_K` and `e_K` but leaves `N_p` unchanged; the comparison over a further extension equals the composite comparison.

*Needs:* PadicPeriodRings §§1.1–1.5 and 4.1–4.3; NoncommutativeAndEquivariantIwasawa §F.6; PhiGammaModulesAndIwasawaCohomology §§1.0–1.0c and 5.6a; ClassFieldTheory Layers 7–9; SmoothRepresentationsOfLocalGroups SR.5.2, “Shared raw Weil–Deligne parameters” and “Operations on raw parameters”.

<a id="support-duality"></a>

### 0.3 Coefficient-linear duality and the residual ramification dictionary

For a finite extension `L/ℚ_p` with integers `O`, define `DualitySupport.torsionDual M=Hom_O(M,L/O)` for discrete `O`-torsion `M`, with compact-open topology, and its compact-to-discrete counterpart. Prove exact contravariant equivalence, continuous evaluation/biduality, compatibility with finite quotients and inverse/direct limits, and transport of continuous group actions by `(g·f)(v)=f(g⁻¹v)`. Compare the underlying `ℤ_p`-dual using the trace and the inverse different: the natural dualizing quotient is `L/𝔇⁻¹`, rather than an unchosen identification of this quotient with `L/O`. A generator of the inverse different gives the latter comparison. The representation-category anti-equivalence and completed-group-algebra action are then §2.3. Source: Paškūnas 2013 §2, pp.14–15, and Nakamura Appendix B.3.2. Give the API `DualitySupport.exact`, `bidual`, `finiteQuotient`, `traceComparison` and `contragredient`.

**Checks.**

- The `O`-dual of `O/ϖⁿ` is isomorphic to `O/ϖⁿ`; its dual again is the original module via evaluation, and zero dualizes to zero.
- A scalar action `ζ` dualizes to `ζ⁻¹`. The smooth character and its compact dual therefore have inverse central characters.
- Over ramified `O` the trace comparison retains the inverse different; using the trace directly on `L/O` gives an `O`-linear but nonperfect pairing with kernel `𝔇⁻¹/O`. For odd `p` and `L=ℚ_p(√p)`, the nonzero class of `(2√p)⁻¹` lies in this kernel. A chosen generator of `𝔇⁻¹` supplies the corrected comparison.

For any nonarchimedean local field `K` with finite residue field of characteristic `p` and cardinality `q`, including equal characteristic, construct the shared `fundamentalCharacter` API on its supplied tame inertia quotient, at every niveau `f≥1`, by reduction of the Kummer character of a `(p^f−1)`-st root of a uniformiser into `𝔽_(p^f)^×`. Retain the residue embedding, prove independence of the uniformiser and compatible root choices, and construct the Teichmüller lift and the least niveau of a finite-image tame character. Prove surjectivity, restriction and norm compatibility, coefficient conjugation by `p`-powers and conjugation by an arithmetic Frobenius lift through the `q`-power map. For finite `K/ℚ_p`, the niveau-one comparison is `ω₁^(e_K)=ω|_(I_K)`; over `ℚ_p` it is `ω₁=ω`. For extensions of 1 by `ω` over `ℚ_p`, construct the subspace `peuRamifieH1` as the Kummer image of units. Membership is the total unit-Kummer condition, including the split class. Define `IsPeuRamifiee(ρ̄_c)` to mean that wild inertia acts nontrivially and `c∈peuRamifieH1`; this is Serre's restricted unit-Kummer condition. Define `IsTresRamifiee` by nontrivial wild inertia and `c∉peuRamifieH1`. The BCDT adapter uses these characters and membership in `peuRamifieH1`. Prove `RamificationSupport.peuRamifie_restricted`: for every extension class `c`, membership in `peuRamifieH1` is equivalent to trivial wild inertia on `ρ̄_c` or `IsPeuRamifiee(ρ̄_c)`. The latter predicate includes the nontrivial-wild hypothesis, so on that domain the equivalence reduces to Serre's predicate. Prove invariance under isomorphism and scalar extension, compatibility with twists and Cartier duality `ρ̄∨⊗ω`, and the comparison with the Serre-weight convention used in BCDT §1.3. Sources: BCDT01 §1.3, pp.854–856, with its Serre-weight convention; Serre, **SERRE87**, §§2.1–2.4, especially (2.4.6)–(2.4.7), p.186; Serre, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*, §1.3, Proposition 2, p.264, and §§1.7–1.8, pp.267–269, for the tame-root and norm construction, which uses only the finite residue field. The chosen characters and the extension-class convention are shared by §§2.7–2.8, 3.3 and 5.13.

**Checks.**

- `ω₂^(p+1)=ω`, and the two conjugate niveau-two characters are `ω₂` and `ω₂^p`; replacing both by `ω` loses the irreducible inertia case.
- The split class lies in `peuRamifieH1` and has two-dimensional wild invariants, so it satisfies the trivial-wild alternative and not `IsPeuRamifiee`. A Kummer class represented by a uniformiser is outside the unit subspace.
- Over `ℚ₃`, the unit class of 4 is nonzero because a unit cube is `±1 mod 9`; its extension has nontrivial wild inertia and satisfies `IsPeuRamifiee`.
- Over `ℚ₂`, the unit class of 5 is nonzero and gives the unramified quadratic extension: `(1+√5)/2` has polynomial `X²−X−1`, irreducible and separable modulo 2. It lies in `peuRamifieH1` and satisfies the trivial-wild alternative, although the extension is nonsplit.
- The dual of a split character sum has characters `ωχ₁⁻¹,ωχ₂⁻¹`; applying Cartier duality twice recovers the original pair.
- At `p=2, ω₁` is trivial but `ω₂` has order 3. Thus the niveau-two test remains discriminating in residue characteristic two.
- For `K=𝔽_q((t))`, tame roots of `t` give the same surjective characters and Frobenius acts by the `q`-power map. The mixed-characteristic cyclotomic formula is not asserted on this domain.

*Needs:* Mathlib continuous linear maps and finite-module lengths; Tau Ceti completed-group-algebra modules; ClassFieldTheory Layers 5 and 7; LocalFieldsRamification Layers 0–3; LocalGaloisGroups Layers 0–3 and 5–7.

<a id="support-deformations"></a>

### 0.4 Local lifting functors and bounded Hodge-type quotients

Use SchemeAndStackFoundations §4.2's Artinian and complete noetherian local `O`-algebra categories with residue `k`. These are the common local deformation constructions; the block-specific completion and centre comparisons are §§5.4–5.6. For any profinite group `Γ, n≥1` and continuous `ρ̄:Γ→GLₙ(k)`, define `DeformationSupport.framed` by continuous lifts in the fixed residual basis and `DeformationSupport.unframed` by strict conjugacy. Prove functoriality on coefficient maps and finite quotients. Under Mazur's `Φ_p` finiteness condition, prove framed pro-representability and noetherianity; when `End_(k[Γ])(ρ̄)=k`, prove unframed pro-representability and formal smoothness of forgetting the frame of relative dimension `n²−1`. Define fixed determinant as the actual fibre of determinant for every `p`, including `p|n`; it is not defined by splitting off scalar characters. Give tangent and obstruction comparisons on continuous cochains: framed tangents are `Z¹(ad ρ̄)`, unframed tangents `H¹(ad ρ̄)`, and fixed-determinant tangents are the determinant fibre, with the boundary map from the trace sequence retained when trace on scalar endomorphisms vanishes. Source: Mazur, **MAZUR89**, §§1.1–1.3; the finite-local-group `Φ_p` input is LocalGaloisGroups Layers 3 and 7. The API is the universal lift, its representing equivalence on Artinian coefficients and inverse limits, `forgetFrame`, `fixedDeterminant`, coefficient extension and the tangent/obstruction maps.

The framed object is the representing pair `(R^□,ρ^□)`, including its actual continuous universal lift in the chosen basis. Choose this pair once for the continuous fixed-basis lifting functor. Its finite-generator matrix equations describe this same pair by a presentation; the presentation theorem supplies the universal matrices on this ring, rather than another exported deformation-ring carrier. For two presentations of this functor on the same coefficient category, prove that the representing bijections induce a unique continuous local isomorphism carrying one universal lift to the other. Construct the maps on Artinian quotients and pass to inverse limits; naturality and the representing bijections prove both inverse identities. The comparison commutes with coefficient change and descends to the same fixed-determinant fibre. It identifies finite-generator matrix presentations and Schlessinger presentations whenever both satisfy these hypotheses, including when only the maximal pro-`p` quotient of the residual kernel is finitely generated. An abstract ring isomorphism without the universal lift is insufficient. Source: MAZUR89, §§1.1–1.3, and uniqueness of a pro-representing pair.

**Checks.**

- For `Γ` trivial and `n=1` with its unique residual character the representing ring is `O`, and the deformation functor has one point over every coefficient algebra.
- At `A=k[ε]/ε²`, the lift is `(1+εc(g))ρ̄(g)` with `c` a continuous cocycle; strict conjugation changes `c` by a coboundary.
- A scalar residual representation in rank two has nonscalar endomorphisms. The framed functor still exists, while the Schur unframed universal-ring theorem cannot be invoked.
- At `p=2`, scalar tangent matrices have trace zero in rank two; the determinant-fibre construction must retain this case without dividing by 2.
- For `Γ=ℤ_p`, rank one and trivial residual character, the universal pair is `O[[T]]` with universal value `1+T` at 1. The automorphism `T↦T+T²` does not preserve that value and is not an automorphism of the representing pair.

For every finite `K/ℚ_p, n≥1`, residual `ρ̄` and bounded labelled Hodge type `v` and finite-image inertial type `τ`, construct the reduced `O`-torsion-free quotients `DeformationSupport.pstRing` and `crystallineRing` of the framed ring. Choose a finite Galois extension `K'/K` killing `τ` and retain its descent data. Their maps to every finite local `L`-algebra, including nonreduced ones, classify lifts semistable over `K'` with exactly those Hodge and inertia types, and respectively `N=0`. Prove uniqueness, coefficient change, type-preserving twists, and the finite-algebra period/descent comparisons needed by this criterion. Construct the finite-projective period modules with `φ,N`, descent and filtration over those coefficient algebras and prove compatibility with residue maps; a field-valued point criterion alone is insufficient for the Artinian comparison. The quotient can be zero. Source: Kisin, **KISIN08**, Theorem (2.7.6), Corollary (2.7.7), p.23, and Theorems (3.3.4), (3.3.8), pp.29–30; Bellovin–Gee, **BG19**, §3.3.

For these `GLₙ` type quotients, the nonempty framed generic fibre has dimension `n²+Σ_σ dim Flag_(v,σ)`, where `Flag_(v,σ)` parametrizes filtrations with the prescribed labelled dimensions. Fixing a compatible determinant replaces `n²` by `n²−1`. Sources: BG19, Theorems 3.3.3 and 3.3.8, pp.30–33. For `GL₂` over `ℚ_p` with distinct Hodge–Tate weights `a<b` and compatible fixed determinant, the nonzero type quotient has absolute/generic/special dimensions `5/4/4` framed, including `p=2`; under `End ρ̄=k` its unframed dimensions are `2/1/1` (Paškūnas 2016 §2.C). For repeated weights retain the general flag-variety dimension formula: the flag variety is a point, so the nonempty framed fixed-determinant generic fibre has dimension 3. Full `WD` type additionally fixes Frobenius data: its local deformation condition and generic-fibre locus are distinct from the inertia-only quotient; §5.12 proves the block construction and PID comparison for irreducible rank-two full type.

**Checks.**

- For a regular rank-three Hodge type over a degree-`f` local field, the framed generic dimension is `9+3f` and the compatible fixed-determinant dimension is `8+3f`.
- Rank two over `ℚ_p` with distinct weights and fixed determinant gives generic dimension 4; when `End ρ̄=k`, forgetting three framing parameters gives generic dimension 1. This remains the dyadic formula.
- At `p=5`, the trivial residual rank-two representation with crystalline weights `(0,0)`, trivial inertia and determinant 1 has a nonempty framed generic fibre of dimension 3: `P_v=GL₂`. The `5/4/4` formula does not apply, and this residual representation does not satisfy the Schur hypothesis.
- A unit-valued unramified rank-one character is crystalline of weight zero. A ramified finite-order character is potentially crystalline of weight zero, with its nontrivial inertia type retained.
- For `A=L[ε]/ε²`, an unramified character with Frobenius value `1+ε` is a nonconstant crystalline deformation of weight zero; replacing the finite-algebra criterion by its residue character loses this deformation.
- An empty type locus has the zero quotient and zero special-fibre cycle; a nonzero `O`-flat quotient has nonzero reduction modulo `ϖ`.

*Needs:* SchemeAndStackFoundations §§0.16, 0.20–0.21 and 4.2; ClassFieldTheory Layers 5 and 9; LocalGaloisGroups Layers 3 and 7; §0.2; ProfiniteCohomology Layers 0–2.

<a id="support-cycles"></a>

### 0.5 Module cycles, specialization and multiplicity

Reuse Mathlib's `AlgebraicGeometry.AlgebraicCycle` on `Spec A`. The dimension grading of SchemeAndStackFoundations §5.1 is restricted there to schemes locally of finite type over a field; extend the support-by-closure-dimension grading to arbitrary noetherian affine `A`, using `dim(A/𝔭)=d`. Thus `Z_d(A)` is the dimension-supported subgroup of the same native cycle carrier, equivalently the free abelian group on those primes. For a finite A-module `M` of support dimension at most `d`, construct `moduleCycle d M`, written `CycleSupport.moduleCycle M` in the representation adapters, with coefficient `length_(A_𝔭)(M_𝔭)` at each such prime. Prove finite support, effectivity, zero, exact-sequence additivity, closed-immersion compatibility, and dimension-graded flat pullback under an explicit closure-dimension formula on the relevant components. Under localization retain dimensions measured in the original ambient `Spec A`. Prove formal-power-series pullback separately with its dimension shift. Sources: Paškūnas 2015 §2.1, the cycle conventions and formulas preceding Theorem 2.42; Stacks, [§42.10, “Cycle associated to a coherent sheaf”](https://stacks.math.columbia.edu/tag/02QV), and [§43.15, “Algebraic multiplicities”](https://stacks.math.columbia.edu/tag/0AZU). This extends the module-length and complete-local interfaces; it does not construct another algebraic-cycle carrier or a rational-equivalence quotient.

For a noetherian local `A`, finite `M` and ideal `I⊆m_A` such that `M/IM` has finite length, construct the unique shared Hilbert–Samuel polynomial of `length(M/I^(n+1)M)` and its dimension-`d` normalized leading coefficient `CycleSupport.multiplicity I d M` for `dim M≤d`. This is an ideal of definition on the module; it need not be `m_A`-primary in the ring. Prove polynomiality, integrality, positivity in the top nonzero dimension, additivity under a common dimension bound, the associativity formula summing local lengths times the multiplicities of `A/𝔭`, and invariance under formal power-series extension with its dimension shift. For a complete equidimensional noetherian local `O`-flat ring `A` of dimension `d+1` and a finite `O`-flat module `M` with `dim Supp M≤d+1`, construct specialization from the ambient `(d+1)`-cycle to the special-fibre `d`-cycle using the lengths of the special-fibre localizations. Prove agreement with the module cycle of `M/ϖM` under the stated flatness and dimension hypotheses, and compatibility with finite flat coefficient extension. Sources: Paškūnas 2015 §2.1 and Theorems 2.42–2.44; Kisin 2009 §1.1; Stacks, [Proposition 10.59.5](https://stacks.math.columbia.edu/tag/00K8), applied over `A/ann M`, or [Proposition 10.58.7](https://stacks.math.columbia.edu/tag/00K1) on the associated graded module, for polynomiality; [§43.15, Lemmas 43.15.2–43.15.3](https://stacks.math.columbia.edu/tag/0AZU) for multiplicity. The shared affine API is `moduleCycle`, `moduleCycle_specialization` and the intrinsic/ambient multiplicity comparison. The names `CycleSupport.moduleCycle_exact`, `specialize_flat`, `multiplicity_cycle` and `powerSeries_pullback` denote its representation-theoretic specializations, with support bound `dim Supp M≤d` and `O`-flatness carried into every specialization comparison. These are the cycle and multiplicity inputs to §§5.10–5.11 and Layer 6. The statement `exists_hilbertSamuel_polynomial` in `Suggested.lean` gives the unique eventual polynomial of `length(M/I^(n+1)M)` with these module-relative hypotheses, including finiteness of each quotient length. Define the shared polynomial once using this existence-and-uniqueness theorem. Every maximal-ideal or graded-series presentation uses that value, rather than choosing another polynomial and retaining only an equality theorem. Any presentation agreeing with those lengths eventually has the same polynomial, since two rational polynomials agreeing at all sufficiently large integers are equal. In particular, the maximal-ideal polynomial is its `I=m_A` specialization; its ambient multiplicity uses the coefficient at the specified dimension bound, even when the module has smaller support.

**Checks.**

- Over a field, the zero-dimensional cycle of a finite vector space has coefficient its dimension; the zero module has zero cycle and multiplicity. Its unique eventual Hilbert–Samuel polynomial is zero for every allowed ideal, including `I=0`.
- For `A=k[[x,y]]/(xy)`, the one-cycle of A is the sum of its two minimal components with coefficient one. Either component has multiplicity one, so their separate cycles have equal multiplicity but are unequal.
- For a DVR `O` the cycle of `O/ϖⁿ` has coefficient `n` at the closed point. Replacing the local module length by the dimension of its residue tensor would give one for every `n>0` and fails.
- For `A=k[[x,y]]`, `M=A/(y)` and `I=(x)`, `M/IM=k` and `length(M/I^(n+1)M)=n+1`, although `√I=(x)≠m_A`. The module-relative polynomial theorem includes this case.
- For `A=k[[t]]` and `B=A[1/t]=k((t))`, the open immersion is smooth of relative dimension zero, but `dim A=1` and `dim B=0`. Localization retains the coefficient at `(0)` in ambient dimension one; it does not preserve intrinsic grading.
- Adjoining three formal variables shifts a one-cycle to a four-cycle and preserves its Hilbert–Samuel multiplicity, as required by framing.
- For `A=O/ϖ`, generic-fibre specialization is zero while the special fibre is nonzero; dropping `O`-flatness invalidates the comparison.

### Examples

The Tate twist has Hodge–Tate weight `+1` and a filtered-period jump `−1`. The same twist has Frobenius 1 on its étale basis and `p⁻¹` on its semistable period basis. The first-order unramified deformation with Frobenius `1+ε` keeps the nilpotent parameter in its type-ring universal property. A module supported on either branch of `k[[x,y]]/(xy)` has multiplicity one, although the two branch cycles differ.

### Dependencies

The exact supplier contracts above; §0.1 supplies analytic categories, §0.2 supplies field and finite-coefficient period comparisons used by §0.4, §0.3 supplies scalar-linear duality and residual characters, and §0.5 supplies module cycles and multiplicity. The block pseudodeformation completion is constructed in §5.4 from the algebraic determinant supplier; it is independent of the correspondence needed for the later block-centre comparison.

## Layer 1: Local coordinates and the Colmez normalisation

<a id="section-1-1"></a>

### 1.1 The group `GL₂(ℚ_p)` and its standard subgroups

Fix a prime `p`. Put `G = GL₂(ℚ_p), K = GL₂(ℤ_p), Z ≅ ℚ_p^×` the centre of scalar matrices, `B` the upper triangular Borel subgroup, `T ⊂ B` the diagonal torus, `N ⊂ B` the upper unipotent subgroup `{(1 b; 0 1)}`, and `P` the mirabolic subgroup `{(a b; 0 1) : a ∈ ℚ_p^×, b ∈ ℚ_p} ≅ ℚ_p ⋊ ℚ_p^×`. `P(ℤ_p) = {(a b; 0 1) : a ∈ ℤ_p^×, b ∈ ℤ_p}`, and `P⁺` is the submonoid `{(a b; 0 1) : a ∈ ℤ_p ∖ {0}, b ∈ ℤ_p}` of `P`. Write `w = (0 1; 1 0), φ_P = (p 0; 0 1), u = (1 1; 0 1)` and `σ_a = (a 0; 0 1)` for `a ∈ ℤ_p^×`. `KZ` is the stabiliser of the vertex `[ℤ_p²]` of the Bruhat–Tits tree of `PGL₂(ℚ_p)`, whose vertices are `G/KZ`; `I₁ ⊂ K` is the pro-`p` Iwahori subgroup of matrices congruent to `(1 *; 0 1)` mod `p, I` the Iwahori subgroup, and `K₁ = ker(K → GL₂(𝔽_p))`. These subgroups carry the topology induced from the p-adic topology of `M₂(ℚ_p)`; `K, P(ℤ_p), I` and `I₁` are compact open in their ambient groups.

Here `p` is a prime; all matrix groups are realised as units of `2×2` matrix rings over `ℚ_p` and `ℤ_p` (Mathlib's `GL (Fin 2)`).

Use the following named operations and compatibility results.

- `GL2Qp.borel`: `B` as a subgroup of `GL₂(ℚ_p)`: matrices with zero lower-left entry.
- `GL2Qp.mirabolic`: `P` as a subgroup: matrices with lower row `(0, 1)`.
- `GL2Qp.mirabolicPlus`: `P⁺` as a submonoid of `GL₂(ℚ_p)`.
- `GL2Qp.maximalCompact`: `K = GL₂(ℤ_p)` as a subgroup of `GL₂(ℚ_p)`, via the inclusion `ℤ_p ⊂ ℚ_p`.
- `GL2Qp.weylElement`: `w = (0 1; 1 0)` as an element of `GL₂(ℚ_p)`.
- `GL2Qp.weylElement_sq`: `w * w = 1`.
- `GL2Qp.mem_mirabolic_iff`: `g ∈ P` iff `g` 1 `0 = 0` and `g` 1 `1 = 1`.
- `GL2Qp.mirabolicPlus_mul_mem`: `P⁺` is closed under multiplication and contains 1.
- `GL2Qp.closure_mirabolic_center_weyl`: `G` is generated as a group by `P(ℚ_p), Z` and `w`.

Integrality in `P⁺` means `‖g₀₀‖≤1` and `‖g₀₁‖≤1`; invertibility with bottom row `(0,1)` forces `g₀₀≠0`. The continuous characters of §1.2 use the existing continuous monoid-hom carrier over a commutative topological coefficient ring.

**Checks.** An upper unipotent always has mirabolic bottom row; it belongs to `P⁺` exactly when its translation is integral. A diagonal `diag(a,1)` with `a≠0` is mirabolic, and is in `P⁺` exactly when `a` is integral. A scalar matrix has lower-right entry `a`, so it is mirabolic exactly for `a=1`. The Weyl element fails the zero lower-left-entry condition. Translations and diagonal scalings multiply according to `(1 b;0 1)(1 c;0 1)=(1 b+c;0 1)` and `diag(a,1)diag(b,1)=diag(ab,1)`. Nonintegral translations, including translation by `p⁻¹`, lie outside `P⁺`.

**Checks.** The Borel contains the identity and every upper unipotent, rejects `w`, and is closed under multiplication. The mirabolic contains all translations and all `diag(a,1)`, but rejects a scalar matrix with `a≠1`. The positive mirabolic monoid contains `diag(p,1)` and integral translations, and rejects either a nonintegral scaling or a translation by `p⁻¹`. Translation by zero and scaling by one give the identity; the upper-right translation entry is `b`, and the upper-left scaling entry is `a`. A mirabolic diagonal matrix is scalar only for `a=1`. The scalar matrix with parameter 1 is the identity. Scalar matrices multiply by multiplying their parameters, and their intersection with `P` is the identity. Scaling by `p⁻¹` lies outside `P⁺`. The Weyl element exchanges the two coordinate vectors, has determinant `−1`, and squares to 1; the alternative signed Weyl matrix `(0 -1;1 0)` squares to `−1` at odd `p` and fails this convention. At `p=2` the field `ℚ₂` still has characteristic zero, so `−1≠1` even though their residue classes agree.

Each subgroup is cut out of Mathlib's Matrix.GeneralLinearGroup `(Fin 2) ℚ_[p]` by conditions on the entries (zero lower-left entry for `B`, lower row `(0,1)` for `P`, entries in `ℤ_p` with unit determinant for `K`).

`P⁺` is closed under multiplication because the product of `(a b; 0 1)` and `(a' b'; 0 1)` is `(aa' ab'+b; 0 1)`, and `a, a', b, b' ∈ ℤ_p` with `aa' ≠ 0`.

`G = BK` (Iwasawa decomposition) and `G = ⊔ K diag(p^a, p^b) K` with `a ≥ b` (Cartan) are supplied by the ReductiveGroupsPartII RG2.4 decomposition contract in the boundaries.

Colmez's convention identifies an étale `(φ,Γ)`-module with a `P⁺`-module: `u` acts as multiplication by `1+T, φ_P` as `φ` and `σ_a` as the element of `Γ` with `χ(σ_a) = a` (Colmez, Introduction §4, Remark 0.4(iv)).

**Checks.**

- `GL2Qp.weylElement_not_mem_borel`: `w ∉ B`.
- `GL2Qp.phi_mem_mirabolicPlus`: `(p 0; 0 1) ∈ P⁺` and its inverse `(p⁻¹ 0; 0 1) ∉ P⁺`.
- `GL2Qp.mirabolic_inf_center`: `P ∩ Z = {1}`: a scalar matrix with lower-right entry 1 is the identity.
- `GL2Qp.unipotent_mem_mirabolicPlus`: `(1 1; 0 1) ∈ P⁺` and `(1 p⁻¹; 0 1) ∉ P⁺`.
- The identity and `w` belong to `K`. The matrix `diag(p,1)` has integral entries but does not belong to `K`, since its determinant is not a unit of `ℤ_p`; the matrix `(1 p⁻¹;0 1)` fails integrality. Thus entrywise integrality alone does not define `K`.
- `w² = 1, w ∉ B`, and wBw `∩ B = T`.
- `P⁺` is a submonoid of `P` containing `P(ℤ_p)` and `φ_P`, and `P(ℚ_p)` is generated by `P⁺` and `φ_P⁻¹`.
- `G = P·Z·K·{1, w}` is not used; instead `G` is generated by `P(ℚ_p), Z` and `w` (Colmez, Introduction §4(iv): adding an action of `w` suffices to define an action of `G`).

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §4–§5, pp. 8–10 (Remark 0.4(iv)); §III.1.1–III.1.2, pp. 70–72; [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §1, pp. 2–7 (group notation).

*Needs:* `Matrix.GeneralLinearGroup`; `Subgroup`; `Submonoid`; `PadicInt`; ReductiveGroupsPartII §RG2.4.

<a id="section-1-2"></a>

### 1.2 Characters of `ℚ_p^×` as Galois characters (Colmez's normalisation)

For a commutative topological ring `Λ` let `T̂(Λ)` be the group of continuous characters `δ` : `ℚ_p^× → Λ^×`. Through local class field theory normalised so that `p` corresponds to a geometric Frobenius, `W_{ℚ_p}^{ab} ≅ ℚ_p^×`, and a character `δ ∈ T̂(Λ)` is viewed as the character of the Weil group `W_{ℚ_p}` given by `δ(g) = δ(p)^{−deg g} · δ(χ(g))`, where deg `g ∈ ℤ` is defined by `g(x) = x^{p^{deg g}}` on `𝔽̄_p` and `χ` is the cyclotomic character. When `n ↦ δ(p^n)` extends continuously to `ℤ̂` (in particular when `Λ = k_L`, or `Λ = L` and `δ` is unitary, i.e. `v_p(δ(p)) = 0`), `δ` extends to a continuous character of `G_{ℚ_p}`. Under this dictionary the character `x ↦ x|x|` corresponds to `χ`, its reduction `ω` mod `p` to the mod `p` cyclotomic character, and the unramified character `μ_λ` (`μ_λ(p) = λ`, trivial on `ℤ_p^×`) to the unramified character sending a geometric Frobenius to `λ`. For `δ ∈ T̂(L)` its weight is `w(δ) = log δ(u)/log u` for any `u ∈ ℤ_p^×` not a root of unity; for unitary `δ` it is the generalised Hodge–Tate weight of `δ (w(x|x|) = 1)`.

Here `L` is a finite extension of `ℚ_p` with ring of integers `O_L = O`, uniformiser `ϖ` and residue field `k_L = k`. The normalisation (uniformisers `↦` geometric Frobenii) is the one of Colmez, Paškūnas and Colmez–Dospinescu–Paškūnas. SmoothRepresentationsOfLocalGroups SR.5.2 instead uses arithmetic reciprocity; §1.7 transports its correspondence by parameter duality. The arithmetic character formula of §0.2 uses `Art^arith=(Art^geo)⁻¹`.

Use the following named operations and compatibility results.

- `PadicChar` (with commutative topological coefficient ring): `T̂(Λ)` as the group of continuous homomorphisms `ℚ_p^× → Λ^×` (Mathlib ContinuousMonoidHom).
- `PadicChar.normChar`: The unitary character `x ↦ x|x|` of `ℚ_p^×` with values in `ℤ_p^×` (it is `p ↦ 1, u ↦ u` on `ℤ_p^×`).
- `PadicChar.unramified`: `μ_λ` for `λ ∈ Λ^×`: `p ↦ λ`, trivial on `ℤ_p^×`.
- `PadicChar.weight`: `w(δ) ∈ L`, the derivative of `δ` at 1 in the logarithmic coordinate.
- `PadicChar.toGalois`: For unitary `δ` (or `Λ = k_L`) the continuous character of `G_{ℚ_p}` attached by the geometric-Frobenius reciprocity map.
- `PadicChar.toGalois_normChar`: `toGalois(x|x|) = χ` (Mathlib cyclotomicCharacter at `ℚ̄_p`).
- `PadicChar.toGalois_mul`: `toGalois(δ₁δ₂) = toGalois(δ₁)·toGalois(δ₂)`.
- `PadicChar.toGalois_unramified`: `toGalois(μ_λ)` is unramified and sends a geometric Frobenius to `λ`.
- `PadicChar.arith_dictionary`: `toGalois(δ)∘Art^arith = δ⁻¹` on all of `ℚ_p^×`; in particular its arithmetic-Frobenius value is `δ(p)⁻¹` for unramified `δ`.

Local class field theory for `ℚ_p`: invert ClassFieldTheory's arithmetic Artin map to obtain `ℚ_p^× ≅ W_{ℚ_p}^{ab}` with `p ↦` geometric Frobenius (trivial on `μ_{p^∞}`) and `u ∈ ℤ_p^× ↦` the element acting on `μ_{p^∞}` by `u`. Its inverse is `g ↦ p^{−deg g} χ(g)`.

Compute `x|x|` on `p^{−deg g}χ(g)`: `|p^{−deg g}χ(g)| = p^{deg g}`, so `(x|x|)(p^{−deg g}χ(g)) = χ(g)`; hence `x|x| ↔ χ`, and reducing mod `ϖ` gives `ω`.

`δ` extends from `W_{ℚ_p} = ℤ`-extension to `G_{ℚ_p} = ℤ̂`-extension exactly when `n ↦ δ(p)^n` extends continuously to `ℤ̂`, which holds when `δ(p)` is a unit of a profinite or p-adically complete-with-unit-group-containing-it ring `(k_L^×, O_L^×)`.

The weight is well defined because `δ` restricted to a small open subgroup `1 + p^nℤ_p` is `u ↦ exp(w(δ) log u)` (Colmez, Représentations triangulines, §0.1).

**Checks.**

- Over `M₂(𝔽₃)`, take unramified characters sending `p` to `A=(1 1;0 1)` and `B=(1 0;1 1)`. Their pointwise product is not a character: `(AB)²=2I`, whereas `A²B²=(2 2;2 1)`. Commutative coefficients are essential for the character-group law.
- `PadicChar.normChar_apply_p`: `(x|x|)(p) = 1` and `(x|x|)(u) = u` for `u ∈ ℤ_p^×`.
- `PadicChar.weight_normChar`: `w(x|x|) = 1` and `w(μ_λ) = 0`.
- `PadicChar.toGalois_trivial`: The trivial character corresponds to the trivial Galois character.
- `PadicChar.not_extends_id`: The character `x ↦ x (δ(p) = p)` is not unitary and does not extend to a continuous character of `G_{ℚ_p}` with values in `L^×`.
- `x|x| ↦ χ` and `ω ↦` the mod `p` cyclotomic character; the unramified `μ_λ ↦` the unramified character with geometric Frobenius `↦ λ`.
- For two characters, `δ₁δ₂ ↦ (δ₁)(δ₂)`: the dictionary is a group isomorphism onto the continuous characters of `W_{ℚ_p}`.
- The character `x ↦ x` of `ℚ_p^×` (weight 1, `δ(p) = p`) does not extend to `G_{ℚ_p}`, since `n ↦ p^n` has no continuous extension to `ℤ̂`.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §1, pp. 5–6; [Pierre Colmez, COLMEZ08TRI](#ref-colmez08tri), §0.1, pp. 2–3; [Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas, CDP14](#ref-cdp14), §1.1, p. 2 and footnote 2.

*Needs:* `cyclotomicCharacter`; `Field.absoluteGaloisGroup`; `ContinuousMonoidHom`; SmoothRepresentationsOfLocalGroups §SR.5.2 (“Classical parameters and the generic convention”); [§0.2](#support-hodge).

<a id="section-1-3"></a>

### 1.3 The Tate dual of an étale `(φ,Γ)`-module and the rank-two twist

For `D ∈ ΦΓ^et(O_E)` (resp. `ΦΓ^et(E), ΦΓ^et_tors`) the Tate dual is `Ď = Hom_{O_E}`(`D, O_E` dT/`(1+T)`) (resp. with `E` dT/`(1+T), (E/O_E)` dT/`(1+T)`) with the induced `φ` and `Γ`, where dT/`(1+T)` carries `φ`(dT/`(1+T)`) `=` dT/`(1+T)` and `σ_a`(dT/`(1+T)`) `= a` dT/`(1+T)`; the residue of the pairing gives a perfect pairing `{ , }` : `Ď × D → C`, with `C = O_L, L`, or `L/O_L` in the integral, rational, or torsion category respectively, and `V(Ď) = V̌`. If `D` is free of rank 2 over `O_E` or `E`, then `∧²D = R_base ⊗ α_D`, with `R_base = O_E` or `E` respectively, for the character `α_D ∈ T̂(O_L)` attached to `det V(D)` by [§1.2](#section-1-2), and `δ_D := (x|x|)^{−1}α_D`. The wedge map `v↦(w↦v∧w)` gives `D ≅ Hom(D,∧²D) ≅ Ď⊗δ_D`; tensoring by the inverse twisting line gives `Ď ≅ D⊗δ_D^{−1}`.

Here `D` belongs to the integral, rational, or torsion étale category with the indicated coefficient-valued dual; the rank-two determinant identity assumes `D` free of rank 2 over `O_E` or `E`.

Use the following named operations and compatibility results.

- `PhiGammaModuleEt.tateDual`: `Ď` with its `φ` and `Γ`.
- `PhiGammaModuleEt.residuePairing`: The continuous perfect residue pairing into `O_L` (integral), `L` (rational), or `L/O_L` (torsion), with the corresponding dual topology.
- `PhiGammaModuleEt.tateDual_tateDual`: The canonical map `D → (Ď)`ˇ is an isomorphism.
- `PhiGammaModuleEt.toRep_tateDual'`: Fontaine transports the Tate dual to `Hom(V,C(χ))`, where `C` is `O_L, L`, or `L/O_L` according to the category.
- `PhiGammaModuleEt.deltaChar`: `δ_D = (x|x|)^{−1}α_D` for `D` of rank 2.
- `PhiGammaModuleEt.tateDual_rank_two`: For rank 2, `Ď ≅ D ⊗ δ_D^{−1}` through the wedge pairing.

The residue map `res₀` : `O_E` dT `→ O_L` gives the pairing `{x, y} = res₀(⟨σ_{−1}x, y⟩)` used by Colmez; perfectness follows from the perfectness of the residue pairing on `O_E`.

For rank 2 the wedge pairing `D × D → ∧²D = R_base ⊗ α_D` is perfect and identifies `D` with `Hom(D, ∧²D)`. Tensoring by `(det D)⁻¹⊗χ` gives `Hom(D, R_base⊗χ)=Ď ≅ D⊗δ_D⁻¹`. The character of dT/`(1+T)` is `x|x|`, corresponding to `χ`.

`V(Ď) = V̌` follows from Fontaine's equivalence applied to the pairing ([the Fontaine contract](#fontaine-contract)).

**Checks.**

- `PhiGammaModuleEt.tateDual_trivial`: The Tate dual of `O_E` is `O_E ⊗ (x|x|)` (Galois side: `O_L(χ)`).
- `PhiGammaModuleEt.deltaChar_of_det_cyclotomic`: If `det V(D) = χ` then `δ_D` is trivial.
- `PhiGammaModuleEt.tateDual_zero`: The Tate dual of the zero module is zero.
- `PhiGammaModuleEt.tateDual_ne_linearDual`: `Ď` is not the `O_E`-linear dual `Hom(D, O_E)`: for `D = O_E` the linear dual is `O_E` (trivial Galois character), whereas `Ď` corresponds to `χ`.
- For `D = O_E` (trivial), `Ď = O_E ⊗ (x|x|)`, i.e. `V(Ď) = O_L(χ)`.
- For `D` of rank 2 with `det V(D) = χ (α_D = x|x|), δ_D = 1` and `Ď ≅ D`.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), §I.2.2–I.2.3, pp. 31–32; Introduction §9, p. 15.

*Needs:* [the Fontaine contract](#fontaine-contract); [§1.2](#section-1-2); PhiGammaModulesAndIwasawaCohomology §1.0.

<a id="section-1-4"></a>

### 1.4 The operator `ψ` and the lattices `D⁺, D^♮` and `D^♯`

Let `D` be an étale `(φ,Γ)`-module over `O_E` (torsion or free), and put `H'=Gal(ℚ̄_p/ℚ_p^ab)`, the kernel of the maximal abelian quotient of `G_(ℚ_p)`. Every `x ∈ D` is uniquely `Σ_{i=0}^{p−1} (1+T)^i φ(x_i)`, and `ψ(x) := x₀` is the left inverse of `φ` commuting with `Γ` (PhiGammaModulesAndIwasawaCohomology §§2.2–2.5). Define `D⁺ = {z : (φ^n(z))_n bounded}, D⁺⁺ = {z : φ^n(z) → 0}, D^{nr} = ∩_n φ^n(D), D^♮ =` the smallest compact `O_E⁺`-submodule of `D` that is stable under `ψ` and generates `D`, and `D^♯ =` the largest compact `O_E⁺`-submodule of `D` stable under `ψ` on which `ψ` is surjective; for `D ∈ ΦΓ^et(E)` these are `L·Δ^♮, L·Δ^♯` etc. for a `φ`- and `Γ`-stable `O_E`-lattice `Δ`. Then `D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯, D⁺ = D^{nr} ⊕ D⁺⁺`, a surjection `D → D₁` of étale modules induces surjections `D^♮ → D₁^♮` and `D^♯ → D₁^♯, D^{nr} = 0` when `V(D)^{H'} = 0` (in particular, for rational `D` absolutely irreducible of rank `≥ 2`), and for `D` torsion, in the residue pairing `Ď × D → L/O_L` the orthogonal of `D^♮` is `Ď⁺` and that of `D^♯` is `Ď⁺⁺`, so `D^♯/D^♮` is dual to `Ď^{nr}`.

Here `D` étale over `O_E`; the existence of `D^♮` and `D^♯` is Colmez's (from his Iwasawa-theory paper [35]).

Use the following named operations and compatibility results.

- `PhiGammaModuleEt.psi`: `ψ` : `D → D`, imported from PhiGammaModulesAndIwasawaCohomology §§2.2–2.5.
- `PhiGammaModuleEt.plusPart`: `D⁺ = {z : (φ^n z) bounded}`.
- `PhiGammaModuleEt.natural`: `D^♮`, the smallest compact `ψ`-stable `O_E⁺`-submodule generating `D`.
- `PhiGammaModuleEt.sharp`: `D^♯`, the largest compact `ψ`-stable `O_E⁺`-submodule on which `ψ` is onto.
- `PhiGammaModuleEt.plus_le_natural_le_sharp`: `D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯`.
- `PhiGammaModuleEt.natural_map_surjective`: A surjection `f` : `D → D₁` restricts to surjections `D^♮ → D₁^♮` and `D^♯ → D₁^♯`.
- `PhiGammaModuleEt.psi_surjective_sharp`: `ψ(D^♯) = D^♯`.
- `PhiGammaModuleEt.orthogonal_natural`: For `D` torsion, `(D^♮)^⊥ = Ď⁺` and `(D^♯)^⊥ = Ď⁺⁺` in the residue pairing.

`ψ` is imported from PhiGammaModulesAndIwasawaCohomology §§2.2–2.5/linearized-psi with its uniqueness and `Γ`-compatibility.

Existence of `D^♮, D^♯` and the inclusions `D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯` are recalled in Colmez §I.3.2 from his earlier paper ([35, II.4–II.5]); construct these lattices using that proof route.

Surjectivity under quotients (Proposition I.3.2), the description of `D^{nr}` (Proposition I.3.3) and the duality (Proposition I.3.4) follow from the finite-length theory for torsion modules and passage to the limit.

**Checks.**

- `PhiGammaModuleEt.natural_trivial`: For `D = E`: `D^♮ = E⁺ = L ⊗ O_L[[T]]` and `D^♯ = T^{−1}E⁺`.
- `PhiGammaModuleEt.nr_trivial`: For `D = E`: `D^{nr} = L` and `D⁺⁺ = T E⁺`.
- For `p=3, L=ℚ₃`, take `D=E_L²`, `φ_D=Aφ_E` with `A=(0 −1;1 0)`, and `Γ` acting only on coefficients. The lattice with matrix `A∈GL₂(ℤ₃)` is étale, and the associated unramified representation is irreducible over `L` because `X²+1` is irreducible there. Every constant `v` satisfies `v=φ_Dⁿ(A⁻ⁿv)`, so `L²⊆D^{nr}`. Here `H'` acts trivially; over `ℚ₃(i)` the representation splits into characters, so ordinary irreducibility cannot replace absolute irreducibility.
- If rational `D` is absolutely irreducible of rank at least two, normality of `H'` makes `V(D)^{H'}` either zero or all of `V(D)`. The latter would give an absolutely irreducible representation of an abelian group of dimension at least two, which is impossible; hence `D^{nr}=0`.
- `PhiGammaModuleEt.natural_zero`: For `D = 0` all four lattices are 0.
- `PhiGammaModuleEt.natural_ne_sharp_trivial`: `D^♮ ≠ D^♯` for `D = E (T^{−1} ∈ D^♯ ∖ D^♮)`, so the two treillis are different objects.
- Example: for `D = E` (trivial), `D⁺ = D^♮ = E⁺, D⁺⁺ = T E⁺, D^{nr} = L` and `D^♯ = T^{−1}E⁺` (Colmez p. 33).
- `D ↦ D^♮` and `D ↦ D^♯` are not exact (Colmez §VII.4.7 shows `D ↦ D^♮ ⊠ P¹` is not exact).

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), §I.3.2, pp. 33–35: the definitions, Example, Propositions I.3.2–I.3.4; Introduction §1, p.5, for `H'`, and §6, p.11. Proposition I.3.3 supplies the invariant-vanishing criterion; absolute irreducibility gives the example over a finite coefficient field.

*Needs:* [the Fontaine contract](#fontaine-contract); [§1.3](#section-1-3); PhiGammaModulesAndIwasawaCohomology §§2.2–2.3; PhiGammaModulesAndIwasawaCohomology §2.2; PhiGammaModulesAndIwasawaCohomology §2.4.

<a id="section-1-5"></a>

### 1.5 `(P(ℤ_p),ψ)`-modules and the `P(ℚ_p)`-module `M ⊠ ℚ_p`

A `(P(ℤ_p),ψ)`-module is a topological `O_L`-module `M` with continuous `P(ℤ_p)`-action and a continuous surjective `O_L`-linear `ψ` commuting with diagonal units and satisfying `ψ(u(pb)z)=u(b)ψ(z)`. Its module `M ⊠ ℚ_p` consists of sequences `x_n` with `ψ(x_{n+1})=x_n`. Diagonal units act coordinatewise; `diag(p^k,1)` gives `y_n=x_{n+k}` for `n≥max(0,−k)`, and `u(b)` gives `y_n=u(p^n b)x_n` once `p^n b∈ℤ_p`; earlier coordinates are recovered using `ψ`. These determine the continuous mirabolic action. For `O_L`-valued measures on `ℤ_p` this inverse limit identifies with measures on `ℚ_p` and the affine action `x↦ax+b`. Compact-open restriction operators require in addition a compatible `φ` splitting `ψ`, as for an étale `(φ,Γ)`-module: `Res_{a+p^nℤ_p}=u(a)φ^nψ^n u(−a)`, and `D ⊠ ℤ_p^×=ker ψ`. A central character `δ` extends this to the `B`-action.

Here `M a (P(ℤ_p),ψ)`-module; `δ ∈ T̂(O_L)` for `D ⊠_δ ℚ_p`.

Use the following named operations and compatibility results.

- `PsiModule`: Topological `O_L`-modules with continuous `P(ℤ_p)`-action and continuous surjective `ψ` satisfying the covariance identities.
- `PsiModule.boxtimesQp`: `M ⊠ ℚ_p` as `ψ`-compatible sequences.
- `PsiModule.boxtimesQp_action`: The unique `P(ℚ_p)`-action given by the three formulas.
- `PsiModule.res`: For the additional compatible `φ` structure, the compact-open restriction idempotents, satisfying `Res_U Res_V=Res_{U∩V}` and additivity for disjoint compact opens.
- `PsiModule.res_Zp`: For an étale module `D, Res_{ℤ_p}` identifies `D ⊠ ℤ_p` with `D`; for `k≥0` the zeroth coordinate after `diag(p^k,1)` is `x_k`.
- `PsiModule.boxtimesQp_measures`: For `M = D⁰(ℤ_p, O_L), M ⊠ ℚ_p ≅ D⁰(ℚ_p, O_L) P(ℚ_p)`-equivariantly.
- `PsiModule.boxtimesZpUnits`: `D ⊠ ℤ_p^× = D^{ψ=0}`.

Uniqueness: the three formulas determine the action on the generators of `P(ℚ_p)` ([§1.1](#section-1-1)); existence is checked on relations, using that `ψ` commutes with `(ℤ_p^× 0; 0 1)` and the twisted commutation with unipotents (Colmez Proposition 0.5).

For measures, `(x^{(n)}) ↦` the measure on `ℚ_p` whose restriction to `p^{−n}ℤ_p` is `x^{(n)}` rescaled identifies the inverse limit with `D⁰(ℚ_p, O_L)`.

`D ⊠ ℤ_p^× = D^{ψ=0}` follows from the decomposition `D = φ(D) ⊕ D^{ψ=0}` (PhiGammaModulesAndIwasawaCohomology §2.4).

Use the `O_L` coefficient extension, convolution, affine-action and restriction comparisons of PadicMeasuresIwasawaAlgebras §§1.6–1.7 and 2.2; the integral starting carrier is Mathlib’s Amice equivalence. Section 0.3 supplies the separate scalar-linear duality comparison.

**Checks.**

- `PsiModule.boxtimesQp_measures_dirac`: Under `M ⊠ ℚ_p ≅ D⁰(ℚ_p), (a b; 0 1)` sends the Dirac mass at `x` to the Dirac mass at `ax + b`.
- `PsiModule.boxtimesQp_zero`: 0 `⊠ ℚ_p = 0`.
- `PsiModule.phi_shift`: `(p 0; 0 1)` acts on `M ⊠ ℚ_p` by the shift `(x^{(n)}) ↦ (x^{(n+1)})`, and `(p^{−1} 0; 0 1)` by `(x^{(n)}) ↦ (y^{(n)})` with `y^{(n)} = x^{(n−1)}` for `n ≥ 1` and `y^{(0)} = ψ(x^{(0)})`.
- `PsiModule.boxtimesQp_ne_M`: `M ⊠ ℚ_p` is not `M`: for `M = D⁰(ℤ_p)` it contains measures supported on `p^{−1}ℤ_p ∖ ℤ_p`.
- For `D⁰(ℤ_p, O_L)`: `M ⊠ ℚ_p = D⁰(ℚ_p, O_L)` with the affine action.
- `Res_{ℤ_p}∘(p^k 0; 0 1)` recovers `x^{(k)}`.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §5, Proposition 0.5, pp. 9–10; §I.3.3–I.3.4, pp. 35–40.

*Needs:* [§1.1](#section-1-1); [§1.4](#section-1-4); PhiGammaModulesAndIwasawaCohomology §2.4; `AbstractMeasure`.

<a id="section-1-6"></a>

### 1.6 Trianguline representations of dimension 2 and Colmez's parameter space

Specialise PhiGammaModulesAndIwasawaCohomology §7.5's saturated triangulation to rank two: a two-dimensional `L`-representation `V` of `G_{ℚ_p}` is trianguline if `D_rig(V)` is an extension `0 → R(δ₁) → D_rig(V) → R(δ₂) → 0` ([the rank-one contract](#rank-one-contract)). Colmez's space `S` parametrises `s = (δ₁, δ₂, ℒ)` with `ℒ ∈ ℙ(Ext¹(R(δ₂), R(δ₁)))` (a point except on the loci `δ₁δ₂^{−1} = x^i|x| (i ≥ 1)` or `x^{−i} (i ≥ 0)`, where it is `ℙ¹(L)`); `S₊` is cut out by `v_p(δ₁(p)) + v_p(δ₂(p)) = 0` and `v_p(δ₁(p)) ≥ 0`, with `u(s) = v_p(δ₁(p)), w(s) = w(δ₁) − w(δ₂)`, and `S₊ = S^{ng} ⊔ S^{cris} ⊔ S^{st} ⊔ S^{ord} ⊔ S^{ncl}, S_irr = S^{ng}_* ⊔ S^{cris}_* ⊔ S^{st}_* (∗: u(s) > 0)`. For `s ∈ S_* ∖ S^{ncl}_*, D(s)` is étale and `V(s) := V(D(s))` is trianguline; `V(s)` is irreducible iff `s ∈ S_irr`; `det V(s) = δ₁δ₂` and its generalized Hodge–Tate weights are `w(δ₁), w(δ₂)`; every irreducible trianguline `V` is some `V(s)`, and `V(s) ≅ V(s')` for `s ≠ s'` in `S_irr` iff `s, s' ∈ S^{cris}_*` and `s' = (x^{w(s)}δ₂, x^{−w(s)}δ₁, ∞)`. A two-dimensional crystalline `V` is trianguline iff the `φ`-eigenvalues on `D_cris(V)` lie in `L`; every two-dimensional semistable `V` is trianguline. The crystalline assertion is made after extending `L` to contain the Frobenius eigenvalues; the parameter classification cited here assumes `p≠2`; the dyadic analogue is an additional target.

Here `p ≠ 2` in Colmez, Représentations triangulines, §0.1, footnote 1; the `p = 2` parameter classification is a separate supporting target, not established by the cited odd-prime source. `V` two-dimensional over `L` with `L` large enough to contain the needed eigenvalues.

Use the following named operations and compatibility results.

- `Trianguline.IsTrianguline`: `V` is trianguline iff `D_rig(V)` has a rank-one `(φ,Γ)`-stable saturated `R`-submodule.
- `Trianguline.param`: The triple `s = (δ₁, δ₂, ℒ)` of a non-split trianguline `D`.
- `Trianguline.rep`: `V(s)` for `s ∈ S_* ∖ S^{ncl}_*`.
- `Trianguline.det_rep`: `det V(s) = δ₁δ₂`.
- `Trianguline.hodgeTate_rep`: The generalized Hodge–Tate weights of `V(s)` are `w(δ₁)` and `w(δ₂)`.
- `Trianguline.irreducible_iff`: `V(s)` is irreducible iff `s ∈ S_irr`.
- `Trianguline.crystalline_iff`: A two-dimensional crystalline `V` is trianguline iff the `φ`-eigenvalues on `D_cris(V)` are in `L`.

The parameter space and its stratification are defined from the rank-one classification and the `Ext¹` computation ([the rank-one contract](#rank-one-contract)).

Slope 0 of `D(s)` for `s ∈ S_* ∖ S^{ncl}_*` and irreducibility for `s ∈ S_irr`: Colmez's Théorème 0.5, via Kedlaya's slope filtration.

generalized Hodge–Tate weights and determinant: Colmez's Propositions 4.4–4.5, via Sen theory on `D_dif` (§0.2’s differential-period comparison).

Crystalline and semistable criteria: Théorème 0.8 and Remarque 0.9, using Berger's dictionary `D_cris, D_st` from `D_rig` (§0.2’s Robba/period comparison).

**Checks.**

- `Trianguline.semistable_isTrianguline`: Every two-dimensional semistable `V` is trianguline.
- `Trianguline.split_sum`: For unitary `δ₁, δ₂`, the split module `R(δ₁) ⊕ R(δ₂)` corresponds to `δ₁ ⊕ δ₂`, which is trianguline and not in the image of `S_irr`.
- `Trianguline.rep_cris_coincidence`: For `s = (δ₁, δ₂, ∞) ∈ S^{cris}_*, V(s) ≅ V(x^{w(s)}δ₂, x^{−w(s)}δ₁, ∞)`.
- `Trianguline.not_supercuspidal`: A de Rham `V` with irreducible Weil–Deligne representation (supercuspidal type) is not trianguline.
- An absolutely irreducible crystalline `V` with Frobenius eigenvalues in `L` is `V(s)` for `s ∈ S^{cris}_*`.
- A `V` whose Weil–Deligne representation is irreducible (supercuspidal type) is not trianguline.

The source is [Pierre Colmez, COLMEZ08TRI](#ref-colmez08tri), §0.2–0.4, pp. 2–5: the space `S_irr`, Théorème 0.5, Remarque 0.7, Théorème 0.8, Remarque 0.9; [Pierre Colmez, COLMEZ08TRI](#ref-colmez08tri), Propositions 4.4, 4.5 and 4.8, pp. 23–24.

*Needs:* [the rank-one contract](#rank-one-contract); [§0.2](#support-hodge).

<a id="section-1-7"></a>

### 1.7 Colmez's classical correspondence `LL(M)` against SR.5.2

Construct **`ClassicalLL.geometricTransport`** on the shared Frobenius-semisimple raw Weil–Deligne parameters in arbitrary rank over a nonarchimedean local field `F` with residue cardinality `q`. Write `LL_arith` for the supplier's unitary parameter-to-representation map and `rec_arith` for its inverse. Define `rec_geo(π)=rec_arith(π)∨` and `LL_geo(M)=LL_arith(M∨)`. Parameter duality is `(r,N)∨=(r∨,−Nᵗ)` on the same Weil group, with arithmetic degree unchanged; it preserves the relation `r(w)Nr(w)⁻¹=q^(deg w)N`. It is not precomposition by inversion on the nonabelian Weil group. Prove the inverse identities, coefficient descent/extension, `rec_geo(π∨)=rec_geo(π)∨`, preservation of Frobenius semisimplification and nonzero monodromy, and `rec_geo(π⊗(η∘det))=rec_geo(π)⊗η_geo`. Here `η_geo=η∘(Art^geo)⁻¹=η_arith⁻¹` for a smooth character `η`. The raw duality and the classical contragredient comparison give this transport. Sources: SmoothRepresentationsOfLocalGroups SR.5.2, “Operations on raw parameters” and “Classical parameters and the generic convention”; ClassFieldTheory Layer 9; Colmez §VI.6.11, p.192, for the geometric character convention over `ℚ_p`.

**Checks.**

- For any unramified `μ_α`, its geometric Weil character has arithmetic-Frobenius value `α⁻¹`. The supplier sends that parameter to `μ_(α⁻¹)`, whereas `LL_geo` sends it to `μ_α`. At `p=5, α=2`, these uniformizer values are `1/2` and `2`.
- For `ν=|·|`, `ν_geo(w)=p^(deg w)` and `ν_arith(w)=p^(−deg w)`. Thus `rec_geo(π⊗|det|^s)=rec_geo(π)⊗ν_geo^s`, whenever the chosen coefficient field contains the required norm power. A fixed norm twist alone does not invert arbitrary `μ_α`.
- Duality sends `N` to `−Nᵗ`, so a nonzero Steinberg monodromy remains nonzero; applying transport twice recovers `(r,N)` up to the canonical bidual identification. A raw unipotent Frobenius self-extension becomes split only on Frobenius semisimplification.

Let `M` be a two-dimensional raw Weil–Deligne parameter over `L`, not a character twist of the trivial two-dimensional parameter, with characters read through [§1.2](#section-1-2). Colmez's `LL(M)` is: `Ind_B^G(δ₁⊗δ₂ν⁻¹)` for `M=δ₁⊕δ₂` with `δ₁/δ₂∉{1,ν,ν⁻¹}`; the full reducible `Ind_B^G(δν⊗δν⁻¹)` for `M=δ⊕δν, N=0`; `St⊗(δ∘det)` for that Weil representation with `N≠0`; `Ind_B^G(δ⊗δν⁻¹)` for a nonsplit Weil self-extension of `δ`; and `LL_geo(M⊗ν_geo^(-1/2))` for irreducible `M`. The full reducible principal series is an extension of `δ∘det` by `St⊗(δ∘det)`. For Hodge–Tate weights `a<b` and filtration jumps `−b<−a`, put `LL(M,Fil)=LL(M)⊗W_{a,b−a}`.

Prove the bridge: outside `M=δ⊕δν, N=0`, `LL(M)` is the irreducible `π` with `rec_geo(π)⊗ν_geo^(1/2)≅M^(F-ss)`. Put `rec_geoᵀ(π)=rec_geo(π)⊗ν_geo^(-1/2)`; equivalently `M^(F-ss)≅rec_geoᵀ(π)⊗ν_geo`. These half-norm formulas are stated over a coefficient extension containing the chosen square root and descend by the supplier's coefficient comparison. In rank two the determinant identity is `det M=(ω_π)_geo·ν_geo`. In the exceptional `N=0` case, `LL_geo(M⊗ν_geo^(-1/2))` is the one-dimensional Langlands quotient, while Colmez retains the full principal series. The monodromy is retained in every case; only this bridge replaces raw Frobenius by its semisimplification.

With normalized induction `i_B^G(a,b)=Ind_B^G(aν^(1/2)⊗bν^(-1/2))`, Colmez's generic principal series is `i_B^G(δ₁ν^(-1/2),δ₂ν^(-1/2))`. Its transported unitary parameter is `(δ₁⊕δ₂)⊗ν_geo^(-1/2)`. The same transport gives the Steinberg parameter and the supercuspidal formula above. Colmez's covariant functor and the Kisin–Emerton functor satisfy `V(π)=MF(π)(ε)`: the additional Tate dual changes the Pontryagin dual by `χ`.

**Checks.**

- For unramified `M=μ_α⊕μ_β` with `α/β∉{1,p,p⁻¹}`, the smooth factor is `Ind_B^G(μ_α⊗μ_βν⁻¹)`, its central character is `μ_(αβ)ν⁻¹`, and `rec_geo` gives `M⊗ν_geo^(-1/2)`. The arithmetic parameter is its dual.
- For `M=δ⊕δν, N≠0`, `rec_geo(St⊗(δ∘det))` has Weil part `δν^(1/2)⊕δν^(-1/2)` in the geometric dictionary and nonzero monodromy. Twisting by `ν_geo^(1/2)` recovers `M`; taking `N=0` instead changes the classical quotient.
- `LL(M⊗η_geo)=LL(M)⊗(η∘det)` and `ω_(LL(M))=(det M)_geo·ν⁻¹`, where `(det M)_geo` denotes its character on `ℚ_p×` by geometric reciprocity.
- A nonsplit Weil self-extension of `δ` has the same transported classical parameter as `(δ⊕δ)⊗ν_geo^(-1/2)`. Its unipotent Frobenius data are not recovered by the classical correspondence.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), §VI.6.11, p.192; Introduction §11, p.17; [Matthew Emerton, EMERTON-LG](#ref-emerton-lg), Notation and conventions, pp.11–13, and §3.2, p.19 and footnote 6.

*Needs:* [§1.2](#section-1-2); SmoothRepresentationsOfLocalGroups SR.5.2 (“Operations on raw parameters”, “Frobenius semisimplification” and “Classical parameters and the generic convention”); [§0.2](#support-hodge).

### Examples

For the unit character, `R(1)` has both actions on its basis trivial. For `ε=x|x|, φ` fixes the basis while `Γ` acts cyclotomically; for `x, φ` multiplies it by `p` and the slope is 1. The latter is a non-étale control even though the `Γ`-action agrees. In the mirabolic monoid, `diag(p,1)` is integral but its inverse is not; a scalar lying in `P` has lower-right entry 1 and is therefore the identity.

### Dependencies

Mathlib matrix groups and continuous characters; Tau Ceti ClassFieldTheory Layers 7–9; the Fontaine and rank-one contracts; ReductiveGroupsPartII RG2.4 and SmoothRepresentationsOfLocalGroups SR.5.2.

## Layer 2: Torsion, compact and unitary representations

<a id="section-2-1"></a>

### 2.1 Smooth, locally finite and locally admissible torsion representations of `GL₂(ℚ_p)`

Let `G=GL₂(ℚ_p), O=O_L` and `ζ:Z→O^×` be continuous. `Mod^{sm}_{G,ζ}(O)` consists of discrete `O`-torsion modules with `O`-linear `G`-action, open vector stabilisers and central character `ζ`. An object is admissible when `π^H[ϖ^n]` is finite over `O` for each compact open `H` and each `n≥1`, locally admissible when every cyclic `O[G]`-submodule is admissible, and locally finite when every cyclic `O[G]`-submodule has finite `O[G]`-length. `Rep^{tors}G` and `Rep^{ℓf}G` denote finite-length smooth objects with the indicated coefficient and central-character conventions; they do not denote all locally finite objects. These are specialisations of the existing general smooth category. The `GL₂(ℚ_p)` theorem identifying local admissibility and local finite length, and the representation-specific injective-envelope statement, are separate targets at [§2.2](#section-2-2).

Here `O = O_L, ϖ, k = k_L` as in [§1.2](#section-1-2); `ζ` continuous. The finite-length statement uses the classification of [§2.7](#section-2-7), which is special to `F = ℚ_p`.

Use the following named operations and compatibility results.

- `GL2Qp.SmoothTorsionRep`: Objects of `Mod^{sm}_{G,ζ}(O)`: TopRep `O G` that are IsSmoothDiscrete, `ϖ`-power torsion, with `Z` acting by `ζ`.
- `GL2Qp.IsAdmissible`: `π^H[ϖ^n]` finitely generated over `O` for all compact open `H` and `n`.
- `GL2Qp.IsLocallyAdmissible`: `O[G]v` admissible for all `v`.
- `GL2Qp.IsLocallyFinite`: `O[G]v` of finite length for all `v`.
- `GL2Qp.locallyAdmissible_grothendieck`: The locally admissible full subcategory, with its abelian/Grothendieck structure furnished by the representation-category result in the `GL₂` finiteness and envelope theorem; general smooth-category Grothendieck structure alone does not prove this.

Import the smooth category over a ring, admissibility and local admissibility from SmoothRepresentationsOfLocalGroups SR.0 (SR.0.1–SR.0.4 and SR.0d.1, which supplies the Grothendieck property and enough injectives; the locally admissible fixed-character envelopes are the separate target of [§2.2](#section-2-2)) and specialise to `A = O/ϖ^n` and `G = GL₂(ℚ_p)`.

Smoothness at the pin is Tau Ceti's IsSmoothDiscrete on TopRep (discrete module, open point stabilisers).

Every irreducible smooth representation is admissible and finitely presented (CDN 2023 §1.2.3, from Barthel–Livné and Breuil), and both properties are stable under extensions, giving `Rep^{ℓf}G ⊂ Rep^{adm}G ∩ Rep^{pf}G`; hence a locally finite object is locally admissible and finite length objects are admissible.

Locally admissible `⇒` locally finite: `O[G]v` is finitely generated and admissible, hence has admissible cosocle, hence finite length (CDN 2023 Théorème 1.21 for objects killed by `ϖ`, and dévissage along `ϖ`-adic filtrations).

Gabriel's theory of locally finite Grothendieck categories applies (Paškūnas 2013 §2 and [35, §IV] there).

**Checks.**

- `GL2Qp.trivial_isLocallyFinite`: The trivial one-dimensional representation over `k` is in `Mod^{l.fin}_{G,1}(k)`.
- `GL2Qp.compactInduction_not_isLocallyFinite`: `c-Ind_{KZ}^G Sym^r k²` is smooth with central character but not locally finite.
- `GL2Qp.principalSeries_finiteLength`: `Ind_B^G(χ₁ ⊗ χ₂)` over `k` has length 1 or 2.
- `GL2Qp.smooth_compat`: A representation is in `Mod^{sm}_G(k)` iff its TopRep is IsSmoothDiscrete with `k` discrete (Tau Ceti IsSmoothDiscrete).
- `GL2Qp.steinberg_length_not_O_length`: Over `k`, Steinberg has length one over `k[G]` and infinite length as a `k`-module; local finiteness must accept it.
- The trivial representation and `Ind_B^G(χ₁ ⊗ χ₂)` lie in `Mod^{l.fin}_{G,ζ}(k)` for the matching `ζ`.
- `c-Ind_{KZ}^G σ` is smooth but not locally finite: it is a free `k[T]`-module of infinite rank (§2.7).

The source is [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §2, pp.14–15; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN23](#ref-cdn23), §1.2.1–1.2.3, pp. 14–16; Théorème 1.21, p. 22; [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §4, p. 8 (and footnote 3).

*Needs:* SmoothRepresentationsOfLocalGroups §SR.0; SmoothRepresentationsOfLocalGroups §SR.0d.1; `TauCeti.IsSmoothDiscrete`; `TopRep`; `CategoryTheory.IsGrothendieckAbelian`; [§1.1](#section-1-1).

<a id="section-2-2"></a>

### 2.2 Local admissibility and finite length for `GL₂(ℚ_p)`

For smooth `O`-torsion representations of `GL₂(ℚ_p)` with fixed central character, local admissibility is equivalent to local finite length as an `O[G]`-module. In particular a finitely generated admissible object has finite `O[G]`-length. The locally admissible category is abelian, and the locally admissible fixed-central-character category has injective envelopes.

Here `p` prime; `O` finite over `ℤ_p`; fixed continuous central character; smooth discrete `O`-torsion objects.

Use the `GL₂(ℚ_p)` finiteness theorem quoted by Paškūnas, not a formal consequence of being Grothendieck abelian.

Combine finite-length admissibility from the mod-`p` classification with the finitely generated admissible finite-length theorem; apply the locally admissible injective-envelope result of §2. These representation-specific inputs are specified in the `GL₂` finiteness and envelope theorem.

**Checks.**

- Finite length means length over `O[G]`, never finite length over `O`.
- The infinite-dimensional Steinberg representation is admissible and has `O[G]`-length one.

The statement `SmoothTorsion.finiteLength_of_finitelyGenerated_admissible` in `Suggested.lean` uses `TopRep 𝒪[L] G` for any finite compatible extension `L/ℚ_p`, with `TauCeti.IsSmoothDiscrete`, `Module.IsTorsion` and finite generation over `𝒪[L][G]`; its conclusion is `IsFiniteLength` over that group algebra. The definition `SmoothTorsion.HasCentralCharacter ζ X` expresses `ρ(scalar(a))v=ζ(a)v` using Mathlib’s scalar-matrix homomorphism and continuous characters. For an irreducible element `ϖ` of `𝒪[L]`, hence a uniformiser, `SmoothTorsion.IsAdmissible ϖ X` requires the submodule killed by `ϖ^(n+1)` inside `(X.ρ.restrict H.subtype).invariants` to be finite over `𝒪[L]` for every compact open `H` and every `n≥0`. This is the full integral torsion condition `π^H[ϖⁿ]` finite at every positive level; it does not require `π^H` itself to have finite `O`-length.

**Checks.** A scalar character with the stated `ζ` satisfies the central action equation, while a different scalar eigenvalue fails it. The zero representation is admissible for every `ζ`. Steinberg over `k` is admissible but infinite-dimensional; compact induction is smooth but fails admissibility. Thus the finite-generation hypothesis is representation-theoretic, not finite `k`-dimension.

The source is [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §2, pp.14–15, including the invocation of Emerton Theorem 2.3.8; [Shen-Ning Tung, TUNG21A](#ref-tung21a), §1.1, p.4.

*Needs:* [§2.1](#section-2-1); [§2.7](#section-2-7).

<a id="section-2-3"></a>

### 2.3 The Pontryagin dual category `C_{G,ζ}(O)` of compact `O[[K]]`-modules

For compact open `H⊂G, Mod^{pro aug}_G(O)` is the category of profinite `O[[H]]`-modules with compatible continuous `O[G]`-action. The `O`-linear dual `π^∨=Hom_O^{cont}(π,L/O)`, with `(gμ)(v)=μ(g^{-1}v)`, gives an anti-equivalence from smooth `O`-torsion modules to this category. The full dual category `C_{G,ζ}(O)` corresponds to locally admissible smooth modules with central character `ζ` and has central action `ζ^{-1}`. Its projective envelopes are duals of injective envelopes in that smooth representation category, using [§2.2](#section-2-2). The smooth dual `M^∨` is admissible exactly when `M` is finite over `O[[H]]`. Use the completed-group-algebra and compact Nakayama supplier contracts; `O`-linear duality requires the measure supplier contract and the duality target of §0.3.

Here `H` compact open in `G`; `O[[H]] = lim O/ϖ^n[H/H']` over open normal `H'`.

Use the following named operations and compatibility results.

- `GL2Qp.DualCategory`: `C_{G,ζ}(O)`: profinite `O[[K]]`-modules with compatible `G`-action and central character `ζ^{−1}` (dual convention).
- `GL2Qp.pontryaginDual`: `π ↦ π^∨ = Hom^{cont}_O(π, L/O)` with `⟨gμ, v⟩ = ⟨μ, g^{−1}v⟩`.
- `GL2Qp.pontryaginDual_antiEquivalence`: `π ↦ π^∨` is an anti-equivalence `Mod^{l.adm}_{G,ζ}(O) ≅ C_{G,ζ}(O)`.
- `GL2Qp.exists_projectiveEnvelope`: Every object of `C_{G,ζ}(O)` has a projective envelope.
- `GL2Qp.dual_isAdmissible_iff_fg`: The smooth dual `M^∨` is admissible iff the compact module `M` is finitely generated over `O[[K]]`.

Apply the `O`-linear duality adapter from the supplier contracts to discrete torsion `O`-modules and compact `O`-modules. Transport the contragredient `G`-action, and prove compatibility with the existing `O[[H]]`-module action using open stabilisers. Circle-valued Pontryagin duality alone does not give the scalar-linear statement.

Admissibility `⇔` finite generation over `O[[H]]`: `π^{H'}[ϖ]` finite for all `H' ⇔ π^∨/𝔪` finite-dimensional `⇔ π^∨` finitely generated by topological Nakayama (PadicMeasuresIwasawaAlgebras §5.2, compact inverse systems and topological Nakayama).

Projective envelopes in `C(O)` are duals of injective envelopes in `Mod^{l.adm}_{G,ζ}(O)` ([§2.1](#section-2-1)).

**Checks.**

- `GL2Qp.pontryaginDual_trivial`: `(k)^∨ ≅ k` with trivial action.
- `GL2Qp.pontryaginDual_zero`: `0^∨ = 0`.
- `GL2Qp.pontryaginDual_compactInduction_not_fg`: `(c-Ind_{KZ}^G σ)^∨` is not finitely generated over `O[[K]]`.
- `GL2Qp.pontryaginDual_dual`: `(π^∨)^∨ ≅ π` naturally (Pontryagin biduality).
- The dual of the trivial representation `k` is `k`.
- `(c-Ind_{KZ}^G σ)^∨` is not finitely generated over `O[[K]]`, matching non-admissibility.

The source is [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §2, p.14 (profinite augmented modules and `O`-linear Pontryagin duality); [Kentaro Nakamura, NAKAMURA23](#ref-nakamura23), Appendix B.3.2, p. 100 (arXiv).

*Needs:* [§2.1](#section-2-1); ProfiniteProPGroups Layer 9; PadicMeasuresIwasawaAlgebras §5.2; [§2.2](#section-2-2); [§0.3](#support-duality).

<a id="section-2-4"></a>

### 2.4 `GL₂` locally algebraic vectors inside the analytic-vector functor

Using the analytic-vector supplier contract, define `Π^{alg}` for `G=GL₂(ℚ_p)` by requiring `g↦gv` to be locally polynomial in `a,b,c,d,(ad−bc)⁻¹`. This `GL₂` algebraic decomposition is the additional target here. `Π^{alg} = ⊕_W W ⊗ Hom_{𝔤}(W, Π^{an})^{sm}` over irreducible algebraic representations `W = Sym^{k−1}L² ⊗ det^a (k ≥ 1, a ∈ ℤ)`; a representation is of type `(ℓ, k)` if only `W_{ℓ,k} := Sym^{k−1} ⊗ det^ℓ` occurs. Admissible locally analytic representations are the strong duals of coadmissible `D(H, L)`-modules for compact open `H`, with `D(H, L)` the Fréchet–Stein distribution algebra of §0.1.

Here `Π` admissible unitary Banach; `G = GL₂(ℚ_p)` viewed as a locally `ℚ_p`-analytic group.

Use the following named operations and compatibility results.

- `GL2Qp.algebraicVectors`: `Π^{alg} ⊂ Π^{an}`.
- `GL2Qp.algebraicVectors_decomposition`: `Π^{alg} = ⊕_W W ⊗ Hom_𝔤(W, Π^{an})^{sm}`.
- `GL2Qp.algebraicType`: `W_{ℓ,k} = Sym^{k−1}L² ⊗ det^ℓ`.

The differentiated `𝔤`-action in this formula is on `Π^{an}`. No differentiable action on the entire Banach carrier is assumed. Decomposition of `Π^{alg}`: an algebraic vector generates a finite-dimensional `𝔤`-module, decomposed into irreducible algebraic representations; the multiplicity spaces are smooth (Colmez Proposition VI.2.4).

**Checks.**

- `GL2Qp.algebraicVectors_character`: For `Π = η∘det` with `η` unitary and locally algebraic, `Π^{alg} = Π`.
- `GL2Qp.algebraicVectors_principalSeries_nonalgebraic`: If `δ₁δ₂^{−1}` is not locally algebraic, `(Ind_B^G δ₁ ⊗ δ₂)^{cont}` has no nonzero locally algebraic vector although its locally analytic vectors are dense.
- `GL2Qp.algebraicVectors_le_analytic`: `Π^{alg} ⊂ Π^{an}`.
- For `Π = W` finite-dimensional algebraic and unitary (only when `W` is a character), `Π^{alg} = Π`.
- For `Π=L²` with trivial action, the trivial algebraic type has multiplicity two and every nontrivial irreducible algebraic type has multiplicity zero; the decomposition must recover `L²`, rather than one copy of each occurring type.
- For `k=1, W_{ℓ,1}=det^ℓ`, and `W_{0,2}=L²` has dimension two. The value `k=0` is excluded, rather than interpreted as a negative symmetric power.
- For a unitary principal series `(Ind_B^G δ₁ ⊗ δ₂)^{cont}` with `δ₁δ₂^{−1}` not locally algebraic, `Π^{alg} = 0`.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §10–§11, pp. 16–17; §VI.2.1–VI.2.2, Proposition VI.2.4, p. 142; [Pierre Colmez, Gabriel Dospinescu, CD14](#ref-cd14), §0.1, pp. 3–4.

*Needs:* [the Banach contract](#banach-contract); [§0.1](#support-analytic).


<a id="section-2-5"></a>

### 2.5 Universal unitary completions

For a locally convex `L`-representation `W` of `G`, a universal unitary completion is a unitary Banach `G`-representation Ŵ with continuous map `ι:W→`Ŵ such that every continuous `G`-map from `W` into a unitary Banach representation factors uniquely through `ι`. Existence is not assumed for arbitrary `W`. For a locally algebraic representation with a minimal open `G`-stable lattice `Θ` generated by finitely many `G`-orbits, its separated `ϖ`-adic completion, tensored with `L`, has this universal property. For `Π` in the admissible finite-length unitary category with central character, the universal unitary completion of `Π^{an}` is `Π`. The coherent-lattice criterion used for this last assertion is Colmez–Dospinescu Proposition 0.6 and Theorem 0.7.

Here `W` locally convex with continuous `G`-action; for the existence statement a finitely generated `G`-stable lattice.

Use the following named operations and compatibility results.

- `GL2Qp.universalUnitaryCompletion`: The separated completion of a minimal open invariant `O`-lattice generated by finitely many `G`-orbits, with `W` locally algebraic; not an existence theorem for every locally convex `W`.
- `GL2Qp.universalUnitaryCompletion.ι`: The continuous `G`-map `W →` Ŵ.
- `GL2Qp.universalUnitaryCompletion.lift`: Every continuous `G`-map `W → B` to unitary Banach `B` factors uniquely through `ι`.
- `GL2Qp.universalUnitaryCompletion.lift_comp`: `lift(f) ∘ ι = f`.
- `GL2Qp.universalUnitaryCompletion.of_analyticVectors`: For `Π ∈ Rep_L(G), Π` is the universal completion of `Π^{an}` (Colmez–Dospinescu).

For a minimal open invariant lattice, every map into a unitary Banach target sends it into a bounded lattice after scaling. Extend to the separated completion and prove uniqueness by density.

For analytic vectors use the coherent-lattice result, Proposition 0.6 and Theorem 0.7 of Colmez–Dospinescu, followed by Theorem 0.2. This nonroutine input remains explicitly specified in the coherent-lattice criterion.

The coherent-lattice criterion is a separate construction target with the following hypotheses. Start with an admissible Banach representation `Π` of a p-adic Lie group `G`, a uniform pro-`p` open subgroup `H`, and the analytic-radius Banach spaces `Π_H^{(h)}` of Colmez–Dospinescu §0.3, p.5. For ordered minimal generators `h₁`,…,`h_d` of `H`, put `b^α=(h₁−1)^{α₁}⋯(h_d−1)^{α_d}` and `r_h=1/(p^{h−1}(p−1))`; `Π_H^{(h)}` consists of `v` for which `p^{r_h|α|}‖b^αv‖` tends to zero. The real factor here describes decay, not a fractional power chosen in `L`. The radius norm gives its Banach topology, and the definition is independent of the ordered generators. Define `GL2Qp.IsHCoherent Π H` to mean that for some `h₀` and every `h≥h₀`,

```text
Π_H^{(h+1)} = Σ_{g∈G, H^p ⊂ gHg⁻¹} g·Π_H^{(h)}.
```

Here `H^p` is the subgroup of pth powers of the uniform group; the restriction on `g` is part of the criterion. For a unit ball `Π_h⁰` in `Π_H^{(h)}`, set `L_h=Σ_{g∈G}g·Π_h⁰`. The target `GL2Qp.coherent_completion` says that `H`-coherence gives, for sufficiently large `h`, the universal completion `L⊗_O lim_n L_h/p^nL_h`. This includes separation and the induced Banach topology. For `G=GL₂(ℚ_p)`, `GL2Qp.analytic_coherent` asserts `H`-coherence for `Π∈Rep_L(G)`, and `GL2Qp.coherent_lattice_commensurable` identifies `L_h` up to commensurability with `Θ∩Π^{an}` for every open bounded invariant lattice `Θ` in `Π`. These are Proposition 0.6 and Theorem 0.7, p.6; Theorem 0.2, p.4 then identifies the completion with `Π`. The criterion applies to analytic vectors of an admissible Banach object with this recurrence, rather than to an unspecified locally analytic representation.

**Checks.**

- `GL2Qp.universalUnitaryCompletion_trivial`: The universal unitary completion of the trivial representation `L` is `L`.
- `GL2Qp.universalUnitaryCompletion_zero`: The universal completion of 0 is 0.
- `GL2Qp.universalUnitaryCompletion_nonunitary_central`: If `Z` acts on `W` by a non-unitary character, every map to a unitary Banach representation is zero, so Ŵ `= 0` although `W ≠ 0`.
- `GL2Qp.universalUnitaryCompletion_analytic`: For `Π ∈ Rep_L(G), Hom_G(Π, B) → Hom_G(Π^{an}, B)` is a bijection for every unitary `B`.
- For the zero Banach object every radius space and `L_h` is zero, so the coherence recurrence and its completion give zero.
- For the trivial object `L`, all radius spaces equal `L`; `g=1` is allowed since `H^p⊂H`, so the recurrence holds, `L_h=O`, and the completion is `L`.
- `H`-coherence is not automatic for every admissible Banach object of a p-adic Lie group. For `G=H=ℤ_p` acting by translation on `C(ℤ_p,L)`, all translates preserve each radius space, so the right-hand side of the recurrence is `Π_H^{(h)}`. These spaces strictly increase: choose `r_{h+1}<c<r_h` and the Mahler series `Σ_{n≥0}p^{⌈cn⌉} binom(x,n)`. Its nth finite difference has norm at most `p^{−⌈cn⌉}`, with that value at `x=0`, so it belongs to radius `h+1` and not radius `h`. Thus this object fails `H`-coherence. The `GL₂` coherence theorem has a substantive group hypothesis.
- For `Π ∈ Rep_L(G), (Π^{an})^ ≅ Π` (Colmez–Dospinescu).

The source is [Pierre Colmez, Gabriel Dospinescu, CD14](#ref-cd14), Introduction, Theorem 0.2, Proposition 0.6, Theorem 0.7, pp.4–6; [Laurent Berger, Christophe Breuil, BB10](#ref-bb10), Introduction, p. 2; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN20](#ref-cdn20), Proposition 2.9, p. 22; Corollaire 2.13 and its proof, p. 24 (arXiv).

*Needs:* [the Banach contract](#banach-contract); [§2.4](#section-2-4); for `GL2Qp.analytic_coherent`, lattice commensurability and analytic completion, [§3.11](#section-3-11) and [§3.8](#section-3-8).

<a id="section-2-6"></a>

### 2.6 `Mod p` principal series and Steinberg representations

For smooth characters `δ₁, δ₂` : `ℚ_p^× → k^×` write `δ₁ ⊗ δ₂` for the character `(a b; 0 d) ↦ δ₁(a)δ₂(d)` of `B` and `Ind_B^G` for smooth induction (locally constant `φ` : `G → k` with `φ(bg) = (δ₁ ⊗ δ₂)(b)φ(g), G` acting by right translation). Colmez's normalisation is `B(δ₁, δ₂) := Ind_B^G(δ₂ ⊗ δ₁ω^{−1})`, an object of `Rep^{tors}G` with central character `ω^{−1}δ₁δ₂`, irreducible unless `δ₁ = ωδ, δ₂ = δ` for some `δ`, in which case it is a non-split extension of `St ⊗ (δ∘det)` by `δ∘det, St` being the Steinberg representation `Ind_B^G(1)/1`. Paškūnas and CDP use `π{χ₁, χ₂} := (Ind_B^G χ₁ ⊗ χ₂ω^{−1})^{ss} ⊕ (Ind_B^G χ₂ ⊗ χ₁ω^{−1})^{ss}`, of length 2 in general, 3 or 4 for the exceptional pairs, and CDN write `I(χ₁, χ₂)` for the irreducible principal series attached to `(χ₁, χ₂)`.

Here `δ₁, δ₂` smooth characters with values in `k^×` (after enlarging `k`).

Use the following named operations and compatibility results.

- `GL2Qp.principalSeries`: `Ind_B^G(δ₁ ⊗ δ₂)` as a smooth `k`-representation.
- `GL2Qp.colmezPrincipalSeries`: `B(δ₁, δ₂) = Ind_B^G(δ₂ ⊗ δ₁ω^{−1})`.
- `GL2Qp.steinberg`: `St = Ind_B^G(1 ⊗ 1)/1`.
- `GL2Qp.principalSeries_centralChar`: `Z` acts on `Ind_B^G(δ₁ ⊗ δ₂)` by `δ₁δ₂`.
- `GL2Qp.principalSeries_irreducible_iff`: `Ind_B^G(δ₁ ⊗ δ₂)` is irreducible iff `δ₁ ≠ δ₂`.
- `GL2Qp.principalSeries_twist`: `Ind_B^G(δ₁ ⊗ δ₂) ⊗ (η∘det) ≅ Ind_B^G(δ₁η ⊗ δ₂η)`.

Barthel–Livné: `Ind_B^G(χ₁ ⊗ χ₂)` is irreducible iff `χ₁ ≠ χ₂`, and `Ind_B^G(χ ⊗ χ)` is a non-split extension of `St ⊗ χ` by `χ∘det` (§2.7’s compact-induction Hecke interface and Colmez Proposition III.3.7).

The central character of `Ind_B^G(δ₂ ⊗ δ₁ω^{−1})` is `δ₂·δ₁ω^{−1}` restricted to scalars.

Intertwinings between Jordan–Hölder constituents of different principal series do not occur unless the parameters agree (Colmez Proposition III.3.5(ii)).

**Checks.**

- `GL2Qp.colmezPrincipalSeries_centralChar`: `B(δ₁, δ₂)` has central character `ω^{−1}δ₁δ₂`.
- `GL2Qp.principalSeries_trivial_reducible`: `Ind_B^G(1 ⊗ 1)` is reducible, with sub the trivial character and quotient `St`.
- `GL2Qp.steinberg_not_character`: `St` is infinite-dimensional, so it is not of the form `χ∘det`.
- `GL2Qp.principalSeries_dim_invariants`: `dim_k Ind_B^G(δ₁ ⊗ δ₂)^{I₁} = 2`.
- `B(ω, 1)` is reducible: an extension of `St` by the trivial character.
- `π{χ, χ} = (Ind_B^G χ ⊗ χω^{−1})^{⊕2,ss}`.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §7, p. 13; §III.3.3–III.3.4, Proposition III.3.7, p. 87; [Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas, CDP14](#ref-cdp14), §1.2, p. 3; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDNKISIN](#ref-cdnkisin), §1.1, Remarque 1.1, p. 4.

*Needs:* [§1.2](#section-1-2); the smooth-category definitions of [§2.1](#section-2-1); SmoothRepresentationsOfLocalGroups SR.2.

<a id="section-2-7"></a>

### 2.7 Classification of irreducible mod `p` representations of `GL₂(ℚ_p)`

Over a sufficiently large finite field `k` of characteristic `p`, put `σ_r=Sym^r k² (0≤r≤p−1)`, extend `σ_r` to `KZ` with `p` acting trivially, and define `Π(r,λ,χ)=(c-Ind_{KZ}^G σ_r)/(T−λ) ⊗ (χ∘det)`. Thus the central scalar `p` acts on the twist as `χ(p)²`. The representation is irreducible except when `λ=±1` and `r∈{0,p−1}`. Writing `η=χμ_λ`, the exceptional nonsplit sequences are `0→St⊗(η∘det)→Π(0,λ,χ)→η∘det→0` and `0→η∘det→Π(p−1,λ,χ)→St⊗(η∘det)→0`. The absolutely irreducible smooth representations are characters, Steinberg twists, irreducible principal series `Ind_B^G(χ₁⊗χ₂)` with `χ₁≠χ₂`, and supersingular `Π(r,0,χ)`. Every absolutely irreducible is a constituent of a twisted Hecke quotient `Π(r,λ,χ)`. Supersingular isomorphisms are generated by changing `χ` to `χμ_{−1}` and `(r,χ)` to `(p−1−r,χω^r)`; they have no principal-series constituents. Over an algebraic closure irreducibles have a central character, are admissible and finitely presented, and descend to a finite field. Irreducibles over `k` are obtained by Galois descent.

Here `F = ℚ_p`: the irreducibility of `I(σ)/(T)` (Breuil) and finite presentation of supersingulars fail for `F ≠ ℚ_p` ([§2.9](#section-2-9)).

For `σ_r=Sym^r k²`, extended to `KZ` by trivial action of `p`, construct the shared spherical Hecke endomorphism `heckeOperatorT`, written `T` here, on `I(σ_r)=c-Ind_(KZ)^G σ_r` on the smooth compact-induction carrier of SmoothRepresentationsOfLocalGroups SR.2.1. Prove its double-coset formula for `KZ·diag(p,1)·KZ`, its coefficient-change and twist laws, `End_G(I(σ_r))≅k[T]` and freeness over `k[T]`. Over a sufficiently large finite splitting field, every absolutely irreducible smooth representation with central character is a quotient of some `(I(σ_r)/(T−λ))⊗(χ∘det)`, with `λ∈k` and smooth `χ:ℚ_p×→k×`. Transport the Hecke operator by the compact-induction tensor identity and use `T⊗1` for this twisted-quotient convention. Identify the `λ≠0` representations with the principal series or the exceptional extensions stated above, retaining their subrepresentation/quotient orientations; in the exceptional cases choose the weight giving the desired irreducible quotient. General irreducibles over smaller finite fields use the Galois descent statement, without assuming a linear Hecke eigenvalue over that field. The finite Serre-weight carrier and its classification are §2.8; the shared names are `SerreWeight`, `compactInduction`, `heckeOperatorT`, `endEquivPolynomial` and `compactInduction_free`. The `NormalizerType.serreWeight` notation is their `ℚ_p` specialization; Colmez parameter changes and the exceptional sequences are adapters to that same classification. Sources: Colmez §III.3.1, Theorem III.3.2 and Proposition III.3.5, pp.85–86; Breuil 2003 §1 and §4.

Breuil: `I(σ)/(T)` is irreducible for `F = ℚ_p` (Breuil 2003, Théorème 1.1, via Corollaires 4.1.1 and 4.1.4) and the isomorphisms between them (Théorème 1.3).

Colmez Théorème III.3.2 and Proposition III.3.5 package (i)–(iii) in the notation `Π(r, λ, χ)`.

(iv): Berger's central character theorem; admissibility and finite presentation of ordinary and supersingular irreducibles (CDN 2023 §1.2.3); Galois descent of irreducibles (CDN 2023 Lemma 1.7).

Use the orientations of Kisin (1.2.2); Colmez III.3.2 and CDN–Kisin Remark 1.1 reverse them (the reversed exceptional-sequence conventions discussed below). At `r=0, λ=1, χ=1`, augmentation gives the character quotient, a direct check on the orientation.

**Checks.**

- The number of isomorphism classes of supersingular representations of `GL₂(ℚ_p)` over `𝔽̄_p` with a fixed central character is finite, and over `𝔽̄_p` they are in bijection with irreducible two-dimensional Galois representations with the matching determinant (Breuil Corollaire 1.4; [§3.3](#section-3-3)).
- For `p = 2, Π(0, 0, χ) ≅ Π(1, 0, χ)` (take `r = 0, p−1−r = 1` and `ω` trivial).
- `Π(0,1,1)` is reducible with Steinberg submodule and trivial-character quotient; augmentation detects the quotient.
- At `p=5`, let `k=𝔽₅` and let `χ` be unramified with `χ(5)=2`. On `χ∘det`, `5I₂` acts by `χ(25)=4≠1`, so no untwisted `I(σ_r)/(T−λ)` surjects onto it. The twisted `Π(0,1,χ)` does, by twisted augmentation.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), §III.3.1, Théorème III.3.2 and Proposition III.3.5, pp. 85–86; [Christophe Breuil, BREUIL03](#ref-breuil03), Théorème 1.1, p. 3; Théorème 1.3, p. 3; Corollaires 4.1.1 and 4.1.4, pp. 17–20; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDNKISIN](#ref-cdnkisin), §1.1, Proposition 1.2, p. 4; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN23](#ref-cdn23), §1.2.1–1.2.3 and Lemme 1.7, pp. 14–16; [Mark Kisin, KISIN09](#ref-kisin09), §1.2, (1.2.2), published p.648.

*Needs:* [§2.8](#section-2-8); [§2.6](#section-2-6); the smooth-category definitions of [§2.1](#section-2-1).

<a id="section-2-8"></a>

### 2.8 Irreducible mod `ℓ` representations of `GL₂(ℤ_ℓ), U₀(ℓ)` and `Ũ₀(ℓ)`

Let `ℓ` be prime, `U₀(ℓ)⊂GL₂(ℤ_ℓ)` have lower-left entry divisible by `ℓ`, and `Ũ₀(ℓ)` be its full normaliser in `GL₂(ℚ_ℓ)`. It is generated by `U₀(ℓ)` and `w_ℓ=(0 −1;ℓ 0)`, with `w_ℓ²=−ℓ·1`. Over an algebraic closure of `𝔽_ℓ`, irreducible continuous representations of `GL₂(ℤ_ℓ)` are `σ_{n,m}=Sym^n k²⊗det^m` for `0≤n≤ℓ−1` and `m` modulo `ℓ−1`; those of `U₀(ℓ)` are the characters `(a b;ℓc d)↦`ā`^{m₁}d̄^{m₂}`. For unequal `m₁,m₂`, the normaliser exchanges these characters and its irreducibles are two-dimensional, indexed by the unordered pair and `a∈k^×` specifying the scalar action of `−ℓ`. For equal exponents, the irreducibles are one-dimensional extensions, indexed by the value `a∈k^×` of `w_ℓ`. No quotient by `ℓ^ℤ` or condition that `ℓ` acts trivially is imposed.

Here `ℓ` prime; smooth representations over an algebraic closure of `𝔽_ℓ` with the discrete coefficient topology. The normaliser is the full locally compact group, with no trivial-central-scalar restriction.

The pro-`ℓ` congruence kernel acts trivially on irreducible smooth characteristic-`ℓ` modules. Apply the finite `GL₂(𝔽_ℓ)` classification and the diagonal quotient of the Iwahori.

For the normaliser use `w_ℓ²=−ℓ` and Clifford theory: distinct characters form a two-element orbit, while equal characters extend in dimension one. The scalar parameters record the noncompact central subgroup, as in BCDT §1.3. Name the objects `NormalizerType.serreWeight n m`, `NormalizerType.iwahoriCharacter m₁ m₂` and `NormalizerType.normalizerRep m₁ m₂ a`, with `NormalizerType.restrict_iwahori` for the restriction formula and `NormalizerType.weyl_square` for the scalar relation. In the last constructor specify whether a denotes `w_ℓ` (equal exponents) or `−ℓ` (unequal exponents), as above; these are different parameters.

**Checks.**

- There are `ℓ(ℓ−1)` Serre-weight isomorphism classes for `GL₂(ℤ_ℓ)`.
- `σ_{0,m} = det^m` is one-dimensional; `σ_{ℓ−1,0}` has dimension `ℓ`.
- For `m₁≠m₂` the restriction of `normalizerRep m₁ m₂ a` is the sum of the two distinct ordered Iwahori characters. A one-dimensional extension cannot have this restriction.
- For equal exponents and `w_ℓ`-eigenvalue `a`, the scalar `−ℓ` acts by `a²`. Choosing a with `a²≠1` rules out silently imposing trivial scalar action.
- At `ℓ=2` all exponent pairs coincide and the normaliser irreducibles are one-dimensional; their parameter a still ranges over `k^×`, and `−2` acts by `a²`, rather than being set equal to 1.

The source is [Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor, BCDT01](#ref-bcdt01), §1.3, p. 854 (published pagination).

*Needs:* [§1.1](#section-1-1); SmoothRepresentationsOfLocalGroups SR.0.

<a id="section-2-9"></a>

### 2.9 What fails for `GL₂(F)` with `F ≠ ℚ_p`

For a finite extension `F ≠ ℚ_p` of `ℚ_p`, the mod `p` theory of `GL₂(F)` differs from that of `GL₂(ℚ_p)` in ways that block the constructions of this roadmap: (i) supersingular representations of `GL₂(F)` over `𝔽̄_p` are not finitely presented (Schraen, Wu); (ii) for `p>2` and `F = ℚ_{p³}` there are smooth irreducible `k_L`-representations of `GL₂(F)` that are not admissible, and a supersingular `𝔽_{p³}`-representation with `End = 𝔽̄_p` which is not absolutely irreducible over any finite extension (Le); (iii) the quotients `I(σ)/(T)` are not irreducible and supersingular representations are not classified. Consequently nothing in this roadmap asserts a p-adic or mod `p` correspondence for `GL₂(F), F ≠ ℚ_p`: the correspondence and mod `p` classification targets use `G = GL₂(ℚ_p)`; the shared foundations keep their stated broader domains.

Here `F/ℚ_p` finite, `F ≠ ℚ_p`.

(i) is CDN 2023 Théorème 1.27, citing Schraen and Wu; (ii) is CDN 2023 Remarques 1.8 and 1.28, citing Daniel Le, *On some nonadmissible smooth irreducible representations for GL₂*, Math. Res. Lett. 26 (2019), Theorems 1.1–1.2, pp.1747–1748, with the standing `p>2` assumption of §1.1, p.1749; (iii) is the CDN 2023 §1.2.1 description, which leaves supersingulars of `GL₂(F)` unclassified.

Colmez's Remarque 0.8(iii) records that standard presentations, which the construction of `D(Π)` needs, are expected to fail for `GL₂(F), F ≠ ℚ_p`.

**Checks.**

- The roadmap's statements carry the hypothesis `F = ℚ_p` wherever they use [§2.7](#section-2-7), [§3.2](#section-3-2) or [§5.1](#section-5-1).

The source is [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN23](#ref-cdn23), §1.2.1, pp. 14–15; Remarque 1.8, p. 16; Théorème 1.27 and Remarque 1.28, p. 25; [Pierre Colmez, COLMEZ10](#ref-colmez10), Remarque 0.8(iii), p. 12.

*Needs:* [§2.7](#section-2-7).

### Examples

The Steinberg representation over `k` is infinite-dimensional over `k` but has `G`-length one. A compact induction `c-Ind_{KZ}^G σ` is smooth yet fails local finite length. For the scalar Banach action `η∘det`, unitarity requires `|η(p)|=1`; the zero representation satisfies admissibility and residual length zero. The finite Steinberg `K`-type has dimension `p`, including dimension 2 at `p=2`.

### Dependencies

Layer 1; SmoothRepresentationsOfLocalGroups SR.0 and SR.2; §0.1; pinned completed group algebras and categorical envelopes; §0.3; PadicMeasuresIwasawaAlgebras §5.2; §§2.7–2.8.

## Layer 3: The Montreal functor and the correspondence

<a id="section-3-1"></a>

### 3.1 The `G`-module `D ⊠_δ ℙ¹`

Let `D` be an étale `(φ,Γ)`-module over `O_E` (torsion or free) or over `E`, and `δ` : `ℚ_p^× → O_L^×` a continuous unitary character. On `D ⊠ ℤ_p^× = D^{ψ=0}` there is an involution `w_δ`, the limit of `Σ_{i ∈ ℤ_p^× mod p^n} δ(i^{−1})(1+T)^i σ_{−i^2}(φ^nψ^n((1+T)^{−i^{−1}}z))`. Put `D ⊠_δ ℙ¹ = {z = (z₁, z₂) ∈ D × D : Res_{ℤ_p^×}(z₂) = w_δ(Res_{ℤ_p^×}(z₁))}`. There is a unique action of `G` on `D ⊠_δ ℙ¹` such that `Res_U(g·z) = H_g(Res_{g^{−1}U ∩ ℤ_p}(z₁)) + H_{gw}(Res_{(gw)^{−1}U ∩ pℤ_p}(z₂))` for every compact open `U ⊂ ℚ_p`, with the explicit skeleton: `w(z₁, z₂) = (z₂, z₁)`; `(a 0; 0 a)` acts by `δ(a)`; `(a 0; 0 1), a ∈ ℤ_p^×`, by `((a 0; 0 1)z₁, δ(a)(a^{−1} 0; 0 1)z₂)`; and the formulas for `(p 0; 0 1)` and `(1 b; 0 1), b ∈ pℤ_p`. Restrictions `Res_U` : `D ⊠_δ ℙ¹ → D ⊠ U` and `Res_{ℚ_p}` : `D ⊠_δ ℙ¹ → D ⊠_δ ℚ_p` are `G`- resp. `B`-compatible; `Res_{ℤ_p}z = z₁` and `Res_{ℤ_p}(w·z) = z₂`. There is also a measure construction, on the `ψ`-module `M=D⁰(ℤ_p,O_L)` of [§1.5](#section-1-5), with its rational coefficient version. This `M` is not an étale `O_E`-module: its Amice transform is `O_L[[T]]`. Gluing its two measure charts gives the dual `B(δ)*` of the space of continuous `φ` on `ℚ_p` with `x ↦ δ(x)φ(1/x)` continuous at 0, with `g·φ = φ ⋆ g^{−1}, (φ ⋆ (a b; c d))(x) = δ(cx+d)φ((ax+b)/(cx+d))`. Twisting: `(D ⊠_δ ℙ¹) ⊗ (η∘det) ≅ (D ⊗ η) ⊠_{δη²} ℙ¹`, and there is a perfect `G`-equivariant pairing `{ , }_{ℙ¹}` between `Ď ⊠_{δ^{−1}} ℙ¹` and `D ⊠_δ ℙ¹`. The pairing takes values in `O_L, L`, or `L/O_L` with the matching integral, rational, or torsion topology, as in [§1.3](#section-1-3).

Here `D` étale; `δ` unitary continuous; the construction is analytic in `(D, δ)` over `S ⊗̂ O_E` for `S` a quotient of `O_L[[X₁,…,X_d]]` (Remarque 0.18(iv)).

Use the following named operations and compatibility results.

- `BoxtimesP1`: `D ⊠_δ ℙ¹` for étale `D` and unitary `δ`.
- `BoxtimesP1.wDelta`: The involution `w_δ` of `D^{ψ=0}`.
- `BoxtimesP1.action`: The unique continuous `G`-action characterised by the `Res_U` formula.
- `BoxtimesP1.res`: `Res_U` : `D ⊠_δ ℙ¹ → D ⊠ U` and `Res_{ℚ_p}` to `D ⊠_δ ℚ_p`.
- `BoxtimesP1.res_Zp_w`: `Res_{ℤ_p}(z) = z₁` and `Res_{ℤ_p}(w·z) = z₂`.
- `BoxtimesP1.central`: `(a 0; 0 a)·z = δ(a)z`.
- `BoxtimesP1.twist`: `(D ⊠_δ ℙ¹) ⊗ (η∘det) ≅ (D ⊗ η) ⊠_{δη²} ℙ¹`.
- `BoxtimesP1.pairing`: The continuous `G`-equivariant perfect pairing on the two glued modules, into the coefficient-dependent residue-duality target of [§1.3](#section-1-3).
- `BoxtimesP1.measures`: The separate glued measure module `M ⊠_δ ℙ¹`, for `M=D⁰(ℤ_p,O_L)` with matching coefficients in `B(δ)*`, is `G`-equivariantly isomorphic to `B(δ)*`. Its charts use the `ψ`-module measure construction, rather than substituting `M` for the étale carrier `D`.

Define `w_δ` on `D^{ψ=0}` by the limit formula; convergence and the involution property are Colmez's Lemme II.1.2 and Remarque II.1.3.

Define the action of the generators by the skeleton formulas and prove uniqueness and existence of the `G`-action from the `Res_U` formula (Colmez Théorème II.1.4, p. 47), using `P(ℚ_p), Z` and `w` generating `G` ([§1.1](#section-1-1)) and the `P(ℚ_p)`-module `D ⊠ ℚ_p` ([§1.5](#section-1-5)).

The measure case: the restriction maps to `ℤ_p` and to `w·ℤ_p` identify `B(δ)*` with `D⁰(ℤ_p) ⊠_δ ℙ¹`, the pairs `(μ₁, μ₂)` with `Res_{ℤ_p^×}μ₂ = w_δ(Res_{ℤ_p^×}μ₁)` (Colmez §5, p. 10).

Twisting (Colmez §II.1.3) and the pairing (Théorème II.1.13) from the residue pairing on `Ď × D` ([§1.3](#section-1-3)).

**Checks.**

- `BoxtimesP1.w_swap`: `w·(z₁, z₂) = (z₂, z₁)`.
- `BoxtimesP1.zero`: 0 `⊠_δ ℙ¹ = 0`.
- `BoxtimesP1.measures_dirac`: In the glued measure module, if `z` corresponds to `μ ∈ B(δ)*`, then `g·z` corresponds to the functional `φ ↦ μ(φ ⋆ g)`, the transpose of the action `g·φ = φ ⋆ g^{−1}` on `B(δ)`.
- `BoxtimesP1.not_split`: For general `δ` the extension of a Banach space by the dual of a Banach space underlying `D ⊠_δ ℙ¹` is not `G`-equivariantly split: for `D` irreducible of rank 2 and `δ = δ_D` it is the non-split sequence of [§3.7](#section-3-7).
- The centre acts through `δ`.
- `Res_{ℤ_p}` and `Res_{ℤ_p}∘w` recover `(z₁, z₂)`.
- `{ , }_{ℙ¹}` is perfect and `G`-equivariant.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §5, pp. 9–11 and Théorème 0.6, p. 11; [Pierre Colmez, COLMEZ10](#ref-colmez10), §II.1, Théorème II.1.4, p. 47; Théorème II.1.13, p. 53.

*Needs:* [§1.5](#section-1-5); [§1.4](#section-1-4); [§1.3](#section-1-3); [§1.1](#section-1-1); [§1.2](#section-1-2).

<a id="section-3-2"></a>

### 3.2 Colmez's Montreal functor `Π ↦ D(Π), V(Π)`

The shared contract `MontrealFunctor.torsionEtaleRealization` is the finite-length torsion construction here, including its étale-module output and covariant Galois realization. The compact and Banach extensions use this same functor and the fixed-character duality; they are not additional definitions of the torsion functor.

For `Π ∈ Rep^{tors}G` choose a finite length `K`-stable `W ⊂ Π` that gives a standard presentation (`W(Π) ≠ ∅`; `Π = I(W)/R(W, Π)` is a standard presentation, which exists for every `Π`, Colmez Théorème III.3.1). Let `I^Π_{ℤ_p}(W)` be the `O_L`-span of the `(p^n a; 0 1)·W` with `a + p^nℤ_p ⊂ ℤ_p, D^♮_W(Π)` its Pontryagin dual (a quotient of `Π^∨`), and `D⁺_W(Π) ⊂ Π^∨` the `μ` vanishing on `(p^n a; 0 1)·W` for `a + p^nℤ_p ⊄ ℤ_p`. These are `Γ`-modules over `O_E⁺` (`T` acting by `(1 1; 0 1) − 1, σ_a` by `(a 0; 0 1)`), `D⁺_W(Π)` is a `(φ,Γ)`-module over `O_E⁺` with `φ = (p 0; 0 1)`, and `D(Π) := O_E ⊗ D⁺_W(Π) ≅ O_E ⊗ D^♮_W(Π)` is independent of `W`, with `β_{ℤ_p}` : `Π^∨ → D(Π)`. Then `D` is an exact contravariant functor `Rep^{tors}G → ΦΓ^et_tors`, extended to `Rep_{O_L}G` by inverse limits and to `Rep_L G` by `⊗ L`. `V(Π) :=` the Tate dual of `V(D(Π))` defines an exact covariant functor `Rep^{tors}G → Rep_tors G_{ℚ_p}, Rep_{O_L}G → Rep_{O_L}G_{ℚ_p}, Rep_L G → Rep_L G_{ℚ_p}`, with `V(Π ⊗ (δ∘det)) = V(Π) ⊗ δ`, and `V(Π) = MF(Π)(ε)` for Emerton's normalisation `MF`. Paškūnas's variant on the dual category: `V̌(M) := V(M^∨)^∨(ζε)` for `M ∈ C_{G,ζ}(O)`, extended to pseudo-compact objects by limits. Limits are taken in the profinite augmented dual category; their exactness requires its compact Mittag–Leffler input, not arbitrary inverse-limit exactness.

Here `Π ∈ Rep^{tors}G` (smooth, admissible, finite length, central character) or a lattice / Banach representation residually in it. `F = ℚ_p` (standard presentations; [§2.9](#section-2-9)).

Use the following named operations and compatibility results.

- `MontrealFunctor.D`: `D` : `Rep^{tors}G → ΦΓ^et_tors`, contravariant.
- `MontrealFunctor.V`: `V(Π) =` Tate dual of `V(D(Π))`, covariant.
- `MontrealFunctor.D_exact`: `D` is exact.
- `MontrealFunctor.V_exact`: `V` is exact on `Rep^{tors}G, Rep_{O_L}G` and `Rep_L G`.
- `MontrealFunctor.V_twist`: `V(Π ⊗ (δ∘det)) = V(Π) ⊗ δ`.
- `MontrealFunctor.beta`: `β_{ℤ_p}` : `Π^∨ → D(Π), P(ℤ_p)`-equivariant with `β ∘ (p^{−1} 0; 0 1) = ψ ∘ β`.
- `MontrealFunctor.V_eq_MF`: `V(Π) ≅ MF(Π)(ε)`.
- `MontrealFunctor.Vcheck`: `V̌(M) = V(M^∨)^∨(ζε)` on `C_{G,ζ}(O)`, extended to pseudo-compact objects.
- `MontrealFunctor.V_limit`: On `Rep_{O_L}G, V(Θ) = lim V(Θ/ϖ^nΘ)`; on `Rep_L G, V(Π) = L ⊗ V(Θ)`.

Existence of standard presentations (Colmez Théorème III.3.1), reduced by dévissage to irreducibles via the classification [§2.7](#section-2-7).

Construction of `D^♮_W, D⁺_W` and their module structures (Colmez §IV.1, Proposition IV.1.11–IV.1.12: `β ∘ (p^{−1} 0; 0 1) = ψ ∘ β`).

Finite length of `D(Π)` for irreducible `Π`: explicit computation of `D^♮_{W_r}(Π(r, λ))` as `k_E⁺ ⊕ k_E⁺ (λ = 0)` or `k_E⁺ ⊕ k_E⁺/T (λ ≠ 0)` (Théorème IV.2.1); exactness by Proposition IV.2.12 and dévissage (Théorème IV.2.13).

Passage to `V` and its exactness via Fontaine's equivalence (Théorème IV.2.14; [the Fontaine contract](#fontaine-contract)).

Comparison with `MF`: Emerton defines `MF(π)` as the Pontryagin dual of `V(D(π))` (lg §3.2 and footnote 6), Colmez as the Tate dual; they differ by `ε`.

**Checks.**

- `MontrealFunctor.V_character`: `V(δ∘det) = 0`.
- `MontrealFunctor.V_zero`: `V(0) = 0`.
- `MontrealFunctor.V_steinberg`: `V(St ⊗ (δ∘det)) = k_L(ωδ)`.
- `MontrealFunctor.V_not_faithful`: `V` is not faithful on `Rep^{tors}G`: it kills every finite-dimensional representation `χ∘det`.
- `V(χ∘det) = 0` (Théorème 0.10(i)).
- `V` is exact: a short exact sequence in `Rep^{tors}G` gives a short exact sequence of Galois representations.
- `V(Π ⊗ (δ∘det)) = V(Π) ⊗ δ`.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §6, Théorèmes 0.7 and 0.9, pp. 11–13; §IV.1–IV.2, Théorèmes IV.2.1, IV.2.13 and IV.2.14, pp. 97–103; [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §1, pp. 2–3; §5; [Matthew Emerton, EMERTON-LG](#ref-emerton-lg), §3.2, pp. 19–20 and footnote 6.

*Needs:* [§2.1](#section-2-1); [§2.7](#section-2-7); [the Banach contract](#banach-contract); [§2.3](#section-2-3); [the Fontaine contract](#fontaine-contract); [§1.4](#section-1-4); [§1.5](#section-1-5).

<a id="section-3-3"></a>

### 3.3 The Montreal functor on irreducibles and the mod `p` correspondence

(i) `V(δ∘det) = 0`; (ii) `V(St ⊗ (δ∘det)) = k_L(ωδ)`; (iii) `V(B(δ₁, δ₂)) = k_L(δ₁)` for `B(δ₁, δ₂) = Ind_B^G(δ₂ ⊗ δ₁ω^{−1})`; (iv) for `Π` absolutely irreducible supersingular over `k_L`, `V(Π)` is absolutely irreducible of dimension 2 over `k_L`; precisely `V(Π(r, 0, δ) ⊗ (−1)^{v_p(x)}) = V(r, δ)`, Colmez's irreducible atome galoisien. (v) (Breuil's semisimple mod `p` correspondence) there is a unique bijection between isomorphism classes of supersingular representations of `GL₂(ℚ_p)` over `𝔽̄_p` and irreducible two-dimensional representations of `G_{ℚ_p}` over `𝔽̄_p` with `π(r, 0, χ) ↦ ρ(r, χ) = ind(ω₂^{r+1}) ⊗ χ, det ρ(r, χ) = ω^{r+1}χ²`, compatible with the isomorphisms `π(r, 0, χ) ≅ π(r, 0, χμ_{−1}) ≅ π(p−1−r, 0, χω^r)` on the left and the corresponding ones on the right; `V` realises it up to the normalising twists in (iv). (vi) If `δ₁ ∉ {δ₂, ω^{±1}δ₂}, Ext¹_G(B(δ₂, δ₁), B(δ₁, δ₂))` is one-dimensional and `V` of a non-split extension is the non-split extension of `k_L(δ₂)` by `k_L(δ₁)`.

Here (i)–(iv) and the scalar-field dimension bounds concern absolutely irreducible objects over a splitting finite residue field `k_L`; `F=ℚ_p`. For a general admissible irreducible `π` over finite `k`, the endomorphism ring `k_π=End_G(π)` is a finite field extension and `π` is absolutely irreducible as a `k_π[G]`-module (CDN23 Lemme 1.7, p.15). Apply the classification there; compatibility of the Montreal functor with coefficient restriction gives `dim_k V(π)=[k_π:k] dim_(k_π) V(π)`. Descent retains the distinct coefficient-conjugate constituents.

(i)–(iii): compute `D(Π)` for each irreducible from the explicit `D^♮_{W_r}(Π(r, λ))` (Colmez Théorème IV.2.1) and the description of principal series (Proposition III.3.8).

(iv): `D(Π)` is irreducible of rank 2 for supersingular `Π` and identified by the action of `Γ` on `D^♮/T` together with determinants (Colmez Proposition VII.4.2, with Proposition VII.3.4 and Corollaire VII.3.5 for `D^♮(ind ω₂^{−r})`).

(v): Breuil's Corollaire 1.4, from his Théorèmes 1.1 and 1.3 and the matching isomorphisms between the `ρ(r, χ)`.

(vi): Colmez Théorème 0.11(i) and §VII.2.

**Checks.**

- `V(B(1, 1)) = V(Ind_B^G(1 ⊗ ω^{−1})) = k_L`.
- For every `p`, `V` of an absolutely irreducible supersingular `Π` over splitting coefficients is induced from a character of `G_{ℚ_{p²}}` (an `ind(ω₂^s)` up to twist).
- `dim_(k_L) V(π)≤2` for every absolutely irreducible `π` over the splitting finite residue field.
- At `p=5`, take `λ∈𝔽₁₂₅×` of order 31. Restriction of scalars of `B(μ_λ,μ_(λ⁻¹))` to `𝔽₅` is irreducible: its three coefficient conjugates are distinct. Its Montreal image is the restriction of `μ_λ` and has `𝔽₅`-dimension 3, while its dimension over `k_π=𝔽₁₂₅` is 1.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Théorème 0.10 and Théorème 0.11, p. 13; Proposition VII.4.2, p. 210; Propositions VII.3.3–VII.3.4, pp. 206–207; [Colmez–Dospinescu–Nizioł, CDN23](#ref-cdn23), Lemme 1.7, p.15; [Christophe Breuil, BREUIL03](#ref-breuil03), Corollaire 1.4 and the paragraph before it, pp. 3–4.

*Needs:* [§3.2](#section-3-2); [§2.7](#section-2-7); [§2.6](#section-2-6).

<a id="section-3-4"></a>

### 3.4 Reconstruction of `Π` from `D(Π)`: `β_{ℙ¹}` and the contragredient

Let `Π ∈ Rep^{tors}G` have no finite quotient, central character `δ_Π, D = D(Π)` and `δ = δ_Π^{−1}`. (i) `β_{ℚ_p}` : `Π^∨ → D ⊠_δ ℚ_p, μ ↦ (β_{ℤ_p}((p^n 0; 0 1)μ))_n`, is `B`-equivariant with kernel `(Π^∨)^U`, image in `D^♯ ⊠ ℚ_p` containing `D^♮ ⊠ ℚ_p`, with image equal to `D^♮ ⊠ ℚ_p` when `Π` has no finite subrepresentation. (ii) `β_{ℙ¹}` : `μ ↦ (β_{ℤ_p}(μ), β_{ℤ_p}(wμ))` is an injective `G`-equivariant map `Π^∨ → D ⊠_δ ℙ¹` with `Res_{ℚ_p} ∘ β_{ℙ¹} = β_{ℚ_p}`, landing in `{z : Res_{ℚ_p}z ∈ D^♯ ⊠_δ ℚ_p}`; the subspace `D^♮ ⊠_δ ℙ¹ = {z : Res_{ℚ_p}z ∈ D^♮ ⊠_δ ℚ_p}` is a `G`-stable compact open containing the image of the orthogonal of `Π^{SL₂(ℚ_p)}` with finite index, and its dual agrees with `Π` in the quotient category by finite `O_L`-length representations, with the finite kernel and cokernel retained. (iii) The contragredient `Π̌ := (D ⊠_δ ℙ¹)/β_{ℙ¹}(Π^∨)` lies in `Rep^{tors}G`, has no finite quotient, and its contragredient is `Π`. Examples: `B(δ₁, δ₂)ˇ ≅ B(δ₂, δ₁) ⊗ δ_Π^{−1}`; Šť is a non-split extension of `B(1, ω)` by 1; `Π̌ ≅ Π ⊗ δ_Π^{−1}` for supersingular `Π`.

Here `Π ∈ Rep^{tors}G` without finite quotient; `F = ℚ_p`.

`β_{ℚ_p}`: Proposition 0.12 and §IV.3.1 (Lemme IV.3.1: the kernel of `α_{ℤ_p,W}` has finite length).

The key identity `β_{ℤ_p^×} ∘ w = w_δ ∘ β_{ℤ_p^×}` (Proposition IV.4.2) gives that `β_{ℙ¹}` lands in `D ⊠_δ ℙ¹` and is `G`-equivariant (Théorème IV.4.7).

Name these maps `Reconstruction.betaQp`, `Reconstruction.betaP1` and the quotient `Reconstruction.contragredient`, with `Reconstruction.contragredient_involutive` and `Reconstruction.res_betaP1` for the stated identities.

`G`-stability and duality of `D^♮ ⊠_δ ℙ¹` (Théorème IV.4.1) and the contragredient statements (Théorème 0.14, §IV.4.5, Proposition IV.4.18).

**Checks.**

- For `Π` supersingular, `Π̌ ≅ Π ⊗ δ_Π^{−1}`.
- The contragredient of the contragredient is `Π`.
- At `Π=0` both `β` maps, both glued modules and the contragredient are zero.
- A nonzero character `η∘det` has `D(Π)=0` and hence `β_{ℙ¹}=0`. Its finite quotient violates the hypothesis: injectivity cannot be extended to all finite-length `Π`.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Proposition 0.12, Théorèmes 0.13 and 0.14, Exemples 0.15, p. 14; Théorème IV.4.1, p. 106; Proposition IV.4.2 and Théorème IV.4.7, pp. 107–110.

*Needs:* [§3.2](#section-3-2); [§3.1](#section-3-1); [§1.4](#section-1-4); [§2.6](#section-2-6).

<a id="section-3-5"></a>

### 3.5 Colmez's representation `Π(D)` and the correspondence `V ↦ Π(V)`

For a rank-two rational étale module `D`, let `δ_D=(x|x|)^{-1}α_D`. Choose an étale `O_E`-lattice `D₀`. The raw inverse image of `D₀^♮ ⊠ ℚ_p` in `D₀ ⊠_{δ_D}ℙ¹` is denoted `N_ns`; set `N_sat=`{`z:ϖ^n z∈N_ns` for some `n`}. The integral `D₀^♮ ⊠ℙ¹` is `N_sat`, and the rational subspace `D^♮ ⊠ℙ¹` is `L·N_sat`, independent of `D₀`. For torsion modules use the raw inverse image directly. When this submodule is `G`-stable, `Π(D)` is the corresponding quotient of `D ⊠ℙ¹`; `Π(V)=Π(D(V))`. The torsion submodule is compact open, the integral one is compact, and the rational one is closed; compact openness is not asserted rationally. Saturation may change the integral raw submodule by finite `O_L`-length and is needed for torsion-freeness of the quotient. Family construction and specialisation are the separate target [§3.6](#section-3-6); arbitrary base change over `Spec S` is not asserted.

Here `D` étale of rank 2 over `E` (or `O_E`, torsion); `G`-stability of `D^♮ ⊠ ℙ¹` is the theorem [§3.7](#section-3-7).

Use the following named operations and compatibility results.

- `PiOfD`: `Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹)` for `D` étale of rank 2.
- `PiOfD.ofRep`: `Π(V) := Π(D(V))` for two-dimensional `V`.
- `PiOfD.centralChar`: `Z` acts on `Π(D)` through `δ_D = (x|x|)^{−1}α_D`, i.e. `Π(V)` has central character `det(V)·ε^{−1}` read through [§1.2](#section-1-2).
- `PiOfD.twist`: `Π(D ⊗ η) ≅ Π(D) ⊗ (η∘det)` for unitary `η`.
- `PiOfD.reduction`: Reduction and inverse limits use the unsaturated integral quotient; passing to its torsion-free quotient accounts for the finite `O_L`-length saturation discrepancy. Do not assert equality of saturated fibres under arbitrary base change.
- `PiOfD.family`: The family construction and its `O_L`-valued specialisation maps are specified by [§3.6](#section-3-6), with finite-free coefficients and saturation distinguished.
- `PiOfD.maximal`: `Π(V)` is the largest unitary residually finite length representation `Π` with `V(Π) ≅ V` and `Π^{SL₂(ℚ_p)} = 0` (the last condition because `V` kills `Π^{SL₂(ℚ_p)}`).

Use Colmez §II.2.1 to form the raw inverse image and its integral saturation, and invert `ϖ` for the rational construction.

Under `G`-stability, Lemma II.2.10 puts the quotients in their respective torsion, integral and rational representation categories; the integral quotient is the raw inverse-limit quotient modulo `O_L`-torsion.

Twisting follows from the glued module and saturated submodule. The maximality statement for `Π(V)` uses Colmez Theorem 0.17 with its stated `SL₂`-invariant condition.

**Checks.**

- `PiOfD.centralChar_cyclotomicDet`: If `det V = ε` then `Π(V)` has trivial central character.
- `PiOfD.rank_one_excluded`: For `D` of rank 1 the module `D^♮ ⊠ ℙ¹` is not `G`-stable in general, so `Π(D)` is not defined: the construction is special to rank 2.
- `PiOfD.V_Pi`: `V(Π(V)) ≅ V` for `V` absolutely irreducible of dimension 2 ([§3.7](#section-3-7)).
- `PiOfD.saturation_torsion_free`: For a free integral rank-two `D₀`, a class killed by `ϖ` in the quotient by `N_sat` is zero; the raw quotient by `N_ns` need not pass this test.
- For `D` of rank 2 with `det V(D) = χ, δ_D = 1` and `Π(D)` has trivial central character.
- `Π(D ⊗ η) = Π(D) ⊗ (η∘det)` for a unitary character `η`.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), §II.2.1–II.2.2, pp.55–59 (Remark II.2.3 and Lemma II.2.10); Théorème 0.17, p.15; Remarque 0.18, pp.15–16; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN23](#ref-cdn23), §1.3.1, p. 17.

*Needs:* [§3.1](#section-3-1); [§1.3](#section-1-3); [§1.4](#section-1-4); [§1.5](#section-1-5); [the Fontaine contract](#fontaine-contract).

<a id="section-3-6"></a>

### 3.6 Colmez’s family stability theorem

Let `S` be a `p`-torsion-free complete local quotient of `O_L[[X₁,…,X_d]]` with residue field `k_L`, and `D` a finite free rank-two étale module over `S` completed-tensored with `O_E`. The family natural submodule `N_ns(D)` is the inverse limit of the torsion natural submodules. It is `G`-stable. For a continuous local `O_L`-algebra map `s:S→O_L`, the corresponding unsaturated quotient specialises to the unsaturated quotient for `D_s`, which surjects onto the saturated `Π(D_s)`. Coefficient extension gives the analogous `O_M`-valued points after extending the setup. No theorem of arbitrary `Spec S` base change or commutation of saturation with fibres is claimed.

Here the coefficient, finite-free, topology and residue hypotheses above; central character `δ_D` determined by the determinant.

Construct the family over finite Artinian quotients as in §II.2.4.

Apply the family closedness criterion, Lemma II.3.6, to the crystabelline stability computation. The residual-prime density and coefficient/lattice descent for this step are the theorem of §3.6a, independent of the subsequent bijection.

Use Proposition II.2.15 for specialisation of the unsaturated construction, followed by saturation on the fibre.

**Checks.**

- For `S=O_L` the family statement reduces to integral rank two.
- Specialisation of a raw quotient is distinguished from its saturated torsion-free quotient.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), §II.2.4, pp.60–61, Proposition II.2.15; Theorem II.3.3 and Lemma II.3.6, pp.63–64; §II.3.4, pp.69–70.

*Needs:* [§3.5](#section-3-5); [§0.4](#support-deformations); [§3.6a](#section-3-6a).

<a id="section-3-6a"></a>

### 3.6a Crystalline density and coefficient descent for existence

Prove **`CorrespondenceSupport.crystallineDensity_descent`** in the full framed deformation spaces of §0.4, before using §3.6's closed stability locus. For each two-dimensional characteristic-zero `V`, allow a finite coefficient extension and a stable lattice whose residual representation has a Zariski-dense set of benign irreducible crystalline points in its framed generic fibre. Retain the full residual case division: all classes for `p≥5`; at `p=3` the cyclotomic-extension and induced `ω₂²` classes as well as the other classes; at `p=2` nonscalar residual semisimplification and the scalar case separately. This is density in the full framed space used to extend stability, with no fixed-Hodge-type or arbitrary fixed-determinant density assertion. For scalar dyadic semisimplification, twist its character away and use the framed deformation ring of the trivial residual representation. After a finite coefficient extension every characteristic-zero representation with trivial residual semisimplification has a lattice with trivial residual representation. Prove that natural lattices commute with finite coefficient extension, `(O_L′⊗_O D₀)^♮=O_L′⊗_O D₀^♮`, and that `G`-compatibility descends faithfully along that extension and is preserved by character twists. Thus a lattice change or coefficient extension does not restrict the final existence theorem. Sources: Colmez II.3.2–II.3.4 and footnote 7, pp.15–17, 63–70, for the original residual cases; Colmez–Dospinescu–Paškūnas, **CDP-WILD**, Lemma 9.5, Theorem 9.6, Remarks 9.7–9.8 and the proof of Theorem 10.1, pp.13–16, for the dyadic density and descent.

**Checks.**

- At `p=2`, a nonsplit lattice extension of the trivial residual character by itself need not itself have trivial reduction. Lemma 9.5's finite extension and change of lattice place its characteristic-zero representation on the trivial-residual framed space; residual semisimplification alone does not identify the two deformation functors.
- The trivial-residual dyadic generic fibre has two irreducible components. Benign crystalline points are dense in each, not just in one; closedness plus density in only one component would leave the other untreated.
- Twisting a scalar residual character away and then back preserves compatibility. Faithfully flat coefficient descent recovers compatibility over `L`, rather than an existence assertion only over `L′`.
- In CDP-WILD Theorem 10.1 the printed Galois output is `V_source(Π(D))=V(D)∨(1)`. Under the convention here `V(Π)=(V_source(Π))∨(1)`, the output is `V(D)` and the central character remains `χ⁻¹det V(D)`.

*Needs:* [§0.4](#support-deformations); [§1.6](#section-1-6); [§2.3](#section-2-3); [§3.4–§3.5](#section-3-4); the Fontaine contract.

<a id="section-3-7"></a>

### 3.7 Colmez's theorem: `Π(D)` is irreducible and `D(Π(D)) = Ď`

Let `D ∈ ΦΓ^et(E)` be irreducible of rank 2. (i) `D^♮ ⊠ ℙ¹` is stable under `G`. (ii) `Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹)` is a topologically irreducible object of `Rep_L G, D^♮ ⊠ ℙ¹ ≅ Π(D)* ⊗ δ_D`, so there is an exact sequence `0 → Π(D)* ⊗ δ_D → D ⊠ ℙ¹ → Π(D) → 0`. (iii) `D(Π(D)) = Ď`; equivalently `V(Π(V)) ≅ V` for every absolutely irreducible two-dimensional `V`. The proof of (i) uses §3.6's closed stability locus and §3.6a's benign crystalline density, with its exceptional residual cases and coefficient/lattice descent. CDP-WILD Theorem 10.1 closes the scalar dyadic existence case in the Tate-duality convention specified there.

Here `D` irreducible of rank 2 over `E`; `p` any prime, with density and descent supplied by §3.6a in every residual case.

Use [§3.6a](#section-3-6a)'s density and descent with the family-stability theorem to obtain `G`-stability and existence for all primes, independently of §3.8. Duality, Corollary II.2.12, and the rank-two wedge pairing give the exact sequence and identify `D(Π(D))` with `Ď`.

For irreducibility, use the absence of finite-dimensional subobjects and quotients, the dimension theorem for irreducible Galois images, and exactness. A finite-dimensional internal subquotient is not excluded merely by those endpoint vanishings. CDP's residual-finiteness, infinitesimal-character and Banach Schur arguments complete these comparisons after existence; they do not replace density. The supporting Schur target is `End_G(Π)=L` for absolutely irreducible admissible `Π`, as used in CDP Theorem 2.21, p.14, with Dospinescu–Schraen cited in its introduction, p.3.

**Checks.**

- For `V` crystalline irreducible with distinct Frobenius eigenvalues, `Π(V)` is the Berger–Breuil completion.
- `V(Π(V)) ≅ V`.
- An absolutely irreducible `V` with scalar dyadic residual semisimplification has the same existence and reconstruction conclusions after §3.6a; residual finiteness alone would not prove its stability.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Théorème 0.17, Remarque 0.18 and footnote 7, pp.15–17; Théorème II.3.1, Remarque II.3.2 and Théorème II.3.3, pp.62–63; [Colmez–Dospinescu–Paškūnas, CDP-WILD](#ref-cdp-wild), Theorem 10.1, pp.15–16; [Colmez–Dospinescu–Paškūnas, CDP14](#ref-cdp14), §1.1 and §1.3, pp.1–5.

*Needs:* [§3.5](#section-3-5); [§3.2](#section-3-2); [§3.4](#section-3-4); [§1.6](#section-1-6); [§0.4](#support-deformations); [§3.6](#section-3-6); [§3.6a](#section-3-6a).

<a id="section-3-8"></a>

### 3.8 The p-adic local Langlands correspondence for `GL₂(ℚ_p)`

(i) (Colmez–Dospinescu–Paškūnas; Paškūnas for `p ≥ 5`) `V` induces a bijection between isomorphism classes of absolutely irreducible non-ordinary `Π ∈ Ban^{adm}_G(L)` and absolutely irreducible two-dimensional continuous `L`-representations of `G_{ℚ_p}`; its inverse is `V ↦ Π(V)`. (ii) Every absolutely irreducible `Π ∈ Ban^{adm}_G(L)` is residually of finite length, and after replacing `L` by its quadratic unramified extension `Π̄^{ss}` is absolutely irreducible supersingular or a subrepresentation of some `π{χ₁, χ₂}`. (iii) If `Π` is absolutely irreducible non-ordinary with central character `δ`, then `det V(Π) = δε`. (iv) An object of `Ban^{adm}_G(L)` has finite length iff it is residually of finite length. `(v) dim_L V(Π) ≤ 2` for every absolutely irreducible `Π`, with equality iff `Π` is non-ordinary. (vi) For absolutely irreducible non-ordinary `Π₁, Π₂`: `V(Π₁) ≅ V(Π₂) ⇒ Π₁ ≅ Π₂`, and `Hom_{L[P]}^{cont}(Π₁, Π₂) = Hom_{L[G]}^{cont}(Π₁, Π₂)`. (vii) For `p ≥ 5` (Paškūnas): if `Π` is absolutely irreducible with central character and `Θ` an open bounded `G`-stable lattice then `Θ ⊗ k` has finite length and either is absolutely irreducible supersingular or has semisimplification inside `(Ind_B^G χ₁ ⊗ χ₂ω^{−1})^{ss} ⊕ (Ind_B^G χ₂ ⊗ χ₁ω^{−1})^{ss}`, with equality iff `Π` is non-ordinary.

Here `L/ℚ_p` finite; `Π` admissible unitary with central character (automatic for absolutely irreducible `Π` by Dospinescu–Schraen's Schur lemma).

For `p≥5`, use Paškūnas’s projective-envelope method, with its endomorphism comparison and crystalline-density input; those key arguments are not formal consequences of the listed local categories.

For all `p`, construct the projective envelopes and their topological endomorphism algebras of §§5.1 and 5.3 first; identifying those algebras with deformation rings is a separate comparison. Existence uses §§3.6a–3.7, including scalar dyadic density and descent. The separate CDP arguments prove residual finiteness and injectivity using Schur’s lemma and the infinitesimal character on locally analytic vectors; these are subsequent inputs to the bijection.

The determinant follows from the central-character formula once the correspondence is established. Residual finite length for arbitrary finite-length objects uses dévissage and the lattice-independence theorem.

**Checks.**

- For `V` crystabelline irreducible, `Π(V)` is the Berger–Breuil completion and `V(Π(V)) = V`.
- The ordinary `Π` (characters, Ŝp `⊗ η`, unitary principal series) have `dim V(Π) ≤ 1`.

The source is [Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas, CDP14](#ref-cdp14), Theorem 1.1, p. 1; Corollary 1.2, p. 2; Theorem 1.4, p. 3; Corollaries 1.6–1.7, p. 4; Theorems 1.8–1.9, pp. 5–6; [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), Theorem 1.1, p. 2; Corollary 1.2 and Theorem 1.3, p. 3.

*Needs:* [§5.1](#section-5-1); [§5.3](#section-5-3); for the `p≥5` Paškūnas route, [§5.5](#section-5-5)(i)–(ii); [§3.7](#section-3-7); [§3.2](#section-3-2); [the Banach contract](#banach-contract); [§2.6](#section-2-6); [§2.4](#section-2-4); [§1.2](#section-1-2).

<a id="section-3-9"></a>

### 3.9 Injectivity of `V` on `Ext¹` of atoms

For an automorphic atom `Π` of `O_L`-torsion length at most three in Colmez’s list, the covariant Montreal functor induces an injection on fixed-central-character self-extension groups `Ext¹_G(Π,Π)→Ext¹_{G_{ℚ_p}}(V(Π),V(Π))`. No general `Ext` isomorphism is asserted here. Kisin’s comparison of whole deformation functors is a separate theorem: it requires representability and the full deformation argument in [§5.7](#section-5-7). Tangent-space injectivity and density of closed points alone do not identify nonreduced deformation schemes.

Here atoms of length `≤ 3` (the cases of length 4 occur only for `p = 2`, 3 and are not covered by Colmez's Théorème VII.5.2); central characters fixed.

Use Colmez Theorem VII.5.2: compute the atom self-extensions with the Jacquet functor and compare with the Galois extension groups.

The deformation comparison is not deduced here. Its schematic crystalline-closure input is specified in the schematic deformation comparison.

The schematic deformation comparison requires representability on all local Artinian coefficient rings, the closed-immersion argument, and the crystalline schematic-closure comparison of Emerton Theorems 3.3.13–3.3.14 and Kisin §1.6. Prove equality on nonreduced test algebras such as `k[ε]/ε²` and their higher nilpotent thickenings. Tangent injectivity plus a dense set of field-valued points does not give equality of the completed rings. This target is also needed for the universal-deformation and `Hom`-removal results of Layer 5.

**Checks.**

- The self-extension map has zero kernel on the automorphic atoms specified in the statement; a dimension equality is a stronger assertion requiring the separate deformation-comparison theorem.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §13.2, pp. 21–22; Théorème VII.5.2, p. 223.

*Needs:* [§3.2](#section-3-2); [§3.3](#section-3-3); [§1.6](#section-1-6).

<a id="section-3-10"></a>

### 3.10 Fontaine’s heart and the Weyl involution

For an irreducible rank-two rational étale module `D` with central character `δ_D`, define `C=(1−φ)D^{ψ=1}` and `C′=(1−δ_D(p)^{-1}φ)D^{ψ=δ_D(p)^{-1}}` inside `D^{ψ=0}`. The Weyl involution `w_{δ_D}` sends `C` bijectively onto `C′`. Construct `FontaineHeart.radiusComparison`: for a stable integral lattice and all sufficiently large radius indices `b≥m₂(D)`, base change of its heart over `O[[Γ]]` to the annular `Γ`-distribution algebra gives the whole `D^(0,r_b]⊠ℤ_p×`; also prove the open-annulus and Robba base-change comparisons. After inverting `p`, the rational heart is free of rank two over `Λ_L=L⊗_O O[[Γ]]`. Use Colmez Theorem V.1.12 and Corollary V.1.13, pp.121–122, together with Theorem I.5.2. This comparison extends `w` to `D†` and `D_rig`. For absolutely irreducible rank-two `D`, prove `FontaineHeart.oneSubPhi_injective` on `D^(ψ=1)`: its kernel is `D^(φ=1)`, which vanishes by the étale comparison and the absence of invariants under the cyclotomic kernel.

Here `D` irreducible rank two over `E`; the natural glued submodule is `G`-stable. Name the two subspaces `FontaineHeart.heart` and `FontaineHeart.twistedHeart`, with `FontaineHeart.weyl_heart` and `FontaineHeart.weyl_twistedHeart` for the two image equalities.

Use the restriction description of the natural glued submodule and its `G`-stability. Translate the `ψ`-eigenspace relation under `w` and the central action into the two displayed `(1−cφ)`-images, as in Proposition V.2.1.

Do not replace this argument with the formal `H¹` computation of a two-term `ψ` complex.

**Checks.**

- The second heart uses `ψ`-eigenvalue `δ_D(p)^{-1}`, not always 1.
- `w²=1` turns the two inclusions into `w(C)=C′` and `w(C′)=C`; it does not assert `C=C′`.
- If `ψz=cz`, then `ψ((1−cφ)z)=cz−cz=0`, using `ψφ=1`. This checks that the twisted heart really lies in `D^{ψ=0}`; taking the wrong `ψ`-eigenvalue fails this calculation.
- When `δ_D(p)=1` the defining formulas give `C′=C`; the formula with general `δ_D(p)` must specialise to this equality.
- For an absolutely irreducible rank-two `D`, `C` has `Λ_L`-rank two, so it is nonzero; a zero heart cannot satisfy the rank assertion.
- On that `D`, `(1−φ)z=0` and `ψz=z` imply `z=0`. Rank-one cyclotomic examples with nonzero cyclotomic-kernel invariants do not satisfy this absolute rank-two hypothesis.
- For every `b≥m₂(D)`, the natural annular base-change map of `C` is an isomorphism onto all of `D^(0,r_b]⊠ℤ_p×`, not just a proper submodule; its Robba extension likewise recovers `D_rig⊠ℤ_p×`.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Proposition V.2.1, p.125; Theorem I.5.2, p.44; Theorem V.1.12 and Corollary V.1.13, pp.121–122, for the radius comparison; §V.2 for its Weyl compatibility.

*Needs:* [§3.7](#section-3-7); [§3.1](#section-3-1); [§1.4](#section-1-4).

<a id="section-3-11"></a>

### 3.11 Locally analytic vectors of `Π(D)`

First construct `AnalyticBoxtimes.compatibleRadius` for a unitary character `δ` and a compatible pair `D∈C_L(δ)`, where `C_L(δ)` is the essential image of the torsion/integral Montreal construction after localization, as in CD14 §0.4. This condition is established for that image without the bijection on irreducibles. Construct the compatible quotient `Π_δ(D)` and its exact sequence with the Cartier-dual quotient. For sufficiently large radius index `b`, restriction to `D^(0,r_b]⊠_δℙ¹` gives the analytic-radius exact sequence of CD14 Theorems 0.8 and 0.10, pp.7–8. Prove the radius-norm and lattice estimates used in Theorem 0.7. These provide the compatible-module input to H-coherence; the irreducible specialization below follows after §3.7.

**Compatible-radius Checks.**

- At `D=0` all section and radius modules are zero, and their exact sequence is the zero sequence.
- A finite-dimensional Banach representation has zero Montreal module; the reconstruction is modulo finite-dimensional representations, so the radius comparison cannot identify it with the zero representation without that quotient.
- The congruence subgroup `1+p^mM₂(ℤ_p)` uses `m≥2` at `p=2`; `m=1` is not the source's uniform-group input.


Let `D ∈ ΦΓ^et(E)` be irreducible of rank 2 and `Π = Π(D)`. (i) `D† ⊠ ℙ¹ = {(z₁, z₂) ∈ D ⊠ ℙ¹ : z₁, z₂ ∈ D†}` is `G`-stable and its image in `Π(D)` is `Π(D)^{an}`; indeed `Π^{an} = (D† ⊠ ℙ¹)/L·(D^♮ ⊠ ℙ¹)`. (ii) The `G`-action extends continuously to `D_rig ⊠ ℙ¹`, with an exact sequence `0 → (Π(D)^{an})* ⊗ δ_D → D_rig ⊠ ℙ¹ → Π(D)^{an} → 0`, and `D^♮_rig ⊠ ℙ¹ = (Π̌^{an})*`. (iii) (Colmez–Dospinescu) `Π(D)` is the universal unitary completion of `Π(D)^{an}`. Here `D` is rational: `D^♮ ⊠ℙ¹` already means the `L`-span of the saturated integral submodule. An extra symbol `L·` does not mean that the integral compact lattice equals its rational span.

Here `D` irreducible of rank 2 over `E`.

Name the overconvergent and Robba section spaces `AnalyticBoxtimes.daggerSections` and `AnalyticBoxtimes.rigSections`, their analytic quotient `AnalyticBoxtimes.analytic_quotient`, and the displayed exact sequence `AnalyticBoxtimes.analytic_exact`. The twist on the left is by `δ_D∘det` as a character of `G`.

Apply [§3.10](#section-3-10), then the overconvergent heart/distribution comparison in the analytic Fontaine-heart comparison, to prove stability of `D† ⊠ℙ¹`.

Use Colmez Theorem V.2.20 and its extended pairing to obtain the locally analytic exact sequence.

Use the compatible-radius estimates above to prove `GL2Qp.analytic_coherent` and lattice commensurability in §2.5. Then apply its conditional coherent-lattice criterion to obtain (iii); (i)–(ii) do not use the universal-completion conclusion.

**Checks.**

- `Π(D)^{an}` is dense in `Π(D)`.
- For `D` crystabelline, `Π(D)^{an}` contains the locally algebraic principal series of [§4.3](#section-4-3).
- On a scalar matrix `a·1`, the contragredient analytic dual has character `δ_D(a)⁻¹`; twisting by `δ_D∘det` changes this to `δ_D(a)⁻¹δ_D(a²)=δ_D(a)`. Thus both ends of the Robba exact sequence have the central character of its middle term. Omitting the determinant in this twist fails the computation.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Théorème 0.19, p. 16; Proposition V.2.1, p. 125; Théorème V.2.20, p. 134; [Pierre Colmez, Gabriel Dospinescu, CD14](#ref-cd14), Théorème 0.2, p. 4.

*Needs:* for the compatible-radius construction, [§3.2](#section-3-2), [§3.4](#section-3-4) and the conditional criterion of [§2.5](#section-2-5); for (i)–(ii), [§3.7](#section-3-7), [§2.4](#section-2-4) and the analytic Fontaine heart; for (iii), the compatible-radius estimates and conditional completion criterion; PhiGammaModulesAndIwasawaCohomology §1.0; PhiGammaModulesAndIwasawaCohomology §2.6; [§3.10](#section-3-10).

### Examples

For `B(δ₁,δ₂)`, the central character is `ω⁻¹δ₁δ₂` and `V` returns `δ₁`; twisting both parameters by `η` twists `V` by `η`. A character `η∘det` is killed by `V`, so exactness does not imply faithfulness. For rank-two `D, Ď=D⊗δ_D⁻¹`; testing the determinant gives `det Ď=χ²(det D)⁻¹`, which fixes the cyclotomic factor in `δ_D`.

### Dependencies

Layers 1–2; PhiGammaModulesAndIwasawaCohomology §§1.0, 2.2–2.6 and 5.6a; §0.2 for the additional Hodge dictionary; the duality target of §0.3 and the measure supplier contract, family density, coherent lattices, Schur and schematic deformation comparisons specified above.

## Layer 4: Algebraic and analytic vectors and their completions

<a id="section-4-1"></a>

### 4.1 The algebraic and smooth factors `LL(V)` and `Alg(V)` of a de Rham `V`

Let `V` be a two-dimensional `L`-representation of `G_{ℚ_p}` that is de Rham with distinct Hodge–Tate weights `a < b` (§0.2 with the fixed Hodge–Tate sign as used by Colmez). Let `D_pst(V)` be its `(φ, N, G_{ℚ_p})`-module and `WD(V)` the attached Weil–Deligne representation, retaining its monodromy and any non-semisimple Frobenius data until the explicitly stated classical comparison (§0.2 with the raw Weil–Deligne carrier from SmoothRepresentationsOfLocalGroups SR.5.2). Put `LL(V) := LL(D_pst(V))`, the smooth representation of [§1.7](#section-1-7) (irreducible except for the `N = 0, δ ⊕ δ|·|` case, where it is the reducible principal series), `Alg(V) := W_{a, b−a} = Sym^{b−a−1}L² ⊗ det^a`, and `LL(V, a, b) := LL(V) ⊗ Alg(V)`, a locally algebraic representation of `G`. For `a (φ, N, G_{ℚ_p})`-module `M` and `a < b, LL(M, a, b) := LL(M) ⊗ W_{a,b−a}` depends on `M` and `(a, b)` only, not on the Hodge filtration. The set `F` of admissible filtrations on `M_dR` with jumps `−b<−a` may be empty; when nonempty it is `ℙ¹(M_dR)` with at most two points removed, and for `ℒ ∈ F, D_ℒ` denotes the étale `(φ,Γ)`-module of the weakly admissible filtered module `(M, ℒ)`.

Here `V` two-dimensional de Rham with distinct Hodge–Tate weights; the weight convention of Colmez (Théorème 0.20) is fixed by its dictionary to the arithmetic normalisation of §0.2.

Use the following named operations and compatibility results.

- `LocAlgType.smoothFactor`: `LL(V) := LL(D_pst(V))`.
- `LocAlgType.algFactor`: `Alg(V) := Sym^{b−a−1}L² ⊗ det^a`.
- `LocAlgType.locAlg`: `LL(V, a, b) := LL(V) ⊗ Alg(V)`.
- `LocAlgType.smoothFactor_twist`: `LL(V ⊗ η) = LL(V) ⊗ (η∘det)` for smooth `η`.
- `LocAlgType.indep_filtration`: `LL(V, a, b)` depends on (`D_pst(V)` as `(φ, N, G_{ℚ_p})`-module, `a, b`) only.
- `LocAlgType.admissibleFiltrations`: The weakly admissible filtration locus `F` with jumps `−b<−a`; it is either empty or the complement of at most two points of `ℙ¹(M_dR)`.
- `LocAlgType.irreducibleFiltrations`: `F_irr={ℒ∈F : V(D_ℒ) is irreducible}`. Equivalently, no nonzero proper `φ,N,G`-stable subobject with its induced filtration is weakly admissible. The action and algebraic/analytic filtration comparisons of §§4.2a–4.2b and 4.11 use this locus, with nonemptiness where a reference line is chosen.

`WD(V)` from `D_pst(V)` by the supplied Fontaine recipe and monodromy theorem of NoncommutativeAndEquivariantIwasawa §F.6, with §0.2's normalization comparison.

`LL(M)` from [§1.7](#section-1-7).

Independence of the filtration is by construction; the parametrisation of admissible filtrations by `ℙ¹(M_dR)` minus finitely many points is the Colmez–Fontaine theorem in rank 2 (§0.2’s weak-admissibility equivalence) applied to lines in `M_dR`.

**Checks.**

- `LocAlgType.algFactor_weights_0_1`: For Hodge–Tate weights `(0, 1), Alg(V)` is the trivial representation.
- `LocAlgType.algFactor_dim`: `dim Alg(V) = b − a`.
- For `V=L⊕L(χ)`, Hodge–Tate weights `(0,1)` give filtration jumps `(−1,0)` and `t_H=t_N=−1`, since crystalline Frobenius has eigenvalues `1,p⁻¹`. Filtration jumps `(0,1)` instead give `t_H=1` and fail weak admissibility. With `φ(e₁)=e₁, φ(e₂)=p⁻¹e₂` and `Fil⁰=Le₁`, the resulting line belongs to `F` and not `F_irr`: it recovers the reducible representation `L⊕L(χ)`.
- `LocAlgType.equal_weights_excluded`: For equal Hodge–Tate weights no `Alg(V)` is defined by this distinct-weight formula; if `V` is also absolutely irreducible then `Π(V)^{alg}=0` by [§4.2](#section-4-2). The irreducibility hypothesis is necessary for that vanishing criterion.
- `LocAlgType.crystalline_unramified`: For `V` crystalline with generic Frobenius eigenvalues `α, β, LL(V)` is unramified and `LL(V)^{K}` is one-dimensional.
- For `V` crystalline with distinct Frobenius eigenvalues `α, β (α/β ≠ p^{±1})` and weights `a < b, LL(V)` is the unramified principal series attached to the two unramified characters `μ_α, μ_β`, and `Alg(V) = Sym^{b−a−1} ⊗ det^a`.
- For a smooth character `η, LL(V⊗η)=LL(V)⊗(η∘det)`, while `Alg(V⊗η)=Alg(V)`. For a general de Rham character of weight `c`, the algebraic factor changes by `det^c` and the smooth factor uses its associated Weil–Deligne character; `η` itself need not be smooth.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Introduction §11, Théorèmes 0.20–0.21 and Remarque 0.22, pp. 17–18; §VI.6.11, p. 192; [Laurent Berger, Christophe Breuil, BB10](#ref-bb10), Introduction, p. 2.

*Needs:* [§1.7](#section-1-7); [§0.2](#support-hodge).

<a id="section-4-1k"></a>

### 4.1k Almost-de-Rham Kirillov construction

Here almost de Rham means integral Sen weights; use §0.2’s differential periods and construct the generalized period space `D_pdR,n` as the vectors in the differential-period realization killed by a power of `γ_n−1`, with its induced positive lattice. At dyadic levels retain the torsion invariants before choosing a generator. This is the generalized-period presentation of Colmez §VI.3.2, Proposition VI.3.1, pp.149–150.

Let `D ∈ ΦΓ^et(E)` be irreducible of rank 2, almost de Rham with Hodge–Tate weights `ℓ < ℓ+k`, where `ℓ∈ℤ` and `k≥1`. Put `D₀=D(−ℓ)=D⊗χ^{−ℓ}` and `Π₀=Π(D₀)`. Construct the period model first for `D₀`, whose weights are `(0,k)`. Its space `X^-_∞(D₀) ⊂ D̃_dif(D₀)/D̃⁺_dif(D₀)` is cyclic over `L_∞[t]/t^k`; choose a basis `f_(D₀)` of the one-dimensional quotient `D_pdR(D₀)/D_pdR⁺(D₀)` to identify these modules.

(i) For `z∈Π₀^{alg}`, define `K_z(x) f_(D₀)=ι^-_0((x 0;0 1)·z)` and its coefficients by `K_z(x)=Σ_(i=0)^(k−1) K_(z,i)(x)(tx)^i`. Then `σ_a(K_z(x))=K_z(ax)` for `a∈ℤ_p×`, each `K_(z,i):ℚ_p×→L_∞` is locally constant with compact support in `ℚ_p`, and `z↦K_z` is a bijection onto the algebraic Kirillov model. The ordinary coefficient of `t^i` is `x^i K_(z,i)(x)`.

(ii) For the original `Π=Π(D)`, if `Π^{alg}≠0`, it is of type `(ℓ,k)` and irreducible, except in the special case where it is an extension of `W_{ℓ,k}⊗(δ₀∘det)` by `W_{ℓ,k}⊗St⊗(δ₀∘det)` for a smooth `δ₀`.

(iii) For `D₀`, the map `z↦φ_z` gives a `B`-equivariant isomorphism `Π₀,c^{P−alg} ≅ LP_c(ℚ_p×,X^-_∞(D₀))^Γ`, with locally polynomial functions compactly supported in `ℚ_p×`. This compact subspace lies in `Π₀^{an}`, and lies in `Π₀^{alg}` when `Π₀^{alg}≠0`.

Transport (i) and (iii) to arbitrary `ℓ` using `PiOfD.twist`: `Π(D)≅Π₀⊗(ε^ℓ∘det)`. The function-space `B`-action is therefore multiplied by `ε(det g)^ℓ` for `g∈B`; its compact subspace is `Π_c^{P−alg}=Π₀,c^{P−alg}⊗(ε^ℓ∘det)`. On periods use the tensor identifications `D̃_dif(D₀)=D̃_dif(D)⊗L(χ^{−ℓ})` and `D̃⁺_dif(D₀)=D̃⁺_dif(D)⊗L(χ^{−ℓ})`, taking the positive generalized-period lattice by intersection in this realization. For the standard basis `e_(−ℓ)` of `L(χ^{−ℓ})`, the de Rham comparison is `v↦t^ℓv⊗e_(−ℓ)`, with `Fil^j D_dR(D₀)=t^ℓ Fil^(j−ℓ) D_dR(D)⊗e_(−ℓ)`. Thus normalization shifts the positive lattice in invariant period coordinates. The cyclic presentation and the coefficients `K_(z,i)` refer to the normalized model. These transported maps give the compact `P`-equivariant embedding into `Π(D)^{an}` used by consumers, with the same conditional inclusion in algebraic vectors.

Name the normalized maps and their twist transports `Kirillov.ofAlgebraicVector` and `Kirillov.ofPAlgebraicVector`, the transported subspace `Kirillov.compactPAlgebraic`, and the equivariance and bijectivity targets `Kirillov.gamma_equivariant` and `Kirillov.compactPAlgebraic_equiv`.

(i): Proposition VI.5.6 from Lemme VI.5.4 (the map `z ↦ φ_z = ι^-_0` on the `B`-orbit).

(ii): Théorème VI.5.7, from the Kirillov model and Proposition VI.2.12 on smooth representations with a Kirillov model.

(iii): Proposition VI.5.8 (surjectivity via an explicit lift in `Ñ_dif`), Corollaire VI.5.9 and Proposition VI.5.12(i).

**Checks.**

- For `D` crystalline irreducible with weights `(0,k)`, normalization is the identity and the coefficients `K_(z,i)` of the algebraic Kirillov functions are locally constant with compact support in `ℚ_p`.
- If `V₀` is irreducible crystalline of weights `(0,1)`, then `V₀(1)` has weights `(1,2)` and `Fil⁰ D_dR(V₀(1))=0`. Its quotient `D_pdR/D_pdR⁺=D_dR/Fil⁰` has dimension two, and its polynomial period quotient is `L_∞[t]/t ⊕ L_∞[t]/t²`. Normalizing by `χ⁻¹` recovers a single length-one module; the weight gap alone does not give that presentation before twisting.
- At `k=2`, `K(x)=xt·1_(ℤ_p×)(x)` is `Γ`-equivariant and belongs to the compact model. Its `(tx)`-coefficient is the locally constant indicator, while its ordinary `t`-coefficient is `x·1_(ℤ_p×)(x)`, which is not locally constant on `ℤ_p×`. When `Π₀^{alg}≠0`, (iii) realizes it by an algebraic vector, including for the weights `(0,2)` crystalline example of §4.9.
- `Π₀,c^{P−alg} ≅ ⊕_{i∈ℤ} X^-_∞(D₀)` via `z ↦ (ι^-_i(z̃))_i` (Lemme VI.5.10); twisting gives the corresponding `B`-module for `D`.
- The zero vector gives the zero function. Conversely a function with all values zero has preimage zero by the injectivity of the Kirillov map.
- A nonzero constant function on `ℚ_p^×` cannot lie in the compact `P`-algebraic model: its support is not compact in `ℚ_p^×`. Compact support in `ℚ_p` for the normalized coefficients `K_(z,i)` of an algebraic vector in (i) is a different condition, and may allow accumulation at zero.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), §VI.5.2–VI.5.4: weight normalization, p. 165; Proposition VI.5.6 and Théorème VI.5.7, p. 167; Proposition VI.5.8, Corollaire VI.5.9 and Lemme VI.5.10, p. 168; Proposition VI.5.12(i), p. 169.

*Needs:* [§3.5](#section-3-5), including `PiOfD.twist`; [§3.7](#section-3-7); [§3.11](#section-3-11); [§0.2](#support-hodge). The structural assertions are conditional on nonzero algebraic vectors and do not use the de Rham criterion.

<a id="section-4-1a"></a>

### 4.1a Localization, exponential conditions and the Weyl reciprocity bridge

Let `D` be absolutely irreducible of rank two and almost de Rham, normalized by a twist to weights `0,k` with `k≥1`. Use §4.1k’s generalized differential-period spaces and their positive lattices, including torsion invariants at dyadic levels. Put `V=V(D)`, `V̌=V∨(1)`, `Ď=D(V̌)` and `F_n=ℚ_p(μ_(p^n))`. Construct `AlgebraicReciprocity.localization`, the maps `c_(i,n)` from `C_rig(D)=(1−φ)D_rig^(ψ=1)` to `H¹(F_n,V⊗χ^i)`, by the supplied Iwasawa realization and integration against `χ^i` on `Γ_n`. Prove twist, restriction/corestriction and coefficient compatibility, with the sign matched to `1−φ`. Construct the maps for `Ď` as well. These are localizations of an Iwasawa class, not the definition of either heart in §3.10. Source: Colmez Introduction §12, pp.19–20, and §VIII.1, pp.227–230.

Use NoncommutativeAndEquivariantIwasawa §F.6’s general continuous fundamental-sequence boundary, `blochKatoExp` and `blochKatoHe=H¹_e`. Construct its Colmez presentation on `(D_pdR,n(V)/D_pdR,n⁺(V))^Γ_n`, with restriction agreeing with the supplied exponential on `D_dR/Fil⁰`. Construct `AlgebraicReciprocity.dualExp` on `H¹(F_n,V̌)` with values in `D_pdR,n⁺(V̌)/(γ_n−1)`, and put `H¹_(p−e)=ker(exp*)`. Transport these maps to every character twist. Prove `AlgebraicReciprocity.exp_adjunction`: for `W=V⊗χ^(-i)`, `x∈H¹(F_n,V̌⊗χ^i)` and `y∈(D_pdR,n(W)/D_pdR,n⁺(W))^Γ_n`, one has `(x,exp_W(y))_n=⟨exp*_W(x),y⟩_dif`. Its hypotheses are both `H⁰(H′,W)=0` and `H⁰(H′,W∨(1))=0`, where `H′=Gal(ℚ̄_p/ℚ_p^ab)`. Verify them for every integer `i`: the invariant space is a Galois subrepresentation, and an absolutely irreducible rank-two representation cannot factor through the abelian quotient. This also verifies the corresponding vanishing for the cyclotomic kernel used to invert `1−φ`. Source: Colmez §VIII.2, Lemma VIII.2.1 and Theorem VIII.2.2, pp.231–232; the opposite-character local pairing is §VIII.1, pp.229–230.

**Checks.**

- For any `x,y` with nonzero differential pairing, the local cup product against `exp(y)` has that same nonzero value; swapping to a zero pairing fails the adjunction.
- The two invariant-space vanishings hold for `V⊗χ^i` and its Tate dual for every integer `i`; the rank-one trivial and cyclotomic representations fail these hypotheses and cannot be used in this argument.
- The localization maps commute with passing from level `n+1` to `n` by corestriction and with the `i`-th character specialization; checking only untwisted level zero does not give the all-level condition.

Construct **`AlgebraicReciprocity.eHeart`** by `C_e(D)=∇_k(1−φ)N_rig^(ψ=1)⊂C_rig(D)`, where `∇=log(γ)/log(χ(γ))` and `∇_k=∏_(j=0)^(k−1)(∇−j)`. Here `N_dif,n` is the `L_n[[t]]`-span of the generalized period space `D_pdR`, and `N_rig` consists of the elements of `D_rig[1/t]` whose sufficiently deep localizations lie in `N_dif,n`. Prove the inclusion, linear-subspace structure, coefficient change and twist transport. Prove its localization characterization: `z∈C_e(D)` exactly when `c_(-i,n)(z)∈H¹_e(F_n,V⊗χ^(-i))` for every `0≤i≤k−1` and every `n`. The dual tests are on `V̌(i)`, since `(V(−i))∨(1)=V̌(i)`. In this localization convention the exponential list in Introduction §12, p.20, requires the exponent `−i`; its dual-exponential list retains `+i`. The body construction and the opposite twists agree with Proposition VI.4.15 and §VIII.1's local pairing. Sources: Colmez §VI.4.1–VI.4.3, pp.155–159; Propositions VI.4.13, VI.4.15 and Remark VI.4.14, pp.162–163; §VI.6.1, Lemma VI.6.6, p.174; §VIII.1–VIII.2, pp.229–232.

**Checks.**

- A class with `c_(-i,n)(z)∉H¹_e` at even one permitted twist and level is excluded, even if all its untwisted tests vanish.
- In the de Rham case, identify `C_e(D)=(1−φ)(t^kN_rig)^(ψ=1)`; its Robba-distribution extension is the nonzero rank-two submodule of §VI.6.1. This excludes a zero-subspace definition.
- At each localization the exponential-image condition excludes the negative/constant obstruction in the differential periods. Replacing `H¹_e` by `H¹_f` already changes the local condition for the trivial representation, where `H¹_e=0` and the unramified finite class is nonzero.
- For §4.9's crystalline example at `p=5` with weights `0,2`, `V(1)` has `Fil⁰=0` and crystalline Frobenius eigenvalue `5⁻²`. The exponential sequence and local Euler characteristic give `H¹_e(F_n,V(1))=H¹(F_n,V(1))`. Moreover `c_(0,n)(∇y)=0` for every `y∈C_rig(D)`, since the finite-level cyclotomic action has zero Lie derivative. Thus tests at `0,+1` admit every `∇y`. But `C_rig(D)/C_e(D)≅R⁺(Γ)/(∇(∇−1))` by Lemmas VI.6.6 and VI.6.14; for a lift `y` of 1, `∇y∉C_e(D)`, as evaluation at weight 1 shows. The test at `−1` excludes it.
- For `k=1`, the only index is zero, so reversing the exponential twist sign is invisible; the weight-gap-two case is necessary to distinguish the two conditions.

Construct **`AlgebraicReciprocity.dualPEHeart`**, the subspace `C_(p−e)(Ď)⊂C_rig(Ď)` cut out by `exp*(c_(i,n)(z))=0` in the dual-exponential target for `V̌⊗χ^i`, for every `0≤i≤k−1` and every `n`. These are paired with the negative twists `V⊗χ^(-i)` in the exponential condition. Its image under `z↦z⊗δ_D` is `C′_(p−e)(D)`. Give linearity, coefficient change, twist transport and the kernel/annihilator comparison induced by the paired-twist adjunction. Source: Colmez Introduction §12, p.20; §VIII.1, pp.229–230, Theorem VIII.2.2, pp.231–232, and Theorem VI.6.8, p.175.

**Checks.**

- A nonzero dual exponential at one permitted `(i,n)` excludes the class, even when its localizations at other levels have zero dual exponential.
- If a localization pairs nontrivially with an exponential image, adjunction excludes it from the corresponding dual-exponential kernel; requiring only the localization itself to be zero would discard the kernel's nonzero classes.
- In the de Rham case the twisted Robba extensions of `C_e(D)` and `C_(p−e)(Ď)` agree under the rank-two dual identification; in the non-de Rham case they differ, as detected by the complementary exponential and dual-exponential period conditions.

Prove **`Kirillov.algebraicRestriction_surjective`** for this irreducible almost-de-Rham `D` of weights `0,k`, using the body-defined `C_e(D)` and its negative-twist localization characterization above. At radius `r=r_(m(D))`, put `M_e=(D]0,r]⊠ℤ_p×)+⋃_n λ_(k,n)⁻¹C_e(D)`, where `λ_(k,n)=∏_(j=0)^(k−1)(γ_n−χ(γ_n)^j)` and the inverse images are taken in `D_rig⊠ℤ_p×`. The differential-period map identifies `M_e/(D]0,r]⊠ℤ_p×)` with `⊕_(i≥m(D)+1)(X⁻⊠p⁻ⁱℤ_p×)`. Restriction of `P`-algebraic lifts lands in `M_e`. If `Π^{alg}≠0`, restriction of the full algebraic-vector space surjects onto that quotient, by §4.1k's compact Kirillov bijection and conditional inclusion. This is the precise generation statement used in the non-de-Rham argument. Source: Colmez Lemma VI.6.12 and the proof of Theorem VI.6.13, pp.176–177; Corollary VI.5.9, p.168.

**Checks.**

- Each finite-support tuple of differential-period classes has a lift when `Π^{alg}≠0`; this is surjectivity of the full algebraic-vector image, not a claim about an arbitrary single vector.
- A lift differing by an element of `D]0,r]⊠ℤ_p×` has the same quotient image; the construction retains this kernel.
- In the non-de-Rham case the Weyl comparison forces the algebraic lifts into this kernel, whereas a nonzero algebraic-vector space would surject onto the nonzero period quotient. This contradiction proves vanishing. The zero algebraic-vector space gives no surjectivity assertion.

Prove `AlgebraicReciprocity.weyl_eHeart`, the equality `w(C_e(D))=C′_(p−e)(D)` for the body-defined exponential heart, equivalently the negative-twist exponential tests, and the positive-twist dual-exponential heart (Colmez Theorem VI.6.8, p.175; Theorem 0.25, p.20, with the exponential-index correction above). Then prove `AlgebraicReciprocity.weyl_stable_iff_deRham`: the Robba-distribution extension of `C_e(D)` is Weyl-stable exactly when `D` is de Rham (Proposition 0.26, p.20). Here its extension means its image under multiplication in `D_rig⊠ℤ_p×`, equivalently extension from `R⁺(Γ)` to `R(Γ)`; no tensor product over an unspecified ring is used. The rank-two dual identification, both vanishing hypotheses for `V(−i)` and `V̌(i)` in the reciprocity argument, and the distinct weights remain in these statements.

**Checks.**

- In the de Rham case the Weyl image is the same extended submodule, with rank two, and `w²=1` recovers it.
- In the almost de Rham but non-de Rham case the two extended submodules differ, so an involution on their ambient space alone does not prove stability.
- If `Π^{alg}≠0`, the preceding restriction theorem supplies the full period quotient. Its Weyl-stability obstruction forces de Rhamness; a zero image supplies no such conclusion.

*Needs:* [§0.2](#support-hodge); [§3.10](#section-3-10); [§3.11](#section-3-11); [§4.1](#section-4-1); [§4.1k](#section-4-1k); NoncommutativeAndEquivariantIwasawa §F.6; PhiGammaModulesAndIwasawaCohomology §§2.6 and 5.1.

<a id="section-4-2"></a>

### 4.2 Locally algebraic vectors of `Π(V)`: Colmez's theorem

Let `D ∈ ΦΓ^et(E)` be irreducible of rank 2, `V = V(D)` and `Π = Π(D)`. (i) `Π^{alg} ≠ 0` iff `D` is de Rham with distinct Hodge–Tate weights `a < b`; `Π^{alg} = 0` if `D` is not de Rham; if `Π^{alg} ≠ 0` then `D` is almost de Rham with distinct weights and `Π^{alg} = Π^{lc} ⊗ (Sym^{b−a−1} ⊗ det^a)` with `Π^{lc}` smooth admissible. (ii) Under the nonvanishing condition of (i), `Π^{alg}` depends, up to isomorphism, only on `D_pst` as `(φ, N, G_{ℚ_p})`-module and on `(a, b)`, not on the filtration. (iii) Under that same condition, if `dim J₀(Π^{alg}) = 2` then `D` is crystabelline and `Π^{alg} = LL(D_pst) ⊗ Alg`; if `dim J₀(Π^{alg}) = 1, D` is a locally algebraic twist of a semistable non-crystalline module and `Π^{alg} = LL(D_pst) ⊗ Alg`; if `dim J₀(Π^{alg}) = 0, D` is de Rham but becomes semistable over no abelian extension. (iv) Under that same condition, `Π^{alg}` is supersingular iff `V` is not trianguline. (v) For `V` de Rham with distinct weights, `Π(V)^{alg} ≅ LL(V) ⊗ Alg(V)` in Colmez’s convention; the conversion to Emerton’s printed weight formula is not asserted and remains the Emerton–Colmez convention comparison; in the potentially crystalline non-crystabelline (supercuspidal) case this identification is proved only by a global argument (Emerton, lg §7.4), subject to the supercuspidal comparison input.

Here `D` irreducible of rank 2 over `E`; (ii)–(v) assume `Π^{alg}≠0`, equivalently `V` de Rham with distinct weights; the supercuspidal case of (v) assumes the supercuspidal comparison input. The Emerton–Colmez convention dictionary remains the Emerton–Colmez convention comparison.

(i) non-de Rham: §4.1k constructs the almost-de-Rham Kirillov maps, and §4.1a proves the precise restriction-surjectivity lemma VI.6.12 after defining `C_e(D)`. Its explicit-reciprocity and Weyl comparisons force the algebraic lifts into the period-map kernel when `D` is not de Rham, contradicting surjectivity if algebraic vectors were nonzero. This gives VI.6.13.

(i) de Rham: nonvanishing by Lemme VI.6.19 (Théorème VI.6.18); the type `(ℓ,k)` structure and Theorem VI.5.7 are already the conditional results of §4.1k. Their de Rham consequences are §4.7.

(ii) is the separate target of [§4.2b](#section-4-2b), after [§4.2a](#section-4-2a) constructs the filtration-independent action on `N_rig⊠ℙ¹`. Neither result is an input to (i).

(iii): Théorème VI.6.50, from the Jacquet module `J₀` and `D_crab` (Théorème VI.6.30, Proposition VI.6.33).

(iv): Remarque VI.6.51(i) with the trianguline classification ([§1.6](#section-1-6)).

(v): crystabelline and semistable-twist cases from (iii); the remaining case by Emerton's global argument via (ii) — choose a modular `V'` with the same `D_pst` and weights (Emerton lg §7.4) — subject to the supercuspidal comparison input: completed cohomology of modular curves and the weight part of Serre's conjecture enter that argument.

For a supercuspidal smooth factor the available proof uses an auxiliary global modular representation with the same Weil–Deligne type and weights, its completed-cohomology realisation and the weight part of Serre's conjecture. This is the **supercuspidal comparison input**: that realisation must identify the smooth local factor, not merely match residual Galois traces. Colmez VI.6.42 and Emerton §7.4, pp.96–98, give the route; CDP footnote 5 and CDN–Kisin Remark 0.2(v) identify its global nature. A local proof of this smooth-factor identification is a supporting target here. The supercuspidal uses in the Kisin lattice, completion-classification, type-ring and cycle-criterion statements are conditional on the stated global realisation/comparison input. No completed-cohomology consumer is used as an earlier-layer theorem.

The Emerton convention conversion is another supporting comparison: reconcile his `MF` principal-series table and `π_p(V)`, including the `det^{b+1}` in Theorem 3.3.22 (p.28) with `det^b` in §7.4. Keep `V=MF(−)(ε)`, the induction order and the algebraic weight shift explicit. The displayed formulas in those two parts cannot be combined into a single unqualified `Π(V)=B(V)` identity. Check on a smooth character twist and on weights `(0,1)`; the latter must have trivial algebraic factor in the convention here.

**Checks.**

- For `V` de Rham with Hodge–Tate weights 0 and 1, `Alg(V)` is trivial and `Π(V)^{lisse} = Π(V)^{alg} = LL(V)` (CDN 2020 §0.2).
- For `V` crystalline irreducible with weights `0 < k−1, Π(V)^{alg}` is the locally algebraic principal series `LL(V) ⊗ Sym^{k−2}`.
- For `V` semistable non-crystalline with weights `0 < k−1, Π(V)^{alg} = (St ⊗ Sym^{k−2}) ⊗ δ` for the smooth `δ` of `D_crab`.
- For `V` not de Rham, `Π(V)^{alg} = 0` while `Π(V)^{an}` is dense.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Théorèmes 0.20–0.21, p. 17; Théorème 0.25 and Proposition 0.26, p. 20; Théorème VI.5.7, p. 167; Théorèmes VI.6.13 and VI.6.18, pp. 177–178; Théorème VI.6.42, p. 189; Théorème VI.6.50 and Remarque VI.6.51, pp. 192–193; [Matthew Emerton, EMERTON-LG](#ref-emerton-lg), Theorem 3.3.22 and Remark 3.3.23, p. 28; §7.4, pp. 96–98; [Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas, CDP14](#ref-cdp14), Theorem 1.3 and footnote 5, p. 2; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDNKISIN](#ref-cdnkisin), Remarque 0.2(v), p. 3; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN20](#ref-cdn20), §0.2, p. 4 and footnote 4 (arXiv).

*Needs:* For (i), [§4.1k](#section-4-1k), [§4.1a](#section-4-1a), [§4.1](#section-4-1), [§3.7](#section-3-7), [§3.11](#section-3-11), [§2.4](#section-2-4), [§1.6](#section-1-6) and [§0.2](#support-hodge). Part (ii) is proved in §4.2b after §4.2a; (iii)–(v) follow with that result, and (v) retains the supercuspidal comparison input.

<a id="section-4-2a"></a>

### 4.2a The differential-equation action before filtration comparison

For `M`, `a<b` and nonempty `F_irr` of §4.1, normalize the weights to `0,k` by twisting. Construct `AnalyticBoxtimes.filtrationIndependentAction` on `N_rig⊠ℙ¹`, where `N_rig` is the supplied unfiltered differential equation attached to `M`. Construct the chartwise Weyl maps from `D_ℒ` for `ℒ∈F_irr`, prove the radius-extension and duality comparisons, and show that all these maps give the same `G`-action. Prove this independence from the compact gluing and the skeleton formulas: compare the Weyl operators, eliminate their scalar discrepancy by the stable natural lattice, and extend from the two charts. Irreducibility gives `D_nr=0` in the annular-to-global comparison; weak admissibility alone does not. This is Proposition VI.6.41; algebraic filtration independence is its consequence in §4.2b. Source: Colmez §VI.6.9, Corollary VI.6.40 and Proposition VI.6.41, pp.188–189.

**Checks.**

- For two lines in `F_irr`, the Weyl maps agree on the common annular sections and hence on `N_rig⊠ℙ¹`; separate actions on isomorphic underlying spaces are insufficient.
- The resulting Weyl operator squares to 1 and agrees with each `D_ℒ` on its embedded overconvergent sections.
- For weights `0,k`, the submodule `t^kN_rig⊠ℙ¹` and the natural intersection used in §4.2b are `G`-stable; replacing the filtered lattice by the unfiltered equation does not identify the individual Banach quotients.

*Needs:* [§4.2(i)](#section-4-2) only; [§4.1](#section-4-1); [§3.4–§3.7](#section-3-4); [§3.11](#section-3-11); [§0.2](#support-hodge).

<a id="section-4-2b"></a>

### 4.2b Algebraic filtration independence

Prove `LocAlgType.algebraicVectors_indep_filtration`, the assertion §4.2(ii): for `ℒ₁,ℒ₂∈F_irr`, the locally algebraic representations `Π(D_ℒ₁)^(alg)` and `Π(D_ℒ₂)^(alg)` are isomorphic. Use §4.2a’s common `G`-action and the intersection exact sequence of Colmez Theorem VI.6.34: its filtration-independent middle term determines the algebraic constituents. This proof uses neither §4.11’s analytic quotient nor the supercuspidal smooth-factor identification. Source: Colmez Theorem VI.6.34, p.185, Proposition VI.6.41 and Theorem VI.6.42, p.189.

**Checks.**

- At weights `(0,1)`, distinct lines in `F_irr` give isomorphic smooth-vector representations, including the supercuspidal case.
- For `a<b`, the common algebraic factor still has dimension `b−a`; changing the filtration does not change that factor.
- Distinct lines in `F_irr` can give distinct Banach completions; algebraic isomorphism does not assert analytic or Banach isomorphism.

*Needs:* [§4.2a](#section-4-2a); [§4.2(i)](#section-4-2) only; [§4.1](#section-4-1); [§3.11](#section-3-11).

<a id="section-4-3"></a>

### 4.3 Berger–Breuil: unitary completions of locally algebraic principal series

Let `V` be an absolutely irreducible two-dimensional `L`-representation of `G_{ℚ_p}` that becomes crystalline over an abelian extension of `ℚ_p` and is `φ`-semisimple, with Hodge–Tate weights `a < b`. Let `B(V)` be the p-adic completion of the locally algebraic representation `Alg(V) ⊗ Lisse(V)` (a locally algebraic principal series) with respect to a `G`-stable `O`-lattice finitely generated as an `O[G]`-module, as in §2.5. Then `B(V)` is nonzero, topologically irreducible and admissible, and it is the universal unitary completion of `Alg(V) ⊗ Lisse(V)`; its dual is identified with the `ψ`-limit `(lim_ψ D(V))_b`. With Colmez's construction, `B(V) ≅ Π(V)`.

Here `V` crystabelline, `φ`-semisimple and absolutely irreducible; `p` any prime as in Berger–Breuil’s setup. Use their modified locally algebraic model when the usual irreducible smooth factor is one-dimensional. Kisin’s separate theorem retains `p>2`.

Construct `B(V)` as the completion of the locally algebraic principal series ([§2.5](#section-2-5)).

Identify `(lim_ψ D(V))_b` with `B(V)*` (Berger–Breuil Théorème 5.2.7) using the `(φ,Γ)`-module of the crystabelline `V` and the Amice transform ([the Fontaine contract](#fontaine-contract)).

Nonvanishing, topological irreducibility and admissibility: Corollaires 5.3.1–5.3.3.

`B(V) ≅ Π(V)`: compare Théorème 5.2.7 with Colmez's `Π(D)* ≅ D^♮ ⊠ ℙ¹ ⊗ δ_D^{−1}` ([§3.7](#section-3-7)) as in Kisin's proof of Theorem (1.2.8).

**Nonspecial crystalline completion.** For every prime `p`, let `s=(δ₁,δ₂,ℒ)∈S_irr∩S_*^cris` and put `κ(s)=w(δ₁)−w(δ₂)`. Assume `s` is nonspecial, meaning `δ₁≠x^{κ(s)−1}εδ₂`. Write `B^an(δ₁,δ₂)=(Ind_B^G(δ₂⊗δ₁ε⁻¹))^an`, the induction of §4.8, and let `B^alg(δ₁,δ₂)` be its subspace of locally `SL₂(ℚ_p)`-algebraic vectors. Then `Π(V(s))` is its universal unitary completion: every continuous `L`-linear `G`-map from this factor to a unitary `L`-Banach representation extends uniquely to `Π(V(s))`. This includes exceptional parameters `δ₁=x^{κ(s)}δ₂`, which in the crystalline range have double-root Frobenius and need not be `φ`-semisimple. In the crystalline case with weights `a<b`, the factor is the correctly normalized `LL(V(s))⊗Sym^{b−a−1}L²⊗det^a`. On the overlap its completion is the Berger–Breuil `B(V)` above. Source: [Colmez–Dospinescu–Paškūnas, CDP14](#ref-cdp14), §3.3.4, Theorem 3.23(a) and its exceptional-case proof, pp.25–26.

**Nonspecial completion Checks.**

- With distinct crystalline Frobenius eigenvalues and nonspecial parameter, the two completion maps agree by their universal properties.
- At `p=2`, take `φ(e₁)=p⁻¹e₁`, `φ(e₂)=p⁻¹(e₂+e₁)`, `N=0`, `Fil⁻²D=D`, `Fil⁻¹D=Fil⁰D=Le₂` and `Fil¹D=0`. Then `t_H=t_N=−2`, while the unique Frobenius-stable line `Le₁` has `t_H=−2<t_N=−1`, also after coefficient extension. This gives an absolutely irreducible crystalline double-root example of weights `(0,2)` covered by the nonspecial theorem and outside the `φ`-semisimple Berger–Breuil range.
- At a special parameter `δ₁=x^{κ(s)−1}εδ₂`, CDP Theorem 3.23(c) completes the extension `E_ℒ`; the nonspecial completion theorem does not replace it by the locally algebraic factor.

**Checks.**

- For `V` crystalline irreducible with Hodge–Tate weights 0, `k−1` and distinct Frobenius eigenvalues, `B(V)` is the completion of `LL(V) ⊗ Sym^{k−2}, LL(V)` the unramified principal series of [§4.1](#section-4-1).
- `B(V)^{alg} = Alg(V) ⊗ Lisse(V)`.
- The locally algebraic principal series is infinite-dimensional over `L`; an `O`-finite module would span only a finite-dimensional space. Finite generation here is by finitely many `G`-orbits.

The source is [Laurent Berger, Christophe Breuil, BB10](#ref-bb10), Introduction, pp. 2–3 (main Théorème); Théorème 4.3.1, pp.38–39; Théorème 5.2.7, p. 51; Corollaires 5.3.1–5.3.3, p. 52; [Mark Kisin, KISIN09](#ref-kisin09), Theorem (1.2.8), published p.650.

*Needs:* [§2.5](#section-2-5); [§4.1](#section-4-1); [the Fontaine contract](#fontaine-contract); [§3.7](#section-3-7); [§1.6](#section-1-6) and its dyadic parameter classification for the all-prime completion.

<a id="section-4-4"></a>

### 4.4 Henniart's `K`-types `σ(τ), σ^cr(τ)` and `σ(w, τ)`

For any nonarchimedean local field `F`, put `K_F=GL₂(O_F)` and let `s` be a supercuspidal inertial class of `GL₂(F)`. Over algebraically closed characteristic-zero coefficients, construct a smooth irreducible `K_F`-type for `s`: for every smooth irreducible admissible `π`, its `K_F`-Hom into `π` has dimension one if `π` belongs to `s` and zero otherwise. In particular, unramified twists of a supercuspidal representation have the same type and multiplicity one. This is the common supercuspidal occurrence construction; its `F=ℚ_p` specialization is the supercuspidal case of `HenniartType.sigma` and `HenniartType.hom_ne_zero_iff` below. For absolutely irreducible models of the type `σ` and `π` over a sufficiently large finite p-adic coefficient field `E`, prove `E′⊗_E Hom_(K_F)(σ,π) ≅ Hom_(K_F)(E′⊗_E σ,E′⊗_E π)` under coefficient-field extension `E′/E`, and descend the occurrence criterion by faithful flatness. Finite-dimensionality of the type and averaging over a compact open subgroup in its kernel in characteristic zero give this comparison. Sources: Henniart, Appendix to Breuil–Mézard, *Multiplicités modulaires et représentations de GL₂(ℤ_p) et de Gal(ℚ̄_p/ℚ_p) en ℓ=p*, §§A.1.1, A.1.3–A.1.5(1), author pp.74–76, and §A.3. The non-supercuspidal, algebraic-weight, crystalline and reduction constructions below are additional parts of this target.

Let `τ` : `I_{ℚ_p} → GL₂(L)` be a representation with open kernel that extends to `W_{ℚ_p}` (an inertial type). Henniart's theorem: there exists a smooth irreducible representation `σ(τ)` (resp. `σ^cr(τ)`) of `K = GL₂(ℤ_p)` on an `L`-vector space such that for every smooth absolutely irreducible infinite-dimensional representation `π` of `G, Hom_K(σ(τ), π) ≠ 0` (resp. `Hom_K(σ^cr(τ), π) ≠ 0`) iff `r_(rec_geo(π))|_{I_{ℚ_p}}≅τ` (resp. this inertial isomorphism and `N_(rec_geo(π))=0`), with the transported representation-to-parameter map of [§1.7](#section-1-7). `σ(τ) ≅ σ^cr(τ)` except for scalar `τ ≅ χ ⊕ χ`, where `σ(τ) ≅ s̃t ⊗ (χ∘det)` (`s̃t` the Steinberg representation of `GL₂(𝔽_p)` inflated to `K`) and `σ^cr(τ) ≅ χ∘det`. For a Hodge type `w = (a, b)` with `b > a` put `σ(w, τ) = σ(τ) ⊗ Sym^{b−a−1}L² ⊗ det^a` and `σ^cr(w, τ)` likewise; Kisin writes `σ(k, τ) = σ(τ) ⊗ Sym^{k−2}L²` for `w = (0, k−1)`. For a `K`-stable `O`-lattice `Θ ⊂ σ(w, τ), σ̄(w, τ) := (Θ/ϖΘ)^{ss}` is independent of `Θ`, and `m_σ(w, τ)` (resp. `m^cr_σ(w, τ)`) is the multiplicity of an irreducible smooth `k`-representation `σ` of `K` in `σ̄(w, τ)` (resp. `σ̄^cr(w, τ)`). For `p>2` these types are unique. At `p=2` choose a type with the required occurrence property; the semisimplified reductions `σ̄(w,τ)` and `σ̄^cr(w,τ)`, hence their multiplicities, are independent of that choice. Occurrence in an infinite-dimensional irreducible smooth representation has multiplicity one.

The half-norm Tate/unitary twists are unramified, so they change neither this inertial restriction nor the predicate `N=0`. Here `τ` of Galois type; the classical correspondence normalised as in [§1.7](#section-1-7) (Kisin §1.1: central character `τ̃|_{ℚ_p^×}`).

Use the following named operations and compatibility results.

- `HenniartType.sigma`: `σ(τ)`, the smooth irreducible `L`-representation of `K` attached to `τ`.
- `HenniartType.sigmaCris`: `σ^cr(τ)`.
- `HenniartType.hom_ne_zero_iff`: `Hom_K(σ(τ), π) ≠ 0` iff `r_(rec_geo(π))|_I≅τ`, for `π` absolutely irreducible infinite-dimensional; the crystalline variant also requires `N_(rec_geo(π))=0`.
- `HenniartType.sigmaCris_eq_sigma`: `σ^cr(τ) ≅ σ(τ)` unless `τ` is scalar.
- `HenniartType.sigmaW`: `σ(w, τ) = σ(τ) ⊗ Sym^{b−a−1} ⊗ det^a` and `σ^cr(w, τ)`.
- `HenniartType.reductionSS`: `σ̄(w, τ)`, the semisimplified reduction of a `K`-stable lattice, independent of the lattice.
- `HenniartType.mult`: `m_σ(w, τ)` and `m^cr_σ(w, τ) ∈ ℕ`.

Use the p-adic inertial-type occurrence theorem stated in Paškūnas 2016 §2.C; the coefficient-characteristic`≠p` inertia-multiplicity result in SR.5.2 does not supply it.

Choose a `K`-stable lattice in the finite-dimensional continuous locally algebraic type. Its reduction is smooth and factors through a finite quotient, so Brauer–Nesbitt gives independence of the lattice. The characteristic-zero algebraic factor need not factor through a finite quotient.

At `p=2` use the choice-independence assertion of Paškūnas 2016, published p.1326; existence and the dyadic choice-independence argument remain the p-adic `K`-type occurrence contract.

**Checks.**

- For odd `p`, supercuspidal `τ` over `ℚ_p` and an absolutely irreducible finite defining-field model, extension to an algebraic closure gives Hom dimension one in its inertial class and zero in a different class. Thus coefficient descent preserves the same occurrence theorem, rather than defining a second type.
- For arbitrary `F` and an unramified character `η`, the type occurs once in both `π` and `π⊗(η∘det)`; changing Frobenius alone cannot change the type. A principal series is outside the supercuspidal inertial class and its Hom from this type vanishes.
- When `τ` extends to an irreducible two-dimensional Weil representation, its monodromy is zero and the supercuspidal type serves both `σ(τ)` and `σ^cr(τ)`. This differs from the scalar-inertia case, whose two types have different dimensions.
- `HenniartType.sigmaCris_trivial`: `σ^cr(1)` is the trivial representation and `σ(1) = s̃t`, of dimension `p`.
- `HenniartType.mult_weight_two_trivial`: For `w = (0, 1), τ = 1`: `m^cr_σ = 1` for `σ` trivial and 0 otherwise.
- `HenniartType.sigma_scalar_ne`: For scalar `τ = χ ⊕ χ, σ(τ) ≇ σ^cr(τ)`: their dimensions are `p` and 1.
- `HenniartType.sigma_twist`: `σ(τ ⊗ χ) ≅ σ(τ) ⊗ (χ∘det)` for a character `χ` of `ℤ_p^×`.
- `HenniartType.dyadic_choice_independence`: At `p=2` two permitted choices of smooth type have the same semisimplified mod-`ϖ` reduction after tensoring with the fixed algebraic factor; do not require them isomorphic in characteristic zero.
- For `τ` trivial: `σ^cr(1)` is trivial and `σ(1) = s̃t`, so `m_σ(w, 1)` counts constituents of `s̃t ⊗ Sym^{b−a−1} ⊗ det^a` mod `ϖ`.
- For `w = (0, 1)` and `τ` trivial, `σ̄^cr(w, τ)` is the trivial representation of `K`.

The source is [Vytautas Paškūnas, PASKUNAS15](#ref-paskunas15), §1, p. 2; [Mark Kisin, KISIN09](#ref-kisin09), §1.1, published pp.645–646; [Vytautas Paškūnas, PASKUNAS16](#ref-paskunas16), §2.C, published pp.1325–1326 (arXiv pp.21–22).

*Needs:* [§1.7](#section-1-7); [§0.4](#support-deformations); [§2.8](#section-2-8); SmoothRepresentationsOfLocalGroups SR.0, SR.3.2 and SR.5.2 for smooth categories, inertial classes and characteristic-zero coefficient transport.

<a id="section-4-5"></a>

### 4.5 Kisin's Hypothesis (1.2.6): lattices containing the `K`-type

Let `p` be odd, `k ≥ 2, τ` : `I_{ℚ_p} → GL₂(E)` an inertial type of Galois type, `ψ` a continuous character with `ψ|_{I}` compatible with `τ`, and `σ(k, τ) = σ(τ) ⊗ Sym^{k−2}E²` the Henniart–Breuil–Mézard `K`-type ([§4.4](#section-4-4)). For every finite `E'/E` and every two-dimensional `E'`-representation `V` of `G_{ℚ_p}` that is potentially semistable of type `τ` with Hodge–Tate weights 0, `k−1` and determinant `ψ·χ_cyc` (Kisin's type `(k, τ, ψ)`), there exist an admissible `O_{E'}`-lattice `Θ` (p-adically complete and separated `O[G]`-module with `Θ/p^n` of finite length and admissible) with central character `ψ` such that `V(Θ) ⊗ ℚ_p ≅ V`, and a `K`-equivariant inclusion `σ(k, τ) ↪ Θ ⊗ ℚ_p`. For `τ` of abelian type the theorem follows (`τ` extends to an abelian representation of `W_{ℚ_p}`) from Kisin's Theorem (1.2.8); for every de Rham type it follows from Emerton (lg Theorem 3.3.22) together with Colmez's Théorème VI.6.50 (crystabelline and semistable cases) and [§4.2](#section-4-2), the supercuspidal types depending on the supercuspidal comparison input.

Here `p` odd (Kisin §1.0); types of Galois type; `V` of type `(k, τ, ψ)` in Kisin's sense (1.1). For non-abelian (supercuspidal) types the statement rests on [§4.2](#section-4-2) (v) and therefore on the supercuspidal comparison input.

Take `Θ` an open bounded `G`-stable lattice in `Π(V)` ([§3.5](#section-3-5)) with central character `ψ`, so `V(Θ) ⊗ ℚ_p ≅ V` ([§3.7](#section-3-7); for reducible `V` use the lattices `P(χ₁, χ₂)` in continuous principal series, Kisin Lemma (1.2.10)).

`Π(V)^{alg} ≅ LL(V) ⊗ Alg(V)` ([§4.2](#section-4-2)), and `Alg(V) = Sym^{k−2}` for weights 0, `k−1`.

Henniart's property of `σ(τ)` ([§4.4](#section-4-4)): `LL(V)|_K ⊇ σ(τ)` because `WD(V)|_I ≅ τ`; hence `σ(k, τ) ↪ Π(V)^{alg} ⊂ Π(V) = Θ ⊗ ℚ_p`.

Abelian types: Berger–Breuil and Colmez give the completion directly (Kisin Theorem (1.2.8), [§4.3](#section-4-3)).

**Checks.**

- For `τ` trivial and `k=2, σ(2,1)` is the inflated finite Steinberg representation, of dimension `p`. A nonzero `K`-fixed vector is the test for the crystalline type `σ^cr(2,1)=1`, not for `σ(2,1)`.
- The hypothesis holds for all de Rham `V` with abelian type unconditionally.

The source is [Mark Kisin, KISIN09](#ref-kisin09), Hypothesis (1.2.6), (1.2.7) and Theorem (1.2.8), published pp.649–650; [Matthew Emerton, EMERTON-LG](#ref-emerton-lg), Theorem 3.3.22, p. 28 and §7.4, pp. 96–98; [Luis Dieulefait, Ariel Pacetti, DP22](#ref-dp22), Proof of Theorem 1.4, p. 4.

*Needs:* [§4.2](#section-4-2); [§4.3](#section-4-3); [§3.5](#section-3-5); [§3.7](#section-3-7); [§4.4](#section-4-4).

<a id="section-4-6"></a>

### 4.6 Classification of unitary completions; weights do not determine `Π`

Let `π` be an admissible absolutely irreducible infinite-dimensional smooth `L`-representation of `G` and `W=Sym^{k−1}L²⊗det^a`, with `k≥1`. After the finite coefficient extension needed for the half-norm and the `(φ,G_(ℚ_p))` realization, let `R_π` be the underlying Weil representation of `rec_geo(π)⊗ν_geo^(1/2)`, using [§1.7](#section-1-7). This is Frobenius-semisimple.

**Raw Weil lift.** Define `Δ_π=R_π` unless `R_π=δ⊕δ`. In that case let `Δ_π` be the nonsplit self-extension of `δ` with finite inertia image: on `Le₁⊕Le₂` its Weil action is `r(w)=δ(w)(1+deg(w)U)`, where `U(e₁)=0` and `U(e₂)=e₁`. Compare period modules with this raw Weil representation through §0.2's period-to-Weil dictionary on the chosen coefficient component. Prove independence up to isomorphism of the nonzero extension coordinate, compatibility with coefficient extension and character twists, and the normalized comparison `Δ_π^(F-ss)≅R_π` as Weil representations. This construction leaves monodromy unspecified. Sources: [Colmez, COLMEZ10](#ref-colmez10), §VI.6.11, p.192, the nonsplit self-extension case of `LL(M)`; [CDP14](#ref-cdp14), Theorem 1.3, p.2, and Theorem 3.23(a), pp.25–26; the rank-two finite-inertia extension calculation gives the displayed lift.

Prove that every raw period module whose Weil Frobenius semisimplification is `R_π` and which admits an absolutely irreducible weakly admissible filtration with jumps `−a−k,−a` has underlying raw Weil representation `Δ_π`. With finite inertia image, a nonsemisimple rank-two Weil representation is a self-extension through the degree character. In the scalar case `Nφ=pφN` forces `N=0`; total equality gives each Newton slope `s=−a−k/2`, but the upper filtration line is stable and has `t_H=−a>s`. Thus the scalar lift admits no such filtration, and the nonsplit lift is forced. Use §0.2's weak-admissibility criterion and equivalence, without semisimplifying the filtered module.

**Raw lift Checks.**

- For distinct character constituents or an irreducible Weil representation, the raw lift is `R_π`; its Frobenius semisimplification changes nothing.
- For `R_π=δ⊕δ`, the degree-one action on `Δ_π` has one nontrivial Jordan block. Multiplying `U` by any nonzero scalar gives an isomorphic lift, whereas setting `U=0` gives the scalar module excluded by the filtration inequality above.
- Twisting by a smooth character multiplies both constituents and the Jordan eigenvalue, and preserves the nonzero extension. Coefficient extension preserves its rank-one nilpotent part and cannot split it.

Let `F(Δ_π,W)` be the set of isomorphism classes of weakly admissible absolutely irreducible filtered `(φ,N,G_(ℚ_p))`-modules whose underlying raw Weil representation is `Δ_π` and whose filtration jumps are `−a−k,−a`. The `(φ,G_(ℚ_p))`-module retains its actual Frobenius; both `N` and the filtration vary, subject to their relations and weak admissibility. Equivalently, prescribe only the Weil Frobenius semisimplification `R_π` of the underlying raw module. In the Steinberg case this equivalence does not prescribe the monodromy of `rec_geo(π)` to the raw filtered object.

(i) If `Π` is an admissible absolutely irreducible non-ordinary unitary completion of `π⊗W`, then `V(Π)` is potentially semistable with Hodge–Tate weights `a,a+k` and the raw Weil representation of `D_pst(V(Π))` is `Δ_π`. (ii) `Π↦D_pst(V(Π))` is a bijection from such completions onto `F(Δ_π,W)`. When nonempty, this set is a point if `π` is a principal series and `ℙ¹(L)` if `π` is supercuspidal or a twist of the Steinberg. In particular, for `k≥1` and `L` containing the half-unramified character required by `|·|^{k/2}, St ⊗ |det|^{k/2} ⊗ Sym^k L²` has exactly `ℙ¹(L)` pairwise non-isomorphic absolutely irreducible admissible unitary completions (Breuil's conjecture): a p-adic Banach representation is not determined by its Hodge–Tate weights and locally algebraic vectors. The filtration set `F` may be empty; nonzero completions are classified only for `ℒ∈F`, allowing a finite coefficient extension. There is no assertion that every `(M,a,b)` admits a completion.

Here `π` infinite-dimensional; completions absolutely irreducible, admissible, non-ordinary; the supercuspidal case uses Emerton's local-global compatibility (CDP footnote 5), i.e. the supercuspidal comparison input.

Combine [§3.8](#section-3-8) (every such completion is `Π(V)`), [§4.2](#section-4-2)'s locally algebraic-vector comparison and filtration independence, and the raw-lift comparison above. The converse completion uses [§4.3](#section-4-3) in the nonspecial principal-series case, including double roots, and Colmez Théorème VI.6.42 and Remarque 0.22 in the remaining cases. For a Steinberg factor at the crystalline endpoint, use its inclusion in Colmez's full reducible principal series; its image is dense in the irreducible Banach representation.

Distinct `ℒ` give non-isomorphic `Π(D_ℒ)` since `V(Π(D_ℒ)) = V(D_ℒ)` are non-isomorphic.

**Checks.**

- For `k≥1, π = St ⊗ |det|^{k/2}, W = Sym^k`: completions `↔ ℙ¹(L)` (the `L`-invariant).
- For `π` an irreducible principal series with `F(Δ_π,W)` nonempty, the completion is unique up to isomorphism.
- At `p=2`, take `π=Ind_B^G(ν⊗1)` and `W=Sym¹L²`. Section 4.3's module with `φ=p⁻¹(1+U)`, `N=0` and upper filtration line `Le₂` belongs to `F(Δ_π,W)`: its total numbers are `−2`, and the only stable line `Le₁` has `t_H=−2<−1=t_N`. Its scalar Frobenius semisimplification has the stable line `Fil⁰` with `t_H=0>−1=t_N`, so replacing the raw lift by `R_π` would give an empty locus. Here `π` is irreducible since its normalized inducing characters are equal, and `π⊗W` has unitary central character `νx=ε`. The nonspecial parameter is `δ₂=ν, δ₁=x²ν`, and §4.3 supplies the completion.
- If `F(Δ_π,W)=∅`, there is no absolutely irreducible admissible nonordinary unitary completion; the classification is then a bijection between empty sets.
- For `π=St` and `W=1` (the separate exponent `k=0` in the displayed Steinberg family), `F(Δ_π,W)` is empty in the absolutely irreducible category. In the semistable description the two Frobenius slopes and filtration jumps are `−1`,0; weak admissibility forces the slope `−1` line itself to be weakly admissible, hence the Galois representation is reducible. The usual unitary Steinberg completion is ordinary and does not enter this classification. Thus the positive-exponent hypothesis in the preceding family cannot be dropped.
- In the Steinberg family the point `∞` has `N=0` and gives the crystalline endpoint. Fixing `N≠0` removes that point, leaving the finite `L`-invariants, as in CDP14 footnote 4.

The source is [Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas, CDP14](#ref-cdp14), Theorem 1.3 and the paragraph before it, p. 2; [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §1, p. 3; [Pierre Colmez, COLMEZ10](#ref-colmez10), Remarque 0.22, p. 18.

*Needs:* [§3.8](#section-3-8); [§4.2](#section-4-2); [§4.1](#section-4-1); [§4.3](#section-4-3); [§1.7](#section-1-7); [§0.2](#support-hodge).

<a id="section-4-7"></a>

### 4.7 De Rham consequences of the Kirillov model

For irreducible de Rham `D` of rank two with distinct weights `ℓ<ℓ+k`, §4.2(i) supplies the nonvanishing condition in §4.1k. Consequently `Π^{P−alg}_c⊂Π^{alg}⊂Π^{an}` for its transported compact subspace, and the type `(ℓ,k)` structure and irreducibility/special-extension alternative hold without a separate nonvanishing hypothesis. Use `D₀=D(−ℓ)` for the period generator and coefficients `K_(z,i)` in powers of `(tx)^i`, then transport by `Π(D)≅Π(D₀)⊗(ε^ℓ∘det)`. When §4.2 identifies the smooth factor, compare its classical Kirillov model with `Kirillov.ofAlgebraicVector`; retain the supercuspidal comparison input in that case. The maps, equivariance and bijectivity are constructed in §4.1k before the criterion.

**Checks.**

- For crystalline irreducible `D` of weights `0,k`, the coefficients `K_(z,i)` in powers of `(tx)^i` are locally constant and compactly supported in `ℚ_p`, while the compact `P`-algebraic subspace has compact support in `ℚ_p×`. At `k=2`, the function `xt·1_(ℤ_p×)` has this property although its ordinary `t`-coefficient is not locally constant.
- At weights `(0,1)` the algebraic factor is trivial, and the comparison is the smooth Kirillov model.
- In the almost-de-Rham but non-de-Rham case, §4.1k still constructs the compact `P`-algebraic model inside analytic vectors; §4.2 gives `Π^{alg}=0`, so its inclusion in algebraic vectors cannot be inferred.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Proposition VI.5.6, Theorem VI.5.7 and Corollary VI.5.9, pp.167–168; Theorems VI.6.13 and VI.6.18, pp.177–178.

*Needs:* [§4.1k](#section-4-1k); [§4.2](#section-4-2); [§3.11](#section-3-11); [§0.2](#support-hodge).

<a id="section-4-8"></a>

### 4.8 Locally analytic vectors of the unitary principal series (trianguline case)

Let `s = (δ₁, δ₂, ℒ) ∈ S_irr` ([§1.6](#section-1-6)), `Δ(s)` the trianguline `(φ,Γ)`-module over `R`, and `Π(Δ(s)) = Π(V(s))^{an}`. For `η₁, η₂ ∈ T̂(L)` let `Ban(η₁, η₂) := Ind^{an}_B^G(η₂ ⊗ η₁χ^{−1})` (locally analytic induction). (i) `J*(Π(Δ)) ≠ 0` iff `Δ` is triangulable, i.e. iff `Π(Δ̂[0])` is a unitary principal series. (ii) If `s` is generic `(δ_s := χ^{−1}δ₁δ₂^{−1} ∉ {x^k : k ∈ ℕ})`, there is an exact sequence `0 → Ban(δ₁, δ₂) → Π(Δ(s)) → Ban(δ₂, δ₁) → 0`, and `Π(Δ(s))` is the unique non-trivial such extension. (iii) If `s` is special, `Ban(δ₁, δ₂)` contains a `(k+1)`-dimensional subrepresentation `W(δ₁, δ₂)` with quotient `St^{an}(δ₁, δ₂), Ext¹(R(δ₂), R(δ₁)) ≅ Ext¹(W(δ₁, δ₂), St^{an}(δ₁, δ₂))`, and `0 → E_ℒ → Π(Δ(s)) → Ban(δ₂, δ₁) → 0` with `E_ℒ` the extension determined by `ℒ`; for `δ_s = x^k` these are Breuil's `ℒ`-invariant extensions. (iv) `Π(V(s))` is the universal unitary completion of `ker p_s`.

Here `s ∈ S_irr`; `p ≠ 2` where Colmez's trianguline classification is used (the dyadic trianguline classification).

Name the induced representation `AnalyticPrincipalSeries`, with `AnalyticPrincipalSeries.centralCharacter` for its central action, `AnalyticPrincipalSeries.specialSubrep` for `W` when `δ_s=x^k`, and `AnalyticPrincipalSeries.specialQuotient` for `St^{an}`. The generic and special exact sequences are `Trianguline.analytic_generic_exact` and `Trianguline.analytic_special_exact`; the latter retains the parameter `ℒ` in `E_ℒ`.

Compute the Jacquet-type module `J*(s)` of `Π(Δ(s))` (Colmez 2014, Théorème 0.6) from the description of `Π(D)^{an}` through `D_rig ⊠ ℙ¹` ([§3.11](#section-3-11)).

An eigenvector of `B` in `J*(Π)` gives a `G`-map to `Ind^{an}`; this gives `p_s` : `Π(Δ(s)) → Ban(δ₂, δ₁)`, shown surjective with the stated kernel (Théorème 0.7).

Uniqueness of the extension: `dim Ext¹(Ban(δ₂, δ₁), Ban(δ₁, δ₂)) = 1` for generic `s` (Remarque 0.8(i), citing Kohlhaase [24]); (iv) is Remarque 0.8(iii).

**Checks.**

- For crystalline irreducible `V` with distinct eigenvalues and a generic parameter `s, Π(V)^{an}` is an extension of the two displayed locally analytic principal series. At a special parameter its kernel is `E_ℒ` instead.
- For `V` semistable non-crystalline, the extension class of `E_ℒ` recovers the Fontaine–Mazur `ℒ`-invariant.
- A scalar `a·1` acts on `Ban(η₁,η₂)` by `η₁(a)η₂(a)χ(a)⁻¹`, computed from the inducing character. Taking `η₁=χη₂` makes this `η₂(a)²`, the central character of the one-dimensional subrepresentation `η₂∘det`.
- For the induced representation with `η₁=χη₂` (the formal `k=0` special case), `W=η₂∘det` has dimension one; for `δ_s=x` it has dimension two. The `k=0` parameter has `u(s)=0` when the determinant is unitary, since `δ₁(p)=δ₂(p)`, so it lies outside `S_irr`. This dimension-one check concerns induction, not an extra irreducible `V(s)`. At a permitted special parameter the kernel remains `E_ℒ`.

The source is [Pierre Colmez, COLMEZ14LA](#ref-colmez14la), Théorème 0.1, p. 5; Propositions 0.2–0.5, pp. 5–6; Théorèmes 0.6–0.7 and Remarque 0.8, p. 7.

*Needs:* [§1.6](#section-1-6); [§3.11](#section-3-11); [§2.4](#section-2-4); [§2.5](#section-2-5).

<a id="section-4-9"></a>

### 4.9 Density of locally algebraic vectors and de Rham extensions (Dospinescu)

Let `p ≥ 5` and `Π ∈ Rep_L(δ)` supersingular with `Π^{alg} ≠ 0` (so `Π = Π(V)` with `V` de Rham with distinct weights). For an extension `0 → Π → Π₁ → Π → 0` in `Rep_L(δ)`, the following are equivalent: `(a) Π₁^{alg}` is dense in `Π₁`; `(b) Π₁^{alg} ≠ Π^{alg}`; `(c) V(Π₁)` is de Rham. Consequently `V` induces an isomorphism `Ext¹_{alg}(Π, Π) ≅ Ext¹_{g,ζ}(V(Π), V(Π))` onto the de Rham extensions with fixed determinant, and if `Π ∈ Rep_L(δ)` is the completion of its locally algebraic vectors then `V(Π)` is de Rham. The converse fails: `V(Π)` de Rham does not force `Π` to be the completion of `Π^{alg}`. In this statement supersingular is Banach terminology: absolutely irreducible and nonordinary. It does not require every mod-`p` constituent to be supersingular. Dospinescu’s contravariant Galois convention is the Tate dual `V_Colmez(Π)^∨(1)`; de Rhamness is invariant under this change, but determinants must be converted.

Here `p ≥ 5`; `Π` absolutely irreducible and nonordinary, with `Π^{alg} ≠ 0`; central character `δ` fixed. Nonordinary refers to continuous parabolic induction, not to the constituents of a residual lattice.

For an object `Q ∈ Rep_L(δ)` whose Jordan–Hölder factors are supersingular, define `Q_c^{P−fini}` by the following two conditions on a vector `v`: its orbit under `diag(ℤ_p^×,1)` spans a finite-dimensional `L`-space, and there are `n,k≥1, m∈ℤ` with `S_n^k diag(p^m,1)v=0`, where `S_n=Σ_{i=0}^{pⁿ−1}(1 i;0 1)`. The second condition is the compact-support condition. Prove that `Q_c^{P−fini}` lies in `Q^{an}`, is `B`-stable, and is dense in `Q` for the Banach topology (Dospinescu Théorème 1.8). In particular this applies to both `Π` and `Π₁`. For supersingular `Q`, density in the locally analytic topology of `Q^{an}` holds exactly when `V(Q)` is not trianguline (the paragraph following Théorème 1.8).

Keep the compactly supported `P`-algebraic space `Π_c^{P−alg} ⊂ Π_c^{P−fini}` distinct, with its additional polynomial condition from [§4.7](#section-4-7). Prove the Hodge–Tate statements of Théorème 1.9(a)–(b), then the de Rham criterion `Π₁,c^{P−alg} ⊂ Π₁^{alg}` of Théorème 1.9(c), including Banach density of `Π₁,c^{P−alg}` in the de Rham case.

The `Ext¹` isomorphism (Théorème 1.3) and the completion criterion (Théorème 1.7) follow.

**Checks.**

- For `Π₁` a non-de Rham self-extension, `Π₁^{alg} = Π^{alg}`.
- The trivial extension `Π ⊕ Π` has `V` de Rham and dense locally algebraic vectors.
- At `p=5, L=ℚ₅`, take `D=Le₁⊕Le₂`, `N=0`, `φ(e₁)=5⁻¹e₁`, `φ(e₂)=5⁻¹(e₂+e₁)`, with `FilⁱD=D` for `i≤−2`, `Fil⁻¹D=Fil⁰D=Le₂` and `FilⁱD=0` for `i≥1`. Then `t_H(D)=t_N(D)=−2`; its only Frobenius-stable line after any coefficient extension is `Le₁`, with `t_H=−2<t_N=−1`. Section 0.2 therefore gives an absolutely irreducible crystalline `V` with weights `0,2`; its rational Frobenius eigenline gives a triangulation. For `Π=Π(V)`, the space `Π_c^{P−fini}` is Banach-dense in `Π` but is not dense in `Π^{an}`. The split self-extension still satisfies the three equivalent conditions above.

The source is [Gabriel Dospinescu, DOSPINESCU15](#ref-dospinescu15), Théorèmes 1.2 and 1.3, pp. 3–4; Théorème 1.7 and Remarque 1.1, pp. 2–6; Théorèmes 1.8–1.9, p. 7; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDNKISIN](#ref-cdnkisin), Introduction, p. 3 (second ingredient).

*Needs:* [§4.2](#section-4-2); [§4.7](#section-4-7); [§3.8](#section-3-8).

<a id="section-4-10"></a>

### 4.10 De Rham deformations and algebraic-vector density

Let `V₀` be absolutely irreducible of dimension two, `E` a finite local `L`-algebra with residue `L`, and `V` a free rank-two `E`-deformation of `V₀` with fixed determinant and `End_{E[G_{ℚ_p}]}V=E`, obtained from the local absolutely irreducible deformation neighbourhood. Then `Π(V)^{alg}` is dense in `Π(V)` exactly when `V` is de Rham with distinct Hodge–Tate weights. This holds for every prime. For a supercuspidal full Weil–Deligne type with distinct Hodge–Tate weights `a<b` and fixed determinant, the de Rham self-extension space is one-dimensional.

Here the fixed-determinant absolutely irreducible deformation-neighbourhood hypotheses of CDN–Kisin §4.1; coefficient field sufficiently large; Hodge–Tate weights interpreted in the stated convention.

Use the family construction over the local Galois deformation neighbourhood and its Banach/analytic exact sequences.

Apply the infinitesimal `(φ,Γ)`-module calculation in CDN–Kisin Theorem 4.1. The proof is not a specialisation of the `p≥5` statement in [§4.9](#section-4-9); its all-prime analytic and infinitesimal inputs remain the Artinian infinitesimal calculation.

The all-prime proof must compute the infinitesimal action and `D_dif` connection over the Artinian coefficient algebra, including nilpotents. In the fixed-determinant type, show that the two infinitesimal Hodge–Tate weights have fixed sum and that the off-diagonal obstruction vanishes precisely in the de Rham case; retain the one-dimensional fixed-type extension calculation under distinct weights `a<b`. This is the content used from CDN–Kisin §§4.1–4.2, Theorem 4.1, pp.13–15. Dospinescu's `p≥5` theorem cannot justify a dyadic substitution. The hypothesis that `E` is a quotient of the indicated local absolutely irreducible deformation neighbourhood is retained; an arbitrary `E`-family with the same residual representation is not enough.

**Checks.**

- `E=L` recovers the irreducible algebraic-vector criterion.
- A repeated Hodge–Tate weight does not satisfy the density criterion. At `p=3`, a finite tame dihedral representation with inertia `diag(i,−i)` and Frobenius exchanging the basis vectors has weights `{0,0}`. Its jump-zero filtration is unique, so its fixed-determinant, fixed-full-type de Rham self-extension space has dimension zero.

The source is [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDNKISIN](#ref-cdnkisin), §4.1, Theorem 4.1 and Remark 4.2, pp.13–15; §4.2, pp.16–17.

*Needs:* [§3.6](#section-3-6); [§3.11](#section-3-11); [§4.2](#section-4-2).

<a id="section-4-11"></a>

### 4.11 The analytic quotient is independent of the filtration

Fix the rank-two potentially semistable `(φ,N,G)`-module `M`, distinct weights (normalised to 0,`k` with `k>0`), and the nonempty irreducible admissible locus `F_irr` of §4.1. In the nonspecial case the canonical analytic representation `Π(M,0,k)^{an}` has an algebraic subrepresentation consisting of two copies of the filtration-independent `Π(M,0,k)^{alg}`. Its quotient `Π′(M,0,k)^{an}` is independent of the filtration. For every `ℒ∈F_irr` there is an exact sequence `0→Π(M,0,k)^{alg}→Π(D_ℒ)^{an}→Π′(M,0,k)^{an}→0`; `Π(D_ℒ)^{an}` is obtained from the canonical representation by quotienting by one algebraic copy. The special case has the modified algebraic piece described in Remark VI.6.44.

Here Colmez §VI.6.9 setup; `F_irr` nonempty; the two-copy assertion assumes the nonspecial case, including the supercuspidal application.

Use [§4.2a](#section-4-2a)’s constructed `N_rig⊠ℙ¹` and filtration-independent `G`-action, Proposition VI.6.41, followed by [§4.2b](#section-4-2b)’s algebraic comparison, Theorem VI.6.42.

Construct `AnalyticBoxtimes.analyticQuotient` from the common `G`-module `(t^kN_rig⊠ℙ¹)/(t^kN_rig^♮⊠ℙ¹)` by its algebraic subrepresentation. After §4.2b, prove the intersection calculation of Theorem VI.6.43 and the displayed exact sequences. This constructs the filtration-independent analytic quotient used by the Drinfeld comparison.

**Checks.**

- The filtration of `L⊕L(χ)` in §4.1 lies outside `F_irr`; this analytic quotient theorem has no assertion at that reducible point.
- In the supercuspidal weight-`(0,1)` case the quotient is `Π^{an}/Π^{lisse}`.
- The theorem does not say that `Π(D_ℒ)^{an}` itself is independent of `ℒ`.
- In the nonspecial case the common representation has two algebraic copies, while each `Π(D_ℒ)^{an}` quotients by one copy; quotienting by both gives the common analytic quotient, not the individual analytic representation.

The source is [Pierre Colmez, COLMEZ10](#ref-colmez10), Proposition VI.6.41 and Theorem VI.6.42, p.189; Theorem VI.6.43 and Remark VI.6.44, p.190.

*Needs:* [§3.11](#section-3-11); [§4.1](#section-4-1); [§4.2a](#section-4-2a); [§4.2b](#section-4-2b).

### Examples

Weights `(0,1)` give `Alg=1`, while weights `(0,2)` give the two-dimensional standard representation. For scalar inertia at weight `(0,1)`, the crystalline `K`-type is trivial and the semistable `K`-type is finite Steinberg. Distinct admissible filtrations can give the same locally algebraic representation and different Banach completions. In the Steinberg family, the projective-line compactification includes the `N=0` endpoint; fixing `N≠0` removes that endpoint.

### Dependencies

Layers 1–3; the Hodge dictionaries of §0.2; SmoothRepresentationsOfLocalGroups SR.5.2 and the p-adic occurrence theorem of §4.4; the explicitly stated supercuspidal comparison input where needed. The `p≥5` extension theorem and the all-prime Artinian theorem have distinct hypotheses.

## Layer 5: Blocks, deformation rings and cycles

<a id="section-5-1"></a>

### 5.1 Blocks of locally finite mod `p` representations

Blocks are equivalence classes of irreducible smooth objects under chains of nonzero `Ext¹` in either direction, with fixed central character `ζ`. Write `A_B` for the locally finite-length block subcategory, `π_B=⊕_{π∈B}π, J_B` its injective envelope in `A_B`, and `P_B=J_B^∨` in the dual profinite category. Put `E_B=End_C(P_B)`, with ordinary composition. Then `End_G(J_B)=E_B^{op}`; their centres agree with the centre of the block category. For `τ∈A_B, m_B(τ)=Hom_C(P_B,τ^∨)` is a right pseudocompact `E_B`-module by precomposition, `P_B` is a left `E_B`-module, and `τ≅`(`m_B(τ)` completed-`tensored_{E_B}P_B`)`^∨`. This is an anti-equivalence with the appropriate right pseudocompact modules. The full locally finite-length category decomposes into its blocks; finite-length objects have only finitely many nonzero components. CDN’s `Rep^{ℓf}` is the finite-length subcategory; passage to all locally finite-length objects uses its `Ind`-completion, not a change of meaning of `ℓf`. Blocks over `k` correspond to Galois orbits of absolute blocks.

Here `ζ` is fixed and `F=ℚ_p`. Compact duals, envelopes and pseudocompact Morita theory use `O_L` with finite residue field `k_L`, enlarged finitely to split the block. Over `𝔽̄_p` use only absolute block classification, recovering finite-coefficient blocks by Galois orbits (CDN23 Remarques 1.11 and 1.13).

Use the following named operations and compatibility results.

- `Block`: A block `B`: an equivalence class of irreducibles under `Ext¹`-linkage.
- `Block.subcategory`: `Mod^{l.fin}_{G,ζ}(O)_B`.
- `Block.injectiveEnvelope`: `J_B`, an injective envelope of `π_B`.
- `GL2Block.projectiveEnvelope` (also written `Block.projectiveEnvelope`): `P_B = J_B^∨` in `C_{G,ζ}(O)`.
- `Block.endRing`: `E_B=End_C(P_B)` with composition; `End_G(J_B)=E_B^{op}`.
- `GL2Block.centre` (also written `Block.centre`): `Z_B` is the centre of `E_B`, canonically also the centre of `End_G(J_B)=E_B^{op}` and of the block category.
- `Block.decomposition`: `Mod^{l.fin}_{G,ζ}(O) ≅ ∏_B Mod^{l.fin}_{G,ζ}(O)_B`.
- `Block.gabriel`: `τ↦Hom_C(P_B,τ^∨)` is a right pseudocompact `E_B`-module; reconstruction is (`m` completed-`tensored_{E_B}P_B`)`^∨`, with `P_B` a left `E_B`-module.

`Mod^{l.fin}_{G,ζ}(O)` is a locally finite Grothendieck category ([§2.1](#section-2-1)); Gabriel's decomposition of locally finite categories into blocks applies (Paškūnas 2013 §1.1 and [35, §IV] there).

The anti-equivalence with compact `Ẽ_B`-modules is Gabriel's theorem for categories with a projective generator in the dual ([§2.3](#section-2-3)).

Rationality: Lemma 1.6 and Lemma 1.7 of CDN 2023 (`Hom` and absolute irreducibility under field extension) give the Galois-orbit description.

Gabriel’s block decomposition and pseudocompact Morita theorem are nonroutine category-theoretic inputs, retained as the Gabriel–Morita theorem; no ordinary module-envelope structure supplies them.

**Checks.**

- `Block.supersingular_singleton`: For `π` supersingular, the block of `π` is `{π}`.
- `Block.zero`: The zero representation lies in every `Mod^{l.fin}_{G,ζ}(O)_B`.
- `Block.not_finite_length`: `J_B` is not of finite length, and `E_B` is not an artinian ring.
- The linear dual of the one-dimensional discrete trivial representation over `𝔽̄_p` is again the infinite discrete field and is not compact; the profinite envelope construction therefore retains finite residue coefficients.
- `Block.galois_orbits`: Blocks over `k_L` correspond to `Gal(𝔽̄_p/k_L)`-orbits of blocks over `𝔽̄_p`.
- A supersingular `π` alone forms a block `{π}`.
- The centre `Z_B` acts on every object of the block, functorially.

The source is [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §1.1, pp. 4–5; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN23](#ref-cdn23), §1.3.3, pp. 18–19; Remarques 1.11 and 1.13.

*Needs:* [§2.1](#section-2-1); [§2.3](#section-2-3); [§2.7](#section-2-7); [§2.2](#section-2-2).

<a id="section-5-2"></a>

### 5.2 Paškūnas's classification of blocks and the bijection `B ↔ ρ̄_B`

The blocks of `Rep_{𝔽̄_p}G` containing an absolutely irreducible representation are: (i) `{π}, π` supersingular; (ii) `{Ind_B^G(δ₁ ⊗ δ₂ω^{−1}), Ind_B^G(δ₂ ⊗ δ₁ω^{−1})}` with `δ₂δ₁^{−1} ∉ {1, ω^{±1}}`; (iii) for `p > 2, {Ind_B^G(δ ⊗ δω^{−1})}`; (iv) for `p = 2, {1, Sp} ⊗ δ∘det`; (v) for `p ≥ 5, {1, Sp, Ind_B^G(ω ⊗ ω^{−1})} ⊗ δ∘det`; (vi) for `p = 3, {1, Sp, ω∘det, Sp ⊗ ω∘det} ⊗ δ∘det` (`δ, δ₁, δ₂` smooth characters, `ω(x) = x|x|` mod `ϖ`). There is a bijection `B ↦ ρ̄_B` between blocks over `𝔽̄_p` and semisimple two-dimensional `𝔽̄_p`-representations of `G_{ℚ_p}`, sending `B` to the semisimple representation whose irreducible constituents are the `V(π), π ∈ B` (up to the twist normalising `V`): `ρ̄_B` irreducible for (i), `δ₁ ⊕ δ₂` for (ii), `δ ⊕ δ` for (iii), `δ ⊕ δω` for (iv)–(vi); in all cases `(det ρ̄_B)ε^{−1}` is the central character of `B`. Over `k_L` blocks correspond to `Gal(𝔽̄_p/k_L)`-orbits, and with central character `δ` to `ρ̄` with `det = δε`.

Here `F = ℚ_p`; the exceptional cases at `p = 2`, 3 as listed.

`Ext¹` computations between irreducibles (Breuil–Paškūnas, Colmez §VII, Emerton, completed by Paškūnas), with the criterion of Paškūnas's Theorem 1.1 (Blocks): `Ext¹_G(π₂, π₁) ≠ 0` forces `π₁, π₂` to be constituents of the reduction of one unitary principal series or `Π(V)`.

The decomposition of `π{δ₁, δ₂}` (Blocks, Proposition 3.11 and the case list on p. 11), including `p = 2`: `π{δ, δ} ≅ (Sp^{⊕2} ⊕ 1^{⊕2}) ⊗ δ∘det`, and `p = 3`: `π{δ,δω} ≅ (1 ⊕ Sp ⊕ ω∘det ⊕ Sp ⊗ ω∘det) ⊗ δ∘det`. At `p=3`, `π{δ,δ}` instead consists of two copies of the irreducible `Ind_B^G(δ⊗δω⁻¹)`.

The shared contract `GL2Block.residualGalois` is this determinant-normalized bijection. The bijection with `ρ̄_B` from [§3.3](#section-3-3) and Breuil's semisimple correspondence (CDN 2023 Remarque 1.15).

**Checks.**

- For `p ≥ 5` the block of the trivial character is `{1, Sp, Ind_B^G(ω ⊗ ω^{−1})}` and `ρ̄_B = 1 ⊕ ω`.
- At `p=3`, `π{1,ω}` has the four stated constituents, whereas `π{1,1}=2·Ind_B^G(1⊗ω)` is two copies of an irreducible principal series.
- For `p = 2` the block of the trivial character is `{1, Sp}` (`Ind_B^G(ω ⊗ ω^{−1}) = Ind_B^G(1)` is reducible with these constituents).

The source is [Vytautas Paškūnas, PASKUNAS-BLOCKS14](#ref-paskunas-blocks14), Theorem 1.1, p. 1; Corollary 1.2, p. 2; Proposition 3.11 and the decomposition list, pp. 8–11; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN23](#ref-cdn23), Proposition 1.10, p. 18; Remarques 1.11, 1.13 and 1.15, pp. 18–19; [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §1.1, pp. 4–5.

*Needs:* [§5.1](#section-5-1); [§3.3](#section-3-3); [§2.6](#section-2-6); [§2.7](#section-2-7).

<a id="section-5-3"></a>

### 5.3 Projective envelopes `P̃` and Paškūnas's axiomatic framework

Let `π` be an irreducible object of `Mod^{l.fin}_{G,ζ}(O)` with `End_G(π) = k, S = π^∨`, and `P̃ ↠ S` a projective envelope in `C(O)` ([§2.3](#section-2-3)); Ẽ :`= End_{C(O)}(P̃)` is a local, pseudo-compact (hence compact, `k` being finite) ring with residue field `k`. Suppose `Q ∈ C(k)` of finite length satisfies (H1) `Hom_{C(k)}(Q, S') = 0` for irreducible `S' ≇ S`; (H2) `S` occurs in `Q` with multiplicity 1; (H3) `Ext¹_{C(k)}(Q, S') = 0` for `S' ≇ S`; (H4) `Ext¹_{C(k)}(Q, S)` finite-dimensional; (H5) `Ext²_{C(k)}`(`Q`, rad `Q`) `= 0`; (H0) `Hom_{C(k)}`(`P̃[ϖ]`, rad `Q`) `= 0`. Then the natural topology on Ẽ is the `𝔪`-adic one, `P̃` is flat over Ẽ and `k ⊗̂_{Ẽ} P̃ ≅ Q`; the functor `M ↦ Hom_{C(O)}(P̃, M)` relates `C(O)` to compact Ẽ-modules, and `V̌(P̃)` carries a natural action of Ẽ ([§3.2](#section-3-2)). For a block, `P_B = ⊕_{π∈B} P̃_π`. The envelope condition is essential epimorphism from a projective object of `C(O)`. Reuse the categorical Tau Ceti categorical vocabulary; no assertion of projectivity is transported from the underlying `O`-module category.

Here `π` irreducible with `End = k` (after enlarging `k`); hypotheses (H0)–(H5) for the flatness statements.

Use the following named operations and compatibility results.

- `ProjEnvelope.P`: `P̃ ↠ π^∨`, a projective envelope in `C_{G,ζ}(O)`.
- `ProjEnvelope.endRing`: Ẽ `= End_{C(O)}(P̃)`, local compact with residue field `k`.
- `ProjEnvelope.isProjectiveCover`: `P̃` is a categorical projective object of `C(O)`, and `P̃→π^∨` satisfies `TauCeti.IsEssentialEpi` in that category. The ordinary module predicate `TauCeti.IsProjectiveCover` is not transported without an equivalence of the relevant categories.
- `ProjEnvelope.flat`: Under (H0)–(H5), `P̃` is flat over Ẽ and `k ⊗̂_Ẽ P̃ ≅ Q`.
- `ProjEnvelope.topology`: Under (H0)–(H5), the natural topology of Ẽ is `𝔪`-adic.
- `ProjEnvelope.Vcheck_action`: Ẽ acts on `V̌(P̃)` and `V̌` is compatible with `⊗̂_Ẽ`.

Existence of projective envelopes: duals of injective envelopes ([§2.3](#section-2-3)).

Locality and pseudo-compactness of Ẽ: Paškūnas 2013 §2.

Under (H0)–(H5): Proposition 3.8 and its corollaries (Proposition 1.12 in the introduction) prove the coincidence of topologies, flatness and `k ⊗̂ P̃ ≅ Q`.

Supply the Gabriel decomposition theorem in the locally finite Grothendieck category and its pseudocompact projective-generator form. For a finite block, show `Hom(P_B,−)` identifies the compact block with the appropriate pseudocompact right `E_B`-modules and recover objects by completed tensoring with `P_B`. Separate finite-length objects from their `Ind`-completion. The projective-generator theorem must preserve the opposite algebra under duality; on the regular generator, right multiplication in `Hom` gives the right `E_B`-action. Paškūnas 2013 §2 and Paškūnas 2016 §2.B are the representation-category sources. Reusing essential epis supplies vocabulary and uniqueness, not this Morita theorem.

**Checks.**

- `ProjEnvelope.top`: `Hom_{C(O)}(P̃, S') = 0` for irreducible `S' ≇ S` and `Hom(P̃, S) = k`.
- `ProjEnvelope.residue`: Ẽ/`𝔪 = End(S) = k`.
- `ProjEnvelope.not_finite_length`: `P̃` is not of finite length in `C(O)` (it surjects onto the duals of all finite length objects with cosocle `S`).
- `ProjEnvelope.zero`: `Hom_{C(O)}(P̃, 0) = 0`, and `P̃ ≠ 0`.
- For `G` pro-`p` and `π` trivial (Paškūnas's example), Ẽ is the completed group algebra.
- `P̃` is not of finite length.

The source is [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §1.2, pp. 6–8: hypotheses (H0)–(H5), Proposition 1.12, Remark 1.13; §§2–3, Proposition 3.8.

*Needs:* [§2.3](#section-2-3); [§5.1](#section-5-1); [§3.2](#section-3-2).

<a id="section-5-4"></a>

### 5.4 The pseudodeformation ring `R^{ps,δ}_B` of a block

For a block `B` and its semisimple residual Galois representation `ρ̄_B`, let `δ` lift the central character and `d=δε`. Define `R_B^{ps,δ}` as the completed universal degree-two determinant-law ring for `G_{ℚ_p}`, at the residual determinant of `ρ̄_B`, with determinant character fixed to `d`. Its universal data are the trace `T` and determinant `d` satisfying the degree-two determinant identities over every coefficient ring, including `p=2`. For `p>2` trace alone can encode these data; at `p=2` the trace-only pseudocharacter definition is not used. The Cayley–Hamilton quotient is `R_B^{ps,δ}[[G_{ℚ_p}]]` modulo the closed ideal generated by `g²−T(g)g+d(g)`. The algebraic determinant law and Cayley–Hamilton relations use IntegralHeckeAndGaloisDeterminants §§0.1–0.5, 1.1 and 1.5; the continuous local representing ring and closed quotient are additional targets here.

The continuous construction applies to every continuous residual degree-two determinant law of `G_{ℚ_p}` over finite `k`, independently of a block label: first construct its unrestricted continuous residual completion, then the closed fibre at any specified determinant character `d`. The block notation uses this same construction at the residual law of `ρ̄_B` and `d=δε`; the block dictionary is needed to select that law, not to construct its deformation functor. Here `G_{ℚ_p}` satisfies Mazur's finiteness condition `Φ_p`; for `p = 2` use determinants (the trace-only comparison requiring 2 invertible does not apply).

Use the following named operations and compatibility results.

- `BlockPsRing.ring`: `R^{ps,δ}_B`, complete local noetherian with residue field `k`.
- `BlockPsRing.universal`: The universal degree-two determinant law `D_B` with determinant character `δε`, and its trace function `T_B` on `G_{ℚ_p}`. At `p=2` retain the whole determinant law.
- `BlockPsRing.universal_property`: Continuous local `O`-algebra maps `R_B^{ps,δ}→A`, for Artinian local `A`, correspond to degree-two determinant laws lifting the residual law of `ρ̄_B` and with fixed determinant character `δε`.
- `BlockPsRing.of_irreducible`: If `ρ̄_B` is absolutely irreducible, `R^{ps,δ}_B ≅ R^{δε}_{ρ̄_B}` (deformations with fixed determinant).
- `BlockPsRing.cayleyHamilton`: `R^{ps,δ}_B[[G_{ℚ_p}]]/J`, the Cayley–Hamilton quotient.

Use IHG’s `GL₂` determinant-law/pseudocharacter equivalence over arbitrary rings, complete at the residual determinant law, and impose `d=δε` by its closed ideal.

Use the pro-representability/noetherian input for this local Galois group and the fixed determinant specialisation, as stated in Paškūnas–Tung. At `p=2` do not invoke the trace comparison requiring 2 invertible.

Complete the algebraic universal Cayley–Hamilton algebra at the residual determinant and take the closure of its relation ideal in the native completed group algebra. Prove the finite-quotient and inverse-limit universal properties, continuity and coefficient-change compatibility. The local fixed-determinant representation ring in the irreducible comparison is §0.4; no division by 2 enters this construction.

**Checks.**

- `BlockPsRing.residue`: `R^{ps,δ}_B/𝔪_B ≅ k` and `T_B mod 𝔪_B = tr ρ̄_B`. Reduction modulo `ϖ` generally retains deformation parameters: an unobstructed absolutely irreducible fixed-determinant example at `p≥5` has `R≅O[[x₁,x₂,x₃]]`, hence `R/ϖ≅k[[x₁,x₂,x₃]]`, not `k`.
- `BlockPsRing.supersingular`: For `B = {π}` supersingular, `R^{ps,δ}_B ≅ R^{δε}_{V(π)}`.
- `BlockPsRing.not_framed`: `R^{ps,δ}_B` is not the framed fixed-determinant deformation ring of `ρ̄_B`: for generic `ρ̄_B = χ₁ ⊕ χ₂` it has relative dimension 3 over `O`, whereas `R^{□,δε}_{ρ̄_B}` has relative dimension 6.
- `BlockPsRing.det_fixed`: The universal determinant of `T^δ_B` is the constant character `δε`.
- For `B = {π}` supersingular, `R^{ps,δ}_B` is the universal deformation ring `R^{δε}_{ρ̄}` of the irreducible `ρ̄ = ρ̄_B` (Paškūnas 2013 Appendix A).
- `R^{ps,δ}_B/𝔪 = k`.

The source is [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), §1.1, p. 5; Appendix A, pp. 148–150; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN23](#ref-cdn23), Théorème 1.16, p. 20; [Vytautas Paškūnas, Shen-Ning Tung, PASKUNAS-TUNG21](#ref-paskunas-tung21), §1, pp. 2–3.

*Needs:* [§5.2](#section-5-2); IntegralHeckeAndGaloisDeterminants §§0.1–0.5; IntegralHeckeAndGaloisDeterminants §§1.1–1.3 and 1.5.

<a id="section-5-5"></a>

### 5.5 Paškūnas: endomorphism rings of projective envelopes are deformation rings

Assume `p ≥ 5` (and for (iii) `p = 2` with `B` of type (i) or (ii)). (i) For every block `B`, the centre of `Ẽ_B`, hence of `Mod^{l.fin}_{G,ζ}(O)_B`, is naturally isomorphic to `R^{ps,ζε}_{tr ρ̄_B}`; `Ẽ_B` is finitely generated over its centre; on the characteristic-zero irreducible locus it is Azumaya over that centre, hence étale-locally a matrix algebra. (ii) If `B = {π}` with `π` supersingular, `V(J_B)^∨(ζε) ≅ ρ^{un}` and `Ẽ_B ≅ R^{ζε}_ρ, ρ = V(π)`; if `B` is of type (ii), `V(J_B)^∨(ζε) ≅ ρ₁^{un} ⊕ ρ₂^{un}` and `Ẽ_B ≅ End_{G_{ℚ_p}}(ρ₁^{un} ⊕ ρ₂^{un}), ρ₁, ρ₂` the non-split extensions. (iii) (`p = 2`, Paškūnas 2016) for `B` of types (i), (ii) the centre of `Mod^{l.adm}_{G,ψ}(O)[B]` is `R^{ps,ψ}` and, for `B = {π}, E_B` is the fixed-determinant deformation ring of `ρ̄^{ss}`. (iv) `Ban^{adm}_{G,ζ}(L) = ⊕_B Ban^{adm}_{G,ζ}(L)_B`; for `B` containing an absolutely irreducible object, `Ban^{adm.fl}_{G,ζ}(L)_B ≅ ⊕_{𝔫 ∈ MaxSpec R^{ps}[1/p]} Ban^{adm.fl}_{G,ζ}(L)_{B,𝔫}`, the `𝔫`-part anti-equivalent to finite length modules over the `𝔫`-adic completion of `Ẽ_B[1/p]`; when `T_𝔫` is the trace of a two-dimensional absolutely irreducible representation `V` defined over `κ(𝔫)`, this is finite length modules over the `𝔫`-adic completion of `R^{ps}[1/p]`, with the unique irreducible `Π_𝔫` the non-ordinary `Π` with `V(Π_𝔫) ≅ V`; when `T_𝔫 = ψ₁ + ψ₂`, the irreducibles are subquotients of the two unitary principal series. (v) For `Π` absolutely irreducible non-ordinary with `V = V(Π), Ban^{adm.fl}_{G,ζ}(L)_Π` is a direct summand anti-equivalent to finite length `R^{ζε}_V`-modules via `m(B)=Hom^cont_(G_(ℚ_p))(V^u,V̌(B))`.

Here `p ≥ 5` for (i), (ii), (iv), (v) (Paškūnas 2013); `p = 2` and blocks (i), (ii) for (iii) (Paškūnas 2016); the remaining primes and blocks are covered by [§5.6](#section-5-6).

In (v), `R=R^{ζε}_V` represents fixed-determinant deformations of `V` to local Artinian `L`-algebras with residue `L`, and `V^u` is its universal deformation. On Banach representations, `V̌(B)=Hom_L(V(B),L)(ζε)`; equivalently it is `L⊗_O V̌(Θ^d)` for an open bounded invariant lattice `Θ` in `B`. The compact-category functor is covariant, while `B↦Θ^d` and the displayed Banach functor are contravariant. A morphism `f:B₁→B₂` acts by postcomposition with `V̌(f):V̌(B₂)→V̌(B₁)`, giving `m(f):m(B₂)→m(B₁)`. Thus the categorical statement is `(Ban^{adm.fl}_{G,ζ}(L)_Π)ᵒᵖ ≌ Mod^fl(R)`, with `V̌(B)≅m(B)⊗_R V^u`. Source: PASKUNAS13, §5.7, Lemma 5.49, pp.67–68; Theorem 11.7, pp.144–146, and Remark 11.8, p.146.

For the scalar-residual block, put `Z_B=R^{ps}` and let `𝔫∈MaxSpec Z_B[1/p]` be an irreducible pseudotrace point, with residue field `κ(𝔫)`. The fibre of `Ẽ_B[1/p]` is central simple of dimension four, and its `𝔫`-adic completion is Azumaya of rank four over the completed centre. It is `M₂` over that completed centre if and only if `T_𝔫` has a two-dimensional model over `κ(𝔫)`. Without this hypothesis (iv) retains the completed endomorphism algebra. Extending the residue field can split it, but does not give a splitting over the original completed centre.

Verify (H0)–(H5) for `Q` built from `π` ([§5.3](#section-5-3)) by `Ext` computations in the block (Paškūnas 2013 §§6–10), giving Ẽ local with `𝔪`-adic topology.

`V̌` gives Ẽ `→ R^{ζε}_ρ` (or `End` of the universal deformations) for the generic blocks; it is an isomorphism by comparing graded rings (§§6, 8).

Non-generic blocks: Cayley–Hamilton quotients and the centre (§§9–10).

Banach representations: §§4, 11 and Proposition 1.8, Corollary 1.9, Theorems 1.10–1.11 by the Chinese remainder theorem over MaxSpec `R^{ps}[1/p]`.

**Checks.**

- For `B = {π}` supersingular and `p ≥ 5, Ẽ_B ≅ R^{ζε}_ρ` is commutative.
- In (v), `m(Π)≅L`, the residue module of `R`; evaluation recovers `V̌(Π)≅V` by the rank-two determinant pairing.
- For the split inclusion `Π→Π⊕Π` into the first summand, `m` gives the projection `L²→L`; the Banach projection gives the module inclusion. Zero maps to zero.
- For `B₁→B₂→B₃` in (v), the induced map is the composite `m(B₃)→m(B₂)→m(B₁)` in reverse order. Omitting the opposite category fails even the split inclusion test.
- For generic reducible `B, Ẽ_B` is not commutative but its centre is `R^{ps}`. The two nonzero orthogonal projections of `P₁⊕P₂` cannot occur in a commutative local deformation ring.
- At `p=5, L=ℚ₅`, take residual trace 2 and determinant 1, with `ζ=ε⁻¹`. The quaternion algebra `D=(2,5)_(ℚ₅)`, with `i²=2, j²=5, ij=−ji`, is division: `ℚ₅(√2)` is unramified quadratic, and its norm has even valuation, excluding 5. Choose `a²=51, b²=126` with `a,b≡1 mod 5`. Then `u=a+5i, v=b+5j` are in `1+5O_D`, have reduced norm 1 and generate `D`. The free maximal pro-5 quotient of `G_(ℚ₅)` on two generators gives a continuous representation with these images. Its reduced trace lifts 2; after a splitting extension its matrix realization is absolutely irreducible, but its Cayley–Hamilton fibre is `D`, and the endomorphism fibre is `D^op≅D`. This is an irreducible point with no two-dimensional model over `ℚ₅`, so its completed algebra does not split.
- With the same prime, residual trace and determinant, the two matrices `(1 5;0 1)` and `(1 0;5 1)` define an absolutely irreducible representation over `ℚ₅`: their invariant lines differ. Its pseudotrace has a two-dimensional model over that field, so the scalar-block completed algebra is `M₂` over the completed centre. After a finite residue-field splitting extension the preceding quaternion point also has this matrix conclusion, only over the extended centre.

The source is [Vytautas Paškūnas, PASKUNAS13](#ref-paskunas13), Theorems 1.4–1.7, Proposition 1.8, Corollary 1.9, Theorems 1.10–1.11, pp.4–6, and Theorem 11.7 with Remark 11.8, pp.144–146; §9.2, p.96, Corollaries 9.27–9.29, pp.101–102, and Corollaries 9.35–9.36, p.104; [Vytautas Paškūnas, PASKUNAS16](#ref-paskunas16), Theorems 1.2–1.3 and Corollary 1.4, p. 3.

*Needs:* [§5.3](#section-5-3); [§5.4](#section-5-4); [§5.2](#section-5-2); [§3.2](#section-3-2); [the Banach contract](#banach-contract); [§0.4](#support-deformations).

<a id="section-5-6"></a>

### 5.6 The local `R = T` theorem for every block (Paškūnas–Tung)

For every `p` and every block `B` with central character `ζ` (over `k` after enlarging it): (i) there is an `O`-algebra map `υ` : `R^{ps,ζε}_{tr ρ̄_B} → Z_B` such that for all `τ ∈ Mod^{l.fin}_{G,ζ}(O)_B` and `g ∈ G_{ℚ_p}, V̌(c_τ(υ(T(g)))) = ρ_{V̌(τ^∨)}(g) + ρ_{V̌(τ^∨)}(g^{−1})ζε(g)` in `End^{cont}_{G_{ℚ_p}}(V̌(τ^∨))`; equivalently (CDN) the unique `ι^δ_B` : `R^{ps,δ}_B → Z^δ_B` with `ι^δ_B(T^δ_B(g)) = g + δε(g)g^{−1}` in `End(V(π))` for every `π∈Rep^δ_B G`, including nonsemisimple objects of the block subcategory. (ii) `Z_B` and `E_B` are finitely generated `R^{ps}`-modules; `Z_B` is noetherian, complete local with residue field `k, O`-torsion free with `Z_B[1/p]` normal. (iii) `υ[1/p]` : `R^{ps}[1/p] ≅ Z_B[1/p]`; if `p ≥ 5, ι^δ_B` is an isomorphism; if `p = 3, Z_B = R^{ps}`/(`O`-torsion); if `p = 2`, the cokernel of `R^{ps}`/(`O`-torsion) `→ Z_B` is killed by 2. (iv) The essential image of `Mod^{l.fin}_{G,ζ}(O)_B` under `V̌` is anti-equivalent to pseudo-compact `(R^{ps}[[G_{ℚ_p}]]/J)_{tf}`-modules. The universal character identity holds for every object of the block, through its central action, not only its irreducible specialisations.

Here all `p`; `B` any block (after a finite extension of `k`).

Construct `υ` (the main point of Paškūnas–Tung, by a new argument covering the exceptional blocks) using `V̌` of `P_B` and Cayley–Hamilton algebras.

Finiteness (Theorem 1.3) by bounding `E_B` over `R^{ps}`, using Chenevier's noetherianity of `R^{ps}`.

Isomorphism after inverting `p` and the `p = 2`, 3 defects (Theorem 1.4); Corollary 1.5 for the properties of `Z_B`.

CDN 2023 Théorème 1.16 restates (i)–(iii) with the explicit identity `ι^δ_B(T^δ_B(g)) = g + δε(g)g^{−1}`.

**Checks.**

- For `B = {π}` supersingular and `p ≥ 5, ι^δ_B` is the isomorphism `R^{ζε}_ρ ≅ Ẽ_B` of [§5.5](#section-5-5).
- At `p = 2` the map `R^{ps} → Z_B` need not be surjective; its cokernel is 2-torsion.
- Irreducibles see only the residual centre character; a tangent parameter vanishes on every residual irreducible but can act nontrivially on an infinitesimal extension. The uniqueness identity therefore ranges over the whole block subcategory.

The source is [Vytautas Paškūnas, Shen-Ning Tung, PASKUNAS-TUNG21](#ref-paskunas-tung21), Theorems 1.1–1.4 and Corollary 1.5, pp. 2–4; [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN23](#ref-cdn23), Théorème 0.17, p. 11; Théorème 1.16, p. 20.

*Needs:* [§5.4](#section-5-4); [§5.1](#section-5-1); [§5.3](#section-5-3); [§5.5](#section-5-5); [§3.2](#section-3-2).

<a id="section-5-7"></a>

### 5.7 Kisin: deformations of `π̄` and of `ρ̄` coincide

Let `ρ̄` : `G_{ℚ_p} → GL₂(𝔽)` satisfy `ρ̄ ≇ χ ⊗ (1 *; 0 ε)` for every character `χ`. (i) (Colmez) There is a finite length object `π̄` of `Mod^{adm}_G(𝔽)`, unique up to isomorphism, with `MF(π̄) ≅ ρ̄`, central character `det(ρ̄)ε`, and no nonzero finite-dimensional subobject or quotient. (ii) (Kisin) If moreover `p ≥ 3` and `End_{𝔽[G_{ℚ_p}]}(ρ̄) = 𝔽`, the deformation functors `Def(π̄)` (orthonormalizable admissible deformations to complete local `O`-algebras) and `Def(ρ̄)` are representable and `MF` : `Def(π̄) → Def(ρ̄)` is an isomorphism; on a deformation `π` the centre acts through `det(MF(π))ε`; the same holds with fixed central character `ψ` and fixed determinant `ψε^{−1}`. (iii) (Emerton) Under (i) only, `MF` induces a fully faithful embedding `Def*(π̄) ↪ Def(ρ̄)`, an equivalence on the closed formal subfunctors `Def^{crys}` obtained by schematic closure of crystalline characteristic-zero points.

Here `ρ̄` not a twist of a non-split extension of `ε` by 1 in the stated direction; (ii) needs `p ≥ 3` and `End(ρ̄) = 𝔽`. The excluded residual shape includes the split case; fixed central character `ψ` corresponds in `MF` convention to determinant `ψε^{-1}`.

Use Emerton Assumption 3.3.1 and Theorem 3.3.2 for the unique finite-length object with no finite-dimensional subobject or quotient. The excluded extension shape includes the split extension.

For the full deformation comparison use the representability and closed-immersion argument of Kisin §1.6, with schematic closure, as specified in the schematic deformation comparison. Lemma (1.6.6) bounds Krull dimension by two; it is not a module-rank bound.

For the crystalline-closure statement use Emerton Theorem 3.3.13 and Remark 3.3.14 with their actual formal subfunctors.

**Checks.**

- For `ρ̄` absolutely irreducible, `π̄` is the supersingular `π` with `V(π) ≅ ρ̄(ε)` normalisations as in [§3.2](#section-3-2), and `Def(π̄) ≅ Def(ρ̄)`.

The source is [Matthew Emerton, EMERTON-LG](#ref-emerton-lg), Assumption 3.3.1 and Theorem 3.3.2, p. 24; Definitions 3.3.6–3.3.11 and Theorem 3.3.13, pp. 25–26; [Kentaro Nakamura, NAKAMURA23](#ref-nakamura23), Theorem B.18, Definition `B`.19, Theorem B.20, Remark B.21, Definition `B`.22, pp. 98–99 (arXiv).

*Needs:* [§3.9](#section-3-9); [§3.2](#section-3-2); [§3.3](#section-3-3); [§1.6](#section-1-6); [§0.4](#support-deformations).

<a id="section-5-8"></a>

### 5.8 `P̃` is the dual of the universal deformation of `π̄`

Assume `p ≥ 3, End(ρ̄) = 𝔽, ρ̄ ≇ χ ⊗ (ε *; 0 1)` and `ρ̄ ≇ χ ⊗ (1 *; 0 ε)`. Let `π̄` be as in [§5.7](#section-5-7), `π_{π̄}` its universal deformation over `R_ρ̄` (and `π^ψ_{π̄}` with central character `ψ` over `R^{ψε^{−1}}_ρ̄`), and `P̃^ψ, P̃` the projective envelopes of the dual of the socle in `C^ψ(O), C(O)`. (i) For `A ∈ Comp(O)` and a deformation `π` with central character `ψ`, the A-dual `π*` lies in `C^ψ(O)` and `V̌(π*) ≅ MF(π)(ε)`. (ii) (Paškūnas) `V̌` induces `End_{C^ψ(O)}(P̃^ψ) ≅ R^{ψε}_{ρ̄(ε)}, P̃^ψ` is flat over it and `V̌(P̃^ψ)` is the universal deformation. (iii) There are `G`-equivariant topological isomorphisms `P̃^ψ ≅ (π^ψ_{π̄})*, R^{ψε^{−1}}_ρ̄`-linear, and `P̃ ≅ π*_{π̄}, R_ρ̄`-linear; with `R_ρ̄ ≅ R^{ψε^{−1}}_ρ̄ ⊗̂ Λ` and `P̃ ≅ P̃^ψ ⊗̂ (1^{univ}∘det^{−1}), R_ρ̄ ≅ End_{C(O)}(P̃)`.

Here `p ≥ 3`; `End(ρ̄) = 𝔽`; `ρ̄` not a twist of `(ε *; 0 1)` nor of `(1 *; 0 ε)`, including the split cases. Thus a reducible `ρ̄` is a nonsplit extension of distinct characters with ratio outside `{1,ω,ω⁻¹}`.

(i): Lemma B.23, from the definition of `V̌` and Pontryagin duality.

(ii): For `p≥5`, Theorem B.24, quoting Paškūnas 2013 ([§5.5](#section-5-5)). For `p=3`, Paškūnas 2016 §2.2, Propositions 2.8–2.14 and Theorem 2.22 give the fixed-character envelope, its flatness and universal Galois deformation, for supersingular and generic principal-series socles. These are exactly the residual cases left by the two exclusions. This uses the integral envelope comparison, not only the rational centre isomorphism of §5.6.

(iii): Lemma B.25 and Proposition B.26: compare the universal properties of `P̃^ψ` (projectivity, `Hom(P̃^ψ, −)` on the dual category) and of `π^ψ_{π̄}` through Kisin's isomorphism `Def(π̄) ≅ Def(ρ̄)`; twist away the central character with the universal character of the centre (CEGGPS Theorem 6.18 as quoted).

The same argument gives (iii) at `p=3` from (ii). Splitting determinant variation uses the unique square root of a character congruent to 1 at odd `p`; it applies to complete local coefficient rings, including nonreduced ones.

**Checks.**

- The reduction of `P̃` modulo `𝔪_{R_ρ̄}` is `π̄^∨`.
- At `p=3`, an absolutely irreducible `ρ̄≅ρ̄⊗ω` is included, even though its fixed-determinant deformation ring need not be formally smooth. The comparison uses Paškūnas's integral theorem rather than an unobstructed tangent-space argument.
- At `p=3`, `ω=ω⁻¹`, and a twist of an extension between `1` and `ω` in either direction fails the residual exclusions. Its block contains characters through determinant and is not covered by this envelope identification.
- A split sum of distinct characters fails `End(ρ̄)=𝔽`; scalar-endomorphism representability is not applied to it.

The source is [Kentaro Nakamura, NAKAMURA23](#ref-nakamura23), Lemma B.23, Theorem B.24, Lemma B.25, Proposition B.26, pp.100–103 (arXiv), for `p≥5` and the duality/twisting argument; [Vytautas Paškūnas, PASKUNAS16](#ref-paskunas16), §2.2, Propositions 2.8–2.14 and Theorem 2.22, pp.8–16 (arXiv), for the fixed-character input at `p=3`.

**Universal family for absolutely irreducible residual representations.** For every prime `p` and absolutely irreducible `ρ̄:G_{ℚ_p}→GL₂(k)`, let `R_p=R_ρ̄` and `ρ^univ` be the unrestricted universal deformation of §0.4. Construct an orthonormalizable admissible `R_p[G]`-module `Π^univ` deforming §5.7's `π̄`, with `MF(Π^univ)≅ρ^univ` and central character `det(ρ^univ)ε`. Orthonormalizable means separated and complete for `𝔪_{R_p}`, with `Π^univ/𝔪_{R_p}ⁿΠ^univ` free over `R_p/𝔪_{R_p}ⁿ` for every `n≥1`; these quotients are admissible smooth representations. Require compatibility with continuous complete-local coefficient change and reduction. At every closed characteristic-zero point `x∈MaxSpec(R_p[1/p])`, completed specialization to its ring of integers and inversion of `p` gives `Π^univ⊗̂_{R_p}κ(x)≅Π(ρ_x(ε))`. The twist uses `V=MF(−)(ε)`; equivalently the family for Colmez's residual parameter `ρ̄(ε)` has Galois image `ρ^univ(ε)`. Its pullbacks give the local families used over arithmetic coefficient rings. Source: [Dospinescu–Le Bras, DLB17](#ref-dlb17), §13, p.69, before Definition 13.3; [Nakamura, NAKAMURA23](#ref-nakamura23), Definitions B.1 and B.17, pp.90 and 97, for the coefficient topology and admissibility.

**Universal family Checks.**

- Reduction at the closed residual point is the supersingular `π̄`, with `MF(π̄)=ρ̄`.
- A characteristic-zero fibre has Colmez image `ρ_x(ε)` and central character `det(ρ_x)ε`; using `Π(ρ_x)` instead would give the wrong determinant twist.
- Base change to `k[t]/(t²)` retains the chosen infinitesimal Galois deformation and freeness over that ring, not just its residual semisimplification.
- The family includes `p=2` with absolutely irreducible `ρ̄`; a reducible residual representation does not satisfy its hypothesis. This all-prime family does not use the odd-prime splitting of determinant variation in (iii).

*Needs:* [§5.7](#section-5-7); [§5.5](#section-5-5) for its stated prime range; [§5.3](#section-5-3); [§3.2](#section-3-2), [§3.6–§3.8](#section-3-6), [§0.4](#support-deformations) and [§0.1](#support-analytic) for the all-prime universal family.

<a id="section-5-9"></a>

### 5.9 Removing `P̃` from `Hom`

Under the hypotheses of [§5.8](#section-5-8), for every compact `R_ρ̄`-module `M` the map `M → Hom_{C(O)}(P̃, P̃ ⊗̂_{R_ρ̄} M), m ↦ (v ↦ v ⊗̂ m)`, is a topological `R_ρ̄`-linear isomorphism; consequently, for compact `R_ρ̄`-modules `M₁, M₂, f ↦ id_{P̃} ⊗ f` is an `R_ρ̄`-linear isomorphism `Hom^{cont}_{R_ρ̄}(M₁, M₂) ≅ Hom^{cont}_{R_ρ̄[G]}(P̃ ⊗̂ M₁, P̃ ⊗̂ M₂)`.

Here `p≥3`, `End(ρ̄)=𝔽`, and neither cyclotomic-extension orientation of [§5.8](#section-5-8) occurs, including the split cases.

`P̃` is projective in `C(O)` and flat over `R_ρ̄ = End(P̃)` ([§5.8](#section-5-8), [§5.3](#section-5-3)); `Hom(P̃, P̃ ⊗̂ M)` commutes with inverse limits of finite length `M` and equals `End(P̃) ⊗̂ M = M` (Lemma B.27).

Corollary B.28 follows by applying Lemma B.27 to `M₂` and composing.

**Checks.**

- For `M = R_ρ̄` this recovers `End(P̃) = R_ρ̄`.
- For `M=0` both sides are zero; for `M=R_ρ̄/I` with closed ideal `I`, evaluation identifies the Hom module with `R_ρ̄/I`, including nonreduced Artinian quotients.
- At `p=3` the comparison applies to supersingular and generic principal-series socles under §5.8's exclusions; it does not extend the envelope-removal assertion to the block of `1⊕ω`.

The source is [Kentaro Nakamura, NAKAMURA23](#ref-nakamura23), Lemma B.27 and Corollary B.28, p.104 (arXiv); the same projectivity and finite-presentation argument uses §5.8's integral `p=3` envelope identification. For the fixed-character tensor comparison, [Paškūnas, PASKUNAS16](#ref-paskunas16), Proposition 2.10 and equation (3), p.10 (arXiv), give the corresponding fully faithful completed-tensor functor.

*Needs:* [§5.8](#section-5-8); [§5.3](#section-5-3).

<a id="section-5-10"></a>

### 5.10 The Breuil–Mézard cycle identity for `ρ̄`

Fix `ρ̄:G_{ℚ_p}→GL₂(k)` and the framed universal lifting ring `R^□`. Throughout the type determinant is `det=ψε`, so for Hodge–Tate weights `a<b` require `ψ|_I=ε^{a+b−1}det τ` and `ψε` lifting `det ρ̄`. Let `R^{□,ψ}(w,τ)` and `R^{□,ψ,cr}(w,τ)` be the reduced `O`-torsion-free type quotients. When nonzero their absolute Krull dimension is 5, with generic fibre dimension 4 and special fibre dimension 4. If `End ρ̄=k`, the corresponding unframed type quotient has absolute dimension 2, generic fibre dimension 1 and special fibre dimension 1; adjoining three framing variables recovers the framed ring. The cycle identity asks for effective cycles `C_σ(ρ̄)` in `Z₄(R^{□,ψ}/ϖ)`, independent of `w,τ`, whose sum with coefficients `m_σ(w,τ)` (respectively `m^cr_σ`) is the cycle of the potentially semistable (respectively crystalline) special fibre. Here `Z_d(A)` is the free group on primes with `dim A/𝔭=d`, and `z_d(M)` weights them by local module length. Taking Hilbert–Samuel multiplicities gives the numerical identity. Paškūnas 2015 instead labels the fixed determinant itself `ψ_source`; his `ψ_source` equals our `ψε`. The type rings are constructed in §0.4; their all-prime fixed-determinant specialisation includes the dyadic fixed-determinant type-ring contract.

Here `ρ̄` continuous; `L` large enough; framed or (when `End ρ̄ = k`) unframed rings, with the determinant normalisation of the source fixed explicitly.

Use the following named operations and compatibility results.

- `BMCycles.typeRing`: `R^{□,ψ}(w, τ)` and `R^{□,ψ,cr}(w, τ)` as quotients of `R^{□,ψ}_ρ̄` (imported).
- `BMCycles.cycle`: `z_d(M) ∈ Z_d(R)` for a finite `R`-module `M` of dimension `≤ d`.
- `BMCycles.Holds`: BMCycles.Holds `ρ̄ :⇔` there are `C_σ(ρ̄)` with `z_4(R^{□,ψ}(w,τ)/ϖ) = Σ m_σ(w,τ)C_σ` and the crystalline analogue for all `(w, τ)`.
- `BMCycles.numerical_of_cycle`: The cycle identity implies `e(R^{□,ψ}(w,τ)/ϖ) = Σ m_σ(w,τ)e(C_σ)`.
- `BMCycles.normalisation_dictionary`: Use `det=ψε` and `ψ|_I=ε^{a+b−1}det τ` throughout. Paškūnas 2015 `ψ_source=ψε`; Kisin `k=b−a+1` after a determinant twist; Tung reverses the ordered pair to `(b,a)`. Framing adds three variables when `End ρ̄=k`.
- `BMCycles.cycle_nonneg`: Each `C_σ(ρ̄)` is effective (nonnegative coefficients).

Use §0.4’s universal lifting and potentially semistable type-ring constructions, including the dyadic fixed-determinant contract without division by 2.

Use the cycle and Hilbert–Samuel APIs of §0.5; `O`-flatness lowers the special-fibre dimension by one. Framing adds three variables in the scalar-endomorphism case.

The independence of type is the Breuil–Mézard property, proved only in the subsequent case theorems. The zero ring contributes zero cycles.

**Checks.**

- `BMCycles.zero_ring`: If `R^{□,ψ}(w, τ) = 0` then `Σ_σ m_σ(w, τ)C_σ(ρ̄) = 0`, so every `σ` with `m_σ(w, τ) > 0` has `C_σ(ρ̄) = 0`.
- `BMCycles.weight_two_crystalline`: For `(w, τ) = ((0,1), 1)` the crystalline identity has exactly one term, `σ =` trivial.
- `BMCycles.cycle_vs_multiplicity`: The numerical identity does not imply the cycle identity: distinct cycles can have equal Hilbert–Samuel multiplicities.
- `BMCycles.frame_independence`: The cycle identity for `R^{□,ψ}` and for `R^ψ_ρ̄ (End ρ̄ = k)` are equivalent, the framed ring being formally smooth of relative dimension 3 over the unframed one.
- For `w = (0, 1)` and `τ` trivial, the crystalline identity reads `z_4(R^{□,ψ,cr}(0,1; 1)/ϖ) = C_{triv}(ρ̄)`.
- If no Serre weight `σ` of `ρ̄` occurs in `σ̄(w, τ)`, the identity forces `R^{□,ψ}(w, τ) = 0`.

The source is [Vytautas Paškūnas, PASKUNAS15](#ref-paskunas15), §1, pp. 2–3: the p-adic Hodge type, Henniart's `σ(τ)`, the cycle groups `z_d` and Theorem 1.1; [Shen-Ning Tung, TUNG21A](#ref-tung21a), Conjecture 1.1 and Theorem 1.2, pp. 3–4; [Mark Kisin, KISIN09](#ref-kisin09), Proposition (1.1.1), published p.645; §1.1, (1.1.2)–(1.1.5), pp.645–646.

*Needs:* [§4.4](#section-4-4); [§0.4](#support-deformations); [§0.5](#support-cycles).

<a id="section-5-11"></a>

### 5.11 Paškūnas's criterion: supports of `M(Θ)` and the cycle formula

Let `R` be a commutative complete local noetherian `O`-algebra with residue field `k, N` a compact `R[[K]]`-module with `k` completed-`tensored_R N` finite over `O[[K]]`, and `V` a finite-dimensional continuous `K`-representation with invariant lattice `Θ`. Put `M(Θ)=Hom^{cont}_{O[[K]]}(N,Θ^d)^d, a=Ann_R M(Θ), d=dim M(Θ)`. Assume `N` projective in `Mod_K^{pro}(O), R/a` equidimensional with all associated primes minimal, and a dense set `Σ` of closed generic points of Supp `M(Θ)` such that `dim_{κ(n)}Hom_K(V,Π(κ(n)))=1` and `dim_{κ(n)}Hom_K(V,Π(R_n/n²))≤d`. Then `R/a` is reduced of dimension `d`, and `z_{d−1}(R/(ϖ,a))=Σ_σ m_σ z_{d−1}(M(σ))`. For `N=P̃` use the prescribed-central-character adapter below; for a scalar-endomorphism residual representation, the type support computation and its projectivity/Cohen–Macaulay inputs identify this quotient with the appropriate potentially semistable or crystalline ring. In Proposition 4.14 the potentially semistable occurrence implication has the stated full scope, while the crystalline iff additionally excludes `ρ̄≅(δε *;0 δ)`. The final ring equality is Corollary 6.5; it is not obtained by dropping that exception in Proposition 4.14. The noncommutative block ring `E_B` is not an arbitrary allowed choice for commutative `R`.

Here `(a)`–`(c)` as stated; for the application `p ≥ 5, End ρ̄ = k` and `ρ̄ ≇ (ε *; 0 1) ⊗ η` for the local freeness.

Theorem 2.42: compact `Hom` duality gives finite `M(Θ)`; generic rank one and the infinitesimal `Hom` bound imply reducedness. Projectivity gives exact reduction to the finite-length `K`-module and hence the cycle formula.

Use Theorem 2.44 for projectivity and Cohen–Macaulay/equidimensional hypotheses: `R` Cohen–Macaulay, `N R`-flat, and `projdim_{O[[P]]}(k completed-tensored_R N)+max_σ dim M(σ)≤dim R` for a pro-`p` Sylow `P⊂K`. This nonroutine application is the restricted-projectivity criterion.

Use Proposition 4.14 with its exception intact, then the deformation-ring and algebraic-vector arguments of Corollary 6.5 to obtain the full final type-ring equality.

For the fixed-central-character application, first prove the prescribed-central-character versions of Theorems 2.42 and 2.44. The Theorem 2.42 criterion uses restricted projectivity, equidimensionality and the generic/infinitesimal Hom bounds, with no `R`-flatness hypothesis on `N`. Theorem 2.44 is a sufficient method to obtain its hypotheses when `N` is `R`-flat; direct projectivity and Cohen–Macaulay arguments also suffice. The compact character is `ζ⁻¹` on `Z∩K`, since smooth objects have character `ζ`. Let `Λ_(P,ζ⁻¹)` be `O[[P]]` modulo the closed relations `z−ζ(z)⁻¹` for `z∈P∩Z`. Require `R` Cohen–Macaulay, `N` `R`-flat and
`projdim_(Λ_(P,ζ⁻¹))(k⊗̂_R N)+max_σ dim_R M(σ)≤dim R`,
where `σ` ranges over weights with the matching smooth central character. Derive projectivity in `Mod^{pro}_{K,ζ⁻¹}(O)`, Cohen–Macaulayness and the cycle formula in this category by the same compact Hom argument. Apply this adapter to `N=P̃`, using Paškūnas15 Corollary 5.3 and §6.1; full `O[[K]]`-projectivity is not an application hypothesis. The finite-dimensional `K`-type and Artinian de Rham inputs of Layer 4 still govern support and reducedness.

**Checks.**

- With `ζ=1`, `z=(1+p)I₂` kills a fixed-character generator through `z−1`. For odd `p`, this element is regular on `O[[K]]`, so a nonzero such generator cannot be projective over the full algebra. Its projectivity is over the central quotient.
- For `p≥5` and generic `ρ̄` in Paškūnas §6.1 (`ρ̄` irreducible, or nonsplit `(χ₁ *;0 χ₂)` with `χ₁χ₂⁻¹∉{1,ω}`), the generator `P̃` and `π` of that section give multiplicity one for `M(σ)` when `Hom_K(σ,π)≠0` (Theorem 6.6).
- Do not extend this check to the nongeneric cyclotomic-extension case: its separate construction and multiplicities, including the peu ramifié multiplicity-two case, belong to [§6.1](#section-6-1).
- For `N=0` the defining compact `Hom` gives `M(Θ)=0`. For `R=O, N=O[[K]]` and `Θ=O` with trivial `K`-action, evaluation at 1 gives `M(Θ)≅O` instead; the construction does not discard the `K`-equivariance condition or replace this dual by a torsion dual.
- A direct sum of two finite-dimensional `K`-types with lattices `Θ₁` and `Θ₂` gives `M(Θ₁⊕Θ₂)≅M(Θ₁)⊕M(Θ₂)`, so two copies of the preceding trivial type give `O²`, rather than `O`.

The source is [Vytautas Paškūnas, PASKUNAS15](#ref-paskunas15), §2.1 setup; Theorems 2.42–2.44, p.16; Corollary 5.3, pp.29–30; Proposition 4.14, p.23; §6.1, Corollary 6.5 and Theorem 6.6, pp.30–32; [Kentaro Nakamura, NAKAMURA23](#ref-nakamura23), §4.3, Theorem 4.7, p. 67 (arXiv).

*Needs:* [§5.3](#section-5-3); [§5.10](#section-5-10); [§5.5](#section-5-5); [§4.5](#section-4-5); [§4.2](#section-4-2); [§4.4](#section-4-4); [§0.5](#support-cycles).

<a id="section-5-12"></a>

### 5.12 Kisin rings from the classical correspondence (Colmez–Dospinescu–Nizioł)

The shared interface `WDTypeRing` is this full-type ring, specialized to weights `{0,1}` when written `R_(B,M)`. Its contracts `WDTypeRing.blockIdentification`, `WDTypeRing.points`, `WDTypeRing.reduced`, `WDTypeRing.pid`, `WDTypeRing.universalRep` and `WDTypeRing.integralImage` are respectively §5.6's centre map, the finite-algebra point criterion below, reducedness/Jacobsonness, the PID decomposition, the rank-two universal family and the integral image in the localized quotient. The `KisinRingLL` names give the same construction for arbitrary distinct weights `a<b`.

Let `M` be an irreducible `(φ, N, G_{ℚ_p})`-module of rank 2, `a < b` integers with `LL^{[a,b]}(M) := LL(M) ⊗ Sym^{b−a−1} ⊗ det^a` having unitary central character, `Λ` a `G`-stable `O_L`-lattice in it, and `B` the block of finite length smooth representations determined by a semisimple `ρ̄` : `G_{ℚ_p} → GL₂(k_L)`. The `B`-adic completion `Λ_B` is the inverse limit of the finite length quotients of `Λ` all of whose Jordan–Hölder factors lie in `B, LL^{[a,b]}_B(M) := L ⊗ Λ_B` (independent of `Λ`), `R^{[a,b]}_{M,B} := End_G(LL^{[a,b]}_B(M))` and `ρ^{[a,b]}_M := V(LL^{[a,b]}_B(M))`. Theorem (CDN, Théorème 0.1): `R^{[a,b]}_{M,ρ̄}` is commutative, the ring of bounded analytic functions on an analytic open of `ℙ¹`, algebraically a finite product of principal ideal domains; `ρ^{[a,b]}_M` is free of rank 2 over it and specialisation `x ↦ ρ_x` is a bijection between its `L'`-points and the `L'`-representations of `G_{ℚ_p}` with semisimplified residual representation `ρ̄` and type `(M, a, b)` (potentially semistable with Hodge–Tate weights `a, b` and `D_pst ≅ M`). This is the `GL₂(ℚ_p)`-side construction of the type-ring interface `R_{B,M}` of §0.4’s full-Weil–Deligne-type locus. The finite product may be empty, giving the zero ring when the type/block locus is empty. The universal property also holds on finite `L`-algebras as in Theorem 5.8, with its fixed determinant and residual-block convention.

Here `M` irreducible (so `LL(M)` supercuspidal); unitary central character; the hidden global ingredient of [§4.2](#section-4-2) (v), i.e. the supercuspidal comparison input, through the identification of `M` with `LL(M)`.

Use the following named operations and compatibility results.

- `KisinRingLL.completion`: `Λ_B`, the `B`-adic completion of a `G`-stable lattice.
- `KisinRingLL.ring`: `R^{[a,b]}_{M,B} = End_G(LL^{[a,b]}_B(M))`.
- `KisinRingLL.family`: `ρ^{[a,b]}_M = V(LL^{[a,b]}_B(M))`.
- `KisinRingLL.ring_comm`: `R^{[a,b]}_{M,B}` is commutative, a finite product of PIDs.
- `KisinRingLL.family_free`: `ρ^{[a,b]}_M` is free of rank 2 over `R^{[a,b]}_{M,B}`.
- `KisinRingLL.points`: `L'`-points of `Spec R^{[a,b]}_{M,B} ↔ L'`-representations with semisimplified residual representation `ρ̄` and type `(M, a, b)`.

Construct `Λ_B` and `LL^{[a,b]}_B(M)` by `B`-adic completion (CDN-Kisin §2).

Local `R = T` ([§5.6](#section-5-6)) shows `V(LL_B)` is of `GL₂` type and gives the `R^{ps}`-action.

Use the all-prime Artinian de Rham criterion [§4.10](#section-4-10), the formal parameterisation by a filtration line, and Theorem 5.4 to prove the type space smooth of pure dimension one. Corollary 5.5 then gives a finite product of principal ideal domains and rank-two freeness; Theorem 5.8 supplies the Artinian universal property.

Comparison with Kisin's rings via the universal property of potentially semistable deformation rings (§0.4).

**Checks.**

- `KisinRingLL.indep_lattice`: `LL^{[a,b]}_B(M)` does not depend on the choice of `Λ`.
- `KisinRingLL.empty`: If no representation of type `(M, a, b)` has semisimplified residual representation `ρ̄`, then `R^{[a,b]}_{M,B} = 0`.
- `KisinRingLL.not_local`: `R^{[a,b]}_{M,B}` is in general not local: it is a finite product of principal ideal domains, one factor per component.
- `KisinRingLL.compat_typeRing`: `R^{[a,b]}_{M,B} ≅ R_{B,M}` of §0.4’s full-Weil–Deligne-type locus after inverting `p`.
- For `ρ̄` generic, the result is compatible with Kisin's rings, up to the ambiguity `M` versus `M ⊗ μ_{−1}` (CDN Remarque 0.2(i)).

The source is [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDNKISIN](#ref-cdnkisin), Theorem 0.1, pp.1–2; §4.1, Theorem 4.1, pp.13–15; Lemma 5.3 and Theorem 5.4, p.20; Corollaries 5.5–5.7 and Theorem 5.8, pp.21–22.

*Needs:* [§5.6](#section-5-6); [§5.1](#section-5-1); [§4.1](#section-4-1); [§4.9](#section-4-9); [§3.2](#section-3-2); [§0.4](#support-deformations); [§4.10](#section-4-10).

<a id="section-5-13"></a>

### 5.13 Admittance of residual representations by types (BCDT)

Let `ℓ` be an odd prime and `ρ̄` : `G_ℓ → GL₂(𝔽̄_ℓ)` continuous. For the irreducible `𝔽̄_ℓ`-representations `σ_{n,m}` of `GL₂(ℤ_ℓ), σ'_{m₁,m₂}` of `U₀(ℓ)` and `σ'_{{m₁,m₂},a}, σ'_{{m},a}` of `Ũ₀(ℓ)` ([§2.8](#section-2-8)), Breuil–Conrad–Diamond–Taylor define when `σ` admits and simply admits `ρ̄`, explicitly in terms of `ρ̄|_{I_ℓ}` through the fundamental characters `ω, ω₂`, the peu/très ramifié condition, and central characters `(ω^{−1}det ρ̄)|_{W_ℓ}`; e.g. `σ_{n,m}` admits `ρ̄` iff `ρ̄|_{I_ℓ} ≅ ω₂^{1−ℓn−m(ℓ+1)} ⊕ ω₂^{ℓ−n−m(ℓ+1)}` or `ρ̄|_{I_ℓ} ≅ (ω^{1−m} *; 0 ω^{−n−m})` (peu ramifié if `n = 0`), and `σ_{n,0}` admits `ρ̄` iff `σ_{n,0}` belongs to the full Serre-weight set of `ρ̄^∨⊗ω`, including both boundary labels when they occur. An `ℓ`-type `τ` (reducible: `σ_τ` a representation of `GL₂(ℤ_ℓ)`; irreducible: of `U₀(ℓ)`; extended type `τ'` with irreducible restriction to `I_ℓ`: of `Ũ₀(ℓ)`) admits `σ` if `σ` is a Jordan–Hölder constituent of `Λ ⊗ 𝔽̄_ℓ` for an invariant lattice `Λ ⊂ σ_τ`, simply if with multiplicity one; `τ` (simply) admits `ρ̄` if it admits some `σ` that admits `ρ̄` (resp. a unique such `σ`, simply, which simply admits `ρ̄`). The remaining cases are fixed as follows. Choose exponents in `{0,…,ℓ−2}`. An Iwahori character `σ′_{m₁,m₂}` admits `ρ̄` when inertia is either the niveau-two pair with exponents `1−ℓm_i−m_j` and `ℓ−m_i−ℓm_j` (`m_i≥m_j` and `{m_i,m_j}={m₁,m₂}`), or an extension with diagonal `(ω^{1−m₁},ω^{−m₂})`, or one with the two exponents interchanged. If `m₁≠m₂` it simply admits precisely in the two extension cases; if `m₁=m₂` it simply admits precisely for the très ramifié extension. A two-dimensional normaliser representation `σ′_{{m₁,m₂},a}` admits when its Iwahori restriction admits and its central character is `ω^{-1}det ρ̄`; it simply admits when that central condition holds and one of the two extension cases holds. The normaliser character `σ′_{{m},a}` requires Iwahori admittance and the same central condition; in the très ramifié case it additionally requires a quotient of `ρ̄` equal to `ω^{-m}χ` for unramified `χ` with Frobenius value `−a`. For this normaliser character simple admittance equals admittance; for `σ_{n,m}` it also equals admittance. A type simply admits `ρ̄` exactly when it has a unique admitted constituent, that constituent occurs with multiplicity one, and the constituent itself simply admits `ρ̄`.

Here `ℓ` is odd, as in BCDT §§1.2–1.3; weight 2 (potentially Barsotti–Tate) types as in BCDT; the definition uses `ρ̄` rather than its Cartier dual because of the normalisations of CDT.

Use the following named operations and compatibility results.

- `Admits.sigma`: `σ` admits `ρ̄`: the explicit condition on `ρ̄|_{I_ℓ}` for each of the families `σ_{n,m}, σ'_{m₁,m₂}, σ'_{{m₁,m₂},a}, σ'_{{m},a}`.
- `Admits.simply`: `σ` simply admits `ρ̄`.
- `Admits.type`: `τ` admits `ρ̄` iff some constituent of the reduction of `σ_τ` admits `ρ̄`.
- `Admits.serreWeight`: `Admits.sigma σ_{n,0} ρ̄ ↔ σ_{n,0}∈W_Serre(ρ̄^∨⊗ω)`, where `W_Serre` is the full finite set given by the local Serre-weight recipe, including `n=0` and `n=ℓ−1` when both occur.
- `Admits.simply_imp`: Simple admittance implies admittance.

Spell out each case of BCDT §1.3 on the classification of [§2.8](#section-2-8).

Compare the inertia-and-extension recipe for the full set `W_Serre(ρ̄^∨⊗ω)` with the displayed admittance table. The comparison is set membership; it does not identify every admitted label with a single minimal integer weight.

Use §0.3's fundamental characters and unit-Kummer subspace. In these extension formulas, “peu ramifié” means membership in `peuRamifieH1`, including split classes; it does not impose the nontrivial-wild hypothesis of `IsPeuRamifiee`.

**Checks.**

- `Admits.sigma00`: `σ_{0,0}` admits `ρ̄` iff `ρ̄|_{I_ℓ} ≅ (ω *; 0 1)` peu ramifié or `ω₂ ⊕ ω₂^ℓ`.
- `Admits.sigma_n_m_irreducible`: For irreducible `ρ̄` with `ρ̄|_{I_ℓ} ≅ ω₂^{1−ℓn} ⊕ ω₂^{ℓ−n}, σ_{n,0}` admits `ρ̄`. The irreducibility condition is on `ρ̄`, not on this direct sum of inertia characters.
- `Admits.tres_ramifie_excluded`: `σ_{0,0}` does not admit `ρ̄` with `ρ̄|_{I_ℓ} ≅ (ω *; 0 1)` très ramifié.
- `Admits.no_type`: A type whose reduction has no constituent admitting `ρ̄` does not admit `ρ̄`.
- At `p=5`, `ρ̄=ω⊕1` is split and hence peu ramifié. Both `σ_(0,0)` and `σ_(4,0)` admit it; the full Serre-weight set of `ρ̄^∨⊗ω` retains both labels, whose integer weights are 2 and 6.
- `σ_{0,0}` admits `ρ̄` iff `ρ̄|_{I_ℓ} ≅ (ω *; 0 1)` peu ramifié or `ρ̄|_{I_ℓ} ≅ ω₂ ⊕ ω₂^ℓ`.
- Simple admittance implies admittance.
- A reduction consisting of one simply admitted constituent with multiplicity one simply admits `ρ̄`. Two copies of that constituent still admit `ρ̄` but fail simple admittance; two distinct admitted constituents also fail simple admittance. These distinguish the unique-constituent and multiplicity-one requirements.

The source is [Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor, BCDT01](#ref-bcdt01), §1.3, pp. 854–856 (published; pp. 10–12 of Breuil's author copy).

*Needs:* [§2.8](#section-2-8); [§4.4](#section-4-4).

<a id="section-5-14"></a>

### 5.14 BCDT's Conjecture 1.3.`1(1)` from the Breuil–Mézard identity

Let `p=ℓ>2, k ⊂ 𝔽̄_p` finite, `ρ̄` : `G_{ℚ_p} → GL₂(k)` continuous with centraliser `k, τ` an `ℓ`-type (resp. `τ'` an extended type with irreducible restriction to inertia) with tamely ramified determinant and non-central image. If `ρ̄` satisfies the Breuil–Mézard cycle identity ([§5.10](#section-5-10)) and `C_σ(ρ̄) ≠ 0` exactly when the dual weight `σ∨` admits `ρ̄` in BCDT's convention, then `τ` (resp. `τ'`) admits `ρ̄` iff `R^D_{V,O} ≠ 0` (resp. `R^{D'}_{V,O} ≠ 0`), i.e. iff `ρ̄` has a potentially Barsotti–Tate lift of type `τ` (resp. extended type `τ'`). The all-residual identities of [§6.3](#section-6-3) and [§6.5](#section-6-5) carry their explicit arithmetic patching hypotheses; Paškūnas 2015 gives `C_σ(ρ̄) ≠ 0` iff `Hom_K(σ, β) ≠ 0` for Colmez's atom `β` of `ρ̄` when `p ≥ 5` and `End ρ̄ = k`. Part `(2)` of the conjecture (simple admittance `⇔` acceptability) is not derived here. Acceptability means `R^D≠0` and existence of a surjective local `O`-algebra map `O[[X]]→R^D`, with the same definition for `R^{D′}`; it is a property of that deformation ring. Nonvanishing alone does not give this one-parameter presentation (BCDT §1.1, author p.7). For the extended-type assertion the ordinary inertial cycle identity must be replaced by the corresponding extended-type cycle/nonvanishing comparison; this extra hypothesis is part of the admitted-weight and extended-type comparison, since an inertial ring need not select an unramified quadratic branch.

Here `p=ℓ>2`; the hypotheses of BCDT Conjecture 1.3.1; the identification of `{σ∨ : C_σ(ρ̄) ≠ 0}` with BCDT's admitted weights (the admitted-weight and extended-type comparison). For extended types, also assume the type-specific nonvanishing/cycle comparison in the admitted-weight and extended-type comparison; ordinary inertial-type cycles alone do not distinguish the two unramified quadratic extensions.

For `U₀(ℓ)`-types use `Ind_(U₀(ℓ))^(GL₂(ℤ_ℓ)) σ_τ`: an Iwahori constituent admits `ρ̄` iff some constituent of its induction admits `ρ̄` (BCDT §1.3). For `Ũ₀(ℓ)`-types keep the normalizer representation and its `w_ℓ` action: `w_ℓ` has determinant of valuation one and lies outside `GL₂(ℤ_ℓ)`, so no such induction to `GL₂(ℤ_ℓ)` is defined. Restriction to the Iwahori forgets the normalizer branch. The extended-type deduction instead uses the branch-sensitive cycle/nonvanishing comparison in the statement, with normalizer labels and `w_ℓ` eigenvalues retained.

Transport the characteristic-zero type convention by duality as well: if `b_η(τ)` is the multiplicity of a BCDT weight `η` in its type reduction, the corresponding Breuil–Mézard multiplicity is `m_σ(τ)=b_(σ∨)(τ)`. This type-normalization comparison is a hypothesis of the deduction, including Iwahori induction; normalizer cases require the separate branch-sensitive comparison and are not identified by restriction and induction. By the transported cycle identity, `z(R^D/ϖ) = Σ_σ b_(σ∨)(τ)C_σ(ρ̄)`; since `R^D` is `O`-flat, `R^D ≠ 0` iff `R^D/ϖ ≠ 0` iff some `σ` with `b_(σ∨)(τ)>0` has `C_σ(ρ̄) ≠ 0`.

`C_σ(ρ̄) ≠ 0` iff `σ∨` admits `ρ̄`: for `p ≥ 5, End ρ̄ = k`, from Paškūnas 2015 Theorem 1.1(iii) (`z(σ, ρ̄) ≠ 0` iff `Hom_K(σ, β) ≠ 0`) and the `K`-socle of `β`; in general this matching of BCDT's explicit list with the cycles is the admitted-weight and extended-type comparison in the statement.

This implication is conditional on the admitted-weight/nonzero-cycle comparison in the statement. For `p≥5` and `End ρ̄=k`, Paškūnas 2015 Theorem 1.1(iii) identifies nonzero cycles with `K`-socle occurrence in the atom `β`. Use the BCDT table with `σ∨`, where `σ_(n,m)∨=σ_(n,−n−m)`, or equivalently use the original label on `ρ̄∨⊗ω`. Apply this same dual relabelling to type-reduction multiplicities. Other odd-prime residual classes require their own admitted-weight comparison. The all-prime Henniart types of §4.4 do not supply a dyadic BCDT normalizer-type construction; the BCDT interface here has domain `p>2`. An extended type also requires a branch-sensitive nonvanishing result, since inertial cycles do not distinguish unramified quadratic branches. The acceptability assertion in BCDT Conjecture 1.3.`1(2)` also requires the one-parameter presentation and is not inferred from ring nonvanishing.

**Checks.**

- At `p≥5`, for a très ramifié extension `0→ω→ρ̄→1→0`, the normalizer characters `(m,a)=(0,1)` and `(0,−1)` have identical Iwahori restriction and central character. The quotient-Frobenius condition admits only `a=−1`; their restricted-and-induced `K`-representations cannot detect this difference.
- The nonzero ring `O[[X,Y]]` has two independent relative tangent directions, so no surjective local `O`-algebra map `O[[T]]→O[[X,Y]]` exists. Nonvanishing does not imply acceptability; `O[[X]]` itself is acceptable.
- At `p=2`, §4.4 still supplies its inertial `K`-type contract, while the BCDT-specific deduction here does not apply. At `p=3`, its odd-prime type construction does apply, with the admitted-weight and branch comparisons still required.
- At `p=5`, `ρ̄=ind(ω₂²)` has inertia exponents `{2,10}` modulo 24. Its supersingular socle contains `σ=Sym¹`, while the undualized BCDT label requires `{20,4}`. The dual label `σ_(1,−1)` gives `{2,10}`.
- Duality sends `(n,m)` to `(n,−n−m)` and applying it twice recovers `(n,m)`; multiplicity two remains two under relabelling.
- Weight 2, `τ` trivial (crystalline): admittance by `σ_{0,0} ⇔ ρ̄` has a crystalline lift with Hodge–Tate weights 0, 1 (finite flat).

The source is [Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor, BCDT01](#ref-bcdt01), §1.3, Conjecture 1.3.1, p. 856 (published; p. 12 of the author copy); [Vytautas Paškūnas, PASKUNAS15](#ref-paskunas15), Theorem 1.1 and the paragraph after it, pp. 2–3.

*Needs:* [§5.13](#section-5-13); [§5.10](#section-5-10); [§4.4](#section-4-4).

### Examples

At weight `(0,1)` and trivial crystalline type the cycle formula has only `C_triv`. An empty type ring has zero cycle, and positivity forces every occurring weighted cycle to vanish. Distinct effective cycles can have equal multiplicities, so numerical equality does not recover the cycle formula. On a scalar `p=2` residual representation, the determinant-law formulation remains meaningful while trace-only reconstruction is unavailable.

### Dependencies

Layers 1–4; IntegralHeckeAndGaloisDeterminants Layers 0–1; §0.4 including its dyadic fixed-determinant contract; §0.5; the local Galois/Serre-weight ramification interface; Gabriel–Morita and restricted-projectivity targets. Supercuspidal type-ring and cycle uses retain the comparison input from Layer 4.

## Layer 6: Breuil–Mézard and geometric applications

<a id="section-6-0"></a>

### 6.0 The nongeneric cyclotomic-extension compact module

Let `p≥5`, `ρ̄≅(χω *;0 χ)` be nonsplit, and fix the smooth central character `ζ` with Galois determinant `ζε`. Normalize `χ=1` by twisting. Construct `NongenericBM.beta`, Colmez’s finite-length representation `β` with socle `Sp` and semisimplification `Sp⊕1⊕π_α`, where `π_α=Ind_B^G(ω⊗ω⁻¹)`, and prove `V̌(β∨)≅ρ̄`. Its extension class recovers `ρ̄`; include uniqueness and the character-twist comparison. Prove `NongenericBM.deformationEquiv`, identifying the compact deformation functor of `β∨` in the prescribed-central-character category with the fixed-determinant Galois deformation functor. Construct `NongenericBM.universalCompact`, its universal deformation `N` over `R^ψ_ρ̄≅O[[x₁,x₂,x₃]]`; `N` is not replaced by a projective envelope. Source: Paškūnas15 §6.2, Lemmas 6.7–6.9, Theorem 6.10 and Definition 6.11, pp.32–33.

**Checks.**

- Reduction `k⊗̂_R N≅β∨` has dual with socle `Sp` and exactly the three stated Jordan–Hölder factors; a single principal series or the generic envelope has the wrong reduction.
- Twisting by `χ∘det` gives `V̌(β∨)≅ρ̄` with the stated determinant and inverse compact central character, rather than changing only the inertia labels.
- Both peu and très ramifié nonsplit extensions occur. The split representation fails the nonsplit hypothesis and is not a case of this deformation equivalence.

Prove `NongenericBM.flat_projective_support`: `N` is `R`-flat, projective on restriction in `Mod^pro_(K,ζ⁻¹)(O)`, and satisfies the finite-type support, generic multiplicity and dimension conditions of §5.11’s fixed-character cycle criterion. Construct `M(σ)` and `M(Θ)` from this `N`. Prove the projective-dimension bound over the central quotient using Paškūnas15 Proposition 6.21, then apply Theorem 2.44 and Corollary 6.22. Prove the type-annihilator comparisons, including the scalar weight-two case of Proposition 6.23, before deducing Theorem 6.24. Source: Paškūnas15 §6.2, Propositions 6.20–6.23, Corollary 6.22 and Theorem 6.24, pp.36–38.

**Checks.**

- In the normalized très ramifié case only `M(st)` is nonzero; in the peu ramifié nonsplit case both `M(1)` and `M(st)` are nonzero, all with support dimension at most one.
- For the peu ramifié case, `M(st)` has Hilbert–Samuel multiplicity 2 and `M(1)` has multiplicity 1. The très ramifié nonzero cycle has multiplicity 1.
- The compact projectivity is in the fixed-character category. The regular central element `z−ζ(z)⁻¹` obstructs projectivity over the full `O[[K]]`; flatness over `R` does not remove this obstruction.

*Needs:* [§5.11](#section-5-11)’s general fixed-character criterion; [§5.10](#section-5-10); [§3.3](#section-3-3); [§2.3](#section-2-3); [§0.4](#support-deformations); [§0.5](#support-cycles). The generic envelope identifications of §§5.5 and 5.8 are not inputs to this construction.

<a id="section-6-0a"></a>

### 6.0a The reverse-cyclotomic projective envelope

For `p≥5` and a nonsplit `ρ̄=(χ *;0 χω)`, fix `ζ` with `det ρ̄=ζε` modulo `ϖ`, and write `ψ=ζ` for the determinant parameter of §5.10. Put `π=π_α⊗(χ∘det)=Ind_B^G(χω⊗χω⁻¹)` and let `P̃→π∨` be its projective envelope with compact central character `ζ⁻¹`. Prove **`ReverseCyclotomicBM.envelope_comparison`**: `E=End(P̃)≅R^ψ_ρ̄`, `V̌(P̃)` is the rank-two universal deformation with determinant `ψε`, and the residual module `Q=k⊗̂_E P̃` fits into the nonsplit sequence `0→(τ₁⊗(χ∘det))∨→Q→π∨→0`, where `0→Sp→τ₁→1⊕1→0` is Paškūnas's specified universal two-dimensional extension. Construct this `τ₁` and `Q`, including the linking extension classes; their semisimplifications alone do not specify them. Prove finite generation of `Q` over `O[[K]]`, absence of `SL₂`-invariants in `P̃∨`, and projectivity of `P̃` on restriction to the prescribed-central-character compact `K`-category. Prove exact completed tensoring with `V̌(P̃)`, equivalently its `E`-flatness; compare it with the flat image of `P̃` in the quotient by objects with trivial `SL₂`-action. Sources: Paškūnas15 §6.1, Proposition 6.1, equation (35), Remarks 6.2–6.3 and Corollary 5.3, pp.29–31; Paškūnas13 §10.2–§10.4, especially Remark 10.33, Corollary 10.41, Lemma 10.42, Theorem 10.71 and Corollary 10.72, pp.115–129 in arXiv v3. The last two give respectively the endomorphism-ring and universal-Galois-deformation comparisons.

Apply §5.11's fixed-character Theorem 2.42 criterion directly. Restricted `K`-projectivity is Corollary 5.3; the Cohen–Macaulay and equidimensional type-support conclusions come from Paškūnas15 Corollary 6.4, using Lemma 2.33 and Proposition 2.29. Corollary 6.5 identifies the type annihilator and Theorem 6.6 gives the cycles and multiplicity one. This route uses flatness of the Galois realization, not an assertion that the full `P̃` is `R^ψ_ρ̄`-flat; Theorem 2.44's sufficient flatness criterion is not required. The universal smooth-deformation comparison of §5.8 retains its two orientation exclusions.

**Checks.**

- For a nonsplit `0→1→ρ̄→ω→0`, the subcharacter/quotient ratio is `ω⁻¹`. It is generic in Paškūnas15 §6.1 but excluded from §5.8, and uses this envelope with the displayed `τ₁` residual extension.
- Twisting by `χ` preserves that ratio. Duality reverses and inverts the characters simultaneously, also preserving it; neither operation turns this case into §6.0's ratio `ω`.
- The inducing characters `χω,χω⁻¹` give central character `χ²=(ω⁻¹det ρ̄)`, as required. Reduction of `V̌(P̃)` is `ρ̄`, whereas reduction of the full compact envelope is `Q`, with the additional character and Steinberg constituents above. A rank-two Galois free module does not identify `Q` with a generic two-principal-series extension.
- Restricted projectivity has central character `ζ⁻¹`; it gives the exact compact Hom used in the cycle criterion. Flatness after quotienting out the `SL₂`-trivial subcategory does not alone imply flatness of the original envelope.

*Needs:* [§2.2–§2.3](#section-2-2); [§3.3](#section-3-3); [§5.1](#section-5-1); [§5.11](#section-5-11)'s general fixed-character criterion; [§4.5](#section-4-5); [§0.4](#support-deformations); [§0.5](#support-cycles).

<a id="section-6-1"></a>

### 6.1 Paškūnas 2015: Breuil–Mézard for `p ≥ 5` and `End ρ̄ = k`

Let `p ≥ 5` and `ρ̄` : `G_{ℚ_p} → GL₂(k)` with `End_{G_{ℚ_p}}(ρ̄) = k` (`ρ̄` absolutely irreducible or a non-split extension of two distinct characters), `R_ρ̄` its universal deformation ring. For every p-adic Hodge type `(w, τ, ψ)` in the normalisation of [§5.10](#section-5-10) (`det = ψε, ψ|_I = ε^{a+b−1}det τ`; Paškūnas’s source `ψ` equals this `ψε`): (i) there is a reduced `O`-torsion-free quotient, of absolute dimension two when nonzero, `R^ψ_ρ̄(w, τ)` (resp. `R^{ψ,cr}_ρ̄(w, τ)`) of `R_ρ̄` whose `L`-points are the potentially semistable (resp. crystalline) deformations of type `(w, τ, ψ)`; (ii) for each irreducible smooth `k`-representation `σ` of `K` there is a one-dimensional cycle `z(σ, ρ̄)` of `R_ρ̄`, independent of `(w, τ)`, with `z₁(R^ψ_ρ̄(w, τ)/ϖ) = Σ_σ m_σ(w, τ)z(σ, ρ̄)` and `z₁(R^{ψ,cr}_ρ̄(w, τ)/ϖ) = Σ_σ m^cr_σ(w, τ)z(σ, ρ̄)`; (iii) `z(σ, ρ̄) ≠ 0` iff `Hom_K(σ, β) ≠ 0, β` the atom attached to `ρ̄` by Colmez, and then its Hilbert–Samuel multiplicity is 1, except for the Steinberg-weight cycle of a nonsplit peu ramifié `ρ̄≅(ω *;0 1)⊗χ`, where it is 2; its character-weight cycle still has multiplicity 1. The cyclotomic-extension case `ρ̄ ≅ (ω *; 0 1) ⊗ χ` uses the nongeneric construction, while the other cases also follow from Kisin’s theorem.

Here `p ≥ 5`; `End(ρ̄) = k`. Split `ρ̄` (Hu–Tan) and non-split self-extensions `(χ *; 0 χ)` are not covered.

For irreducible `ρ̄` or nonsplit extensions with character ratio outside `{1,ω,ω⁻¹}`, apply §5.11’s fixed-character criterion to `N=P̃`, using §5.5’s envelope comparison and §5.8’s flatness. The generic branch of Paškūnas15 also contains ratio `ω⁻¹`: use §6.0a’s separate residual module, envelope/Galois comparison, restricted projectivity and type-support theorem for that case. For ratio `ω`, use [§6.0](#section-6-0)’s `β` and universal compact deformation `N`, its `R`-flatness, fixed-character `K`-projectivity and support comparisons. These cases give Theorems 6.6 and 6.24 without applying §5.8 to either excluded orientation.

Supports of `M(Θ)` for `Θ ⊂ σ(w, τ)`: Proposition 4.14 via [§4.5](#section-4-5) and [§4.2](#section-4-2).

Cycles `z(σ, ρ̄) := z₁(M(σ))`, their nonvanishing and multiplicity: Theorem 6.6 and §6 (generic and non-generic cases; Theorem 6.24 for `(χω *; 0 χ)`).

**Checks.**

- A nonsplit `0→1→ρ̄→ω→0` has scalar endomorphisms and uses §6.0a; it satisfies the theorem even though neither §5.8 nor §6.0 covers it.
- For `ρ̄` absolutely irreducible, `z(σ, ρ̄) ≠ 0` exactly for the Serre weights `σ` of `ρ̄` (the `K`-socle of the supersingular `π` with `V(π) ↔ ρ̄`).
- For `(w, τ) = ((0,1), 1)` crystalline, `R^{ψ,cr}_ρ̄((0,1), 1)` is the finite flat deformation ring and its special fibre cycle is `z(1, ρ̄)`.

The source is [Vytautas Paškūnas, PASKUNAS15](#ref-paskunas15), Theorem 1.1 and the paragraph after it, pp.2–3; §6.2, Theorem 6.10, Definition 6.11, Corollary 6.22 and Theorem 6.24, pp.32–38.

*Needs:* [§5.11](#section-5-11); [§5.10](#section-5-10); [§4.5](#section-4-5). Ratios outside `{1,ω,ω⁻¹}` and irreducible representations use §§5.5 and 5.8; ratio `ω⁻¹` uses §6.0a; ratio `ω` uses §6.0.

<a id="section-6-2"></a>

### 6.2 Hu–Tan: Breuil–Mézard for split non-scalar `ρ̄, p ≥ 5`

Let `p ≥ 5` and `ρ̄ ≅ χ₁ ⊕ χ₂` with `χ₁ ≠ χ₂`. For every `(k, τ, ψ)` (Hodge–Tate weights `(0, k−1), WD(ρ)|_I = τ, det ρ = ψε, ψ|_I = ε^{k−2}det τ`) there are 4-dimensional cycles `Z_{n,m}` of the framed ring `R^□(ρ̄)`, independent of `(k, τ, ψ)`, with `Z(R^{□,ψ}(k, τ, ρ̄)/ϖ) = Σ_{n,m} a_{n,m}(k, τ)Z_{n,m}` and `Z(R^{□,ψ}_cr(k, τ, ρ̄)/ϖ) = Σ a^cr_{n,m}(k, τ)Z_{n,m}`, where `a_{n,m}(k, τ)` is the multiplicity of `σ_{n,m} = Sym^n k² ⊗ det^m` in the reduction of `Sym^{k−2} ⊗ σ(τ)`; moreover `Z_{n,m} = Z(R^{□,ψ}_cr(n+2, (ω̃^m)^{⊕2}, ρ̄)/ϖ)`. The generic case `χ₁χ₂^{−1} ∉ {1, ω^{±1}}` is Remark 5.7; the non-generic case `ρ̄ ≅ 1 ⊕ ω` (up to twist) is Theorems 5.11–5.12, with explicit cycles in terms of the three minimal primes of the versal ring over `J`. The cycles are independent of the compatible lift `ψ` as well as of the type; changing framing is handled through the versal-ring comparison, not a scalar-endomorphism unframed universal ring for the split representation.

Here `p ≥ 5` (standing assumption); `ρ̄` split with distinct characters; scalar `ρ̄` and non-split self-extensions are not covered.

Work with versal deformation rings and pseudodeformation rings `R^{ps}` ([§5.4](#section-5-4)), transferring to framed rings by formal smoothness of framed over versal rings.

Use Paškūnas's `Z_B ≅ R^{ps,ζ}` and the endomorphism rings of the projective envelopes of the two principal series ([§5.5](#section-5-5)) with the criterion [§5.11](#section-5-11).

Non-generic case: explicit versal rings (Hu–Tan §3) and Theorems 5.11–5.12.

**Checks.**

- For `ρ̄ = 1 ⊕ ω, Z(R^{ver}(k, τ, ρ̄)/ϖ) = a_{p−3,1}𝔭₁ + a_{0,0}𝔭₂ + a_{p−1,0}(𝔭₂ + 𝔭₃)`.

The source is [Yongquan Hu, Fucheng Tan, HU-TAN15](#ref-hu-tan15), Notation, p. 1 `(p ≥ 5)`; Theorem 1.1 (Kisin), p. 3; Theorem 1.3, p. 4; Remark 5.7, p. 30; Theorems 5.11–5.12, pp. 32–33 (arXiv).

*Needs:* [§5.10](#section-5-10); [§5.5](#section-5-5); [§5.4](#section-5-4); [§5.11](#section-5-11); [§0.4](#support-deformations).

<a id="section-6-3"></a>

### 6.3 Tung: the conditional arithmetic-action cycle deduction for `p > 2`

Let `p > 2` and `r̄` : `G_{ℚ_p} → GL₂(k)` be continuous. Assume the actual patched arithmetic-action data and comparisons below. Then for each smooth irreducible `k`-representation `σ̄` of `K` there is a 4-dimensional cycle `C_σ̄(r̄)` of `R^{□,ψ}_r̄`, independent of `(λ, τ)`, such that for all p-adic Hodge types `(λ, τ, ψ) (λ = (a, b), a > b; det r = ψε, ψ|_I = ε^{a+b−1}det τ) Z(R^{□,ψ}_r̄(λ, τ)/ϖ) = Σ m_σ̄(λ, τ)C_σ̄(r̄)` and `Z(R^{□,ψ,cr}_r̄(λ, τ)/ϖ) = Σ m^cr_σ̄(λ, τ)C_σ̄(r̄)`. The exceptional `p=3` cyclotomic-extension case carries its separate comparison in Remark 4.5.

The target `BMCycles.of_arithmeticAction` takes an actual compact patched module `M_∞` over a specified patched deformation algebra `R_∞`, with continuous `G`-action, arithmetic-action axioms, projectivity in the prescribed central-character compact category and compatible type functors `M_∞(Θ)`. The **arithmetic patching inputs** include a globalization realizing `r̄`, comparison of `R_∞(Θ)` with the local type ring after specified formally smooth variables and coefficient factors, and component support for every relevant type. Require also the generic multiplicity comparison identifying the cycles of `M_∞(Θ)/ϖ` and `R_∞(Θ)/ϖ`; support alone does not identify their multiplicities. Exact reduction decomposes the module cycles with the type's Jordan–Hölder multiplicities. The special lifted-weight comparison identifies weight cycles with the local crystalline cycles after the same pullback. Its injectivity descends the resulting identity.

These are explicit hypotheses of the local deduction. They are the comparisons used in Tung21A Proposition 4.4 and the proof of Theorem 1.2, pp.13–14, including Remark 4.5's exceptional case. Corollary 4.6 follows from Theorem 1.2 through Emerton–Gee Theorem 5.5.2; it is not a prerequisite proving that theorem. This target does not construct the global patched data from the local block objects.

**Checks.**

- For `p ≥ 5` and the supplied patched data this agrees with Paškūnas 2015 and Hu–Tan.
- At `p=3` the cyclotomic-extension case requires Remark 4.5's exceptional comparison.
- The zero patched module fails component support on a nonempty type ring.
- Doubling a full-support module preserves support but doubles its cycle; the generic-multiplicity comparison excludes this replacement.

The source is [Shen-Ning Tung, TUNG21A](#ref-tung21a), Abstract and introduction, pp. 1–3; Conjecture 1.1, p. 3; Theorem 1.2, p. 4; Corollary 4.6, p. 14 (arXiv v4); [Luis Dieulefait, Ariel Pacetti, DP22](#ref-dp22), Proof of Theorem 1.4, p. 4.

*Needs:* the actual arithmetic-action, component-support and support-to-cycle data in this statement; [§5.10](#section-5-10); [§5.2](#section-5-2); [§5.6](#section-5-6); [§3.2](#section-3-2); [§0.4](#support-deformations).

<a id="section-6-4"></a>

### 6.4 Paškūnas 2016: Breuil–Mézard at `p = 2` for generic blocks

Let `p = 2` and `ρ̄` with `ρ̄^{ss}` in a block of type (i) (supersingular) or (ii) (generic reducible). For the unframed `(End ρ̄ = k)` case there are cycles `{C_σ} ⊂ Z₁(R^ψ/ϖ)`, one per irreducible `σ` of `K`, with `z₁(R^ψ(w, τ)/ϖ) = Σ m_σ(w, τ)C_σ` and `z₁(R^{ψ,cr}(w, τ)/ϖ) = Σ m^cr_σ(w, τ)C_σ` for all p-adic Hodge types `(w, τ) (det = ψε, ψ|_I = ε^{a+b−1}det τ), C_σ ≠ 0` iff `Hom_K(σ, π) ≠ 0`, then with multiplicity 1; for `ρ̄ = χ₁ ⊕ χ₂` split generic, framed cycles `{C_{1,σ}, C_{2,σ}} ⊂ Z₄(R^{ψ,□}/ϖ)` with `z₄(R^{ψ,□}(w, τ)/ϖ) = Σ m_σ(w, τ)(C_{1,σ} + C_{2,σ})` and the crystalline analogue, `C_{i,σ} ≠ 0` iff `σ` occurs in the `K`-socle of the corresponding principal series. Henniart's types are not unique for `p = 2`; the multiplicities do not depend on the choice.

Here `p = 2`; blocks of types (i) and (ii) only; the remaining case `r̄ ≅ (χ *; 0 χ)` is [§6.5](#section-6-5).

Local: use the endomorphism ring of the individual projective envelope attached to the chosen nonsplit residual representation ([§5.5](#section-5-5) (iii)). The whole `E_B` is the fixed-determinant deformation ring only in the supersingular singleton case; verify Paškūnas's criterion ([§5.11](#section-5-11)), the multiplicity condition by Proposition 2.33 using Dospinescu's argument with `det V̌(Π) = ψε` and `dim Ext¹ = 3` (Corollaries 2.24, 2.26), and the locally algebraic completion input for `p = 2` (proof of Proposition 2.33). Proposition 2.33 works at all `p` in the generic residual setting and explicitly replaces the `p≥5` hypothesis using these determinant and `Ext` computations; the Artinian de Rham theorem gives the separate all-prime family criterion.

Paškūnas 2016 Theorem 2.34 gives the unframed case; Theorem 2.37 gives the split case, with the framed cycles and their principal-series socle criterion.

**Checks.**

- For `σ` in the `K`-socle of `π, C_σ` is a multiplicity-one cycle.

The source is [Vytautas Paškūnas, PASKUNAS16](#ref-paskunas16), §2, pp. 20–21 (p-adic Hodge types and Henniart's types at `p = 2`); Proposition 2.33, p. 22; Theorem 2.34, p. 23; Theorem 2.37, p. 24 (arXiv v2).

*Needs:* [§5.5](#section-5-5); [§5.11](#section-5-11); [§5.10](#section-5-10); [§4.4](#section-4-4); [§4.10](#section-4-10).

<a id="section-6-5"></a>

### 6.5 Tung: the conditional dyadic arithmetic-action cycle deduction

Let `p = 2` and `r̄` : `G_{ℚ_2} → GL₂(k)` be continuous. Assume the actual dyadic patched data below. Then the cycle and numerical Breuil–Mézard identities of Tung's Conjectures 5.1.2–5.1.3, as in [§5.10](#section-5-10), hold, including for `r̄ ≅ (χ *; 0 χ)`.

The target `BMCycles.of_dyadicArithmeticAction` takes an actual module `M_∞`, arithmetic and deformation actions and exact type functors over a totally real globalization with 2 completely split. Assume their local-type-ring comparison up to the specified formal variables, component support for every type as in Tung21B Theorem 8.0.1, and the generic multiplicity and support-to-cycle comparisons of Lemma 5.3.2 and Theorem 5.3.3. Include the globalization data of Lemma 4.3.3. These hypotheses cover scalar residual representations and all relevant components. Apply Theorem 5.3.3 to deduce Corollary 8.0.2's cycle identity and §5.10's associativity formula to get the numerical identity. The local blocks and all-prime Artinian de Rham calculation supply local comparisons; they do not construct the global patched module or its component support. No splitting of determinant variables using `1/2` enters this deduction.

**Checks.**

- For `r̄ ≅ (χ *; 0 χ)`, the supplied scalar-case patched data give the framed cycles of Tung's Conjecture 5.1.3.
- The zero patched module fails component support on a nonempty scalar type ring.
- Two copies preserve support but double generic multiplicities, failing the required support-to-cycle comparison.

The source is [Shen-Ning Tung, TUNG21B](#ref-tung21b), Theorems A–`C`, pp. 2–3; Theorem 8.0.1 and Corollary 8.0.2, p. 38 (arXiv v3); [Luis Dieulefait, Ariel Pacetti, DP22](#ref-dp22), Proof of Theorem 1.5, p. 4.

*Needs:* the actual dyadic patched data and support-to-cycle comparisons in this statement; [§5.10](#section-5-10); [§5.2](#section-5-2); [§5.6](#section-5-6); [§6.4](#section-6-4).

<a id="section-6-6"></a>

### 6.6 Kisin's local multiplicity inequality through Colmez's functor

Let `p>2` and assume `ρ̄` is not a twist of `(ωχ *;0 χ)`, including the split case, and assume Kisin Hypothesis (1.2.6) for the type. The local potentially semistable multiplicity is at most `μ_Aut=Σ a_{n,m}μ_{n,m}(ρ̄)`, with the crystalline counterpart using `a^cr_{n,m}`. Use the framed ring when `ρ̄` has non-scalar endomorphisms; when `End ρ̄=k` the unframed version has the same Hilbert–Samuel multiplicity after removing three framing variables. The proof passes from pseudodeformations to the representation ring through the cases in Kisin §§1.6–1.7. In the scalar-semisimplification case `n=p−2`, Gee–Kisin Appendix B.1 corrects the multiplicities to 1 for a nontrivial ramified extension, 2 for a nontrivial unramified extension, and 4 for the split extension. No formal smoothness of `R^{ord}` is asserted by (1.7.5) in this scalar case. In Corollary (1.7.14), for the low-weight scalar-type crystalline statement, the exceptional clause includes all scalar semisimplifications as well as split distinct-character representations: it is not just the scalar split case. Appendix B.2 also fixes the residual action on the line in Lemma (1.7.4). The excluded cyclotomic extension shape is treated by the later Breuil–Mézard theorems, not silently by this local inequality.

Here `p` odd; `ρ̄` not of the cyclotomic extension shape `(ωχ *;0 χ)`, split included; Kisin Hypothesis (1.2.6); apply Gee–Kisin `B`.1–`B`.2. The low-weight crystalline equality additionally has scalar `τ` and `2≤k≤p+1`, with the corrected exceptional smoothness clause.

Kisin §1.6 constructs the deformation-family module and bounds the Krull dimension of its support by two (Lemma (1.6.6)); this is not a rank-two module assertion. Use the computed Montreal functor on Hecke quotients for the multiplicity bound.

Pass to representation rings using the applicable cases of §1.7 under the residual exclusion. Fixed-`det` framed and unframed multiplicities agree after adjoining three variables when `End ρ̄=k`.

Use Gee–Kisin `B`.1’s scalar multiplicities and exceptional hypotheses in (1.7.14), together with `B`.2’s residual line-character formula; the scalar ordinary ring carries no formal-smoothness assertion from (1.7.5).

**Checks.**

- When the local inequality is combined with the global inequality of patching, equality `e = μ_Aut` follows (Kisin (2.3.2)–(2.3.4)); for `p ≥ 5` Paškūnas 2015 proves the local equality directly.

The source is [Mark Kisin, KISIN09](#ref-kisin09), §1.1, (1.1.3)–(1.1.6), published pp.646–647; §§1.5–1.7, pp.657–674; [Toby Gee, Mark Kisin, GEE-KISIN14](#ref-gee-kisin14), Appendix B.1–`B`.2, p.38.

*Needs:* [§4.5](#section-4-5); [§4.4](#section-4-4); [§3.3](#section-3-3); [§5.4](#section-5-4); [§0.5](#support-cycles).

<a id="section-6-7"></a>

### 6.7 Finiteness of the mod `p` category of `GL₂(ℚ_p)` (Paškūnas–Tung)

For every `p` and every block `B`: `Z_B` is noetherian and `E_B` is a finitely generated `Z_B`-module; `υ` makes `Z_B` and `E_B` finitely generated over `R^{ps,ζε}_{tr ρ̄_B}` ([§5.6](#section-5-6)). For `N` in `C(O)_B` the following are equivalent: there is a surjection `P_B^{⊕n} ↠ N`; `m(N)` is finitely generated over `E_B`; `m(N)` is finitely generated over `R^{ps}`; `k ⊗̂_{R^{ps}} N` has finite length; the cosocle of `N` has finite length — and they hold if `N` is finitely generated over `O[[H]]` for a compact open `H`. For `x` : `R^{ps} → L'` with `T_x` not of the form `ψ + ψε, Ban^{adm.fl}_{G,ζ}(L')_{B,𝔪_x}` is equivalent to finite length modules over the completion of `(R^{ps}[[G_{ℚ_p}]]/J) ⊗ L'` at `𝔪_x`; if `T_x = tr ρ` with `ρ` absolutely irreducible, to finite length `R^{ζε}_ρ`-modules, and every `Π'` killed by `𝔪_x` is a finite sum of copies of the irreducible `Π` with `V̌(Π) ↔ ρ`. For the Cayley–Hamilton algebra use the side/opposite convention of Paškūnas–Tung Corollary 6.16. Under the convention `E_B=End(P_B)`, compact `Hom` modules are right `E_B`-modules; dualising reverses the module side.

Here all `p`; `B` any block.

Theorem 1.3 of Paškūnas–Tung (finite generation over `R^{ps}`), noetherianity of `R^{ps}` by Chenevier, hence Theorem 1.1.

Corollary 6.7: the equivalences, from exactness of `m` and Nakayama over `R^{ps}`.

Corollary 6.16: Banach representations at a maximal ideal of `R^{ps}[1/p]`, via Paškūnas 2013 Theorem 4.36 and Corollaries 6.10–6.11.

**Checks.**

- For `Π` absolutely irreducible non-ordinary, `Ban^{adm.fl}_{G,ζ}(L)_Π ≅` finite length `R^{ζε}_{V(Π)}`-modules, for every `p`.

The source is [Vytautas Paškūnas, Shen-Ning Tung, PASKUNAS-TUNG21](#ref-paskunas-tung21), Theorems 1.1–1.4 and Corollary 1.5, pp. 2–4; Corollary 6.7, p. 26; Corollary 6.16, pp. 30–31.

*Needs:* [§5.6](#section-5-6); [§5.1](#section-5-1); [§5.4](#section-5-4); [the Banach contract](#banach-contract).

<a id="section-6-8"></a>

### 6.8 Every `π` in a block occurs in `k ⊗_{R^{ps}} S^∨`

Let `B` be a block with central character `ζ` and `S` a smooth admissible locally finite-length `O`-torsion object of that block whose restriction to `K` is injective among smooth `K`-representations with central character `ζ` on `Z∩K`. Put `M=(k completed-tensored_{R_B^{ps,ζ}}S^∨)^∨`. Then `M` has finite `O[G]`-length. Suppose a characteristic-zero point `x` of `R_B^{ps,ζ}` has absolutely irreducible degree-two Galois representation and the specialised compact module `N_x`, obtained by specialising `S^∨` after inverting `p`, is nonzero. The corresponding Banach representation is the continuous `L_x`-linear dual of `N_x`, with its Schikhof lattice; `N_x` itself is on the compact side. Under this hypothesis every irreducible `π∈B` occurs in `M`. The Galois representation/central character is interpreted with Paškūnas’s `V̌` convention. In the automorphic application the existence of such `x` comes from a global supercuspidal form; it is a separate hypothesis here.

Here `S` admissible in `Rep^ζ_B G` with injective restriction in that fixed-central-character `K`-category; for the occurrence statement, the existence of the point `x` (a global input in applications).

Finite length: `S^∨` is finitely generated over `O[[K]]` by admissibility, so Paškūnas–Tung Corollary 6.7 gives that `k ⊗̂_{R^{ps}} S^∨` has finite length ([§6.7](#section-6-7)).

If `π` does not occur, projectivity of `P_π` gives vanishing of `Hom_C(P_π, S^∨/m_{ps}^j S^∨)` for every `j`, then of `Hom_C(P_π,S^∨)`, then on the lattice duals of the specialised Banach object. The `Hom` is in the compact category, not a smooth `Hom` with `P_π` as its source.

`Π_x ≅ Π^{⊕d}` with `Π` absolutely irreducible non-ordinary (Paškūnas–Tung Corollary 6.16), and by compatibility of the p-adic and mod `p` correspondences `π` occurs in the reduction of a lattice of `Π`: a contradiction.

**Checks.**

- For `B = {π}` supersingular the statement reduces to `M ≠ 0`.

The source is [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, CDN23](#ref-cdn23), Propositions 4.7, 4.8 and 4.10 with proof, pp. 49–50; [Vytautas Paškūnas, Shen-Ning Tung, PASKUNAS-TUNG21](#ref-paskunas-tung21), Corollaries 6.7 and 6.16, pp. 26–31.

*Needs:* [§6.7](#section-6-7); [§5.3](#section-5-3); [§5.1](#section-5-1); [§3.8](#section-3-8).

<a id="section-6-9"></a>

### 6.9 Breuil–Strauch through the Drinfeld tower (Dospinescu–Le Bras)

Construct the local Jacquet–Langlands correspondence in its general local form: for a nonarchimedean local field `F`, a central division algebra `D/F` of degree `d` and `n=md`, give the bijection between essentially square-integrable smooth complex representations of `GLₙ(F)` and `GL_m(D)`, characterized on matching regular semisimple elements by `Θ_π(g)=(-1)^(n-m) Θ_(JL(π))(g')`. Matching means equality of reduced characteristic polynomials. Prove preservation of central characters, character twists, contragredients and the inverse, and characteristic-zero coefficient descent/extension when the representations admit models over the coefficient field. Name the general interface `DrinfeldComparison.localJacquetLanglands`. Its `m=1` restriction defines the shared `DivisionAlgebraTypes.jacquetLanglands` from `D×` to `GL_d(F)` as an abbreviation of the inverse of the displayed `JL`; its inverse identities, character formula and coefficient maps are the corresponding specializations. Use this one restriction for every `D×` transfer; the `m>1` inner-form correspondence is the general extension on the same character convention. The quaternionic isotypic adapter supplies `ρ` below. Source: Badulescu, **BAD02**, Theorem 1.1, pp.2–3, with the characteristic-zero correspondence of Deligne–Kazhdan–Vignéras recalled there; the full all-local-field statement retains arbitrary `d` and `m`.

**Transfer checks.** For `d=1` the correspondence is the identity. For `m=1` the target is an irreducible `D^×`-representation, and a twist by `η∘det` transfers to the twist by `η∘Nrd`. For `d=2,m=1`, Steinberg transfers to the trivial character of `D^×` and the regular-character relation has sign `−1`. A general principal series is outside the essentially-square-integrable domain; the theorem does not attach a `D^×`-representation to it.

Let `π` be a supercuspidal representation of `G = GL₂(ℚ_p)` with trivial central character, `ρ = JL(π)` the corresponding representation of `D^×`, `Σ_n` the `n`-th Drinfeld covering of the half-plane `Ω`, and `V(π)` the set of absolutely irreducible `Π ∈ Ban^{adm}(G)` with `Π^{lisse} ≅ π`. Choose a finite splitting coefficient field `L` defining absolutely irreducible models of `π` and `ρ`; the finite-dimensional smooth representation `ρ` has its usual `L`-vector-space topology.

**Multiplicity spaces.** For a topological `G×D^×`-representation `X`, define `X^ρ=Hom_(D^×)^cont(ρ,X)`, with `G` acting on the values. Give it the subspace topology in `Hom_L^cont(ρ,X)≅ρ*⊗_L X`, a finite product of copies of `X`. Construct `DrinfeldComparison.functions=O(Σ_n)^ρ` and `DrinfeldComparison.differentials=Ω¹(Σ_n)^ρ` with these Fréchet topologies. Give `H¹_dR(Σ_n)` its quotient topology from `Ω¹(Σ_n)/dO(Σ_n)`, and use the same equivariant-Hom convention for `H¹_dR(Σ_n)^ρ`; prove closedness of the differential image on this component and the resulting Fréchet comparison. For these tower spaces the action factors through the finite group `D^×/(p^ℤ(1+p^nO_D))`; when `ρ` factors through it, construct the central idempotent `e_ρ` over `L` and the evaluation isomorphism `ρ⊗_L X^ρ≅e_ρX` of topological `G×D^×`-representations. The full projector image is this tensor product; the comparisons below use the multiplicity space. Sources: DLB17, the convention immediately before Theorem 1.2, published p.325 (arXiv p.5), and Theorem 1.4, published p.327 (arXiv p.6); evaluation follows from the finite-group isotypic decomposition over the splitting field.

**Multiplicity Checks.**

- For `X=ρ⊗_L Y` with trivial `D^×`-action on `Y`, evaluation identifies `X^ρ` with `Y` and `e_ρX` with `ρ⊗_L Y`. If `dim ρ>1`, the latter has an extra multiplicity factor.
- For an absolutely irreducible `ρ′` inequivalent to `ρ`, `Hom_(D^×)(ρ,ρ′)=0`; for `X=ρ`, the multiplicity space is `L`, while the full projector image is `ρ`.
- If `dim ρ>1`, a nonscalar element of `End_L(ρ)` acts on the full projector image and commutes with `G` and `O(Ω)`. Thus the scalar-endomorphism theorem below must use `O(Σ_n)^ρ`, with the equivariant-Hom topology.

(i) `V(π) ≅ Proj(M_dR(π))` through `Π ↦ Fil⁰ D_dR(V(Π)), V(Π)` ranging over the absolutely irreducible two-dimensional potentially crystalline representations with Hodge–Tate weights 0, 1 and `D_pst(V) ≅ M(π)` (classical correspondence normalised à la Tate). (ii) For `Π ∈ V(π)` and `n` large (`ρ` trivial on `1 + p^nO_D`) there is a topological `G`-isomorphism, unique up to scalar, `(O(Σ_n)^ρ)* ≅ Π^{an}/Π^{lisse}`. (iii) There is a canonical (up to scalar) isomorphism of Fréchet `G`-modules `H¹_dR(Σ_n)^ρ ≅ M*_dR ⊗ π*` such that for each line `ℒ ⊂ M_dR`, the inverse image of `ℒ^⊥ ⊗ π*` in `Ω¹(Σ_n)^ρ` is `(Π^{an}_ℒ)*`, and the resulting `0 → O(Σ_n)^ρ → (Π^{an}_ℒ)* → π* → 0` is dual to (ii).

Here `π` is supercuspidal with trivial central character (the algebraic-twist extension is DLB Remarque 1.3(a)), and `n` is large. Comparisons (ii)–(iii) take the global comparison data specified below; in particular (ii) assumes the nonzero map `Φ` below.

Before the function-dual comparison construct `DrinfeldComparison.halfPlaneModule`, the unique continuous `O(Ω)`-module structure on `Π(π,0)*` for which the coordinate acts by the operator `∂` characterized by `a⁺−1=u⁺∂`. Prove closedness of the image of `u⁺`, construct `∂` and its resolvents, and use Morita duality to extend rational functions to `O(Ω)`. Prove `DrinfeldComparison.map_linear`: every continuous `G`-map to `O(Σ_n)^ρ` respects this module structure. Sources: DLB17 Propositions 9.1 and 9.16, Theorems 9.4 and 9.9, pp.45–51.

**Module Checks.**

- The coordinate function acts as `∂`; replacing the module action by scalar evaluation cannot satisfy `a⁺−1=u⁺∂`.
- The resolvent identity for distinct `x,y∈ℚ_p` agrees with multiplication of `(z−x)⁻¹` and `(z−y)⁻¹`; this tests extension to functions beyond polynomials.
- Equivariance forces a map to commute with `u⁺` and `a⁺`, then with `∂` by injectivity of `u⁺` on the target, and finally with all `O(Ω)` by continuity and density.

Prove `DrinfeldComparison.map_surjective` for the supplied nonzero `Φ` by DLB17 Theorem 10.1, p.52: construct the Drinfeld/Lubin–Tate equivariant-bundle comparison and dense image of Proposition 10.3, pp.52–53, then apply the Fréchet Stein-module surjectivity criterion of Proposition 10.11, pp.55–56. Prove `DrinfeldComparison.scalarEndomorphisms`, the scalar-endomorphism statement for continuous `O(Ω)`-linear `G`-maps of `O(Σ_n)^ρ`, using the same equivariant-bundle comparison (Proposition 10.10, p.55).

**Surjectivity and endomorphism Checks.**

- The zero equivariant map is excluded by the nonzero hypothesis; it has no dense image.
- Dense image becomes surjective only after the Fréchet-domain and finite-projective Stein-module hypotheses are verified; no coadmissibility of the source over `O(Ω)` is assumed as an input.
- Scalar multiplication by every `c∈L` is an endomorphism, and an invertible one has `c≠0`; a nontrivial idempotent would violate the scalar-endomorphism conclusion.

Prove `DrinfeldComparison.map_injective` using Proposition 11.10, pp.63–64. First construct the weight-two operator model `Π(π,2)`, the closed-image differential map and the smooth kernel comparison `Π(π,2)^(u⁺=0)≅π⊗M_dR(π)` (Proposition 11.1 and Theorem 11.7, pp.57–61). The global de Rham comparison data give a quotient `(π*)^⊕2` of `H¹_dR(Σ_n)^ρ`, as in §4. A surjection from the same length-two smooth representation is an isomorphism. Consequently a kernel vector of `Φ`, and then its Weyl transform, is divisible by every power of `u⁺`; in `tN_rig⊠ℙ¹` both chart coordinates vanish by infinite `t`-divisibility. This yields injectivity before asserting the full de Rham isomorphism. Combine it with surjectivity and the open-mapping theorem to prove the topological isomorphism. Proposition 9.16 and Proposition 10.10 then give uniqueness up to nonzero scalar.

**Injectivity Checks.**

- Infinite `t`-divisibility kills both chart coordinates; vanishing of just the first chart does not imply a section is zero.
- The smooth quotient comparison uses two copies of `π*`; surjectivity alone without this length comparison does not imply injectivity.
- Two isomorphisms differ by a continuous `O(Ω)`-linear `G`-automorphism of the target and hence by a nonzero scalar; the zero scalar cannot identify two isomorphisms.

Name this completion family `DrinfeldComparison.completionFamily`; its function and differential terms are the multiplicity spaces defined above. The targets `DrinfeldComparison.functions_dual`, `DrinfeldComparison.deRham` and `DrinfeldComparison.filtration_preimage` are respectively the three comparisons above, with the stated topologies and scalar ambiguity.

(i): CDP ([§3.8](#section-3-8)) with `det V(Π) = χ_cyc` and the Colmez–Fontaine theorem; all filtrations are weakly admissible since the Weil representation of `M(π)` is irreducible ([§4.6](#section-4-6)).

Use [§4.11](#section-4-11), rather than only the algebraic independence theorem VI.6.42. Identifying this common quotient with functions on the Drinfeld cover needs the geometric inputs the differential-equation and Drinfeld geometry comparisons.

(iii): comparison with de Rham cohomology of `Σ_n` (DLB Théorème 1.4).

The hypothesis `DrinfeldComparison.global_nonzero_map` supplies a continuous nonzero `G`-map `Φ:(Π^{an}/Π^{lisse})*→O(Σ_n)^ρ` for one `Π∈V(π)`. Its conditional construction takes these actual global comparison data: a quaternionic Shimura-curve tower and its Cerednik–Drinfeld uniformization isomorphism (DLB17 Theorem 4.8, pp.22–23); an automorphic realization of `π` with the required Hecke eigenspace; and the eigenspace/local–global comparison of Theorem 5.4 in §5.1. Theorem 5.1, p.24, constructs `Φ` from these data, as outlined in §1.2, pp.7–8. The de Rham comparison also takes the automorphic and uniformization data of §4. These global data are explicit hypotheses here. Section 4.11 supplies filtration independence of the source. Construct the differential-operator and function-module comparisons before applying the separate surjectivity, injectivity and scalar-endomorphism theorems; Theorem 10.1 supplies surjectivity only.

**Global-map Checks.**

- The zero map is continuous and equivariant but cannot supply this hypothesis.
- Rescaling `Φ` by a nonzero scalar preserves the hypothesis and yields the same isomorphism up to scalar.
- A Hecke eigenspace with zero `ρ`-isotypic part supplies no nonzero map; equivariance of the uniformization isomorphism alone cannot replace automorphic realization.

The geometric comparison needs the finite Drinfeld covering spaces `Σ_n` and their commuting `G` and `D^×` actions, the Fréchet multiplicity spaces of functions and differentials with their evaluation identification with the full Jacquet–Langlands projector image, and the de Rham comparison of Dospinescu–Le Bras Theorems 1.2 and 1.4. Construct these geometric inputs before the representation isomorphism. The differential-equation input in Layer 4 must give a filtration-independent action on `N_rig⊠ℙ¹` and the stated intersection calculation; an abstract analytic-vector category or classical local Langlands does not supply either geometry or this action.

**Checks.**

- `Π^{an}_ℒ` is an extension `0 → π → Π^{an}_ℒ → Π(π, 0) → 0` with `Π(π, 0)` independent of `ℒ`.
- For a basis `e₁,e₂` of `M_dR` and `ℒ=Le₁`, its annihilator is `Le₂*`; using `ℒ` itself in place of `ℒ^⊥` gives the wrong inverse image in the differential space. Duality reverses the resulting sequence to `0→π→Π^{an}_ℒ→(O(Σ_n)^ρ)*→0`.
- The zero Banach representation and every ordinary absolutely irreducible Banach representation fail to lie in `V(π)`: their smooth vectors cannot equal this nonzero supercuspidal `π`. Distinct lines `Le₁` and `Le₂` give distinct completions, although their analytic quotients are isomorphic.
- Passing to a larger level with `ρ` still trivial on `1+p^nO_D` preserves the isomorphism class of the function dual in (ii). At a level where that triviality fails, (ii) makes no such assertion.

The source is [Gabriel Dospinescu, Arthur-César Le Bras, DLB17](#ref-dlb17), §1.2, pp.7–8; Theorems 4.8, 5.1, 5.4 and 10.1; Propositions 9.1, 9.16, 10.3, 10.10–10.11 and 11.10, Theorems 9.4, 9.9 and 11.7, pp.45–64; Définition 1.1, Théorème 1.2, Remarque 1.3, pp. 4–5; Théorème 1.4, p. 6 (arXiv).

*Needs:* the nonzero global map and de Rham global comparison data in this statement; [§3.8](#section-3-8); [§4.2](#section-4-2); [§4.6](#section-4-6); [§3.11](#section-3-11); [§4.11](#section-4-11).

<a id="section-6-10"></a>

### 6.10 The local inputs to modularity lifting, case by case

The local results of this layer consumed by GL2ModularityLifting §§8–9 and by Dieulefait–Pacetti's proof of Serre's conjecture, each with its hypotheses: `(1) p ≥ 5, End ρ̄ = k`: Paškūnas 2015 Theorem 1.1 ([§6.1](#section-6-1)), including the compatibility of classical and p-adic local Langlands (Emerton lg Theorem 1.2.1 and Paškūnas 2015 remove Kisin's condition on locally algebraic vectors); `(2) p ≥ 5, ρ̄ = χ₁ ⊕ χ₂` with `χ₁ ≠ χ₂`: Hu–Tan Theorem 1.3 ([§6.2](#section-6-2)), removing the remaining hypothesis of Kisin's lifting theorem for `p ≥ 5` (Hu–Tan Theorem 1.4); `(3) p = 3`, every `r̄` (including twists of extensions of 1 by `ω`): the deduction from Tung 2021a Theorem 1.2 ([§6.3](#section-6-3)), conditional here on its arithmetic-action data and support-to-cycle comparisons; `(4) p = 2`: Paškūnas 2016 Theorem 1.1 with Theorems 2.34, 2.37 for generic blocks ([§6.4](#section-6-4)) and the deduction from Tung 2021b Corollary 8.0.2 for every `r̄` ([§6.5](#section-6-5)), with its dyadic patched data and support-to-cycle hypotheses; Dieulefait–Pacetti’s `p=2` potentially Barsotti–Tate input is a different Kisin 2009 paper, not KISIN09 (The Fontaine–Mazur conjecture for `GL₂`); the former is not imported from the latter here; `(5)` all odd `p`: Kisin's local inequality with Gee–Kisin's corrections ([§6.6](#section-6-6)) and Kisin's Hypothesis (1.2.6) ([§4.5](#section-4-5)). Dieulefait–Pacetti Theorem 1.4 (`p` odd: odd `ρ` with `ρ̄|_{G_{ℚ(√p*)}}` absolutely irreducible, de Rham at `p` with weights `{0, k−1}, k > 1`, modular residual) uses `(1)`–`(3)` and `(5)`; Theorem 1.5 (`p = 2`, non-solvable image) uses `(4)`. The block, deformation-ring and locally algebraic inputs are local; their occurrence in global completed cohomology is CompletedCohomologyAndLocalGlobalCompatibility §§4.4–4.5 and 4.10. The Kisin local-inequality row retains the residual exclusion in [§6.6](#section-6-6); it is not an all-residual substitute for Tung’s theorem.

Here each row carries the hypotheses of its source; no unqualified 'p-adic local Langlands theorem' is asserted.

Read off the case division in Dieulefait–Pacetti's proofs of Theorems 1.4 and 1.5 (p. 4) and match each cited theorem with its statement in this layer.

Check that every row's prime and residual hypotheses are those of the theorem cited.

**Checks.**

- For `p = 3` and `r̄ = (ω *; 0 1) ⊗ χ` only row `(3)` applies, with its arithmetic-action and exceptional-cycle hypotheses.
- For `p = 2` and `r̄ = (χ *; 0 χ)` only the Tung 2021b deduction applies, with its dyadic patched data.

The source is [Luis Dieulefait, Ariel Pacetti, DP22](#ref-dp22), Theorems 1.4 and 1.5 with their proofs, p. 4 (arXiv v2); [Yongquan Hu, Fucheng Tan, HU-TAN15](#ref-hu-tan15), Theorem 1.4, p. 5 (arXiv).

*Needs:* [§6.1](#section-6-1); [§6.2](#section-6-2); [§6.3](#section-6-3); [§6.4](#section-6-4); [§6.5](#section-6-5); [§6.6](#section-6-6); [§4.5](#section-4-5).

### Examples

For `p=3` and a twist of an extension of 1 by `ω`, use the odd-prime cycle deduction with its actual patched data and exceptional comparison; the generic theorem does not cover it. For `p=2` and a scalar residual semisimplification, use Tung’s all-residual theorem with its arithmetic inputs. In the scalar weight `p−2`, ramified nontrivial, unramified nontrivial and split extension classes have corrected crystalline multiplicities 1,2,4, respectively.

### Dependencies

Layers 1–5 with their prime and residual restrictions; the arithmetic patching inputs for Tung’s all-residual cases; the Drinfeld covering-space and de Rham geometry in the final comparison. Modularity-lifting and completed-cohomology roadmaps consume these results and are not used to supply a missing lower-layer proof.

## Downstream consumers

On the common domains in the ownership table, the following equations specify consumer notation and imports. The right-hand side is the definition used by the consumer; presentation and normalization theorems are proved on it. These equations preserve the full hypotheses of the defining target. No consumer existence target on a common domain commissions an independent construction.

| Consumer notation or contract | Definition or import from this roadmap |
| --- | --- |
| LocallyAnalyticDistributions §§0.0–0.3 and 1.3: locally convex limits, LA, D, completed tensors, analyticPullback, analyticTensor_equiv and distributionConvolution | Section 0.1's limits, chart spaces, strong duals and operations at the same field and manifold data. AnalyticSupport.functions and AnalyticSupport.distributions are abbreviations of LA and D. The broader coefficient-domain extensions restrict to these spaces with their topologies. |
| PadicFunctionalAnalysis, Scope and ownership: locally convex limits, strong duals, completed tensors and general distribution operations on §0.1's domain | Section 0.1; the corresponding common-domain operations exported through LocallyAnalyticDistributions are these same operations. The one-variable Banach stages and bounded-measure results remain supplied by PadicFunctionalAnalysis. |
| CompletedCohomologyPartII F.1: compact–discrete dual, Schikhof dual and admissible Banach category | Sections 0.3 and 0.1 with the specified coefficient ring, pointwise compact dual topology, uniform lattice topology and contragredient action. GL2Qp.UnitaryBanachRep is the specialization at G. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3.1–3.3 and R07.4.13: FilteredPhiNModule, weak admissibility and semistable equivalence; PadicHodgeTheory §§3.4–3.5 | Section 0.2's carrier and equivalence, including the perfect-residue generality and finite Galois descent data. |
| DeformationAndDerivedPatchingAlgebra §2.7 and LocalGaloisDeformationRings F.2.3: continuous framed ring and universal lift | Section 0.4's chosen representing pair at the same residual basis. Discrete matrix equations in the former's §2.6 remain a presentation construction; the continuous specialization is a presentation theorem for this pair. |
| LocalGaloisDeformationRings F.2.5, F.2.9 and §§3.4–3.5: unframed, fixed-determinant and bounded type rings | Section 0.4's functors and quotients with the Schur, determinant, bounded labelled-weight, inertial-type and nonreduced finite-coefficient-algebra hypotheses retained. |
| LocalGaloisDeformationRings F.2.11: degree-two continuous pseudodeformations of G_(ℚ_p) | Section 5.4's continuous residual completion without a block label and fixed-determinant fibre; the block notation specializes it at ρ̄_B. Arbitrary degree and other-group domains remain extensions. |
| ArithmeticGaloisDuality D7.1: ArithmeticDuality.hilbertSamuelPolynomial and ArithmeticDuality.hilbertSamuelEuler | Section 0.5's polynomial at I=m_A, and its multiplicity at d=dim A. The eventual-value, coefficient and exact-additivity theorems specialize the same objects. |
| DeformationAndDerivedPatchingAlgebra §§3.11–3.12 and 6.7: module-relative Hilbert–Samuel polynomial, moduleCycle and moduleCycle_specialization | Section 0.5's polynomial at the given I and M, dimension-normalized coefficient and affine module cycles. Its graded Hilbert series is an additional construction with this cumulative polynomial. |
| ArithmeticGaloisRepresentations §2.3: finite-residue fundamentalCharacter; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.26, R07.5.5 and R07.5.13: finite-residue characters and ℚ_p unit-Kummer predicates | Section 0.3's characters with the same residue embeddings, and its total unit-Kummer subspace and restricted nontrivial-wild predicates on their stated domains. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15: ℚ_p SerreWeight, compactInduction, heckeOperatorT, endEquivPolynomial and compactInduction_free | Sections 2.7–2.8's finite weights and normalized Hecke construction on SR.2's compact induction. The KZ extension retains its chosen central-uniformizer action. |
| LocalGaloisDeformationRings §2.26.1 and GL2AutomorphicRepresentationsAndTransfer R17.1.1: DivisionAlgebraTypes.jacquetLanglands | Section 6.9's inverse transfer at m=1, at arbitrary degree d; the quaternionic case sets d=2. |
| GL2AutomorphicRepresentationsAndTransfer R16.2.9 and CompletedCohomologyAndLocalGlobalCompatibility §0.3: supercuspidal K-type, occurrence and multiplicity one | Section 4.4's common supercuspidal type and Hom theorem; the latter consumer's henniartType_scalarExtension is its coefficient and convention adapter. |

CompletedCohomologyAndLocalGlobalCompatibility §§0.2–0.4 and LocalGaloisDeformationRings §§3.7.1–3.8 consume the local core of §§3.3, 3.7–3.8, 4.3 and 5.7–5.9, together with §§2.2–2.3, 3.1–3.2, 5.1–5.6 and 5.12's block, Montreal and full-type constructions. This includes §4.3's all-prime nonspecial completion with exceptional double roots. The Dospinescu–Le Bras universal family and the extension of the integral envelope and removal-of-envelope comparisons to `p=3` are local constructions of §§5.8–5.9; their completed-cohomology specializations use these constructions with the stated residual exclusions. CompletedCohomologyAndLocalGlobalCompatibility supplies the cohomological, dual and determinant normalization comparisons, type scalar-extension adapter, product blocks over `∏_{v|p}GL₂(ℚ_p)` and global realization; LocalGaloisDeformationRings supplies the deformation-theoretic applications of the imported local core.

Section 4.4 supplies the common supercuspidal type and occurrence/multiplicity theorem to GL2AutomorphicRepresentationsAndTransfer R16.2.9 and CompletedCohomologyAndLocalGlobalCompatibility §0.3. The former's notation denotes this type on the common domain; its larger local-field domain is covered by §4.4's general supercuspidal construction. The latter's finite-coefficient scalar-extension/descent map is the Hom comparison of §4.4 with its cohomological normalization. Non-supercuspidal occurrence, crystalline types, algebraic weights and dyadic choice-independent reductions retain their separate assertions in §4.4.

The local deformation-ring, type-occurrence and cycle statements supply GL2ModularityLifting §§8–9 and the local hypotheses in Dieulefait–Pacetti's Serre-modularity arguments. CompletedCohomologyAndLocalGlobalCompatibility §§2.1 and 4.10 consumes the analytic/algebraic-vector and block interfaces; its §§4.4–4.5 and 4.10 use the local correspondence in global realisation. Each consumer selects the prime, residual class, determinant and type actually covered by the theorem it invokes. The BCDT extended-type and supercuspidal comparisons carry their additional inputs explicitly.

CompletedCohomologyPartII F.1 uses §§0.1 and 0.3's compact–discrete and Schikhof dualities and general admissible Banach category. Its evaluation comparisons preserve the pointwise compact and uniform lattice topologies, continuous contragredient actions and strict exact sequences. Its compact-open admissibility predicate is transported by the finite-invariants/finite-Iwasawa-module equivalence. The shared duality and Banach-category constructions have their sole owner here; F.1's bounded-torsion integral category, arithmetic chain models and §6.7's derived analytic-vector recovery are additional constructions.

LocallyAnalyticDistributions §§0.0–0.3 and 1.3 use §0.1's locally convex limits, compact-manifold function spaces, strong duals, tensors, biduality and convolution on the stated common domains. Its broader complete coefficient fields, affinoid stages and derived comparisons are extensions. On restriction, the chart/radius maps, evaluation and universal properties give the same spaces and operations. Strong duality retains the common finite/discretely valued coefficient hypotheses. The finite/discretely valued shared foundation in §0.1 precedes both its Colmez applications and these extensions; PadicFunctionalAnalysis's one-variable Banach stages remain the inputs named in §0.1.

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3.1–3.3 and R07.4.13 and PadicHodgeTheory §§3.4–3.5 use §0.2's filtered `(φ,N)` carrier, weak admissibility and semistable equivalence, at arbitrary rank and perfect-residue base. The comparison preserves the isocrystal, filtration, monodromy and period maps. Integral lattices, Kisin modules and geometric applications are additional constructions; their realization comparisons use the same rational equivalence. The finite-local-field monodromy and generic `D_pst` realization remain supplied by NoncommutativeAndEquivariantIwasawa §F.6.

ArithmeticGaloisRepresentations §2.3 uses §0.3's finite-residue fundamental characters, including equal-characteristic local fields, with their tame-root reductions, residue embeddings, norm and Frobenius laws. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.5 and R07.5.13 use §0.3's unit-Kummer subspace and ramification predicates on their common domains; R07.5.15 uses §§2.7–2.8's `ℚ_p` Serre weights and Hecke constructions. The polynomial weight actions, Frobenius reciprocity and normalized double-coset formula fix these identifications, retaining determinant twists. The ramification comparison uses the total unit-Kummer subspace for split and other wild-trivial classes; the restricted peu-ramifiée predicate retains nontrivial wild inertia. The arbitrary-perfect-residue characters, larger local-field weight and Kummer domains and finite-flat group-scheme realizations remain extensions in the integral Hodge roadmap.

DeformationAndDerivedPatchingAlgebra §§2.6–2.7 uses §0.4's continuous framed representing pair on the common finite-residue coefficient domain. Its finite-generator matrix presentation and the Schlessinger presentation identify by the unique continuous isomorphism preserving the actual universal lift, not merely by a ring isomorphism. LocalGaloisDeformationRings F.2.3 uses that same pair; its comparison through the matrix presentation is the composite of these universal-lift-preserving isomorphisms. Discrete word equations outside this continuous coefficient domain remain the matrix presentation's separate scope.

LocalGaloisDeformationRings Layer F and §§3.1–3.5 use §0.4's arbitrary-rank continuous framed lifts under `Φ_p`, Schur unframed representability, fixed-determinant fibres, coefficient change and cochain tangent/obstruction comparisons, and its bounded potentially semistable/crystalline quotients. The latter retain finite `K/ℚ_p`, labelled Hodge type, inertia type and the nonreduced finite-coefficient-algebra point criterion. Its F.2.11 uses §5.4's continuous degree-two pseudodeformation construction for `G_(ℚ_p)`, including reducible residual laws, fixed determinant, noetherianity and completed coefficient change; its arbitrary-degree and other-group extensions retain their broader scope. Universal lifts and determinants determine the notation comparisons. These early foundations are constructed in §§0.4 and 5.4 independently of that consumer, whose §§3.7.1–3.8 use the `GL2Block`, Montreal and `WDTypeRing` constructions of Layers 2–5 as well.

LocalGaloisDeformationRings §2.26.1 uses §6.9's arbitrary-degree `m=1` Jacquet–Langlands restriction. The notation for transfer from `D×` to `GL_d(F)` denotes the inverse of the correspondence in §6.9, fixed by the elliptic-character identity, with twists, contragredients and coefficient descent. GL2AutomorphicRepresentationsAndTransfer R17.1.1 uses its quaternionic specialization. The compact types and arithmetic transfer applications in these consumers remain separate from this one smooth correspondence.

DeformationAndDerivedPatchingAlgebra §§3.11–3.12 and 6.7 and ArithmeticGaloisDuality D7.1 use §0.5's Hilbert–Samuel polynomial, multiplicity, affine module cycles and flat specialization on their common domains. In particular, D7.1's maximal-ideal polynomial is the `I=m_A` specialization of §0.5's module-relative ideal-of-definition theorem. Eventual equality of cumulative lengths fixes the polynomial, its dimension-normalized coefficient fixes multiplicity, and localized lengths fix the cycles; support bounds, ambient dimensions and flatness remain hypotheses. Graded-series extensions and downstream arithmetic and geometric applications retain their scope without a second construction of the shared affine theory.

## References

Page numbers refer to the indicated author/preprint version unless a published page is explicitly named. Source formulas are used with the normalisations and corrections above; the text states the mathematical targets in its own words.

<a id="ref-colmez10"></a>

- **COLMEZ10.** Pierre Colmez, [Représentations de GL2(Qp) et (φ,Γ)-modules](https://webusers.imj-prg.fr/~pierre.colmez/kirilov.pdf). Astérisque 330 (2010), 281–509; locators refer to the author's version kirilov.pdf (238 pp.).

<a id="ref-colmez08tri"></a>

- **COLMEZ08TRI.** Pierre Colmez, [Représentations triangulines de dimension 2](https://webusers.imj-prg.fr/~pierre.colmez/Trianguline-ast.pdf). Astérisque 319 (2008), 213–258; author's version Trianguline-ast.pdf.

<a id="ref-colmez14la"></a>

- **COLMEZ14LA.** Pierre Colmez, [La série principale unitaire de GL2(Qp) : vecteurs localement analytiques](https://webusers.imj-prg.fr/~pierre.colmez/locan.pdf). Automorphic forms and Galois representations, vol. 1, LMS Lecture Note Series 414 (2014), 286–358; author's version locan.pdf.

<a id="ref-paskunas13"></a>

- **PASKUNAS13.** Vytautas Paškūnas, [The image of Colmez's Montreal functor](https://arxiv.org/abs/1005.2008). Publ. Math. IHÉS 118 (2013), 1–191; locators refer to arXiv:1005.2008v3.

<a id="ref-cdp14"></a>

- **CDP14.** Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas, [The p-adic local Langlands correspondence for GL2(Qp)](https://arxiv.org/abs/1310.2235). Cambridge J. Math. 2 (2014), 1–47; locators refer to arXiv:1310.2235v1.

<a id="ref-cdp-wild"></a>

- **CDP-WILD.** Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas, [Irreducible components of deformation spaces: wild 2-adic exercises](https://arxiv.org/abs/1310.2233). Int. Math. Res. Not. (2015), 5333–5356; Lemma 9.5, Theorem 9.6 and Theorem 10.1, arXiv pp.13–16.

<a id="ref-paskunas-blocks14"></a>

- **PASKUNAS-BLOCKS14.** Vytautas Paškūnas, [Blocks for mod p representations of GL2(Qp)](https://arxiv.org/abs/1104.5602). Automorphic forms and Galois representations, vol. 2, LMS Lecture Note Series 415 (2014); locators refer to arXiv:1104.5602v2.

<a id="ref-paskunas15"></a>

- **PASKUNAS15.** Vytautas Paškūnas, [On the Breuil–Mézard conjecture](https://arxiv.org/abs/1209.5205). Duke Math. J. 164 (2015), 297–359; locators refer to arXiv:1209.5205v3.

<a id="ref-hu-tan15"></a>

- **HU-TAN15.** Yongquan Hu, Fucheng Tan, [The Breuil–Mézard conjecture for non-scalar split residual representations](https://arxiv.org/abs/1309.1658). Ann. Sci. ÉNS (4) 48 (2015), 1383–1421; locators refer to arXiv:1309.1658v2 (page numbers of the arXiv file).

<a id="ref-tung21a"></a>

- **TUNG21A.** Shen-Ning Tung, [On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_Qp](https://arxiv.org/abs/1803.07451). Algebra Number Theory 15 (2021), 2173–2194; locators refer to arXiv:1803.07451v4.

<a id="ref-paskunas16"></a>

- **PASKUNAS16.** Vytautas Paškūnas, [On 2-dimensional 2-adic Galois representations of local and global fields](https://arxiv.org/abs/1509.00332). Algebra Number Theory 10 (2016), 1301–1358; locators refer to arXiv:1509.00332v2.

<a id="ref-tung21b"></a>

- **TUNG21B.** Shen-Ning Tung, [On the modularity of 2-adic potentially semi-stable deformation rings](https://arxiv.org/abs/1908.06174). Math. Z. 298 (2021), 107–159; locators refer to arXiv:1908.06174v3.

<a id="ref-paskunas-tung21"></a>

- **PASKUNAS-TUNG21.** Vytautas Paškūnas, Shen-Ning Tung, [Finiteness properties of the category of mod p representations of GL2(Qp)](https://arxiv.org/abs/2104.08948). Locators refer to arXiv:2104.08948v2.

<a id="ref-cdn23"></a>

- **CDN23.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, [Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://arxiv.org/abs/2204.11214). Forum Math. Pi 11 (2023), e16; locators refer to arXiv:2204.11214v2.

<a id="ref-cdnkisin"></a>

- **CDNKISIN.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, [Correspondance de Langlands locale p-adique et anneaux de Kisin](https://arxiv.org/abs/2204.11217). Locators refer to arXiv:2204.11217v2 (24 April 2023).

<a id="ref-cdn20"></a>

- **CDN20.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, [Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1](https://arxiv.org/abs/1704.08928). J. Amer. Math. Soc. 33 (2020), 311–362; locators refer to arXiv:1704.08928v2 (arXiv page numbers cited).

<a id="ref-cd14"></a>

- **CD14.** Pierre Colmez, Gabriel Dospinescu, [Complétés universels de représentations de GL2(Qp)](https://arxiv.org/abs/1301.7647). Algebra Number Theory 8 (2014); locators refer to arXiv:1301.7647v1.

<a id="ref-dospinescu15"></a>

- **DOSPINESCU15.** Gabriel Dospinescu, [Extensions de représentations de de Rham et vecteurs localement algébriques](https://arxiv.org/abs/1302.4567). Compositio Math. 151 (2015); locators refer to arXiv:1302.4567v1.

<a id="ref-bb10"></a>

- **BB10.** Laurent Berger, Christophe Breuil, [Sur quelques représentations potentiellement cristallines de GL2(Qp)](https://arxiv.org/abs/math/0601545). Astérisque 330 (2010), 155–211; locators refer to arXiv:math/0601545v1.

<a id="ref-emerton-lg"></a>

- **EMERTON-LG.** Matthew Emerton, [Local-global compatibility in the p-adic Langlands programme for GL2/Q](https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf). Preprint (2011), author's file lg.pdf.

<a id="ref-gee-kisin14"></a>

- **GEE-KISIN14.** Toby Gee, Mark Kisin, [The Breuil–Mézard conjecture for potentially Barsotti–Tate representations](https://arxiv.org/abs/1208.3179). Forum Math. Pi 2 (2014), e1; locators refer to [arXiv:1208.3179v5](https://arxiv.org/abs/1208.3179v5), including Appendix B, pp.38–41.

<a id="ref-kisin09"></a>

- **KISIN09.** Mark Kisin, [The Fontaine–Mazur conjecture for GL2](https://dash.harvard.edu/server/api/core/bitstreams/7312037d-4c56-6bd4-e053-0100007fdf3b/content). J. Amer. Math. Soc. 22 (2009), 641–690; published PDF served by Harvard DASH. Locators are journal pages.

<a id="ref-nakamura23"></a>

- **NAKAMURA23.** Kentaro Nakamura, [Zeta morphisms for rank two universal deformations](https://arxiv.org/abs/2006.13647). Invent. Math. 234 (2023), 171–290; locators refer to arXiv:2006.13647v2 (arXiv page numbers cited).

<a id="ref-dlb17"></a>

- **DLB17.** Gabriel Dospinescu, Arthur-César Le Bras, [Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique](https://arxiv.org/abs/1509.00606). Ann. of Math. 186 (2017), 321–411; locators refer to arXiv:1509.00606v2.

<a id="ref-breuil03"></a>

- **BREUIL03.** Christophe Breuil, [Sur quelques représentations modulaires et p-adiques de GL2(Qp) : I](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/GL2%28Qp%29I.pdf). Compositio Math. 138 (2003), 165–188; author's version GL2(Qp)I.pdf.

<a id="ref-bcdt01"></a>

- **BCDT01.** Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor, [On the modularity of elliptic curves over Q: wild 3-adic exercises](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/STW.pdf). J. Amer. Math. Soc. 14 (2001), 843–939; locators refer to Breuil's author copy STW.pdf (same text; pp. 10–12 there correspond to pp. 854–856 of the journal).

<a id="ref-dp22"></a>

- **DP22.** Luis Dieulefait, Ariel Pacetti, [A simplified proof of Serre's conjecture](https://arxiv.org/abs/2108.07577). RACSAM 117 (2023), article 153; locators refer to arXiv:2108.07577v2.

<a id="ref-kpx14"></a>

- **KPX14.** Kiran S. Kedlaya, Jonathan Pottharst, Liang Xiao, [Cohomology of arithmetic families of (φ,Γ)-modules](https://arxiv.org/abs/1203.5718v3), J. Amer. Math. Soc. 27 (2014), 1043–1115. Locators use arXiv v3; its Hodge–Tate signs are converted when using the weight convention here. Rank-one cohomology is Proposition 6.2.8, pp.58–59; the rank-one family classification is Theorem 6.2.14, pp.61–62.

<a id="ref-st02"></a>

- **ST02.** Peter Schneider, Jeremy Teitelbaum, [Banach space representations and Iwasawa theory](https://arxiv.org/abs/math/0005066v1), Israel J. Math. 127 (2002), 359–380. Theorem 3.5, author p.15.

<a id="ref-st03"></a>

- **ST03.** Peter Schneider, Jeremy Teitelbaum, [Algebras of p-adic distributions and admissible representations](https://arxiv.org/abs/math/0206056v1), Invent. Math. 153 (2003), 145–196. Locators use arXiv v1, especially §§3–7, Theorems 4.9–4.11, 5.1–5.2, 6.3 and 7.1.

<a id="ref-bc09"></a>

- **BC09.** Olivier Brinon, Brian Conrad, [CMI Summer School notes on p-adic Hodge theory](https://math.stanford.edu/~conrad/papers/notes.pdf), 24 June 2009. Sections 8–9, Remark 11.3.4 and §§15.1–15.4. Filtration indices are converted to the χ-weight +1 convention here.

<a id="ref-berger02"></a>

- **BERGER02.** Laurent Berger, [Représentations p-adiques et équations différentielles](https://arxiv.org/abs/math/0102179v3), Invent. Math. 148 (2002), 219–284. Theorem 0.2, pp.3–4, Theorem 0.4, p.5, and §5 in the author pagination.

<a id="ref-mazur89"></a>

- **MAZUR89.** Barry Mazur, [Deforming Galois representations](https://bpb-us-e1.wpmucdn.com/sites.harvard.edu/dist/a/189/files/2023/01/Deforming-Galois-Representations.pdf), in *Galois groups over ℚ*, MSRI Publications 16 (1989), 385–437, §§1.1–1.3.

<a id="ref-kisin08"></a>

- **KISIN08.** Mark Kisin, [Potentially semi-stable deformation rings](https://people.math.harvard.edu/~kisin/dvifiles/def.dvi), J. Amer. Math. Soc. 21 (2008), 513–546. Locators use the author's 34-page DVI, including Errata (E.4), p.34; Theorem (2.7.6), Corollary (2.7.7), p.23, Theorems (3.3.4), (3.3.8), pp.29–30.

<a id="ref-bg19"></a>

- **BG19.** Rebecca Bellovin, Toby Gee, [G-valued local deformation rings and global lifts](https://arxiv.org/abs/1708.04885v3), Algebra Number Theory 13 (2019), 333–378. Proposition 3.3.2, Theorem 3.3.3, Remark 3.3.4 and Theorem 3.3.8, arXiv pp.30–33.

<a id="ref-serre87"></a>

- **SERRE87.** Jean-Pierre Serre, [Sur les représentations modulaires de degré 2 de Gal(ℚ̄/ℚ)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Duke Math. J. 54 (1987), 179–230, §§2.1–2.4 and §2.8.

<a id="ref-bad02"></a>

- **BAD02.** Alexandru Ioan Badulescu, [Correspondance de Jacquet–Langlands pour les corps locaux de caractéristique non nulle](https://arxiv.org/abs/math/0201117v1), Ann. Sci. ÉNS 35 (2002), 695–747. Theorem 1.1, author pp.2–3, and §5; the characteristic-zero correspondence is recalled with its Deligne–Kazhdan–Vignéras source.
