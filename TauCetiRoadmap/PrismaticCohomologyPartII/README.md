# Roadmap: prismatic cohomology, Part II — Nygaard filtration, absolute prisms and q-de Rham theory

**Summary.** Construct canonical Breuil–Kisin twists and Nygaard filtrations, absolute cohomology through the Cartier–Witt stack, and multiplicative q-crystalline and q-de Rham models. The relative Nygaard object is the Frobenius pullback; orientation choices never enter its canonical definition.

## Scope and ownership

The four roadmaps form the chain [PrismaticCohomology](../PrismaticCohomology/README.md) (Layers 0–`2) →` [PrismaticCohomologyPartII](../PrismaticCohomologyPartII/README.md) (Layers 3–`5) →` [PrismaticCohomologyPartIII](../PrismaticCohomologyPartIII/README.md) (Layers 6–`7) →` [PrismaticCohomologyPartIV](../PrismaticCohomologyPartIV/README.md) (PrismaticCohomologyPartIV Layer 8). Layer and section labels agree across the four parts. PerfectoidQuotients → AInfCohomology precede this chain; PadicHodgeTheory consumes it.

This part consumes PrismaticCohomology Layers 0–2; PrismaticCohomologyPartIII and PrismaticCohomologyPartIV are downstream consumers. It owns canonical prism twists, the relative Nygaard filtration, the Cartier–Witt and absolute constructions, and the framed q-models. AInfCohomology supplies décalage and `AΩ`; ordinary monoidal derived and formal-stack foundations remain imports. The local enhancements and all-coordinate comparison maps are specified in Layers 3–5.

This roadmap owns the primitive AΩ/prismatic comparison (§5.23), the perfect-prism η-uniqueness theorem (§5.25), and absolute Nygaard, twist and divided-Frobenius data (§§3.9, 3.20, 4.25–4.31). These are the primitive inputs for CohomologyComparisons §1.7's agreement with its chosen crystalline, de Rham and étale specialization maps and §1.11's syntomic coefficients. On A_inf coefficients, §3.9 identifies the general prism twist with the line supplied by AInfCohomology §AI.0:integral.1.

<a id="s4-2"></a>
<a id="layer-4-generalized-cartier-divisor"></a>

### Imported generalized Cartier divisors (§4.2)

SchemeAndStackFoundations §1.21, `lineBundleSectionStack`, supplies `Cart = [A¹/G_m]` as the stack of line bundles with a section. Use its dual convention: a point is an invertible module `I` with a linear map `α : I → R`, corresponding to the section `α` of `I∨`; arrows `ρ : I ≃ I′` satisfy `α′ρ = α`. Its fpqc stack structure is SchemeAndStackFoundations §§1.1, 1.18, 1.21. This roadmap consumes that stack and its base-change maps in constructing Cartier–Witt divisors. (BL22 Definition 3.1.1, Remarks 3.1.2–3.1.3, p.39.)

The required interface includes principal points `(R, f·)`, the point `(I, inclusion)` for an invertible ideal, and pullback `(S ⊗ I, S ⊗ α)`, with identities and composition. The effective-Cartier subcategory is the one with injective `α`, whose automorphism groups are trivial; it need not be preserved by arbitrary pullback. Two principal points for `f,g` are isomorphic exactly when `g = u f` for a unit `u`. These are consequences of the supplied classification, with no second generalized-divisor carrier.

**Checks.**

- Over a nonzero ring `R`, `(R, 0)` is a generalized divisor and is not effective Cartier.
- For a unit `u`, `(R, u·)` is isomorphic to `(R, 1·)`, the empty divisor.
- `(Z, p·)` is effective Cartier; its pullback to `F_p` is not.
- Automorphisms of `(R, f·)` are the units `u` with `u f = f`; if `f` is regular only `u = 1` occurs.

## Conventions

Use PrismaticCohomology Conventions for p prime, commutative unital rings (including zero), cohomological indexing, animated inputs and ideal-marked derived completion. In the bounded-prism targets `(A,I)` is bounded unless a broader prism range is explicitly stated. `D_comp(A)` is derived `(p,I)`-complete; tensor products in it are completed.

In Layer 5 q-PD comparisons, smooth and étale mean p-completely smooth and p-completely étale unless ordinary étaleness is explicitly specified. The completion ideals `(p,[p]_q)` and `(p,q−1)` define the same topology.

In the two-direction exterior-form presentation the final Koszul basis is `−dX₁∧dX₂`, giving the stated `d¹(a,b)=D₂a−D₁b`. This basis adapter leaves the skew differential graded product unchanged.

Nygaard filtrations are decreasing and conjugate filtrations increasing. The relative Nygaard filtration belongs to `φ_A^*Δ_(R/A)`, not to the untwisted complex by an implicit identification. An increasing conjugate graded piece is `∧^i L_(R/(A/I))[−i]{−i}`, with derived p-completion. In degree one the shift `[−1]` and twist `{−1}` are both retained. Hodge–Tate twists `M{i}=M⊗(I/I²)^(⊗i)` and absolute prism twists `A{i}` are separate constructions; an orientation identifies them with an untwisted module but is not part of their canonical definitions.

For cochain Koszul models with two commuting endomorphisms `D₁,D₂`, take the complex `M→M⊕M→M` with `d⁰(m)=(D₁m,D₂m)` and `d¹(a,b)=D₂a−D₁b`. Then `d¹d⁰=0`. On `M=Z` with `D₁(m)=2m` and `D₂(m)=3m, d¹d⁰(1)=6−6=0`; replacing the minus by plus gives 12. Reversing both terms changes the orientation and still defines a complex. The q-integer is `Σ_(i<n)q^i`, so `[0]_q=0, [2]_q=1+q` and `[n]_1=n`. The q-divided power `γ` is defined only on `φ⁻¹([p]_qD)`, with `[p]_q` a nonzerodivisor. At `q=1` it satisfies `pγ(x)=x^p`; it is not defined by a `0/0` specialization.

## Exact supplier contracts

A supplier row specifies the interface used, under the hypotheses shown. Its theories are imported. Each target lists its own additional prerequisites.

| Supplier | Layers | Required interface |
| --- | --- | --- |
| DGAInfinity Layer 1 | 5 | Unital cochain DG algebras, their morphisms and signed tensor products over a commutative coefficient ring. Section 5.18 constructs its specific skew product on this supplied kind of algebra. |
| DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21 | 3, 4, 5 | PD envelopes with their initial property and flat base change, including p-completion. For p-torsion-free B and a sequence regular modulo p, retain p-torsion-freeness; in characteristic p use the divided-power monomial basis. `A_crys(S)` is the initial p-complete PD thickening of a semiperfect `F_p`-algebra S, with Frobenius and PD/conjugate filtrations. The `γ_p`-stability and `γ_k∘γ_p` identities are used with their p-torsion-free hypotheses (BS22 Lemmas 2.38, 16.11). |
| DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1 | 3, 4, 5 | Derived completion at a finitely generated ideal, completed tensors, Nakayama and complete-flat descent; complete Tor-amplitude and the bounded-torsion discreteness criterion (BMS2 Lemmas 4.4–4.7). Filtered derived categories, Day tensor, graded pieces, completion, Beilinson t-structure/heart and Bocksteins retain their enhanced coherences. Derived complete M with perfect reduction is perfect. Negative tensor powers of invertible ideals are allowed; no unqualified classical-completion comparison is assumed. |
| [PrismaticCohomology §1.10](../PrismaticCohomology/README.md#complete-base-change-totalization) | 3–5 | `Prismatic.completeBaseChange_totalization`: completed base change along a map of finite J-complete Tor-amplitude commutes with totalization of cosimplicial complexes with a common cohomological lower bound, for a finitely generated ideal J. The q-PD application is [Imported completed base change and totalization](#complete-base-change-totalization). |
| DerivedModuleAlgebra §§0.4–0.17, 0.25; DerivedDeRhamCohomology §1.23, §§5.1–5.4 | 4 | Full cotangent complexes, transitivity, derived exterior/divided powers, décalage `∧^i(M[1])≃Γ^i(M)[i]`, p-complete Tor-amplitude and quasisyntomic/QRSP predicates. Square-zero deformation classes, map-lifting and uniqueness under cotangent vanishing are affine inputs; scheme lifting groupoids are PrismaticCohomology §2.6. |
| DerivedDeRhamCohomology Layer 2 | 3, 4 | Derived p-complete de Rham algebras with Hodge filtration, polynomial models, continuous forms for smooth algebras and crystalline base change; the logarithmic constructors are DerivedDeRhamCohomology §6.20. Comparison maps preserve multiplication and the stated filtrations. |
| DerivedDeRhamCohomology §§5.1–5.7 | 3, 4, 5 | Quasisyntomic site and QRSP basis, completed faithfully flat cotangent-power descent, unfolding from QRSP objects and completed left Kan extension. BMS2 Lemma 4.34 supplies the relative cotangent-flatness condition only in its perfect-base range. |
| CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10 | 3, 4, 5 | Crystalline–de Rham comparison on smooth lifts and its polynomial/derived extension with Frobenius and completed base change. No singular site comparison follows from the smooth theorem alone. |
| EnhancedDerivedSheaves Layer E2 | 5 | Enhanced sheaves, hypercovers, effective epimorphisms, cohomological descent and replete-topos limits. Use space-valued fpqc sheafification, not just groupoid stackification. |
| DerivedDeRhamCohomology §4.2; CrystallineCohomology §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10 | 4 | The PD conjugate filtration and the derived de Rham–crystalline realization, with completed filtered modules and base change in their stated ranges; prismatic F-crystal comparison and integral lattice descent are local targets. |
| SchemeAndStackFoundations §§1.1, 1.18–1.22 | 4 | Affine module/vector-bundle faithfully flat descent, stacks in groupoids, quotient stacks and line bundles with a section. Complete formal QCoh, compatible-tower effectivity and punctured derived-completion descent have explicit local owners where used. |
| AInfCohomology §AI.0:integral.1 | 3–5 | `AInf.bkTwist`: the intrinsic A_inf coefficient line, its divided conormal projections, integer tensor and dual powers, and Frobenius. Section 3.9 constructs `Prismatic.BKTwist.ainfTwistIso` to identify the general prism twist with this supplied line in its coefficient range. |
| AInfCohomology Layer AI.1 | 3, 5 | Derived `Lη` for an invertible ideal, torsion-free `η`-models, cohomology/truncation and Bockstein reduction, with the lax symmetric monoidal refinement and all coherences of §§AI.1.3–AI.1.4, hence functoriality on `E∞` algebras. Completed commuting-endomorphism Koszul models retain the exterior degree/sign adapter. |
| EnhancedDerivedSheaves Layer E3 | 3, 5 | Coherent left/right Kan extensions, sifted colimits, totalizations and adjunctions in enhanced categories. Polynomial animation uses its universal property, not a choice of a single resolution. |
| EnhancedDerivedSheaves Layer E5:animation | 3 | Animated commutative rings and prelog analogues, compact projective polynomial generators, free resolutions and the nonabelian-derived universal property. Completion and algebra structures use DerivedModuleAlgebra §§1.1–1.9, DerivedDeRhamCohomology Layer 1 and EnhancedDerivedSheaves Layer E5:abstract. |
| CrystallineCohomology Layer CR.4 | 4 | de Rham–Witt and logarithmic de Rham–Witt sheaves on smooth characteristic-p schemes, Frobenius/Verschiebung/Nygaard operators, Cartier and crystalline comparisons, and their pro-étale coefficient range. |
| AInfCohomology §§AI.3.1–AI.3.3 | 5 | `AΩ` on small smooth formal charts over the supplied complete algebraically closed characteristic-zero coefficient field, with Frobenius. Its étale, Hodge–Tate and crystalline specializations are §§AI.4.1–AI.4.4. Section 5.22 includes the chart construction over an arbitrary characteristic-zero perfectoid field containing all p-power roots of unity. |
| AInfCohomology §§AI.3.2–AI.3.3, AI.4.1–AI.4.4 | 5 | Framed q-de Rham computations of `AΩ` and completed Čech/Koszul models with coordinate-injective maps (§§AI.3.2–AI.3.3), together with the specializations of §§AI.4.1–AI.4.4. Arbitrary coordinate identifications and multiplicative `E₁` coherence are constructed in §§5.18, 5.22. |
| DerivedDeRhamCohomology Layer 3 | 3 | Polynomial Cartier maps and completed derived Cartier comparison, compatible with cotangent transitivity and the conjugate filtration. |
| SchemeAndStackFoundations §§1.15, 1.18, 1.21 | 4 | Generic prestacks, groupoid stacks, torsors, stackification, 2-fibre products and quotient stacks on the fpqc site. Space-valued formal stacks and enhanced QCoh are the additional constructions of §4.0. |
| PerfectoidSpaces §§P1.16–P1.18, P4.15.2–P4.15.5; PerfectoidQuotients §0.0 | 3–5 | Integral perfectoid rings, `A_inf, θ`, primitive kernels, initial and perfected prisms, semiperfectoid universal quotient, André covers and surjectivity are the same inputs as PrismaticCohomology Scope; complete étale δ-extension and perfectoid Tor-independence come from PerfectoidQuotients. |

### Supplied q-integers

AInfCohomology §AI.3.3 supplies `TauCetiRoadmap.AInfCohomology.qInteger q n = ∑ i ∈ Finset.range n, q^i` and its Laurent extension for a unit `q`; use its value at the prime index for `[p]_q`. These are polynomial q-integers over every commutative ring, including `q = 1` and every natural index. Mathlib `geom_sum_mul` gives `[n]_q (q − 1) = q^n − 1`; `Polynomial.cyclotomic_prime` identifies the prime-index value with cyclotomic evaluation and `Polynomial.eval_one_cyclotomic_prime` gives `[p]_1 = p`. Evaluation naturality and zero and one specializations use the supplied finite-sum formula. (BS22 Notation 16.1, p.106; BMS1 Example 7.7, p.58.)

**Checks.**

- `[0]_q = 0`, including at `q = 0`.
- `[2]_q = 1 + q` and `[3]_2 = 7`, distinguishing the polynomial from the constant index.
- `[n]_1 = n`; the quotient `(q^n − 1)/(q − 1)` cannot define the q-integer at `q = 1` or in an arbitrary ring.

### Existing library interface

| Declaration | Provision |
| --- | --- |
| Mathlib `WittVector.map` | Witt ring map induced by a coefficient-ring map. |
| Mathlib `WittVector.ghostComponent` | Each ghost coordinate is a ring homomorphism on infinite Witt vectors. |
| Mathlib `WittVector.constantCoeff` | The zeroth coordinate as a ring homomorphism. |
| Mathlib `WittVector` | the p-typical Witt-vector carrier and its existing ring operations; the cofree δ-structure is supplied by PrismaticCohomology §0.56 |
| Mathlib `WittVector.frobenius` | The Witt vector Frobenius as a ring endomorphism |
| Mathlib `WittVector.teichmuller` | The Teichmüller lift `R →* 𝕎 R` as a monoid homomorphism; it supplies the Teichmüller coordinate values in §5.22. |
| Mathlib `WittVector.fontaineTheta` | Fontaine’s map `θ : W(R♭) → R` for a p-adically complete commutative ring with [Fact ¬ IsUnit `(p : R)`]. Its direct use excludes the zero ring; handle the zero-ring perfectoid separately, and derive nonunit p from completeness for a nonzero ring. |
| Mathlib `Module.Invertible` | Invertible modules: the Cartier divisor condition on a prism ideal |
| Mathlib `DividedPowers` | Divided power structures on an ideal; the PD ideals obtained by reducing q-PD pairs at `q = 1`. |
| Mathlib `Polynomial.cyclotomic` | Cyclotomic polynomials: `[p]_q` is the p-th one |
| Mathlib `Polynomial.cyclotomic_prime` | The p-th cyclotomic polynomial is `1 + X + … + X^(p−1)` |
| Mathlib `Polynomial.eval_one_cyclotomic_prime` | The p-th cyclotomic polynomial takes the value p at 1 |
| Mathlib `DerivedCategory` | The derived category of an abelian category (homological complexes up to quasi-isomorphism); a 1-categorical shadow of `D(A)` underlying the enhanced categories used here. |
| Mathlib `Ideal.Cotangent` | `I/I²` as a module over `R/I`; the Hodge–Tate twist of A/I-modules is built from it. |
| Mathlib `WittVector.frobenius_verschiebung` | `F(V(x)) = p·x` for every commutative ring; gives `ψ(I) ⊂ pW(A/I)`. |
| Mathlib `IsAdicComplete` | Classical I-adic completeness (Hausdorff and precomplete), the form of p-completeness available for rings with bounded `p^∞`-torsion |
| Mathlib `Ideal.comap` | the preimage of an ideal under a ring map; the Nygaard ideal `Fil^i_N B` is the comap of `J^i` under the Frobenius |
| Mathlib `Ideal.mem_comap` | `x ∈` comap f K ↔ `f x ∈ K`, the membership criterion for the Nygaard ideals |
| Mathlib `Ideal.map` | the ideal generated by the image of an ideal; the ideals `(φ^r)^*(I) = φ^r(I)A` of a transversal prism |
| Mathlib `Ideal.toCotangent` | the linear surjection `I → I/I²`, used to state the transition maps of the twist |
| Mathlib `ModuleCat.extendScalars` | extension of scalars along a ring map as a functor of module categories; base change and Frobenius pullback of the twist |
| Mathlib `Module.Dual` | the dual module`; I^{-1} = Hom_A(I, A)` in the target of the Frobenius of the twist |
| Mathlib `Ideal.Quotient.factor` | the ring map `R/S → R/T` for `S ≤ T`; the transition maps of the tower `B/Fil^i_N B` |
| Mathlib `frobenius` | the Frobenius `x ↦ x^p` of a ring of characteristic p, used in the characteristic-p Witt Frobenius formula |
| Mathlib `Units` | the unit group `A^×`, used in the unit-group actions on Cartier–Witt divisors |
| Mathlib `WittVector.frobenius_eq_map_frobenius` | In characteristic `p, F = W`(Frobenius of R); used for the Frobenius of WCart over `F_p`-algebras. |
| Mathlib `WittVector.verschiebung` | The Verschiebung `V : W(R) → W(R)`, an additive map shifting coordinates`; V(1)` is the point `η`. |
| Mathlib `WittVector.verschiebung_mul_frobenius` | `V(x F(y)) = V(x) y`; gives `u V(1) = V(F(u))` and `(1 + [ε]) V(y) = V(y)`. |
| Mathlib `Polynomial.cyclotomic_prime_mul_X_sub_one` | cyclotomic `p R * (X − 1) = X^p − 1`; gives `φ(q−1) = (q−1)[p]_q`. |
| Mathlib `geom_sum_mul` | `(Σ_{i<n} x^i)(x − 1) = x^n − 1` in any ring; the identity behind `[n]_q (q−1) = q^n − 1`. |
| Mathlib `comonadicExtendScalars` | Extension of scalars along a faithfully flat ring homomorphism is a comonadic left adjoint; the fpqc stack and quotient-stack interfaces are supplied by SchemeAndStackFoundations §§1.18, 1.21. |
| Mathlib `CategoryTheory.Pseudofunctor.IsStack` | Stack predicate extending IsPrestack and requiring essential surjectivity of covering-sieve descent functors. |
| Mathlib `CategoryTheory.Pseudofunctor.DescentData` | Descent objects for a pseudofunctor and a covering family, with pullback maps and the self/composition coherences. |
| Mathlib `Perfection` | The perfection `{f : ℕ → α // f (n+1)^p = f n}` of a monoid (with a CommMonoid instance via Perfection.submonoid); it encodes the compatible-root systems used for large quasisyntomic algebras (§3.12). |

## How to read the build

Construct canonical Breuil–Kisin twists and Nygaard filtrations, absolute cohomology through the Cartier–Witt stack, and multiplicative q-crystalline and q-de Rham models. The relative Nygaard object is the Frobenius pullback; orientation choices never enter its canonical definition. Within a layer, the explicit prerequisites determine construction order. Earlier parts are consumed by roadmap name and section. Suggested.lean states the discrete Nygaard ideal laws, the infinitesimal Witt identity and the polynomial q-derivative laws over Mathlib carriers; the geometric constructions and comparisons are specified in the layers below.

## Layer 3: Nygaard filtration and Breuil–Kisin twists

First calculate the Frobenius-divisibility ideals of discrete quasiregular semiperfectoid prisms. Construct their twists and extend to filtered derived objects. Relative Nygaard theory on `φ_A^*Δ` supplies the `Lη` factorization and general de Rham comparison. Nygaard completion is a separate object: it is neither an implicit replacement of `Δ` nor automatically an isomorphism.

<a id="complete-base-change-totalization"></a>

### Imported completed base change and totalization

[PrismaticCohomology §1.10](../PrismaticCohomology/README.md#complete-base-change-totalization) supplies `Prismatic.completeBaseChange_totalization`: for a commutative ring C, a finitely generated ideal J, a ring map `C→C′` of finite J-complete Tor-amplitude, and a cosimplicial C-complex `M•` with a common cohomological lower bound, the natural map

`LΛ_(JC′)(Tot(M•)⊗^L_C C′) → Tot(LΛ_(JC′)(M•⊗^L_C C′))`

is an equivalence. Completion on the target uses the image ideal `JC′`. The lower bound is uniform over the cosimplicial degrees. (BS22 Lemma 4.22 and proof, p.44.)

*Needs:* [PrismaticCohomology §1.10](../PrismaticCohomology/README.md#complete-base-change-totalization).

**Checks.**

- Identity base change on derived J-complete terms gives the identity on their totalization.
- For `C→C[t]`, completed polynomial base change satisfies the exchange on uniformly bounded-below diagrams; flatness supplies amplitude zero.
- For `Z→F_p` and `J=(p)`, the exchange holds despite nonflatness: Tor-amplitude is `[−1,0]`, and `F_p⊗^L_Z F_p` retains its degree `−1` term.

**q-PD application.** For a q-PD pair `(D,I)`, take `C=D`, `J=(p,[p]_q)` and `C′=D/(q−1)`. Section 5.2 condition (3) supplies finite J-complete Tor-amplitude; the image ideal is `(p)` because `[p]_q=p` in C′. Section 5.10 identifies the q-crystalline Čech terms as the derived J-complete, discrete envelopes of §5.7. They therefore have the common cohomological lower bound zero. The supplied theorem gives the totalization exchange in §5.4 and hence the crystalline comparison of §5.11. This application uses the q-PD Tor-amplitude condition without assuming that `q−1` is regular (BS22 Definition 16.2(3), Lemma 16.5(3) and Construction 16.13, pp.106–107, 111–112).

<a id="s3-0"></a>
<a id="layer-3-filtered-multiplicative-enhancement"></a>

### 3.0 Multiplicative Beilinson cover and décalage

Prove `Prismatic.Filtered.connectiveCover_laxMonoidal`: for a commutative ring T, the Beilinson connective cover on `DF(T)` is lax symmetric monoidal, naturally in the coefficient algebra. Its multiplicative comparison with the supplied `Lη_J` for an invertible Cartier ideal J respects the `η_J` cochain model and multiplicative Bockstein reduction. (BMS2, Definition 5.3, Theorem 5.4`(1),(3), pp`.28–29; Proposition 5.8, Corollary 5.10, pp.31–32.)

*Needs:* DerivedDeRhamCohomology §1.14, DerivedDeRhamCohomology §1.17, DerivedDeRhamCohomology §1.18, DerivedDeRhamCohomology §1.19, AInfCohomology §§AI.1.3–AI.1.4, EnhancedDerivedSheaves §E5:abstract.2. The filtered category, Day tensor and Beilinson t-structure are imported, rather than constructed again here.

**Checks.** For `K=T` in degree zero, `Lη_JK=T` and its unit remains 1. For a nonzerodivisor d generating J and `K=[T --d→ T]` in degrees `0,1, η_JK=[T --d→ dT]` is acyclic; retaining its `T/d` cohomology is incorrect. For `K=T[1]` in degree `−1, η_JK=J^(−1)[1]`, which detects omission of negative filtration indices. For two homogeneous classes the Bockstein obeys `β(xy)=β(x)y+(−1)`^deg`(x)xβ(y)`; two degree-one generators over Z at `p=2` still have the integral minus sign before reduction.

**Proof route.** The Beilinson connective objects are closed under Day convolution: their i-th graded pieces lie in `D^{≤i}`, and the tensor connective bounds add. The inclusion of this symmetric monoidal subcategory has a right adjoint `τ_B^{≤0}`; the adjunction's unit and counit construct its lax structure and all coherences.

<a id="s3-1"></a>
<a id="layer-3-nygaard-filtration-qrsp"></a>

### 3.1 Nygaard filtration of a quasiregular semiperfectoid ring

For any prism `(B,J)`, define the ideal filtration `Fil_N^iB=φ_B^−1(J^i), i≥0`, and B for `i≤0`. Apply it to the initial prism of a QRSP ring. The API below gives its multiplicativity, variance and graded quotients; neither separatedness nor completeness is automatic (§3.23). This is Frobenius divisibility, not J-adic, powers of Fil¹, or a PD filtration.

For `J=(d)` this reads `φ(x)∈d^iB`. Initial QRSP prisms are imported at PrismaticCohomology §2.15. The ideal definition and the membership, zero, decreasing, product and map laws below hold for any ring endomorphism φ and ideal J. The map law assumes `fφ=ψf` and `f(J)⊂K`; the principal-power formula assumes φ is a ring equivalence with `φ(e)=d`.

(BS22, Definition 12.1; p. 86; BS22, Theorem 1.14 `(2)` and the warning after Definition 12.1; pp. 7, 86; ALB23, the paragraph before Theorem 3.4.4; p. 25.)

*Needs:* [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72), [PrismaticCohomology §0.73](../PrismaticCohomology/README.md#s0-73), [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84), Mathlib `Ideal.comap`, Mathlib `Ideal.mem_comap`.

- `Prismatic.Nygaard.fil`: `φ⁻¹(J^i), i≥0`.
- `Prismatic.Nygaard.mem_fil_iff`: Membership is `φ(x)∈J^i`.
- `Prismatic.Nygaard.fil_zero`: `Fil⁰=B`.
- `Prismatic.Nygaard.fil_antitone`: `i≤j ⇒ Fil^j⊂Fil^i`.
- `Prismatic.Nygaard.fil_mul_le`: `Fil^i·Fil^j⊂Fil^(i+j)`.
- `Prismatic.Nygaard.fil_map_le`: Prism maps preserve `Fil^i`.
- `Prismatic.Nygaard.fil_eq_span_pow_of_perfect`: For perfect `(B,(d)), φ(e)=d ⇒ Fil^i=(e^i)`.
- `Prismatic.Nygaard.gr`: `gr^i=Fil^i/Fil^(i+1)`.
- `Prismatic.Nygaard.intersection_fil`: For QRSP prisms, `∩Fil^i=ker φ` by I-separation; this is the completion kernel.

**Checks.**

- `pr3_nygaard_fil_zero`: `Fil^0_N B = B` for every prism `(B, J)`.
- `pr3_nygaard_fil_frobenius_id`: If `φ_B` is the identity (for example `(Z_p, (p))`) then `Fil^i_N B = J^i`.
- `pr3_nygaard_fil_perfect`: For a perfect prism `(B, (d))` with `e = φ^{-1}(d): Fil^i_N B = (e^i)`; for B the `(p, [p]_q)`-completion of `Z_p[q^{1/p^∞}]` and `d = [p]_q` this is `([p]_{q^{1/p}})^i`.
- `pr3_nygaard_fil_one_perfect`: For a perfect prism `(B, (d)): x ∈ Fil^1_N B` if and only if x maps to 0 under `B → B/dB` composed with `φ`, that is, `Fil^1_N B` is the kernel of `θ ∘ φ`.
- `pr3_nygaard_fil_not_powers`: It is false that `Fil^i_N B = (Fil^1_N B)^i` for all prisms and all i: in the key case `Y^p/[p]_q!` lies in `Fil^p_N Δ_S` and not in `(Fil^1_N Δ_S)^p`.

**Proof route.** `Fil^i_N B` is the preimage of the ideal `J^i` under the ring map `φ_B`, hence an ideal (Mathlib: comap of an ideal); it decreases with i because `J^{i+1} ⊂ J^i`.

<a id="s3-2"></a>
<a id="layer-3-nygaard-key-case"></a>

### 3.2 The key case: q-divided powers and the Nygaard filtration of `Z_p^cycl⟨X^{1/p^∞}⟩/X`

Take the perfect cyclotomic prism `A=(Z_p[q^(1/p^∞)])^∧_(p,[p]_q), R=A/[p]_q, q^(1/p^n)↦ζ_(p^(n+1))`, and `S=R⟨X^(1/p^∞)⟩/(X)`. Then `Δ_S=A⟨Y^(1/p^∞)⟩{Y^p/[p]_q}^∧`, flat over `Z_p[[q−1]]`, with `X^(1/p^n)↦Y^(1/p^(n−1))` in `Δ̄`. The q-PD lemma says `x^n∈[n]_q!D` when D is derived complete and completely flat for `(p,[p]_q), φ(q)=q^p`, and `φ(x)=x^p∈[p]_qD`. The factorial identities are `[mp]_q!=unit·φ([m]_q!)[p]_q^m` and `[⌊i⌋p]_q!=unit·[⌊ip⌋]_q!, i∈N[1/p]`. Thus `Δ` is completed free on `b_i=Y^i/[⌊i⌋]_q!, φ(b_i)=unit·[p]_q^⌊i⌋b_(ip)`. Its `Fil_N^n` is the completed sum of `[p]_(q^(1/p))^max(n−⌊i⌋,0)Ab_i`. Divided `φ` has image `Fil_n^conjΔ̄=span{b_i:i<p(n+1)}; Δ/Fil_N¹≃S` via `φ`, carrying `b_i` to `[⌊pi⌋]_q!·b_(pi)` for `i<1`. This factorial is a unit because `⌊pi⌋<p`.

Here `N[1/p]≥0`; in particular `X↦Y^p`. The exponent is `max(n−⌊i⌋,0)`. In the proof of BS22 Lemma 12.6, `∏[ip]_q!` is a misprint for `∏[ip]_q`.

(BS22, Lemmas 12.4–12.7 and their proofs, especially equation (10) (§12.2); pp. 88–90; BS22, Lemma 12.5; p. 88.)

*Needs:* [§3.1](#s3-1), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [PrismaticCohomology §0.86](../PrismaticCohomology/README.md#s0-86), [PrismaticCohomology §0.69](../PrismaticCohomology/README.md#s0-69), [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77), [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84), DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, [PrismaticCohomology §0.81](../PrismaticCohomology/README.md#s0-81).

**Checks.**

- For `0≤i<1/p`, the factorial is `[0]_q!=1` and `φ(b_i)=b_(pi)`.
- At `p=3, i=2/3`, `φ(b_(2/3))=(1+q)b_2`. In `Δ̄`, `q=ζ_3` and `b_2` is a nonzero basis vector; since `ζ_3` is a unit, this image differs from `b_2`.
- The image of `Δ/Fil_N¹` is still the span of `b_j` with `j<p`: the factorial factors are units, so the quotient identification and filtration formula are unchanged.

**Proof route.** `(a): Δ_S` is the prismatic envelope of `(I, Y^p)` in `A⟨Y^{1/p^∞}⟩` by PrismaticCohomology §2.15 and PrismaticCohomology §0.86 (BS22 Proposition 3.13); it is `(p, I)`-completely flat over A, hence flat over the noetherian ring `Z_p[[q−1]]`.

<a id="s3-3"></a>
<a id="layer-3-nygaard-regular-semiperfectoid"></a>

### 3.3 Good filtrations and the Nygaard filtration of regular semiperfectoid quotients

Over a perfectoid R with prism `(A,(d))`, call a multiplicative ideal filtration `M^•` on `QRSP Δ_S` good if `M⁰=Δ_S, φM^i⊂d^iΔ_S` and `φ/d^i` identifies `gr_M^i` with `Fil_i^conjΔ̄_S`. A good filtration is Nygaard and proves Theorem 12.2. Relatively perfect base change `S→S′` preserves it, with `M^i⊗`̂^`L_ΔΔ_(S′)` discrete; p-completely faithfully flat relatively perfect maps detect goodness. Consequently regular semiperfectoid quotients `R⟨X_j^(1/p^∞)⟩/(f_i)`, with `(f_i)` p-completely regular relative to R, satisfy the theorem; coordinate root quotients have the completed tensor-product Nygaard filtration.

Regularity is relative to R (BS22 Definition 2.42, `I=(p)`); in Proposition 12.8’s proof, “in `f_i`” means “in R′”.

(BS22, Proposition 12.8 and its proof; p. 90; BS22, Proposition 12.8; p. 90.)

*Needs:* [§3.1](#s3-1), [§3.2](#s3-2), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [PrismaticCohomology §2.8](../PrismaticCohomology/README.md#s2-8), [PrismaticCohomology §2.17](../PrismaticCohomology/README.md#s2-17), PerfectoidSpaces §P4.15.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

**Proof route.** `(1)`: induction on i with the map of short exact sequences `0 → Fil^{i+1}_M → Fil^i_M → gr^i_M → 0` to `0 → d^{i+1}Δ_S → d^iΔ_S → d^iΔ_S/d^{i+1}Δ_S → 0` given by `φ`; the right vertical map is injective, so `Fil^{i+1}_M = {x ∈ Fil^i_M : φ(x) ∈ d^{i+1}Δ_S}`.

<a id="s3-4"></a>
<a id="layer-3-nygaard-filtration"></a>

### 3.4 Nygaard filtration on prismatic cohomology over a perfectoid base

For smooth B over perfectoid R, choose `R⟨X_j⟩→B` surjective and its root cover `B̃=B⊗`̂_`(R⟨X_j⟩)R⟨X_j^(1/p^∞)⟩`. Totalize the ideal filtrations on its Čech nerve (locally §3.3), independently of this choice, then completed left Kan extend from polynomial algebras to animated S. This defines the decreasing multiplicative Nygaard filtration; its zero term, conjugate graded formula, smooth truncation, variance and quasisyntomic sheaf property are the API below.

Filtered objects lie in `DF(A)`, indexed by Z and constant below zero. BS22 Proposition 12.10’s printed graded target needs reduction and twist, as in the API; QRSP identification is §3.5.

(BS22, Definition 12.9 and the paragraph before it (§12.4); p. 92; BS22, Proposition 12.10 and the paragraph after it; p. 92; BS22, §12.5, first paragraph; p.92.)

*Needs:* [§3.3](#s3-3), [PrismaticCohomology §2.17](../PrismaticCohomology/README.md#s2-17), [PrismaticCohomology §2.1](../PrismaticCohomology/README.md#s2-1), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [PrismaticCohomology §1.20](../PrismaticCohomology/README.md#s1-20), EnhancedDerivedSheaves Layer E3, DerivedDeRhamCohomology §§5.1–5.7, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

- `Prismatic.Nygaard.filDerived`: The derived filtered `Δ` over a perfect prism.
- `Prismatic.Nygaard.filDerivedZeroIso`: `Fil⁰≃Δ`.
- `Prismatic.Nygaard.grDerived`: `cofib(Fil^(i+1)→Fil^i)`.
- `Prismatic.Nygaard.grDerivedIsoConj`: `gr^i≃φ_*Fil_i^conjΔ̄{i}`, via divided `φ`.
- `Prismatic.Nygaard.grDerived_smooth`: For smooth `B, gr^i≃φ_*τ≤iΔ̄{i}`.
- `Prismatic.Nygaard.filDerivedMap`: Filtered variance in S, with composition.
- `Prismatic.Nygaard.filDerived_isSheaf`: Each `Fil^i` has quasisyntomic descent.

**Checks.**

- `pr3_nygaard_derived_fil_zero`: `Fil^0_N Δ_{S/A} ≅ Δ_{S/A}` for every S.
- `pr3_nygaard_derived_gr_zero`: `gr^0_N Δ_{S/A} ≅ (φ_A)_* S` (derived p-completion of S, with A acting through `φ_A`), for every S; for `S = A/I` it is concentrated in degree 0.
- `pr3_nygaard_derived_base`: For `S = A/I` perfectoid: `gr^i_N Δ_{S/A} ≅ (φ_A)_*(I^i/I^{i+1})` in degree 0 for all `i ≥ 0`; concretely it is `(e^i)/(e^{i+1})` with `e = φ_A^{-1}(d)`.
- `pr3_nygaard_derived_not_truncation`: For `R = A/I ≠ 0, gr^0_N Δ_{R/A}` is not isomorphic to `τ^{≤0} Δ_{R/A} = A`: the graded pieces are truncations of Hodge–Tate cohomology, not of prismatic cohomology.

**Proof route.** `(a)`: each `B̃^k` satisfies Theorem 12.2 by §3.3 and Zariski localisation`; Δ_{B̃^•}` computes `Δ_{B/A}` by the Hodge–Tate comparison and quasisyntomic descent (PrismaticCohomology §2.17).

<a id="s3-5"></a>
<a id="layer-3-nygaard-graded-pieces"></a>

### 3.5 Graded pieces of the Nygaard filtration (BS22 Theorem 12.2)

For QRSP S over perfectoid R with prism `(A,(d)), φ/d^i:Fil_N^iΔ_S→Δ̄_S` has image `Fil_i^conj` and kernel `Fil_N^(i+1)`, so `gr_N^i≃(φ_A)_*Fil_i^conjΔ̄_S{i}` and `Δ_S/Fil_N¹≃S` via `φ`. Each graded module is p-completely flat over S. The derived filtration of §3.4 is discrete and equals this ideal filtration; unfolding on quasisyntomic rings is independent of R, although the displayed conjugate filtration is relative to R.

The conjugate filtration can depend on R (BS22 Example 12.3), while Nygaard does not. The cohomological range printed 0,−1 in §12.5 is 0,1; divided `φ` uses the trivialization `d^i` of the twist.

(BS22, Theorem 12.2, with Proposition 12.11 and its proof; pp. 86, 92; BS22, Proposition 12.11; p. 92; ALB23, Theorem 3.4.4 (published: Theorem 3.29); p. 25.)

*Needs:* [§3.1](#s3-1), [§3.3](#s3-3), [§3.4](#s3-4), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), DerivedModuleAlgebra §§0.4–0.17, 0.25; DerivedDeRhamCohomology §1.23, §§5.1–5.4, DerivedDeRhamCohomology §§5.1–5.7.

**Proof route.** Induction on i on the statement `Fil^i_{N′} = Fil^i_N`, where N′ is the derived filtration of §3.4 `(b); i = 0` is clear. Since `gr^j_{N′} ≅ Fil_j Δ̄_S{j}` is discrete for all j, each `Fil^i_{N′}` has cohomology only in degrees 0 and 1.

<a id="s3-6"></a>
<a id="layer-3-transversal-prism"></a>

### 3.6 Transversal prisms and the ideals I_r

A preprism (δ-ring with invertible ideal) is transversal when `A/I` is p-torsion-free. For a prism this is equivalent to p-regularity of A and an injective invertible ideal `I/pI→A/p`. Put `I_r=∏_(s<r)φ^s(I)A`. Each factor has p-torsion-free quotient`; I_r=∩_(s<r)φ^s(I)A, I_r` mod `p=I^((p^r−1)/(p−1))`, and `A=lim A/I_r=lim A/φ(I_r)`. For `r>0, φ^r(I)/I_(r+1)→A/I_r` is injective with image `(p)`. The cotangent transitions are p times surjections `c_r`, inducing `I_(r+1)/I_rI_(r+1)≃I_r/I_r²`, with p-torsion-free cotangents. Under prism maps `J_r=I_rB`; flat maps preserve transversality and faithfully flat maps reflect it.

This agrees with BL22 Definition 2.1.3. Transversality is `(d,p)`-regularity when oriented; prism flatness means p-complete flatness modulo I. In Corollary 2.2.9’s last proof line, `I_r` should be `I_(r+1)`.

(BL22, Definitions 2.1.1 and 2.1.3, Remarks 2.1.7 and 2.1.8; pp. 19, 20; BL22, Lemmas 2.2.1, 2.2.5 and 2.2.8; Corollaries 2.2.9–2.2.10; §2.2; pp. 21, 22, 23; BL22, Remarks 2.2.4 and 2.4.4; pp. 21, 27.)

*Needs:* [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72), [PrismaticCohomology §0.73](../PrismaticCohomology/README.md#s0-73), [PrismaticCohomology §0.87](../PrismaticCohomology/README.md#s0-87), [PrismaticCohomology §0.81](../PrismaticCohomology/README.md#s0-81), Mathlib `Ideal.map`.

- `Prismatic.BKTwist.IsTransversal`: `A/I` is p-regular.
- `Prismatic.BKTwist.frobeniusIdeal`: `φ^r(I)A`.
- `Prismatic.BKTwist.Ir`: `I_r=∏_(s<r)φ^s(I)A`.
- `Prismatic.BKTwist.Ir_zero`: `I₀=A`.
- `Prismatic.BKTwist.Ir_one`: `I₁=I`.
- `Prismatic.BKTwist.Ir_succ_le`: `I_(r+1)⊂I_r`.
- `Prismatic.BKTwist.IsTransversal.torsionFree`: Transversality implies p-regularity of A.
- `Prismatic.BKTwist.IsTransversal.quotient_Ir_torsionFree`: `A/I_r` is p-regular.
- `Prismatic.BKTwist.IsTransversal.frobeniusIdeal_le`: For `r>0, φ^r(I)⊂I_r+(p)`.
- `Prismatic.BKTwist.IsTransversal.Ir_eq_iInf`: For transversal prisms, product equals intersection.
- `Prismatic.BKTwist.IsTransversal.cotangent_transition`: Cotangent inclusion has image in `p(I_r/I_r²)`.
- `Prismatic.BKTwist.Ir_map`: Prism maps give `J_r=I_rB`.
- `Prismatic.BKTwist.cotangentTransition`: For `r≥1, c_r` uniquely divides cotangent inclusion by p; p-regularity gives uniqueness.

**Checks.**

- `pr3_transversal_ir_zero_one`: `I_0 = A` and `I_1 = I` for every prism.
- `pr3_transversal_q_de_rham_ir`: If `I = ([p]_q)` with `δ(q) = 0`, then `I_r = ([p^r]_q)` where `[p^r]_q = 1 + q + … + q^{p^r − 1}`.
- `pr3_transversal_torsion_free`: For a transversal prism, `p x = 0` in A implies `x = 0`.
- `pr3_transversal_not_crystalline`: A crystalline prism `(A, (p))` with `A/p ≠ 0` is not transversal.

**Proof route.** `(1): I^m/I^{m+1}` is an invertible A/I-module, hence p-torsion-free, so `A/I^n` is p-torsion-free for all n and A, being I-complete, is p-torsion-free (BL22 Remark 2.1.7); the criterion is Remark 2.1.8.

<a id="s3-7"></a>
<a id="layer-3-transversal-approximation"></a>

### 3.7 Approximation of prisms by transversal prisms

Every transversal preprism has a universal prismification, still transversal, inducing an open immersion modulo `(p,I)`. Every prism receives a map from a transversal prism. A transversal A and bounded B have a coproduct flat over B, faithfully flat if `A≠0` and transversal if B is; hence the category of transversal prisms mapping to any prism is nonempty, has pairwise coproducts and is sifted and weakly contractible. A bounded A is transversal iff these coproducts are flat over every bounded B, equivalently over one nonzero transversal B.

Prismification and transversal approximation include unbounded prisms. The coproduct uses the regular envelope of PrismaticCohomology §0.86 after orienting locally. BL22 Lemma 2.4.2’s idempotent-matrix ambient affine space has dimension n², not 2n.

(BL22, Proposition 2.4.1 with Lemmas 2.4.2, 2.4.3 and Proposition 2.1.10; pp. 20, 25; BL22, Proposition 2.4.5, Corollaries 2.4.7, 2.4.8, Proposition 2.4.9, Corollary 2.4.10; p. 27.)

*Needs:* [§3.6](#s3-6), [PrismaticCohomology §0.55](../PrismaticCohomology/README.md#s0-55), [PrismaticCohomology §0.86](../PrismaticCohomology/README.md#s0-86), [PrismaticCohomology §0.79](../PrismaticCohomology/README.md#s0-79), [PrismaticCohomology §0.17](../PrismaticCohomology/README.md#s0-17), [PrismaticCohomology §0.63](../PrismaticCohomology/README.md#s0-63), [PrismaticCohomology §0.74](../PrismaticCohomology/README.md#s0-74).

**Proof route.** `(1)`: lift `ρ : φ^*(I) → A/I` to `ρ̃ : φ^*(I) → A`, let `Spec A′ ⊂ Spec A` be the non-vanishing locus of `ρ̃` and B the `(I, p)`-completion of A′; the Frobenius extends because `φ` is the identity on the underlying space of `A/(I^k, p^k)`, the δ-structure exists because B is p-torsion-free, and the universal property is checked through Witt vectors of length two.

<a id="s3-8"></a>
<a id="layer-3-breuil-kisin-twist-transversal"></a>

### 3.8 Breuil–Kisin twist of a transversal prism

For transversal `(A,I)`, define `A{1}=lim_r(I_r/I_r²,c_r)`, using the divided transitions of §3.6. Its projections, kernels, universal lifting, invertibility and Frobenius are the API below. For transversal prism maps, the induced cotangent maps give a unique compatible map and `B⊗_A A{1}≃B{1}`. The Frobenius linearization uses `φ*I_r≃I^−1I_(r+1)`, not an arbitrary trivialization.

`(A, I)` is a transversal prism; all the statements of §3.6 are available. The transition maps are the canonical maps divided by p; the canonical maps themselves are divisible by p and their inverse limit is not the twist. `I^{−1}` denotes the dual invertible module `Hom_A(I, A); I^{−1} ⊗ M` is written `I^{−1}M`.

(BL22, Construction 2.2.11 and Proposition 2.2.12; p. 23; BL22, Remark 2.2.13 and Construction 2.2.14; pp. 23, 24.)

*Needs:* [§3.6](#s3-6), Mathlib `Module.Invertible`, Mathlib `Ideal.Cotangent`, Mathlib `Ideal.toCotangent`.

- `Prismatic.BKTwist.transversalProj`: `π_r:A{1}→I_r/I_r²`.
- `Prismatic.BKTwist.transversalProj_surjective`: `π_r` is onto.
- `Prismatic.BKTwist.ker_transversalProj`: `ker π_r=I_rA{1}`.
- `Prismatic.BKTwist.transversalProj_transition`: Undivided inclusion sends `π_(r+1)(x)` to `pπ_r(x)`.
- `Prismatic.BKTwist.transversal_ext`: All projections detect equality.
- `Prismatic.BKTwist.transversal_lift`: Compatible divided-transition families lift uniquely.
- `Prismatic.BKTwist.transversalFrobenius_projection`: `φ*I_r=I^−1I_(r+1)` induces `φ*A{1}/φ*I_r≃I^−1A{1}/φ*I_r` for all `r≥1`, characterizing Frobenius (BL22 Construction 2.2.14).
- `Prismatic.BKTwist.transversalTwist_projection`: `π_r` identifies `A{1}/I_r` with `I_r/I_r²` and `π_r=c_rπ_(r+1)`.

**Checks.**

- `pr3_bk_transversal_proj_one`: `π_1` induces `A{1}/IA{1} ≅ I/I²`: it is surjective with kernel `I · A{1}`.
- `pr3_bk_transversal_q_system`: If `I = ([p]_q)` with `δ(q) = 0` on a transversal prism, then `[p^{r+1}]_q − p [p^r]_q ∈ I_r²` for all r, so the classes of `[p^r]_q` are a compatible system.
- `pr3_bk_transversal_undivided`: The canonical maps `I_{r+1}/I_{r+1}² → I_r/I_r²` are not the transition maps: each has image in `p · (I_r/I_r²)`.
- `pr3_bk_transversal_proj_zero`: `π_0` is the zero map to `I_0/I_0² = 0`.

**Proof route.** `A{1}` is p-complete and p-torsion-free because each `I_r/I_r²` is; by the criterion for invertibility modulo `p^n` it suffices that `A{1}/p` is invertible over `A/p`, where it is the limit of the modules `Ī^{m_r}/Ī^{2m_r}, m_r = (p^r − 1)/(p − 1)`, invertible over `(A/p)/Ī^{m_r}`, and `A/p` is Ī-adically complete (BL22 Proposition 2.2.12).

<a id="s3-9"></a>
<a id="layer-3-breuil-kisin-twist"></a>

### 3.9 Breuil–Kisin twists A{n} of a prism

For any prism, take the colimit of `A⊗_(A₀)A₀{1}` over transversal prisms mapping to it; every transition and every map into the colimit is an iso. This defines the canonical twist with the API below, including all integer powers and Frobenius. For bounded faithfully flat prism maps it has effective descent, recovering the nonprincipal-ideal twist; reduction agrees with Part I’s Hodge–Tate twists.

`(A, I)` is any prism; boundedness is needed only for the descent statement in `(2)`. For a transversal prism the definition returns the inverse limit of §3.8, because the identity is then an object of C. `A{1}` has no canonical generator even when I is principal; a generator is extra structure (§3.11). The prismatic logarithm log_Δ : `(1 + I)_{rk=1} → A{1}` of Bhatt–Lurie §§2.3, 2.5, 2.7 is not part of this target; no target of the layer uses it.

(BL22, Proposition 2.5.1, Definition 2.5.2, Notation 2.5.4; p. 28; BL22, Remarks 2.5.5, 2.5.7, 2.5.8; pp. 28, 29; BL22, Remark 2.5.9; p. 29; BS22, Theorem 1.8 `(2)`, the sentence after the display; p. 4.)

*Needs:* [§3.7](#s3-7), [§3.8](#s3-8), [PrismaticCohomology §0.73](../PrismaticCohomology/README.md#s0-73), [PrismaticCohomology §1.1](../PrismaticCohomology/README.md#s1-1), AInfCohomology §AI.0:integral.1 (`AInf.bkTwist`), Mathlib `Module.Invertible`, Mathlib `ModuleCat.extendScalars`, Mathlib `Ideal.Cotangent`, Mathlib `Module.Dual`.

- `Prismatic.BKTwist.twist`: The canonical invertible module `A{1}`.
- `Prismatic.BKTwist.twist_invertible`: Invertibility of `A{1}`.
- `Prismatic.BKTwist.twistPow`: Integer tensor powers, duals for negative n.
- `Prismatic.BKTwist.twistModule`: `M{n}=A{n}⊗M`.
- `Prismatic.BKTwist.twistBaseChange`: `B⊗_AA{1}≃B{1}` for prism maps.
- `Prismatic.BKTwist.twistReduction`: `A{1}/I≃I/I²`.
- `Prismatic.BKTwist.twist_free_iff`: `A{1}` is free iff I is principal.
- `Prismatic.BKTwist.twistFrobenius`: `φ*A{1}≃I^−1⊗A{1}`.
- `Prismatic.BKTwist.twistFrobeniusMap`: Its additive semilinear map.
- `Prismatic.BKTwist.twistFrobeniusMap_smul`: `φ(ax)=φ(a)φ(x)`.
- `Prismatic.BKTwist.twistModule_of_bar`: For `IM=0, M⊗A{1}≃M⊗I/I²`.
- `Prismatic.BKTwist.twistPowFrobeniusMap`: `φ:A{n}→I^−nA{n}` for all integers, using inverse duals for negative n; tensor and base-change compatibility, `φ_A` at `n=0`.

**Checks.**

- `pr3_bk_twist_pow_zero`: `A{0} ≅ A`.
- `pr3_bk_twist_module_add`: `(M{m}){n} ≅ M{m+n}` for all `m, n ∈ Z`.
- `pr3_bk_twist_free_of_principal`: If `I = (d)` then `A{1}` is free of rank one.
- `pr3_bk_twist_q_generator`: If `δ(q) = 0` and `I = ([p]_q)`, then `A{1}` has a generator e with `[p]_q · φ_{A{1}}(e) = e` in `I^{−1} ⊗ A{1}`, where e is viewed in `I^{−1} ⊗ A{1}` through `I ⊂ A`.
- `pr3_bk_twist_no_fixed_generator`: For a crystalline prism `(A, (p))` with `A ≠ 0` no generator e of `A{1}` satisfies `φ_{A{1}}(e) = e`: the twist is not the unit Frobenius module.

**Proof route.** Existence: C has weakly contractible nerve (§3.7 `(4)`) and the diagram has invertible transition maps by part `(2)` of §3.8, so the colimit exists and every structure map is an isomorphism (BL22 Proposition 2.5.1).

**A_inf twist compatibility** (`Prismatic.BKTwist.ainfTwistIso`). For a complete algebraically closed extension C of Q_p in AInfCohomology §AI.0:integral.1's coefficient range, put `A_inf=W(O_C^♭)`. On the transversal prism `(A_inf,(ξ̃))`, identify the present twist with the supplied `AInf.bkTwist`. Here `I_r=ker θ̃_r=(ξ̃ φ(ξ̃)⋯φ^{r−1}(ξ̃))`; the identification preserves every conormal projection and divided transition map, tensor powers, duals and Frobenius. Transport it along the prism isomorphism `φ:(A_inf,(ξ))→(A_inf,(ξ̃))`, including extension of scalars along φ. Use the supplied coefficient twist and its API for AΩ coefficients under this identification. A compatible system of roots of unity is required only for the displayed cyclotomic generators.

(BMS1, Example 4.24; p.41; BMS2, Proposition 6.5 and Remark 6.6; pp.40–41; BL22, Construction 2.2.11 and Remark 2.5.9; pp.23, 29.)

*Needs:* [§3.8](#s3-8), the general prism twist and base change constructed above, AInfCohomology §AI.0:integral.1 (`AInf.bkTwist`).

**Checks.**

- At `r=1`, reduction modulo ξ̃ identifies the two projections to `ker θ̃/(ker θ̃)²`. The undivided conormal transition is p times the transition used in both twists.
- For `q=[ε]`, one has `[p]_q=ξ̃` and the compatible classes of `[p^r]_q` give the supplied generator e with `φ(e)=ξ̃^−1e`. In particular, at `p=2` the denominator is `1+q`; on the `(ξ)` prism it is `1+φ^−1(q)`, transported to `1+q` by φ.
- At tensor power zero the adapter is the identity of A_inf; at power −1 it is the dual adapter, with Frobenius factor ξ̃ on the dual cyclotomic generator. Tensoring the two adapters gives the evaluation to A_inf.

<a id="s3-10"></a>
<a id="layer-3-divided-frobenius"></a>

### 3.10 Divided Frobenius

For an oriented prism `(B,(d))`, define additive semilinear `φ_i=φ/d^i` on `Fil_N^i`. Its uniqueness, product, transition, divisibility and unit-change identities are below. Intrinsically use `Fil_N^iB→J^i`, or the twisted map `Fil_N^iB⊗B{i}→B{i}, x⊗e↦φ(x)φ_(B{i})(e)`. On an adapted generator with `φ(e)=d^−1e` this is `φ/d^i`. On QRSP prisms its reduction is the conjugate graded iso; root Čech totalization and completed left Kan extension give the derived maps over perfectoid bases, with transition `φ_i=dφ_(i+1)`.

`(B, J)` is a prism; in `(a) J` is principal with chosen generator d. The twist `B{i}` is the i-th tensor power of the Breuil–Kisin twist `B{1}` (§3.9)`; Fil^i_N B{i}` means `Fil^i_N B ⊗_B B{i},` a submodule of `B{i}` because `B{i}` is invertible. Semilinearity is over the Frobenius of B (and of A in `(d)`). BS22 Proposition 12.10 is quoted with the corrected target `τ^{≤i}Δ̄_{B/A}{i}`.

(BS22, Proposition 12.10; p. 92; BS22, Theorem 12.2; p. 86; BL22, Remark 2.5.9; p. 29.)

*Needs:* [§3.1](#s3-1), [§3.4](#s3-4), [§3.5](#s3-5), [§3.9](#s3-9), [PrismaticCohomology §1.9](../PrismaticCohomology/README.md#s1-9), [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72).

- `Prismatic.Nygaard.dividedFrobenius`: `φ_i=φ/d^i` on `Fil^i`.
- `Prismatic.Nygaard.dividedFrobenius_spec`: `d^iφ_i(x)=φ(x)`, uniquely. On a ring endomorphism φ and regular d, its value is characterised by `∃! y, d^i y=φ(x)` for `x∈φ⁻¹((d)^i)`.
- `Prismatic.Nygaard.dividedFrobenius_mul`: `φ_(i+j)(xy)=φ_i(x)φ_j(y)`.
- `Prismatic.Nygaard.dividedFrobenius_succ`: `φ_i=dφ_(i+1)` on `Fil^(i+1)`.
- `Prismatic.Nygaard.dividedFrobenius_mem_iff`: `φ_i(x)∈dB` iff `x∈Fil^(i+1)`.
- `Prismatic.Nygaard.dividedFrobenius_unit`: `d↦ud` multiplies `φ_i` by `u^−i`.
- `Prismatic.Nygaard.frobeniusFil`: Intrinsic semilinear `Fil^i→J^i`.
- `Prismatic.Nygaard.twistedDividedFrobenius`: `Fil^i⊗B{i}→B{i}, x⊗e↦φ(x)φ(e)`.
- `Prismatic.Nygaard.dividedFrobeniusDerived`: The natural multiplicative derived map on perfectoid bases, agreeing with `φ/d^i` on QRSP charts in adapted trivializations.

**Checks.**

- `pr3_divided_frobenius_zero`: `φ_0(x) = φ(x)` for all x.
- `pr3_divided_frobenius_perfect`: For a perfect prism `(B, (d))` and `φ(e) = d: φ_i(e^i a) = φ(a)` for all `a ∈ B`.
- `pr3_divided_frobenius_crystalline`: For a crystalline prism `(B, (p))` with `φ = id` (for example `Z_p): φ_i(p^i a) =` a.
- `pr3_divided_frobenius_kernel`: `φ_i(x) ∈ dB` exactly when `x ∈ Fil^{i+1}_N B`, so `φ_i` induces an injection `gr^i_N B → B/dB`.
- `pr3_divided_frobenius_not_multiplicative`: For a nonzero perfect prism, `φ_1` is not multiplicative. For every oriented prism and `x, y ∈ Fil^1_N B` one has `φ_1(xy) = d · φ_1(x)φ_1(y)`; in the nonzero perfect case, `x = y = φ^{-1}(d)` gives `φ_1(x²) = d ≠ 1 = φ_1(x)²`. Derived `(p,d)`-completeness forces `B=0` if `d=1`. For the zero prism the unique divided Frobenius is multiplicative.

**Proof route.** `(a): J = (d)` is invertible, so d is a nonzerodivisor and `x ∈ Fil^i_N` means `φ(x) ∈ d^iB; φ_i(x)` is the unique quotient. The identities follow by cancelling powers of `d; φ_i(x) ∈ dB ⇔ φ(x) ∈ d^{i+1}B ⇔ x ∈ Fil^{i+1}_N`.

<a id="s3-11"></a>
<a id="layer-3-breuil-kisin-twist-examples"></a>

### 3.11 Breuil–Kisin twists over the q-de Rham prism and over crystalline prisms

On the q-prism, `I_r=([p^r]_q)` and `[p^(r+1)]_q≡p[p^r]_q` mod `I_r²`. These classes define the generator `e_A` of `A{1}, φ(e_A)=[p]_q^−1e_A`; its image along a prism map f generates `B{1}` with `φ(λe_B)=φ_B(λ)f([p]_q)^−1e_B`. It depends on f. For crystalline prisms `q↦1` gives the canonical identification `(B{n},φ)=(B,p^−nφ_B)`, all `n∈Z`. For any oriented `(B,(d))` and generator `e, φ(e)=ud^−1e, u a unit; e↦ve` changes u to `φ(v)v^−1u`.

The cotangent description avoids assuming a logarithm construction; it agrees with `(q−1)e_A=`log_Δ`(q^p)`. The Frobenius target `I^−1{1}` means `I^−1⊗A{1}` (BL22 Notation 2.5.4).

(BL22, Proposition 2.6.1 and its proof, Remark 2.6.2; p. 31; BL22, Notation 2.6.3 and Example 2.6.4; p. 31.)

*Needs:* [§3.9](#s3-9), [§3.8](#s3-8), [§3.6](#s3-6), [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77), [PrismaticCohomology §0.74](../PrismaticCohomology/README.md#s0-74).

**Checks.**

- For `r=1`, the product has one factor and `I₁=([p]_q)`.
- For `r=2`, `I₂=([p]_q·[p]_(q^p))=([p²]_q)`. Modulo `([p]_q)` this product ideal vanishes, whereas the sum ideal `([p]_q,[p]_(q^p))` has image `(p)≠0` in `Z_p[ζ_p]`.
- At `q=1`, the product gives `I_r=(p^r)`, and `[p^(r+1)]_1=p[p^r]_1`, fixing the crystalline normalization.

**Proof route.** `(1): I_r` is generated by the product `∏_(s<r)φ^s([p]_q) = ∏_(s<r)[p]_(q^(p^s)) = [p^r]_q`. The congruence `q^{p^r} ≡ 1` modulo `I_r` gives `[p]_{q^{p^r}} ≡ p` modulo `I_r`, hence the congruence modulo `I_r²`.

<a id="s3-12"></a>
<a id="layer-3-large-quasisyntomic-algebra"></a>

### 3.12 Large quasisyntomic algebras over A/I

A quasisyntomic A/I-algebra is p-completely flat, derived p-complete and has Lhat of Tor-amplitude `[−1,0]`. Call it large if a completed root-polynomial A/I-algebra surjects onto it, equivalently its mod-p algebra is generated by elements admitting compatible p-power roots. Then Ωhat¹`=0`, Lhat`[−1]` and all `(∧^iL)[−i]^∧` are p-completely flat modules. Such algebras form a quasisyntomic basis, closed under its cover Čech terms; regular root quotients give the standard examples.

`(A, I)` is a bounded prism; Ā has bounded `p^∞`-torsion. Quasisyntomic algebras, covers and the site are those of DerivedDeRhamCohomology §§5.1–5.7 (BMS2 §4) over the base Ā. `Ā⟨X_t^{1/p^∞}⟩` is the p-adic completion of the perfected polynomial ring `Ā[X_t^{1/p^∞}]`. The second formulation is the one of Bhatt–Lurie (`S/pS` generated by the images of Ā and of `(S/pS)^♭`); for p-complete S the two agree because compatible systems of p-power roots lift uniquely from `S/pS` to S.

(BS22, Definition 15.1 and the paragraph after it; p. 102; BL22, proof of Proposition 5.1.1, first paragraph; p. 115.)

*Needs:* DerivedDeRhamCohomology §§5.1–5.7, DerivedModuleAlgebra §§0.4–0.17, 0.25; DerivedDeRhamCohomology §1.23, §§5.1–5.4, [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72).

- `Prismatic.Nygaard.IsLarge`: `S/p` is generated by compatible-root elements.
- `Prismatic.Nygaard.HasCompatibleRoots`: `x=x₀,x₁,…, x_(n+1)^p=x_n`.
- `Prismatic.Nygaard.isLarge_iff_exists_family`: Equivalent generating-family criterion modulo p.
- `Prismatic.Nygaard.IsLarge.of_surjective`: Surjective quotients preserve largeness.
- `Prismatic.Nygaard.IsLarge.kaehler_eq_smul`: `Ω¹_(S/Ā)=pΩ¹_(S/Ā)`.
- `Prismatic.Nygaard.isLarge_bar`: Ā is large over itself.

**Checks.**

- `pr3_large_base`: Ā is large over itself.
- `pr3_large_generated_by_roots`: If S is generated as an Ā-algebra by elements with compatible p-power roots, then S is large; this covers the p-completion of `Ā[X^{1/p^∞}]/(X)`.
- `pr3_large_kaehler`: For large S every Kähler differential of S over Ā is p times another one.
- `pr3_large_not_polynomial`: If `Ā/p≠0`, the p-completed polynomial algebra `Ā⟨X⟩` is quasisyntomic but not large: its reduction has the nonzero differential dX.

**Proof route.** Equivalence: a surjection from `Ā⟨X_t^{1/p^∞}⟩` exhibits generators with compatible roots; conversely generators `x_t` of `S/p` with compatible roots in S define `Ā⟨X_t^{1/p^∞}⟩ → S`, surjective modulo p and hence surjective by p-completeness.

<a id="s3-13"></a>
<a id="layer-3-relative-nygaard-large-quasisyntomic"></a>

### 3.13 Relative Nygaard filtration of a large quasisyntomic algebra (BS22 Theorem 15.2)

For large quasisyntomic `S/A/I, Δ_(S/A)` is discrete completely flat, a δ-A-algebra, and the initial relative prism. Its Frobenius twist `Δ¹=Δ⊗`̂_`(A,φ)A` is also discrete completely flat. Define `Fil_N^iΔ¹=φ_rel^−1(I^iΔ)`. Then `gr_N^i` injects into `Δ̄{i}` with image `Fil_i^conjΔ̄{i}`, and this filtration commutes with arbitrary bounded-prism completed base change.

`(A, I)` is a bounded prism; S is large and quasisyntomic over `A/I` (§3.12). The filtration lives on the Frobenius twist `Δ^{(1)}_{S/A} = φ_A^*Δ_{S/A}`, not on `Δ_{S/A}`: the relative Frobenius is A-linear only as a map out of the twist. For a perfect prism `φ_A` is an isomorphism and `Fil^i_N Δ^{(1)}_{S/A} = φ_A^* Fil^i_N Δ_{S/A}`. The conjugate filtration is the one of §2.3 relative to `A/I`; on large S its pieces are discrete, p-completely flat S-modules. Completed tensor products are derived `(p, I)`-completed; on completely flat modules over a bounded prism they are classical completions (§0.81).

(BS22, Theorem 15.2 and its proof; p. 102; BS22, Theorem 15.2 `(1); p`. 102; BL22, proof of Proposition 5.1.1; p. 115.)

*Needs:* [§3.12](#s3-12), [§3.5](#s3-5), [§3.3](#s3-3), [§3.4](#s3-4), [PrismaticCohomology §2.1](../PrismaticCohomology/README.md#s2-1), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [PrismaticCohomology §2.12](../PrismaticCohomology/README.md#s2-12), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §2.17](../PrismaticCohomology/README.md#s2-17), [PrismaticCohomology §1.21](../PrismaticCohomology/README.md#s1-21), [PrismaticCohomology §1.9](../PrismaticCohomology/README.md#s1-9), [PrismaticCohomology §0.83](../PrismaticCohomology/README.md#s0-83), [PrismaticCohomology §0.55](../PrismaticCohomology/README.md#s0-55), [PrismaticCohomology §0.63](../PrismaticCohomology/README.md#s0-63), [PrismaticCohomology §0.81](../PrismaticCohomology/README.md#s0-81), [PrismaticCohomology §0.78](../PrismaticCohomology/README.md#s0-78).

**Proof route.** `(1)`: by the derived Hodge–Tate comparison the graded pieces of the conjugate filtration of `Δ̄_{S/A}` are `(∧^i L_{S/(A/I)})[−i]^∧{−i}`, discrete and p-completely flat over S, so `Δ_{S/A}` is discrete and `(p, I)`-completely flat; initiality follows from PrismaticCohomology §2.12 (BS22 Lemma 7.7) once a functorial idempotent endomorphism of `Δ_{S/A}` is shown to be the identity, as in the proof of PrismaticCohomology §2.15 (BS22 Proposition 7.10).

<a id="s3-14"></a>
<a id="layer-3-relative-nygaard-filtration"></a>

### 3.14 Relative Nygaard filtration on the Frobenius twist `φ_A^*Δ_{R/A}`

For animated `R/A/I` set `Δ¹=Δ⊗`̂^`L_(A,φ_A)A`, with A-linear `φ_rel:Δ¹→Δ`. Construct relative Nygaard from §3.13 by quasisyntomic right Kan extension, then completed polynomial left Kan extension; these agree on their common range and glue on smooth formal schemes. Characterization: preserve sifted colimits and require `gr_N^n→Δ`̄`{n}` to be an iso on `H^m, m≤n`, and zero above n on polynomial algebras. It is multiplicative, N-indexed, with the filtered Frobenius, v-map, base change, and specializations in the API below. On perfect bases it is `φ_A*` of §3.4; affine quasisyntomic sections compute the smooth formal filtration.

`(A, I)` is a bounded prism; R is an animated commutative Ā-algebra (derived prismatic cohomology depends only on the derived p-completion of R). The filtration is on the Frobenius twist `φ_A^*Δ_{R/A}`. It is not a filtration of `Δ_{R/A}` unless `φ_A` is an isomorphism. `DF(A)` is the filtered derived category of DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1; the I-adic filtration `I^• ⊗ Δ_{R/A}` is Z-indexed, with i-th term `I^{⊗ i} ⊗_A Δ_{R/A}` for all `i ∈ Z` (negative powers are powers of the dual), as in BMS2 Proposition 5.8 and Bhatt–Lurie. Since `gr^n_N = 0` for `n < 0` the filtered Frobenius factors through its truncation to `i ≥ 0`, and for p-completely smooth `R (Δ̄ ∈ D^{≥0})` the Beilinson connective covers of the two filtrations agree. BL22 Proposition 5.1.1 `(1)` prints the target of `R ↦ Fil^n_N` as the complete derived category of Ā; the objects are A-complexes (for `R = Ā` they are the ideals `I^n`), so the target is the `(p, I)`-complete derived category of A. Bhatt–Lurie's and Bhatt–Scholze's constructions agree wherever both apply: BL22 defines the filtration on large algebras by the formula of BS22 Theorem 15.2 and extends it by the same Kan extensions.

(BS22, §15.1: Theorem 15.2, the paragraph after its proof, and Theorem 15.3 (first display); pp. 102, 103; BL22, Proposition 5.1.1 and its proof, Lemma 5.1.7; pp. 115, 116; BL22, Example 5.1.4, Remarks 5.1.6, 5.1.8, 5.1.9, 5.1.10; pp. 115, 119.)

*Needs:* [§3.13](#s3-13), [§3.12](#s3-12), [§3.4](#s3-4), [PrismaticCohomology §2.1](../PrismaticCohomology/README.md#s2-1), [PrismaticCohomology §2.17](../PrismaticCohomology/README.md#s2-17), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [PrismaticCohomology §1.21](../PrismaticCohomology/README.md#s1-21), [PrismaticCohomology §1.9](../PrismaticCohomology/README.md#s1-9), DerivedDeRhamCohomology §§5.1–5.7, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, EnhancedDerivedSheaves Layer E3, EnhancedDerivedSheaves Layer E5:animation, Mathlib `DerivedCategory`.

- `Prismatic.Nygaard.frobeniusTwist`: `Δ¹=φ_A*Δ`.
- `Prismatic.Nygaard.relativeFrobenius`: The A-linear `φ_rel:Δ¹→Δ`.
- `Prismatic.Nygaard.relFil`: The decreasing relative filtration.
- `Prismatic.Nygaard.relFilZeroIso`: `Fil⁰≃Δ¹`.
- `Prismatic.Nygaard.relGr`: Its graded cofibre.
- `Prismatic.Nygaard.relGr_triangle`: `Fil^(i+1)→Fil^i→gr^i→Fil^(i+1)[1]`.
- `Prismatic.Nygaard.relFilMap`: Filtered variance in R.
- `Prismatic.Nygaard.relFil_bar`: For `R=Ā, Fil^i=I^i[0]`.
- `Prismatic.Nygaard.relFil_large`: On large quasisyntomic R it is the discrete divisibility ideal.
- `Prismatic.Nygaard.relFilBaseChange`: Completed bounded-prism base change commutes with each `Fil^i`.
- `Prismatic.Nygaard.relativeFilteredFrobenius`: Filtered `φ:Fil_N^•Δ¹→I^•Δ`, including inverse ideal powers, preserving transitions and products.
- `Prismatic.Nygaard.relativeV`: `v:I⊗Fil^i→Fil^(i+1)`; transition followed by v is multiplication, and `φv` is I times `φ`.

**Checks.**

- `pr3_rel_fil_zero`: `Fil^0_N φ_A^*Δ_{R/A} ≅ φ_A^*Δ_{R/A}`.
- `pr3_rel_fil_base`: For `R = A/I` and all `i: Fil^i_N φ_A^*Δ_{R/A} ≅ I^i` in degree 0.
- `pr3_rel_gr_zero_base`: For `R = A/I: gr^0_N φ_A^*Δ_{R/A} ≅ A/I` in degree 0.
- `pr3_rel_fil_needs_twist`: The Nygaard ideal `Fil^1_N A = φ_A^{-1}(I)` of the base prism is not I in general: for the q-de Rham prism it is `(q − 1)`, while the relative filtration of `R = A/I` on `φ_A^*Δ = A` is `I = ([p]_q)`.

**Proof route.** `(a)` is §3.13. `(b)`: large algebras form a basis of the quasisyntomic site (§3.12)`; R ↦ φ_A^*Δ_{R/A}` and `R ↦ I^•Δ_{R/A}` satisfy quasisyntomic descent (BL22 Lemma 5.1.7, from the conjugate filtration and flat descent for exterior powers of the cotangent complex, DerivedDeRhamCohomology §§5.1–5.7; PrismaticCohomology §2.17), hence are right Kan extended from large algebras, and so is the filtered Frobenius.

<a id="s3-15"></a>
<a id="layer-3-relative-nygaard-graded-pieces"></a>

### 3.15 Graded pieces of the relative Nygaard filtration

For animated `R/A/I`, filtered Frobenius identifies `gr_N^nΔ¹≃Fil_n^conjΔ̄{n}` for `n≥0`, with negative graded terms zero; in particular `gr_N⁰≃`Rhat. Smooth R gives `τ≤nΔ̄{n}`; the zero-index and successive conjugate fibre sequences retain their canonical cotangent exterior powers. More precisely, smooth cohomology is Ωhat^`m{n−m}` for `0≤m≤n` and zero otherwise`; gr_N¹≃L_(R/A)[−1]^∧`, and `gr_N^n` lies in `D≤n` for every animated R (Beilinson connectiveness).

R animated Ā-algebra; the conjugate filtration and the twist `{n} = ⊗ (I/I²)^{⊗ n}` are those of PrismaticCohomology §2.3. The isomorphism in `(1)` is A-linear: the semilinearity of the perfectoid statement §3.5 has been absorbed into the Frobenius twist. `(4)` is BS22 Remark 15.6, which prints `L_{X/A} ≃ gr^1_N Δ^{(1)}_{X/A}` without the shift and cites Theorem 1.16 `(2)` for `(3)`; the target states the corrected form. The Beilinson t-structure is required from DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1 (BMS2 Definition 5.3).

(BS22, Theorem 15.3 (= Theorem 1.16 `(3)`) and Theorem 15.2 `(2); pp`. 8, 102, 103; BL22, Remarks 5.1.2, 5.1.3, 5.1.5; p. 115; BS22, Remark 15.6; p. 105.)

*Needs:* [§3.14](#s3-14), [§3.13](#s3-13), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [PrismaticCohomology §1.20](../PrismaticCohomology/README.md#s1-20), [PrismaticCohomology §2.5](../PrismaticCohomology/README.md#s2-5), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

**Proof route.** `(1)` on large quasisyntomic algebras is §3.13 `(2)`; both sides are right Kan extended from large algebras on quasisyntomic ones and left Kan extended from polynomial algebras in general (§3.14; the conjugate filtration commutes with sifted colimits), which gives the functorial isomorphism for all R (BL22 Remark 5.1.2 and the proof of Proposition 5.1.1).

<a id="s3-16"></a>
<a id="layer-3-leta-frobenius-factorisation"></a>

### 3.16 The Lη_I factorisation of Frobenius (BS22 Theorem 15.3)

Let `(A, I)` be a bounded prism and R a p-completely smooth A/I-algebra, `X = Spf R, Δ = Δ_{R/A} = RΓ_Δ(X/A)`. `(1)` The filtered Frobenius `Fil^•(φ) : Fil^•_N φ_A^*Δ → I^• ⊗ Δ` factors uniquely through the connective cover `τ^{≤0}_B(I^• ⊗ Δ)` for the Beilinson t-structure, whose underlying complex is `Lη_I Δ`. On underlying complexes this gives a canonical map `φ̃ : φ_A^*Δ_{R/A} → Lη_I Δ_{R/A}` such that the relative Frobenius factors as `φ_A^*Δ_{R/A} → Lη_I Δ_{R/A} → Δ_{R/A}`, the second map being the canonical one (it exists because `Δ` lies in `D^{≥0}` and `H^0(Δ)` is I-torsion-free). `(2) φ̃` is an isomorphism. `(3)` The filtered map `Fil^•_N φ_A^*Δ_{R/A} → τ^{≤0}_B(I^• ⊗ Δ_{R/A})` is an isomorphism of filtered objects: `Fil^•(φ)` exhibits the Nygaard filtration as the Beilinson connective cover of the I-adic filtration. For an I-torsion-free complex `K^•` representing `Δ, Fil^i_N` corresponds under `φ̃` to the subcomplex `I^iK^• ∩ η_I K^•` of `η_I K^•`. In particular `lim_i Fil^i_N φ_A^*Δ_{R/A} = 0`. `(4) φ̃` is a map of commutative algebra objects, compatible with base change in `(A, I)` and with étale localisation on R; for a smooth formal A/I-scheme X it globalises to an isomorphism `φ̃ : Δ^{(1)}_{X/A} ≅ Lη_I Δ_{X/A}` in `D(X_ét, A)`.

`(A, I)` is a bounded prism; R is p-completely smooth over `A/I`. No orientation of I and no hypothesis on `W(A/I)` is made. `Lη_I` is the derived décalage functor of AInfCohomology Layer AI.1 for the invertible ideal `I ⊂ A` (on the ringed topos `(X_ét, A)` in the global statement); it is not exact, and the statement is one about objects and maps in `D(A)`. The Beilinson t-structure, `τ^{≤0}_B`, and the identification of `Lη_I K` with the underlying complex of `τ^{≤0}_B(I^• ⊗ K)` (BMS2 Theorem 5.4 and Proposition 5.8) are required from DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1 and AInfCohomology Layer AI.1.

(BS22, Theorem 15.3 (= Theorem 1.16 `(4)`) and its proof; pp. 8, 103; BL22, Corollaries 5.2.11 and 5.2.14; p.123; BMS2, Proposition 5.8 and its proof; p. 32; BMS1, Lemma 6.10 and Proposition 6.12; pp. 51, 52.)

*Needs:* [§3.14](#s3-14), [§3.15](#s3-15), AInfCohomology §AI.1.2, AInfCohomology §AI.1.4, AInfCohomology §§AI.1.1–AI.1.2, AInfCohomology Layer AI.1, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, [PrismaticCohomology §1.20](../PrismaticCohomology/README.md#s1-20), [PrismaticCohomology §1.14](../PrismaticCohomology/README.md#s1-14), [PrismaticCohomology §1.21](../PrismaticCohomology/README.md#s1-21), DerivedDeRhamCohomology §3.4, [PrismaticCohomology §1.17](../PrismaticCohomology/README.md#s1-17), [PrismaticCohomology §0.78](../PrismaticCohomology/README.md#s0-78), [PrismaticCohomology §1.11](../PrismaticCohomology/README.md#s1-11), [PrismaticCohomology §0.81](../PrismaticCohomology/README.md#s0-81).

**Proof route.** `(1)`: by §3.15 `(3), gr^i_N ≅ τ^{≤i}Δ̄{i} ∈ D^{≤i}`, so `Fil^•_N φ_A^*Δ` is Beilinson connective and the filtered Frobenius factors uniquely through `τ^{≤0}_B(I^•Δ)`; its underlying complex is `Lη_IΔ` (BMS2 Proposition 5.8).

<a id="s3-17"></a>
<a id="layer-3-de-rham-comparison-general"></a>

### 3.17 De Rham comparison for every bounded prism (BS22 Corollary 15.4)

For smooth formal X over any bounded prism, `Δ_(X/A)⊗`̂^`L_(A,φ_A)A/I≃Ω`hat*_`(X/(A/I))` as E∞-algebras; for animated R the right side is completed derived de Rham. No p-regularity of `W(A/I)` is needed. The scalar Frobenius and Bockstein product are essential; this extends PrismaticCohomology §1.22 on its range.

`(A, I)` is a bounded prism; X is a smooth p-adic formal scheme over `A/I`, not necessarily affine or proper. The scalar extension is along `φ_A` followed by `A → A/I` and is derived `(p, I)`-completed; it is not the untwisted reduction `Δ̄_{X/A}`, whose cohomology is the Hodge–Tate cohomology. BS22 Corollary 15.4 prints the right-hand side as `Ω^*_{R/(A/I)}`; it is `Ω^*_{X/(A/I)}`. §1.22 is the same statement under the hypothesis that `W(A/I)` is p-torsion-free (BS22 Theorem 6.4), proved without `Lη`. The sources do not compare the two isomorphisms when both are defined, and the target does not assert that they coincide. Bhatt–Lurie prove `(3)` through the Hodge–Tate divisor of the Cartier–Witt stack; use the Bhatt–Scholze route, which needs nothing from Layer 4.

(BS22, Corollary 15.4 and its proof; p. 104; BL22, Proposition 5.2.5; p. 121; BMS1, Proposition 6.12; p. 52.)

*Needs:* [§3.16](#s3-16), AInfCohomology §AI.1.4, AInfCohomology §AI.1.4, AInfCohomology Layer AI.1, [PrismaticCohomology §1.20](../PrismaticCohomology/README.md#s1-20), [PrismaticCohomology §1.19](../PrismaticCohomology/README.md#s1-19), [PrismaticCohomology §1.22](../PrismaticCohomology/README.md#s1-22), [PrismaticCohomology §2.1](../PrismaticCohomology/README.md#s2-1), DerivedDeRhamCohomology Layer 2, DerivedDeRhamCohomology §2.12, EnhancedDerivedSheaves Layer E3.

**Proof route.** `(2)`: reduce `φ̃ : φ_A^*Δ ≅ Lη_IΔ` modulo I and apply AInfCohomology §AI.1.4 (BMS1 Proposition 6.12): `Lη_IΔ ⊗^L A/I` is represented by the complex with terms `H^i(Δ̄){i}` and the Bockstein differential `β_I`.

<a id="s3-18"></a>
<a id="layer-3-image-of-frobenius"></a>

### 3.18 The image of Frobenius on prismatic cohomology (BS22 Corollary 15.5)

For smooth `R/A/I`, construct `V_i:τ≤iΔ⊗I^i→τ≤iΔ¹` such that both composites with `φ_rel` are multiplication by `I^i`. Thus Frobenius is invertible after I-inversion on cohomology, also on `RΓ` for qcqs smooth formal X, since its Frobenius pullback commutes with that limit.

X smooth p-adic formal scheme over `A/I; Δ^{(1)}_{X/A} = Δ_{X/A} ⊗`̂^`L_{A, φ_A} A` as a sheaf on `X_ét`. BS22 Corollary 15.5 prints the induced map as `H^i(X_ét, Δ^{(1)}_{X/A}) ⊗ I^{⊗ i} → H^i_Δ(X/A)`; source and target are interchanged. The target states the corrected direction, which is that of BS22 Theorem 1.8 `(6)`. The identification `H^i(X_ét, Δ^{(1)}_{X/A}) = H^i(φ_A^*RΓ_Δ(X/A))` uses the completed quasi-coherent projection formula on a quasi-compact quasi-separated X, established through finite affine descent as in PrismaticCohomology §1.21; the sheaf-level statement needs no such hypothesis.

(BS22, Corollary 15.5 and its proof; p. 104; BS22, Theorem 1.8 `(6); p`. 4; BMS1, Lemma 6.9; p. 51.)

*Needs:* [§3.16](#s3-16), AInfCohomology Layer AI.1, AInfCohomology §AI.1.2, AInfCohomology §AI.1.2.

**Proof route.** By §3.16, `φ̃ : Δ^{(1)}_{X/A} ≅ Lη_I Δ_{X/A}` and `φ = (Lη_IΔ → Δ) ∘ φ̃`. BMS1 Lemma 6.9 (required from AInfCohomology Layer AI.1) gives natural transformations `I^{⊗ m} ⊗ τ^{≤ m} → τ^{≤ m} Lη_I` and, on objects with I-torsion-free `H^n, τ^{≥ n} Lη_I → I^{⊗ n} ⊗ τ^{≥ n}`, whose composites in both orders on `τ^{[n, m]}` are the natural inclusions.

<a id="s3-19"></a>
<a id="layer-3-nygaard-hodge-comparison"></a>

### 3.19 Comparison of the Nygaard filtration with the Hodge filtration of derived de Rham cohomology

For animated `R/A/I`, Bockstein on `H^n(gr_N^nΔ¹)` gives the p-completed ordinary de Rham DGA of `π₀R`; Ωhat^n means `H⁰` of derived completion and need not be classically separated. The natural filtered map `γ:Fil_NΔ¹→Fil_Hdg` LΩhat has `γ₀:R→R` the identity and fibre `I⊗Fil_N^(•−1)→Fil_N^•→Fil_Hdg^•`. Reduction by I identifies `lim Fil_N` with `lim Fil_Hdg`. If the p-completion of R is smooth of dimension `≤d, v:I⊗Fil_N^n→Fil_N^(n+1)` is an iso for `n≥d`, so `Fil_N^n=I^(n−d)Fil_N^d`. The graded fibre is `Fil_(n−1)^conjΔ̄{n}→Fil_n^conjΔ̄{n}→∧`^nLhat`[−n]`.

R animated Ā-algebra`; dR^∧_{R/Ā}` and its Hodge filtration are those of DerivedDeRhamCohomology Layer 2, p-completed; for p-completely smooth R they are the p-completed de Rham complex with its stupid filtration. In `(1)` the de Rham complex is that of `π_0(R)` relative to Ā, and `Ω̂^n` is `H^0` of the derived p-completion of `Ω^n_{π_0(R)/Ā}` (Bhatt–Lurie's convention; it need not be p-adically separated and agrees with the classical completion when `Ω^n` has bounded `p^∞`-torsion). In the proof of BL22 Corollary 5.2.8 the Hodge–Tate comparison is printed `gr_n^conj Δ̄_{R/A}{n} ≃ LΩ̂^n_{R/Ā}[n]`; the shift is `[−n]`. The fibre sequence compares three filtrations at once: on graded pieces it reads `Fil_{n−1}^conj Δ̄{n} → Fil_n^conj Δ̄{n} → gr_n^conj Δ̄{n} ≅ LΩ̂^n_{R/Ā}[−n]`.

(BL22, Construction 5.2.1, Propositions 5.2.2 and 5.2.3; pp. 119, 120; BL22, Corollaries 5.2.8, 5.2.9, 5.2.15; pp.122–123.)

*Needs:* [§3.14](#s3-14), [§3.15](#s3-15), [§3.17](#s3-17), [PrismaticCohomology §1.19](../PrismaticCohomology/README.md#s1-19), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), DerivedDeRhamCohomology Layer 2, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

**Proof route.** `(1): H^n(gr^n_N) ≅ H^n(Fil_n^conj Δ̄{n}) ≅ Ω̂^n_{R/Ā}` by §3.15 and the connectivity of the conjugate filtration; the Bockstein is identified with d on polynomial algebras through the Hodge–Tate comparison (PrismaticCohomology §1.19), hence in general; uniqueness because the de Rham complex is generated in degree 0 (BL22 Proposition 5.2.2).

<a id="s3-20"></a>
<a id="layer-3-nygaard-completion"></a>

### 3.20 Nygaard completion

For a prism define Bhat`=lim_i B/Fil_N^i`, with kernel filtration; the API gives the quotient, graded and separation formulas. If `J=(d)` and B is classically d-complete, `φ` extends as φhat:Bhat`→B` and the Frobenius of Bhat is cφhat; divided maps extend `Fil_N`^iBhat`→B` and their twisted versions to Bhat`{i}`. For a derived filtered `M=Fil⁰`, define Mhat`=lim_i M/Fil^i` and Fil^iMhat`=lim_(j≥i)Fil^i/Fil^j; M≃`Mhat iff lim_iFil^`i=0`. Discrete surjective towers recover the ring definition. Over perfectoid bases, complete filtered Nygaard is the QRSP unfolding and is a quasisyntomic sheaf`; Δ≃Δ`hat is not automatic.

`(B, J)` is a prism; in `(b) J` is principal, which holds for the initial prism of a quasiregular semiperfectoid ring. Completion means completion with respect to the Nygaard filtration only; no `(p, J)`-adic completion is applied, and by BS22 Lemma 13.2 `(2)` none is needed for `Δ_S` (§3.26). Statement `(b)` is not printed in the sources in this form; it is immediate from the definition of the filtration and is needed because the syntomic complexes of PrismaticCohomologyPartIII Layer 6 need `φ_i` on the completion without passing through topological Hochschild homology. `Δ` and `Δ̂` are distinct objects: no statement of the layer identifies them outside the cases listed in §3.21.

(BS22, Theorem 13.1 and the proof of Lemma 13.2; p. 94; BL22, §5 introduction and Definition 5.8.5; p. 148; BMS2, Definition 5.1 and Lemma 5.2 `(2); p`. 28.)

*Needs:* [§3.1](#s3-1), [§3.5](#s3-5), [§3.10](#s3-10), [§3.4](#s3-4), [§3.14](#s3-14), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, Mathlib `Ideal.Quotient.factor`, Mathlib `IsAdicComplete`.

- `Prismatic.Nygaard.completion`: `lim_iB/Fil^i` as compatible families.
- `Prismatic.Nygaard.mem_completion_iff`: Compatibility under all quotient transitions.
- `Prismatic.Nygaard.toCompletion`: `c:B→`Bhat.
- `Prismatic.Nygaard.toCompletion_apply`: `c(x)_i=x` mod `Fil^i`.
- `Prismatic.Nygaard.ker_toCompletion`: `ker c=∩Fil^i`.
- `Prismatic.Nygaard.completionProj`: Projection Bhat`→B/Fil^i`.
- `Prismatic.Nygaard.completionProj_surjective`: Each projection is onto.
- `Prismatic.Nygaard.completionFil`: The projection kernel.
- `Prismatic.Nygaard.completionFrobenius`: For `J=(d), B` d-complete, φhat:Bhat`→B` extending `φ`.
- `Prismatic.Nygaard.completionFrobenius_toCompletion`: φhat `c=φ`.
- `Prismatic.Nygaard.IsNygaardComplete`: c bijective.
- `Prismatic.Nygaard.completionDividedFrobenius`: On oriented perfect-base QRSP charts, the continuous extension Fil^iΔhat`→Δ` of `φ/d^i`; twists remove the orientation. The target is `Δ`.

**Checks.**

- `pr3_completion_perfect`: For a perfect prism `(B, (d))` with B classically `(p, d)`-adically complete, `c : B → B̂` is bijective.
- `pr3_completion_quotient`: `B̂ → B/Fil^i_N B` is surjective with kernel `Fil^i_N B̂`, and `c^{-1}(Fil^i_N B̂) = Fil^i_N B`.
- `pr3_completion_frobenius`: `φ̂ ∘ c = φ`: the Frobenius of the completion restricts to `φ` on B.
- `pr3_completion_not_surjective`: It is false that c is surjective for every prism: for the prism of `F_p[X^{1/p^∞}]/(X)` the element `Σ_m Y^m/m!` of B̂ is not in the image.

**Proof route.** `(a)`: the inverse limit of rings along surjections; the kernel of `B̂ → B/Fil^i_N B` is the limit of `Fil^i_N/Fil^j_N`, the transition maps are surjective, so `B̂ → B/Fil^i_N` is surjective and the quotients and graded pieces are unchanged; completeness of B̂ is the standard statement for limits of towers.

<a id="s3-21"></a>
<a id="layer-3-nygaard-completeness"></a>

### 3.21 Completeness of the Nygaard filtration: exact statements

For rings, `c:B→`Bhat is injective iff `∩Fil_N^i=0` and bijective iff additionally `lim¹Fil_N^i=0`; in the derived category completeness is `lim Fil=0`. Perfectoid `A_inf` is Nygaard-complete. Relative `Δ¹` is complete iff derived de Rham is Hodge-complete; p-complete flat R with `R/p` ind-smooth over the reduced base is complete. Smooth dimension d gives `Fil_N^n=I^(n−d)Fil_N^d` for `n≥d`; over perfect bases transport to untwisted `Δ`. QRSP alone does not suffice (§3.23).

All objects are already ideal-complete. Smooth de Rham has finite Hodge filtration; BL22 Remark 5.8.4’s last exponent should give `I^(n−d)⊗Fil_N^d`, as stated above.

(BL22, Corollaries 5.2.9, 5.2.10, 5.2.11; pp.122–123; BL22, Example 5.8.1 and Proposition 5.8.2; p. 147; BS22, the warning after Definition 12.1; p. 86.)

*Needs:* [§3.20](#s3-20), [§3.19](#s3-19), [§3.16](#s3-16), [§3.14](#s3-14), [§3.1](#s3-1), [§3.4](#s3-4), DerivedDeRhamCohomology Layer 2, [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84).

**Proof route.** `(1)`: the Milnor sequence for the tower `Fil^i_N B: 0 → lim Fil^i → B → lim B/Fil^i → lim^1 Fil^i → 0`. `(2): φ` is bijective, so `Fil^i_N = φ^{-1}(d^i A) = (e^i)` (§3.1)`; A_inf(S)` is classically `(p, d)`-complete, `e^p ≡ d` modulo p, so it is derived e-complete and e-adically separated, hence e-adically complete.

<a id="s3-22"></a>
<a id="layer-3-nygaard-frobenius-colimit"></a>

### 3.22 Prismatic cohomology as the completed colimit of the Nygaard pieces

Completed `colim_m I`^−mFil_N^`mΔ¹→Δ` via filtered Frobenius is an iso. For smooth relative dimension `≤d` it is constant from `m=d`, with `Fil_N^m` mapping isomorphically onto `I^mΔ`; on smooth formal X of that dimension, RΓ_qsyn`(Fil_N^iΔ¹)=I^iRΓ_Δ(X/A)` for `i≥d`. No additional Nygaard completion is needed here.

R animated A/I-algebra`; I^{−m}` is the dual of `I^{⊗ m}`. The colimit is formed in the `(p, I)`-complete derived category of A. BS22 states `(3)` for the Nygaard-completed sheaf; by §3.21 `(4)` completion changes nothing for smooth X.

(BL22, Corollary 5.2.16 and its proof; p. 123; BL22, Corollary 5.2.15; p. 123; BS22, §15.2, the paragraph after Proposition 15.7; p. 105.)

*Needs:* [§3.14](#s3-14), [§3.15](#s3-15), [§3.19](#s3-19), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3).

**Proof route.** Both sides of `(1)` commute with filtered (indeed sifted) colimits in R, so R may be taken a polynomial algebra in d variables. By §3.19 `(4)` the diagram is constant for `m ≥ d`.

<a id="s3-23"></a>
<a id="layer-3-nygaard-incomplete-example"></a>

### 3.23 A quasiregular semiperfectoid ring whose prism is not Nygaard-complete

For `S₀=F_p[X^(1/p^∞)]/(X), Δ` is p-completed free on `b_i=Y^i/⌊i⌋!, i∈N[1/p]`, and `Fil_N^n` is the completed sum of `p^max(n−⌊i⌋,0)Z_pb_i`, equivalently generated by `p^aY^b/b!·Y^ε` with `a+b≥n`. The intersection is zero but completion allows coefficient families with only finitely many low`-⌊i⌋` coefficients outside `p^(n−⌊i⌋)`, whereas `Δ` requires coefficients tending to zero p-adically. Thus `exp(Y)∈Δ`hat\`Δ` and `lim¹Fil_N≠0`; the q-version uses `ΣY^m/[m]_q!`. Perfectoid inputs remain complete.

This is §3.2 at `q=1`, with the `A_crys` coordinate transported through Frobenius (ALB23 Remark 3.4.3). It uses only the relative QRSP prism.

(BL22, Example 5.8.1; p. 147; BL22, Proposition 5.3.6; p. 126; BS22, Lemma 12.7 and property `(3)` in the proof of Proposition 12.8; pp. 89, 90.)

*Needs:* [§3.2](#s3-2), [§3.3](#s3-3), [§3.20](#s3-20), [§3.1](#s3-1), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §0.69](../PrismaticCohomology/README.md#s0-69), [PrismaticCohomology §0.74](../PrismaticCohomology/README.md#s0-74), DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21.

**Proof route.** `(1): Δ_{S_0}` is the prismatic envelope `Z_p⟨Y^{1/p^∞}⟩{Y^p/p}^∧` (PrismaticCohomology §2.15), which is the p-completed divided power envelope of `(Y)` by PrismaticCohomology §0.69 (BS22 Corollary 2.39) since `Y^p = φ(Y)`; its basis is the standard one (DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21).

<a id="s3-24"></a>
<a id="layer-3-nygaard-filtration-in-coordinates"></a>

### 3.24 The Nygaard filtration in coordinates (de Rham and q-de Rham models)

For a nonnegative cochain model M of `Δ¹`, let d and `d′=φ(d)` be regular, with the stated completed semilinear Frobenius and `φ(M^n)⊂d′^nM^n`. If `φ/d′^n:M^n/d→H^n(M/d′)` is bijective, then `Fil_N^iM^n=d^max(i−n,0)M^n`. If also `M^n/d→M^n/d′` via `φ/d′^n` is injective, this is exactly termwise Frobenius divisibility. Apply now to completed de Rham over `W(k), d=p`, and later to framed q-de Rham over `A_inf` with `d=ξ, d′=ξtilde, q=[ε]` (§5.26); the general criterion has no dependency on that later model.

`(A, (d))` is a perfect prism; under `Δ_{R/A} = (φ_A)_* φ_A^*Δ_{R/A}` the ideal `I^i Δ` corresponds to `d′^i M`, which is why d′ appears in `(a)` and d in the conclusion. Hypothesis `(b)` is the Cartier isomorphism in the model M: in `(i)` it is the inverse Cartier isomorphism (DerivedDeRhamCohomology Layer 3), in `(ii)` its q-analogue. In instance `(ii)` the identification of the framed q-de Rham complex with `φ_A^*Δ_{R/A_inf}` (through `AΩ`) and hypothesis `(b)` are supplied by Layer 5, which applies this target; prove here the criterion and instance `(i)`. BMS2 Remark 9.11 prints `q = [ε] − 1`; the q-de Rham complex of BMS1 Definition 9.5 is taken with `q = [ε]`, so that `q − 1 = μ`. BMS2 prove `(i)` through the de Rham–Witt complex; derive it from the `Lη_I` factorisation, which needs no de Rham–Witt theory.

(BMS2, Proposition 8.7; p. 57; BMS2, Remark 9.11; p. 73; BMS2, Proposition 9.10; p. 72.)

*Needs:* [§3.16](#s3-16), [§3.14](#s3-14), [§3.15](#s3-15), [PrismaticCohomology §1.14](../PrismaticCohomology/README.md#s1-14), [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84), DerivedDeRhamCohomology §3.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, AInfCohomology §§AI.1.1–AI.1.2, AI.1.7, DerivedDeRhamCohomology Layer 3.

**Proof route.** `N^iM^•` is a subcomplex and `φ_M(N^iM^n) ⊂ d′^{max(i−n,0)+n}M^n ⊂ d′^iM^n` by `(a)`, so `φ_M` is a filtered map from `N^•M^•` to the I-adic filtration of `Δ_{R/A}` refining the relative Frobenius. `gr^i N` is `⊕_{n ≤ i} (M^n/d)[−n]` with zero differential, so `N^•` is Beilinson connective; it is complete because each `M^n` is d-adically complete and d-torsion-free.

<a id="s3-25"></a>
<a id="layer-3-delta-nygaard-continuity"></a>

### 3.25 δ on the Nygaard completion

For `Δ_S` of a quasiregular semiperfectoid S over an oriented perfect prism `(A,(d)), δ` is uniformly continuous for the topology generated by `Fil^i_NΔ_S+(p,d)^jΔ_S`. It extends uniquely to the Nygaard completion as a δ-structure. It commutes with the extended Frobenius and agrees with `δ` on `Δ_S`; this is not an application of δ-adic completion with the Nygaard filtration as an adic ideal.

`Δ_S` is a δ-ring, derived `(p,d)`-complete and classically complete by bounded complete flatness. `Fil^i_N=φ^(-1)(d^iΔ_S); d` is distinguished.

(BS22, Theorem 13.1, Lemma 13.2 and the proof of Theorem 14.1, §§13–14; pp. 94–95, 97.)

*Needs:* [PrismaticCohomology §0.3](../PrismaticCohomology/README.md#s0-3), [PrismaticCohomology §0.2](../PrismaticCohomology/README.md#s0-2), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [§3.1](#s3-1), [§3.20](#s3-20), [§3.2](#s3-2), [§3.3](#s3-3), [§3.5](#s3-5), PerfectoidSpaces §P4.15.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

**Checks.** For a perfect prism with `e=φ^(-1)(d)`, the extension is the existing `δ` on its e-adically complete ring. If `S=O_C`, then `δ(e)` is a unit and `δ(e²)≡p δ(e)²` modulo e; since `A_inf(O_C)/e` is p-torsion-free, this is nonzero. Thus `δ(Fil²_N)⊂Fil¹_N` is false even for a perfect prism. In the crystalline prism `(Z_p,(p)), δ(p^i)=p^(i−1)−p^(pi−1)`; the error has exactly the permitted `K^(i−1)` order for `i≥1`. The zero ring has the unique zero operation and zero completions. These checks distinguish mixed continuity from an unsupported one-step drop in Nygaard degree.

**Proof route.** Put `K=(p,d)` and reduce by André covers, regular root quotients and Künneth to the q-divided-power key case, obtaining `δ(Fil^i_N)⊂Fil^(pi)_N+K^(i−1)`. Together with `δ(K^(j+1))⊂K^j` this gives mixed uniform continuity; the p-complete conjugate graded pieces identify the mixed and Nygaard completions, where continuity extends the polynomial identities (BS22 Lemma 13.2, pp.94–95, and proof of Theorem 14.1, pp.97–100).

<a id="s3-26"></a>
<a id="layer-3-bms2-comparison"></a>

### 3.26 The prismatic half of the comparison with BMS2 (BS22 Lemma 13.2 and Theorem 13.1)

For QRSP S over perfectoid R with prism `(A,(d)), δ(Fil_N^i)⊂Fil_N^(pi)+(d,p)^(i−1), i≥1`. Its mixed-topology extension gives `δ` on Δhat, compatible with Frobenius, the filtration, Δhat/`Fil_N¹=S` and the conjugate graded pieces. In the cyclotomic key case, for derived complete flat `D/A` with `φ` and a Frobenius-compatible `A⟨Y^(1/p^∞)⟩`-map satisfying `Y^p∈[p]_qD`, the induced map `Δ_S→D` is unique and is an iso iff it is modulo `(p,[p]_q)`. These are the prismatic recognition statements used by the later trace comparison; absolute TC is not an input here.

At `i=1` the bound is vacuous. The trace-theoretic inputs of BS22 Theorem 13.1, including BMS2 Corollary 9.12 and Theorem 8.17, belong to PrismaticCohomologyPartIII §7.0; they are not prerequisites here.

(BS22, Lemma 13.2 and its proof; p. 94; BS22, Theorem 13.1 and its proof; p. 94; BS22, Proposition 15.7; p. 105.)

*Needs:* [§3.20](#s3-20), [§3.5](#s3-5), [§3.2](#s3-2), [§3.3](#s3-3), [§3.1](#s3-1), [PrismaticCohomology §2.8](../PrismaticCohomology/README.md#s2-8), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §0.35](../PrismaticCohomology/README.md#s0-35), [PrismaticCohomology §0.3](../PrismaticCohomology/README.md#s0-3), [§3.25](#s3-25).

**Proof route.** `(1)`: choose a surjection `S′ = R⟨X_a^{1/p^∞}, Y_b^{1/p^∞}⟩/(X_a) → S` inducing a surjection on cotangent complexes, hence on `Δ` and on every `Fil^i_N` (§3.5); reduce to S′, absorb the `Y_b` into R, pass to finitely many `X_a` by filtered colimits and to one variable by the Künneth formula (PrismaticCohomology §2.8, §3.3 `(5)`), using that the claim is stable under products: for `x ∈ Fil^j_N, y ∈ Fil^k_N` the formula `δ(xy) = x^pδ(y) + y^pδ(x) + pδ(x)δ(y)` and `φ = x^p + pδ(x)` give `δ(xy) ∈ Fil^{p(j+k)}_N + (d, p)^{j+k−1}`.

### Examples

For `(Z_p,(p)), φ=id` and `Fil_N^i=p^iZ_p`. The divided Frobenius satisfies `φ_i(p^ia)=a`. In particular `φ₁(p²)=p` whereas `φ₁(p)²=1`, so `φ₁` is not multiplicative without the weight adjustment. For the perfect prism `(B,(d)), e=φ⁻¹(d)` gives `Fil_N^i=(e^i)`, not generally `(d^i)`. The relative Nygaard filtration of `R=A/I` on `φ_A^*Δ=A` is `I^i`; distinguishing it from the untwisted base-ring filtration prevents the wrong q-prism identification. The degree-zero twist is A and the negative twist is the dual; no orientation is used to manufacture a canonical generator.

**§3.2.** `n = 0: Fil^0_N = Δ_S` and the image of `φ` in `Δ̄_S` is the span of `Y^i, i < p`, which is the image of S. `n = 1`: for `i < 2` the generator `[p]_{q^{1/p}}^{1−⌊i⌋} Y^i/[⌊i⌋]_q!` of `Fil^1_N` in degree i maps under `φ/[p]_q` to a unit multiple of `Y^{ip}/[⌊ip⌋]_q!`, and for `i ≥ 2` to a multiple of `[p]_q`; the image in `Δ̄_S` is the span of the degrees `j < 2p`. Reduction modulo `q − 1` recovers a divided power algebra: `Δ_S/(q−1)` is the p-completion of `⊕_{i ∈ N[1/p]} (A/(q−1)) · Y^i/⌊i⌋!`, the p-completed divided power envelope of `(Y)` in `A/(q−1)⟨Y^{1/p^∞}⟩ (A/(q−1)` is the p-completion of `Z_p[q^{1/p^∞}]/(q−1)`, not `Z_p`). Its base change along `A → Z_p, q^{1/p^n} ↦ 1`, is the p-completion of `⊕ Z_p · Y^i/⌊i⌋!` (§3.23). Perfectoid quotient example: S is the quotient of the perfectoid ring `R⟨X^{1/p^∞}⟩` by the regular element X.

**§3.3.** For `S = R` perfectoid the filtration `(φ^{-1}(d))^i A` is good: `φ/d^i` maps `(e^i)/(e^{i+1})` isomorphically onto `A/d = R = Fil_i Δ̄_R`. For `R → F_p (q ↦ 1)` and S the key case, `(3)` gives the Nygaard filtration of `F_p[X^{1/p^∞}]/X` used in §3.23. `S(2) = R⟨X_1^{1/p^∞}, X_2^{1/p^∞}⟩/(X_1, X_2)` with R a perfectoid `Z_p[ζ_{p^∞}]^∧`-algebra: `Fil^n_N` is spanned by `[p]_{q^{1/p}}^{max(n−⌊i_1⌋−⌊i_2⌋, 0)} Y_1^{i_1}Y_2^{i_2}/([⌊i_1⌋]_q![⌊i_2⌋]_q!)`, the formula used in the proof of BS22 Lemma 14.4.

**§3.4.** For `B = R: Fil^i_N Δ_{R/A} = (φ^{-1}(d))^i A` and `gr^i` is identified with `R{i}` by `φ/d^i`, concentrated in degree 0. For `B = R⟨T^{±1}⟩` and `i ≥ 1: gr^i_N` has cohomology `B{i}` in degree 0 and `Ω^1_{B/R}{i−1}` in degree 1. For S quasiregular semiperfectoid the filtration is the one of §3.1 (§3.5). Comparison with the relative filtration: for the perfect prism (`A, I), φ_A^* Fil^•_N Δ_{S/A} = Fil^•_N φ_A^*Δ_{S/A} (`§3.14).

**§3.5.** S perfectoid with `A = A_inf(S): gr^i_N = (e^i)/(e^{i+1}) ≅ S` and `A_inf(S)/Fil^1_N ≅ S` via `θ ∘ φ`. Key case: the summands with `i < p(n+1)` (§3.2 `(e)`). Anschütz–Le Bras Theorem 3.4.4 is this statement; they use `Δ_R/N^{≥1}Δ_R ≅ R` to present the structure sheaf of the quasisyntomic site as a quotient of the prismatic sheaf.

**§3.6.** The q-de Rham prism `(Z_p[[q−1]], ([p]_q))` is transversal, with `I_r = ([p^r]_q)`. A nonzero crystalline prism `(A, (p))` is not transversal: `A/I = A/p` is killed by p. The Breuil–Kisin prism `(W(k)[[u]], (E(u)))` is transversal: the quotient `O_K` is p-torsion-free. A perfect prism `(A_inf(R), ker θ)` is transversal exactly when R is p-torsion-free.

**§3.7.** For a crystalline prism `(A, (p))`: the map `q ↦ 1` from the q-de Rham prism is a transversal approximation. For a perfect prism of a perfectoid ring with p-torsion (for example `(Z_p, (p)), R = F_p)` a transversal approximation exists although the prism is not transversal. The coproduct of the q-de Rham prism with itself is transversal; it is the prism on which the two generators `e_A` of §3.11 are compared.

**§3.8.** For the q-de Rham prism the classes of `[p^r]_q` form a compatible system, since `[p^{r+1}]_q ≡ p [p^r]_q` modulo `I_r²`, and define a generator (§3.11). Reduction: `A{1} ⊗_A A/I ≅ I/I²`, the twist of BS22 used in the Hodge–Tate comparison. Frobenius has a simple pole along `I: φ_{A{1}}` takes values in `I^{−1} ⊗ A{1}`, not in `A{1}`.

**§3.9.** `A{0} = A` and `(M{m}){n} ≅ M{m+n}`. For A/I-modules the twist agrees with `M ⊗ (I/I²)^{⊗ n}` of BS22 Theorem 1.8 `(2): H^i(Δ̄_{R/A}){i}` in the Hodge–Tate comparison is unchanged. Over the q-de Rham prism `A{1} = A · e_A` with `φ(e_A) = e_A/[p]_q`; over a crystalline prism `φ(e_A) = e_A/p` (§3.11). Consumers: PrismaticCohomologyPartIII Layer `6 (Z_p(n)` uses `Δ̂{n}`), Layer 4 (absolute prismatic cohomology with twists, the line bundle `O_WCart{1}`).

**§3.10.** `φ_0 = φ`. Perfect prism `(A, (d)), e = φ^{-1}(d): φ_i(e^i a) = φ(a)`, so `φ_i : Fil^i_N A → A` is bijective. Key case: `φ_n([p]_{q^{1/p}}^{n−⌊i⌋} Y^i/[⌊i⌋]_q!)` is a unit multiple of `Y^{ip}/[⌊ip⌋]_q!` for `i < n+1`. BMS2 Theorem 7.2 `(4)`: on `π_0 TC^-(S; Z_p)` the cyclotomic Frobenius restricted to the i-th Nygaard level is `ξ̃^i` times a divided Frobenius; under the identification of BS22 Theorem 13.1, which PrismaticCohomologyPartIII Layer 7, graded prismatic Beilinson square proves from §3.26, it is the completion of `φ_i`.

**§3.11.** Crystalline prism example: for `(Z_p, (p)), Z_p{n} = Z_p · e^n` with `φ(e^n) = p^{−n} e^n`. Under reduction modulo I the generator `e_A` maps to the class of `[p]_q` in `I/I²`. The two generators of the twist of the coproduct of the q-de Rham prism with itself differ by a unit that is not 1, which is why `e_B` depends on f.

**§3.12.** Ā itself is large (T empty). For a perfect prism, a quasiregular semiperfectoid Ā-algebra that is quasisyntomic over Ā is large; large algebras replace quasiregular semiperfectoid rings when the base prism is not perfect. `Ā⟨X⟩` is not large: dX is not divisible by p in `Ω^1`.

**§3.13.** `S = A/I: Δ^{(1)}_{S/A} = A, φ_{S/A} = id, Fil^i_N = I^i` and `gr^i = I^i/I^{i+1} = (A/I){i} = Fil_i^conj Δ̄{i}` (BL22 Example 5.1.4). `S = (A/I)⟨X^{1/p^∞}⟩/(X)` over the q-de Rham prism: the base change to the perfection is the key case of §3.2. `i = 0: gr^0_N Δ^{(1)}_{S/A} ≅ S`.

**§3.14.** `R = Ā: φ_A^*Δ = A` and `Fil^n_N = I^n`. Crystalline prism `(W(k), (p)), k` a perfect field, and R smooth over `k: φ_A^*Δ_{R/A} ≅ RΓ_crys(R/A)` (PrismaticCohomology §1.14) and `Fil^•_N` is the Nygaard filtration of crystalline cohomology; in coordinates it is `p^{max(i−•, 0)} Ω^•` (§3.24). Perfect prism: agreement with §3.4 after applying `φ_A^*`. Change of prism along the q-de Rham prism → its perfection recovers the key case.

**§3.15.** `R = Ā: gr^n = I^n/I^{n+1} = Ā{n}`. `R = Ā⟨T⟩: gr^n_N` has `H^0 = R{n}` and, for `n ≥ 1, H^1 = Ω̂^1_{R/Ā}{n−1}`. R large quasisyntomic: `gr^n_N` is the discrete module `Fil_n^conj Δ̄_{R/A}{n}`. Comparison with the Hodge–Tate side: the associated graded of the Nygaard filtration is the conjugate (Hodge–Tate) filtration, twisted; comparison with the de Rham side is §3.19.

**§3.16.** `R = A/I: φ_A^*Δ = A = Lη_I A` and `φ̃` is the identity. Crystalline prism `(W(k), (p))`: the statement is the Berthelot–Ogus isomorphism `φ : RΓ_crys ≅ Lη_p RΓ_crys`, with the Nygaard filtration on the source and the décalage filtration on the target (BMS2 Proposition 8.5 and its corollary). Cohomology: `H^i(φ_A^*Δ_{R/A}) ≅ (H^i(Δ_{R/A})/H^i(Δ_{R/A})[I]) ⊗ I^{⊗ i}` (AInfCohomology §§AI.1.1–AI.1.2). Consumers: §3.17, §3.18, Layer `5 (AΩ ≃ φ_A^*Δ` carries the décalage filtration to the Nygaard filtration), PrismaticCohomologyPartIV Layer 8.

**§3.17.** Crystalline prism: reduces modulo p the crystalline comparison `φ_A^*Δ_{R/A} ≅ RΓ_crys(R/A)`. The q-de Rham prism: `Δ_{R/A} ⊗`̂_`{A, φ} A/([p]_q)` is de Rham cohomology over `Z_p[ζ_p]`; here `A/I = Z_p[ζ_p]` is p-torsion-free, so PrismaticCohomology §1.22 also applies. A prism where Theorem 6.4 does not apply: a crystalline prism `(A, (p))` with `A/p` non-reduced has p-torsion in `W(A/p)`; the present target still applies. `R = A/I`: both sides are `A/I`.

**§3.18.** `i = 0: V_0 φ = φ V_0 = 1` on `τ^{≤0}`, so `φ : H^0(Δ^{(1)}_{X/A}) → H^0(Δ_{X/A})` is an isomorphism. Crystalline prism: `V_i` is the classical operator with `V_i φ = φ V_i = p^i` on `H^i_crys` (Berthelot–Ogus). `X = P^1` and `i = 2: φ` on `H^2_Δ(P^1/A) = A{−1}` is divisible by exactly I, consistent with `φ_{A{−1}} : A{−1} → I ⊗ A{−1}`. Consumer: finiteness and isogeny statements for prismatic cohomology (BS22 Theorem 1.8 `(6)`); PrismaticCohomologyPartIII Layer 7 uses the isogeny property of Frobenius on prismatic F-crystals of geometric origin.

**§3.19.** `R = Ā`: the sequence is `I ⊗ I^{n−1} → I^n → 0` for `n ≥ 1` and `I ⊗ A → A → Ā` for `n = 0`. Crystalline prism `(Z_p, (p))` and R regular Noetherian over `F_p`: the sequence is `p · N^{n−1}WΩ → N^nWΩ → Ω^{≥ n}`, the defining property of Nygaard's filtration on the de Rham–Witt complex. R p-completely smooth of dimension d: the Nygaard filtration is I-adic from degree d on.

**§3.20.** S perfectoid: `Δ̂_S = A_inf(S)` (§3.21 `(2)`). `S = F_p[X^{1/p^∞}]/(X): Δ̂_S` is strictly larger than `Δ_S` (§3.23). `φ̂ ∘ c = φ` and the Frobenius of `Δ̂_S` has image in the image of `Δ_S`. Export: `Δ̂_S` with its filtration, Frobenius and divided Frobenius is the object that PrismaticCohomologyPartIII Layer 7, graded prismatic Beilinson square compares with `π_0 TC^-(S; Z_p)`, and the object from which PrismaticCohomologyPartIII Layer 6 builds `Z_p(n)`.

**§3.21.** `(Z_p, (p)), S = F_p: Δ = Z_p, Fil^i = (p^i)`, complete. `R = A/I⟨T⟩`: complete, with `Fil^n_N = I^{n−1} ⊗ Fil^1_N` for `n ≥ 1`. `S = F_p[X^{1/p^∞}]/(X): dR^∧_{S/F_p}` is the divided power algebra with its divided power filtration, which is not complete; correspondingly `Δ_S ≠ Δ̂_S`. The statement of BS22 Theorem 13.1 involves `Δ̂_S` and not `Δ_S` for exactly this reason.

**§3.22.** `R = A/I (d = 0): Fil^m_N = I^m` and `I^{−m} ⊗ I^m = A = Δ` for all m. Perfect prism and S perfectoid: `e^{−m}(e^m) = A_inf(S)`. After inverting I the relative Frobenius `φ_A^*Δ_{R/A}[1/I] → Δ_{R/A}[1/I]` is an isomorphism for smooth R, in agreement with §3.18.

**§3.23.** a case where `Δ` and its Nygaard completion visibly differ. `Δ_{S_0}/Fil^1_N = ⊕_{i<1} F_p Y^i ≅ S_0`. `gr^n_N Δ_{S_0}` is the `F_p-span` of the classes of `p^{n−⌊i⌋} Y^i/⌊i⌋!` for `⌊i⌋ ≤ n,` a free `S_0`-module of rank `n + 1`, matching `Fil_n^conj` of the divided power algebra. The partial sums `Σ_{m<n} Y^m/m!` are a Cauchy sequence for the Nygaard topology with no limit in `Δ_{S_0}`.

**§3.24.** `R = k[T], Ã = W(k)⟨T⟩, φ̃(T) = T^p: Fil^i_N` is `p^iW(k)⟨T⟩ → p^{i−1}W(k)⟨T⟩dT` for `i ≥ 1`; modulo `p · Fil^{i−1}_N` this is `Ω^{≥ i}`, as in §3.19. `i = 1: Fil^1_N = (pÃ → Ω^1 →` ⋯), the kernel of `Ω^•_{Ã} → R`. Instance `(ii)` uses the q-de Rham input of Layer 5. The filtration depends on the Frobenius lift only up to filtered quasi-isomorphism.

**§3.26.** S perfectoid: `Δ̂_S = A_inf(S)` with its δ-structure`; (1)` reads `δ(e^i A) ⊂ e^{pi}A + (d, p)^{i−1}A`. Key case: `δ(Y^i/[i]_q!)` is homogeneous of degree pi. `(4)` with `D = Δ_S` gives the identity; with D the non-completed ring of BMS2 it gives the comparison map of the proof of Theorem 13.1. Consumer: PrismaticCohomologyPartIII Layer 7, graded prismatic Beilinson square (Theorem 13.1, Proposition 15.7, and through them the identification of the BMS2 syntomic complexes with those of PrismaticCohomologyPartIII Layer 6).

### Dependencies

Layers 0, 1, 2; AInfCohomology Layer AI.1, AInfCohomology §AI.1.4, AInfCohomology §AI.1.4, AInfCohomology §§AI.1.1–AI.1.2, AInfCohomology §AI.1.2, AInfCohomology §AI.1.2, AInfCohomology §§AI.1.1–AI.1.2, AI.1.7, DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedModuleAlgebra §§0.4–0.17, 0.25; DerivedDeRhamCohomology §1.23, §§5.1–5.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, DerivedDeRhamCohomology Layer 2, DerivedDeRhamCohomology §2.12, DerivedDeRhamCohomology Layer 3, DerivedDeRhamCohomology §3.4, DerivedDeRhamCohomology §§5.1–5.7, EnhancedDerivedSheaves Layer E3, EnhancedDerivedSheaves Layer E5:animation, PerfectoidSpaces §P4.15.4. Exact inputs are given in the supplier contracts; internal construction dependencies are linked above.

## Layer 4: Absolute prismatic cohomology and Cartier–Witt geometry

The absolute site and Cartier–Witt stack encode compatible relative complexes over all bounded prisms. The Hodge–Tate divisor, its Sen operator and the absolute Nygaard filtration carry the same twists as the relative comparisons.

<a id="s4-0"></a>
<a id="layer-4-formal-qcoh-foundations"></a>

### 4.0 Quasi-coherent complexes, descent and formal completion

For a space-valued prestack X on rings, define `QCohPrestack(X)=lim_(R,x∈X(R))D(R)` in symmetric monoidal ∞-categories, with transitions `S⊗^L_R`− and all path coherences. Its unit evaluates to R and equivalences are detected pointwise. It is stable with small colimits; presentability is in a larger universe when X is in the small-colimit closure of affine representables and their fpqc sheafifications, as for the stacks below. `QCohPrestack.Perf(X)` is the pointwise-perfect, equivalently dualizable, subcategory; invertibility is pointwise. (SAG Definition 6.2.2.1, Remarks 6.2.2.5–6.2.2.7, pp.490–491; Proposition 6.2.3.4, pp.492–493; HA Propositions 4.6.1.11, 7.2.4.4, pp.620,1263.)

API: `QCohPrestack.eval`, `ofPoints`, `pullback` (precomposition, preserving colimits and tensor), `specEquiv` `(D(Spec R)≃D(R))`, `limitOfColimit`, `isEquiv_iff_eval`, `unit_eval`, `isDualizable_iff_perfect`, `isInvertible_iff`, `homotopyCategory_spec`, with coherent identity, composition and evaluation base-change laws. The pointwise limit precedes passage to homotopy categories.

**Checks.**

- `D(∅)` is the zero stable category`; D(Spec Z)=D(Z)`. Replacing the pointwise limit by a direct sum fails the empty case.
- For `Spec R, Hom(O,O[i])` is R for `i=0` and zero otherwise. The affine point formula recovers the actual derived category.
- For `B(Z/2)` over `F₂, H¹(B(Z/2),O)=F₂`. Pullback to the trivializing affine point forgets that class, so an atlas value alone cannot specify a complex or a map.
- `Z⊕Z[3]` is perfect and dualizable in `D(Z); Q` is not dualizable. Restricting perfection to vector bundles, or declaring every flat module perfect, gives wrong answers.
- The unit is invertible`; O⊕O` over a nonzero field is not. A shift `O[1]` is invertible although it is not a line bundle in degree zero.

`QCohPrestack.flatDescent` is `D(R)≃Tot D(S^⊗_R(•+1))` for faithfully flat `R→S`. `sheafificationEquiv` identifies D across fpqc sheafification equivalences, and `cechDescent` computes it on every fpqc effective epimorphism. On affines the heart is ordinary module descent. (SAG Proposition 6.2.3.1 and Remarks 6.2.3.2–6.2.3.3, p.492.)

**Checks.**

- For `R→R` the augmented totalization is `D(R)`, with the identity comparison.
- For a faithfully flat finite product of localizations covering Spec R, the degree-zero descent objects are precisely the usual glued modules, and a two-term complex retains its differential.
- `Z→F_p` is not a descent cover: Q is a nonzero Z-complex whose derived pullback vanishes. Surjectivity of a ring map is not a replacement for faithful flatness.
- The groupoid nerve of `B(Z/2)` retains the preceding H¹ class; taking invariants of the atlas module without derived totalization loses it.

For representable flat affine `f:Y→X`, define `QCohPrestack.affinePushforward` by pointwise restriction of scalars. It is right adjoint to `f*`, preserves colimits, has `affineBaseChange` for ordinary cartesian squares and `affineProjectionFormula`, `f_*(f*M⊗N)≃M⊗f_*N`. Flatness identifies the ordinary affine fibre product with the derived one; dropping flatness requires derived prestacks and derived squares instead. (SAG Proposition 6.3.4.1 and Corollary 6.3.4.3, pp.505–507.)

**Checks.**

- For `f=id`, pushforward, its adjunction and projection formula are the identity.
- For `R→R[t]`, restriction of the rank-one B-module gives the actual underlying R-module `R[t]`; base change to any R′ gives `R′[t]`. It is not the rank-one R-module.
- In the ordinary square obtained by base-changing `Z→F_p` along `Z→F_p`, the fibre product ring is `F_p`, while `F_p⊗^L_Z F_p` has nonzero `H⁻¹` and `H⁰`, both `F_p`. Thus unrestricted ordinary nonflat base change is false.
- For `N=B` and `M=R[1]`, the projection formula gives `B[1]` on both sides, fixing the use of derived tensor and the shift.

For bounded prisms define `FormalQCoh(Spf A)=D_(p,I)-comp(A)` and identify it with the pointwise `D(Spf A)`. For an adic map `A→B` preserving the radical of the finitely generated defining ideal, `FormalQCoh.completedPullback(M)=LΛ(B⊗^L_A M)` is left adjoint to restriction on complete modules. It has completed projection formula, derived-cartesian completed base change and completely faithfully flat completed Čech descent. Ordinary formal base change additionally requires that the ordinary completed tensor ring equal the derived one, as for completely flat adic maps. These statements do not extend the pointwise identification to arbitrary unbounded formal rings. (BL22 Remark 3.3.2, Proposition 3.3.5, p.43; Warning 3.3.6, p.44; Corollary 3.2.10, p.42.)

`FormalQCoh.classifyingStackComodules` totalizes the affine nerve of a supplied flat affine group G over an adic base, using completed tensor products, to obtain homotopy-coherent comodules; `FormalQCoh.quotientDescent` does the same for its action on a supplied formal affine scheme. Global sections are right adjoint to the unit tensor functor and computed by the supplied completed Čech nerve. (SAG Proposition 6.2.3.1, p.492; BL22 Remark 3.3.2 and Lemma 3.3.10, pp.43–44.)

**Checks.**

- For the identity of Spf A, completed pullback and its right adjoint are the identity; the unit is A.
- A completely faithfully flat prism map `A→B` recovers any complete module from its augmented completed module Čech nerve. Its value at the unit is A, not an uncompleted Amitsur complex.
- For the trivial formal group, `D(BG)=D(Z_p)_comp`. For the flat constant group `Z/2` over `Z₂`, reduction of its unit cochains modulo 2 retains `H¹(B(Z/2),O)=F₂`; ordinary invariants would lose this class.
- For `A=Z_p` and `B=F_p`, the completed ordinary self-intersection still omits `H⁻¹(F_p⊗^L_(Z_p)F_p)=F_p`. Completion does not repair a non-derived cartesian square.

**Proof route.** Establish affine enhanced faithfully flat descent using module descent and convergent truncation towers, then take the monoidal pointwise limits (SAG Proposition 6.2.3.1, p.492). Tensor associativity and completion prove the affine formulas; completed faithfully flat descent gives the formal Čech descriptions. Duality gives the projection formula for dualizable coefficients.

*Needs:* EnhancedDerivedSheaves §§E0.4, E2.6–E2.7, E5:abstract.2–E5:abstract.4; DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1; SchemeAndStackFoundations §§1.1, 1.18, 1.21; AlgebraicVectorBundles Layers 0A–0B for ordinary module/sheaf conventions.

<a id="s4-1"></a>
<a id="layer-4-absolute-prismatic-site"></a>

### 4.1 The absolute prismatic site of a p-adic formal scheme

For p-adic formal X, define `X_Δ` as the opposite category of bounded prisms with `u:Spf(A/I)→X` and prism maps commuting over X. Finite families cover when `A→∏A_s` is `(p,I)`-completely faithfully flat. The sheaves `O_Δ=A, I_Δ=I, Ō_Δ=A/I` and `I^m{n}, m,n∈Z`, take values in the p-complete derived category; their limits define `RΓ_Δ`^site,[m](X)`{n}`. For `X/A/I`, the relative site adds a map from `(A,I)`; forgetting it preserves covers and these sheaves, and is an equivalence when `(A,I)` is perfect.

Site cohomology below assumes X bounded. All site prisms are bounded; an initial object among all prisms for a semiperfectoid ring is not automatically an object of this site.

(BS23-FCRYS, Definition 2.3; p. 5; BL22, Definition 4.4.27 and Remark 4.4.28; pp. 94, 95; BS22, Remark 4.7 and the lemma inside it; p. 38.)

*Needs:* [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72), [PrismaticCohomology §0.73](../PrismaticCohomology/README.md#s0-73), [PrismaticCohomology §0.79](../PrismaticCohomology/README.md#s0-79), [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84), [PrismaticCohomology §1.1](../PrismaticCohomology/README.md#s1-1), [PrismaticCohomology §1.2](../PrismaticCohomology/README.md#s1-2), [§3.9](#s3-9), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, EnhancedDerivedSheaves §§E2.1–E2.3, [PrismaticCohomology §1.25](../PrismaticCohomology/README.md#s1-25).

- `Prismatic.Absolute.SiteObj`: Bounded prism triples with `R→A/I`.
- `Prismatic.Absolute.SiteObj.Hom`: Prism maps commuting over R.
- `Prismatic.Absolute.SiteObj.ofPrism`: `(A,I,id)`.
- `Prismatic.Absolute.SiteObj.idealSheaf`: Value I of `I_Δ`, with quotient `Ō_Δ`.
- `Prismatic.Absolute.RelativeObj`: An absolute object plus a compatible map from `(A,I)`.
- `Prismatic.Absolute.SiteObj.existsUnique_hom_of_perfect`: For perfect bases the map from `(A,I,id)` is unique, giving relative=absolute.
- `Prismatic.Absolute.SiteObj.category`: The category of triples and its opposite site, with inherited identities and composition.
- `Prismatic.Absolute.SiteObj.map`: Compose with `Y→X`; preserve finite covers and structure sheaves, with identity/composition laws.

**Checks.**

- `pr5_site_perfect_initial`: For a perfect prism `(A,I)`, the triple `(A,I,id)` is initial in the category of triples of `Spf(A/I)`, hence final in its opposite prismatic site: every site object has exactly one arrow to it.
- `pr5_site_char_p_crystalline`: If R has characteristic p then every object `(A, I, u)` of `(Spf R)_Δ` has `I = (p)`.
- `pr5_site_structure_map_matters`: A prism endomorphism of `(A, I)` that does not induce the identity on `A/I` is not a morphism of the object `(A, I, id)` of `(Spf A/I)_Δ`: the site is not the category of all bounded prisms.

**Proof route.** Category: triples `(A, I, u)` with the maps of prisms of PrismaticCohomology §0.73 compatible with the structure maps; composition and identities are those of prisms (Bhatt–Scholze F-crystals, Definition 2.3; Bhatt–Lurie, Definition 4.4.27).

<a id="s4-3"></a>
<a id="layer-4-cartier-witt-divisor"></a>

### 4.3 Cartier–Witt divisors

For p-nilpotent `R, WCart(R)` is the full subgroupoid of Cart`(W(R))` with `(a)` nilpotent image under `I→W(R)→R` and `(b) δ(α(I))` generating `W(R)`. Equivalently `α(y)₀` are nilpotent and `α(y)₁` generate R, since `δ(x)₀=x₁` and Witt vectors with unit zeroth coordinate are units. Principal objects are multiplication by f with `f₀` nilpotent and `f₁ a unit`, equivalently `f=ΣV^n[a_n]` with these conditions on `a₀,a₁`. Set `WCart(R)=∅` otherwise. An invertible ideal inclusion `I⊂W(R)` satisfies these conditions iff `(W(R),I)` is a prism and p,I have nilpotent images in R.

Use the natural Witt δ-structure, not reconstruction from F in the presence of p-torsion. Finite generation of I makes the elementwise nilpotence criterion equivalent to nilpotent image.

(BL22, Definition 3.1.4 and Remark 3.1.5; p. 39; BL22, Construction 3.2.1 and Remark 3.2.2; p. 40.)

*Needs:* [§4.2](#s4-2), [PrismaticCohomology §0.56](../PrismaticCohomology/README.md#s0-56), [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72), [PrismaticCohomology §0.61](../PrismaticCohomology/README.md#s0-61), [PrismaticCohomology §0.63](../PrismaticCohomology/README.md#s0-63), Mathlib `WittVector`, Mathlib `WittVector.constantCoeff`, Mathlib `WittVector.frobenius`, Mathlib `WittVector.verschiebung`, Mathlib `WittVector.teichmuller`.

- `Prismatic.WCart.IsCartierWitt`: p nilpotent, `α(y)₀` nilpotent and `α(y)₁` generating R.
- `Prismatic.WCart.CartierWittDivisor`: The full subgroupoid satisfying that predicate.
- `Prismatic.WCart.IsDistinguishedWitt`: `f₀` nilpotent and `f₁ a unit`.
- `Prismatic.WCart.CartierWittDivisor.ofWitt`: `(W(R),f·)` for distinguished f and p-nilpotent R.
- `Prismatic.WCart.isCartierWitt_ofElement_iff`: The principal-object criterion.
- `Prismatic.WCart.coeff_zero_delta`: `δ(x)₀=x₁`.
- `Prismatic.WCart.CartierWittDivisor.zariski_principal`: Zariski-local principalization: lift reduced generators using the Jacobson radical and projective Nakayama; only finite-truncation Witt kernels are asserted nilpotent.

**Checks.**

- `pr5_cw_p_distinguished`: `p ∈ W(Z/p^{n+1})` lies in `WCart_0`: its coordinates begin `(p, 1 − p^{p−1})`.
- `pr5_cw_verschiebung_one`: `V(1) ∈ W(R)` lies in `WCart_0(R)`: its coordinates are `(0, 1, 0, …)`.
- `pr5_cw_one_not_distinguished`: Over a nonzero ring, `1 ∈ W(R)` is not distinguished: condition `(a)` fails.
- `pr5_cw_teichmuller_not_distinguished`: Over a nonzero ring, no Teichmüller element `[a]` is distinguished: condition `(b)` fails.
- `pr5_cw_empty_of_p_not_nilpotent`: If p is not nilpotent in R then R has no Cartier–Witt divisor.

**Proof route.** Definition: Bhatt–Lurie, Definition 3.1.4, on the generalized Cartier divisors of the previous target and the Witt vectors of Mathlib (WittVector, with constantCoeff for restriction).

<a id="s4-4"></a>
<a id="layer-4-cartier-witt-stack"></a>

### 4.4 The Cartier–Witt stack WCart

Witt base change gives a coherent groupoid-valued functor WCart on rings, supported on `Spf Z_p`, and an fpqc stack: `WCart(R)≃`Desc`(WCart(S^⊗_R(•+1)))` for faithfully flat `R→S`. Restriction `W(R)→R` gives `μ:WCart→`Cart`=[A¹/G_m]`, factoring through `[Â¹/G_m]`; its image ideal is nil, hence is never Cartier for `R≠0`. Nontrivial automorphisms prevent WCart from being a formal scheme.

The variance is `R→S` giving `WCart(R)→WCart(S)`, correcting BL22 Remark 3.1.7. Do not use flatness of `W(R)→W(S)`, which can fail even for flat `R→S`.

(BL22, Remarks 3.1.6–3.1.7; pp.39–40; BL22, Remarks 3.1.6–3.1.7; pp.39–40.)

*Needs:* [§4.3](#s4-3), [§4.2](#s4-2), Mathlib `WittVector.map`, Mathlib `WittVector.constantCoeff`, SchemeAndStackFoundations §§1.1, 1.18–1.22, [§4.0](#s4-0), SchemeAndStackFoundations §§1.15, 1.18, 1.21, Mathlib `comonadicExtendScalars`, Mathlib `CategoryTheory.Pseudofunctor.IsStack`, Mathlib `CategoryTheory.Pseudofunctor.DescentData`.

- `Prismatic.WCart.CartierWittDivisor.groupoid`: Isomorphisms of generalized divisors.
- `Prismatic.WCart.pullback`: `W(f)`-base change.
- `Prismatic.WCart.pullbackComp`: `g*f*≃(gf)*`.
- `Prismatic.WCart.toCart`: Restriction along `W(R)→R`.
- `Prismatic.WCart.toCart_not_isCartier`: `μ` is not Cartier on nonzero R.
- `Prismatic.WCart.pullback_faithful`: Faithfulness for faithfully flat f.

**Checks.**

- `pr5_wcart_hom_principal`: Morphisms `(W(R), f·) → (W(R), g·)` in `WCart(R)` correspond to the units u of `W(R)` with `g = u f`.
- `pr5_wcart_zero_ring`: Over the zero ring any two Cartier–Witt divisors are uniquely isomorphic.
- `pr5_wcart_pullback_principal`: `f^*(W(R), x·) ≅ (W(S), W(f)(x)·)` for a distinguished Witt vector x.
- `pr5_wcart_nontrivial_automorphism`: Over the dual numbers `F_p[ε]/(ε²)` the divisor `(W, V(1)·)` has an automorphism different from the identity: WCart is not a functor to sets.

**Proof route.** Pullback: `W(f)` is a δ-map with `W(f)(x)_i = f(x_i)` (Mathlib WittVector.map), so conditions `(a)` and `(b)` in coordinate form are preserved; the pseudofunctor structure is that of Cart applied to W (the preceding targets).

<a id="s4-5"></a>
<a id="layer-4-wcart-quotient-presentation"></a>

### 4.5 Presentation of WCart as the quotient [WCart_0 / W^×]

Distinguished Witt vectors `WCart₀` are represented by `Spf A⁰, A⁰=Z[a₀,a₁^±1,a₂,…]^∧_(p,a₀)`. Multiplication by `W×` gives `WCart=[WCart₀/W×]`, both as Zariski and fpqc quotient: every divisor is locally principal and arrows between f,g are the units u with `g=uf`. Thus `WCart₀×_WCart WCart₀≃WCart₀×W×`, and the atlas has `(n+1)`-fold fibre power `Spf A⁰×(W×)^n`.

`W×` is flat affine, possibly infinite type. Quotient stacks are SchemeAndStackFoundations §1.21’s construction; the fpqc quotient uses §4.4. Apply §4.0’s `FormalQCoh.classifyingStackComodules` and `FormalQCoh.quotientDescent` to this group and its action on `WCart₀`.

(BL22, Proposition 3.2.3 with its proof, and Construction 3.2.1; pp. 40, 41.)

*Needs:* [§4.4](#s4-4), [§4.3](#s4-3), [§4.0](#s4-0), SchemeAndStackFoundations §§1.1, 1.18–1.22, SchemeAndStackFoundations §§1.15, 1.18, 1.21.

**Proof route.** By the description of morphisms between principalized divisors (Cartier–Witt divisors), the map `WCart_0 → WCart` is `W^×`-equivariant and induces a fully faithful map from the prestack quotient; it remains to show Zariski-local essential surjectivity (Bhatt–Lurie, Proposition 3.2.3 and Remark 3.2.2).

<a id="s4-6"></a>
<a id="layer-4-transversal-prism-coproducts"></a>

### 4.6 Transversal prisms and coproducts of prisms

For the prism charts used in Cartier–Witt geometry, import the algebraic transversal approximations, coproducts and residue-field lifts of §3.7, with their canonical prism-map cocones and base-change maps.

Only transversal×bounded coproducts are used. General prism coproducts would require animation. Flatness is tested by p-complete flatness modulo the prism ideals.

(BL22, Definition 2.1.3 with Remark 2.1.4; p. 19; BL22, Propositions 2.4.1, 2.4.5 and 2.4.9, Corollaries 2.4.7, 2.4.8 and 2.4.10; pp. 25, 27.)

*Needs:* [§3.7](#s3-7), [§3.6](#s3-6), [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72), [PrismaticCohomology §0.73](../PrismaticCohomology/README.md#s0-73), [PrismaticCohomology §0.86](../PrismaticCohomology/README.md#s0-86), [PrismaticCohomology §0.79](../PrismaticCohomology/README.md#s0-79), [PrismaticCohomology §0.55](../PrismaticCohomology/README.md#s0-55), [PrismaticCohomology §0.74](../PrismaticCohomology/README.md#s0-74), [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, [PrismaticCohomology §0.56](../PrismaticCohomology/README.md#s0-56).

**Proof route.** Use the δ-ring and transversal-coproduct results owned by §3.7, with their algebraic universal properties.

<a id="s4-7"></a>
<a id="layer-4-prism-point-of-wcart"></a>

### 4.7 The point ρ_A : Spf(A) → WCart of a prism

A ring map `f:A→R` from a prism lifts uniquely to a δ-map `A→W(R)`. Its pullback of I is a generalized Cartier divisor, Cartier–Witt iff `f(I+(p))` is nilpotent. This defines functorial `ρ_A:Spf_(p,I)A→WCart` with `μρ_A` the pullback of `I⊂A`. For crystalline prisms it is the point `(W(R),p·)`, denoted `ρ_dR` for `A=Z_p`. The atlas `A⁰` of §4.5 has the Witt-Frobenius δ-structure and `I⁰=(a₀)`, is transversal, and maps `(A⁰,I⁰)→(B,J)` classify generators of J by `a₀↦d; ρ_(A⁰)` is the atlas.

`(A, I)` is any prism; boundedness is needed only where `D(Spf A)` is identified with complete complexes. The δ-lift f̃ exists because W is right adjoint to the forgetful functor from δ-rings (§0.56). The condition for a Cartier–Witt divisor is that f is continuous for the `(p, I)`-adic topology on A and the discrete topology on R.

(BL22, Construction 3.2.4, Examples 3.2.5 and 3.2.6, Remark 3.2.7; p. 41.)

*Needs:* [§4.4](#s4-4), [§4.3](#s4-3), [Presentation of WCart as the quotient `[WCart_0 / W^×]`](#layer-4-wcart-quotient-presentation), [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72), [PrismaticCohomology §0.56](../PrismaticCohomology/README.md#s0-56), [PrismaticCohomology §0.79](../PrismaticCohomology/README.md#s0-79), [PrismaticCohomology §0.74](../PrismaticCohomology/README.md#s0-74), [PrismaticCohomology §0.61](../PrismaticCohomology/README.md#s0-61), [§4.0](#s4-0), [PrismaticCohomology §0.78](../PrismaticCohomology/README.md#s0-78), SchemeAndStackFoundations §§1.15, 1.18, 1.21.

- `Prismatic.WCart.prismPoint`: Witt pullback of I along f with `f(I+(p))` nilpotent.
- `Prismatic.WCart.prismPoint_comp`: Ring-base-change naturality.
- `Prismatic.WCart.prismPoint_map`: Prism-map naturality.
- `Prismatic.WCart.exists_universalOrientedPrism`: The universal oriented prism classifying generators of J.

**Checks.**

- `pr5_point_crystalline_is_p`: For a crystalline prism the point `ρ_A(f)` is isomorphic to the principalized divisor `(W(R), p·)`.
- `pr5_point_orientable_principal`: If I is principal then `ρ_A(f)` is isomorphic to a principalized divisor.
- `pr5_point_to_cart`: `μ(ρ_A(f))` is isomorphic in Cart`(R)` to the pullback along f of the Cartier divisor `(I ⊂ A)`.

**Proof route.** `Δ`-lift: the adjunction δ-rings ⇄ rings with right adjoint W gives f̃ with `f̃(a)_0 = f(a)` (PrismaticCohomology §0.56). Conditions `(a)` and `(b)`: the image of `f̃^*(I)` in R is `f(I)R`; and `p ∈ I + φ(I)A` (PrismaticCohomology §0.72) with δ-compatibility of f̃ shows that `δ(f̃(I))` generates the unit ideal of `W(R)` once `f(I)` and `f(p)` are nilpotent (Bhatt–Lurie, Construction 3.2.4).

<a id="s4-8"></a>
<a id="layer-4-wcart-fibre-products-of-prisms"></a>

### 4.8 Fibre products of prisms over WCart and flatness of ρ_A

For bounded A and transversal B, their prism coproduct C represents `Spf A×_WCart Spf B`. Every prism point `ρ_B` is affine; for bounded B it is flat iff B is transversal, and faithfully flat if also `B≠0`. The `(n+1)`-fold atlas fibre powers are therefore `Spf A^n`, where `A^n` is the coproduct of `n+1` universal oriented prisms; this is its cosimplicial Čech nerve.

Apply `Prismatic.WCart.prismPoint` and its prism-map naturality from §4.7 to the algebraic cocones of §4.6. The pulled-back Cartier–Witt divisors agree canonically on `Spf C`, compatibly with base change and iterated cocones. This makes the coproduct chart a common refinement of the two prism charts over WCart.

`(1): (A, I)` bounded and `(B, J)` transversal; the roles are not symmetric in the source and the coproduct exists by Transversal prisms and coproducts of prisms. `(3): (B, J)` bounded. Corrected misprints of the proof: the fibre product computed there is `Spf(A^0) ×_{WCart} Spf(B) ≅ Spf(B) × W^×`, and the bijection is with the invertible elements of the test prism.

(BL22, Proposition 3.2.8 and Corollary 3.2.9; pp. 41, 42; BL22, Corollary 3.2.10; p. 42; BL22, Notation 3.3.9; p. 44.)

*Needs:* [§4.7](#s4-7), [Presentation of WCart as the quotient `[WCart_0 / W^×]`](#layer-4-wcart-quotient-presentation), [§4.6](#s4-6), [PrismaticCohomology §0.55](../PrismaticCohomology/README.md#s0-55), [§4.0](#s4-0), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, SchemeAndStackFoundations §§1.15, 1.18, 1.21.

**Proof route.** First apply §4.7's functorial divisor construction to the prism maps and verify the cocone identifications on the underlying Witt modules. Reduce `(1)` Zariski-locally to `I = (d_A), J = (d_B)`; factor through the universal oriented prism `(A^0, I^0) → (A, I), a_0 ↦ d_A`; the left square `Spf(C) = Spf(A) ×_{Spf(A^0)} Spf(C^0)` is a pullback because `(B, J) → (C^0, K^0)` is flat (Transversal prisms and coproducts of prisms).

**Checks.**

- For the identity prism map the divisor identification is the identity; for two composable prism maps it is the composite of their identifications.
- On the coproduct of three universal oriented prisms, the two iterated cocones give the same divisor identification and the Čech face maps satisfy their identities.
- For a transversal chart `(B,J)` with a chosen generator of J, pullback along the universal oriented atlas gives `Spf(B) × W^×`: a Witt unit records the change of generator, including its Cartier–Witt divisor identification.

<a id="s4-9"></a>
<a id="layer-4-quasi-coherent-complexes-on-wcart"></a>

### 4.9 Quasi-coherent and perfect complexes on WCart

Apply §4.0 to obtain `D(WCart)`, its dualizable subcategory Perf, unit O, invertible Hodge–Tate ideal `I(R,α)=R⊗_(W(R))I` and integer powers `I^m`. For bounded `A, ρ_A*` is symmetric monoidal into `D̂_(p,I)(A)`, sends O,I to A,I, and has right adjoint `ρ_(A*)`. For transversal A, affine flat pushforward has ordinary base change and projection formula; for general bounded A, construct flat base change and the dualizable projection formula below, and other ordinary squares require Tor-independence. `RΓ` is right adjoint to `M↦M⊗O` from `D(Z)`, with p-complete values.

Take the enhanced pointwise limit before the homotopy category. The formal identification requires bounded prisms; every WCart test ring has p nilpotent.

`FormalQCoh.prismPushforward_flatBaseChange` gives flat base change for `ρ_(B*)` for arbitrary bounded B, pulled back along a representable flat morphism, in particular a transversal atlas `ρ_A`: it is the right adjoint for the affine formal fibre product. For dualizable `E, ρ_(B*)(ρ_B*E⊗M)≃E⊗ρ_(B*)M`. These give the nontransversal pushforward properties used in §4.19; each `I^m` is dualizable. (BL22 Proposition 4.4.8, pp.91–92.)

(BL22, Definition 3.3.1, Examples 3.3.3 and 3.3.4; p. 43; BL22, Corollary 3.3.11; p. 44.)

*Needs:* [§4.4](#s4-4), [§4.7](#s4-7), [§4.8](#s4-8), [§4.0](#s4-0), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, EnhancedDerivedSheaves §E5:abstract.4, EnhancedDerivedSheaves §§E0.1, E0.4, SchemeAndStackFoundations §§1.15, 1.18, 1.21.

- `Prismatic.WCart.Carriers`: The displayed categories, functors and twists, with HT and F constructed below.
- `Prismatic.WCart.carriers`: Their carrier package.
- `Prismatic.WCart.Carriers.prismPullback`: `ρ_A*:D(WCart)→D̂_(p,I)(A)`.
- `Prismatic.WCart.Carriers.globalSections`: `RΓ`, right adjoint to unit tensor.
- `Prismatic.WCart.Carriers.idealPow`: Integer ideal powers `I^m, I⁰=O`.
- `Prismatic.WCart.prismPullback_unit`: `ρ_A*O=A`.
- `Prismatic.WCart.prismPullback_ideal`: `ρ_A*I=I[0]`.

**Checks.**

- `pr5_qcoh_pullback_unit`: `ρ_A^*` of the unit object is A in degree 0.
- `pr5_qcoh_ideal_pow_zero`: `I^0` is isomorphic to the unit object `O_WCart`.
- `pr5_qcoh_ideal_not_trivial`: The Hodge–Tate ideal sheaf I is not isomorphic to `O_WCart`.
- For identity flat base change on WCart, the comparison for `ρ_(B*)` is the identity.
- Pullback along a transversal atlas computes `ρ_(B*)` by restriction of scalars on the completed formal fibre product, compatibly on its double and triple overlaps.
- For `E=I^m`, including negative m, the dualizable projection formula retains exactly that ideal power; at `m=0` it is the unit formula.

**Proof route.** Definition as a limit: Bhatt–Lurie, Definition 3.3.1, an instance of the functor `X ↦ D(X)` on stacks of [§4.0](#s4-0), with the stable ∞-categories and limits of EnhancedDerivedSheaves §§E0.4, E5:abstract.4. For the specialized pushforward, apply §4.0’s completed affine base change on the atlas fibre products of §4.8, then descend the adjunctions along the atlas Čech nerve. This gives flat Beck–Chevalley for bounded B without requiring B transversal; duality gives the projection formula (BL22 proof of Proposition 4.4.8, pp.91–92).

<a id="s4-10"></a>
<a id="layer-4-prismatic-crystals-on-wcart"></a>

### 4.10 Quasi-coherent complexes on WCart are prismatic crystals

Pullbacks identify `D(WCart)≃lim`_(bounded prisms `A)D̂(A)≃Tot D̂(A^•`), monoidally; transitions are completed derived base change. Enlarging to all prisms or restricting to transversal prisms leaves the limit unchanged. Dualizables give Perf`(WCart)≃lim` Perf`(A)`. These are respectively complete crystals and perfect crystals on `(Spf Z_p)_Δ`. The assignments `A↦A{n}` define invertible `O{n}`, compatible with pullback. Each `I^m{n}` is therefore dualizable and satisfies §4.9’s pushforward projection formula. Under the Čech description `RΓ` is totalization of the complexes. Thus global sections are computed by the Cartier–Witt atlas Čech totalization and are derived p-complete (BL22 Lemma 3.3.10 and Corollary 3.3.11, p.44).

Boundedness gives the formal complete-module identification (BL22 Warning 3.3.6); all equivalences are enhanced, so the pullbacks are jointly conservative.

(BL22, Proposition 3.3.5 with its proof, Warning 3.3.6 and Remark 3.3.7; pp. 43, 44; BL22, Lemma 3.3.10 and Example 3.3.8; p. 44; BS23-FCRYS, Proposition 2.7; p. 6.)

*Needs:* [§4.9](#s4-9), [Presentation of WCart as the quotient `[WCart_0 / W^×]`](#layer-4-wcart-quotient-presentation), [§4.8](#s4-8), [§4.6](#s4-6), [§4.7](#s4-7), [§4.1](#s4-1), [PrismaticCohomology §0.63](../PrismaticCohomology/README.md#s0-63), [§3.9](#s3-9), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, EnhancedDerivedSheaves §E2.6, EnhancedDerivedSheaves §§E0.1, E0.4, [§4.0](#s4-0), SchemeAndStackFoundations §§1.15, 1.18, 1.21.

**Proof route.** Tot description (Bhatt–Lurie, Lemma 3.3.10): `Spf(A^0) → WCart` is a Zariski surjection (Presentation of WCart as the quotient `[WCart_0 / W^×]`) whose Čech nerve is `Spf(A^•)` (Fibre products of prisms over WCart and flatness of `ρ_A`); cohomological descent for the Zariski topology gives `D(WCart) ≃ Tot D(Spf A^•) ≃ Tot D̂(A^•)`, each `A^n` being transversal, hence bounded.

<a id="s4-11"></a>
<a id="layer-4-divided-power-multiplicative-group"></a>

### 4.11 The group scheme G_m^♯ and the Frobenius kernel of W^×

Define `O(G_m^♯)=Z[t^−1,(t−1)^n/n!:n≥0]⊂Q[t^±1]`. The map `β:G_m^♯→G_m` is an iso over `Q; t↦t⊗t` uniquely gives its group law. On torsion-free `R, β` is injective with image {`u∈R×:n!` divides `(u−1)^n` for all n}, hence `G_m^♯(Z_p)=1+pZ_p`. Witt Frobenius on W and `W×` is faithfully flat, so its kernels are flat. Over `Z_(p)`, zeroth coordinate identifies `W×[F]≃G_m^♯` and `W[F]≃G_a^♯`, where `O(G_a^♯)=Z[x^n/n!:n≥1]`.

The kernel identification is over `Z_(p)`, not Z: after inverting p the Witt kernel becomes `G_m` but `G_m^♯` retains other-prime divided powers. `β` need not be injective or surjective on general rings`; G_m^♯(F_p)` is trivial.

(BL22, Notation 3.4.9 and Remark 3.4.10; p. 46; BL22, Proposition 3.4.7, Corollary 3.4.8 and Lemma 3.4.11; pp. 46, 47.)

*Needs:* DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, [PrismaticCohomology §0.69](../PrismaticCohomology/README.md#s0-69), [PrismaticCohomology §0.55](../PrismaticCohomology/README.md#s0-55), [PrismaticCohomology §0.56](../PrismaticCohomology/README.md#s0-56), Mathlib `WittVector.frobenius`, Mathlib `WittVector.ghostComponent`, [PrismaticCohomology §0.68](../PrismaticCohomology/README.md#s0-68).

- `Prismatic.WCart.gmSharpRing`: The specified subring of `Q[t^±1]`.
- `Prismatic.WCart.GmSharp`: Its functor of points.
- `Prismatic.WCart.GmSharp.group`: The unique group law making `β` multiplicative.
- `Prismatic.WCart.GmSharp.toUnits`: Evaluation of t in `R×`.
- `Prismatic.WCart.GmSharp.toUnits_injective`: Injective on torsion-free R.
- `Prismatic.WCart.gmSharpEquivFrobeniusKernel`: Over `Z_(p), G_m^♯(R)≃{u∈W(R)×:F(u)=1}`, via `u₀`.

**Checks.**

- `pr5_gmsharp_padic_points`: The image of `G_m^♯(Z_p) → Z_p^×` is `1 + pZ_p`.
- `pr5_gmsharp_rational`: For a Q-algebra R the map `G_m^♯(R) → R^×` is bijective.
- `pr5_gmsharp_fp_trivial`: `G_m^♯(F_4)` is trivial when `p=2`, whereas `G_m(F_4)` has three elements. For `p>2`, use `F_p`. Thus the comparison to `G_m` is not an isomorphism, including at `p=2`.

**Proof route.** Divided power envelope and group structure: Bhatt–Lurie, Notation 3.4.9 and Remark 3.4.10, with the envelopes of DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21; the comultiplication formula `c((t−1)^n/n!) = Σ_{a+b=n} t^a (t−1)^b/b! ⊗ (t−1)^a/a!`.

<a id="s4-12"></a>
<a id="layer-4-hodge-tate-divisor"></a>

### 4.12 The Hodge–Tate divisor WCart^HT and its identification with BG_m^♯

Let `WCart^HT⊂WCart` be `α₀=0`, the effective Cartier divisor `μ^−1(BG_m);` a prism chart pulls it back to `Spf A/I`. The point `η=(W(R),V(1)·)` has `Aut(η)=W×[F]`, since `uV(1)=V(Fu)` and V is injective. It is faithfully flat and yields `WCart^HT≃Spf Z_p×BG_m^♯`, with `μ^HT` induced by `β`. Automorphism groups of Cartier–Witt divisors are commutative and killed by a power of p.

The fpqc classifying stack is not a formal scheme`; η` is a cover, not an isomorphism. Apply §4.0’s `FormalQCoh.classifyingStackComodules` to the flat affine group `G_m^♯` of §4.11; its completed affine nerve computes complexes on this classifying stack.

(BL22, Definition 3.4.1, Remark 3.4.2 and Construction 3.4.4; p. 45; BL22, Theorem 3.4.13 with its proof, Remark 3.4.14 and Corollary 3.4.16; p. 48.)

*Needs:* [§4.4](#s4-4), [Presentation of WCart as the quotient `[WCart_0 / W^×]`](#layer-4-wcart-quotient-presentation), [§4.7](#s4-7), [§4.11](#s4-11), [§4.2](#s4-2), Mathlib `WittVector.verschiebung`, Mathlib `WittVector.verschiebung_mul_frobenius`, Mathlib `WittVector.frobenius_verschiebung`, [§4.0](#s4-0), SchemeAndStackFoundations §§1.1, 1.18–1.22, SchemeAndStackFoundations §§1.15, 1.18, 1.21.

- `Prismatic.WCart.CartierWittDivisor.IsHodgeTate`: `α₀=0`.
- `Prismatic.WCart.etaPoint`: `(W(R),V(1)·), p` nilpotent.
- `Prismatic.WCart.etaPoint_isHodgeTate`: `η` lies in HT.
- `Prismatic.WCart.prismPoint_isHodgeTate_iff`: The prism point is HT iff `f(I)=0`; the square is cartesian.
- `Prismatic.WCart.autEtaEquiv`: `Aut η≃G_m^♯`.
- `Prismatic.WCart.exists_faithfullyFlat_iso_etaPoint`: Every HT point becomes `η` after a faithfully flat extension.

**Checks.**

- `pr5_ht_p_eq_verschiebung_one`: In `W(R)` for R of characteristic `p: p = V(1)`; the de Rham point restricted to `F_p`-algebras is `η`.
- `pr5_ht_p_not_hodge_tate`: The divisor `(W(Z/p²), p·)` is not in the Hodge–Tate divisor: its coordinate `x_0` is `p ≠ 0`.
- `pr5_ht_unit_times_v_one`: `u V(1) = V(F(u))` for every `u ∈ W(R)`.
- `pr5_ht_aut_eta_fp`: Over `F_p` the point `η` has only the identity automorphism: `W^×`[F](F_p) `= 1`.

**Proof route.** Closed substack, fibre description and the pullback square for a prism: Bhatt–Lurie, Definition 3.4.1, Remark 3.4.2 and the diagram after Example 3.4.3; the image of `ρ_A(f)` in R is `f(I)R`.

<a id="s4-13"></a>
<a id="layer-4-sen-operator"></a>

### 4.13 Complexes on the Hodge–Tate divisor and the Sen operator

Define `D(WCart^HT)` by §4.0, equivalently `lim D̂(A/I)≃Tot D̂(A^•/I^•)`, with restriction `ι*`, right adjoint `ι_*` and `O{n}=ι*I^n`. Write `E_η=η*E`. Over `Z[ε]/ε², F([ε])=0` and `(1+[ε])V(y)=V(y)`; this gives an automorphism of the projection `WCart^HT×Spec Z[ε]/ε²→WCart^HT`. Its action on E is `id+εΘ_E`, defining natural `Θ` on E and `E_η`. It obeys tensor Leibniz, is 0 on O and n on `O{n}`, and on `η_*O` its fibre action is `t∂/∂t` on completed `O(G_m^♯)`.

`Θ` is defined on the enhanced category; the sign is `+n` on `O{n}, −n` on conjugate `gr_n`.

(BL22, Construction 3.5.4, Remark 3.5.5, Example 3.5.6 and Notation 3.5.7; pp. 49, 50; BL22, Definition 3.5.1 and Remark 3.5.3; p. 49.)

*Needs:* [§4.12](#s4-12), [§4.9](#s4-9), [§4.10](#s4-10), [§4.11](#s4-11), [§3.9](#s3-9), Mathlib `WittVector.teichmuller`, Mathlib `WittVector.verschiebung_mul_frobenius`, [§4.0](#s4-0), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, SchemeAndStackFoundations §§1.15, 1.18, 1.21.

- `Prismatic.WCart.senOperator`: The natural `Θ` on `η`-fibres.
- `Prismatic.WCart.senOperator_unit`: `Θ_O=0`.
- `Prismatic.WCart.senOperator_twist`: `Θ_(O{n})=n`.
- `Prismatic.WCart.fibreEta_twist`: `η*O{n}=Z_p[0]`.
- `Prismatic.WCart.one_add_teichmuller_eps_mul_verschiebung`: `(1+[ε])V(y)=V(y)` when `ε²=0`, giving the infinitesimal automorphism.

**Checks.**

- `pr5_sen_unit_zero`: The Sen operator of the structure sheaf of `WCart^HT` is zero.
- `pr5_sen_ideal_identity`: The Sen operator of the restricted Hodge–Tate ideal sheaf is the identity of its fibre.
- `pr5_sen_ideal_ne_zero`: The Sen operator of the restricted Hodge–Tate ideal sheaf is not zero; hence that sheaf is not isomorphic to the structure sheaf.
- `pr5_sen_teichmuller_frobenius`: `F([ε]) = 0` in W of the dual numbers over any ring.

**Proof route.** Categories and functors: Bhatt–Lurie, Definition 3.5.1, Example 3.5.2 and Remark 3.5.3, by the same descent argument as Quasi-coherent complexes on WCart are prismatic crystals applied to the prisms `(A^n, I^n)` modulo `I^n`.

<a id="s4-14"></a>
<a id="layer-4-sen-operator-classification"></a>

### 4.14 Classification of complexes on WCart^HT by the Sen operator

The functor `E↦(E_η,Θ_E)` into `D(Z[Θ])` is fully faithful with image the p-complete M for which `Θ^p−Θ` acts locally nilpotently on `H*(F_p⊗^L M)`. There is a fibre sequence `RΓ(E)→E_η→^(Θ)E_η`, and `O≃(η_*O)^(Θ=0)`. Thus `H*(O)=Z_p` in degrees 0,1 only, and `RΓ(O{n})=(Z_p/n)[−1]` for `n≠0`. `RΓ` preserves colimits`; E≃O{n}` iff `E_η≃Z_p` and `Θ=n`. The nonnegative twists generate `D(WCart^HT)`, while `I^n, n∈Z`, generate `D(WCart)`, under shifts and colimits.

All colimits here are p-completed, including at `p=2`.

**Check.** In the `G_m^♯` comodule description, `Θ^p−Θ` must act locally nilpotently modulo p. An arbitrary endomorphism of a complete module does not supply a comodule: on `Z_p[Θ]` completed p-adically, multiplication by `Θ^p−Θ` is not locally nilpotent modulo p.

(BL22, Theorem 3.5.8 with its proof; p. 50; BL22, Propositions 3.5.10, 3.5.11 and 3.5.15, Example 3.5.12, Corollaries 3.5.13, 3.5.14 and 3.5.16; pp. 51, 52, 53.)

*Needs:* [§4.13](#s4-13), [§4.12](#s4-12), [§4.11](#s4-11), [§4.9](#s4-9), [§4.0](#s4-0), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, SchemeAndStackFoundations §§1.15, 1.18, 1.21.

**Proof route.** `(1): η` is faithfully flat, so it suffices to check after `η^*`, where it is the exactness of `0 → Z_p → Ô(G_m^♯) → Ô(G_m^♯) → 0` with second map `t ∂/∂t`; on series `Σ c_n (t−1)^n/n!` with `c_n → 0` the operator is `(c_n) ↦ (c_{n+1} + n c_n)`, surjective with kernel the constants (Bhatt–Lurie, Proposition 3.5.10).

<a id="s4-15"></a>
<a id="layer-4-wcart-frobenius"></a>

### 4.15 The Frobenius endomorphism of WCart

Witt Frobenius base change defines `F:WCart→WCart`, sending principal f to `F(f)`, induced on `A^•` by `φ`. It lifts absolute Frobenius modulo p and satisfies `ρ_A Spf(φ_A)≃Fρ_A`. Pullback is monoidal with `F*O{n}≃I`^−nO`{n}` and a natural global-section map. It contracts `WCart^HT` to `ρ_dR`, sending its points to `(W(R),p·)`, rather than preserving it`; F^−1WCart^HT∩WCart^HT=WCart^HT×Spec F_p`.

F is not an equivalence; its twist formula is the Frobenius of §3.9.

(BL22, Construction 3.6.1, Remarks 3.6.2, 3.6.3 and 3.6.5; p. 55; BL22, Proposition 3.6.6 with its proof, and Remark 3.6.14; pp. 56, 57.)

*Needs:* [§4.4](#s4-4), [§4.3](#s4-3), [§4.7](#s4-7), [§4.12](#s4-12), [§4.9](#s4-9), [§4.10](#s4-10), [PrismaticCohomology §0.56](../PrismaticCohomology/README.md#s0-56), [§3.9](#s3-9), Mathlib `WittVector.frobenius`, Mathlib `WittVector.frobenius_verschiebung`, Mathlib `WittVector.frobenius_eq_map_frobenius`.

- `Prismatic.WCart.frobenius`: Witt-Frobenius base change.
- `Prismatic.WCart.frobenius_ofWitt`: Principal `f↦F(f)`.
- `Prismatic.WCart.frobenius_hodgeTate`: HT points go to `(W(R),p·)`.
- `Prismatic.WCart.frobeniusPullbackMap`: The natural pullback map on `RΓ`.
- `Prismatic.WCart.frobPullback_bkTwist`: `F*O{n}=I`^−nO`{n}`.

**Checks.**

- `pr5_frob_eta_is_p`: `F(V(1)) = p` in `W(R)` for every ring R.
- `pr5_frob_preserves_distinguished`: If p is nilpotent in R and `f ∈ WCart_0(R)` then `F(f) ∈ WCart_0(R)`.
- `pr5_frob_kills_sen_automorphism`: `F(1 + [ε]) = 1` over the dual numbers: F is not faithful on automorphism groups, so it is not an equivalence.
- `pr5_point_frobenius`: `ρ_A(f ∘ φ_A) ≅ F(ρ_A(f))`.

**Proof route.** F is an endomorphism of the δ-ring `W(R)`, natural in R (PrismaticCohomology §0.56); in coordinates `F(x)_0 = x_0^p + p x_1` and `F(x)_1 ≡ x_1^p` modulo `(p, x_0)`, so the coordinate form of the Cartier–Witt conditions is preserved (Bhatt–Lurie, Construction 3.6.1).

<a id="s4-16"></a>
<a id="layer-4-frobenius-pullback-square"></a>

### 4.16 The Frobenius pullback square for global sections on WCart

For `E∈D(WCart)`, the contraction square of §4.15 gives a pullback `RΓ(E)=RΓ(F*E)×_(RΓ_HT(F*E))ρ_dR*E`. The restricted `F*E` has fibre `ρ_dR*E` with `Θ=0`, so `RΓ_HT(F*E)=ρ_dR*E⊕ρ_dR*E[−1]`, and `RΓ(E)→RΓ(F*E)→ρ_dR*E[−1]` is a fibre sequence. Consequently `(F*,ρ_dR*)` into `D(WCart)×_(D(WCart^HT))D(Spf Z_p)` is fully faithful, without essential surjectivity.

BL22 Theorem 3.6.7’s E must be on WCart, not on `WCart^HT`.

(BL22, Theorem 3.6.7 with its proof, Remark 3.6.8, Corollary 3.6.9 and Warning 3.6.11; pp. 56, 57; BL22, Lemma 3.6.19, Proposition 3.6.18 and Remark 3.6.20; pp. 59, 60, 62.)

*Needs:* [§4.15](#s4-15), [§4.14](#s4-14), [§4.13](#s4-13), [§4.12](#s4-12), [§4.9](#s4-9), [§4.10](#s4-10), [§4.8](#s4-8), [§4.7](#s4-7), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, [§3.6](#s3-6).

**Proof route.** Reduction to the Hodge–Tate divisor: E is the limit of the `E/I^n E`, so by induction it suffices to treat `E = ι_* G` with `G ∈ D(WCart^HT)` (Bhatt–Lurie, proof of Theorem 3.6.7).

<a id="s4-17"></a>
<a id="layer-4-relative-site-comparison"></a>

### 4.17 Relative prismatic complexes of animated rings and the relative prismatic site

Use Part I’s animated `Δ_(R/A)`, invariant under derived p-completion, and define `RΓ_Δ(X/A)=lim_(Spec R→X)Δ_(R/A)`. It has étale descent, derived `F_p` Čech descent, and `Δ_R=lim_nΔ_(R⊗^L Z/p^n)`. Comparison with relative site cohomology for bounded formal X is an iso when each affine R has bounded p-torsion and `L_(R/Ā)⊗^L_R R/p` has amplitude `[−1,0]`. If this complex is flat in degree `−1, Δ` is discrete, `Δ̄` p-completely flat, and its prism initial. In particular, for transversal A and perfect `B, R=Ā⊗^L B̄` meets this condition and its prism is A⊔B. For any R of bounded p-torsion, animated cohomology agrees with the pointwise extension on Spf Rhat; comparison to its site still requires the stated cotangent condition.

`(A, I)` is a bounded prism, fixed; 𝔛 is a bounded p-adic formal scheme over `A/I`. Condition (∗) holds when R̂ is p-completely smooth over Ā; it is the Tor-amplitude condition of p-quasisyntomic algebras, taken relative to Ā. It is not automatic, and `ξ_𝔛` is not claimed to be an isomorphism without it. The relative prismatic site is a large category; the limit defining `RΓ`^site is taken in a larger universe (Bhatt–Lurie, Warning 4.3.2). Use the BS22 bounded relative site of Layer 1. Under condition (∗), its limit agrees with the BL22 relative-site limit allowing unbounded objects: the (∗⁺) initial objects are bounded and descent reduces to these. Ordinary fibre products of Ā-schemes over Spec A and over Spec Ā coincide, so no base-of-fibre-product erratum is asserted.

(BL22, Theorem 4.3.6 with its proof, Proposition 4.3.4; p. 86; BL22, Corollary 4.3.14 and Example 4.3.15; pp. 89, 90; BL22, Propositions 4.2.5 and 4.2.8, Corollary 4.2.9; pp. 83, 84.)

*Needs:* [PrismaticCohomology §1.2](../PrismaticCohomology/README.md#s1-2), [PrismaticCohomology §2.7](../PrismaticCohomology/README.md#s2-7), [PrismaticCohomology §2.1](../PrismaticCohomology/README.md#s2-1), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [PrismaticCohomology §2.12](../PrismaticCohomology/README.md#s2-12), [PrismaticCohomology §2.17](../PrismaticCohomology/README.md#s2-17), [PrismaticCohomology §2.8](../PrismaticCohomology/README.md#s2-8), [§4.6](#s4-6), [§4.11](#s4-11), [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84), DerivedModuleAlgebra §§0.4–0.17, 0.25; DerivedDeRhamCohomology §1.23, §§5.1–5.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, DerivedDeRhamCohomology §§5.1–5.7, EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, EnhancedDerivedSheaves §E5:animation.1, EnhancedDerivedSheaves §E3.1, [PrismaticCohomology §2.13](../PrismaticCohomology/README.md#s2-13), [PrismaticCohomology §2.16](../PrismaticCohomology/README.md#s2-16), [PrismaticCohomology §1.25](../PrismaticCohomology/README.md#s1-25).

**Proof route.** `(1)`: étale descent from the derived Hodge–Tate comparison and p-completely formally étale base change of `Δ̄` (PrismaticCohomology §2.3; Bhatt–Lurie, Proposition 4.1.13, Corollaries 4.1.14 and 4.1.15); derived descent along `F_p^{⊗•+1}`: reduce by base change (PrismaticCohomology §1.21) and the Künneth formula (PrismaticCohomology §2.8) to the universal oriented prism, where the unit map is refined by a faithfully flat map because `F : W^× → W^×` is faithfully flat (Bhatt–Lurie, Proposition 4.2.8, Corollary 4.2.9, Proposition 4.2.5).

<a id="s4-18"></a>
<a id="layer-4-absolute-prismatic-cohomology"></a>

### 4.18 The prismatic cohomology sheaf on WCart and absolute prismatic cohomology

For animated R, completed prism base change makes the family `A↦Δ_((Ā⊗^L R)/A)` a commutative algebra `H_Δ(R)∈D(WCart)`. It preserves sifted colimits and étale descent. Define `Δ_R^[m]{n}=RΓ(WCart,I^mH_Δ(R){n}), Δ_R=Δ_R^[0]{0}`; the atlas computes these by totalization. For schemes, formal schemes and algebraic stacks X, take the limit over ordinary affine points `Spec R→X`. For bounded qcqs formal X, the family `A↦RΓ_Δ(Spf Ā×X/A)` on transversal prisms defines `H_Δ(X)` by étale descent, agreeing on bounded p-complete affines; its twisted global sections recover `RΓ_Δ`^[m](X)`{n}`. If `X/Z_p` is smooth proper, `H_Δ(X)` is perfect.

No completeness of animated R is required. BL22 Construction 4.4.19’s affine-point limit uses absolute, not relative, symbols.

(BL22, Construction 4.4.1, Remarks 4.4.2 and 4.4.3, Variant 4.4.6; pp. 90, 91; BL22, Constructions 4.4.10 and 4.4.19, Remark 4.4.11; pp. 92, 93.)

*Needs:* [§4.10](#s4-10), [§4.9](#s4-9), [§4.7](#s4-7), [§4.17](#s4-17), [§4.6](#s4-6), [PrismaticCohomology §2.7](../PrismaticCohomology/README.md#s2-7), [PrismaticCohomology §1.23](../PrismaticCohomology/README.md#s1-23), [PrismaticCohomology §2.1](../PrismaticCohomology/README.md#s2-1), [§3.9](#s3-9), EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, EnhancedDerivedSheaves §E5:animation.1, EnhancedDerivedSheaves §E3.1, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

- `Prismatic.Absolute.prismaticSheaf`: `H_Δ(R)` with its specified prism evaluations.
- `Prismatic.Absolute.prismaticSheafMap`: Variance in R.
- `Prismatic.Absolute.prismaticComplex`: `Δ_R=RΓ(H_Δ(R))`.
- `Prismatic.Absolute.absolutePrismatic`: Twisted ideal global sections `Δ_R^[m]{n}`.
- `Prismatic.Absolute.prismPullback_prismaticSheaf`: For Ā Z-flat (e.g. transversal), evaluation uses `Ā⊗R=Ā⊗^L R`.
- `Prismatic.Absolute.absolutePrismatic_zero_zero`: `Δ_R^[0]{0}=Δ_R`.

**Checks.**

- `pr5_abs_sheaf_integers`: `H_Δ(Z)` is the unit object `O_WCart`.
- `pr5_abs_sheaf_zero_ring`: `H_Δ` of the zero ring is a zero object.
- `pr5_abs_fp`: `Δ_{F_p}` is `Z_p` placed in degree 0.
- `pr5_abs_sheaf_fp_not_unit`: `H_Δ(F_p)` is not isomorphic to `O_WCart`: its pullback to a transversal prism A is `A{p/I}^∧`, not A.

**Proof route.** Crystal data: the base-change isomorphism of derived prismatic cohomology (PrismaticCohomology §1.21 for the derived complexes of PrismaticCohomology §2.1; Bhatt–Lurie, Remark 4.1.5) gives an object of `lim D̂(A)`, hence of `D(WCart)` (Bhatt–Lurie, Construction 4.4.1).

<a id="s4-19"></a>
<a id="layer-4-absolute-relative-comparison"></a>

### 4.19 Absolute versus relative prismatic cohomology

For animated `R, ρ_B*H_Δ(R)=Δ_((B̄⊗^L R)/B)`. If R is a B̄-algebra, multiplication induces `ξ:H_Δ(R)→ρ_(B*)Δ_(R/B)`, hence `Δ_R^[m]{n}→J^mΔ_(R/B){n}`; these extend to `X/B̄`. If B is perfect, `ξ` and these maps are isos, also for `H_Δ(X)` on bounded qcqs formal `X/B̄`. For `QRSP R, Δ_R` is discrete and `(Δ_R,Δ_R^[1])` is its initial prism, with `H_Δ(R)` the pushforward of its structure sheaf. General nonperfect B has no such iso: its pullback uses `B̄⊗^L R`.

`(1)` holds for every bounded prism; the isomorphisms of `(2)` require the prism to be perfect. R is an animated algebra over `B̄ = B/J` in `(2)`; no finiteness or completeness hypothesis. The comparison is not an isomorphism for every bounded prism: for a bounded prism only the identity `ρ_B^* H_Δ(R) = Δ_{(B̄ ⊗^L R)/B}` holds.

(BL22, Propositions 4.4.8 and 4.4.12 with their proofs; pp. 91, 92; BL22, Example 4.4.13 and Remark 4.4.21; pp. 92, 94.)

*Needs:* [§4.18](#s4-18), [§4.17](#s4-17), [§4.8](#s4-8), [§4.6](#s4-6), [§4.9](#s4-9), [§4.10](#s4-10), [PrismaticCohomology §2.7](../PrismaticCohomology/README.md#s2-7), [PrismaticCohomology §2.8](../PrismaticCohomology/README.md#s2-8), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84), [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77).

The specialized pushforward and dualizable projection formula used here are `FormalQCoh.prismPushforward_flatBaseChange` of §4.9. No additional ordinary base-change claim is used for nontransversal B.

**Proof route.** Evaluate on the transversal atlas of WCart and use the completed relative base-change comparison to form the map. For a perfect prism, its coproduct with a transversal test prism has the required product description, so the map is an equivalence; QRSP initiality identifies its representing prism (BL22 Propositions 4.4.8 and 4.4.12, pp.91–92, Example 4.4.13 and Remark 4.4.21, pp.92,94).

<a id="s4-20"></a>
<a id="layer-4-absolute-prismatic-descent"></a>

### 4.20 Descent and continuity properties of absolute prismatic cohomology

For all `m,n∈Z, Δ_R^[m]{n}` and its pointwise X-extension satisfy étale descent, derived `F_p` Čech descent, `Δ_R^[m]{n}=lim_kΔ_(R⊗^L Z/p^k)^[m]{n}`, and derived p-completion invariance. For schemes of bounded p-torsion it agrees with their p-adic formal completion; it has p-quasisyntomic descent on p-quasisyntomic formal schemes. `Δ_R` does not preserve filtered colimits in `D̂(Z_p)`.

`(1)`–`(4)` hold for all animated commutative rings. `(5)` requires bounded p-power torsion`; (6)` is stated on p-quasisyntomic formal schemes: affine opens Spf R with R p-complete, of bounded p-power torsion, and `L_{R/Z_p} ⊗^L R/p` of Tor-amplitude in `[−1, 0]`. Descent is for `D̂(Z_p)`-valued functors: limits are p-completed derived limits.

(BL22, Propositions 4.4.14 and 4.4.15, Corollaries 4.4.17 and 4.4.18; p. 93; BL22, Propositions 4.4.25 and 4.4.32, Corollary 4.4.26; pp. 94, 96.)

*Needs:* [§4.18](#s4-18), [§4.17](#s4-17), [§4.11](#s4-11), [§4.9](#s4-9), [PrismaticCohomology §2.17](../PrismaticCohomology/README.md#s2-17), [PrismaticCohomology §2.8](../PrismaticCohomology/README.md#s2-8), DerivedDeRhamCohomology §§5.1–5.7, EnhancedDerivedSheaves §E2.6, EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4.

**Proof route.** `(1)`: étale descent of `R ↦ H_Δ(R)` in `D(WCart)` follows from that of the relative complexes (Relative prismatic complexes of animated rings and the relative prismatic site `(1)`); tensoring with the invertible sheaf `I^m{n}` and taking global sections preserves limits (Bhatt–Lurie, Remark 4.4.3, Proposition 4.4.14, Remark 4.4.22).

<a id="s4-21"></a>
<a id="layer-4-absolute-site-comparison"></a>

### 4.21 Absolute prismatic cohomology as cohomology of the absolute prismatic site

For bounded formal X, restriction to each `Spf A/I→X` followed by relative comparison gives `Δ_X^[m]{n}→lim_(X_Δ)I^m{n}=RΓ_Δ`^site,[m](X)`{n}`. It is an iso, multiplicatively, if each affine ring is p-quasisyntomic. Site cohomology has p-quasisyntomic descent on all bounded formal schemes; on QRSP rings the initial prism is a terminal site object, so both sides are `I^m{n}` there.

No qc hypothesis is needed. Without quasisyntomicity the map still exists, but site and animated cohomology need not agree.

(BL22, Theorem 4.4.30 with its proof, Example 4.4.29; p. 95; BL22, Proposition 4.4.31; p. 95.)

*Needs:* [§4.1](#s4-1), [§4.18](#s4-18), [§4.19](#s4-19), [§4.20](#s4-20), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §2.17](../PrismaticCohomology/README.md#s2-17), DerivedDeRhamCohomology §§5.1–5.7, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, [PrismaticCohomology §2.16](../PrismaticCohomology/README.md#s2-16).

**Proof route.** For QRSP R, §4.19 and PrismaticCohomology §2.15 give an initial prism `(Δ_R, Δ_R^{[1]})` among prism triples. It is terminal in the opposite prismatic site. The structure-presheaf diagram is indexed by the category of prism triples, where this object is initial, so its derived limit is its value `I^m{n}` there (BL22 Example 4.4.29, p.95).

**Check.** For the QRSP point, each algebraic triple receives the unique map from its initial prism; reversing these arrows gives maps to the terminal site object. The structure presheaf sends them to maps from `I^m{n}`, which is the limiting value.

<a id="s4-22"></a>
<a id="layer-4-absolute-hodge-tate-cohomology"></a>

### 4.22 Absolute Hodge–Tate cohomology and the diffracted Hodge complex

Set `H_Δ̄(R)=ι*H_Δ(R), Δ̄_R{n}=RΓ_HT(H_Δ̄(R){n})`, and Ωhat^DHod_R`=η*H_Δ̄(R)`. Its exhaustive conjugate filtration has `Fil₀=R⊗O` and `gr_j=LΩ_R^j⊗O{−j}[−j]`; after `η*` the graded is LΩhat_R^`j[−j]`, with `Θ=−j`, and `Fil_j` lies in `D≤j`. Global sections commute with this filtration’s colimit. The ideal filtration has fibre `Δ_R^[m+1]{n}→Δ_R^[m]{n}→Δ̄_R{m+n}`; it is filtration-complete and preserves sifted colimits in that category, as do `Δ̄` and each conjugate step. Moreover `Δ̄_R{n}=fib(Θ+n`:Ωhat^DHod_R`→Ω`hat^DHod_R), also at each conjugate step. Over a perfect prism, for animated Ā-algebras this is the relative `Δ̄{n}`.

`LΩ_R^n` is the derived exterior power over Z. BL22 Construction 4.7.1 omits the necessary `[−n]` shift. Absolute `Δ̄` is the first ideal graded piece, not a quotient by a chosen global ideal.

(BL22, Constructions 4.5.1 and 4.5.5, Remark 4.5.7, Propositions 4.5.8 and 4.5.10; pp. 96, 97, 98; BL22, Construction 4.7.1, Notation 4.7.2 and Remark 4.7.5; pp. 102, 103.)

*Needs:* [§4.18](#s4-18), [§4.19](#s4-19), [§4.13](#s4-13), [§4.14](#s4-14), [§4.12](#s4-12), [§4.9](#s4-9), [§4.10](#s4-10), [PrismaticCohomology §1.5](../PrismaticCohomology/README.md#s1-5), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [§3.9](#s3-9), DerivedModuleAlgebra §§0.4–0.17, 0.25; DerivedDeRhamCohomology §1.23, §§5.1–5.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

- `Prismatic.Absolute.hodgeTateSheaf`: `ι*H_Δ(R)`.
- `Prismatic.Absolute.absoluteHodgeTate`: `RΓ_HT(H_Δ̄(R){n})`.
- `Prismatic.Absolute.diffractedHodge`: `η*H_Δ̄(R)`, with `Θ`.
- `Prismatic.Absolute.diffractedHodgeFil`: Its conjugate steps and structure maps.
- `Prismatic.Absolute.absolutePrismatic_fibre_sequence`: `Δ_R^[m+1]{n}→Δ_R^[m]{n}→Δ̄_R{m+n}`.
- `Prismatic.Absolute.absoluteHodgeTate_fibre_sequence`: `Δ̄_R{n}→Ω`hat^DHod_R`→^(Θ+n)`Ωhat^DHod_R.

**Checks.**

- `pr5_ht_integers_h1`: `H^1(Δ̄_Z) ≅ Z_p`.
- `pr5_ht_integers_twist_h0`: `H^0(Δ̄_Z{n}) = 0` for `n ≠ 0`: the twist cannot be ignored.
- `pr5_ht_sheaf_integers`: `H_Δ̄(Z)` is the unit object of `D(WCart^HT)`.
- `pr5_ht_diffracted_integers`: `Ω̂`^DHod_Z is `Z_p` in degree 0.

**Proof route.** Sheaf and conjugate filtration: the relative conjugate filtration of PrismaticCohomology §2.3 is compatible with base change, so it defines filtered objects of `D(WCart^HT) ≃ lim D̂(A/I)` (Complexes on the Hodge–Tate divisor and the Sen operator; Bhatt–Lurie, Construction 4.5.1, Remarks 4.5.2–4.5.4); the graded pieces use `A{1}/I ≅ I/I²` (§3.9).

<a id="s4-23"></a>
<a id="layer-4-absolute-crystalline-comparison"></a>

### 4.23 Absolute prismatic cohomology in characteristic p is crystalline cohomology

For quasisyntomic `F_p`-schemes, absolute `Δ` identifies with crystalline cohomology as E∞-algebras. Its normalization is `ε_crys` followed by `O_X→Fil₀^conjΔ̄=`Frobenius followed by reduction, after identifying the sources. Over perfect `k, Δ_X=Δ_(X/W(k))` and the crystalline identification uses `F*Δ`; for perfect `F_p`-algebras its inverse is `W(φ_R^−1)`. On animated `F_p`-algebras `Δ` preserves sifted colimits and is derived crystalline cohomology; arbitrary `F_p`-schemes have only a natural comparison, not necessarily an iso. Crystalline cohomology has p-quasisyntomic descent on that site`; A_crys` of `QRSP F_p`-algebras is p-torsion-free. Here Frobenius is the relative map over `(Z_p,(p))`, so no later absolute Frobenius is needed.

No qc or smoothness is assumed; the k-linear comparison requires the displayed Frobenius twist.

(BL22, Theorem 4.6.1 with its proof, Lemmas 4.6.8, 4.6.11 and 4.6.13; pp. 98, 99, 100, 101; BL22, Notation 4.6.4, Example 4.6.9 and Corollary 4.6.10; pp. 99–100; BL22, Warning 4.6.2, Remarks 4.6.5 and 4.6.6, Corollary 4.6.7; pp. 98, 99.)

*Needs:* [§4.18](#s4-18), [§4.19](#s4-19), [§4.20](#s4-20), [§4.22](#s4-22), [PrismaticCohomology §1.14](../PrismaticCohomology/README.md#s1-14), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [§3.5](#s3-5), DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedDeRhamCohomology §4.2; CrystallineCohomology §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedDeRhamCohomology §§5.1–5.7, [PrismaticCohomology §1.9](../PrismaticCohomology/README.md#s1-9), CrystallineCohomology Layer CR.4.

**Checks.**

- For perfect R, with `Δ_R=W(R)` normalized by the Hodge–Tate structure map, the forward comparison is `γ_R^crys=W(φ_R):Δ_R→A_crys(R)` and its inverse is `β_R=W(φ_R^−1)`.
- For `R=F_(p³)` and `a∉F_p`, the forward and reverse maps send `[a]` to `[a^p]` and `[a^(p²)]` respectively, which differ. Over `F_p` and `F_(p²)` these two automorphisms coincide.
- For `R=F_p[x^(1/p^∞)]/(x)`, the comparison identifies `Δ_R` with the p-completed PD envelope of `(x)` in `W(F_p[x^(1/p^∞)])`.

The Teichmüller formulas are supplied by `WittVector.frobenius_teichmuller` and `WittVector.frobeniusEquiv_symm_teichmuller` in `TauCeti.RingTheory.WittVector.Frobenius`.

**Proof route.** Quasiregular semiperfect `R: Δ_R` is a p-torsion-free ring with `Δ_R^{[1]} = (p)` (Absolute versus relative prismatic cohomology `(3)`); the composite `Δ_R → Δ_R → Δ̄_R (φ`, then reduction) has image `R = Fil_0^conj` (§3.5) and kernel `J = {x : φ(x) ∈ pΔ_R}`, which has divided powers; the universal property of `A_crys(R)` (DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21) gives `β_R : A_crys(R) → Δ_R` (Bhatt–Lurie, Lemma 4.6.8).

<a id="s4-24"></a>
<a id="layer-4-absolute-de-rham-comparison"></a>

### 4.24 The absolute de Rham comparison and the de Rham point

For animated R put Rbar`=R⊗^L F_p` and dRhat_R`=LΩ_R/Z` completed at p. Relative de Rham comparison gives `α_R:ρ_dR*H_Δ(R)≃`dRhat_R, characterized by its pullback to `WCart^HT` and the contraction `Fι=ρ_dRπ`. Consequently Δ_Rbar≃dRhat_R as E∞-algebras. Restriction at `ρ_dR` and the canonical `e^n` trivialization define `γ^dR{n}:Δ_R{n}→`dRhat_R; augmentation is `γ^dR` then `gr_Hdg⁰=`Rhat. The contraction square with corners `Δ_R{n}`, dRhat_R, `RΓ(F*(H_Δ(R){n}))`, dRhat_R`⊗̂RΓ_HT(O)` is cartesian and gives a fibre sequence from `Δ_R{n}` to its third corner to dRhat_R`[−1]`. For flat formal `X/Z_p` with regular noetherian special fibre `X₀` this recovers `RΓ_crys(X₀/Z_p)≃RΓ_dR(X)`.

dRhat means p-complete, not Hodge-complete; the augmentation uses this distinction.

(BL22, Theorem 5.4.2, Proposition 5.4.8 with its proof, Constructions 5.4.7, 5.4.9 and 5.4.10; pp. 129, 130, 131; BL22, Corollary 5.4.14 and Remark 5.4.15; p. 133.)

*Needs:* [§4.18](#s4-18), [§4.19](#s4-19), [§4.16](#s4-16), [§4.15](#s4-15), [§4.14](#s4-14), [§4.10](#s4-10), [§4.23](#s4-23), [§3.17](#s3-17), [§3.14](#s3-14), [§3.9](#s3-9), DerivedDeRhamCohomology Layer 2, DerivedDeRhamCohomology §§5.1–5.7, EnhancedDerivedSheaves §E5:animation.1.

**Proof route.** `Ρ_dR^* H_Δ(R) = Δ_{R̄/Z_p}` by construction, and `Δ_{R̄/Z_p} ≅ Δ_{R̄}` because `(Z_p, (p))` is perfect (Absolute versus relative prismatic cohomology; Bhatt–Lurie, Example 5.4.5).

<a id="s4-25"></a>
<a id="layer-4-absolute-nygaard-filtration"></a>

### 4.25 The absolute Nygaard filtration

Relative Nygaard glues to `Fil_N F*H_Δ(R)`, with zeroth term `F*H_Δ(R)` and filtered fibre `I⊗Fil_N^(•−1)→Fil_N^•→ι_*(Fil_Hdg^•`dRhat_R`⊗O_HT`). Tensor with `F*O{n}=I`^−nO`{n}`, canonically trivial on HT. Define `Fil_N^•Δ_R{n}` as the pullback of its global sections and `Fil_Hdg^•`dRhat_R over `Fil_Hdg^•`dRhat_R`⊗̂RΓ_HT(O)`; this gives the filtered de Rham map and fibre sequence with third term `Fil_Hdg^•`dRhat_R`[−1]`. All twists together form a graded commutative algebra in filtered complexes, with the named cup product, variance, graded fibres and canonical classes below. On schemes, formal schemes and stacks take affine-point limits. Define `Fil_N`^mΔhat_R`{n}=`lim_kFil_N^`mΔ_R{n}/Fil_N^(m+k)Δ_R{n}`; completeness is lim_mFil_N^`m=0`. The filtration is `Δ_R{n}` for `m≤0`.

The filtration uses p-complete de Rham without Hodge completion. Affine-point limits use the absolute symbols, correcting BL22’s misprint.

(BL22, Notation 5.5.1, Remark 5.5.2, Construction 5.5.3 and Remark 5.5.6; pp. 133, 134; BL22, Remarks 5.5.7, 5.5.8 and 5.5.15, Corollary 5.5.14, Notation 5.5.23, Definition 5.8.5; pp. 134, 135, 136, 138, 148.)

*Needs:* [§4.24](#s4-24), [§4.18](#s4-18), [§4.22](#s4-22), [§4.16](#s4-16), [§4.15](#s4-15), [§4.14](#s4-14), [§4.10](#s4-10), [§4.9](#s4-9), [§3.14](#s3-14), [§3.17](#s3-17), [§3.9](#s3-9), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, DerivedDeRhamCohomology Layer 2, [§3.19](#s3-19), [§3.15](#s3-15).

- `Prismatic.Absolute.nygaardFil`: The absolute filtered complex.
- `Prismatic.Absolute.nygaardTransition`: `Fil^(m+1)→Fil^m`.
- `Prismatic.Absolute.nygaardFil_of_nonpos`: `Fil^m=Δ_R{n}` for `m≤0`.
- `Prismatic.Absolute.nygaardGr`: The transition cofibre.
- `Prismatic.Absolute.nygaard_fibre_sequence`: The defining Nygaard fibre sequence.
- `Prismatic.Absolute.nygaardGr_fibre_sequence`: `gr_N^m→Fil_m`^conjΩhat^DHod`→^(Θ+m)Fil_(m−1)`^conjΩhat^DHod.
- `Prismatic.Absolute.nygaardToHodge`: The filtered de Rham projection.
- `Prismatic.Absolute.nygaardCompleted`: Nygaard completion, its filtration and canonical map.
- `Prismatic.Absolute.absoluteNygaardCup`: The unital multiplicative map `Fil^i{m}⊗̂Fil^j{n}→Fil^(i+j){m+n}`.
- `Prismatic.Absolute.absoluteNygaardMap`: Functoriality, identities and composition, commuting with every comparison.
- `Prismatic.Absolute.absoluteNygaardClass`: The unique `e^n∈H⁰(gr_N⁰Δ_R{n})` mapping to 1 in de Rham`; e⁰=1, e^me^n=e^(m+n)`, natural in R. A lift to `Δ_R{1}` needs a cyclotomic choice.
- `Prismatic.Absolute.absoluteNygaardPeriodicity`: Multiplication by `e^n` identifies `gr_N^mΔ_R≃gr_N^mΔ_R{n}`, inverse `e^−n`, for all integers m,n.

**Checks.**

- `pr5_nyg_fil_zero`: `Fil^0_N Δ_R{n} ≅ Δ_R{n}`.
- `pr5_nyg_gr_fp`: `gr^m_N Δ_{F_p} ≅ F_p` in degree 0 for every `m ≥ 0`: the filtration of `Z_p` by the ideals `p^m Z_p`.
- `pr5_nyg_gr_zero_integers`: `gr^0_N Δ_Z ≅ Z_p` in degree 0.
- `pr5_nyg_gr_one_integers`: `gr^1_N Δ_Z = 0`, whereas the first graded piece of the p-adic filtration of `Δ_Z` is not zero.

**Proof route.** `(a)`: the base-change isomorphism `B ⊗`̂^`L_A Fil^•_N F^* Δ_{R′/A} ≅ Fil^•_N F^* Δ_{(B ⊗^L_A R′)/B}` of the relative filtration (Bhatt–Lurie, Remark 5.1.10) and Quasi-coherent complexes on WCart are prismatic crystals give the filtered sheaf (Notation 5.5.1).

<a id="s4-26"></a>
<a id="layer-4-cyclotomic-hodge-tate-chart"></a>

### 4.26 Cyclotomic chart and its Hodge–Tate torsor

Write `q=1+t` and `p̃=∑_(e∈F_p)q^[e]` in `Z_p[[t]]`, where `[e]` is the Teichmüller representative. Then `(p̃)=([p]_q), Z_p[[t]]^(F_p^×)=Z_p[[p̃]]`, and `(Z_p[[p̃]],(p̃))` is a transversal prism. Its Hodge–Tate point is isomorphic to the canonical point `η:Spf Z_p→WCart^HT`. Choosing this isomorphism trivializes the `G_m^♯`-torsor after every perfect-prism base change; choices differ by `G_m^♯(Z_p)=(1+pZ_p)^×`.

`F_p×` acts by `q↦q^[u]`. The chart works at `p=2`; the separate odd-p quotient theorem BL22 Theorem 3.8.3 is not asserted.

(BL22, Notation 3.8.1; Proposition 3.8.6; Corollary 3.8.8; Proposition 3.8.12 and Warning 3.8.13, §3.8; pp. 68, 70, 72, 73.)

*Needs:* [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77), [§4.7](#s4-7), [§4.12](#s4-12), [§4.11](#s4-11), [§4.22](#s4-22).

- `Prismatic.WCart.cyclotomicChart`: The invariant prism and its map to the q-prism.
- `Prismatic.WCart.cyclotomicHTTrivialization`: A chosen HT identification gives equivariant torsor trivializations; choices form `a G_m^♯(Z_p)`-torsor.
- `Prismatic.WCart.cyclotomicChart_ideal`: (ptilde) maps to `([p]_q); HT` sets `[p]_q=0, de` Rham sets `q−1=0`.

**Checks.**

- `pr5_cyclotomic_two`: `p=2` gives `p̃=[2]_q`.
- `pr5_cyclotomic_three`: `p=3` gives `p̃=q^(-1)[3]_q`, so the ideals agree.
- `pr5_cyclotomic_not_unique`: The Hodge–Tate trivialization is ambiguous by `G_m^♯(Z_p)`; treating it as unique discards its automorphisms.

**Proof route.** Each `q^[e]` differs from `q^e` by a multiple of `q^p−1`; therefore `p̃=[p]_q(1+t f)` with the last factor a unit. Invariants under `F_p^×` are exact because `p−1` is invertible.

<a id="s4-27"></a>
<a id="layer-4-perfect-prism-sen-calculation"></a>

### 4.27 Sen calculation over the cyclotomic chart

For a perfect prism `(A,I)` with a prism map from `(Z_p[[p̃]],(p̃))`, put `R=A/I`. The map `(Θ+m,ξ):Fil_m^conj Ω̂_R^D→Fil_(m−1)^conj Ω̂_R^D⊕R` is an isomorphism for every `m≥0`, where `ξ` is the relative-prismatic evaluation. Both sides are free R-modules of rank `m+1`.

Use the torsor trivialization supplied by Cyclotomic chart and its Hodge–Tate torsor. `Fil_(−1)^conj=0`; no odd-prime restriction is added.

(BL22, Lemma 5.6.14 and proof, §5.6; p. 142.)

*Needs:* [§4.26](#s4-26), [§4.22](#s4-22), [§4.13](#s4-13).

**Proof route.** Trivialize `Ω̂_R^D` as `R⊗̂O(G_m^♯)`. Put `γ_n=(1−t^(-1))^n/n!` in this coordinate description.

<a id="s4-28"></a>
<a id="layer-4-derived-fp-conjugate-descent"></a>

### 4.28 Derived reduction descent for conjugate pieces

For an animated A/I-algebra R and `R^•=R⊗^L_ZF_p^(⊗(•+1))`, every integer m and derived p-complete `Z_p`-complex M, the canonical map `M⊗`̂^LFil_m^`conjΔ̄_(R/A)→Tot(M⊗`̂^LFil_m^`conjΔ̄_(R^•/A)`) is an equivalence.

This is descent along the derived `F_p` reduction, not a faithfully flat cover of discrete rings. The conjugate filtration is increasing and zero below degree zero.

(BL22, Variant 4.2.10 and proof, §4.2; p. 85.)

*Needs:* [PrismaticCohomology §2.2](../PrismaticCohomology/README.md#s2-2), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), DerivedModuleAlgebra §§0.4–0.17, 0.25; DerivedDeRhamCohomology §1.23, §§5.1–5.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, EnhancedDerivedSheaves Layer E3.

**Proof route.** Induct on m using the conjugate graded-piece formula to reduce to completed exterior powers of the cotangent complex. Apply the cotangent transitivity triangle for `R→R^•`.

<a id="s4-29"></a>
<a id="layer-4-absolute-nygaard-graded-pieces"></a>

### 4.29 Graded pieces, de Rham specialisation, descent and completeness of the absolute Nygaard filtration

For `m≥0, Δ_R{n}/Fil_N^m→`dRhat_R/`Fil_Hdg^m` is an isogeny, an iso for `m<p`; also `gr_N^mΔ_R=`LΩhat_R^`m[−m]` for `m<p` and `Fil_N¹→Δ_R→`Rhat is a fibre sequence. All `gr_N^mΔ_R{n}` lie in `D≤m` (Beilinson connectiveness), preserve sifted colimits and have p-completely faithfully flat descent. Filtered terms have étale, p-quasisyntomic, derived `F_p` Čech and derived `Z/p`^k-limit descent and p-completion invariance, but need not preserve sifted colimits. If R is p-regular with `R/p` regular noetherian, all `Δ_R{n}` are Nygaard-complete`; k[x^(1/p^∞)]/(x)`, perfect k, is not.

`(1)`–`(3)` hold for every animated commutative ring`; (4)` requires R p-torsion-free with `R/pR` regular Noetherian. The isomorphism range in `(1)` is `m < p`; for `m ≥ p` only an isogeny is claimed. The Beilinson t-structure on filtered complexes and filtration-completeness are those of DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

(BL22, Proposition 5.5.12 with its proof, Example 5.5.13, Corollary 5.5.18, Proposition 5.5.19; pp. 136, 137; BL22, Propositions 5.5.20 and 5.5.24, Corollaries 5.5.21, 5.5.22, 5.5.25 and 5.5.26; pp. 137, 138; BL22, Proposition 5.8.2, Lemma 5.8.3 and Example 5.8.1; p. 147.)

*Needs:* [§4.25](#s4-25), [§4.22](#s4-22), [§4.13](#s4-13), [§4.20](#s4-20), [§4.24](#s4-24), [§4.23](#s4-23), [§3.14](#s3-14), [§3.20](#s3-20), DerivedModuleAlgebra §§0.4–0.17, 0.25; DerivedDeRhamCohomology §1.23, §§5.1–5.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, DerivedDeRhamCohomology Layer 2, DerivedDeRhamCohomology §§5.1–5.7, [§3.21](#s3-21), [§4.28](#s4-28).

**Proof route.** `(1)`: the fibre of `gr^m` of the de Rham specialisation is (`Fil_{m−1}^conj Ω̂`^DHod_R)^`{Θ=−m}`; on `gr_i^conj, i < m`, the operator `Θ + m` is multiplication by `m − i`, nonzero, and a unit of `Z_p` when `m < p`; induct on m (Bhatt–Lurie, Proposition 5.5.12, Example 5.5.13, the Corollary after Warning 5.5.17).

<a id="s4-30"></a>
<a id="layer-4-absolute-nygaard-perfect-prism"></a>

### 4.30 The absolute Nygaard filtration over a perfect prism, for quasiregular semiperfectoid rings and in characteristic p

Over perfect `(A,I), Fil_NΔ_R{n}≃Fil_NF*(Δ_(R/A){n})` for animated `R/Ā`; twisting includes `F*A{n}=I^−nA{n}`. For QRSP R it is the discrete subgroup `{x∈Δ_R{n}:φ(x)∈I^(m−n)Δ_R{n}}`, with discrete graded pieces; quasisyntomic descent totalizes this on QRSP Čech nerves. In characteristic p, the crystalline comparison carries `Fil_N¹` to `fib(ε_crys)` on quasisyntomic rings. For quasiregular semiperfect `R, Fil_N^nA_crys` is generated by `p^a∏γ_(b_i)([x_i]), x_i∈ker`(Rflat`→R), a+Σb_i≥n`. For regular noetherian `F_p`-algebras it identifies the filtration with Nygaard on `WΩ_R`.

`(1)` requires `(A, I)` perfect; for a bounded prism only the comparison map is defined. `(2): R` quasiregular semiperfectoid; the index of the ideal filtration is `m − n`. `(3): R` an `F_p`-algebra; quasisyntomic, quasiregular semiperfect or regular Noetherian as stated in each assertion. The relative Nygaard filtration and the filtrations of quasiregular semiperfectoid and quasisyntomic rings are owned by Layer 3; this target only compares with them.

(BL22, Theorem 5.6.2 with its proof from Proposition 5.6.8, Construction 5.6.1, Lemma 5.6.14; pp. 138, 139, 140, 142; BL22, Corollaries 5.6.3 and 5.6.4, Remark 5.6.5; p. 139; BL22, Propositions 5.3.1, 5.3.6 and 5.3.8; pp. 124, 126, 128.)

*Needs:* [§4.25](#s4-25), [§4.29](#s4-29), [§4.19](#s4-19), [§4.23](#s4-23), [§4.22](#s4-22), [§3.14](#s3-14), [§3.1](#s3-1), [§3.4](#s3-4), [§3.5](#s3-5), [PrismaticCohomology §2.3](../PrismaticCohomology/README.md#s2-3), [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77), [PrismaticCohomology §0.83](../PrismaticCohomology/README.md#s0-83), DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, CrystallineCohomology Layer CR.4, DerivedDeRhamCohomology §4.2; CrystallineCohomology §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedDeRhamCohomology §§5.1–5.7, [§4.27](#s4-27).

**Proof route.** Reduce `(1)` to graded pieces by induction on m, the case `m = 0` being Absolute versus relative prismatic cohomology and bijectivity of `φ_A`; both `gr^m_N Δ_R{n}` and `Fil_m^conj Δ̄_{R/A}{m}` commute with sifted colimits and satisfy p-completely faithfully flat descent (Graded pieces, de Rham specialisation, descent and completeness of the absolute Nygaard filtration `(3)`; PrismaticCohomology §2.3), so it suffices to treat quasiregular semiperfectoid Ā-algebras admitting a map from `Z_p`^cyc, a basis of the quasisyntomic topology (Bhatt–Lurie, proof of Theorem 5.6.2).

<a id="s4-31"></a>
<a id="layer-4-absolute-frobenius"></a>

### 4.31 The Frobenius on absolute prismatic cohomology

Relative filtered Frobenius glues to `Fil_N^•F*H_Δ(R)→I^•H_Δ(R)`, with `gr_m≃ι_*Fil_m`^conjH_Δ̄`(R){m}`. It exhibits `H_Δ(R)` as `colim_m I`^−mFil_N^`mF*H_Δ(R)`, with successive quotients `ι_*(Fil_Hdg^m` dRhat_R`⊗O_HT{−m}`). Twisting by `F*O{n}` and taking sections gives `φ{n}:Fil_N^nΔ_R{n}→Δ_R{n}`; at `n=0` it is pullback along F then `RΓ(Φ)`. Its filtered refinement goes to `Δ_R^[•−n]{n}`, with `gr_m` the natural map from `fib(Θ+m:Fil_m`^conjΩhat^DHod`→Fil_(m−1)`^conjΩhat^DHod) to `fib(Θ+m` on Ωhat^DHod). For p-regular R with `R/p` regular noetherian this is the Beilinson connective cover. For p-completely smooth `R/W(k)` of dimension `≤d` it is an iso at `n>d`; for `W(k), Δ→^(φ)Δ→W(k)[−1]` is a fibre sequence. Reduction after `φ` equals augmentation followed by Rhat`→Δ`̄. The filtered map factors uniquely through Nygaard completion; the completed functor preserves sifted colimits in filtration-complete complexes and is characterized on polynomial Z-algebras by the same connective cover and shift `•−n`.

The shift `•−n` corrects the `•+n` printed in BL22 Remark 5.7.8, Proposition 5.7.9 and Remark 5.7.10. Absolute `φ` is `Z_p`-linear, without a linearity assertion over a chosen prism.

(BL22, Construction 5.7.1, Remarks 5.7.2 and 5.7.3, Notation 5.7.5; pp. 144, 145; BL22, Remark 5.7.8, Proposition 5.7.9 with its proof, Examples 5.7.6 and 5.7.7; pp. 145, 146; BL22, Remark 5.7.10, §5.7; p. 146.)

*Needs:* [§4.25](#s4-25), [§4.29](#s4-29), [§4.22](#s4-22), [§4.18](#s4-18), [§4.24](#s4-24), [§4.15](#s4-15), [§4.16](#s4-16), [PrismaticCohomology §1.9](../PrismaticCohomology/README.md#s1-9), [§3.14](#s3-14), [§3.10](#s3-10), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, DerivedDeRhamCohomology Layer 2, [§3.15](#s3-15), [§3.22](#s3-22).

- `Prismatic.Absolute.relativeFrobenius`: `Φ:F*H_Δ(R)→H_Δ(R)`.
- `Prismatic.Absolute.frobeniusEnd`: Pullback along F then `RΓ(Φ)`.
- `Prismatic.Absolute.absoluteFrobenius`: `φ{n}:Fil_N^nΔ_R{n}→Δ_R{n}`.
- `Prismatic.Absolute.nygaardToIdealFil`: `Fil_N^mΔ_R{n}→Δ_R^[m−n]{n}`.
- `Prismatic.Absolute.prismaticSheafMap_relativeFrobenius`: `Φ` commutes with ring maps.
- `Prismatic.Absolute.completedNygaard_polynomial_characterization`: The completed sifted-colimit extension of the polynomial Beilinson connective cover of `Δ_R^[•−n]{n}`.
- `Prismatic.Absolute.completedFilteredFrobenius`: `Fil_N`^mΔhat_R`{n}→Δ_R^[m−n]{n}`, using ideal-filtration completeness; at `m=n` compose with completion to obtain the syntomic map.

**Checks.**

- `pr5_frob_fp_iso`: `φ` is an isomorphism of `Δ_{F_p}`.
- `pr5_frob_zp_not_iso`: `φ` is not an isomorphism of `Δ_{Z_p}`: its cofibre is `Z_p[−1]`.
- `pr5_frob_twist_zp_iso`: `φ{n} : Fil^n_N Δ_{Z_p}{n} → Δ_{Z_p}{n}` is an isomorphism for `n > 0`.
- `pr5_frob_filtered_index`: At `m=n=1` the target ideal exponent `m−n` is 0; at `m=2,n=1` it is 1. On the crystalline coefficient model, divided Frobenius sends `p·a` to a, so at `p=2` it sends 6 to 3. Using `m+n` would instead insert the extra factor p² already in the first of these two stages.

**Proof route.** `(a)`: the relative filtered Frobenius and its graded pieces are §3.14 and §3.10 in the animated form of Bhatt–Lurie Proposition 5.1.1; compatibility with base change in the prism globalises them to `D(WCart)` (Construction 5.7.1, Remarks 5.7.2 and 5.7.3).

### Examples

A generalized Cartier divisor allows the zero map from an invertible module; an effective Cartier divisor does not. At `R=F_p`, the Cartier–Witt divisor `p:W(F_p)→W(F_p)` lies on the Hodge–Tate locus after projection to R. Changing a chosen generator by a unit gives an isomorphic divisor, explaining the quotient by `W^×`. The Sen operator on the unit Hodge–Tate object is zero, while a twist changes its weight; an arbitrary non-nilpotent mod-p operator is excluded by the classification’s essential-image condition.

**§4.1.** For a quasiregular semiperfectoid ring R the site `(Spf R)_Δ` has a final object, the prism `(Δ_R, I)` of PrismaticCohomology §2.15 (Bhatt–Scholze F-crystals, Example 2.5; Bhatt–Lurie, Example 4.4.29). For `X = Spf(O_K), K` a complete discretely valued field of mixed characteristic with perfect residue field, the Breuil–Kisin prism `(W(k)[[u]], (E(u)))` and the `A_inf`-prism of `O_C` are objects of `X_Δ` that cover the final object of its topos (Bhatt–Scholze F-crystals, Example 2.6). For an `F_p`-algebra R every object `(A, I, u)` of `(Spf R)_Δ` is crystalline: `I = (p)`.

**§4.4.** `WCart(F_p)` contains the point `(W(F_p), p·) = (Z_p, p·)` and every point of `WCart(F_p)` is isomorphic to it; its automorphism group is trivial, while over `F_p[ε]/(ε²)` the point `(W, V(1)·)` has the non-trivial automorphism `1 + [ε]`. The pullback of `(W(Z/p²), p·)` along `Z/p² → F_p` is `(W(F_p), p·)`. `μ` carries the point `(W(R), V(1)·)` to `(R, 0)`, the generalized Cartier divisor with automorphism group `R^×`.

**§4.5.** Over a local ring R in which p is nilpotent every Cartier–Witt divisor is principalized, and `WCart(R)` is the action groupoid of `W(R)^×` on `WCart_0(R)`. The fibre product `WCart_0 ×_{WCart} WCart_0` is the formal scheme `WCart_0 × W^×`, with the two projections f and u f. For principalized generalized divisors f and g, the isomorphism set is the set of Witt units u satisfying `g = u f`. It can contain several units: at the Hodge–Tate point over dual numbers, `1 + [ε]` is a nonidentity stabilizer. Uniqueness follows when f is a nonzerodivisor, and is not assumed for Cartier–Witt divisors.

**§4.8.** `Spf(Z_p) ×_{WCart} Spf(A) = Spf(A{p/I}^∧)` for a transversal prism `(A, I)`: the universal crystalline prism over `(A, I)`. `ρ_dR : Spf(Z_p) → WCart` is affine and not flat (the crystalline prism is not transversal); the atlas `ρ_{A^0}` and the q-de Rham point are faithfully flat.

**§4.9.** `ρ_A^* O_WCart ≅ A` and `ρ_A^* I ≅ I` in `D̂(A)` for every bounded prism `(A, I)`. I is not isomorphic to `O_WCart`: its restriction to the Hodge–Tate divisor has Sen operator 1. For the de Rham point, `ρ_dR^* E ∈ D̂(Z_p)` is the de Rham specialisation `E_dR` of Bhatt–Lurie Notation 5.4.4.

**§4.10.** A morphism of `D(WCart)` is an isomorphism as soon as its pullback to every bounded prism is; it suffices to test on one nonzero transversal prism, for example the q-de Rham prism. The rule `(A, I) ↦ Δ_{(A/I ⊗^L R)/A}` with its base-change isomorphisms defines an object of `D(WCart)`: the prismatic cohomology sheaf. The rule `(A, I) ↦ A/I` is `ι_* O_{WCart^HT}`, and `(A, I) ↦ I` is the Hodge–Tate ideal sheaf.

**§4.11.** `G_m^♯(Z_p) = 1 + pZ_p` for every prime p, including `p = 2`. Over a Q-algebra `R, G_m^♯(R) = R^×`. In the language of δ-rings: the free `δ-Z_(p)`-algebra on an invertible element x with `φ(x) = 1` is `O(G_m^♯)_(p)`.

**§4.12.** Over an `F_p`-algebra `p = V(1)` in `W(R)`, so the de Rham point and `η` agree there; over `Z/p²` the divisor `(W, p·)` is not in the Hodge–Tate divisor. For a perfectoid ring `Ā = A/I` the perfect prism gives a point `ρ_A^HT : Spf(Ā) → WCart^HT, a G_m^♯`-torsor over `Spf(Ā)` whose trivialisations are the A-linear maps `ξ : I → W(Ā)` with `V(1)·ξ = ψ`|_`I, ψ : A → W(Ā)` the δ-lift of the quotient map (Bhatt–Lurie, Example 3.4.15). `μ^HT ∘ η : Spf(Z_p) → BG_m` is the trivial torsor and `Aut(η) → G_m` is `β`.

**§4.13.** `Θ = 0` on the unit object, `Θ = 1` on the restriction of the Hodge–Tate ideal sheaf, `Θ = n` on `O{n}`. For a quasi-coherent complex F on WCart, the Sen operator of `ι^* F^* F` on its fibre at `η` is canonically trivial (Bhatt–Lurie, Remark 3.6.8). For the p-complete diffracted Hodge complex `η^*` of the Hodge–Tate cohomology sheaf of `R, Θ` acts by `−n` on the n-th graded piece of the conjugate filtration.

**§4.14.** The pair `(Z_p, Θ = n)` corresponds to `O_{WCart^HT}{n}`; the pair `(Z_p, Θ = 1/2)` for odd p satisfies (`b) (Θ^p − Θ` acts by `2^{−p} − 2^{−1} ≡ 0` mod p) and gives an invertible sheaf that is not a twist. The pair `(Z_p[Θ]^∧_p, Θ)` does not satisfy `(b)` and is not in the image. `H^1(WCart^HT, O) = Z_p` is generated by the class of the logarithm `G_m^♯ → G_a`.

**§4.15.** `F(V(1)) = p`: the image of `η` under F is the de Rham point. `F^* O_WCart ≅ O_WCart` and `F^* O_WCart{1} ≅ I^{−1} ⊗ O_WCart{1}`. Over the dual numbers `F(1 + [ε]) = 1`: the non-trivial automorphism of `η` defining the Sen operator dies under F.

**§4.16.** For `E = O_WCart:` a fibre sequence `RΓ(WCart, O) → RΓ(WCart, O) → Z_p[−1]` whose first map is the Frobenius. For E the prismatic cohomology sheaf of R twisted by n: the pullback square of Bhatt–Lurie Corollary 5.4.14 with corner the p-completed derived de Rham complex.

**§4.17.** For 𝔛 smooth over `Spf(Ā)` the complex `RΓ_Δ(𝔛/A)` agrees with the site-theoretic definition of PrismaticCohomology §1.4. For a transversal prism `(A, I), Δ_{(Ā/p)/A}` is `A{p/I}^∧`, the universal crystalline prism over (`A, I) (`Bhatt–Lurie, Example 4.3.16). Affine polynomial test: for `R = Ā[x_1, …, x_d], ξ` is the identity of the limit over `(R/A)_Δ`.

**§4.18.** `H_Δ(Z) = O_WCart` and `Δ_Z = RΓ(WCart, O_WCart); H_Δ` of the zero ring is zero. For a perfectoid ring `Ā = A/I: H_Δ(Ā) = ρ_{A*} A` and `Δ_Ā ≅ A`; in particular `Δ_{F_p} ≅ Z_p`. Affine polynomial test: `ρ_A^* H_Δ(Z[x_1, …, x_d]) = Δ_{Ā[x_1, …, x_d]/A}`, computed by the Čech–Alexander complex of Layer 1.

**§4.19.** For a perfect field k and a k-scheme `X: RΓ_Δ(X) ≅ RΓ_Δ(X/W(k))`. For `O_C` and a formal scheme 𝔛 over `O_C: RΓ_Δ(𝔛) ≅ RΓ_Δ(𝔛/A_inf)`, with the prism of PrismaticCohomology §0.75. For the Breuil–Kisin prism `(W(k)[[u]], (E))` and `R = O_K` the comparison map `Δ_{O_K} → Δ_{O_K/W(k)[[u]]} = W(k)[[u]]` is not claimed to be an isomorphism.

**§4.20.** `Δ_R = 0` when p is invertible in `R; Δ_{Z[1/N]} ≅ Δ_Z` for N prime to p. `Δ_R ≅ Tot` of the derived crystalline cohomology of the animated `F_p`-algebras `R ⊗^L F_p^{⊗k+1}`. Quasisyntomic test: for R p-quasisyntomic with a quasiregular semiperfectoid cover `R → S, Δ_R` is the totalization of the cosimplicial ring `Δ_{S^•}`.

**§4.21.** For `𝔛 = Spf(O_K): RΓ_Δ(Spf O_K)` is the cohomology of the structure sheaf of `(Spf O_K)_Δ`, computed by the Čech nerve of the Breuil–Kisin prism. For `R = Z_p[x_1, …, x_d]^∧` the absolute prismatic complex is the limit of A over all bounded prisms `(A, I)` with a map `R → A/I`. For `𝔛 = Spf(R)` with R quasiregular semiperfectoid both sides are `Δ_R`.

**§4.22.** `Δ̄_Z = RΓ(WCart^HT, O) = Z_p ⊕ Z_p[−1]`, and `Δ̄_Z{n} ≅ (Z_p/n)[−1]` for `n ≠ 0`. For a perfectoid ring R the complex `Ω̂`^DHod_R is the coordinate ring of the `G_m^♯`-torsor of the Hodge–Tate point of R, concentrated in degree 0. For R p-torsion-free with `R/pR` regular Noetherian the conjugate filtration of `Ω̂`^DHod_R is its Postnikov filtration.

**§4.23.** For a smooth `F_p`-scheme the isomorphism is the case `A = Z_p` of PrismaticCohomology §1.14. For `R = F_p[x^{1/p^∞}]/(x): Δ_R ≅ A_crys(R)`, the p-completed divided power envelope of `(x)` in `W(F_p[x^{1/p^∞}])`. For R perfect, `Δ_R = W(R)` with the Hodge–Tate normalization: the forward comparison `γ_R^crys:Δ_R→A_crys(R)` is `W(φ_R)`, and the reverse map `β_R:A_crys(R)→Δ_R` is `W(φ_R^−1)`.

**§4.24.** For `R = Z_p[x_1, …, x_d]^∧: Δ_{F_p[x_1, …, x_d]} ≅` the p-completed de Rham complex of R. For `R = Z: ρ_dR^* O_WCart = Z_p = dR̂_Z` and the fibre sequence of `(4)` is `RΓ(WCart, O) → RΓ(WCart, O) → Z_p[−1]`. For a perfectoid ring `Ā = A/I` the prismatic augmentation `Δ_Ā = A → Ā` is `φ` followed by the quotient map.

**§4.26.** At `p=2, p̃=1+q=[2]_q`. At `p=3, p̃=1+q+q^(-1)=q^(-1)[3]_q`. A chosen torsor trivialization changes under multiplication by `a G_m^♯` point; no uniqueness is claimed.

**§4.27.** For `m=0` the map is `ξ:R→R`. For `m=1` its determinant is 1, including at `p=2`.

**§4.28.** At `m<0` both sides vanish. At `m=0` the statement is completed derived `F_p` descent for R.

**§4.29.** For `R = Z_p[x]^∧: gr^1_N Δ_R ≅ Ω̂^1_R[−1]`, for every prime p. For `R = W(k), k` a perfect field: the Nygaard filtration of `Δ_R` is complete, `gr^0_N Δ_R = W(k)` and `gr^m_N Δ_R ≅ (W(k)/m)[−1]` for `m ≥ 1`. Quasisyntomic test: the filtration of a p-quasisyntomic ring is the totalization of the filtrations of a quasiregular semiperfectoid Čech nerve.

**§4.30.** For a perfectoid ring `Ā = A/I: Fil^m_N Δ_Ā = φ^{−1}(I^m) ⊂ A` and `gr^m_N Δ_Ā` is an invertible Ā-module. For `R = F_p[x^{1/p^∞}]/(x): Fil^m_N Δ_R` is the ideal of `A_crys(R)` generated by `p^a x^b/b!` with `a + b ≥ m`. For a smooth algebra R over a perfect field k the filtration is the classical Nygaard filtration of `WΩ_R`.

### Dependencies

Layers 0, 1, 2, 3; DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, CrystallineCohomology Layer CR.4, DerivedModuleAlgebra §§0.4–0.17, 0.25; DerivedDeRhamCohomology §1.23, §§5.1–5.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, DerivedDeRhamCohomology Layer 2, DerivedDeRhamCohomology §4.2; CrystallineCohomology §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedDeRhamCohomology §§5.1–5.7, SchemeAndStackFoundations §§1.15, 1.18, 1.21, EnhancedDerivedSheaves §§E0.1, E0.4, EnhancedDerivedSheaves §E2.6, EnhancedDerivedSheaves §§E2.1–E2.3, EnhancedDerivedSheaves Layer E3, EnhancedDerivedSheaves §E3.1, EnhancedDerivedSheaves §E5:abstract.4, EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, EnhancedDerivedSheaves §E5:animation.1, [§4.0](#s4-0), SchemeAndStackFoundations §§1.1, 1.18–1.22. Exact inputs are given in the supplier contracts; internal construction dependencies are linked above.

## Layer 5: q-crystalline and q-de Rham comparison

Construct q-divided powers and q-crystalline envelopes over the distinguished cyclotomic prism. Framed Koszul models compute the resulting cohomology, with multiplicativity and naturality as separate comparison obligations.

<a id="s5-0"></a>
<a id="layer-5-framing-foundations"></a>

### 5.0 Complete delta-base framing foundations

*Needs:* AInfCohomology §AI.3.3 (polynomial and Laurent q-integers); PerfectoidQuotients §0.0 (complete étale δ-extension); PrismaticCohomology §0.6 (torsion-free Frobenius reconstruction); DerivedModuleAlgebra §§1.1–1.9 and DerivedDeRhamCohomology Layer 1 (completion); Mathlib `Polynomial.derivative`.

Put `t=q−1, K=(t)` or `(p,t)`. `FramedAlgebra` is a discrete classically and derived K-complete D-algebra P with K-completely ind-étale framing `D[X_s]^∧_K→P` (or toric `X_s^±1`), with discrete source, classically complete `P/t` and `P/(tX_s)`, and each `tX_s` regular. These quotient conditions ensure actual divisibility, not just membership in a closed principal ideal. q becomes a unit after completion. Unique infinitesimal lifting of coordinate scaling constructs commuting D-automorphisms `γ_s`, with `γ_s(X_u)=q^(δ_su)X_u, γ_s−1` divisible by `tX_s`, inverse scaling by `q^−1` and identity modulo t. Coordinate-injective maps intertwine them, and extra target directions fix the image. (SQDEF §3, pp.6–7; BS22 Construction 16.19 and footnote 21, p.114.)

For `K=(p,t)`, assume also D,P p-torsion-free, `P/p` classically K-complete and D a δ-ring with `δ(q)=0`. The compatible semilinear `φ`_□`(X_s)=X_s^p` is a Frobenius lift, hence gives `δ` by Part I PrismaticCohomology §0.6, and commutes with `γ_s`. API: `FramedAlgebra.gamma`, `FramedAlgebra.gamma_X`, `gamma_inverse`, `gamma_comm`, `gamma_sub_mem`, `gamma_unique`, `gamma_map`, `gamma_mod`, `frobenius`, `toQFraming` (retaining the automorphisms and regularity/divisibility data). Complete étale δ-extension itself is imported from PerfectoidQuotients §0.0.

**Checks.**

- On `D[X]^∧, γ(X³)=q³X³` and `γ(X³)−X³=tX(1+q+q²)X²`.
- On the toric framing, `γ(X^(−1))=q^(−1)X^(−1)`, with difference `−q^(−1)tX^(−1)`.
- Reduction of a regular framed input modulo t makes `γ` the identity. The resulting quotient is not itself declared a regular framed input with `t=0`.
- Only p-adic completion is insufficient: in `P=Z_p[[t]][X,1/(X−1)]^∧_p`, the element `qX−1` is not invertible, as one sees modulo p at `X=q^(−1)`. Hence `X↦qX` cannot extend to that localization. With `(p,t)`-completion, `qX−1=(X−1)(1+tX/(X−1))` is a unit and the automorphism exists.
- At `p=2, φγ(X)=q²X²=γφ(X)`. Replacing `φ(q)` by q would violate this equality.

For a D-algebra E with commuting D-automorphisms `γ_s` satisfying the displayed coordinate and divisibility laws, with `tX_s` regular, define `QFraming.qDeriv(s,f)` by `tX_s∇_s(f)=γ_s(f)−f`. These D-linear operators have `∇_s(1)=0, ∇_s(fg)=∇_s(f)g+γ_s(f)∇_s(g), ∇_s(X_s^n)=[n]_qX_s^(n−1), n≥1`, and `∇_s∇_u=∇_u∇_s`. For finite S define `QFraming.qDeRhamComplex` with term `E⊗_D∧^iD^S` and differential `Σ_s∇_s dX_s∧`−. It is D-linear, also linear over common invariants, with the two-direction sign fixed in Conventions; coordinate-injective naturality requires extra automorphisms to fix the image. (SQDEF §3, pp.6–7; BS22 Constructions 16.19–16.20, pp.114–115.)

On the polynomial ring over any commutative D, define `QCrys.polynomialNabla` by `∇_q(Σ a_n X^n)=Σ a_n [n]_q X^(n−1)`, with the constant term sent to zero. This finite-sum definition requires no regularity of `q−1`, including at `q=1`. Its identities are `QCrys.polynomialNabla_spec`, the formula `f(qX)−f(X)=(q−1)X∇_q(f)`, and `QCrys.polynomialNabla_mul`, the twisted Leibniz rule above. The specialisation `QCrys.pr6_qdr_at_q_one_derivative` is `∇_1=Polynomial.derivative`. These are the polynomial instances of the q-derivative laws, before completion. (BS22 Construction 16.19, p.114; SQDEF §3, pp.6–7.)

For finite completely étale framings flat over a t-torsion-free coefficient ring, division before reduction identifies this complex modulo t with completed ordinary de Rham (p-complete when `K=(p,t)`). On tori `dX_s=X_s dlog X_s` identifies it with `Koszul((γ_s−1)/t)`, hence `η_t Koszul(γ_s−1)`. If `φ(q)=q^p, φ(X_s)=X_s^p` and `φγ_s=γ_sφ`, then `∇_sφ=[p]_qX_s^(p−1)φ∇_s`. API: `qDeriv_spec`, `qDeriv_add`, `qDeriv_smul`, `qDeriv_mul`, `qDeriv_X_pow`, `qDeriv_comm`, `qDeRhamComplex_map`, `qDeRhamComplex_mod`, `qDeRhamComplex_toric`, `qDeriv_frobenius`; the associative product is §5.18’s skew product.

**Checks.**

- `∇_q(X²)=(1+q)X` and `∇_q(X)=1`; the twisted product gives `X+qX`, whereas the untwisted Leibniz rule gives 2X.
- `∇_q(q)=0` and `∇_q(qX²)=q(1+q)X`. The automorphisms must fix the coefficient ring.
- With no coordinates the complex is E in degree zero. With two commuting operators, `d¹d⁰=0` with the displayed minus sign, including at `p=2`.
- Identifying `X₀` and `X₁` with X sends the source differential of `X₀X₁` to 2X dX, whereas the target differential is `(1+q)X dX`. Coordinate-injective naturality cannot be extended by that termwise formula.
- For the Laurent chart, the `n=0` monomial has zero logarithmic derivative and the `n=−1` monomial has derivative `−q^(−1)X^(−1)`. The completed two-term monomial blocks use `[n]_q=(q^n−1)/(q−1)` for negative n; no assertion interchanges algebraic H¹ and completion of its cokernel.
- Applying the Frobenius identity to X gives `∇_q(X^p)=[p]_qX^(p−1)`, fixing the factor that would be lost by commuting `φ` and ∇ without adjustment.

The geometric inputs satisfy these sufficient hypotheses when D is complete flat over `A=Z_p[[t]]` and P is K-completely ind-étale over the polynomial or toric source: complete flatness over the noetherian finite-coordinate rings `A[X_s]` gives their flatness, regularity of `p,t,X_s` and completeness of `P/p,P/t,P/(tX_s)`. This includes `A_inf(O_C), q=[ε]`, since `(p,t)` and `(p,ξ)` have the same radical and `(p,t)` is regular. Infinite coordinate sets use degreewise completed free exterior modules with the necessary local finiteness modulo every `K^r`: each input has finitely many nonzero derivative coefficients there. The differential is the summable sum of all coordinate derivatives. Reductions to finite coordinates use varying coefficient algebras and §5.16’s finite-data presentation, rather than finite subsets of operators on a fixed algebra. Finite-presentation ind-étale pieces give this finiteness densely, and continuity extends it; abstract commuting operator families require this summability separately. On q-PD envelopes use §5.15’s continuous operators, without inferring coordinate regularity there from regularity in P.

**Proof route.** Lift scaling and its inverse through the nilpotent K-adic stages; quotient completeness detects divisibility, and torsion-free reconstruction gives the framed δ-structure (BS22 Construction 16.19, p.114). Multiply by the regular `tX_s` to prove the derivative identities; first-order étale lifting gives reduction to ordinary differentials (SQDEF §3, pp.6–7). Sections 5.18 and 5.22 provide the multiplicative and arbitrary derived naturality maps, including when coordinate values coincide.

<a id="s5-1"></a>
<a id="layer-5-q-divided-power-operation"></a>

### 5.1 The q-analogue [p]_q and the operation γ

For `A = Z_p[[q−1]]`, `δ(q) = 0`, use the supplied polynomial `[p]_q`. For δ-A-algebras D define `N(D)=φ^−1([p]_qD)`; when `[p]_q` is regular set `γ(x)=φ(x)/[p]_q−δ(x)`. Its identities and normalization are the API below`; q−1∈N(D), [p]_q≡p` mod `q−1`, and `A/[p]_q=Z_p[ζ_p]` with p a unit times `(q−1)^(p−1)`. Thus the `(p,[p]_q)` and `(p,q−1)` derived completions agree. For any ideal I, the elements satisfying `x∈I, φ(x)∈[p]_qD` and `γ(x)∈I` form an ideal, so these conditions are checked on generators. At `q=1, γ(x)=x^p/p`; no factor `∏_(1≤j<p)[j]_q` is inserted.

The two complete ideals in BS22’s printed comparison are distinct, as above. `δ([p]_q)≡1` is the needed explicit analogue of Example 16.9`(2)`.

(BS22, Notation 16.1; p. 106; BS22, Remark 16.6; p. 108.)

*Needs:* [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77), [PrismaticCohomology §0.3](../PrismaticCohomology/README.md#s0-3), [PrismaticCohomology §0.5](../PrismaticCohomology/README.md#s0-5), [PrismaticCohomology §0.61](../PrismaticCohomology/README.md#s0-61), Mathlib `Polynomial.cyclotomic_prime`, Mathlib `Polynomial.cyclotomic_prime_mul_X_sub_one`, Mathlib `Polynomial.eval_one_cyclotomic_prime`, Mathlib `geom_sum_mul`.

- `QCrys.frobeniusPreimageIdeal`: `N(D)=φ^−1([p]_qD)`.
- `QCrys.gamma`: Unique `γ(x)` with `[p]_q(γ(x)+δ(x))=φ(x)`, assuming regularity.
- `QCrys.pAnalog_mul_gamma`: The defining divisibility identity.
- `QCrys.gamma_add`: `γ(x+y)=γ(x)+γ(y)+((x+y)^p−x^p−y^p)/p`, using the integral polynomial.
- `QCrys.gamma_mul`: `γ(fx)=φ(f)γ(x)−x^pδ(f)`.
- `QCrys.delta_pAnalog_sub_one_mem`: `δ(q)=0 ⇒ δ([p]_q)≡1` mod `[p]_q`.

**Checks.**

- `pr6_gamma_q_sub_one`: If `δ(q) = 0` and `[p]_q` is a nonzerodivisor on D then `q − 1 ∈ N(D)` and `γ(q−1) = (q−1) − δ(q−1)`.
- `pr6_gamma_at_q_one`: If `q = 1` then `p·γ(x) = x^p` for every `x ∈ N(D)`.
- `pr6_gamma_p_padic`: In `Z_p` with `q = 1` (any δ-structure): `p ∈ N(Z_p)` and `γ(p) = p^{p−1}`.
- `pr6_pAnalog_two`: For `p = 2: [2]_q = 1 + q`.
- `pr6_p_not_mem_frobenius_preimage`: In `Z_p[[q−1]]` with `q = 1 + X`, for every δ-structure: p ∉ N; so a definition of N as `(p, q−1)` is wrong.

**Proof route.** `[p]_q` and the prism `(A, ([p]_q))` come from Layer 0's q-de Rham prism. Facts `(i)` and `(ii)` are the identities `Φ_p(q)·(q−1) = q^p − 1` and `Φ_p(1) = p` for the p-th cyclotomic polynomial, which Mathlib has (cyclotomic_prime, cyclotomic_prime_mul_X_sub_one, eval_one_cyclotomic_prime).

<a id="s5-2"></a>
<a id="layer-5-q-pd-pair"></a>

### 5.2 q-PD pairs

A `QPDPair` is a δ-pair `(D,I)` over `(A,(q−1))`, with D,I derived `(p,[p]_q)`-complete, satisfying: `φ(I)⊂[p]_qD` and `γ(I)⊂I; [p]_q` regular with `D/[p]_q` of bounded p-torsion; and `D/(q−1)` p-torsion-free of finite p-complete Tor-amplitude over D. These make `(D,([p]_q))` a bounded prism and D classically adically complete. This is a property, not extra choices. Pair maps preserve `δ,q,I`. The full δ-PD subcategory is `q=1`. Complete flatness over A suffices for the last two conditions; so does a p-complete p-regular D with `q=1`.

Completeness of the ideal is part of the definition (BS22 Remark 16.3`(a)`, Corollary 16.8); neither `γ`-stability nor p-regularity modulo `q−1` may be omitted.

(BS22, Definition 16.2; p. 106; BS22, Definition 16.2, the paragraph after it; p. 106.)

*Needs:* [The q-analogue `[p]_q` and the operation `γ`](#layer-5-q-divided-power-operation), [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72), [PrismaticCohomology §0.73](../PrismaticCohomology/README.md#s0-73), [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77), [PrismaticCohomology §0.81](../PrismaticCohomology/README.md#s0-81), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, Mathlib `IsAdicComplete`.

- `QCrys.QPDPair`: The complete δ-pair with the three stated conditions, using DerivedDeRhamCohomology Layer 1 for Tor-amplitude.
- `QCrys.QPDPair.Hom`: δ-maps preserving q and the ideals.
- `QCrys.QPDPair.prism`: Its bounded prism `(D,([p]_q))`.
- `QCrys.QPDPair.prism_I`: The prism ideal `([p]_q)`.
- `QCrys.QPDPair.IsDeltaPD`: `q=1`.
- `QCrys.QPDPair.frobenius_mem`: `φ(I)⊂[p]_qD`.
- `QCrys.QPDPair.gamma_mem`: `γ(I)⊂I`.
- `QCrys.QPDPair.isAdicComplete`: Classical IsAdicComplete, equivalent here to derived completeness.

**Checks.**

- `pr6_qpd_pair_initial`: There is a q-PD pair on `Z_p[[X]]` with `q = 1 + X` and `I = (X)`.
- `pr6_qpd_pair_classical`: There is a q-PD pair on `Z_p` with `q = 1` and `I = (p)`: the classical PD pair `(Z_p, (p))`.
- `pr6_qpd_pair_zero_ideal`: There is a q-PD pair on `Z_p` with `q = 1` and `I = 0`.
- `pr6_qpd_pair_p_not_mem`: No q-PD pair on `Z_p[[X]]` with `q = 1 + X` has `p ∈ I`.
- `pr6_qpd_pair_sub_one_frobenius`: In every q-PD pair, `φ(q−1) = [p]_q·(q−1)`.

**Proof route.** State the data (D, I, the δ-A-algebra structure) and the conditions; by `(1)` and `(2)` the operation `γ` of The q-analogue `[p]_q` and the operation `γ` is defined on I.

<a id="s5-3"></a>
<a id="layer-5-delta-pd-pairs"></a>

### 5.3 δ-PD pairs and reduction modulo q − 1

A δ-ring D with `q=1` and ideal I is a δ-PD pair iff D is p-regular and D,I are p-adically complete with `x^n/n!∈I` for every `x∈I,n>0`. Reduction (`D,I)↦(D/(q−1),I` mod `q−1`) is left adjoint to inclusion of δ-PD pairs into q-PD pairs. Thus δ-PD pairs are precisely complete p-regular PD pairs carrying the specified δ-structure (DerivedDeRhamCohomology Layer PD).

Divided powers must lie in I, not just D; p-regularity makes them unique.

(BS22, Remark 16.3; p. 107; BS22, Remark 16.4; p. 107.)

*Needs:* [PrismaticCohomology §1.10](../PrismaticCohomology/README.md#complete-base-change-totalization), [§5.2](#s5-2), [The q-analogue `[p]_q` and the operation `γ`](#layer-5-q-divided-power-operation), Mathlib `DividedPowers`, DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, [PrismaticCohomology §0.74](../PrismaticCohomology/README.md#s0-74).

**Proof route.** (⇐ of `(a)`) With `q = 1` one has `[p]_q = p` and `γ(x) = x^p/p`, which lies in I by `(ii); D` is p-torsion-free and p-complete, so `(D, (p))` is a bounded prism, and `D/(q−1) = D` gives `(3)`.

<a id="s5-4"></a>
<a id="layer-5-q-pd-homological-properties"></a>

### 5.4 Homological properties of q-PD pairs

For q-PD `(D,I), D` is derived f-complete for `f∈I`. Completed reduction modulo `q−1` is conservative on complete complexes and commutes with cosimplicial totalizations in `D≥0`. If `I₀⊃(q−1)` satisfies the algebraic q-PD conditions and D is complete, completing `I₀` inside D gives a q-PD pair. Likewise, completely flat δ-A extension to a complete D′, followed by completing the image ideal, preserves q-PD pairs.

`(3)`: the cosimplicial complexes must be derived `(p,[p]_q)`-complete; the source’s abbreviated term omits the completeness condition (the corresponding correction). `(4)`: the source states it for a q-PD pair `(D, I)`; since the ideal of a q-PD pair is already derived complete that statement is empty, and the proof of `(5)` and of Theorem 16.17 apply `(4)` to an ideal that is not known to be complete. The target states the form that the printed proof of `(4)` proves. Completion, conservativity (derived Nakayama) and Tor-amplitude are imported from DerivedModuleAlgebra §§1.1–1.8 and DerivedDeRhamCohomology Layer 1. The totalization exchange is `Prismatic.completeBaseChange_totalization` supplied by [PrismaticCohomology §1.10](../PrismaticCohomology/README.md#complete-base-change-totalization), with the hypotheses verified in [the q-PD application](#complete-base-change-totalization): §5.2 supplies finite complete Tor-amplitude for `D→D/(q−1)`, and §5.10 supplies complete, discrete Čech terms.

(BS22, Lemma 16.5 and its proof; p. 107.)

*Needs:* [PrismaticCohomology §1.10](../PrismaticCohomology/README.md#complete-base-change-totalization), [§5.2](#s5-2), [The q-analogue `[p]_q` and the operation `γ`](#layer-5-q-divided-power-operation), [§5.3](#s5-3), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, [PrismaticCohomology §0.81](../PrismaticCohomology/README.md#s0-81).

**Proof route.** `(1)` For `f ∈ I, φ(f) = f^p + pδ(f) ∈ [p]_q D`, so `f^p ∈ (p, [p]_q)`; derived `(p,[p]_q)`-completeness gives derived f^p-completeness, hence derived f-completeness.

<a id="s5-5"></a>
<a id="layer-5-smallest-largest-q-pd-ideals"></a>

### 5.5 Higher q-divided powers and the smallest and largest q-PD ideals

For δ-A-algebras, `[p]_qz=φ(f)` implies `φ(z−δ(f))∈[p]_qD`. Hence `γ` preserves `N(D)` when `[p]_q` is regular. For complete D satisfying the last two q-PD conditions, `(q−1)D` is the smallest and `N(D)` the largest q-PD ideal. In particular `(A,(q−1))` is initial among q-PD pairs, and `(D,(q−1))` is q-PD for complete completely flat `D/A`.

`(a)` is stated for every δ-A-algebra, with no torsion-freeness, flatness or completeness. The source states it for `[p]_q`-torsion-free D and proves it by reduction to a universal case whose flatness is taken from Proposition 3.13; that proposition concerns the completed envelope, so the printed argument covers derived `(p,[p]_q)`-complete D, which is all the source uses. The proof steps give a direct argument. `(b)`: the coefficient algebra must carry a compatible δ-structure, a condition omitted in the source’s notation. A q-PD ideal of D is an ideal I such that `(D, I)` is a q-PD pair.

(BS22, Lemma 16.7 and its proof; p. 108; BS22, Corollary 16.8 and its proof; p. 109; BS22, Example 16.9 `(1); p`. 109.)

*Needs:* [The q-analogue `[p]_q` and the operation `γ`](#layer-5-q-divided-power-operation), [§5.2](#s5-2), [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77), [PrismaticCohomology §0.86](../PrismaticCohomology/README.md#s0-86), [PrismaticCohomology §0.3](../PrismaticCohomology/README.md#s0-3), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

**Proof route.** `(a)`, direct argument: apply `δ` to `[p]_q·z = φ(f)` and use `δ∘φ = φ∘δ` and the product formula for `δ: φ(δ(f)) = δ(z)·φ([p]_q) + z^p·δ([p]_q)`. With `φ([p]_q) = [p]_q^p + pδ([p]_q)` this gives `φ(z) − φ(δ(f)) = (1 − δ([p]_q))·φ(z) − δ(z)·[p]_q^p`, which lies in `[p]_q D` by fact `(iv)` of The q-analogue `[p]_q` and the operation `γ`.

<a id="s5-6"></a>
<a id="layer-5-ainf-q-pd-pair"></a>

### 5.6 The q-PD pair (A_inf, (ξ))

In the completed perfection `A∞` of the q-prism, `ξ=φ^−1([p]_q)` gives q-PD `(A∞,(ξ))`. For characteristic-zero perfectoid C with chosen compatible primitive p-power roots, set `Ainf=W`(O_Cflat), `q=[ε]`. This is perfect and flat over `Z_p[[q−1]]; ξ=Σ_(i<p)[ε^(i/p)]` generates `ker θ` and gives q-PD `(Ainf,(ξ))`, with quotient `O_C`. Also `ξtilde=φξ=[p]_q` generates `ker(θφ^−1)`, and `q−1=(q^(1/p)−1)ξ`. The automorphism `φ` carries the prism `(ξ)` to `([p]_q)`.

The ideals do not depend on the cyclotomic choice. PerfectoidSpaces supplies `Ainf, θ` and its perfect prism.

(BS22, Example 16.9 `(2); p`. 109; BS22, Notation 17.1; p. 117.)

*Needs:* [§5.5](#s5-5), [§5.2](#s5-2), [The q-analogue `[p]_q` and the operation `γ`](#layer-5-q-divided-power-operation), [PrismaticCohomology §0.83](../PrismaticCohomology/README.md#s0-83), [PrismaticCohomology §0.75](../PrismaticCohomology/README.md#s0-75), [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84), PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, Mathlib `WittVector.teichmuller`, Mathlib `WittVector.fontaineTheta`.

**Proof route.** Conditions `(2)` and `(3): A_∞` and `A_inf` are `(p,[p]_q)`-completely flat over `A (A_∞` is a completed colimit along the flat Frobenius of A; for `A_inf, (p, q−1)` is a regular sequence and `A_inf/(p, q−1) = O_C^♭/(ε−1)` is flat over `F_p`), so the remark after Definition 16.2 applies; flatness over the noetherian ring A follows from complete flatness and derived completeness (the implication quoted in Notation 17.1; DerivedDeRhamCohomology Layer 1).

<a id="s5-7"></a>
<a id="layer-5-q-pd-envelope"></a>

### 5.7 q-PD envelopes

For q-PD `(D,I)`, complete completely flat δ-D-algebra P and finite completely D-regular sequence `x_i`, put `J=(IP,x_i)`, the algebraically generated ideal. The completed animated δ-envelope `E=P{φ(x_i)/[p]_q}` is discrete, completely flat over D and `[p]_q`-regular. The smallest complete `γ`-stable ideal K containing the image of J makes `(E,K)` q-PD, universally among q-PD pairs receiving `(P,J)`. If the discrete quotient `P/J` is derived p-complete, the natural map `P/J→E/K` is an isomorphism. Write `E=D_(J,q)(P)`; it is independent of generators. The construction extends to Zariski-locally such ideals and completed filtered colimits of such pairs; the uncompleted quotient equivalence retains the hypothesis that the final `P/J` is derived p-complete.

`(D, I)` is a q-PD pair; P is derived `(p,[p]_q)`-complete and `(p,[p]_q)`-completely flat over D; the sequence is `(p,[p]_q)`-completely regular relative to D (DerivedDeRhamCohomology Layer 1's notion, BS22 Definition 2.42). Completeness of P alone does not imply completeness of `P/J`; the extended ideal IP need not be closed. The completeness hypothesis on `P/J` is additional to the printed Lemma 16.10(2). Since `q−1∈J`, derived p-completeness of `P/J` is equivalent to derived `(p,[p]_q)`-completeness. Equivalently, J is derived complete as a P-submodule, by the fibre sequence `J→P→P/J`. For a completed ideal, its construction must identify this discrete complete quotient; no arbitrary derived completion is presumed discrete. Section 5.10 supplies that identification for the locally regular and completed-colimit presentations used there. Free adjunction of elements to simplicial δ-rings is Layer 0's Simplicial commutative δ-rings.

(BS22, Lemma 16.10 `(1)`–`(2)` and its proof, with the quotient-completeness hypothesis above; pp. 110–111; BS22, Construction 16.13 and Remark 16.16; pp. 111–112.)

*Needs:* [§5.2](#s5-2), [§5.4](#s5-4), [§5.5](#s5-5), [The q-analogue `[p]_q` and the operation `γ`](#layer-5-q-divided-power-operation), [PrismaticCohomology §0.86](../PrismaticCohomology/README.md#s0-86), [PrismaticCohomology §0.60](../PrismaticCohomology/README.md#s0-60), [PrismaticCohomology §0.69](../PrismaticCohomology/README.md#s0-69), [PrismaticCohomology §0.81](../PrismaticCohomology/README.md#s0-81), DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

- `QCrys.envelope`: The specified envelope `D_(J,q)(P)`.
- `QCrys.envelopeMap`: `P→E`.
- `QCrys.envelopePair`: Its q-PD pair `(E,K)`.
- `QCrys.envelopeMap_delta`: The structural map preserves `δ`.
- `QCrys.envelope_frobenius_mem`: `φ(x_i)∈[p]_qE`.
- `QCrys.envelopeMap_mem`: J maps into K.
- `QCrys.envelopeQuotientEquiv`: `P/J≃E/K`, assuming the discrete quotient `P/J` is derived p-complete, also in the locally regular and completed-colimit cases.
- `QCrys.envelopeLift`: The universal extension of q-preserving δ-maps taking J into a target q-PD ideal.
- `QCrys.envelopeLift_comp`: The lift restricts to the given map on P.
- `QCrys.envelopeLift_unique`: Uniqueness among δ-maps.
- `QCrys.envelopeLift_isDeltaHom`: The lift preserves `δ` after completion by δ-continuity.
- `QCrys.envelopeLift_map_I`: The lift sends K into the target ideal, so is a pair map.
- `QCrys.envelopePair_q`: The structural maps preserve the specified q and base.

**Checks.**

- `pr6_envelope_empty_sequence`: For the empty sequence and `P = D`, the map `D → D_{I,q}(D)` is bijective.
- `pr6_envelope_frobenius_divisible`: In the envelope of a one-element sequence x, there is z with `[p]_q·z = φ(x)` and `γ(x) = z − δ(x)` lies in K.
- `pr6_envelope_universal_identity`: The lift of the envelope map itself is the identity of `D_{J,q}(P)`.
- `pr6_envelope_not_surjective`: For `D = Z_p[[q−1]]` and `x = X: X^p` is not divisible by `[p]_q` in the polynomial ring `D[X]`, nor in its completion (so `P → D_{J,q}(P)` is not an isomorphism, and a definition of the envelope as P itself is wrong).
- With `q=1`, let `M=∏_(n≥0)Z_p`, with standard coordinate vectors `e_n`, `D=Z_p⋉M`, `I=0⊕M`, `M²=0`, and `φ(a,m)=(a,0)`. The induced `δ(a,m)=((a−a^p)/p,−a^(p−1)m)` gives a q-PD pair: D and I are p-complete and p-torsion-free, and `φ(I)=γ(I)=0`. For `P=D⟨X⟩`, `δ(X)=0` and the empty sequence, `E=P`, but `K=closure(IP)` strictly contains `J=IP`. Indeed `f=Σ_(n≥0)p^n e_n X^n` lies in K, whereas coefficients of any element of IP lie in a finitely generated `Z_p`-submodule of M; the vectors `p^n e_n` are linearly independent over `Q_p`. Thus the map `P/J→E/K` has a nonzero kernel, for every prime including 2.
- For `P=D⟨X₁,…,X_r⟩` and `J=ker(P→D/I)` given by `X_i↦0`, the quotient is the derived p-complete ring `D/I`. The equivalence applies to this complete kernel, including when `(IP,X₁,…,X_r)` requires completion.

**Proof route.** Let Ẽ be the derived `(p,[p]_q)`-complete simplicial commutative δ-P-algebra freely adjoining `φ(x_i)/[p]_q`. Complete flatness of Ẽ over D may be checked after derived base change along `D → D/(q−1)` (Homological properties of q-PD pairs); there `[p]_q = p` and the claim is BS22 Corollary 2.44 with Lemma 2.43 (Layer 0), the sequence `φ(x_i) ≡ x_i^p` being p-completely regular relative to `D/(q−1)`.

For the quotient assertion with `P/J` derived complete, the completed PD-envelope map modulo `q−1` gives a surjection `E→P/J`. Its kernel is derived complete by the fibre sequence and is `γ`-stable. The divided-power generation argument of BS22 Lemma 16.11 identifies it with K. Without quotient completeness, construct K by completing the algebraic `γ`-stable ideal, using §5.4; universality uses completeness of the target ideal and asserts no uncompleted quotient equivalence.

<a id="s5-8"></a>
<a id="layer-5-q-pd-envelope-base-change"></a>

### 5.8 q-PD envelopes: base change, PD envelopes and prismatic envelopes

Under §5.7’s hypotheses, envelopes commute with completed derived q-PD base change. Modulo `q−1` they are the p-completed PD envelope of J mod `q−1` relative to (`D/(q−1),I` mod `q−1`), with K the complete PD ideal. Quotient equivalences with an algebraic `P′/J′` after base change retain §5.7’s derived p-completeness hypothesis on that quotient. For p-regular `Z_p`-algebras B and I generated by a mod-p regular sequence, the PD ideal of `D_I(B)` is the smallest containing I and closed under `f↦f^p/p`. The q-PD envelope is also the prismatic envelope of `(P,([p]_q,φ(x_i)))` over `(D,([p]_q))`; at `q=1` this is `P{φ(x_i)/p}^∧`, the p-completed PD envelope.

`(b)`: the comparison uses the p-completed PD envelope. Completion is implicit in the source statement but explicit in its proof and Remark 16.16 (the corresponding correction). `(c)`: regularity of the ideal modulo p means generation by a sequence regular modulo p, the precise interpretation used here. `(d)` is not printed as a statement; it is the content of the first step of the proof of Lemma 16.10 and of the reference to Proposition 3.13 in the proof of Lemma 16.7. PD envelopes and their ideals are owned by DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21.

(BS22, Lemma 16.10 `(3); p`. 110; BS22, Lemma 16.11 and its proof; p. 111.)

*Needs:* [§5.7](#s5-7), [§5.3](#s5-3), [PrismaticCohomology §0.69](../PrismaticCohomology/README.md#s0-69), [PrismaticCohomology §0.86](../PrismaticCohomology/README.md#s0-86), DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

**Proof route.** `(a) E` is the free derived complete δ-P-algebra on the elements `φ(x_i)/[p]_q`, and complete regularity relative to the base is stable under base change, so the construction commutes with completed base change; K′ is identified by the universal property.

<a id="s5-9"></a>
<a id="layer-5-q-crystalline-site"></a>

### 5.9 The q-crystalline site and q-crystalline cohomology

For q-PD `(D,I)` and p-completely smooth `R/D/I`, define (`R/D)_(`q-crys) as the opposite of relative q-PD thickenings `(E,J)` with `R→E/J`. Pair maps commute with D and R. Give it the indiscrete topology and structure presheaf `O(E,J)=E`; define `qΩ_(R/D)=RΓ(O)`, the derived limit, a complete `E∞`-D-algebra. The `φ_D`-semilinear Frobenius is induced by `φ_E`. Its evaluation, cup product and variance are the API below.

`(D, I)` is a q-PD pair; R is p-completely smooth over `D/I`: derived p-complete with `R ⊗^L_{D/I} (D/I)/p` smooth over `(D/I)/p`. The structure presheaf has the D-algebra structure; the different coefficient-ring letter in the source is a notation error. The objects only carry a map `R → E/J`; it need not be an isomorphism. The category is not small; the cohomology is computed by a weakly initial object and its Čech nerve (Čech–Alexander complexes for q-crystalline cohomology), which is how the derived limit is given a meaning.

(BS22, Definition 16.12; p. 111.)

*Needs:* [§5.2](#s5-2), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, EnhancedDerivedSheaves §E5:abstract.2.

- `QCrys.Thickening`: Relative q-PD thickenings with `R→E/J`.
- `QCrys.Thickening.Hom`: Pair maps commuting with D,R.
- `QCrys.Thickening.base`: `(D,I)`, initial algebraically and terminal in the site, for `R=D/I`.
- `QCrys.qCrystallineCohomology`: The derived limit `qΩ`.
- `QCrys.qCrystallineFrobenius`: Its `φ_D`-semilinear Frobenius.
- `QCrys.qCrystallineEval`: The canonical evaluation `qΩ→E`.
- `QCrys.qCrystallineMap`: Variance under `R→R′`.
- `QCrys.qCrystallineBaseIso`: `qΩ_(D/I)/D≃D[0]`.
- `QCrys.qCrystallineUnit`: `D[0]→qΩ`.
- `QCrys.qCrystallineCup`: The cup product from multiplication on O.
- `QCrys.qCrystallineAlgebraLaws`: `E∞ unit`, associativity and symmetry; evaluations and variance preserve them.
- `QCrys.qCrystallineMap_id`: Identity acts identically.
- `QCrys.qCrystallineMap_comp`: Composition law.
- `QCrys.thickeningValueMap`: The specified ring map `E[0]→E′[0]`.
- `QCrys.qCrystallineEval_natural`: eval_T followed by the value map equals eval_T′.
- `QCrys.thickeningValueFrobenius`: The actual semilinear `φ_E` on each value.
- `QCrys.qCrystallineEval_frobenius`: eval_T followed by `φ_E` equals `φ_qΩ` followed by `φ_*`eval_T.
- `QCrys.qCrystallineBasePairMap`: For a q-PD base map and compatible `R→R′`, the natural restriction-of-scalars map; its completed adjoint is a comparison map, with no unconditional base-change iso.

**Checks.**

- `pr6_qcrys_base`: For `R = D/I` the evaluation map at the thickening `(D, I)` is an isomorphism `qΩ_{(D/I)/D} ≅ D`.
- `pr6_qcrys_eval_natural`: Evaluation maps are compatible with morphisms of thickenings: for a morphism `(E, J) → (E′, J′)` the evaluation at E′ factors through the evaluation at E.
- `pr6_qcrys_map_id`: The map induced by the identity of R is the identity of `qΩ_{R/D}`.
- `pr6_qcrys_not_structure_ring`: Evaluation at a thickening is not an isomorphism in general: over `D = Z_p[[q−1]]` there are R and a thickening, namely `R = Z_p⟨T⟩` and `(D⟨T⟩, (q−1))`, for which `qΩ_{R/D} → D⟨T⟩` is not an isomorphism.

**Proof route.** Objects, morphisms and the topology are as stated; with the indiscrete topology the cohomology of a presheaf is its derived limit over the opposite category.

<a id="s5-10"></a>
<a id="layer-5-q-crystalline-cech-alexander"></a>

### 5.10 Čech–Alexander complexes for q-crystalline cohomology

For smooth `R/D/I`, choose a completed polynomial presentation `P→R`, kernel `J₀`, and let F be its free completed δ-D-algebra. On their completed Čech nerves `P^•,F^•` put `J^•=(J₀^•F^•)^∧`. Then `F^•/J^•` is the derived p-completed Čech nerve of `R→F/J`, and the q-PD envelopes form the Čech nerve of the weakly initial thickening `D_(J,q)(F)`. Their totalization is `qΩ`, their terms completely flat over D, their `φ` the cohomological Frobenius. For any complete (ind-)smooth δ-presentation `P→R`, its own envelope Čech nerve already computes `qΩ` (the small variant).

Envelope existence uses §5.7’s locally regular and completed-colimit extension with the complete ideal `J^n`, not merely `J₀^nF^n`. Write `F^n` as a completed polynomial `P^n`-algebra on its higher δ-coordinates `U_n`. Prove that `Q^n=(R[U_n])^∧_p`, with derived completion, is discrete and derived p-complete, and that `J^n=ker(F^n→Q^n)`, so `F^n/J^n=Q^n`. Discreteness follows from the derived p-completeness of R: its p-adic Tate module `T_p(R)=lim_(×p)R[p^m]` vanishes, hence so does that of the free R-module `R[U_n]`; the Koszul completion tower then has no negative cohomology. Completion preserves the surjection to the quotient, identifying its kernel with the completed extended ideal.

This supplies §5.7’s quotient hypothesis after local regular presentations and completed filtered colimits, without assuming it for the algebraic extended ideals at intermediate stages. In the small variant the augmented quotient is R itself, and its kernel is derived complete by `J^n→P^n→R`. Choosing polynomial variables indexed by R gives strict functoriality; the small variant is compared through crystalline cohomology.

(BS22, Construction 16.13; pp. 111–112; BS22, Remark 16.16; p. 112; Stacks, Tag [0920](https://stacks.math.columbia.edu/tag/0920), the Koszul description of derived completion.)

*Needs:* [§5.9](#s5-9), [§5.7](#s5-7), [§5.8](#s5-8), [§5.4](#s5-4), [PrismaticCohomology §0.55](../PrismaticCohomology/README.md#s0-55), [PrismaticCohomology §1.7](../PrismaticCohomology/README.md#s1-7), EnhancedDerivedSheaves Layer E2, CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

- `QCrys.cechAlexanderComplex`: The envelope cosimplicial cochain complex.
- `QCrys.cechAlexanderIso`: Its identification with `qΩ`.
- `QCrys.cechAlexanderZero`: The degree-zero thickening.
- `QCrys.cechAlexanderZero_weaklyInitial`: Every thickening receives a map from it.
- `QCrys.cechAlexanderSmallComplex`: The small envelope Čech complex of a δ-presentation.
- `QCrys.cechAlexanderSmallIso`: It computes `qΩ` for completely (ind-)smooth presentations.

**Checks.**

- `pr6_cech_alexander_independent`: The complexes of two presentations of R have isomorphic images in `D(D)`.
- `pr6_cech_alexander_weakly_initial_base`: The thickening `(D, I)` of `D/I` receives a morphism from the term of degree 0 of every presentation of `D/I`.
- `pr6_cech_alexander_base_presentation`: For `R = D/I` and the presentation `P = D` the complex represents D in degree 0.
- `pr6_cech_alexander_not_cech_nerve`: The Čech nerve `P^•` of `D → P` without envelopes does not compute `qΩ_{R/D}`: for a faithfully flat P its totalisation is D in degree 0, while over `Z_p[[q−1]]` there is R (namely `Z_p⟨T⟩`) with `qΩ_{R/D}` not isomorphic to D in degree 0.
- For the square-zero base of §5.7 and the presentation `P=D⟨X⟩→R=Z_p⟨X⟩`, the kernel is `closure(IP)`. The restricted series `Σ p^n e_n X^n` vanishes in the complete quotient; retaining only IP would give the wrong degree-zero quotient.

**Proof route.** `(1)`: push out `P^• → F^•` along `P^• → P` and then along `P → R`. `(2)`: the construction carrying a surjection `(P → R)` to the thickening `D_{J,q}(F)` takes tensor products of the input to coproducts of algebraic q-PD thickenings, hence products in the opposite site (universal properties of the free δ-algebra and of the q-PD envelope), so the cosimplicial object is a Čech nerve; this is the argument of BS22 Constructions 4.17–4.18 (Layer 1's Weakly initial objects and Čech–Alexander complexes).

<a id="s5-11"></a>
<a id="layer-5-q-crystalline-crystalline-comparison"></a>

### 5.11 q-crystalline and crystalline cohomology

For q-PD `(D,I)` and smooth `R/D/I, qΩ_(R/D)⊗`̂^`L_D D/(q−1)≃RΓ_crys(R/(D/(q−1)))` as E∞-algebras, relative to the reduced PD thickening. Completed reduction detects equivalences by §5.4; hence `qΩ` has Zariski descent and gives `qΩ_(X/D)` for smooth formal `X/D/I`, reducing to the pushforward of the crystalline structure sheaf.

`(D, I)` is a q-PD pair; R is p-completely smooth over `D/I`. The cohomology object in the proof is `qΩ_{R/D}`; the source abbreviation omits its relative input. Crystalline cohomology over a p-adic PD base and its computation by PD envelopes are owned by CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10 and CR.0. The ringed q-crystalline site of a non-affine formal scheme (Remark 16.15 `(2)`) is not developed in the source and is not used.

(BS22, Theorem 16.14 and its proof; p. 112; BS22, Remark 16.15 `(1); p`. 112.)

*Needs:* [PrismaticCohomology §1.10](../PrismaticCohomology/README.md#complete-base-change-totalization), [§5.10](#s5-10), [§5.8](#s5-8), [§5.4](#s5-4), [§5.3](#s5-3), CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21.

**Proof route.** Compute `qΩ_{R/D}` by the cosimplicial ring `D_{J^•,q}(F^•)` of Čech–Alexander complexes for q-crystalline cohomology. The completed base change − ⊗̂^`L_D D/(q−1)` commutes with the totalisation (§5.4, applying `Prismatic.completeBaseChange_totalization` from [PrismaticCohomology §1.10](../PrismaticCohomology/README.md#complete-base-change-totalization)), so the left side is computed by the cosimplicial ring `D_{J^•,q}(F^•) ⊗`̂^`L_D D/(q−1)`.

<a id="s5-12"></a>
<a id="layer-5-q-pd-thickening-invariance"></a>

### 5.12 Invariance under q-PD thickenings of the base

For q-PD ideals `J⊂I` in the same D, smooth `R/D/I` and a smooth lift Rtilde/`D/J`, there is a canonical `qΩ`_(Rtilde/`D)≃qΩ_(R/D`). It comes from the thickening functor `(E,K)↦(E,K_I)`, where `K_I` is the completed ideal generated by K and IE and `R=`Rtilde⊗̂_`(D/J)D/I→E/K_I`; the underlying δ-D-algebra E is unchanged.

The site object has Rtilde`→E/K`, not the reverse isomorphism printed in BS22’s proof. Since the functor leaves E fixed, the identification preserves products and `φ`.

(BS22, Theorem 16.17; p. 113; BS22, Theorem 16.17, proof; p. 113.)

*Needs:* [§5.10](#s5-10), [§5.9](#s5-9), [§5.7](#s5-7), [§5.4](#s5-4), [The q-analogue `[p]_q` and the operation `γ`](#layer-5-q-divided-power-operation).

**Proof route.** `(E, K + I·E)` satisfies condition `(1)` of q-PD pairs: it holds on K and on the image of I, hence on the ideal they generate by fact (vii) of The q-analogue `[p]_q` and the operation `γ`; the derived complete ideal `K_I` it generates is then a q-PD ideal by Homological properties of q-PD pairs `(4)`.

<a id="s5-13"></a>
<a id="layer-5-q-crystalline-prismatic-comparison"></a>

### 5.13 q-crystalline and prismatic cohomology

For q-PD `(D,I)` and smooth `R/D/I`, put `R¹=R⊗`̂_`(D/I,φ_D)D/[p]_q; φ_D(I)⊂[p]_q` makes this defined and smooth. There is an `E∞`, Frobenius-compatible iso `Δ_(R¹/D)≃qΩ_(R/D)`, natural in R and the pair. Its site functor sends `(E,J)` to `(E,([p]_q))`, with `R¹→E/[p]_q` induced by `φ_E` on `R→E/J`.

`(D, I)` is a q-PD pair; R is p-completely smooth over `D/I`. The Frobenius twist `R^{(1)}` is part of the statement: R itself is not an algebra over `D/([p]_q)` unless `q = 1`. The printed proof writes '`E → E/J ≅ R`'; objects carry only a map `R → E/J`, which suffices. The printed proof identifies the source and the target of `α` modulo `q − 1` with crystalline cohomology and does not say that the reduction of `α` is that identification; the comparison must identify this reduced map with the crystalline comparison by its evaluation maps on the same envelope Čech nerve. The reduction to `I = (q−1)` uses a lift of R to a p-completely smooth `D/(q−1)`-algebra, which the source uses implicitly.

(BS22, Theorem 16.18; p. 113; BS22, Theorem 16.18, proof; p. 113.)

*Needs:* [§5.12](#s5-12), [§5.11](#s5-11), [§5.10](#s5-10), [§5.9](#s5-9), [§5.4](#s5-4), [PrismaticCohomology §1.2](../PrismaticCohomology/README.md#s1-2), [PrismaticCohomology §1.4](../PrismaticCohomology/README.md#s1-4), [PrismaticCohomology §1.21](../PrismaticCohomology/README.md#s1-21), [PrismaticCohomology §1.14](../PrismaticCohomology/README.md#s1-14), [PrismaticCohomology §1.9](../PrismaticCohomology/README.md#s1-9), [PrismaticCohomology §0.74](../PrismaticCohomology/README.md#s0-74), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

**Proof route.** Construction of `α`: for `(E, J)` in the site, `φ_E(J) ⊂ [p]_q E`, so `φ_E` induces `a φ_D`-linear map `R → E/J → E/([p]_q)`, hence a D-linear map `R^{(1)} → E/([p]_q)` and an object of the prismatic site of `R^{(1)}` over `(D, ([p]_q))`; evaluating the prismatic structure sheaf gives `α`.

<a id="s5-14"></a>
<a id="layer-5-framed-q-pd-datum"></a>

### 5.14 Framed D-algebras and framed q-PD data

Take q-PD `(D,I)` flat over `A=Z_p[[q−1]]` and smooth `R/D/I`. Import §5.0’s complete ind-étale framing `D[X_s]^∧→P` and its `γ_s,∇_s`, twisted Leibniz and q-de Rham complex. Add the unique δ-D-structure `δ(X_s)=0`, preserved by `γ_s; P` is A-flat, so `(q−1)X_s` is regular. A framed datum `(P,S,J)` adds a surjection `P→R` with kernel J. Its maps preserve coordinates by an injection `S→S′` and send J into J′. The named datum also retains the étale reduction and complete flatness hypotheses below.

The topology is `(p,q−1)`, not merely p-adic: scaling must be infinitesimally close. The map need not be étale, but its coordinate map is injective; merging `X₀,X₁↦X` compares 2X with `(1+q)X` and fails. The quotient `P/J=R` is discrete and derived p-complete, so `J=ker(P→R)` is derived complete and satisfies §5.7’s quotient hypothesis.

(BS22, Construction 16.19; p. 114; BS22, Construction 16.20, opening; p. 114.)

*Needs:* [§5.2](#s5-2), [§5.7](#s5-7), [§5.0](#s5-0), [PrismaticCohomology §0.6](../PrismaticCohomology/README.md#s0-6), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

- `QCrys.FramedAlgebra`: §5.0’s framed algebra with the added `δ(X_s)=0`.
- `QCrys.FramedAlgebra.delta_coord`: `δ(X_s)=0`.
- `QCrys.QWFramedAlgebra.gamma_coord_self`: `γ_s(X_s)=qX_s`.
- `QCrys.QWFramedAlgebra.gamma_coord_of_ne`: `γ_s(X_t)=X_t, t≠s`.
- `QCrys.QWFramedAlgebra.gamma_comm`: `γ_sγ_t=γ_tγ_s`.
- `QCrys.FramedAlgebra.gamma_delta`: `γ_s` preserves `δ`.
- `QCrys.QWFramedAlgebra.sub_one_mul_coord_mul_nabla`: `(q−1)X_s∇_s(f)=γ_s(f)−f`.
- `QCrys.FramedDatum`: `(P,S,J)`, retaining coefficient flatness, `δ`, completeness, completely flat framing, étale reduction and smooth quotient.
- `QCrys.FramedDatum.Hom`: Coordinate-injective maps preserving the indexed coordinates and ideals.
- `QCrys.FramedDatum.coordinate_regular`: `(q−1)X_s` is regular on P. On E derivatives use §5.15’s thickening; quotient uniqueness requires coordinate regularity there, automatic for unit coordinates.

**Checks.**

- `pr6_framed_nabla_coord_pow`: If `(q−1)X_s` is a nonzerodivisor then `∇_{q,s}(X_s^{n+1}) = [n+1]_q·X_s^n`, with `[n+1]_q = Σ_{i≤n} q^i`.
- `pr6_framed_nabla_const`: If `(q−1)X_s` is a nonzerodivisor then `∇_{q,s}` vanishes on the image of D.
- `pr6_framed_gamma_frobenius`: `γ_s` commutes with the Frobenius lift `φ` of the δ-structure.
- `pr6_framed_two_framings_gamma`: If two framed structures on the same P with one coordinate have `X′ = X + 1`, then `γ′(X) = qX + (q−1)`; so the automorphism depends on the framing and is not determined by P.

**Proof route.** Import from Layer 5.0 the framed algebra `(P, S)` with its automorphisms and q-derivatives, for the base ring D, the element q and the ideal `(p, q−1)`: the automorphism of `D[S]^∧` scaling `X_s` by q is congruent to the identity modulo the topologically nilpotent element `(q−1)X_s`, so it extends uniquely along the completely ind-étale framing (Construction 16.19).

<a id="s5-15"></a>
<a id="layer-5-gamma-extension-to-q-pd-envelope"></a>

### 5.15 Extension of the automorphisms and q-derivatives to the q-PD envelope

Let `(P,S,J)` be a framed q-PD datum, D flat over `A=Z_p[[q−1]], t=q−1` and `E=D_{J,q}(P)`. Construct commuting continuous δ-D-algebra automorphisms `γ_s` of E extending those on P, and continuous D-linear maps `∇_s:E→E` extending its q-derivatives. Require

```text
γ_s(f) = f + t X_s ∇_s(f),
∇_s(fg) = f∇_s(g) + γ_s(g)∇_s(f),
∇_s φ(f) = [p]_q X_s^(p−1) φ(∇_s f),
∇_s ∇_u = ∇_u ∇_s.
```

E is A-flat, hence t-regular, but `X_s` need not remain regular. Define the finite free thickening `T_s(E)=E[ε]/(ε²−tX_sε)`, basis `(1,ε)`, with

`φ(ε)=[p]_qX_s^(p−1)ε,  δ(ε)=X_s^(p−1)(([p]_q−t^(p−1))/p)ε`.

The coefficient is integral. Its q-PD ideal is `K⊕Eε`, quotient `E/K`; evaluation `ε↦0,tX_s` gives δ-maps. The δ-map `X_s↦X_s+ε, X_u↦X_u` for `u≠s` extends by ind-étaleness and the envelope property to `E→T_s(E)`, with constant coefficient id; define `∇_s` as its `ε` coefficient. Evaluation at `tX_s` gives `γ_s`, with inverse given by inverse coordinate scaling. Rank-four thickenings for two directions give commuting operators and coordinate-injective naturality, including zero derivative in new directions. Modulo t they are PD derivations: `∇_s(γ_r(f))=γ_(r−1)(f)∇_s(f)`. Only when `X_s` is regular may the divisibility identity define `∇_s` by unique quotient; unit coordinates suffice.

(BS22, Lemma 16.21 and Construction 16.20, pp.114–115; existence and base change of the envelope, Lemma 16.10, pp.110–111. The finite free δ-thickening above supplies the derivative construction implicit after Lemma 16.21.)

*Needs:* [§5.14](#s5-14), [§5.7](#s5-7), [§5.8](#s5-8), [The q-analogue `[p]_q` and the operation `γ`](#layer-5-q-divided-power-operation), [PrismaticCohomology §0.6](../PrismaticCohomology/README.md#s0-6), Layer 5.0.

- `QCrys.FramedDatum.derivativeThickening`: The finite free δ-ring `T_s(E)`, its q-PD ideal, evaluations and basis `(1,ε)`.
- `QCrys.FramedDatum.nabla`: The `ε`-coefficient, continuous and extending the derivative on P.
- `QCrys.FramedDatum.gamma_extend`: The unique continuous δ-extension of `γ_s`, satisfying `γ_s−1=tX_s∇_s`.
- `QCrys.FramedDatum.nabla_mul`, `nabla_comm`, `nabla_frobenius`, `nabla_natural`, `nabla_newCoordinate_zero`: the identities and functorialities above, with injective coordinate maps in the last two.
- `QCrys.FramedDatum.nabla_mod_q_sub_one`: Its reduced PD derivation.
- `QCrys.FramedDatum.nabla_eq_uniqueQuotient`: The quotient formula when `X_s` is regular on E.

**Checks.**

- For `p=2, v_s=(2+t)X_s` and `δ(ε)=X_sε`. Directly `(X_s+ε)²=X_s²+(2+t)X_sε`, including the `ε²` term. Setting `ε²=0` before reducing t gives the wrong Frobenius lift.
- For `P=A⟨X⟩, J=(t,X)` and `z=X^p/[p]_q`, one gets `γ(z)=q^p z` and `∇(z)=X^(p−1)`. Modulo t this is the PD derivative of `X^p/p`, including at `p=2`.
- For `J=tP` the envelope is P, and the `ε`-coefficient construction recovers `[n]_q X^(n−1)` on `X^n`; for `n=0` it gives zero.
- With two coordinates, the mixed `ε_1ε_2` coefficient of the image of `X_1X_2` is 1 in either order. This detects the commuting derivative convention used in the two-term Koszul differential.
- For the zero ring the thickening and all operators are zero. For an invertible `X_s` the displayed identity and t-torsion-freeness uniquely recover the constructed operator; for general `X_s` the universal map supplies that operator without assuming injectivity of multiplication by `X_s`.

**Proof route.** Verify the displayed integral Frobenius on the finite free thickening and use its q-PD ideal to extend the coordinate map through the envelope. The two evaluations give `γ_s` and its divided difference, and the rank-four two-direction thickening gives commutativity and naturality without cancelling `X_s` (BS22 Construction 16.20 and Lemma 16.21, pp.114–115).

<a id="s5-16"></a>
<a id="layer-5-framed-q-de-rham-complex"></a>

### 5.16 The q-de Rham complex of a framed q-PD datum

For framed `(P,S,J)`, set `E=D_(J,q)(P)`. Define its q-de Rham complex as the completed cochain Koszul complex of §5.15’s commuting `∇_s`, with term `E⊗`̂_PΩhat^`i_(P/D)` and `d(f)=Σ∇_s(f)dX_s`. If `J=(q−1)P` and `I=(q−1), E=P` and this is §5.0. Coordinate-injective maps give complex maps; coordinate identifications need not. Modulo `q−1` it is de Rham of the reduced PD envelope. The identity `∇_sφ=[p]_qX_s^(p−1)φ∇_s` gives Frobenius `f dX_(s₁)`⋯`↦φ(f)∏[p]_qX_(s_j)^(p−1)dX_(s₁)`⋯. On unit coordinates it identifies with `Koszul((γ_s−1)/(q−1))=η_(q−1)Koszul(γ_s−1)`. The polynomial version uses the constructed operators; abstract quotient uniqueness still requires coordinate regularity.

`(P, S, J)` is a framed q-PD datum; D is flat over A. For infinite S use degreewise completed free exterior modules over E and the sum of all `∇_s` in the differential, with §5.0’s summability hypothesis. Finite-subset Koszul complexes on the fixed E do not form a direct system under coordinate inclusions. `(b)`: the source prints the last sentence of Construction 16.20 with the framing `A[{X_s}] → P`; the framing `D[{X_s}] → P` is meant. `(d)` is not printed in §16; it follows from the δ-thickening construction of §5.15, with `φ(ε)=[p]_qX_s^(p−1)ε`, and is what the Frobenius compatibility in Theorem 17.2 uses. The Koszul complex of commuting endomorphisms and the identification in `(e)` are AInfCohomology Layer AI.1's (BMS1 Definition 7.1, Lemma 7.9); the Koszul complex of q-derivations is Layer 5.0's.

(BS22, Construction 16.20; pp. 114–115; BS22, Construction 16.20, functoriality; p. 115.)

*Needs:* [§5.15](#s5-15), [§5.14](#s5-14), [§5.8](#s5-8), [§5.7](#s5-7), [§5.0](#s5-0), AInfCohomology Layer AI.1, AInfCohomology §§AI.1.1–AI.1.2, AI.1.7.

For finite-coordinate reductions, require a filtered presentation of the precompletion framed algebra and its ideal by finite-coordinate framed data `(P_a,S_a,J_a)`, with coordinate-injective transitions, whose completed colimit is `(P,S,J)`. Retain the q-PD-envelope hypotheses of §5.7 at each stage and require the extra target derivations to vanish on the image of each finite datum. The framed quotients `P_a/J_a` and `P/J` are discrete and derived p-complete by §5.14; J is the complete kernel of `P→R`, rather than the algebraically generated colimit ideal. Construct `QCrys.FramedDatum.finiteDataPresentation`: the completed colimit of the envelopes `E_a` is E, and the completed colimit of their q-de Rham complexes is the preceding infinite-coordinate complex. Prove the envelope identification first by its universal property (§5.7), then identify the completed exterior terms and differentials. This reduction applies under these finite-data hypotheses; summability alone defines the infinite complex without providing such a presentation. (BS22 Construction 16.20 and Theorem 16.22, pp.114–116; §5.7’s envelope universal property.)

- `QCrys.FramedDatum.envelope`: `E=D_(J,q)(P)`.
- `QCrys.FramedDatum.envelopeMap`: `P→E`.
- `QCrys.FramedDatum.envelopeFramed`: The extended coordinates, `γ_s,∇_s` and `δ`.
- `QCrys.FramedDatum.envelopeFramed_gamma`: `γ_s` restricts to the original map on P.
- `QCrys.FramedDatum.qDeRhamComplex`: The cochain Koszul model over D.
- `QCrys.FramedDatum.qDeRhamMap`: The coordinate-injective complex map.
- `QCrys.FramedDatum.qDeRhamFrobenius`: The displayed degreewise semilinear Frobenius.
- `QCrys.FramedAlgebra.nabla_frobenius`: `∇_sφ=[p]_qX_s^(p−1)φ∇_s` under the framing regularity and `δ(q)=0`.

**Checks.**

- `pr6_qdr_polynomial_nabla`: In the polynomial ring `D[X]` with the automorphism `X ↦ qX: γ(X^{n+1}) − X^{n+1} = (q−1)·X·([n+1]_q·X^n)`.
- `pr6_qdr_at_q_one_derivative`: The formula `Σ_n a_n [n]_q X^{n−1}` for the q-derivative on `D[X]` specialises at `q = 1` to Mathlib's Polynomial.derivative.
- For `E=D⟨X,Y⟩`, the X-only Koszul differential kills Y, whereas the full differential sends Y to dY. The inclusion on the fixed E is not a chain map.
- For varying polynomial algebras `E_a=D⟨X_s:s∈S_a⟩` and their trivial-envelope data, extra derivatives vanish on each image, and the completed colimit gives the infinite polynomial q-de Rham complex.
- A constant finite framed datum gives the identity finite-data presentation; the empty datum gives E in degree zero.
- `pr6_qdr_no_coordinates`: For `S = ∅` all terms of the complex in nonzero degrees vanish: the complex is `D_{J,q}(P)` in degree 0.
- `pr6_qdr_two_framings_differ`: For two framed structures on P with one coordinate and `X′ = X + 1`, with `(q−1)X` and `(q−1)X′` nonzerodivisors: `∇′(X²) = ∇(X²) + (q−1)`; so the complex depends on the framing as a complex.
- `pr6_qdr_leibniz`: The twisted Leibniz rule `∇_{q,s}(fg) = f·∇_{q,s}(g) + γ_s(g)·∇_{q,s}(f)` holds when `(q−1)X_s` is a nonzerodivisor.

**Proof route.** Extend the `γ_s` to `D_{J,q}(P)` and form the commuting q-derivatives `∇_{q,s}` (Extension of the automorphisms `γ_s` to the q-PD envelope); take their Koszul complex (Layer 5.0, AInfCohomology Layer AI.1).

<a id="s5-17"></a>
<a id="layer-5-hodge-tate-comparison-criterion"></a>

### 5.17 A criterion for comparison maps to be isomorphisms

Let d be regular in A, R smooth over `A/d`, and E,F derived d-complete commutative A-algebras with coconnective reductions and strictly graded-commutative cohomology. If `η:R→H⁰` of each reduction induces de Rham DGA isos via Bockstein, any A-algebra map `E→F` intertwining `η` is an iso. Likewise for a bounded prism `(A,(d))`, p-completely smooth R and `(p,d)`-complete E,F, with completed de Rham. It suffices that the map lie in `D(A)` and induce a graded-ring map on reduced cohomology, hence `E₁` maps suffice.

Bockstein uses PrismaticCohomology §1.19 and AInfCohomology §AI.1.4. The `E₁` form is the one needed before the `E∞` upgrade.

(BS22, Lemma 17.4; p. 120; BS22, Lemma 17.4, the sentence before it; p. 120.)

*Needs:* [PrismaticCohomology §1.19](../PrismaticCohomology/README.md#s1-19), [PrismaticCohomology §0.72](../PrismaticCohomology/README.md#s0-72), AInfCohomology §AI.1.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

**Proof route.** `Α` is an isomorphism if and only if `α/d : E/d → F/d` is, by derived d-completeness (resp. `(p, d)`-completeness) and derived Nakayama (DerivedDeRhamCohomology Layer 1); so it suffices that `H^*(α/d)` is an isomorphism.

<a id="s5-18"></a>
<a id="layer-5-q-poincare-lemma"></a>

### 5.18 q-Poincaré comparison of the Čech–Koszul bicomplex

Use DGAInfinity Layer 1 for the underlying unital cochain DG algebra and its morphisms; the target here is the specific skew multiplication and its comparison with intrinsic q-crystalline cohomology.

For a framed q-PD datum `(P,S,J)` over D flat over `Z_p[[q−1]]`, the completed Čech–Koszul total complex has equivalences to the framed q-de Rham complex of its q-PD envelope and to q-crystalline cohomology. These equivalences respect the associative products described below. They are natural for coordinate-injective maps of framed data, including the cofaces of the Čech nerve. Codegeneracies need not be maps of differential graded algebras.

For infinite coordinate sets, impose the finite-data presentation hypotheses of §5.16. Prove its envelope and complex colimit identifications before reducing the comparison to finite-coordinate data. All complexes and cofibres are derived `(p,q−1)`-complete. The associative product is part of the conclusion; the exterior product with central forms does not satisfy the q-Leibniz rule.

(BS22, Theorem 16.22 and proof, pp.115–116, and Remark 17.3, p.117; BMS1, Lemma 7.5 and Example 7.7, pp.57–58, and Lemma 6.13, p.53. The semicosimplicial argument below supplies the multiplicative compatibility.)

*Needs:* DGAInfinity Layer 1; [§5.15](#s5-15), [§5.16](#s5-16), [§5.10](#s5-10), CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, EnhancedDerivedSheaves §§E0.1, E0.4, EnhancedDerivedSheaves §E5:abstract.2, AInfCohomology §§AI.1.1–AI.1.2, AI.1.7.

Equip `K=qΩ^{*`,□}_`{F/D}, F=D_{J,q}(P)`, with the skew differential graded product

`dX_s·a=γ_s(a)dX_s, (dX_s)²=0, dX_s·dX_t=−dX_t·dX_s, da=Σ_s∇_{q,s}(a)dX_s`.

On tori put `e_s=X_s^−1dX_s`; then `e_sa=γ_s(a)e_s` and `da=Σ((γ_s−1)/(q−1))(a)e_s`. The intrinsic multiplicative comparison is the `E₁` zigzag `qΩ←Tot`_(Δ_inj)`K^•→K⁰`, where `P^•` uses disjoint coordinate copies, `F^•` its envelopes and `K^•` their skew complexes. The arrows are projection to degree-zero forms and evaluation at zero; coordinate injections preserve the product, and no multiplicative degeneracy is assumed. It respects Frobenius and common refinements, with all finite-union cocycles; infinite sets use completed filtered colimits of those varying finite framed data, with extra derivations vanishing on each image as in §5.16.

- `QDeRham.skewDGA`: The stated unital associative DGA.
- `QDeRham.skewDGA_injection`: Coordinate-injective DGA maps.
- `QDeRham.siteComparison_E1`: The `E₁` comparison zigzag with intrinsic `qΩ`, respecting refinements and `φ`.
- `QDeRham.groupCupProduct`: On unit coordinates, agreement with `Lη` of the skew Koszul cup product.

**Checks.** On `D⟨X⟩` one has `dX·X=qX·dX` and `d(X²)=(1+q)X·dX`; making dX central would give `2X·dX` and fail. With two coordinates, `dX·dY=−dY·dX` and `d²(XY)=0`, including at `p=2` where the separate square-zero relation is still required. With no coordinates the product is F's ring product in degree zero. At `q=1` the model becomes the usual differential graded PD de Rham algebra. Merging `X₀,X₁↦X` is not claimed to be a strict algebra map: sending both dlog generators to e would send `e₀X₁=X₁e₀` to the false relation `eX=Xe`. This is why the multiplicative proof uses only cofaces and coordinate injections.

**Proof route.** Use the coface diagram of disjoint-coordinate Čech–Koszul algebras: modulo `q−1, PD` Poincaré comparison makes the two projections equivalences, and regular-quotient reduction plus derived Nakayama lifts them. For the infinite-coordinate extension use §5.16’s proved finite-data presentation and its coordinate-injective complex maps. The inclusion Δ_inj`→Δ` is initial because appending a last vertex contracts each category of maps `[k]→[n]`, so the multiplicative semicosimplicial limits compute the same intrinsic object; on tori the skew cup product agrees with its supplied `Lη` product (BS22 Theorem 16.22, pp.115–116, Remark 17.3, p.117; BMS1 Lemmas 6.13 and 7.5, Example 7.7, pp.53,57–58).

<a id="s5-19"></a>
<a id="layer-5-q-de-rham-comparison"></a>

### 5.19 q-de Rham and q-crystalline comparison

For framed `(P,S,J)` over q-PD D flat over A with `P/J=R` smooth over `D/I, qΩ_(R/D)≃qΩ^(*`,□)_`(D_(J,q)(P)/D)`, canonically and Frobenius-compatibly. Naturality holds for coordinate-injective framed maps over `R→R′`.

`(D, I)` is a q-PD pair with D flat over `A; (P, S, J)` is a framed q-PD datum for R. The source states the quasi-isomorphism; naturality in the framed datum and the compatibility with Frobenius are visible in its proof (the bicomplex is functorial and carries the Frobenius) and are used in Theorem 17.2. For `q = 1` this is the comparison of crystalline cohomology with the de Rham complex of a PD envelope, owned by CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10.

(BS22, Theorem 16.22; p. 115; BS22, Theorem 16.22, the sentence before the proof and the proof; pp. 115–116.)

*Needs:* [§5.16](#s5-16), [§5.15](#s5-15), [§5.10](#s5-10), [§5.11](#s5-11), [§5.8](#s5-8), CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, [§5.18](#s5-18).

**Proof route.** Take `P^•` to be the completed Čech nerve of `D→P`, with disjoint coordinate copies `S^n` and kernels `J^n`. The cofaces are coordinate-injective maps of framed data.

<a id="s5-20"></a>
<a id="layer-5-change-of-framing"></a>

### 5.20 Change of framing and the cocycle identity

For two framed data of smooth R over q-PD D flat over A, their completed tensor product `P″=P⊗̂_DP′`, coordinates S⊔S′ and kernel J″ of `P″→R` give a common framed refinement. Both coordinate-injective maps induce quasi-isos. The resulting framing-change map is the composite through intrinsic `qΩ`; it has identity and cocycle laws, respects Frobenius and covered maps `R→R′`, and glues on smooth formal schemes. This includes two framings of the same P.

Different framed complexes are identified in `D(D)`, with product and `φ`, rather than by a termwise isomorphism.

(BS22, Construction 16.20, functoriality; p. 115; BS22, Theorem 16.22, proof; pp. 115–116; BS22, Example 1.9 `(4); p`. 5.)

*Needs:* [§5.19](#s5-19), [§5.16](#s5-16), [§5.11](#s5-11), CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1.

**Proof route.** `(P″, S″)` is a framed D-algebra: the framing is the completed tensor product of the two framings; J″ is the kernel of the surjection `P″ → R`. The maps `P → P″ ← P′` are morphisms of framed q-PD data, so The q-de Rham complex of a framed q-PD datum `(b)` gives the two maps of complexes.

<a id="s5-21"></a>
<a id="layer-5-q-de-rham-prismatic-comparison-zp"></a>

### 5.21 The framed q-de Rham complex of a smooth Z_p-algebra and prismatic cohomology

For smooth `R/Z_p` with étale framing `Z_p⟨T₁,…,T_d⟩→R`, let P lift it completely étale over `A=Z_p[[q−1]]`. Then its completed framed complex `qΩ_R`^□`≃qΩ_(R/A)≃Δ_(R⊗̂Z_p[ζ_p]/A)`, Frobenius-compatibly. It is canonically framing-independent, functorial in `D(A)`, and reduces modulo `q−1` to Ωhat*_`(R/Z_p)`. This is a single-prime complete theory; gluing over `Z[[q−1]]` or the Habiro ring belongs to HabiroCohomologyFoundations HQ.1–HQ.2.

The input to `Δ` is R¹, over the prism ideal `([p]_q); q−1` is not that prism ideal.

(BS22, Example 1.9 `(4); p`. 5; BS22, §16, introduction; p.106.)

*Needs:* [§5.19](#s5-19), [§5.13](#s5-13), [§5.20](#s5-20), [§5.11](#s5-11), [§5.5](#s5-5), [§5.16](#s5-16), [PrismaticCohomology §0.77](../PrismaticCohomology/README.md#s0-77), [§5.0](#s5-0), CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10.

**Proof route.** `(A, (q−1))` is a q-PD pair (Higher q-divided powers and the smallest and largest q-PD ideals `(c)`) and A is flat over itself. `(P, {T_i}, (q−1)P)` is a framed q-PD datum for R, and `D_{J,q}(P) = P` because `(P, (q−1)P)` is already a q-PD pair, P being completely flat over A; so its q-de Rham complex is `qΩ^{*`,□}_`{P/A}` (The q-de Rham complex of a framed q-PD datum `(a)`). q-de Rham and q-crystalline comparison gives `qΩ_R`^□ `≃ qΩ_{R/A}`. q-crystalline and prismatic cohomology with `I = (q−1)` gives `qΩ_{R/A} ≃ Δ_{R^{(1)}/A}`; here `φ_A` induces `Z_p = A/(q−1) → A/([p]_q) = Z_p[ζ_p]`, the structure map, so `R^{(1)} = R ⊗`̂_`{Z_p} Z_p[ζ_p]`.

<a id="s5-22"></a>
<a id="layer-5-ainf-omega-comparison-map"></a>

### 5.22 The all-coordinates comparison map from q-crystalline cohomology to AΩ

Let C be a perfectoid field of characteristic 0 containing `μ_{p^∞}, A = A_inf(O_C)` with `q = [ε]` and `ξ = φ^{-1}([p]_q)`, and the q-PD pair `(A, (ξ))` of The q-PD pair `(A_inf, (ξ))`. Let R be a p-completely smooth `O_C`-algebra that is very small: `R/p` is generated over `O_C/p` by units, and R is small, that is, there are units `x_1, …, x_n` of R defining a formally étale map `O_C⟨x_1^{±1}, …, x_n^{±1}⟩ → R`. Put `S = R^×`. A coordinate family is a finite labelled set `Σ` with a map `Σ→S`; repeated values have distinct labels. Let `C_R` have these families as objects, with label-preserving injections as arrows, subject to the condition that `A[x_s^{±1} : s ∈ Σ]^∧ → R, x_s ↦ s`, is surjective and the family contains a framing. This category is not asserted filtered. For `Σ ∈ C_R` let `P_Σ = A[x_s^{±1} : s ∈ Σ]^∧` be the formal torus over A, with `δ(x_s) = 0` and the automorphisms `γ_s` scaling `x_s` by q, and `J_Σ = ker(P_Σ → R); (P_Σ, Σ, J_Σ)` is a framed q-PD datum. `(1)` The q-side. `qΩ_{R/A}` is computed by the complex `hocolim_{Σ ∈ C_R} Kos_c(D_{J_Σ,q}(P_Σ); {∇_{q,s}}_{s∈Σ})`, with transition maps for injections of labelled families. `(2)` The `AΩ`-side. For `Σ` in `C_R` let `Δ_Σ = ∏_{s∈Σ} Z_p(1)` and let `R_{Σ,∞}` be the p-completed integral closure of R in the pro-étale `Δ_Σ`-torsor over `R[1/p]` obtained by extracting all p-power roots of the `x_s; R_{Σ,∞}` is perfectoid, and `σ_s` denotes the automorphism of `A_inf(R_{Σ,∞})` induced by the s-th basis vector of `Δ_Σ`. Then `AΩ_R` is computed by `hocolim_{Σ ∈ C_R} η_{q−1} Kos_c(A_inf(R_{Σ,∞}); {σ_s − 1}_{s∈Σ})`, and already by each term whose `Σ` contains units `x_1, …, x_n` defining a formally étale map `O_C⟨x_1^{±1}, …, x_n^{±1}⟩ → R`. `(3)` The map. For each `Σ` in `C_R` there is a unique map of δ-A-algebras `μ_0 : D_{J_Σ,q}(P_Σ) → A_inf(R_{Σ,∞})` extending the δ-map `P_Σ → A_inf(R_{Σ,∞}), x_s ↦ [(s, s^{1/p}, s^{1/p²}, …)]`; it intertwines `γ_s` with `σ_s` and is compatible with enlarging `Σ`. It induces maps `Kos_c(D_{J_Σ,q}(P_Σ); {∇_{q,s}}) ≅ η_{q−1} Kos_c(D_{J_Σ,q}(P_Σ); {γ_s − 1}) → η_{q−1} Kos_c(A_inf(R_{Σ,∞}); {σ_s − 1})`, and in the homotopy colimit over `Σ` the comparison map `μ_R : qΩ_{R/A} → AΩ_R`. By the multiplicative q-de Rham comparison, it is a map of `E_1`-A-algebras (represented by differential graded algebras), compatible with the Frobenius endomorphisms. Arbitrary naturality is constructed by the labelled-family spans below; the semicosimplicial `E₁` comparison of §5.18 identifies the chart product with the intrinsic site product. For a general p-completely smooth `O_C`-algebra, and for smooth formal `O_C`-schemes, `μ` is obtained by gluing, the very small affine opens being a basis. A map identifying two coordinate values keeps their labels distinct in the target family.

AInfCohomology §§AI.3.2–AI.3.3 supplies the chart rings and `AΩ` computations on its algebraically closed coefficient-field range. For the arbitrary perfectoid field `C` in this target, construct the same local object `AΩ_R = Lη_(q−1) RΓ_proét(Spa(R[1/p],R), 𝔸_inf)` and prove the displayed root-tower calculation by the same almost-purity and décalage argument; each label gives an independent root tower (BMS1 Lemma 7.3, Theorem 9.4(iii), §§8–9). The comparison target retains this generality in `C`. All homotopy colimits are in the derived complete category. Naturality for arbitrary `f:R→R′` uses triples `(Σ,Σ′,j)` with j an injection retaining each source label at its image value; add a separate good framing and generators for R′. The induced torus/envelope maps intertwine `γ` with the root-tower maps equivariant for `Δ_Σ′→Δ_Σ`. For a chain of maps retain every earlier label and use common disjoint unions, giving coherent derived naturality even when coordinate values coincide.

(BS22, Theorem 17.2 and its proof, pp.117–120; explicit complexes pp.118–119, comparison map pp.118–119; BMS1, Theorem 9.4 (iii); p. 70.)

*Needs:* [§5.6](#s5-6), [§5.19](#s5-19), [§5.16](#s5-16), [§5.7](#s5-7), [§5.4](#s5-4), [§5.14](#s5-14), AInfCohomology §§AI.3.1–AI.3.3, AInfCohomology §§AI.3.2–AI.3.3, AI.4.1–AI.4.4, AInfCohomology Layer AI.1, AInfCohomology §§AI.1.1–AI.1.2, AI.1.7, [PrismaticCohomology §0.83](../PrismaticCohomology/README.md#s0-83), [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84), PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, [PrismaticCohomology §0.92](../PrismaticCohomology/README.md#s0-92).

- `Prismatic.AOmega.Chart`: AInfCohomology §§AI.3.2–AI.3.3’s chart values, `σ_s` and torus map.
- `Prismatic.AOmega.coordinateMap`: `μ₀:E_Σ→Ainf(R_(Σ,∞))`.
- `Prismatic.AOmega.coordinateMap_comp`: Restriction to the given torus map.
- `Prismatic.AOmega.coordinateMap_gamma`: `μ₀γ_s=σ_sμ₀`.
- `Prismatic.AOmega.AOmegaData`: `AΩ` with Frobenius: the supplied AInfCohomology Layer AI.3 object on its coefficient-field range, and the root-tower construction above for arbitrary perfectoid `C` as stated.
- `Prismatic.AOmega.frobeniusPullback`: `φ_A*` is restriction along `φ_A^−1`.
- `Prismatic.AOmega.comparisonMap`: `μ_R:qΩ→AΩ`.
- `Prismatic.AOmega.labelled_naturality`: Good labelled-family spans give coherent naturality, including coincident coordinate values.
- `Prismatic.AOmega.skewProduct`: `e_sa=γ_s(a)e_s` and the skew Leibniz law; §5.18 identifies this with the site product.
- `Prismatic.AOmega.comparisonMap_frobenius`: `μ_R` commutes with `φ`.

**Checks.**

- `pr6_mu_torus_coordinate`: If the map of the chart sends the coordinate `x_s` to an element y, then `μ_0(x_s) = y` and `σ_s(y) = q·y`: for the torus, `y = [x^♭]` and `σ([x^♭]) = [ε][x^♭]`.
- `pr6_mu_point`: For `R = O_C` (no coordinates) `qΩ_{O_C/A} ≅ A`.
- `pr6_mu_frobenius_square`: The square formed by `μ_R` and the two Frobenius maps commutes.
- `pr6_mu_needs_decalage`: Without `η_{q−1}` the target is wrong: if `σ(y) = q′·y` with `q′^p = q` and `σ(q′) = q′`, then `(q−1)·y = (σ − 1)([p]_{q′}·y)`, so the class of y in the cokernel of `σ − 1` is `(q−1)`-torsion; for the torus this class is nonzero, while `AΩ` has no such torsion.

- `pr6_mu_duplicate_labels`: On a map sending two units to the same unit, retain two independent root towers in the enlarged target. Replacing that family by a subset would lose the required injection.
- `pr6_mu_index_category`: Two parallel embeddings into a family with duplicate values cannot be equalised by an injection. The construction uses contractibility and equivalences, not filteredness.
- `pr6_mu_skew_product`: In a one-coordinate torus `eX=qXe`; imposing `eX=Xe` gives the wrong Leibniz law away from `q=1`.
- `pr6_mu_composition`: For `R→R′→R″`, using all three sets of labels and then enlarging gives the same derived map as composing the two spans. Changing the added framing is connected through their disjoint union.

**Proof route.** Disjoint union with a fixed good labelled family contracts the indexing category; each chart computes the same intrinsic complex, so its homotopy colimit does too. Perfection gives the δ-map from the torus and the q-PD universal property extends it to `μ₀`; equivariance gives the Koszul map, while §5.18 and labelled-family spans supply coherent multiplicativity and naturality (BS22 Theorem 17.2, p.117, construction pp.118–119; BMS1 Lemma 7.3 and Theorem 9.4(iii), pp.56,70).

<a id="s5-23"></a>
<a id="layer-5-ainf-omega-comparison"></a>

### 5.23 Comparison with AΩ

Over `C,Ainf,q,ξ` of §5.6 and smooth `R/O_C`, §5.22’s map is an `E∞`, Frobenius-compatible iso `qΩ_(R/A)≃AΩ_R≃Δ_(R¹/A)≃φ_A*Δ_(R/A)`, natural in R. Here `qΩ` uses `(A,(ξ)), R¹=R⊗_(A,φ)A` is over `A/([p]_q)`, and the last `Δ` uses `(A,(ξ))`. The twist changes the A-action and cannot be omitted. The `E₁` comparison upgrades to `E∞` by left Kan extension to QRSP algebras, where both sides are discrete commutative rings, followed by quasisyntomic descent.

The very-small chart computation works for the stated perfectoid fields (BMS1 §§8–9). The Hodge–Tate scalar map is `θtilde`; §§5.18 and 5.22 supply multiplicativity and all-ring-map coherence.

(BS22, Theorem 17.2; p. 117; BS22, Remark 17.3; p. 117; BS22, Theorem 17.2, isomorphism proof; pp.119–120; BMS1, §9.1, Definition 9.1; p. 69.)

*Needs:* [§5.22](#s5-22), [§5.17](#s5-17), [§5.13](#s5-13), [§5.6](#s5-6), [PrismaticCohomology §1.20](../PrismaticCohomology/README.md#s1-20), [PrismaticCohomology §1.21](../PrismaticCohomology/README.md#s1-21), [PrismaticCohomology §1.9](../PrismaticCohomology/README.md#s1-9), AInfCohomology §§AI.3.1–AI.3.3, AInfCohomology §§AI.3.2–AI.3.3, AI.4.1–AI.4.4, [PrismaticCohomology §2.1](../PrismaticCohomology/README.md#s2-1), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §2.17](../PrismaticCohomology/README.md#s2-17), EnhancedDerivedSheaves Layer E3, DerivedDeRhamCohomology §§5.1–5.7, EnhancedDerivedSheaves §E5:abstract.2.

**Proof route.** Identify q-crystalline cohomology with `Δ_(R^(1)/A)`, then compare the Hodge–Tate structure maps on generating units, reducing by naturality to the torus, where `μ₀` is the prescribed inclusion and `θ̃([x^♭]^p)=x`. Apply §5.17 to get the `E₁` equivalence, then extend to the discrete QRSP basis and descend to obtain `E∞` compatibility (BS22 Theorem 17.2 and Remark 17.3, p.117, isomorphism proof pp.119–120; BMS1 Theorems 8.3 and 9.2, §§8–9).

<a id="s5-24"></a>
<a id="layer-5-theta-theta-tilde-square"></a>

### 5.24 The θ and θ̃ specialisations under the AΩ comparison

For `θ, θtilde=θφ^−1` and `ξtilde=φξ=[p]_q, θtildeφ=θ`. Hence `AΩ_R⊗^L_(A,θtilde)O_C≃Δ`̄_`(R/A)=Ωtilde_R`, respecting structure maps and Hodge–Tate Bockstein DGA identifications (with R¹ at the `ξtilde` prism). The `θ`-fibre instead is Ωhat*_`(R/O_C)`, by relative de Rham comparison. On `R=O_C⟨x^±1⟩` their `H⁰` are R and `O_C` respectively; omitting `φ*` exchanges these corners.

Agreement with the separately constructed specializations is owned by CohomologyComparisons §1.7; here the comparison is transported from §5.23. Trivializations use `[p]_q`.

(BS22, Theorem 17.2, proof, footnote on the Frobenius twist; p. 120; BS22, Example 1.9 `(2); p`. 5; BMS1, §9, introduction; p.69.)

*Needs:* [§5.23](#s5-23), [PrismaticCohomology §1.20](../PrismaticCohomology/README.md#s1-20), [PrismaticCohomology §1.5](../PrismaticCohomology/README.md#s1-5), [§3.17](#s3-17), AInfCohomology §§AI.3.2–AI.3.3, AI.4.1–AI.4.4, PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25.

**Proof route.** `(a)`: base change of the isomorphisms of Comparison with `AΩ` along `θ̃`, and `θ̃∘φ_A = θ`. The identification of the left side with `Ω̃_R` is BMS1 Theorem 9.2 (`i) (`AInfCohomology Layer AI.4), in which R is an A-algebra through `θ̃`.

<a id="s5-25"></a>
<a id="layer-5-comparison-uniqueness"></a>

### 5.25 Uniqueness of comparison isomorphisms

Over perfect `(A,I)`, let C consist of symmetric monoidal `G:Sm_(A/I)→D̂(A)` with monoidal `η:id→G⊗^L_A A/I`. Then `End_C(Δ)= {id}`, without Frobenius compatibility. The QRSP input: on quotients of p-completely flat perfectoid A/I-algebras by relatively completely regular sequences, any natural family of A-algebra endomorphisms preserving `η` is the identity. Thus any object isomorphic to `Δ` has a unique isomorphism to it and every morphism between them is this iso. This normalizes the comparisons `qΩ≃Δ, AΩ≃φ*Δ` and BS22 Theorem 13.1’s Nygaard–THH comparison, when transported with their Hodge–Tate maps.

`(A, I)` is a perfect prism, `R = A/I` the corresponding perfectoid ring. The theorem is about endomorphisms in the category of pairs `(G, η)` with the Hodge–Tate structure map, and it imposes no Frobenius compatibility; it is not a statement about automorphisms of a functor to `E_∞`-A-algebras with `φ`. In this proof use the following formulas: the sequence `f_1, …, f_r` lies in R′, the ring presented is `A_inf(R′){g_i/d}^∧`, the completeness is `(p, d)`-adic, and Joyal's identity reads `φ^{n+1}(x) = x^{p^{n+1}} + pδ_1(x)^{p^n} + … + p^nδ_n(x)^p + p^{n+1}δ_{n+1}(x)`. For the `AΩ` comparison the perfect prism is `(A_inf, ([p]_q))` with `A_inf/[p]_q ≅ O_C` through `θ̃`, and `R ↦ R^{(1)}` identifies the two categories of smooth algebras.

(BS22, Theorem 18.2; p. 122; BS22, Theorem 18.2, the sentence after it; p. 122; BS22, Lemma 18.3 and its proof; p. 122; BS22, §18, introduction; p.122.)

*Needs:* [PrismaticCohomology §2.1](../PrismaticCohomology/README.md#s2-1), [PrismaticCohomology §2.15](../PrismaticCohomology/README.md#s2-15), [PrismaticCohomology §2.17](../PrismaticCohomology/README.md#s2-17), [PrismaticCohomology §1.19](../PrismaticCohomology/README.md#s1-19), [PrismaticCohomology §1.4](../PrismaticCohomology/README.md#s1-4), [PrismaticCohomology §0.65](../PrismaticCohomology/README.md#s0-65), [PrismaticCohomology §0.84](../PrismaticCohomology/README.md#s0-84), [PrismaticCohomology §0.55](../PrismaticCohomology/README.md#s0-55), [PrismaticCohomology §0.86](../PrismaticCohomology/README.md#s0-86), [PrismaticCohomology §0.81](../PrismaticCohomology/README.md#s0-81), DerivedDeRhamCohomology §§5.1–5.7, EnhancedDerivedSheaves §E5:abstract.1, [§5.13](#s5-13), [§5.23](#s5-23), [PrismaticCohomology §0.56](../PrismaticCohomology/README.md#s0-56).

**Checks.**

- At `S=R`, the only A-algebra endomorphism of `Δ_(R/A)=A` is the identity.
- For perfectoid S, `Δ_(S/A)=A_inf(S)` and `η_S:S→Δ̄_(S/A)` is an isomorphism. An endomorphism preserving `η_S` therefore reduces to the identity on S.
- A nontrivial R-automorphism `τ` of perfectoid S induces `A_inf(τ)` whose Hodge–Tate reduction is `τ≠id_S`. This illustrates the Hodge–Tate normalization hypothesis. For example take `R=F_p`, `S=F_(p³)` and `τ(a)=a^p`.

**Proof route.** Reduction: every S in `Sm_R` has a quasisyntomic Čech cover `S → S^•` with all `S^i` in rsPerfd_R (DerivedDeRhamCohomology §§5.1–5.7). Derived prismatic cohomology with its Hodge–Tate map defines an object on rsPerfd_R (Layer 2's Derived prismatic cohomology), and by descent (Layer 2's Quasisyntomic descent and unfolding) it suffices to show that this object has no nontrivial endomorphisms.

<a id="s5-26"></a>
<a id="layer-5-nygaard-filtration-q-de-rham-coordinates"></a>

### 5.26 The Nygaard filtration in q-de Rham coordinates

For smooth `R/O_C` with an étale toric framing, lift it completely étale to Rtilde/Ainf. Put `M=Koszul((γ_i−1)/(q−1))`, basis d_qlog `T_i`, with `φ_M(fω)=ξtilde^nφ(f)ω` in degree n. Then `M≃qΩ≃φ*Δ≃AΩ`, compatibly with `φ; φ_M/ξtilde^n:M^n/ξ→H^n(M/ξtilde)` is bijective. Nygaard is represented by `N^iM^n=ξ^max(i−n,0)M^n`, equal to `{x:φ_Mx∈ξtilde^iM^n}`, with filtered `φ` to `ξtilde^iM`. The BMS2 map `AΩ→Lη_ξφ_*AΩ=φ_*Lη_ξtilde AΩ` is represented by `φ_M:M→φ_*η_ξtilde M⊂φ_*M`.

The BMS2 Remark 9.11 parameter should read `q=[ε]`, with `μ=q−1`. Only the model depends on the framing; its derived filtration does not.

(BMS2, Remark 9.11; p. 73; BS22, Theorem 17.2; p. 117.)

*Needs:* [§3.24](#s3-24), [§3.14](#s3-14), [§3.16](#s3-16), [§5.16](#s5-16), [§5.14](#s5-14), [§5.19](#s5-19), [§5.13](#s5-13), [§5.23](#s5-23), [§5.6](#s5-6), [§5.20](#s5-20), [PrismaticCohomology §1.11](../PrismaticCohomology/README.md#s1-11).

**Proof route.** `(1): (R̃, {T_i}, ξR̃)` is a framed q-PD datum over the q-PD pair `(A, (ξ))` of The q-PD pair `(A_inf, (ξ))` whose q-PD envelope is R̃ itself; by q-de Rham and q-crystalline comparison its framed q-de Rham complex computes `qΩ_{R/A}`, by q-crystalline and prismatic cohomology `qΩ_{R/A} ≅ Δ_{R^{(1)}/A} = φ_A^*Δ_{R/A}`, and by Comparison with `AΩ` this is `AΩ_R`; all three isomorphisms are compatible with Frobenius.

### Examples

In the one-variable framed model, `∇_q(X²)=(1+q)X` specializes to 2X at `q=1` and to `(1+q)X` before specialization. At `p=2, [p]_q=1+q`. For `q=1` and `x=p` in `Z_p, γ(p)=p^(p−1)`, hence `γ(2)=2` at `p=2`. In `Z_p[[q−1]]` the scalar p is not in `φ⁻¹([p]_qD)`, so `N(D)` is not the ideal `(p,q−1)`. For two commuting operators, the two middle entries of `d¹d⁰` cancel with the specified minus sign. Coordinate merging requires its own coherent comparison and does not follow from the coordinate-injective framed maps.

**§5.1.** In `A=Z_p[[q−1]], N(A)=(q−1)A`: divisibility of `φ(f)` by `[p]_q` is equivalent to `f(1)=0`.

**§5.3.** `(Z_p, (p))` is a δ-PD pair`; (Z_p[[q−1]], (q−1))` reduces to `(Z_p, 0)`. `(A_inf, (ξ))` reduces to `(A_inf/(q−1), (ξ))`, so `ξ` has divided powers in `A_inf/(q−1)`. For D the p-completed PD polynomial algebra on t over `Z_p` with `δ(t) = 0`, the ideal tD is not a q-PD ideal although every element of tD has all divided powers in `D: t^p/p` ∉ tD.

**§5.4.** For `(D, I) = (A_inf, (ξ)): A_inf` is derived `ξ`-complete, and a derived `(p, ξ)`-complete complex M with `M ⊗^L A_inf/(q−1) = 0` is zero. For `D = Z_p[[q−1]] → D′ = Z_p[[q−1]]⟨T⟩` (completed polynomial ring, `δ(T) = 0): (D′, (q−1)`) is a q-PD pair. `(2)` fails without completeness: for `D = Z_p[[q−1]], M = D[1/(q−1)]` has zero base change and is not zero.

**§5.5.** In `A = Z_p[[q−1]]` one has `N(A) = (q−1)A`, so `(q−1)` is the only q-PD ideal of A. In `Z_p` with `q = 1`: the smallest q-PD ideal is 0 and the largest is `N(Z_p) = pZ_p`. In `A_inf: N(A_inf) = φ^{-1}(φ(ξ)A_inf) = (ξ)`, so `(q−1)` is the smallest and `(ξ)` the largest q-PD ideal of `A_inf`.

**§5.6.** `γ(ξ) = 1 − δ(ξ) ∈ (ξ)`. The reduction `(A_inf/(q−1), (ξ))` is a δ-PD pair: `ξ` has divided powers in `A_inf/(q−1)`. `(A_inf, (q−1))` is also a q-PD pair, with `A_inf/(q−1)` a p-torsion-free lift of `O_C` modulo the divided power ideal `(ξ)`; Invariance under q-PD thickenings of the base compares the two.

**§5.7.** For `P = Z_p[[q−1]]⟨X⟩` with `δ(X) = 0` and `J = (q−1, X)`: the envelope contains z with `[p]_q·z = X^p, γ(X) = z ∈ K`, and its reduction modulo `q − 1` is the p-completed PD polynomial algebra `Z_p⟨X⟩` with `X^p/p`. For `P = A_inf⟨x^{±1}⟩` and `J = (ξ): φ(ξ)/[p]_q = 1`, so `D_{J,q}(P) = P`. Universal property applied to the q-PD pair `(A_inf(S), (ξ))` of a p-torsion-free perfectoid `O_C`-algebra S gives the coordinate map of The all-coordinates comparison map from q-crystalline cohomology to `AΩ`.

**§5.8.** For `D = Z_p[[q−1]], P = D⟨X⟩, J = (q−1, X): D_{J,q}(P)/(q−1)` is the p-completed PD polynomial algebra on X over `Z_p`. For D with `q = 1: D_{J,q}(P)` is the p-completed PD envelope `D_J(P)^∧` and K its PD ideal. Base change of the envelope of `(Z_p[[q−1]]⟨x⟩, (q−1, x))` along the map of q-PD pairs `(Z_p[[q−1]], (q−1)) → (A_inf, (ξ))` is the envelope of `(A_inf⟨x⟩, (ξ, x))`.

**§5.9.** For `R = D/I` the pair `(D, I)` is the initial q-PD thickening, so `qΩ_{(D/I)/D} = D` with `φ_{R/D} = φ_D`. For D with `q = 1` the site consists of p-complete PD thickenings carrying δ-structures and `qΩ_{R/D}` is crystalline cohomology (q-crystalline and crystalline cohomology). For `D = Z_p[[q−1]], I = (q−1), R = Z_p⟨T⟩: H^0(qΩ_{R/D}) = D`, so `qΩ_{R/D}` is not the value `D⟨T⟩` of the structure presheaf on the thickening `(D⟨T⟩, (q−1))`.

**§5.10.** For `D=Z_p[[q−1]], I=(q−1), R=Z_p⟨T⟩` and `P=D⟨T⟩` in the small variant, degree one is `D⟨T₀,T₁⟩{φ(T₁−T₀)/[p]_q}^∧` (BS22 Construction 16.13, p.111).

**§5.11.** `D = Z_p[[q−1]], I = (q−1), R` p-completely smooth over `Z_p: qΩ_{R/D} ⊗`̂^`L_D Z_p ≃ RΓ_crys(R/Z_p)`, the p-completed de Rham complex of R; so `qΩ_{R/D}` is a q-deformation of de Rham cohomology. D with `q = 1`: the statement is the identity, `qΩ_{R/D} = RΓ_crys(R/D)`. `D = A_inf, I = (ξ): qΩ_{R/A_inf} ⊗`̂^`L A_inf/(q−1) ≃ RΓ_crys(R/(A_inf/(q−1)))`.

**§5.12.** `D = A_inf, J = (q−1) ⊂ I = (ξ)`: for R̃ p-completely smooth over `A_inf/(q−1)` lifting R over `O_C, qΩ_{R̃/A_inf} ≃ qΩ_{R/A_inf}`. For `q = 1` this is the invariance of crystalline cohomology under enlarging the PD ideal of the base. For `J = I` and `R̃ = R` the identification is the identity.

**§5.13.** `D = Z_p[[q−1]], I = (q−1), R` p-completely smooth over `Z_p: R^{(1)} = R ⊗`̂_`{Z_p} Z_p[ζ_p]` and `Δ_{R^{(1)}/D} ≃ qΩ_{R/D}`. `D = A_inf, I = (ξ): R^{(1)} = R ⊗_{A_inf, φ} A_inf` and `Δ_{R^{(1)}/A_inf} = φ^*Δ_{R/A_inf}`, the prismatic cohomology relative to `(A_inf, (ξ))` pulled back along `φ`. `q = 1`: the statement is the crystalline comparison of Layer 1 for the PD ideal I. `R = D/I`: both sides are D and `α` is the identity.

**§5.16.** One polynomial coordinate: `P = D⟨X⟩, J = (q−1)P` with `I = (q−1)`: the complex is `D⟨X⟩ → D⟨X⟩dX, X^n ↦ [n]_q X^{n−1}dX`; for `D = Z_p[[q−1]]` its `H^0` is D and its `H^1` is the algebraic cokernel of this differential on the completed coefficient modules. Do not replace that cokernel by the completed direct sum of `D/[n]_q`: the image of the differential need not be closed. For example, `Σ_{k≥1}[p^k]_q X^{p^k−1}dX` converges in the `(p,q−1)`-adic completion, since `[p^k]_q` lies in `(p,q−1)^k`. Its only possible primitive, up to a constant, has coefficient 1 at every `X^{p^k}`, so is not a restricted power series. The form therefore gives a nonzero `H^1` class, even though every coefficient vanishes in `D/[n]_q`. This also fixes the meaning of `H^1` in the toric model. A torus: `P = D⟨X^{±1}⟩`: the complex is `D⟨X^{±1}⟩ → D⟨X^{±1}⟩ dlog X, X^n ↦ [n]_q X^n dlog X`, with `[n]_q = (q^n − 1)/(q − 1)` for `n ∈ Z`. `S = ∅`: the complex is the envelope `D_{J,q}(P)` in degree 0. It is D for the base datum `P = D, J = I;` a nontrivial completely étale P over D need not equal D.

**§5.17.** `E = F = Δ_{R/A}` over a bounded oriented prism, with `η` the Hodge–Tate structure map: every `η`-compatible endomorphism is an automorphism. The identity of E satisfies the hypothesis and the conclusion. The unit map `A → Δ_{R/A}` for `R ≠ A/d` is not an isomorphism: A does not satisfy the de Rham hypothesis for R.

**§5.19.** One polynomial coordinate: `qΩ_{Z_p⟨X⟩/Z_p[[q−1]]}` is computed by `Z_p[[q−1]]⟨X⟩ → Z_p[[q−1]]⟨X⟩dX, X^n ↦ [n]_q X^{n−1}dX`. A torus over `A_inf: qΩ_{O_C⟨x^{±1}⟩/A_inf}` is computed by `A_inf⟨x^{±1}⟩ → A_inf⟨x^{±1}⟩ dlog x, x^n ↦ [n]_q x^n dlog x`. Modulo `q − 1` the quasi-isomorphism reduces to the statement that the de Rham complex of the p-completed PD envelope of `P/(q−1) → R` computes `RΓ_crys(R/(D/(q−1)))`.

**§5.20.** Two framings: `R = Z_p⟨T⟩` over `Z_p[[q−1]]` with coordinates T and `T + 1`. The complexes differ, `∇^{T+1}(T²) − ∇^{T}(T²) = q − 1`, and are identified through the datum on `Z_p[[q−1]]⟨T_0, T_1⟩{φ(T_1 − T_0)/[p]_q}^∧` with coordinates `T_0` and `T_1 + 1`. Three framings `T, T + 1, T + 2` of `Z_p⟨T⟩`: the three isomorphisms satisfy the cocycle identity. Equal framings give the identity.

**§5.21.** One polynomial coordinate: `R = Z_p⟨T⟩: qΩ_R`^□ `= (A⟨T⟩ → A⟨T⟩dT), T^n ↦ [n]_q T^{n−1}dT`. Modulo `[p]_q` the coefficient `[n]_ζ` is a unit for p ∤ n and 0 for p | n, so `H^0 = Z_p[ζ_p]⟨T^p⟩` and `H^1 = Z_p[ζ_p]⟨T^p⟩·T^{p−1}dT`, which are `R^{(1)}` and `Ω^1_{R^{(1)}/Z_p[ζ_p]}` through `T ↦ T^p`, as the Hodge–Tate comparison for `Δ_{R^{(1)}/A}` predicts. A torus: `R = Z_p⟨T^{±1}⟩: qΩ_R`^□ `= (A⟨T^{±1}⟩ → A⟨T^{±1}⟩ dlog T), T^n ↦ [n]_q T^n dlog T`. Two framings T and `T + 1` of `Z_p⟨T⟩` give canonically isomorphic objects of `D(A)`.

**§5.22.** A torus: `R = O_C⟨x^{±1}⟩, Σ = {x}: J_Σ = (ξ), D_{J_Σ,q}(P_Σ) = P_Σ = A⟨x^{±1}⟩, A_inf(R_{Σ,∞}) = A⟨x^{±1/p^∞}⟩` and `μ_0` is the inclusion`; μ_R` is the injective quasi-isomorphism of BMS1 Lemma 9.6. `R = O_C, Σ = ∅`: both complexes are A in degree 0 and `μ_R` is the identity. Enlarging `Σ` by a unit that is a product of the given ones changes neither side up to the canonical quasi-isomorphisms.

**§5.23.** `R = O_C`: all three objects are `A_inf`. A torus `R = O_C⟨x^{±1}⟩: AΩ_R` is computed by `A⟨x^{±1}⟩ → A⟨x^{±1}⟩, x^n ↦ [n]_q x^n`, so `H^1(AΩ_R)` is the cokernel of the diagonal operator `a_n ↦ [n]_q a_n` on the completed Laurent coefficient module, and the same complex computes `φ_A^*Δ_{R/A}`. This cokernel includes the constant mode and can have nonseparated classes: `Σ_{k≥1}[p^k]_q x^{p^k}` has no restricted Laurent primitive, although its coefficients vanish modulo `[p^k]_q`. Completed direct sums of the coefficient quotients alone do not describe `H^1`. The twist cannot be dropped: for the torus, `H^0(Δ_{R/A} ⊗^L_A A/ξ) = R` while `H^0(AΩ_R ⊗^L_A A/ξ) = O_C` (closed functions for the de Rham differential), so there is no isomorphism `AΩ_R ≅ Δ_{R/A}` in `D(A)`.

**§5.24.** The square of ring maps `θ̃∘φ_A = θ` commutes on Teichmüller elements: `θ̃([x^p]) = θ([x])`. `R = O_C`: both corners are `O_C`. Torus: the Hodge–Tate corner has `H^1` free of rank 1 over R, the de Rham corner has `H^1 = coker(x^n ↦ n x^n)` on `O_C⟨x^{±1}⟩`. In particular `Σ_{k≥1}p^k x^{p^k}dlog x` defines a nonzero class whose coefficients all vanish in `O_C/n`: its formal primitive has coefficient 1 at every `x^{p^k}`, and does not converge. Thus this `H^1` cannot be replaced by the completed direct sum of `O_C/n`.

**§5.25.** `S = R: Δ_{R/A} = A` and the only A-algebra endomorphism of A is the identity. `S = R⟨x^{1/p^∞}⟩/(x): Δ_{S/A} = A_inf(R⟨x^{1/p^∞}⟩){[x^♭]/d}^∧`, and a functorial `η`-compatible endomorphism fixes `[x^♭]/d` and all `δ_n([x^♭]/d)`. Hodge–Tate normalization excludes the automorphism `A_inf(τ)` induced by a nontrivial R-automorphism τ of perfectoid S: its reduction is τ under `η_S:S≃Δ̄_(S/A)`, so it does not preserve `η_S`. The comparison map of Comparison with `AΩ` built from all coordinates equals the one built from any single framing.

**§5.26.** One coordinate, `R = O_C⟨T^{±1}⟩: N^{≥1}M^•` is `ξ·A⟨T^{±1}⟩ → A⟨T^{±1}⟩·d_q` log T, and `N^{≥i}M^•` is `ξ^i·A⟨T^{±1}⟩ → ξ^{i−1}·A⟨T^{±1}⟩·d_q` log T for `i ≥ 1`. Graded pieces: `gr^i` of `N^{≥•}M^•` is, in degree `n ≤ i, (ξ^{i−n}M^n/ξ^{i−n+1}M^n) ≅ Ω^n_{R/O_C}`, with zero differential, matching `gr^i_N ≅ τ^{≤i}Δ̄_{R/A}{i}` of §3.15. After base change along `A_inf → W(k), k` the residue field of `O_C` (so `q ↦ 1` and `ξ ↦ p`), the filtration becomes `p^{max(i − •, 0)}` of the de Rham complex of the lift `R̃ ⊗`̂ `W(k)`, the de Rham instance of §3.24. Modulo `q − 1` alone this is not so: `ξ` is not p times a unit in `A_inf/(q − 1)`. The element `T^a` with p ∤ a is not a cocycle modulo `ξ̃` in degree `0: ∂_q/∂_q` log `T (T^a) = [a]_q T^a` with `[a]_q a unit` modulo `ξ̃`; so `H^0(M^•/ξ`̃) is spanned by the `T^{pa}`.

### Dependencies

Layers 0, 1, 2, 3; AInfCohomology Layer AI.1, AInfCohomology §AI.1.4, AInfCohomology §§AI.1.1–AI.1.2, AI.1.7, AInfCohomology §§AI.3.1–AI.3.3, AInfCohomology §§AI.3.2–AI.3.3, AI.4.1–AI.4.4, DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7; CrystallineCohomology §§CR.DDR.5.20–CR.DDR.5.21, CrystallineCohomology Layer CR.2, §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology Layer 1, DerivedDeRhamCohomology §§5.1–5.7, EnhancedDerivedSheaves Layer E2, EnhancedDerivedSheaves Layer E3, EnhancedDerivedSheaves §E5:abstract.2, EnhancedDerivedSheaves §E5:abstract.1, PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, [§5.0](#s5-0). Exact inputs are given in the supplier contracts; internal construction dependencies are linked above.

## Downstream consumers

PrismaticCohomologyPartIII Layers 6–7 consumes the Nygaard, absolute and q-comparison theory; PrismaticCohomologyPartIV Layer 8 uses the logarithmic adapters of PrismaticCohomologyPartIII. HabiroCohomologyFoundations uses the local q-crystalline comparison. PadicHodgeTheory and CohomologyComparisons consume the comparison interfaces.

## References

<a id="ref-bl22"></a>

- **BL22**: Bhargav Bhatt and Jacob Lurie. [Absolute prismatic cohomology](https://arxiv.org/abs/2201.06120v1). arXiv:2201.06120v1, 16 January 2022.

<a id="ref-bs23-fcrys"></a>

- **BS23-FCRYS**: Bhargav Bhatt and Peter Scholze. [Prismatic F-crystals and crystalline Galois representations](https://arxiv.org/abs/2106.14735v2). arXiv:2106.14735v2.

<a id="ref-bms2"></a>

- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze. [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/abs/1802.03261v2). arXiv:1802.03261v2, 9 April 2019.

<a id="ref-alb23"></a>

- **ALB23**: Johannes Anschütz and Arthur-César Le Bras. [Prismatic Dieudonné theory](https://arxiv.org/abs/1907.10525v4). arXiv:1907.10525v4, 11 October 2022; numbering of the arXiv version.

<a id="ref-bms1"></a>

- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze. [Integral p-adic Hodge theory](https://arxiv.org/abs/1602.03148v3). arXiv:1602.03148v3, 16 January 2019.

<a id="ref-ky"></a>

- **KY**: Teruhisa Koshikawa and Zijian Yao. [Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364v1). arXiv:2306.00364v1, 1 June 2023 (98 pp.).

<a id="ref-bs22"></a>

- **BS22**: Bhargav Bhatt and Peter Scholze. [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4). arXiv:1905.08229v4, 12 January 2022, 125 pages; author version.

<a id="ref-ff"></a>

- **FF**: Laurent Fargues and Jean-Marc Fontaine. [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf). Astérisque 406 (2018); printed book pages.

<a id="ref-lurie"></a>

- **Lurie**: Jacob Lurie. [Rational and p-adic homotopy theory, DAG XIII](https://www.math.ias.edu/~lurie/papers/DAG-XIII.pdf). §2.2, especially Remark 2.2.7, p.35.

<a id="ref-sag"></a>

- **SAG**: Jacob Lurie. [Spectral Algebraic Geometry](https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf). Manuscript dated 3 February 2018; §§6.2–6.3, printed pages.

<a id="ref-ha"></a>

- **HA**: Jacob Lurie. [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf). Manuscript dated 18 September 2017; numbered propositions and printed pages.

<a id="ref-sqdef"></a>

- **SQDEF**: Peter Scholze. [Canonical q-deformations in arithmetic geometry](https://arxiv.org/pdf/1606.01796v1). arXiv:1606.01796v1, 6 June 2016; §§3–4, printed pages.
