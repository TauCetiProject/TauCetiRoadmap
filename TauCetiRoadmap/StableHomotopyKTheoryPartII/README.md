# Roadmap: homotopy foundations for algebraic K-theory, part II

**Summary.** Starting from spectra, derived smash products, Steenrod operations and the Adams tower, build the cohomological and topological Singer constructions and prove the generalized Segal conjecture for every bounded-below spectrum at every prime. Identify the Tate-valued Frobenius with classical power operations in every integer degree, including its total Steenrod and periodic complex K-theory forms. Prove the simply connected free-loop Segal theorem and retain explicit counterexamples showing where boundedness is essential.

## Scope and ownership

StableHomotopyKTheory Part I stops at the stable homotopy foundations, completion and spectral-sequence machinery of Layers 5–7. This Part II owns the homological Tate spectral sequence of Greenlees towers in continuous mod-p homology, the Singer module and its augmentation, the inverse-limit Adams comparison, the finite-type and arbitrary-cardinality steps in the prime-order generalized Segal theorem, the Weyl refinement, the comparison with representation-twisted power operations, the spherical finite-field Witt Frobenius (§4.8 owns the spherical lift SW(k) of a finite field k as the marked étale lift over S_p^∧; spherical lifts of general perfect p-complete δ-rings are not constructed in this roadmap), the total Steenrod comparison, the KU Adams comparison and the free-loop theorem. The group in the tensor Tate diagonal is C_p; a general finite-group Segal conjecture is outside this statement.

The general constructions have the following owners, and are consumed by the exact contracts below.

- GeneralizedCohomology G2.8 owns symmetric extended powers as the summands of the free commutative spectral algebra; BordismFormalGroups §F6.5 supplies restriction to subgroups and coherent permutation actions. The cyclic desuspension tower here is an additional comparison of those powers.
- TangentialBordism §B4 items 1, 2 and 7 owns ordinary and stable Steenrod operations, their complete operation algebra, admissible basis, Milnor dual, coproduct and conjugation at all primes. Its items 2 and 8 own the mod-p Adams tower, cohomological Ext page and bounded-below finite-type convergence. These constructions are not targets here. BordismFormalGroups §F6.3 owns the finite Steenrod Hopf subalgebras and their free-module tools, including the exhaustive chain A_p(n) and the freeness of A_p over each A_p(n) that the Singer Tor-equivalence uses, specified in its exhaustive-chain contract below.
- BordismFormalGroups §F6.5 owns finite Borel actions, norms, Tate, induced-object vanishing, multiplicativity, restriction, transfer and finite-height Tate descent. KTheoryFiniteLocalFields §4.5 owns Eilenberg–MacLane/Tate comparison, the algebraic cyclic resolution and the homotopy Tate spectral sequence; its continuous mod-p homology form for bounded-below finite-type inputs is §1.2 here. The coefficient target in Layer 1 adds a fixed Weyl normalization to those calculations.
- AInfCohomology §AI.7.2 owns the spectral Tate diagonal and the Tate orbit lemma. RefinedTraceMethods §§2.3–2.4 supplies the boundedness and parametrized extensions; its §2.3 owns the Tate fixpoint lemma and the p-completion invariance of Tate for bounded-below inputs. The sphere counterexample (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧≠0 to the fixpoint lemma is a consequence of the C_p Segal theorem §2.7 here and is derived in the Layer 7 Examples, beside the KU orbit and tensor-diagonal counterexamples. RefinedTraceMethods §§2.6, 2.8 and 2.10–2.16 own the THH, E∞ Frobenius and genuine cyclotomic interfaces; its §2.10 supplies the loop-space model; the Segal equivalence of that model is proved in Layer 8 here.
- GeneralizedCohomology G4.2 and G5.3 owns ordinary Thom spaces and compatible Thom-spectrum diagrams; RefinedTraceMethods §2.13 owns genuine representation spheres. Layer 5 here adds tensor-inverse virtual twists over arbitrary spaces and their power-operation comparison. EnhancedDerivedSheaves E3 and E5 supplies the coherent Kan-extension and monoidal formalism.
- GeneralizedCohomology G5.4 owns ku and KU. TopologicalKTheory T1–T5 owns bundle K-theory, Bott periodicity, splitting and degree-zero Adams operations. RefinedTraceMethods §5.1 owns Snaith's comparison and stable Adams operations after inverting their index. Layer 7 adds Atiyah-power compatibility, cyclic Tate coefficient fields and their Frobenius comparison.
- Mathlib already has ordinary and Witt Frobenius and the finite inverse-system tools listed below. The finite-tower theorem here assembles the nonsurjective and empty-limit cases into a pro-isomorphism; it does not redefine compatible sections or eventual ranges.

## Conventions

Fix a universe of small spaces and spectra; every cell set, vector-space basis, indexing set and countable tower belongs to it. Arbitrary cardinality means every such set, including uncountable ones. All tensor products are derived smash products in spectra, or relative derived tensor products when a base is specified. Actions are coherent functors out of BG. A genuine G-spectrum includes representation-sphere stabilization; genuine fixed points are distinguished from Borel homotopy fixed points.

Use π_iE=[ΣⁱS,E] and Rⁿ(X)=[Σ∞_+X,ΣⁿR], so Rⁿ(*)=π_(−n)R. Suspensions and virtual ranks range over ℤ. The symmetry on two suspension coordinates of degrees a,b has sign (−1)^(ab); two degree-one coordinates give −1 and two degree-two coordinates give +1. Steenrod composition acts from right to left. For a homogeneous class, β(xy)=β(x)y+(−1)^|x|xβ(y). Negative-index squares and reduced powers are zero; the zero-index operations are the identity. Instability is used on spaces only.

A prime p is always an integer prime, including 2 and 3. Fix a p-cycle identifying C_p inside Σ_p and write W=N_(Σ_p)(C_p)/C_p=𝔽_p^×. The action on coefficients is the conjugation convention specified in Layer 1. The symbol can is the map from homotopy fixed points to Tate; const is induced by BG→*. For a ring spectrum R, the unrefined Frobenius is φ_R=(μ_R)^(tC_p)∘Δ_p, with R carrying the trivial action at its target. Tensor powers carry the permutation action. The Weyl-refined Frobenius has target (R^(tC_p))^(hW).

Derived p-completion is the spectral localization with the function-spectrum model of GeneralizedCohomology G3.9, with completeness criteria in StableHomotopyKTheory §§7.14–7.16. A p-adic equivalence has mod-p Moore cofiber zero. A finite-type spectrum has degreewise finite-dimensional mod-p homology; bounded below means π_i=0 for all i below some integer, which can depend on the object. A compact space in the KU comparison is a homotopy retract of a finite CW complex. The finite p-complete class in §4.7 consists of p-completions of finite spectra and retracts of finite cell S_p^∧-modules. For the p-inversion diagram on S_p^∧, the colimit in p-complete spectra is zero while the colimit of π₀ maps out of S_p^∧ is ℚ_p; these are different finiteness notions (§4.7; ns18, Example IV.1.2(ii), p.325; ns18 line 4852).

A Laurent coefficient ring below is graded. Its homogeneous pieces do not include arbitrary ungraded series. In Tate-valued cohomology such as H*(X;𝔽_p)((t^(p−1)))⊗Λ(e), Tate coefficients are written to the right of cohomology classes and pass them with the Koszul sign, so e·z=−z·e for z of odd degree; a component of a class is its right coefficient of the named Tate monomial. Product decompositions of spectra induce products of mapping groups; no unrestricted tensor/cohomology interchange is assumed. Binomial coefficients with an integer upper argument use the integral polynomial convention, and a negative lower argument means zero: binom(−1,1)=−1, which is 1 in 𝔽₂. The KU Bott class β has homotopy degree 2 and is [H]−1 on S² for the chosen line H (ns18, Proposition IV.1.12, pp.329–330; ns18 line 5002). Set x=L−1; the multiplicative p-series is (1+x)^p−1, and its value at x=0 is 0.

## Exact supplier contracts

### From Mathlib

Use `CategoryTheory.Functor.sections` in Mathlib/CategoryTheory/Types/Basic.lean: a section is an element of the dependent product satisfying every transition equation. This definition includes neither nonemptiness nor finiteness. In Mathlib/CategoryTheory/CofilteredSystem.lean use `CategoryTheory.Functor.eventualRange`, `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`, `CategoryTheory.Functor.toEventualRangesSectionsEquiv`, `CategoryTheory.Functor.surjective_toEventualRanges`, `CategoryTheory.Functor.eval_section_surjective_of_surjective`, `CategoryTheory.Functor.eventually_injective` and `nonempty_sections_of_finite_cofiltered_system`. Keep each theorem's cofilteredness, finite-stage, surjectivity and nonemptiness hypotheses: eventual injectivity is a theorem for a surjective finite system, not for an arbitrary original tower.

Use `frobenius` from Mathlib/Algebra/CharP/Lemmas.lean on a commutative semiring of exponential characteristic p. Use `WittVector`, `WittVector.frobenius`, `WittVector.coeff_frobenius_charP` and `WittVector.frobenius_zmodp` from Mathlib/RingTheory/WittVector/Basic.lean and Frobenius.lean, with p prime and a commutative coefficient ring. The coefficientwise pth-power formula additionally requires characteristic p. It does not say that all Witt Frobenius maps are the identity. Use `WittVector.equiv` in Mathlib/RingTheory/WittVector/Compare.lean, the ring isomorphism from the Witt vectors of `ZMod p` to `ℤ_[p]` for p prime, to identify W(𝔽_p) with ℤ_p; this identification is not part of the finite-field contract below.

### From Tau Ceti

No extra Tau Ceti module is required by Suggested.lean. The spectral interfaces below are roadmap contracts on the shared spectrum model, rather than definitions encoded by unrelated native types.

### From TauCetiRoadmap.StableHomotopyKTheory

Consume Layer 5's spectrum model, Eilenberg–MacLane spectra and ordinary cohomology comparison, smash, suspension, connectivity and operadic ring/module objects. Consume §7.9 for Milnor comparison, §§7.14–7.18 for completeness, detection and closure, and §7.19 for rational spectra, using GeneralizedCohomology G3.8–G3.9 for the homotopy-limit and derived-completion carriers, and §§7.21–7.26 for the exact-couple pages and complete convergence criteria. In particular a filtration page alone supplies no convergence theorem. Preserve integer gradings and the shared spectrum comparison of GeneralizedCohomology G2–G3.

### From TauCetiRoadmap.GeneralizedCohomology

Use G2.8 for D_k(E)=(E^(⊗k))_(hΣ_k) and its coherent functoriality, sum expansion, subgroup restriction and equivalence invariance, together with BordismFormalGroups §F6.5 for subgroup Borel constructions. Write D_G for restriction to G≤Σ_k, k≥1. The permutation-suspension identity is D_G(ΣⁿE)=(S^(nρ_k)⊗E^(⊗k))_(hG), with the actual restricted permutation representation. It gives D_G(S)=Σ∞_+BG and preserves filtered colimits. These are the imported extended-power API (bmms86, VIII.1, Propositions 1.1–1.4, scan pp.130–132; bmms86 line 4297).

**Checks.**

- For k≥1 the zero input gives D_G(0)=0; at k=0 the empty tensor instead gives S, so the lower bound matters.
- For k=1 the group is trivial and D_1(E)=E. For k=3, G=S₃ and E=S, π₀D_G(S)=ℤ and the orbit object is Σ∞_+BS₃, rather than a fixed-point spectrum.
- At k=2 the swap on (ΣS)^(⊗2) has degree −1, while on (Σ²S)^(⊗2) it has degree +1. A trivial action on the first suspension would fail this test.

Use G4.2 and G5.3 for ordinary and compatible Thom objects and G5.4 for the commutative spectral rings ku, KU, their Bott localization and their bundle comparison. Their chosen Bott class and complex orientation are retained, rather than chosen independently.

### From TauCetiRoadmap.TangentialBordism

Consume §B4 items 1, 2 and 7 for Sq, P and β on spaces, relative groups and spectra, their normalization, suspension, naturality, Cartan and Adem, and the identification with the full algebra of stable operations. Consume its admissible basis and graded Milnor dual: at 2, 𝔽₂[ξ₁,ξ₂,…], |ξ_i|=2ⁱ−1; at odd p, Λ(τ₀,τ₁,…)⊗𝔽_p[ξ₁,ξ₂,…], |τ_i|=2pⁱ−1 and |ξ_i|=2(pⁱ−1). Fix ξ₀=1 and coproduct Δξ_n=Σ_i ξ_(n−i)^(pⁱ)⊗ξ_i and Δτ_n=τ_n⊗1+Σ_i ξ_(n−i)^(pⁱ)⊗τ_i. Tensor products have the Koszul sign. Cohomology of each spectrum is a graded left A_p-module, contravariantly functorial; the graded tensor action uses this coproduct. Multiplication is composition of the representing spectrum maps. These exact conventions are needed by the Singer formulas (milnor58, §§2–3 and 5, Theorems 1–3, pp.153–162, Appendix 1, p.171; bmms86, VIII.2, scan pp.133–135; Cartan exposés 14–16, locators in References).

The consumed operation API includes pullback and suspension compatibility, zero-index identity, positive operations on the degree-zero unit equal to zero, top-square and even top-power laws on spaces, the admissible basis of all stable operations and agreement of composition with spectrum maps. Each dual degree is finite. The exhaustive chain of finite sub-Hopf algebras A_p(n) and the freeness of A_p over each of them are not part of this contract or of TangentialBordism §B4 item 8, whose freeness is over the infinite exterior algebra of Milnor primitives; they are the exhaustive-chain contract below. No instability relation is imposed on general A_p-modules.

**Checks.**

- For u in H¹(ℝP∞;𝔽₂), Sq¹u=u²≠0 and Sq²u=0; Sq⁰u=u. An unstable relation on the operation algebra itself would discard legitimate stable operations.
- For v in H²(ℂP∞;𝔽_p), P¹v=v^p≠0 and P²v=0. At p=3 the degree of P¹v is 6=2+4, rather than 4.
- For x in H¹(BC_p;𝔽_p), βx=y≠0 and βy=0. For degree-one x and z, the second term of β(xz) has coefficient −1, which is 2 at p=3.
- Composition gives Sq¹Sq¹=0, Sq¹Sq²=Sq³ and, at p=3, P¹P¹=2P². These distinguish right-to-left composition and the coefficient normalization.
- The dual has dimensions 1,1,1 in degrees 0,1,2 at 2; at p=3 the first odd class is τ₀ in degree 1, with ξ₁ in degree 4. The degree-zero algebra is 𝔽_p and its unit acts as the identity.

Consume §B4 items 2 and 8 for the tower I^(⊗s)⊗B, I=fib(S→H𝔽_p), with cofibers H𝔽_p⊗I^(⊗s)⊗B and augmented cobar object B⊗H𝔽_p^(⊗(n+1)). Its functoriality and normalized cobar differential give Ext_(A_p)^(s,t)(H*(B;𝔽_p),𝔽_p) for bounded-below degreewise finite-type B. Its differential changes (s,t) by (r,r−1), so the stem t−s drops by one. The same hypotheses give strong convergence to π_(t−s)(B_p^∧) with complete Hausdorff Adams filtration (lnr12, §2.1 and Proposition 2.2, pp.864–869; lnr12 line 265).

**Checks.**

- B=0 gives zero terms and zero pages; the tower's filtration-zero term is B itself.
- For B=H𝔽_p, H*(B)=A_p, so E₂ is 𝔽_p at (0,0) and zero elsewhere; its abutment has the same single nonzero homotopy group.
- For B=S, E₂ is Ext_(A_p)(𝔽_p,𝔽_p), with nonzero positive filtration. Replacing A_p by the coefficient field would erase those terms.

### From TauCetiRoadmap.BordismFormalGroups

Consume §F6.3 for its finite Steenrod sub-Hopf algebras E(Q_i) and T_t with their Margolis free-module criteria, §F6.1 for Bousfield localization, §F6.4 for the smashing theorem L_nX≃L_nS⊗X, §F3 for ku_(2)≃BP⟨1⟩ and for E(1) as the v₁-localization of BP⟨1⟩, and §F6.5 for finite-action norms, their unshifted Tate cofibers, induced vanishing, lax monoidal products, restriction and transfers. Its finite-height descent states that (L_nS)^(tG) is E(n−1)-local for n≥1 and finite G. At n=1 this is rationality of raw Tate, which is stronger than merely the vanishing after K(1)-localization. Layer 7 specializes this result to the KU-local sphere and the swap action.

The additional BordismFormalGroups §F6.3 contract is the exhaustive finite Hopf-algebra chain: For every prime p and every n≥−1, the quotient of the dual Steenrod algebra by the ideal generated by the τ_r with r>n and the ξ_s^(p^r) with r+s≥n+1 at odd p, and by the ξ_s^(2^r) with r+s≥n+2 at p=2, is a Hopf algebra quotient dual to a finite sub-Hopf algebra A_p(n) of A_p; these form an increasing chain with A_p(−1)=𝔽_p and union A_p, and A_p is free as a left and as a right module over each A_p(n) (agm85, §2, p.439; agm85 line 214; the freeness enters the proof of Lemma 2.2, p.441; agm85 line 290).

**Checks.**

- For G trivial the norm is the identity and Tate is zero; for the induced object Σ∞_+G, Tate is also zero. Ordinary fixed points would not pass either test.
- For Hℤ with trivial C₂-action, the norm on π₀ is multiplication by 2 and Tate π₀ is ℤ/2; the finite norm has no suspension shift.
- At height 1 the local target of descent is E(0)=Hℚ, while at height 2 it is E(1). K(1)-acyclicity alone does not identify an arbitrary spectrum as rational.
- In the chain, n=−1 kills every τ_r and ξ_s, so A_p(−1)=𝔽_p, of dimension 1. For n=0 only τ₀ survives at odd p and only ξ₁ with ξ₁²=0 at p=2, so A_p(0) is the exterior algebra on β, respectively on Sq¹, of dimension 2.
- A₂(1) is dual to 𝔽₂[ξ₁,ξ₂]/(ξ₁⁴,ξ₂²), of dimension 8, and is generated by Sq¹ and Sq². At odd p, A_p(1) is dual to Λ(τ₀,τ₁)⊗𝔽_p[ξ₁]/(ξ₁^p), of dimension 4p, hence 12 at p=3. The exterior algebra E(Q₀,Q₁) has dimension 4, so the Margolis subalgebras of §F6.3 do not form this chain.
- Left multiplication by Sq¹ on A₂ sends Sq⁰↦Sq¹, Sq¹↦0, Sq²↦Sq³, Sq³↦0 and Sq²Sq¹↦Sq³Sq¹, so its kernel equals its image in degrees 0 to 3, as freeness over A₂(0)=Λ(Sq¹) requires. The module 𝔽₂ with Sq¹ acting by zero has homology 𝔽₂ in degree 0 and is not free.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

Consume §4.0's genuine cyclic models and §4.5's Eilenberg–MacLane/Tate comparison, complete cyclic resolution, cup products and spectral comparison, and its Tate spectral sequence E²_(s,t)=Ĥ^(−s)(G,π_tT) with its pairings, its comparison with the Greenlees filtration and its conditional convergence to π_(s+t)T^(tG). It is a homotopy spectral sequence; its form for continuous mod-p homology is §1.2 here, and conditional convergence is not upgraded to strong convergence without the hypotheses stated there. In particular the trivial cyclic resolution alternates 0 and multiplication by p for a trivial integral coefficient module, and the mod-p differential is zero. The Weyl action and its chosen coefficient basis are fixed in Layer 1.

### From TauCetiRoadmap.AInfCohomology

Consume §AI.7.2, “Spectral Tate diagonal”, for the exact tensor-Tate functor, its unit-normalized lax monoidal diagonal and its coherent naturality. Consume “Circle actions, homotopy fixed points and Tate constructions” for the Tate orbit lemma with its bounded-below hypothesis and residual quotient action. The sphere Check of the Tate diagonal fixes the map S→S^(hC_p)→S^(tC_p); its identification as the p-completion of S is proved in §2.7 here and is not an input of any layer.

### From TauCetiRoadmap.RefinedTraceMethods

Consume §§2.1 and 2.3–2.4 for orbit/fixed-point adjunctions, Postnikov/Tate comparisons, boundedness criteria, p-completeness and parametrized spectra. From §2.3 consume also the Tate fixpoint lemma for bounded-above spectra with C_(p²)-action, and its part (iii): X^(tC_p) is p-complete and X^(tC_p)≃(X_p^∧)^(tC_p) for bounded-below X. The sphere value (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧ that §2.3 records beside the fixpoint lemma, and the equivalence S^(tC_p)≃S_p^∧ that §§2.3 and 2.6 record, are outputs of §2.7 here; they are premises of no layer. Consume §§2.5–2.6 for cyclic realization, edgewise subdivision and THH Frobenius; §2.8 supplies the E∞ Tate-valued Frobenius as multiplication after Δ_p, equivalently the THH Frobenius followed by augmentation. This supplies the unrefined map on all E∞-rings without using its Segal equivalence.

Consume §2.10's cyclic-bar equivalence THH(S[ΩY])=Σ∞_+LY and its cyclotomic model, §§2.11–2.13's genuine and representation-sphere models, and §2.16's restriction pullback for genuine fixed points. Consume §5.1 for coherent stable ψ^k on KU[1/k] and §6.1 for the equivalence between étale algebras over a connective E∞-ring and étale algebras over its π₀. The marked lift over S_p^∧ and its maps are the ones used here.

The additional RefinedTraceMethods §6.1 contract is the finite-field Witt étale/Frobenius theorem: For every prime p and finite field k of degree d≥1 over 𝔽_p, W(k) is finite étale and free of rank d over ℤ_p, identified with W(𝔽_p) by the pinned `WittVector.equiv`, and reduction identifies its ℤ_p-algebra endomorphisms with the 𝔽_p-endomorphisms of k, carrying Witt Frobenius to a↦a^p.

**Checks.**

- For k=𝔽_p, the rank is 1 and Witt Frobenius is the identity; for k=𝔽₄ with a²+a+1=0, Frobenius sends a to a²=a+1 and its square fixes a.
- At p=2, stable ψ² sends β to 2β and β⁻¹ to β⁻¹/2; the localized codomain is required.
- At Y=* the cyclic-bar/free-loop equivalence gives S. The cyclotomic map is the sphere's constant-to-Tate map, not an arbitrary endomorphism with the same source and target.

### From TauCetiRoadmap.EnhancedDerivedSheaves and TauCetiRoadmap.AlgebraicTopology

Use EnhancedDerivedSheaves E3, “Coherent diagrams, Kan extensions and adjoints”, and E5:abstract for coherent symmetric monoidal stable categories, operadic algebra/module objects and the adjunctions p_!⊣p*⊣p_*. Use AlgebraicTopology Stage 6, “Cohomology, products and manifold duality”, for ordinary cup products and their relative comparisons. Use the common ordinary cohomology supplied to TangentialBordism; changing ordinary cochain models retains its operation comparisons.

### From TauCetiRoadmap.TopologicalKTheory

Consume T1–T5, specifically T2.5's degree-zero Adams operations and T4's Bott comparison, with the tautological-line convention. Splitting is applied to finite CW spaces and retracts; tensor products of complexes, rather than a formal power of a difference, define the cyclic operation on virtual classes in Layer 7.

## How to read the build

Layer 1 fixes the cyclic and Weyl coefficient normalization on the supplied operation algebra and passes the supplied Tate spectral sequence to continuous mod-p homology of Greenlees towers. Layer 2 constructs Singer modules, their continuous-cohomology realization and the convergent inverse-limit Adams comparison, obtaining finite-type Segal. Layer 3 proves uniform pro-constancy and removes every finite-type restriction from the bounded-below theorem. Layer 4 refines the diagonal and compares degree-zero powers and Frobenius. Layer 5 retains permutation spheres through all integer degrees. Layer 6 reads off the Steenrod components; Layer 7 calculates KU and the boundedness obstructions. Layer 8 applies the Segal theorem to a controlled free-loop totalization. Suggested.lean is the acceptance-signature companion; this README specifies the roadmap and every construction, API and Check.


## Layer 1: Cyclic coefficients, permutation conventions and homological Tate spectral sequences

Normalize the cyclic coefficient generators and the conjugation action needed by the Singer and Frobenius comparisons. The Steenrod algebra and its degreewise finite Milnor dual enter with the conventions of the supplier contracts. Then pass the supplied homotopy Tate spectral sequence to the continuous mod-p homology of a Greenlees tower, the form in which the Singer comparison detects the unit.


### 1.1 Cyclic Tate coefficients and Weyl weights

Using the supplied cyclic Tate comparison, for the trivial C_p-action, the cohomologically graded Tate coefficient algebra of H𝔽₂ is 𝔽₂[s^(±1)], |s|=−1. For odd p it is 𝔽_p[t^(±1)]⊗Λ(e), |t|=−2 and |e|=−1. Normalize the generators as follows: let b∈H¹(C_p;𝔽_p)=Hom(C_p,𝔽_p) send the chosen p-cycle to 1, put u=βb∈H²(C_p;𝔽_p), and set t=u⁻¹ and e=b·u⁻¹. Then t⁻¹e=b and βe=1 for the Bockstein on Tate cohomology. Rescaling b by λ∈𝔽_p^× fixes e and t^(p−1)=u^(−(p−1)), so these two classes, and every formula below written in them, do not depend on the choice of b. Under the normalizer quotient W=𝔽_p^×, a acts on t by a and fixes e; therefore invariants are 𝔽_p[t^(±(p−1))]⊗Λ(e). For HZ the Tate groups are 𝔽_p in even degrees and zero in odd degrees, and W-invariants occur in degrees divisible by 2(p−1). These are graded coefficient rings, not rings of arbitrary ungraded infinite series. (ns18, §I.1, p.218; §IV.1, discussion before Theorem IV.1.15, p.332; ns18 line 5098)

Throughout this statement, p prime; W=N_(Σ_p)(C_p)/C_p; coefficient actions are trivial.

At p=3 the invariant even generator has degree −4, not −2.

The odd generator e has degree −1 and weight zero, while t^(−1)e has weight a^(−1).

One proof route is as follows. Use the alternating maps g−1 and N in the complete cyclic resolution; cup products give the Laurent generator and, at odd p, the exterior generator. Compute the normalizer action on H¹(C_p;𝔽_p) by conjugation, then choose t and e as above. For HZ use the same resolution and reduction; take W-invariants since |W| is invertible on these p-primary groups. (ns18, §I.1, p.218; §IV.1, discussion before Theorem IV.1.15, p.332; ns18 line 5098)

**Checks.**

- At p=3 and a=−1, t has weight −1 and t² has weight +1; the invariant even generator has cohomological degree −4. A degree −2 invariant would fail.
- The classes e and t⁻¹e have cohomological degrees −1 and 1 and weights 1 and a⁻¹ respectively; treating both as invariant gives the wrong H¹ action.
- For Hℤ with p=2 the cyclic complex gives π₀=ℤ/2 and π₁=0, whereas H𝔽₂ Tate has one 𝔽₂ in every degree. At p=3 the integral invariant periods are 4.
- With t=u⁻¹ and e=b·u⁻¹, β(e)=β(b)·u⁻¹−b·β(u⁻¹)=u·u⁻¹−0=1. The pair (−t,−e) has the same product t⁻¹e=b, the same degrees and the same weights, but β(−e)=−1; it is excluded by this normalization and would reverse the sign of every Bockstein coefficient in §6.2.
- At p=3 replacing b by 2b gives u'=2u, t'=2t and e'=e, while t'²=4t²=t². The square t² is the same class for every choice, so the sign of the reduced-power coefficients in §6.2 cannot be changed by rescaling t.

*Needs:* KTheoryFiniteLocalFields §4.5 (Eilenberg–MacLane Tate comparison); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); AlgebraicTopology Stage 6 (ordinary cup products).


### 1.2 The homological Tate spectral sequence of a Greenlees tower

Let G be a finite group, p a prime and X a spectrum with coherent G-action that is bounded below and of finite type over 𝔽_p. Write X^(tG)[s], s∈ℤ, for the Greenlees filtration stages of the Tate construction, built from a G-CW filtration of ẼG with finite skeleta, so that X^(tG)≃holim_(s→−∞)X^(tG)[s]. Each stage X^(tG)[s] is bounded below and of finite type over 𝔽_p. Define the continuous homology H^c_*(X^(tG);𝔽_p)=lim_(s→−∞)H_*(X^(tG)[s];𝔽_p) and the continuous cohomology H_c^*(X^(tG);𝔽_p)=colim_(s→−∞)H^*(X^(tG)[s];𝔽_p). Then:

- there is a natural isomorphism H^c_*(X^(tG);𝔽_p)≅π_*((H𝔽_p⊗X)^(tG)), where H𝔽_p carries the trivial action;
- the Tate spectral sequence of H𝔽_p⊗X, filtered by the Greenlees tower, has E²_(s,t)=Ĥ^(−s)(G;H_t(X;𝔽_p)) and converges strongly to H^c_(s+t)(X^(tG);𝔽_p); the filtration by the kernels of H^c_*(X^(tG))→H_*(X^(tG)[s]) is exhaustive, complete and Hausdorff;
- its page-wise 𝔽_p-dual is the cohomological Tate spectral sequence with E₂^(s,t)=Hom_(𝔽_p)(Ĥ^(−s)(G;H_t(X;𝔽_p)),𝔽_p)≅Ĥ_(−s)(G;H^t(X;𝔽_p)), converging to H_c^(s+t)(X^(tG);𝔽_p). Here Ĥ_(−s) denotes Tate homology, equivalently Ĥ^(s−1), with the contragredient action on the coefficient dual. In each degree H_c^* is the continuous 𝔽_p-dual of H^c_*, the latter carrying its inverse-limit topology;
- if X is a G-equivariant ring spectrum, with unit and multiplication equivariant for the trivial action on S and the diagonal action on X⊗X, the spectral sequence is multiplicative: the E² product is the Tate cup product combined with the Pontryagin product of H_*(X;𝔽_p), the differentials are derivations, and the unit of H^c_*(X^(tG)) is represented by the unit 1⊗1 of Ĥ⁰(G;H_0(X;𝔽_p)).

(lnr12, §4.3, Corollary 4.11, p.890; §4.4, Definition 4.12, Remark 4.13 and Propositions 4.14–4.16, pp.891–894; §4.5, Proposition 4.17, p.895; lnr12 line 1488)

The supplied Tate spectral sequence computes homotopy groups; this target is its form for continuous mod-p homology, which is not the mod-p homology of the inverse limit.

The finite-type hypothesis is used twice: to kill the lim¹ term in the comparison with π_*((H𝔽_p⊗X)^(tG)), and to make the E² groups finite in each bidegree for strong convergence.

One proof route is as follows. The finite skeleta of ẼG are G-equivariantly dualizable, so each Greenlees stage of H𝔽_p⊗X is H𝔽_p⊗X^(tG)[s], whose homotopy is H_*(X^(tG)[s];𝔽_p). These groups are finite in each degree, so the Milnor sequence of the tower has no lim¹ term, which gives the first item. Apply the supplied Tate spectral sequence to H𝔽_p⊗X, using its comparison with the Greenlees filtration, to identify E². The differentials are entering, and finiteness of E² in each bidegree kills the derived limit of the cycle groups, so the conditional convergence becomes strong convergence by Boardman's criterion. Dualize the exact couple stage by stage, using that each stage has finite type. For ring spectra, H𝔽_p⊗X is again a G-equivariant ring spectrum, Tate is lax monoidal, and the supplied pairings make the spectral sequence multiplicative; the unit S→ẼG is the bottom skeleton, so the unit lies in filtration zero. (lnr12, §4.3, Corollary 4.11, p.890; §4.4, Definition 4.12, Remark 4.13 and Propositions 4.14–4.16, pp.891–894; §4.5, Proposition 4.17, p.895; lnr12 line 1488)

**Checks.**

- For X=S with trivial C₂-action at p=2, E²_(s,t) is 𝔽₂ for t=0 and every s, and zero for t≠0, so every differential vanishes and H^c_n(S^(tC₂);𝔽₂)=𝔽₂ for every integer n. By §2.7 the limit S^(tC₂) is S₂^∧, whose ordinary mod-2 homology is 𝔽₂ in degree 0 only, so defining continuous homology as the homology of the limit fails.
- If p does not divide the order of G, for instance G=C₃ at p=2 or G trivial, then Ĥ^*(G;M)=0 for every 𝔽_p[G]-module M, so E²=0 and H^c_*(X^(tG))=0. A spectral sequence built from group homology H_(−s)(G;H_tX) instead would give H_0(C₃;𝔽₂)=𝔽₂≠0 for X=S.
- For X=S, p=5 and the Weyl element a=2, the homological class t in bidegree (s,t)=(2,0) has weight 2. Its dual in continuous cohomology has weight 2⁻¹=3 in 𝔽₅, as does b in Ĥ₋₂(C₅;𝔽₅)≅Ĥ¹(C₅;𝔽₅). Using Ĥ⁻² instead would give weight 2 and fail equivariant duality.
- For X=S the E² ring is the Tate cohomology ring of §1.1. At p=2 it is the Laurent ring on the degree −1 generator, so the classes in filtrations 1 and −1 multiply to the unit; at odd p, t·t⁻¹=1 while e·(t⁻¹e)=0 because e²=0. A spectral sequence that is only additive, or that splits E² into group cohomology and group homology with zero cross products, has no such unit relations. For G=C_p and X=H𝔽_p^(⊗p) with the cyclic permutation action, the unit class 1⊗1^(⊗p) lies in Ĥ⁰(C_p;𝔽_p)=𝔽_p, which is nonzero because the norm acts on the trivial module by p=0.

*Needs:* KTheoryFiniteLocalFields §4.5 (Tate spectral sequence, its pairings and its comparison with the Greenlees filtration); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); RefinedTraceMethods §§2.11–2.13 (genuine equivariance); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); StableHomotopyKTheory §7.9 (spectral Milnor sequence); StableHomotopyKTheory §7.26 (complete strong convergence).


### Examples

At p=3 the invariant Laurent power is t²=u⁻², in cohomological degree −4; the class e=b·u⁻¹ is invariant in degree −1 and satisfies βe=1. The positive H¹ generator t⁻¹e=b has weight a⁻¹. These same generators are used in Layer 6. For the sphere with trivial C₂-action at p=2 the homological Tate spectral sequence of §1.2 collapses on its bottom row, giving one 𝔽₂ in every degree of continuous homology.


### Dependencies

KTheoryFiniteLocalFields §4.5 (Eilenberg–MacLane Tate comparison); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); AlgebraicTopology Stage 6 (ordinary cup products); KTheoryFiniteLocalFields §4.5 (Tate spectral sequence, its pairings and its comparison with the Greenlees filtration); RefinedTraceMethods §§2.11–2.13 (genuine equivariance); StableHomotopyKTheory §7.9 (spectral Milnor sequence); StableHomotopyKTheory §7.26 (complete strong convergence). The individual Needs lines specify the earlier local targets and distinguish the general statement from its application.

## Layer 2: Singer construction and the finite-type Segal theorem

The algebraic Singer augmentation is a Tor-equivalence for all graded modules. A specified extended-power approximation realizes it in continuous cohomology, and finite-type convergence compares its inverse-limit Adams abutment with the source.


### 2.1 Continuous cohomology of a spectrum tower

For a specified inverse tower Y_0←Y_1←⋯, define H_c^q(Y_•;𝔽_p)=colim_n H^q(Y_n;𝔽_p), with its graded A_p-action. It comes with the comparison to H^q(holim Y_n;𝔽_p) induced by projections. This construction depends on a tower and is invariant under cofinal reindexing and pro-equivalence; it is not defined to be the ordinary cohomology of the inverse limit. (lnr12, §2.2, Definition 2.3, pp.869–870; §4.3, Definition 4.7 and Remark 4.8, pp.887–888; lnr12 line 400)

Every use of H_c names its approximation tower.

One proof route is as follows. Take the degreewise filtered colimit in graded A_p-modules. Construct the comparison by the compatible inverse-limit projections and prove cofinal invariance. For the Tate application use the specified Singer approximation tower below, not the ordinary homotopy limit as a replacement definition. (lnr12, §2.2, Definition 2.3, pp.869–870; §4.3, Definition 4.7 and Remark 4.8, pp.887–888; lnr12 line 400)

The construction has the following API.

- Each H^q(Y_n;𝔽_p) maps to H_c^q(Y_•;𝔽_p), compatibly with transitions. (lnr12, §2.2, Definition 2.3, pp.869–870; §4.3, Definition 4.7 and Remark 4.8, pp.887–888; lnr12 line 400)
- Compatible A_p-linear maps from the stage cohomologies to M induce a unique map H_c^*(Y_•)→M. (lnr12, §2.2, Definition 2.3, pp.869–870; §4.3, Definition 4.7 and Remark 4.8, pp.887–888; lnr12 line 400)
- The stage projections induce H_c^*(Y_•)→H*(holim Y_n); this is not asserted to be an isomorphism. (lnr12, §2.2, Definition 2.3, pp.869–870; §4.3, Definition 4.7 and Remark 4.8, pp.887–888; lnr12 line 400)
- A cofinal increasing reindexing of the tower induces an isomorphism of continuous cohomology. (lnr12, §2.2, Definition 2.3, pp.869–870; §4.3, Definition 4.7 and Remark 4.8, pp.887–888; lnr12 line 400)

**Checks.**

- For the constant tower at B, H_c^*=H*(B;𝔽_p) and the comparison is the identity.
- For the tower with stages Y_n=Σ^(−n)H𝔽_p and zero transition maps, every stage has nonzero cohomology, but every class dies at the next stage, so H_c^*=0. A definition that ignored the transition maps, such as ⊕_nH*(Y_n), would be nonzero.
- For the Singer tower of S at p=2, H_c^*=Σ𝔽₂[x^(±1)], which has negative-degree classes. Its limit is S_2^∧, whose ordinary mod-2 cohomology is zero in negative degrees. Thus the comparison is not an isomorphism; this test uses the subsequent Singer and Segal theorems.

*Needs:* TangentialBordism §B4 items 2 and 7; GeneralizedCohomology G3.8 and StableHomotopyKTheory §7.9 (homotopy limits and Milnor comparison); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity).


### 2.2 Adams spectral sequence for inverse limits

Let Y_• be a countable inverse tower, each Y_n bounded below and of finite type over 𝔽_p; no uniform lower bound in n is required. There is a natural spectral sequence E₂^(s,t)=Ext_(A_p)^(s,t)(H_c^*(Y_•;𝔽_p),𝔽_p) strongly converging to π_(t−s)((holim_nY_n)_p^∧). Its complete Hausdorff filtration and naturality allow the comparison theorem with the Adams spectral sequence of a bounded-below finite-type source mapping compatibly to this tower. (lnr12, §2.1, Proposition 2.2 and its proof, pp.866–869; lnr12 line 265)

Throughout this statement, each individual stage is bounded below and degreewise mod-p finite type.

The constant tower recovers finite-type Adams convergence.

Applied to the Singer tower, the output is π*((T_pB)_p^∧), although T_pB need not be bounded below.

One proof route is as follows. Take the compatible Adams resolutions of all Y_n, retaining both tower indices. Degreewise finite-type cohomology makes the finite-stage dual groups compact Hausdorff. Prove exactness of countable inverse limits in this compact setting using finite intersection compactness; this controls the derived limits of the resolution and exact-couple terms. Do not claim arbitrary inverse limits of abelian groups are exact. Identify the E₂ term by the dual cobar complex of colim H*Y_n; completion commutes with the spectral inverse limit via the imported function-spectrum model. Verify the complete-convergence criterion, including the vanishing obstruction terms, as in the source proof, then identify the filtered abutment. (lnr12, §2.1, Proposition 2.2 and its proof, pp.866–869; lnr12 line 265)

**Checks.**

- For the zero tower the E₂ page and abutment are zero.
- For the constant H𝔽_p tower, continuous cohomology is A_p, Ext is 𝔽_p at (0,0), and π₀ of the completed limit is 𝔽_p.
- In the Singer sphere tower at p=2 the Thom bottom degree of U_n(S) is 1−n; the values 1,0,−1 at n=0,1,2 exclude any common lower bound.

*Needs:* TangentialBordism §B4 items 2 and 8; §2.1; StableHomotopyKTheory §7.9 (spectral Milnor sequence); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model); StableHomotopyKTheory §7.26 (complete strong convergence).


### 2.3 The cohomological Singer construction

For a graded left A_p-module M, define the exact functor R_+(M) with Σ^(−1)R_+(M)=𝔽₂[x^(±1)]⊗M, |x|=1, at p=2, and Σ^(−1)R_+(M)=Λ(x)⊗𝔽_p[y^(±1)]⊗M, |x|=1, |y|=2, at odd p. The action is twisted, not the ordinary diagonal action. On Σ^(−1)R_+(M), at p=2 set Sq^s(x^r⊗a)=Σ_(j≥0)binom(r−j,s−2j)x^(r+s−j)⊗Sq^j(a). At odd p set P^s(y^r⊗a)=Σ_j binom(r−(p−1)j,s−pj)y^(r+(p−1)(s−j))⊗P^j(a)+Σ_j binom(r−(p−1)j−1,s−pj−1)xy^(r+(p−1)(s−j)−1)⊗βP^j(a); P^s(xy^(r−1)⊗a)=Σ_j binom(r−(p−1)j−1,s−pj)xy^(r+(p−1)(s−j)−1)⊗P^j(a); β(y^r⊗a)=0 and β(xy^(r−1)⊗a)=y^r⊗a. Here r∈ℤ, s≥0, binomial coefficients use integral upper indices and are reduced mod p, and terms with negative lower entry vanish. Transport this action through graded suspension to R_+(M). Define the degree-zero A_p-linear augmentation ε_M:R_+(M)→M by ε(Σx^(r−1)⊗a)=Sq^r(a) for r≥0 and zero for r<0 at p=2. At odd p first project onto the summand spanned by Σy^((p−1)r)⊗a and Σxy^((p−1)r−1)⊗a; for r≥0 send them to −(−1)^rβP^r(a) and (−1)^rP^r(a), respectively, and send r<0 to zero. (lnr12, §3.1, Definition 3.1 and formulas (3.1)–(3.3), pp.875–876; lnr12 line 641)

The augmentation has degree zero on R_+, not on its desuspension.

R_+(M) is generally unbounded below even if M is bounded below.

One proof route is as follows. Define the underlying Laurent/exterior graded module and the displayed actions; use Cartan and Adem to show they extend to an A_p-action. Check that the augmentation respects all generators of A_p, including the Bockstein and suspension signs. Maps of M act coefficientwise; the formula and field tensor product show exactness and functoriality. (lnr12, §3.1, Definition 3.1 and formulas (3.1)–(3.3), pp.875–876; lnr12 line 641)

The construction has the following API.

- A graded A_p-linear map M→N induces R_+M→R_+N; ε is natural. (lnr12, §3.1, Definition 3.1 and formulas (3.1)–(3.3), pp.875–876; lnr12 line 641)
- R_+ preserves short exact sequences of graded A_p-modules. (lnr12, §3.1, Definition 3.1 and formulas (3.1)–(3.3), pp.875–876; lnr12 line 641)
- The displayed formulas define a surjective degree-zero A_p-linear map ε_M:R_+M→M. (lnr12, §3.1, Definition 3.1 and formulas (3.1)–(3.3), pp.875–876; lnr12 line 641)
- For M=𝔽_p with augmentation action, Σ^(−1)R_+(𝔽_p) is localized H*(BC_p;𝔽_p) with its usual Steenrod action. (lnr12, §3.1, Definition 3.1 and formulas (3.1)–(3.3), pp.875–876; lnr12 line 641)

**Checks.**

- R_+(0)=0.
- For a=1∈𝔽_p, ε(Σx^(−1)⊗1)=1 at p=2 and ε(Σxy^(−1)⊗1)=1 at odd p. The unshifted class would have the wrong degree.
- At p=2, Sq¹(x^(−1)⊗1)=1 in Σ^(−1)R_+(𝔽₂); a coefficientwise trivial Steenrod action gives zero and fails this test.
- At odd p, β(xy^(−1)⊗1)=1 and β(y^r⊗1)=0 in Σ^(−1)R_+(𝔽_p).

*Needs:* TangentialBordism §B4 items 2 and 7; §1.1.


### 2.4 Singer Tor-equivalence

For every graded A_p-module M, ε_M:R_+(M)→M induces an isomorphism Tor_(s,t)^(A_p)(𝔽_p,R_+M)→Tor_(s,t)^(A_p)(𝔽_p,M) for all s,t. More generally, a Tor-equivalence L→M induces Ext^(s,t)_(A_p)(M,N)≅Ext^(s,t)_(A_p)(L,N) whenever N is bounded below and degreewise finite-dimensional. In particular this holds for N=𝔽_p. Neither M nor R_+M is assumed bounded below in the Tor statement. (agm85, §1, Proposition 1.2 and Theorem 1.3, p.436; §2, Lemmas 2.1–2.2 and proof of Theorem 1.3, pp.438–441; agm85 line 236; lnr12, §3.1.1, Proposition 3.3, Theorem 3.4 and Corollary 3.5, pp.876–877; lnr12 line 722)

Ext_A(M,𝔽_p)→Ext_A(R_+M,𝔽_p) is an isomorphism in every bidegree.

If N has the stated bounds, every A_p-linear map R_+M→N factors uniquely through ε_M.

One proof route is as follows. For the finite sub-Hopf algebras A_p(n) of the exhaustive-chain supplier contract, localize the appropriate dual polynomial generator to form the bimodules used in Adams–Gunawardena–Miller Lemma 2.1. The monomial basis makes each free over the left finite Hopf algebra and the preceding right one. Since A_p is free over A_p(n−1), an A_p-free module is A_p(n−1)-free. Pass to the filtered union: for free M the Singer module is A_p-flat and ε induces an isomorphism on 𝔽_p-coinvariants (Adams–Gunawardena–Miller Lemma 2.2). Apply the exact Singer functor to a free resolution of M and compare the two Tor spectral sequences; include the suspension converting AGM’s augmentation degree to LNR’s degree-zero ε. For the Ext consequence dualize the cobar comparison into bounded-below finite-type N, where the degreewise products and inverse-limit arguments are controlled. (agm85, §1, Proposition 1.2 and Theorem 1.3, p.436; §2, Lemmas 2.1–2.2 and proof of Theorem 1.3, pp.438–441; agm85 line 236; lnr12, §3.1.1, Proposition 3.3, Theorem 3.4 and Corollary 3.5, pp.876–877; lnr12 line 722)

**Checks.**

- For M=0, both Tor groups are zero in all bidegrees.
- For M=𝔽_p and N=𝔽_p, the bidegree (0,0) Hom comparison has dimension 1 on both sides; the augmentation unit maps to 1, not 0.
- For N=Σᵈ𝔽_p the same comparison is shifted by d; at d=−1 its only scalar Hom test moves by −1, showing that a suspension error is visible.

*Needs:* §2.3; TangentialBordism §B4 items 2 and 7 and BordismFormalGroups §F6.3; the exhaustive-chain supplier contract (the chain A_p(n) and the freeness of A_p over it).


### 2.5 The extended-power Singer approximation

For B bounded below and degreewise finite type over 𝔽_p, form U_n(B)=Σ^(1+n)D_(C_p)(Σ^(−n)B), n≥0, with the bonding maps from inclusions of successive multiples of the reduced regular representation. There is a cofinal comparison U_n(B)≃(B^(⊗p))^(tC_p)[1−(p−1)n] to the Greenlees Tate tower. Here Z^(tC_p)[k] denotes its kth Greenlees filtration stage as in LNR Definition 4.3, not the suspension Σ^k(Z^(tC_p)); hence holim_n U_n(B)≃T_p(B). Each U_n(B) is individually bounded below and mod-p finite type, with no uniform lower bound asserted. The finite-action Tate tower uses BordismFormalGroups §F6.5 and RefinedTraceMethods §§2.11–2.13; the additional target here is its explicit cyclic extended-power approximation and finiteness. (lnr12, §4.3, Definition 4.3 and Lemmas 4.4–4.6, pp.885–887; §5.2, Proposition 5.7, pp.902–903; lnr12 line 1935)

The tower index tends to −∞ in the Tate truncation convention as n→∞.

No extra Σ or missing desuspension is allowed in the cofinal comparison.

One proof route is as follows. Model EC_p using the unit sphere in infinitely many reduced regular representations and use finite skeleta/representation inclusions to specify the tower maps. Use equivariant duality for the finite representation spheres and the norm/isotropy-separation model to obtain the indicated shifted extended powers. The cyclic resolution has finitely many generators in every resolution degree. The homology spectral sequence, bounded below at each fixed stage, and degreewise finite mod-p homology of B then give finite-dimensional homology in every degree at that stage. (lnr12, §4.3, Definition 4.3 and Lemmas 4.4–4.6, pp.885–887; §5.2, Proposition 5.7, pp.902–903; lnr12 line 1935)

The construction has the following API.

- Maps B→C induce compatible maps U_n(B)→U_n(C). (lnr12, §4.3, Definition 4.3 and Lemmas 4.4–4.6, pp.885–887; §5.2, Proposition 5.7, pp.902–903; lnr12 line 1935)
- The comparison identifies holim_n U_n(B) with (B^(⊗p))^(tC_p). (lnr12, §4.3, Definition 4.3 and Lemmas 4.4–4.6, pp.885–887; §5.2, Proposition 5.7, pp.902–903; lnr12 line 1935)
- U_n(B) identifies with the Greenlees Tate filtration stage indexed 1−(p−1)n, including bonding maps; the bracket is a filtration index, not a suspension. (lnr12, §4.3, Definition 4.3 and Lemmas 4.4–4.6, pp.885–887; §5.2, Proposition 5.7, pp.902–903; lnr12 line 1935)
- Each U_n(B) is bounded below and each H_i(U_n(B);𝔽_p) is finite-dimensional. (lnr12, §4.3, Definition 4.3 and Lemmas 4.4–4.6, pp.885–887; §5.2, Proposition 5.7, pp.902–903; lnr12 line 1935)

**Checks.**

- U_0(ΣS)=Σ((S^ρ)_(hC_p))=Σ(BC_p)^ρ has bottom cell in degree p+1, whereas ΣU_0(S)=Σ²Σ∞_+BC_p has bottom cell in degree 2; at p=2 these are 3 and 2. The tower does not commute with suspension at a fixed index; instead U_n(ΣB)=Σ^(1+n)D_(C_p)(Σ^(−(n−1))B)=ΣU_(n−1)(B) for n≥1, a cofinal reindexing.
- U_0(B)=ΣD_(C_p)(B), not D_(C_p)(B).
- For B=S, U_n(S)≃Σ(BC_p)^(−n·the reduced regular representation), where the reduced regular representation is the reduced regular bundle; at p=2 this is the suspended Thom spectrum of −n times the real sign line.

*Needs:* GeneralizedCohomology G2.8 and BordismFormalGroups §F6.5; TangentialBordism §B4 items 2 and 7 and BordismFormalGroups §F6.3; BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); RefinedTraceMethods §§2.11–2.13 (genuine equivariance); GeneralizedCohomology G3.8 and StableHomotopyKTheory §7.9 (homotopy limits and Milnor comparison).


### 2.6 Topological Singer cohomology comparison

For B bounded below and degreewise finite type over 𝔽_p there is a natural graded A_p-isomorphism H_c^*(U_•(B);𝔽_p)≅R_+(H*(B;𝔽_p)). Under this isomorphism the map to H*(B;𝔽_p) induced by Δ_p:B→T_pB equals ε_(H*B). Equivalently colim_n H*(Σ^nD_(C_p)(Σ^(−n)B);𝔽_p)≅Σ^(−1)R_+(H*B); the one-suspension difference from U_n is essential. (lnr12, §5.1, Lemma 5.1 and Theorem 5.2, pp.896–898; §5.2, Theorem 5.9 and proof, pp.902–903; §5.3, Definition 5.10, Lemma 5.11 and Proposition 5.12, pp.903–905; lnr12 line 1964)

The comparison is A_p-linear, not merely an isomorphism of graded vector spaces.

The class Σxy^(−1)⊗1 (or Σx^(−1)⊗1 at p=2) maps to the unit.

One proof route is as follows. Calculate extended-power homology by the cyclic resolution and the tensor Künneth isomorphism. Split mixed tensor-basis words into free C_p-orbits, leaving the diagonal words; track the Steenrod action to obtain the Singer formulas. Pass along the representation-sphere tower and keep its suspension shift, yielding the continuous-cohomology comparison. Then work with the imported Δ_p itself; no genuine equivariant norm and no Segal equivalence enter. The map Δ_p induces on continuous cohomology factors as g_B∘ε for a unique A_p-linear g_B:H*B→H*B, by the bounded-target Hom consequence of §2.4, and uniqueness makes g_B natural in B. For B=H𝔽_p, the lax symmetric monoidal structure of Δ_p makes it a ring map, so in mod-p homology it sends 1∈H_0(H𝔽_p) to the unit of the continuous homology of the Greenlees tower of H𝔽_p^(⊗p), which is cofinal with U_• by §2.5. By the homological Tate spectral sequence of §1.2, applied to G=C_p and the bounded-below finite-type C_p-ring spectrum H𝔽_p^(⊗p), this unit is represented by 1⊗1^(⊗p) in Ĥ⁰(C_p;H_0(H𝔽_p)^(⊗p)). By the duality of §1.2, Δ_p sends the dual class of continuous cohomology represented by 1⊗1^(⊗p) to 1∈H⁰(H𝔽_p); the comparison above identifies that class with Σxy^(−1)⊗1 (Σx^(−1)⊗1 at p=2), which ε sends to 1. Hence g(1)=1, and A_p-linearity gives g=id on A_p. Exactness of T_p gives Δ_(ΣB)=ΣΔ_B under the comparison ΣT_pB≃T_p(ΣB) induced by the diagonal S¹→S^ρ, which on the tower is the cofinal reindexing U_n(ΣB)=ΣU_(n−1)(B) of §2.5; so g=id on every Σ^qH𝔽_p. A class x∈H^q(B) is a map B→Σ^qH𝔽_p, and naturality gives g_B(x)=x. This is the argument of lnr12 Proposition 5.12 with Δ_p in place of the map built there from geometric fixed points of the norm (lnr12 line 2046; ns18, Definition III.1.4 and Remark III.1.5, pp.286–287; ns18 line 3236). (lnr12, §5.1, Lemma 5.1 and Theorem 5.2, pp.896–898; §5.2, Theorem 5.9 and proof, pp.902–903; §5.3, Definition 5.10, Lemma 5.11 and Proposition 5.12, pp.903–905; lnr12 line 1964)

**Checks.**

- At B=0 both continuous cohomology and the Singer module are zero.
- At p=2 and B=S, Σx⁻¹ maps to 1; its degree is 0, whereas x⁻¹ without the suspension has degree −1.
- At odd p the degree-zero class Σxy⁻¹ maps to 1; the plain Laurent class y⁻¹ has degree −2 and cannot represent the unit.

*Needs:* §1.2 (homological Tate spectral sequence, its products and its duality with continuous cohomology); §2.5; §2.1; §2.3; §2.4; AInfCohomology §AI.7.2 (Spectral Tate diagonal, with its exactness and lax symmetric monoidal structure); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers).


### 2.7 Finite-type generalized Segal theorem

For B bounded below and degreewise finite type over 𝔽_p, Δ_p:B→(B^(⊗p))^(tC_p) is a p-adic equivalence and its target is p-complete, so it exhibits the target as B_p^∧. In particular S→S^(tC_p) is the Segal conjecture for C_p (Lin at p=2, Gunawardena at odd p), and H𝔽_p→(H𝔽_p^(⊗p))^(tC_p) is an equivalence. The sphere case follows from the Singer comparison and strong convergence, without a Segal theorem as input. (lnr12, §5.3, Theorem 5.13 and proof, pp.905–906; lnr12 line 2109)

The unit-normalized H𝔽_p equivalence is available for the arbitrary-dimensional-vector-space step.

One proof route is as follows. Compare the ordinary Adams spectral sequence for B with the inverse-limit Adams spectral sequence of U_•(B). Use the continuous Singer comparison and ε Tor-equivalence to identify their E₂ pages. Apply strong convergence, including complete filtration comparison, to conclude a p-adic equivalence. T_pB is p-complete by the imported bounded-below Tate theorem. Use the universal property of p-completion. (lnr12, §5.3, Theorem 5.13 and proof, pp.905–906; lnr12 line 2109)

**Checks.**

- At B=S, π₀ of the target is ℤ_p and its negative homotopy groups vanish; the zero target cannot satisfy the completion assertion.
- At B=H𝔽_p, π₀Δ_p is the identity of 𝔽_p and all other target homotopy groups vanish.
- At B=Hℚ both the p-completion and tensor Tate target are zero, although B itself has π₀=ℚ.

*Needs:* TangentialBordism §B4 items 2 and 8; §2.2; §2.6; §2.4; RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); StableHomotopyKTheory §7.16 (mod-p detection for complete spectra).


### Examples

For the sphere at p=2, U_n(S) is the suspension of the Thom spectrum of −n times the real sign line. Its bottom degrees are 1,0,−1 at n=0,1,2; its continuous cohomology is Σ𝔽₂[x^(±1)], while its limit is S₂^∧.


### Dependencies

TangentialBordism §B4 items 2 and 7; GeneralizedCohomology G3.8 and StableHomotopyKTheory §7.9 (homotopy limits and Milnor comparison); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); TangentialBordism §B4 items 2 and 8; StableHomotopyKTheory §7.9 (spectral Milnor sequence); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model); StableHomotopyKTheory §7.26 (complete strong convergence); TangentialBordism §B4 items 2 and 7 and BordismFormalGroups §F6.3; the exhaustive-chain supplier contract (the chain A_p(n) and the freeness of A_p over it); GeneralizedCohomology G2.8 and BordismFormalGroups §F6.5; BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); RefinedTraceMethods §§2.11–2.13 (genuine equivariance); AInfCohomology §AI.7.2 (Spectral Tate diagonal); RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); StableHomotopyKTheory §7.16 (mod-p detection for complete spectra). The individual Needs lines specify the earlier local targets and distinguish the general statement from its application.

## Layer 3: The bounded-below generalized Segal conjecture

Use stabilization in finite inverse systems uniformly across a vector-space basis. This supplies arbitrary Eilenberg–MacLane inputs and then all bounded-below spectra by Postnikov dévissage.


### 3.1 Finite towers with finite inverse limit

Let S_0←S_1←⋯ be a tower of finite sets, and let L=lim_n S_n be finite; empty stages and an empty L are allowed. There is n_0 such that the projection L→S_n is injective for every n≥n_0. For every n there is m≥n with image(S_m→S_n)=image(L→S_n). Consequently the canonical morphism from the constant pro-set L to the tower S_• is a pro-isomorphism. For finite-group towers the same assertion holds as pro-groups. No surjectivity of the original transition maps is assumed. (ns18, §III.1, Lemma III.1.8 and proof, p.289; ns18 line 3331)

A direct sum of copies of this same pro-group comparison stays pro-constant because a single later index works for all copies. This does not assert that arbitrary nonuniform families of pro-isomorphisms commute with direct sums.

One proof route is as follows. Use finite ranges and the imported Mittag–Leffler criterion to replace the tower by its eventual-range system without changing sections. If a stage or the limit is empty, compactness of finite compatible sections forces eventual emptiness at each fixed stage. Otherwise eventual ranges form a surjective tower of nonempty finite sets. The baseline section-surjectivity and eventual-injectivity theorems give a separating stage for the finite section set. At a fixed stage, its eventual range is the image of L by compactness, and finite decreasing images stabilize. Translate these two assertions to the explicit pro-isomorphism criterion. (ns18, §III.1, Lemma III.1.8 and proof, p.289; ns18 line 3331)

**Checks.**

- For a constant two-element set all transition and evaluation maps are identities and the stable image has size 2. For the zero-element constant set all images have size 0; nonemptiness is not an extra hypothesis.
- Let S₀={a,b} and S_n={a} for n≥1, with the inclusion at the first transition. The stable image in S₀ has size 1, matching the limit, while the original transition is not surjective.
- Let S_n={0,1}ⁿ with deletion transitions. Its limit has cardinality 2^ℵ₀ and no evaluation is injective: the distinct sequences 0^∞ and 0ⁿ10^∞ agree at stage n. Finite stages alone are insufficient.

*Needs:* `CategoryTheory.Functor.eventualRange`; `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`; `CategoryTheory.Functor.toEventualRangesSectionsEquiv`; `CategoryTheory.Functor.surjective_toEventualRanges`; `CategoryTheory.Functor.eventually_injective`; `nonempty_sections_of_finite_cofiltered_system`; `CategoryTheory.Functor.sections`; `CategoryTheory.Functor.eval_section_surjective_of_surjective`.


### 3.2 Truncated tensor Tate functors

For a prime p and n∈ℤ define T_p^((n))(X)=(τ_(≤n)(X^(⊗p)))^(tC_p), using the coherent cyclic permutation action before truncation. There is a natural tower in n and a comparison T_p(X)→lim_(n→∞)T_p^((n))(X), which is an equivalence by RefinedTraceMethods §2.3’s Tate truncation theorem. For every fixed n, T_p^((n)) preserves arbitrary direct sums of spectra: all mixed words have free C_p-orbits and are Tate-acyclic, while the surviving summands are uniformly bounded above before homotopy fixed points. (ns18, §III.1, proof of Theorem III.1.7, pp.289–290, using Lemma I.2.6, pp.222–223; ns18 line 3316)

The arbitrary-sum assertion is only made at a fixed truncation n.

One proof route is as follows. Truncate in the equivariant functor category and use the Tate truncation-limit comparison supplied by the finite-action supplier contract. Expand a p-fold smash of a direct sum by words in the index set. Primality makes every nonconstant word a free cyclic orbit; truncation respects the induced decomposition. Kill the induced summands by Tate vanishing. For the remaining uniformly coconnective summands, commute direct sums with homotopy fixed points using the finite cyclic resolution degree by degree. Homotopy orbits preserve all colimits. For X=H𝔽_p, use the Milnor finite-type coefficient theorem and the bounded Tate spectral sequence to prove each π_iT_p^((n))(H𝔽_p) is finite. (ns18, §III.1, proof of Theorem III.1.7, pp.289–290, using Lemma I.2.6, pp.222–223; ns18 line 3316)

The construction has the following API.

- Maps X→Y induce compatible maps of all truncation stages. (ns18, §III.1, proof of Theorem III.1.7, pp.289–290, using Lemma I.2.6, pp.222–223; ns18 line 3316)
- T_p(X)≃lim_n T_p^((n))(X), compatibly with the Tate diagonal. (ns18, §III.1, proof of Theorem III.1.7, pp.289–290, using Lemma I.2.6, pp.222–223; ns18 line 3316)
- For an arbitrary index set J, ⊕_J T_p^((n))(X_j)→T_p^((n))(⊕_JX_j) is an equivalence at each fixed n. (ns18, §III.1, proof of Theorem III.1.7, pp.289–290, using Lemma I.2.6, pp.222–223; ns18 line 3316)
- For every i,n, π_iT_p^((n))(H𝔽_p) is a finite abelian group. (ns18, §III.1, proof of Theorem III.1.7, pp.289–290, using Lemma I.2.6, pp.222–223; ns18 line 3316)

**Checks.**

- Every truncation stage at X=0 is zero.
- For n<0, τ_(≤n)(H𝔽_p^(⊗p))=0, hence T_p^((n))(H𝔽_p)=0.
- For X=H𝔽_p⊕H𝔽_p the mixed tensor words form free C_p-orbits and vanish after Tate; each fixed truncation has exactly the two diagonal contributions.
- The inverse limit of the H𝔽_p truncation tower is H𝔽_p by the finite-type Segal theorem, although individual stages have many Tate degrees.

*Needs:* AInfCohomology §AI.7.2 (Spectral Tate diagonal); RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); TangentialBordism §B4 items 2 and 7 and BordismFormalGroups §F6.3; KTheoryFiniteLocalFields §4.5 (homotopy Tate spectral sequence, with finitely many nonzero rows after truncation).


### 3.3 The arbitrary-dimensional HF_p case

For every 𝔽_p-vector space V of arbitrary dimension, Δ_p:HV→(HV^(⊗p))^(tC_p) is an equivalence. In every homotopy degree i, the comparison from the constant pro-group π_iHV to the tower π_iT_p^((n))(HV) is a pro-isomorphism, with stabilization indices inherited from the single H𝔽_p tower and independent of the dimension of V. (ns18, §III.1, proof of Theorem III.1.7 after Lemma III.1.8, pp.289–290; ns18 line 3338)

This includes uncountable bases.

No finite-dimensionality or compactness of HV is assumed.

One proof route is as follows. Choose a basis V≅⊕_J𝔽_p and identify HV with the corresponding direct sum of H𝔽_p spectra. Each fixed truncation preserves this sum. The H𝔽_p homotopy groups at each truncation are finite; Milnor’s sequence and finite-type Segal identify their inverse limit with the finite group π_iH𝔽_p. Apply the finite-tower pro-constant theorem. Take the direct sum indexed by J of the same comparison of pro-abelian groups, using a uniform index rather than commuting an arbitrary inverse limit with a sum. The individual truncated Tate homotopy groups need not carry a chosen 𝔽_p-module structure. The tower is pro-constant in each degree, so lim¹ vanishes. Milnor’s sequence identifies π_iT_p(HV) with π_iHV, compatibly with Δ_p. (ns18, §III.1, proof of Theorem III.1.7 after Lemma III.1.8, pp.289–290; ns18 line 3338)

**Checks.**

- For V=0 the source and target are zero. For V=𝔽_p the map on π₀ is the identity of a set of size p.
- For V=𝔽_p², each fixed truncation has two diagonal contributions and no mixed contribution; the target limit has dimension 2 in degree zero.
- For a basis J of any uncountable cardinal κ, π₀ of both source and target is the direct sum 𝔽_p^(J) of dimension κ; the comparison is induced by basis vectors, not the larger product of all functions J→𝔽_p.

*Needs:* §2.7; §3.2; §3.1; StableHomotopyKTheory §7.9 (spectral Milnor sequence); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity).


### 3.4 The bounded-below generalized Segal conjecture

For every bounded-below spectrum X and prime p, the Tate diagonal Δ_p:X→T_pX=(X^(⊗p))^(tC_p) exhibits T_pX as the derived p-completion X_p^∧, naturally in X and compatibly with the imported lax symmetric monoidal diagonal. There is no finite-generation assumption on the homotopy or homology groups. The bounded-below hypothesis is essential. (ns18, §III.1, Theorem III.1.7 and proof, pp.287–290; ns18 line 3271)

For X=S the result is the prime-order Segal conjecture; for X=H𝔽_p it is an equivalence.

For X=H(⊕_J𝔽_p) the statement is valid for every set J.

The proof never replaces T_p by a functor preserving unrestricted sums.

One proof route is as follows. Shift X to be connective, using exactness of T_p. The tensor map X^(⊗p)→(τ_(≤n)X)^(⊗p) has connectivity tending to infinity. Homotopy orbits preserve these bounds and homotopy fixed points preserve limits, so T_pX≃lim_nT_p(τ_(≤n)X). Completion commutes with limits by its function-spectrum model; exactness and finite Postnikov dévissage reduce to X=HM. Resolve M by free abelian groups to reduce, by exactness, to p-torsion-free M. The target is p-complete by the finite-action supplier contract. Mod-p detection and exactness reduce the assertion to H(M/pM), since multiplication by p is injective on M. Apply the arbitrary-vector theorem, then recover the completion statement. (ns18, §III.1, Theorem III.1.7 and proof, pp.287–290; ns18 line 3271)

**Checks.**

- For X=S the target has π₀=ℤ_p; for X=Σ⁻¹H𝔽_p the only nonzero homotopy group is 𝔽_p in degree −1 on both sides. Bounded below does not mean connective.
- For X=H(⊕_J𝔽_p), the degree-zero comparison is the identity for every set J.
- At p=2, KU₂^∧/2 has 𝔽₂ in every even degree, while T₂(KU)/2=0 by §7.5. This is the unbounded negative control.

*Needs:* §3.3; AInfCohomology §AI.7.2 (Spectral Tate diagonal); RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model); StableHomotopyKTheory §7.16 (mod-p detection for complete spectra); StableHomotopyKTheory §7.15 (closure of complete spectra).


### Examples

The nonsurjective finite tower {a,b}←{a}←{a}←⋯ has limit {a} and eventual image {a} at the first stage. The same single stabilization index works for every direct-sum copy; a family of unrelated stabilization indices would not have this property.


### Dependencies

`CategoryTheory.Functor.eventualRange`; `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`; `CategoryTheory.Functor.toEventualRangesSectionsEquiv`; `CategoryTheory.Functor.surjective_toEventualRanges`; `CategoryTheory.Functor.eventually_injective`; `nonempty_sections_of_finite_cofiltered_system`; `CategoryTheory.Functor.sections`; `CategoryTheory.Functor.eval_section_surjective_of_surjective`; AInfCohomology §AI.7.2 (Spectral Tate diagonal); RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); TangentialBordism §B4 items 2 and 7 and BordismFormalGroups §F6.3; KTheoryFiniteLocalFields §4.5 (homotopy Tate spectral sequence, with finitely many nonzero rows after truncation); StableHomotopyKTheory §7.9 (spectral Milnor sequence); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model); StableHomotopyKTheory §7.16 (mod-p detection for complete spectra); StableHomotopyKTheory §7.15 (closure of complete spectra). The individual Needs lines specify the earlier local targets and distinguish the general statement from its application.

## Layer 4: Weyl refinements and degree-zero Frobenius

Refine the diagonal by its normalizer and compare its underlying-space factorization with internal powers. Additivity enters through the transfer quotient; the spectral Frobenius itself is a ring map.


### 4.1 Weyl refinement of the Tate diagonal

Fix C_p≤Σ_p generated by a p-cycle and W=N_(Σ_p)(C_p)/C_p≅𝔽_p^×. The Tate diagonal has a unique lax symmetric monoidal refinement X→((X^(⊗p))^(tC_p))^(hW) whose forgetful map is Δ_p. For X=Σ∞_+Y it factors through (X^(⊗p))^(hΣ_p) by the suspension of the space diagonal. For an E∞-ring R, multiplication gives an E∞ refinement φ_R:R→(R^(tC_p))^(hW). For R=S[M], M an E∞ space monoid, this factors through R^(hΣ_p). The order p−1 is invertible on R^(tC_p), so homotopy groups of its W-fixed points are algebraic W-invariants. (ns18, §IV.1, Lemma IV.1.3, Corollaries IV.1.4–IV.1.5 and Remark IV.1.6, pp.325–326; ns18 line 4868)

The W-refinement does not assert a Tate construction for all of Σ_p.

Restriction from Σ_p homotopy fixed points uses the actual normalizer, with its coherent action.

One proof route is as follows. Apply the unit-normalized exact-functor construction to X↦((X^(⊗p))^(tC_p))^(hW); uniqueness gives the forgetful compatibility. For suspension spectra compare the two lax monoidal transformations using the initiality of Σ∞_+ and its space diagonal. Multiply the tensor factors for R. The normalizer quotient has prime-to-p order, so averaging makes its group cohomology above zero vanish on the p-local Tate homotopy groups. (ns18, §IV.1, Lemma IV.1.3, Corollaries IV.1.4–IV.1.5 and Remark IV.1.6, pp.325–326; ns18 line 4868)

**Checks.**

- At p=2, W is trivial and forgetting W changes nothing. At p=3 it has order 2, invertible on the p-local Tate target.
- For X=S, Δ_p sends the unit to the Tate unit; a zero refinement would send 1 to 0.
- For the suspension monoid algebra S[ℕ], a basis monoid element z maps to the pth-power basis element z^p after multiplication; at p=2 the exponents 1 and 2 distinguish this from the identity.

*Needs:* AInfCohomology §AI.7.2 (Spectral Tate diagonal); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); EnhancedDerivedSheaves E5:abstract (monoidal and operadic structures); RefinedTraceMethods §2.8 (E∞ Tate-valued Frobenius).


### 4.2 Underlying-space diagonal factorization

For every spectrum X, Ω∞ of the W-refined Tate diagonal equals the composite Ω∞X→((Ω∞X)^p)^(hΣ_p)→Ω∞(X^(⊗p))^(hΣ_p)→Ω∞((X^(⊗p))^(tC_p))^(hW). The first map is the ordinary space diagonal, the second the lax monoidal comparison, and the last restriction followed by can. The equality is natural and lax symmetric monoidal; it is not an assertion of a natural spectrum map X→(X^(⊗p))^(hΣ_p). (ns18, §IV.1, Lemma IV.1.7 and proof, p.327; ns18 line 4920)

The lift is at the level of spaces; it need not preserve the additive infinite-loop structure.

One proof route is as follows. Form the space diagonal and apply the lax symmetric monoidal Ω∞ comparison. Restrict along C_p⋊W≤Σ_p and apply can. Use the unit normalization and initiality/universal property of Ω∞ to identify it with Ω∞Δ_p. (ns18, §IV.1, Lemma IV.1.7 and proof, p.327; ns18 line 4920)

**Checks.**

- At X=0 all spaces and maps are contractible.
- At X=Hℤ and p=2 write A=Hℤ⊗Hℤ, u for the unit of π₀(A^(hC₂)) and Nm(1) for the image under the norm of the class 1∈π₀(A_(hC₂)). By the mixed-transfer sum formula the space-level lift sends 2=1+1 to 2u+Nm(1). Restriction to π₀A=ℤ sends this to 1+1+2=4, since Nm(1) restricts to 1+τ(1)=2; can sends it to 2∈π₀T₂(Hℤ)=ℤ₂ (§3.4), since can kills norms and sends u to 1. So the value is neither the additive candidate 2u, whose restriction is 2, nor the scalar 4u, whose Tate image is 4. The pre-Tate lift is not a map of additive infinite-loop spaces, although its Tate image Δ₂(2)=2 is additive.
- On the sphere unit the composite sends 1 to 1 in π₀S^(tC_p)=ℤ_p; multiplication by p would send it to p and violate normalization.

*Needs:* §4.1; AInfCohomology §AI.7.2 (Spectral Tate diagonal); EnhancedDerivedSheaves E5:abstract (monoidal and operadic structures).


### 4.3 Positive-degree splitting of the norm sequence

Let X be bounded below and p-complete, and put A=X^(⊗p) with cyclic permutation action. For every i≥1, the norm and the underlying-space diagonal give an isomorphism of abelian groups π_i(A^(hC_p))≅π_i(A_(hC_p))⊕π_i(X). In degree zero they give an exact sequence 0→π_0(A_(hC_p))→π_0(A^(hC_p))→π_0(X)→0 with a natural set section; no additive splitting is asserted in degree zero. (ns18, §IV.1, Corollary IV.1.8 and proof, p.327; ns18 line 4929)

Throughout this statement, X bounded below and derived p-complete.

The claimed degree-zero section is not used to make P_p additive.

One proof route is as follows. Identify A^(tC_p) with X by the p-complete generalized Segal theorem. The space diagonal is a section of can after applying Ω∞, so the connecting maps vanish in nonnegative degrees. On π_i for i≥1 any based space map induces a group homomorphism; use the exact norm sequence. On π_0 retain only the set-level section. (ns18, §IV.1, Corollary IV.1.8 and proof, p.327; ns18 line 4929)

**Checks.**

- For X=0 both summands and the middle group are zero.
- For X=H𝔽_p, A is connective and π₀A_(hC_p)=𝔽_p. The norm sequence on π₀ is 0→𝔽_p→π₀A^(hC_p)→𝔽_p→0; both kernel and quotient have p elements.
- At X=H𝔽₂ and p=2, a pre-Tate section of the class 1 has twice its value equal to the transfer of 1, which is nonzero in the kernel 𝔽₂. Thus the middle group is ℤ/4 and the component section cannot be additive; the positive-degree conclusion cannot be extended to degree zero.

*Needs:* §3.4; §4.2; BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers).


### 4.4 Degree-zero power operation

For an E∞-ring spectrum R and a space X, define P_p:R⁰(X)→R⁰(X×BΣ_p) by the space diagonal on Ω∞R, its lax monoidal comparison to Ω∞(R^(⊗p))^(hΣ_p), and multiplication. Here R⁰(X)=[Σ∞_+X,R]. The operation preserves multiplication and the unit and is natural in X and R, but before quotienting by transfers it need not be additive. (ns18, §IV.1, Corollaries IV.1.9–IV.1.10, p.328; ns18 line 4961; bmms86, Chapter VIII §1, Propositions 1.1 and 1.4 (scan PDF pp.130–132); bmms86 line 4297)

For a coefficient ring spectrum HA and X=pt, P_p(a)=a^p in A=H⁰(BΣ_p;A).

One proof route is as follows. Use the E∞ multiplication to make the p-fold tensor product equivariant for Σ_p. Apply the space-level factorization and representability to classes on X. Calculate multiplication from the E∞ coherences and addition by the orbit decomposition of a sum. (ns18, §IV.1, Corollaries IV.1.9–IV.1.10, p.328; ns18 line 4961; bmms86, Chapter VIII §1, Propositions 1.1 and 1.4 (scan PDF pp.130–132); bmms86 line 4297)

The construction has the following API.

- For f:Y→X, (f×id)*P_p(x)=P_p(f*x); maps of E∞ rings commute with P_p. (ns18, §IV.1, Corollaries IV.1.9–IV.1.10, p.328; ns18 line 4961; bmms86, Chapter VIII §1, Propositions 1.1 and 1.4 (scan PDF pp.130–132); bmms86 line 4297)
- P_p(xy)=P_p(x)P_p(y), P_p(1)=1 and P_p(0)=0. (ns18, §IV.1, Corollaries IV.1.9–IV.1.10, p.328; ns18 line 4961; bmms86, Chapter VIII §1, Propositions 1.1 and 1.4 (scan PDF pp.130–132); bmms86 line 4297)
- Restriction along X→X×BΣ_p at a basepoint sends P_p(x) to x^p. (ns18, §IV.1, Corollaries IV.1.9–IV.1.10, p.328; ns18 line 4961; bmms86, Chapter VIII §1, Propositions 1.1 and 1.4 (scan PDF pp.130–132); bmms86 line 4297)
- The difference P_p(x+y)−P_p(x)−P_p(y) is the sum of transfers of x^i y^(p−i) from Σ_i×Σ_(p−i), for 0<i<p, with their induced internal power classes. (ns18, §IV.1, Corollaries IV.1.9–IV.1.10, p.328; ns18 line 4961; bmms86, Chapter VIII §1, Propositions 1.1 and 1.4 (scan PDF pp.130–132); bmms86 line 4297)

**Checks.**

- For R=KU, X=pt and p=2, the sum formula gives P_2(2)=P_2(1)+P_2(1)+tr(1)=2+(1+sign)=3·1+sign in KU⁰(BΣ₂), the transfer of 1 from the trivial subgroup being the regular representation. The pullback of 2² along the projection is 4·1. Their transposition characters are 2 and 4, and their difference sign−1 is nonzero in KU⁰(BΣ₂), the completion of R(Σ₂) at its augmentation ideal. So P_p is not the pullback of x^p; for Eilenberg–MacLane coefficients the two agree at a point, since H⁰(BΣ_p;A)=A.
- For R=HZ, X=pt and p=2, P_2(2)=4, so P_2(1+1)≠P_2(1)+P_2(1) in ℤ.
- For R=H𝔽₄, X=pt and p=2, P_2(a)=a²=a+1 for a with a²+a+1=0; the pullback of a along the projection X×BΣ_2→X would give a, so P_p is not that pullback. Over 𝔽_p itself a^p=a, so coefficients in the prime field cannot detect this difference.
- For any R and x, restricting the output to X recovers x^p; an additive approximation to P_p generally fails this test.

*Needs:* GeneralizedCohomology G2.8 and BordismFormalGroups §F6.5; §4.2; StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers).


### 4.5 The transfer ideal for a prime power operation

For the prime p and E∞-ring R, let I_p(R,X)⊂R⁰(X×BΣ_p) be the ideal generated by images of additive stable transfers from X×B(Σ_i×Σ_(p−i)) for 0<i<p. Use the actual finite covering and restriction Frobenius reciprocity to define these transfers. Every generating subgroup has order prime to p, so its restriction to C_p is induced from the trivial subgroup and its image under can to R^(tC_p) vanishes. This explicit Young-subgroup convention is the transfer ideal used here; it avoids interpreting an unspecified transfer as just multiplication by p!. (bmms86, Chapter VIII §1, Proposition 1.1(vi), Proposition 1.4(iv) and the additive transfer discussion (scan PDF pp.130–132); bmms86 line 4297; ns18, §IV.1, Remark IV.1.11, p.328; ns18 line 4972)

The quotient is formed in R⁰(X×BΣ_p), with its X coordinate retained.

One proof route is as follows. Use the stable transfer for the finite covering associated with each Young-subgroup inclusion; Frobenius reciprocity makes its image an ideal after taking the generated sum. Restrict to C_p and apply the double-coset formula. All intersection subgroups are trivial since p does not divide the Young subgroup order. The resulting norm/induced terms vanish under can, so the Tate comparison factors through this quotient. (bmms86, Chapter VIII §1, Proposition 1.1(vi), Proposition 1.4(iv) and the additive transfer discussion (scan PDF pp.130–132); bmms86 line 4297; ns18, §IV.1, Remark IV.1.11, p.328; ns18 line 4972)

The construction has the following API.

- For 0<i<p and z∈R⁰(X×B(Σ_i×Σ_(p−i))), its transfer lies in I_p(R,X). (bmms86, Chapter VIII §1, Proposition 1.1(vi), Proposition 1.4(iv) and the additive transfer discussion (scan PDF pp.130–132); bmms86 line 4297; ns18, §IV.1, Remark IV.1.11, p.328; ns18 line 4972)
- Pullback along X and maps of E∞ rings carry the transfer ideal into the corresponding transfer ideal. (bmms86, Chapter VIII §1, Proposition 1.1(vi), Proposition 1.4(iv) and the additive transfer discussion (scan PDF pp.130–132); bmms86 line 4297; ns18, §IV.1, Remark IV.1.11, p.328; ns18 line 4972)
- The induced P_p:R⁰(X)→R⁰(X×BΣ_p)/I_p is a unital ring homomorphism. (bmms86, Chapter VIII §1, Proposition 1.1(vi), Proposition 1.4(iv) and the additive transfer discussion (scan PDF pp.130–132); bmms86 line 4297; ns18, §IV.1, Remark IV.1.11, p.328; ns18 line 4972)
- can factors through the quotient by I_p; the quotient-to-Tate map is not asserted to be an isomorphism. (bmms86, Chapter VIII §1, Proposition 1.1(vi), Proposition 1.4(iv) and the additive transfer discussion (scan PDF pp.130–132); bmms86 line 4297; ns18, §IV.1, Remark IV.1.11, p.328; ns18 line 4972)

**Checks.**

- For R=HZ and X=pt, I_p=(p)⊂ℤ since gcd_(0<i<p)binom(p,i)=p; the induced power is the ordinary Frobenius Z→𝔽_p.
- For R=H𝔽_p and X=pt, each transfer has degree divisible by p and I_p=0⊂𝔽_p.
- At p=5, the ideal at (HZ,pt) is (5), not (120). Indeed 2^5−2=30 is killed mod 5 but survives mod 120, so the latter quotient would not make the power additive.

*Needs:* §4.4; BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity).


### 4.6 Degree-zero Frobenius comparison

For every E∞-ring spectrum R and every space X, postcomposition with the W-refined Tate-valued Frobenius on R⁰(X) equals P_p followed by R⁰(X×BΣ_p)→[Σ∞_+X,(R^(tC_p))^(hW)], the latter map being restriction to C_p⋊W then can. Forgetting W, this comparison factors through R⁰(X×BΣ_p)/I_p(R,X). The target map is a ring map, and the quotient-to-Tate map need not be an isomorphism. (ns18, §IV.1, Corollaries IV.1.9–IV.1.10 and Remark IV.1.11, p.328; ns18 line 4961)

The equality is on cohomology classes, without claiming P_p is an additive map of spectra.

One proof route is as follows. Postcompose the underlying-space diagonal comparison with multiplication on R. Apply [X,−] and the representing-spectrum identification of degree-zero cohomology. Use the transfer ideal factorization for the unrefined target. (ns18, §IV.1, Corollaries IV.1.9–IV.1.10 and Remark IV.1.11, p.328; ns18 line 4961)

**Checks.**

- For R=Hℤ and X=*, p=2, the two routes send 2 to 4 mod 2=0.
- For R=H(𝔽₃[z]) and z the coefficient class, both routes give z³ and differ from z by the nonzero polynomial z³−z.
- For X empty, Σ∞_+X=0 and both cohomology-class maps have the unique value 0; the X coordinate is retained in the transfer quotient for nonempty X.

*Needs:* §4.1; §4.4; §4.5; RefinedTraceMethods §2.8 (E∞ Tate-valued Frobenius).


### 4.7 Ordinary and finite p-complete examples of Frobenius

For every commutative ring A, π₀(φ_(HA)):A→π₀((HA)^(tC_p))=A/pA sends a to a^p mod p, agreeing with Mathlib’s ordinary Frobenius after reduction to characteristic p. If R is an E∞-ring whose underlying spectrum is the p-completion of a finite spectrum, or a retract of a finite cell S_p^∧-module, can∘const:R→R^(tC_p) is an equivalence. Under this equivalence φ_R is an E∞ endomorphism. For the p-complete sphere this endomorphism is the identity. (ns18, §IV.1, Example IV.1.2(i)–(ii), pp.324–325; ns18 line 4843)

For A=𝔽_p the induced map on π₀ is the identity, whereas for A=F_(p^d) it is generally nontrivial.

One proof route is as follows. For HA use the cyclic coefficient calculation and the degree-zero power on coefficients. The constant-map comparison is an equivalence on S_p^∧ by the sphere Segal theorem and Tate p-completion invariance. Both sides are exact on finite cell S_p^∧-modules, so finite cofibers and retracts extend the comparison to the stated class. This is the finite/dualizable p-complete class needed for the spherical Witt example; no claim that S_p^∧ is categorically compact is used. Identify the sphere map by its unital normalization. (ns18, §IV.1, Example IV.1.2(i)–(ii), pp.324–325; ns18 line 4843)

**Checks.**

- For A=ℤ at p=3, 2 maps to 2³ mod 3=2; for A=ℚ the target is A/pA=0. The zero ring gives the unique map 0→0.
- For A=𝔽₄ and p=2, a²=a+1≠a for a²+a+1=0; an identity Frobenius would fail.
- For R=S_p^∧ the constant-to-Tate comparison and φ both send 1 to 1. The filtered p-inversion diagram has completed colimit 0, but the colimit of maps from the sphere has π₀=ℚ_p, so categorical compactness is not inferred.

*Needs:* §4.6; §3.4; RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model); `frobenius`.


### 4.8 Spherical Witt vectors of a finite field

Let k=𝔽_(p^d), d≥1. Define SW(k) to be the p-complete connective E∞-algebra étale over S_p^∧ equipped with an identification π₀SW(k)≅W(k) over ℤ_p, using the finite étale ℤ_p-algebra W(k). The imported spectral étale lifting equivalence makes this marked object unique up to contractible choice. Its underlying S_p^∧-module is finite free of rank d. Thus the Tate-valued Frobenius, after identifying the target with SW(k) by const/can, is the unique E∞ endomorphism inducing the Witt Frobenius on π₀. It reduces to a↦a^p on k. (ns18, §IV.1, Example IV.1.2(ii), p.325; ns18 line 4858)

Only finite fields are asserted here; no compactness claim for SW(k) for arbitrary perfect k is made.

One proof route is as follows. Apply the finite-field Witt contract and the spectral étale equivalence of RefinedTraceMethods §6.1, keeping the chosen identification of π₀ with W(k). Spectral flatness gives π_iSW(k)=π_iS_p^∧⊗_(ℤ_p)W(k), so a ℤ_p-basis lifts to a finite-free module equivalence and places the underlying spectrum in the finite-cell S_p^∧-module class. Compare φ with the zeroth Postnikov section and ordinary Frobenius. The finite étale Witt input says reduction determines the ℤ_p-algebra endomorphism; the spectral étale equivalence then gives uniqueness on the spectrum. (ns18, §IV.1, Example IV.1.2(ii), p.325; ns18 line 4858)

The construction has the following API.

- π₀SW(k)≅WittVector p k, with the usual structural map ℤ_p→W(k). (ns18, §IV.1, Example IV.1.2(ii), p.325; ns18 line 4858)
- Among p-complete connective étale S_p^∧-algebras with this specified π₀ identification, the lift is unique up to contractible choice. (ns18, §IV.1, Example IV.1.2(ii), p.325; ns18 line 4858)
- The underlying S_p^∧-module is finite free of rank d. (ns18, §IV.1, Example IV.1.2(ii), p.325; ns18 line 4858)
- Under const/can, φ_SW(k) induces WittVector.frobenius on π₀ and is uniquely determined by it. (ns18, §IV.1, Example IV.1.2(ii), p.325; ns18 line 4858)

**Checks.**

- For d=1, SW(𝔽_p)≃S_p^∧ and its Frobenius is the identity.
- For a∈k and its Teichmüller class [a]∈W(k), π₀φ sends [a] to [a^p].
- The dth iterate of the Frobenius on SW(F_(p^d)) is the identity; for d>1 a class outside the prime field detects nonidentity of the first iterate.

*Needs:* §4.7; RefinedTraceMethods §6.1 and its finite-field Witt étale/Frobenius contract; `WittVector.equiv`; `WittVector.frobenius`; `WittVector.coeff_frobenius_charP`; `WittVector.frobenius_zmodp`.


### Examples

At (Hℤ,*,p=5), the Young-subgroup indices are 5,10,10,5 and generate (5). The additive defect 2⁵−2=30 dies in ℤ/5 and survives in ℤ/120. For 𝔽₄=𝔽₂[a]/(a²+a+1), Frobenius sends a to a+1 and its square sends a back to a.


### Dependencies

AInfCohomology §AI.7.2 (Spectral Tate diagonal); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); EnhancedDerivedSheaves E5:abstract (monoidal and operadic structures); RefinedTraceMethods §2.8 (E∞ Tate-valued Frobenius); GeneralizedCohomology G2.8 and BordismFormalGroups §F6.5; StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model); `frobenius`; RefinedTraceMethods §6.1 and its finite-field Witt étale/Frobenius contract; `WittVector.equiv`; `WittVector.frobenius`; `WittVector.coeff_frobenius_charP`; `WittVector.frobenius_zmodp`. The individual Needs lines specify the earlier local targets and distinguish the general statement from its application.

## Layer 5: Representation twists and powers in all degrees

Retain the permutation representation on suspension factors before taking Tate. Virtual inverses and parametrized adjunctions give the comparison for every integer degree and every space.


### 5.1 Representation spheres and twisted cohomology

For a space (anima) X and a real virtual vector bundle V on X, let S^V∈Fun(X,Sp) be its fiberwise invertible representation-sphere local system, with S^(−V) its tensor inverse. For p_X:X→pt define X^(−V)=p_(X,!)S^(−V) and R^V(X)=[X^(−V),R]. For an actual representation V of a finite group G, the corresponding S^V over BG is its one-point compactification with the full G-action; a virtual difference uses tensor inverse. For V the trivial rank-n virtual bundle, R^V(X)=R^n(X)=[Σ∞_+X,Σ^nR], for every n∈ℤ. This extends the supplied ordinary Thom and representation-sphere comparisons to all virtual ranks; it does not require an orientation or a global finite-rank complementary bundle. (ns18, §IV.1, discussion and proof of Lemma IV.1.19, pp.336–338; ns18 line 5256)

No orientability assumption is imposed on the bundle, since the twist retains orientation monodromy.

One proof route is as follows. Extend the supplied representation spheres and compatible Thom objects under tensor inversion, using the stable J-map on vector bundles and its direct-sum coherences. Apply the imported colimit/Thom formalism fiberwise; maps from the colimit give the adjunction description. For nontrivial virtual rank first split off the locally constant integer rank and use degree-zero R-lines on each component. Identify the trivial-bundle case by commuting suspension with the colimit. For a representation over BG retain its coherent action; do not choose a nonequivariant trivialization. (ns18, §IV.1, discussion and proof of Lemma IV.1.19, pp.336–338; ns18 line 5256)

The construction has the following API.

- For f:Y→X there is f*:R^V(X)→R^(f*V)(Y), from the Thom map induced by the colimit cocone; identities and composition agree. (ns18, §IV.1, discussion and proof of Lemma IV.1.19, pp.336–338; ns18 line 5256)
- [p_(X,!)S^(−V),R]≅[S^(−V),p_X^*R] in Fun(X,Sp), equivalently sections of S^V⊗p_X^*R. (ns18, §IV.1, discussion and proof of Lemma IV.1.19, pp.336–338; ns18 line 5256)
- S^(V⊕W)≃S^V⊗S^W and S^(−V)⊗S^V≃S, including negative virtual ranks. (ns18, §IV.1, discussion and proof of Lemma IV.1.19, pp.336–338; ns18 line 5256)
- R^(triv(n))(X)≅R^n(X), naturally for all integers n; at n=0 the Thom object is Σ∞_+X. (ns18, §IV.1, discussion and proof of Lemma IV.1.19, pp.336–338; ns18 line 5256)

**Checks.**

- For V=0, X^(−V)=Σ∞_+X and R^V(X)=R⁰(X).
- For X=pt and V of virtual rank −1, R^V(pt)=π₁R, not π_(−1)R.
- For the real Möbius line λ on S¹, HZ^λ(S¹)≅H¹(S¹;ℤ_sign)=ℤ/2; for the trivial line the group is ℤ. Replacing the twist by rank alone fails.
- For ρ_2, the swap acts on the top sphere by degree −1; two copies have degree +1. The action must survive the underlying suspension equivalence.

*Needs:* RefinedTraceMethods §2.4 (parametrized spectra); EnhancedDerivedSheaves E3 (Kan extensions); GeneralizedCohomology G4.2, G5.3 and RefinedTraceMethods §2.13 (Thom and representation spheres); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity).


### 5.2 The representation Thom adjunction

Let ρ be the p-dimensional permutation representation of Σ_p and n∈ℤ. There is a natural isomorphism R^(nρ)(X×BΣ_p)≅[Σ∞_+X,(S^(nρ)⊗R)^(hΣ_p)], where Σ_p acts trivially on R and nρ is pulled back from BΣ_p. This is valid for every space X and spectrum R, including n<0. It is induced by the p_!⊣p*⊣p_* adjunctions, not by choosing a Thom orientation. (ns18, §IV.1, Lemma IV.1.19 and proof, pp.336–338; ns18 line 5256)

For n=0 the isomorphism reduces to R⁰(X×BΣ_p)≅[Σ∞_+X,R^(hΣ_p)].

One proof route is as follows. Express the negative Thom object as the colimit of S^(−nρ) over X×BΣ_p. Adjoint to a map of parametrised spectra and tensor with S^(nρ). Compose the right Kan extensions over X×BΣ_p→X→pt; their BΣ_p step is the homotopy-fixed-point spectrum. (ns18, §IV.1, Lemma IV.1.19 and proof, pp.336–338; ns18 line 5256)

**Checks.**

- At n=0 the negative Thom object is Σ∞_+(X×BΣ_p), giving the same ordinary Borel cohomology on both sides.
- At X=* and n=−1, restricting to the trivial subgroup turns −ρ into the trivial virtual bundle of rank −p, so both sides give π_pR, rather than π₁R or π_(−p)R.
- At p=2 and n=−1, for R=ΣHℤ both restricted sides are π₂(ΣHℤ)=0, whereas the rank −1 reading would give π₁(ΣHℤ)=ℤ; for R=Σ²Hℤ both sides are π₂(Σ²Hℤ)=ℤ, whereas the rank −1 reading would give 0.
- For p=2 and n=1, the transposition on S^ρ has degree −1; for n=2 its degree is +1. The adjunction retains that action.

*Needs:* §5.1; RefinedTraceMethods §2.4 (parametrized spectra); EnhancedDerivedSheaves E3 (Kan extensions).


### 5.3 Rezk power operations in every degree

For an E∞-ring R, a prime p and n∈ℤ define P_p^n:Ω∞Σ^nR→Ω∞(S^(nρ)⊗R)^(hΣ_p) by the space diagonal, the lax monoidal Ω∞ comparison, the equivariant equivalence (Σ^nR)^(⊗p)≃S^(nρ)⊗R^(⊗p), and multiplication. Via the Thom adjunction this gives P_p^n:R^n(X)→R^(nρ)(X×BΣ_p). It is a natural operation of sets of cohomology classes; neither additivity nor an ordinary untwisted target is built into its definition. (ns18, §IV.1, equation (12), pp.333–334; Lemmas IV.1.19–IV.1.20, pp.336–338; ns18 line 5189)

For n=0 this is exactly the earlier degree-zero power operation.

One proof route is as follows. Apply the space diagonal to Ω∞Σ^nR and then the lax monoidal comparison. Retain the permutation representation on the suspension factors, including inverse representation spheres when n<0. Postcompose multiplication and use the Thom adjunction to obtain an operation on every space X. (ns18, §IV.1, equation (12), pp.333–334; Lemmas IV.1.19–IV.1.20, pp.336–338; ns18 line 5189)

The construction has the following API.

- Pullback along f:Y→X carries P_p^n(x) to P_p^n(f*x); maps of E∞ rings commute with the operation. (ns18, §IV.1, equation (12), pp.333–334; Lemmas IV.1.19–IV.1.20, pp.336–338; ns18 line 5189)
- Under the zero-bundle identification, P_p^0 agrees with the degree-zero power operation. (ns18, §IV.1, equation (12), pp.333–334; Lemmas IV.1.19–IV.1.20, pp.336–338; ns18 line 5189)
- Pullback along X→X×BΣ_p yields x^p∈R^(np)(X), with the usual graded multiplication signs. (ns18, §IV.1, equation (12), pp.333–334; Lemmas IV.1.19–IV.1.20, pp.336–338; ns18 line 5189)
- P_p^(n+m)(xy)=P_p^n(x)P_p^m(y), with the Thom direct-sum identification (n+m)ρ=nρ⊕mρ and the associated symmetry conventions. (ns18, §IV.1, equation (12), pp.333–334; Lemmas IV.1.19–IV.1.20, pp.336–338; ns18 line 5189)

**Checks.**

- For R=H𝔽₂, p=2, n=1 and u∈H¹(ℝP∞;𝔽₂), the mod-2 Thom isomorphism of ρ, which needs no orientation, carries P_2^1(u)∈H𝔽₂^ρ(ℝP∞×BΣ₂) to Sq⁰(u)b+Sq¹(u)=ub+u²∈H²(ℝP∞×BΣ₂;𝔽₂), with b the generator of H¹(BΣ₂;𝔽₂). Both monomials are nonzero, so an operation that is zero in positive degrees fails, and so does one that keeps only the restriction u².
- For R=KU, p=2, n=−2 and the Bott class β∈KU^(−2)(pt)=π₂KU, restriction along pt→BΣ₂ sends P_2^(−2)(β) to β²∈KU^(−4)(pt)=π₄KU, a unit of π_*KU. An operation that is zero in negative degrees fails.
- At n=0, R=KU, X=pt and p=2, P_2^0(2)=3·1+sign, of transposition character 2, as for P_2 in §4.4; the pullback of 2² would have character 4.
- For n=1 the target twist has virtual rank p but includes ρ’s monodromy; it is not identified with untwisted R^p(X×BΣ_p).
- For n=−1, the target is the inverse permutation sphere S^(−ρ); tensoring it with S^ρ gives the trivial twist, rather than another positive suspension.

*Needs:* §5.1; §5.2; §4.2; StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity).


### 5.4 Representation-suspension Tate comparison

For any E∞-ring spectrum R and n∈ℤ there is a natural equivalence Σ^n((R^(tC_p))^(hW))≃((S^(nρ)⊗R)^(tC_p))^(hW), where the right-hand action is inherited from the normalizer of C_p in Σ_p. This identifies the target of Σ^nφ_R with the Tate target of P_p^n. The representation has dimension np but the Tate suspension comparison shifts by n, and it holds for negative n as well. (ns18, §IV.1, Lemma IV.1.17 and proof, p.334; ns18 line 5194)

At n=0 the comparison is the identity.

No ordinary Σ^(np) suspension equivalence with trivial group action is substituted.

One proof route is as follows. In Mod_R consider M↦((M^(⊗_Rp))^(tC_p))^(hW), with tensor action before Tate. The mixed terms are induced and vanish, exactly as for T_p; hence this relative functor is exact. Compare its value on Σ^nR with Σ^n of its value on R. The tensor suspension is S^(nρ), giving the displayed equivalence. (ns18, §IV.1, Lemma IV.1.17 and proof, p.334; ns18 line 5194)

**Checks.**

- For p=2 and n=1 the comparison is induced by the inclusion of the fixed sphere S¹=(S^ρ)^(C₂)→S^ρ, whose cofiber is C₂-free. The reflection of S^ρ in its sign coordinate is C₂-equivariant, has underlying degree −1 and fixes S¹ pointwise, so it acts by −1 on π₂ of the underlying Σ²R but as the identity on (S^ρ⊗R)^(tC₂). For R=S this is visible on π₁(S^ρ)^(tC₂)=π₀S^(tC₂)=ℤ₂ (§2.7), where the reflection acts by 1, not −1. A comparison fixed by an orientation of the underlying sphere S² would change sign under it.
- For R=Hℤ, p=2 and n=1, π_i of the left side is π_(i−1)(Hℤ^(tC₂)), which is ℤ/2 for odd i and 0 for even i. Replacing S^ρ by a sphere of dimension 2 with trivial action gives Σ²Hℤ^(tC₂), with ℤ/2 in even and 0 in odd degrees. For R=H𝔽₂ both shifts give 𝔽₂ in every degree, so that coefficient cannot distinguish them.
- For n=−1, composing with n=1 gives the identity shift 0, since S^ρ⊗S^(−ρ)=S; replacing the inverse twist by a positive sphere gives dimension 4 instead of 0 at p=2.

*Needs:* §4.1; §5.1; AInfCohomology §AI.7.2 (Spectral Tate diagonal); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity).


### 5.5 Extended-power and Thom descriptions of power

The operation P_p^n agrees with the following classical Thom construction. For a virtual bundle V over X, the extended power of a representative X^(−V)→R and the E∞ multiplication define a class in R^(D_pV)(D_pX), with D_pX=(X^p)_(hΣ_p) and D_pV its fiberwise sum bundle. The Thom comparison is D_p(X^(−V))≃(D_pX)^(−D_pV). When V is the trivial rank-n bundle, pullback along the diagonal X×BΣ_p→D_pX has twist nρ and gives P_p^n. This applies to all virtual n. (ns18, §IV.1, Lemma IV.1.20 and proof, pp.338–339; ns18 line 5338)

The all-degree comparison uses homotopy orbits in D_pX and homotopy fixed points in the representing target; these are related by adjunction, not identified with one another.

One proof route is as follows. Use tensor compatibility and iterated colimits of parametrised spheres to prove the displayed Thom comparison; it includes virtual negative bundles by invertibility. Apply D_p to the representing map and then its E∞ multiplication to get the class over D_pX. Pull back along the Borel diagonal. Adjoint to the representing map using the Thom adjunction; the resulting map is the definition of P_p^n. (ns18, §IV.1, Lemma IV.1.20 and proof, pp.338–339; ns18 line 5338)

**Checks.**

- For X=* and V=0, D_p(S)=Σ∞_+BΣ_p and the comparison is the identity Thom object.
- For trivial rank 1 and p=2 the pulled-back negative bundle has rank −2 with determinant sign −1; a trivial rank-two bundle has sign +1 and fails the comparison.
- For trivial virtual rank −1 the negative Thom object at the point is ΣS; its pth extended power has twist +ρ, of dimension p, consistently with the inverse of the original virtual twist.

*Needs:* GeneralizedCohomology G2.8 and BordismFormalGroups §F6.5; §5.1; §5.3; §5.2.


### 5.6 Frobenius and power operations in all degrees

For every E∞-ring R, space X, n∈ℤ and prime p, postcomposition with Σ^nφ_R equals R^n(X)→R^(nρ)(X×BΣ_p)→[Σ∞_+X,((S^(nρ)⊗R)^(tC_p))^(hW)]≅[Σ∞_+X,Σ^n((R^(tC_p))^(hW))]. The first map is P_p^n, the second is restriction to the normalizer followed by can, and the last is the inverse of the Tate-suspension equivalence. This is the precise comparison of the spectral Frobenius with classical power operations, including negative degrees. (ns18, §IV.1, Lemma IV.1.18, p.335, and Theorem IV.1.21, p.339; ns18 line 5397)

The n=0 specialization is exactly the earlier degree-zero comparison.

The theorem imposes no boundedness hypothesis on R; boundedness was needed for the Segal equivalence, not for constructing or comparing these maps.

One proof route is as follows. Exactness identifies Σ^nΔ_R with Δ_(Σ^nR) under the corresponding Tate-suspension comparison. The compatibility of multiplication with that comparison gives the target comparison of the Frobenius. Apply the underlying-space diagonal theorem to Σ^nR, then the Thom and extended-power comparison, and take maps from X. (ns18, §IV.1, Lemma IV.1.18, p.335, and Theorem IV.1.21, p.339; ns18 line 5397)

**Checks.**

- At n=0 the two maps are exactly the degree-zero comparison of §4.6, taking 2 in Hℤ to 0 mod 2.
- At p=2, n=1 and the class u in H¹(ℝP∞;𝔽₂), both routes give u+u²s with total degrees 1 and 2−1=1.
- At n=−1 the twist is −ρ; tensoring with +ρ has rank 0 on both routes. The statement requires this integer degree even when a particular connective coefficient spectrum has no such classes on a point.

*Needs:* §5.3; §5.4; §5.5; §4.2; RefinedTraceMethods §2.8 (E∞ Tate-valued Frobenius).


### Examples

For the Möbius line λ on S¹, the integral cochain differential is multiplication by 2, giving H¹(S¹;ℤ_sign)=ℤ/2. The trivial line has differential 0 and group ℤ. At a point a virtual rank −1 gives π₁R, retaining the suspension sign.


### Dependencies

RefinedTraceMethods §2.4 (parametrized spectra); EnhancedDerivedSheaves E3 (Kan extensions); GeneralizedCohomology G4.2, G5.3 and RefinedTraceMethods §2.13 (Thom and representation spheres); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); AInfCohomology §AI.7.2 (Spectral Tate diagonal); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); GeneralizedCohomology G2.8 and BordismFormalGroups §F6.5; RefinedTraceMethods §2.8 (E∞ Tate-valued Frobenius). The individual Needs lines specify the earlier local targets and distinguish the general statement from its application.

## Layer 6: Frobenius and the total Steenrod operation

Choose coefficient splittings with the normalized Weyl weights and identify every spectrum-map component of Frobenius. This layer distinguishes equality of stable operations from agreement only on coefficient groups.


### 6.1 Eilenberg–MacLane Tate decompositions

As H𝔽_p-module spectra, (H𝔽₂)^(tC_2)≃∏_(j∈ℤ)Σ^jH𝔽₂. At odd p, ((H𝔽_p)^(tC_p))^(hW)≃∏_(j∈ℤ)(Σ^(2j(p−1))H𝔽_p⊕Σ^(2j(p−1)+1)H𝔽_p). Likewise (HZ)^(tC_2)≃∏_(j∈ℤ)Σ^(2j)H𝔽₂, and at odd p ((HZ)^(tC_p))^(hW)≃∏_(j∈ℤ)Σ^(2j(p−1))H𝔽_p. Choose these splittings by the monomials in the normalized generators of Layer 1. For H𝔽_p they are splittings of H𝔽_p-modules through const and can: the summand Σ^(2j(p−1))H𝔽_p is spanned by t^((p−1)j)=u^(−(p−1)j) and Σ^(2j(p−1)+1)H𝔽_p by t^((p−1)j)e with βe=1, and at p=2 the summand Σ^jH𝔽₂ by s^j. For Hℤ they are splittings of Hℤ-modules through const, obtained from the complete cyclic resolution decomposed into two-term complexes with differential p; each summand is the Hℤ-module Hℤ/p=H𝔽_p in the degree of the corresponding even monomial, which fixes its inclusion. The integral splitting is one of Hℤ-modules and of underlying spectra; const has source Hℤ, so no H𝔽_p-module structure through const is asserted for the integral Tate spectrum. This is the monomial splitting used in §§6.2–6.3. Because only finitely many summands contribute to each homotopy degree, the corresponding sum-to-product maps are equivalences; mapping an arbitrary spectrum into this product still gives a product of operation components. (ns18, §IV.1, displays before Theorem IV.1.15, p.332; ns18 line 5098)

The summand carrying P¹ at odd p is Σ^(2(p−1))H𝔽_p.

The map φ_(H𝔽_p) is generally not H𝔽_p-linear; only its target decomposition is an H𝔽_p-module splitting.

One proof route is as follows. Calculate coefficients by the cyclic resolution and W weights. An H𝔽_p-module splits degreewise because 𝔽_p is a field. For HZ Tate, use the periodic resolution to exhibit the two-term pieces with differential p, each quasi-isomorphic to a shifted 𝔽_p. Take W-invariants by averaging and select only weights divisible by p−1. Use degreewise finiteness of summands to compare their sum and product. (ns18, §IV.1, displays before Theorem IV.1.15, p.332; ns18 line 5098)

**Checks.**

- At p=3 the even invariant component carrying P¹ has suspension 4 and the odd component carrying βP¹ has suspension 5; shifts 2 and 3 are incorrect.
- For Hℤ at p=2 the summand π₁ is zero and π₀ is 𝔽₂, whereas H𝔽₂ Tate has π₁=𝔽₂.
- Integrally, Hℤ-module maps Σ^(2j)Hℤ/p→Σ^(2k)Hℤ/p form Ext^(2k−2j)_ℤ(ℤ/p,ℤ/p), which vanishes unless k=j because the degree is even and Ext_ℤ stops at degree 1. So each integral summand inclusion is fixed by its monomial in π_(2j). No unital map H𝔽_p→Hℤ exists, since on π₀ it would send p·1=0 to p≠0; the integral scalars are therefore Hℤ through const.
- In every fixed homotopy degree at most one displayed Eilenberg–MacLane summand contributes. The sum-to-product map is therefore an isomorphism on every π_i; it does not identify products of cohomology classes with a finite tensor expansion.

*Needs:* §1.1; §4.1; StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); KTheoryFiniteLocalFields §4.5 (Eilenberg–MacLane Tate comparison).


### 6.2 Steenrod components of the ordinary power

With the normalization s, t=u⁻¹ and e=b·u⁻¹ (βe=1) of Layer 1 and the monomial splitting of §6.1, applying can to P_p^n and then the Tate-suspension comparison has right coefficients Sq^i at p=2, and (−1)^iP^i and (−1)^(n+i)βP^i at odd p. Equivalently, on a homogeneous x∈H^n(X;𝔽_p) of a space, the resulting degree-n class is Σ_(i≥0)Sq^i(x)s^i at p=2, and Σ_(i≥0)(−1)^iP^i(x)t^((p−1)i)+(−1)^nΣ_(i≥0)(−1)^iβP^i(x)t^((p−1)i)e at odd p, with the Tate coefficients on the right. Each term has total degree n. The scalars are those of the Euler-normalized power expansion: with m=(p−1)/2, the power of x is Σ_i(−1)^(mi+mn(n−1)/2)[P^i(x)χ^(n−2i)+(−1)^nβP^i(x)ωχ^(n−2i−1)], where χ=m!u^m is the Euler class of the reduced real regular representation and ω=m!bu^(m−1), so βω=χ (bmms86, Chapter VIII §2, Proposition 2.4(vi), scan PDF p.134, and the normalization of χ and ω in the proof of the Adem relations, scan PDF p.135; bmms86 line 4481 and bmms86 line 4501). Dividing by the leading coefficient (−1)^(mn(n−1)/2)χ^n and using (m!)²=(−1)^(m+1) in 𝔽_p gives χ^(−2i)=(−1)^((m+1)i)t^((p−1)i) and ωχ⁻¹=e, hence the displayed signs. The unsigned formula of ns18 Proposition IV.1.16 is not multiplicative for the Koszul sign rule and disagrees with the Euler computation of the second Check. The expression denotes the coefficientwise product decomposition; for an ordinary space and a fixed homogeneous class instability makes these displayed sums finite. It is not an unqualified tensor-product description of cohomology for arbitrary unbounded spectra. (bmms86, Chapter VIII §2, formulas (1)–(4) and Propositions 2.2–2.4 (scan PDF pp.133–135); bmms86 line 4414; ns18, §IV.1, Proposition IV.1.16 and its proof following Theorem IV.1.21, pp.333,339–340; ns18 line 5155)

For u∈H¹(ℝP∞;𝔽₂), the formula gives u+u²s.

For v∈H²(ℂP∞;𝔽_p), odd p, the formula gives v−v^p t^(p−1), with zero Bockstein terms.

One proof route is as follows. Use the extended-power Thom comparison to identify P_p^n with the ordinary-cohomology power operation used to construct the Steenrod operations. At odd p the Thom isomorphism of nρ and the inverse Tate-suspension comparison differ by multiplication by a unit of Ĥ^(n(p−1))(C_p;𝔽_p)=𝔽_p·u^(mn), a class of even degree, and at p=2 by a power of b; since φ is unital and its degree-zero component is a stable operation, that unit is fixed by making the coefficient of x equal to 1. Divide the Euler-normalized expansion above by it, tracking the coefficients s^i or t^((p−1)i) and the Bockstein coefficient e on the right. At odd p check W weights and the factor 2 in the degree. Apply instability only to classes on spaces. (bmms86, Chapter VIII §2, formulas (1)–(4) and Propositions 2.2–2.4 (scan PDF pp.133–135); bmms86 line 4414; ns18, §IV.1, Proposition IV.1.16 and its proof following Theorem IV.1.21, pp.333,339–340; ns18 line 5155)

**Checks.**

- For u in H¹(ℝP∞;𝔽₂), the expression is u+u²s with degrees 1 and 2−1=1. Independently, the power of u is the Euler class u(u+b) of the tensor bundle, and dividing by the Euler class b of the sign representation gives u+u²b⁻¹=u+u²s.
- For v in H²(ℂP∞;𝔽₃), it is v−v³t²=v+2v³t²; both terms have degree 2 because 6−4=2, and its Bockstein terms are zero. Independently, the power of v is the Euler class v(v+u)(v+2u)=v³−vu² of the line bundle tensored with the complex regular representation; its coefficient of v is −u², and dividing by it gives v−v³u⁻²=v−v³t². The unsigned v+v³t² fails this test, and no rescaling of t changes t².
- For x in H¹(BC₃;𝔽₃) and y=βx, the expression is x−ye; both degrees are 1 because 2−1=1. Omitting βP⁰ loses the second nonzero component.
- At p=3 on BC₃×BC₃ take degree-one x and z with y=βx and w=βz; all positive reduced powers of x, z and xz vanish. The formula gives x−ye, z−we and, since β(xz)=yz−xw, xz+(yz−xw)e. The product (x−ye)(z−we)=xz−xwe+yze is the same class, using e·z=−z·e and e²=0. The unsigned formula would give x+ye and z+we with product xz+(xw−yz)e, while its value on xz is xz+(yz−xw)e; since yze and xwe are independent, the unsigned formula is not multiplicative.

*Needs:* TangentialBordism §B4 items 1, 2 and 7; §5.5; §5.4; §6.1.


### 6.3 Frobenius as the total Steenrod operation

Under the monomial splitting of §6.1, φ_(H𝔽₂):H𝔽₂→(H𝔽₂)^(tC_2) has component Sq^i:H𝔽₂→Σ^iH𝔽₂ on the summand of s^i for i≥0 and zero components for i<0. At odd p, φ_(H𝔽_p):H𝔽_p→((H𝔽_p)^(tC_p))^(hW) has component (−1)^iP^i:H𝔽_p→Σ^(2i(p−1))H𝔽_p on the summand of t^((p−1)i), and on the summand of t^((p−1)i)e the stable operation θ_i:H𝔽_p→Σ^(2i(p−1)+1)H𝔽_p that sends a class x of degree n of a space to (−1)^(n+i)βP^i(x), for i≥0; negative-index components are zero. Here a spectrum map θ:H𝔽_p→Σ^kH𝔽_p acts on degree-n classes as Σ^nθ, with suspension coordinates on the left, so that it commutes with x↦ι×x for the fundamental class ι of S¹. Since β(ι×x)=−ι×βx for the left derivation β of Conventions, the family x↦(−1)^nβx commutes with this suspension and the unsigned family x↦βx does not; writing β_L for the stable Bockstein in this convention, θ_i=(−1)^iβ_LP^i. For HZ the components are Sq^(2i)∘r at p=2, and (−1)^iP^i∘r at odd p, i≥0, where r:HZ→H𝔽_p is reduction. Evaluation on spaces is the total-operation formula of the previous theorem. This is an equality of spectrum maps, not just of maps on π₀. (ns18, §IV.1, Theorem IV.1.15 and Proposition IV.1.16, pp.332–333; proof completed pp.339–340; ns18 line 5132; bmms86, Chapter VIII §2, Proposition 2.4(vi), scan PDF p.134; bmms86 line 4481)

The i=0 component on the summand of 1 is the identity for H𝔽_p and reduction for HZ.

For p=3, the components −P¹ and θ₁ have targets Σ⁴H𝔽₃ and Σ⁵H𝔽₃.

The higher components may be nonzero although all positive homotopy groups of H𝔽_p itself vanish.

One proof route is as follows. The all-degree Frobenius theorem identifies evaluation with the power coefficients just computed. For each Eilenberg–MacLane target summand, identify the corresponding stable operation using representability and the complete stable Steenrod-operation algebra, retaining the all-degree comparisons. Product universality gives equality of the spectrum maps; do not assume φ is H𝔽_p-linear. The signs (−1)^i and (−1)^(n+i) are those of §6.2; no unsigned reading of the components is compatible with the monomial splitting. Use naturality under HZ→H𝔽_p and the coefficient map on Tate to obtain the integral variant, eliminating the odd-square/Bockstein summands. (ns18, §IV.1, Theorem IV.1.15 and Proposition IV.1.16, pp.332–333; proof completed pp.339–340; ns18 line 5132)

**Checks.**

- The identity/reduction component sends 1 to 1 at both p=2 and p=3; a zero map has component 0.
- At p=3 the components −P¹ and θ₁ target Σ⁴H𝔽₃ and Σ⁵H𝔽₃; on v in degree 2 they give −v³=2v³ in degree 6 and 0 in degree 7. The unsigned component P¹ would give v³, contradicting the Euler computation of §6.2.
- At p=3 the component θ₀ sends x∈H¹(BC₃;𝔽₃) to −βx=−y and the degree-two class xz∈H²(BC₃×BC₃;𝔽₃) to +β(xz)=yz−xw. The sign alternates with the degree, as stability under x↦ι×x requires; a component equal to the unsigned β on every degree would make φ non-multiplicative by the last Check of §6.2.
- For the mod-2 unit in H⁰(*), all positive components vanish while Sq⁰ is 1. On u in H¹(ℝP∞;𝔽₂), Sq¹u=u²≠0; agreement on coefficient π₀ alone would miss this component.

*Needs:* §5.6; §6.2; §6.1; TangentialBordism §B4 items 2 and 7; RefinedTraceMethods §2.8 (E∞ Tate-valued Frobenius).


### Examples

On v in H²(ℂP∞;𝔽₃), the two nonzero terms are v and −v³t², both of total degree 2. On x in H¹(BC₃;𝔽₃), the Bockstein term −ye has degree 2−1=1, and on xz in H²(BC₃×BC₃;𝔽₃) the Bockstein term is +(yz−xw)e, the sign (−1)^n changing with the degree. Thus both the factor 2 in the power shift and the odd component are detectable.


### Dependencies

StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); KTheoryFiniteLocalFields §4.5 (Eilenberg–MacLane Tate comparison); TangentialBordism §B4 items 1, 2 and 7; TangentialBordism §B4 items 2 and 7; RefinedTraceMethods §2.8 (E∞ Tate-valued Frobenius). The individual Needs lines specify the earlier local targets and distinguish the general statement from its application.

## Layer 7: K-theory Frobenius and boundedness counterexamples

Identify cyclic tensor powers of virtual bundles, calculate the Euler-inverted KU coefficients and determine the Bott value of Frobenius. Then use explicit nonzero coefficients to establish each boundedness obstruction.


### 7.1 Atiyah cyclic power in K-theory

For a finite CW pair (X,A), construct Atiyah’s cyclic power on KU⁰(X,A) by the C_p-equivariant p-fold tensor product of complexes of vector bundles, followed by restriction along the diagonal and the Borel construction. For an actual bundle V its fiber is V^(⊗p), with C_p rotating the factors. Extend to virtual classes using the complex/difference construction, not by declaring tensor power additive. For absolute X this gives KU⁰(X)→KU⁰(X×BC_p)^(W). This is the restriction of the E∞ KU power operation P_p⁰. (bmms86, Chapter VIII §4, Theorem 4.1, Proposition 4.2 and Lemma 4.3 (scan PDF pp.141–142); bmms86 line 4664; ns18, §IV.1, proof of Proposition IV.1.12(i), pp.329–330; ns18 line 5002)

For a line bundle L, the cyclic generator acts trivially on the line L^(⊗p); evaluation at a p-cycle gives L^p.

One proof route is as follows. Use equivariant tensor products of relative complexes, with Koszul signs for complex degrees, and pass through the difference construction. Prove homotopy and acyclic-complex invariance and compare the resulting operation with the E∞ KU multiplication using the splitting principle and the additive transfer formula. Restriction from Σ_p makes the result invariant under the cyclic normalizer. (bmms86, Chapter VIII §4, Theorem 4.1, Proposition 4.2 and Lemma 4.3 (scan PDF pp.141–142); bmms86 line 4664; ns18, §IV.1, proof of Proposition IV.1.12(i), pp.329–330; ns18 line 5002)

The construction has the following API.

- For an actual V the class is the Borel bundle of the cyclic tensor representation V^(⊗p). (bmms86, Chapter VIII §4, Theorem 4.1, Proposition 4.2 and Lemma 4.3 (scan PDF pp.141–142); bmms86 line 4664; ns18, §IV.1, proof of Proposition IV.1.12(i), pp.329–330; ns18 line 5002)
- Pullback of finite CW pairs commutes with the construction, as does restriction along subgroups. (bmms86, Chapter VIII §4, Theorem 4.1, Proposition 4.2 and Lemma 4.3 (scan PDF pp.141–142); bmms86 line 4664; ns18, §IV.1, proof of Proposition IV.1.12(i), pp.329–330; ns18 line 5002)
- The difference construction on complexes extends the actual-bundle operation compatibly with the mixed-summand transfer formula. (bmms86, Chapter VIII §4, Theorem 4.1, Proposition 4.2 and Lemma 4.3 (scan PDF pp.141–142); bmms86 line 4664; ns18, §IV.1, proof of Proposition IV.1.12(i), pp.329–330; ns18 line 5002)
- The operation equals the restriction of P_p⁰ for the imported E∞ KU spectrum. (bmms86, Chapter VIII §4, Theorem 4.1, Proposition 4.2 and Lemma 4.3 (scan PDF pp.141–142); bmms86 line 4664; ns18, §IV.1, proof of Proposition IV.1.12(i), pp.329–330; ns18 line 5002)

**Checks.**

- The zero virtual class maps to zero and the unit class maps to the unit.
- For X=pt and p=2, the rank-two trivial vector space has tensor-square representation 3·1+sign; its rank is 4 and its transposition character is 2.
- For X=pt and p=2, P_2(−1)=sign in the completed representation ring; its transposition character is −1, as required by ψ²(−1).
- For a line bundle L, evaluating the cyclic generator on the power gives [L]^p, agreeing with ψ^p[L].

*Needs:* GeneralizedCohomology G5.4 and TopologicalKTheory T1–T5 (KU, Bott and splitting); §4.4; §5.5.


### 7.2 Tate coefficients of periodic K-theory

For KU with trivial C_(p^r)-action, r=1,2, choose the multiplicative coordinate x=L−1. Then π_*KU^(tC_(p^r)) is KU_*[[x]][x⁻¹]/((1+x)^(p^r)−1), interpreted by the Euler-inversion/completed-cohomology construction, and is KU_*⊗_ℤ(⊕_(j=1)^r ℚ_p(ζ_(p^j))); the finite direct sum is also the product ring. The spectra are rational, even periodic, and have no odd homotopy. For r=1, W acts by the cyclotomic Galois action on ℚ_p(ζ_p) and fixes KU_*, so the constant-map comparison gives KU_p^∧[1/p]≃(KU^(tC_p))^(hW). (ns18, §I.2, Example I.2.3(iii), p.220; §IV.1, equation (11) and discussion before Proposition IV.1.12, p.329; ns18 line 648, ns18 line 4990)

At p=2, KU^(tC_2) has even homotopy ℚ_2 and KU^(tC_4) has even homotopy ℚ_2⊕ℚ_2(i).

The p-series has zero constant term; the coordinate uses (1+x)^p−1, not the misprinted series of Example I.2.3.

This comparison equivalence is induced by the constant map, not by the Frobenius whose Bott action is different.

One proof route is as follows. Use the complex orientation and the skeletal filtration of BC_(p^r) to compute KU⁰(BC_(p^r)) by the multiplicative p^r-series, with the completion dictated by the filtration. The representation-sphere model of Tate inverts the Euler class x. In the resulting quotient inverting x forces p to be invertible. Factor the p^r-series into cyclotomic factors and use their coprimality after inversion to obtain the indicated fields. Compute the normalizer action on a chosen root of unity; invariants of ℚ_p(ζ_p) are ℚ_p. The constant map sends the coefficient and Bott classes to their usual images, giving the spectrum equivalence. (ns18, §I.2, Example I.2.3(iii), p.220; §IV.1, equation (11) and discussion before Proposition IV.1.12, p.329; ns18 line 648, ns18 line 4990)

**Checks.**

- At p=2 the even coefficients for C₂ are ℚ₂ and those for C₄ are ℚ₂⊕ℚ₂(i), of ℚ₂-dimensions 1 and 3; all odd coefficients vanish.
- At p=3 the cyclic coefficient field is ℚ₃(ζ₃), of degree 2, and the W invariants have degree 1 and equal ℚ₃.
- At x=0 the series (1+x)^p−1 has value 0, while (x−1)^p−1 gives −2 at p=3. For p²=9 the correct exponent is 9, and the value remains 0.

*Needs:* GeneralizedCohomology G5.4 and TopologicalKTheory T1–T5 (KU, Bott and splitting); GeneralizedCohomology G5.4 and RefinedTraceMethods §5.3 (the KU orientation); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); §4.1; GeneralizedCohomology G3.9 (derived completion and its function-spectrum model); GeneralizedCohomology G3.9 and StableHomotopyKTheory §7.19 (rationalization).


### 7.3 The KU Frobenius is the stable Adams operation

Under (KU^(tC_p))^(hW)≃KU_p^∧[1/p], the refined Tate-valued Frobenius is the composite KU→KU[1/p]→KU_p^∧[1/p], whose first arrow is the imported stable Adams operation ψ^p. For a compact object X of spaces (a homotopy retract of a finite CW complex), on KU⁰(X) this is ψ^p followed by KU⁰(X)→KU⁰(X)⊗ℚ_p. It sends the homotopy Bott class β∈π₂KU to pβ. The unstable Adams operation on KU⁰ does not extend to a stable self-map KU→KU with that Bott action: the target must invert p. (ns18, §IV.1, Proposition IV.1.12(i)–(ii), Remarks IV.1.13–IV.1.14, pp.329–331; ns18 line 5002)

For a line bundle L, φ([L])=[L]^p after the coefficient extension.

For p=2, β goes to 2β; sending β to β would identify the constant map rather than Frobenius.

Topological compact Hausdorffness alone is not the meaning of compact space in this statement.

One proof route is as follows. Apply the degree-zero Frobenius comparison to KU and use the Atiyah compatibility. Cyclic character evaluation kills the transfer/regular-representation part and leaves ψ^p. Use splitting into line bundles to identify the operation on KU⁰ of finite CW complexes and their retracts. Test the reduced class on S² to obtain β↦pβ. The imported Snaith–Adams construction identifies the E∞ map after inverting p, then the constant-map coefficient equivalence supplies p-completion and rationalization. (ns18, §IV.1, Proposition IV.1.12(i)–(ii), Remarks IV.1.13–IV.1.14, pp.329–331; ns18 line 5002)

**Checks.**

- On the line class H over S², write H=1+β with β²=0 in reduced degree-zero cohomology. Then H^p=1+pβ, so at p=2 the reduced value is 2β.
- The homotopy Bott values are β↦pβ and β⁻¹↦β⁻¹/p; their product is 1. Replacing the second image by β⁻¹ gives product p.
- For the zero virtual class and unit class the values are 0 and 1 respectively; for the virtual class −1 at p=2 the cyclic character is −1, matching ψ²(−1).

*Needs:* §7.1; §7.2; §4.6; RefinedTraceMethods §5.1 (localized stable Adams operations); GeneralizedCohomology G5.4 and TopologicalKTheory T1–T5 (KU, Bott and splitting); RefinedTraceMethods §2.8 (E∞ Tate-valued Frobenius).


### 7.4 A counterexample to unbounded Tate orbit vanishing

For KU with trivial C_(p²)-action the Tate orbit conclusion (KU_(hC_p))^(t(C_(p²)/C_p))≃0 fails. Indeed the natural comparison KU^(tC_(p²))→(KU^(tC_p))^(h(C_(p²)/C_p)) is not an equivalence: in each even degree its source has coefficient ℚ_p(ζ_p)⊕ℚ_p(ζ_(p²)), whereas its target has ℚ_p(ζ_p). Odd homotopy groups are zero. (ns18, §I.2, Example I.2.3(iii), pp.219–220; §II.4, Lemma II.4.1, pp.260–261; ns18 line 648)

At p=2 the two even coefficient spaces have ℚ_2-dimensions 3 and 1.

One proof route is as follows. The coherent residual action on KU^(tC_p) extends to the connected circle quotient, so it acts trivially on homotopy groups. For this rational spectrum higher finite-group cohomology vanishes, so the residual homotopy fixed points have unchanged coefficients. Compare the two Tate coefficient calculations. The orbit-vanishing condition would imply an equivalence by the norm comparison argument; the dimensions differ. (ns18, §I.2, Example I.2.3(iii), pp.219–220; §II.4, Lemma II.4.1, pp.260–261; ns18 line 648)

**Checks.**

- At p=2, source and target of the comparison have even ℚ₂-dimensions 3 and 1, respectively.
- At p=3 those dimensions are (3−1)+(9−3)=8 and 3−1=2, respectively. The difference has dimension 6.
- For the rational coefficient spectrum Hℚ, both Tate spectra and the orbit obstruction are 0. KU has nonzero even coefficients in arbitrarily negative degrees, so the bounded-below orbit theorem does not apply.

*Needs:* §7.2; RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); GeneralizedCohomology G3.9 and StableHomotopyKTheory §7.19 (rationalization).


### 7.5 Failure of Segal completion for unbounded spectra

Let L be localization at KU_(2), so its local sphere is L_1S at the prime 2. The raw Tate spectrum (LS)^(tC₂), with trivial action, is rational by finite-height descent. The unit LS→KU_(2)⊗KU_(2) is C₂-equivariant for the factor swap, because the localized sphere is an idempotent commutative algebra and this tensor product is L-local. Its Tate spectrum is a unital module over (LS)^(tC₂) and is therefore rational. Prime-to-2 localization does not change a C₂-Tate spectrum, so T₂(KU)=(KU⊗KU)^(tC₂) is rational as well. Thus Δ₂:KU→T₂(KU) cannot give KU₂^∧: the latter has nonzero mod-2 cofiber. This is the tensor permutation action, distinct from the trivial KU action in §7.2. (ns18, §III.1, paragraph following Theorem III.1.7, p.288; ns18 line 3283)

The rationality conclusion suffices; a complete calculation of T_2(KU) is not asserted.

One proof route is as follows. Specialize BordismFormalGroups §F6.5 finite-height descent to n=1 at p=2; its E(0)-local target is rational. E(1) has the Bousfield class of KU_(2): BordismFormalGroups §F3 identifies ku_(2) with BP⟨1⟩, the identification matches the generators v₁ and β of π₂ up to a 2-local unit, and inverting v₁ on BP⟨1⟩ gives E(1), so inverting β on ku_(2) gives KU_(2)≃E(1). Use smashing localization from BordismFormalGroups §F6.1 and §F6.4 to give KU_(2)⊗KU_(2) its unique equivariant L_1S-algebra structure; lax monoidal Tate supplies the module action. Localize prime-to-2 first and use Tate p-locality, then compare the mod-2 Moore cofibers via Bott periodicity. (ns18, §III.1, paragraph following Theorem III.1.7, p.288; ns18 line 3283)

**Checks.**

- At degree 0, KU₂^∧/2 has 𝔽₂, whereas rational T₂(KU)/2 has 0; the mod-2 obstruction is explicit.
- Bott periodicity gives the same values in degrees 2 and −2. The negative value prevents treating KU as bounded below.
- For the bounded-below comparison X=S, T₂(S)=S₂^∧ has π₀=ℤ₂, which is not rational. Thus raw rationality was proved for the height-one localized sphere and its modules, not for all trivial C₂-actions.

*Needs:* GeneralizedCohomology G5.4 and TopologicalKTheory T1–T5 (KU, Bott and splitting); AInfCohomology §AI.7.2 (Spectral Tate diagonal); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); BordismFormalGroups §F6.1 and §F6.5 (height-one finite-local Tate descent); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model); BordismFormalGroups §F6.4 (smashing) and §F3 (ku_(2)≃BP⟨1⟩ and E(1) as the v₁-localization of BP⟨1⟩, giving E(1)≃KU_(2)).


### Examples

At p=2 a rank-two bundle has tensor-square character 3·1+sign: dimension 4 and transposition value 2. The virtual class −1 instead gives sign with character −1. The C₄ KU Tate coefficient ring has ℚ₂-dimension 3, while the C₂ coefficient field has dimension 1.

The sphere counterexample to the Tate fixpoint lemma follows from §2.7. Give S the trivial C_(p²)-action and apply t(C_(p²)/C_p) to the norm sequence S_(hC_p)→S^(hC_p)→S^(tC_p) of residual C_(p²)/C_p-spectra. The first term has zero residual Tate construction by the imported Tate orbit lemma, since S is bounded below. The composite S→S^(hC_p)→S^(tC_p), the unit of inflation followed by can, is equivariant from S with trivial action, and by §2.7 it is a p-completion; so S^(tC_p)≃S_p^∧ with trivial residual action. Hence (S^(hC_p))^(t(C_(p²)/C_p))≃(S_p^∧)^(tC_p)≃S^(tC_p)≃S_p^∧, by RefinedTraceMethods §2.3(iii) and §2.7 again (ns18, §I.2, Example I.2.3(i), p.219; ns18 line 618). At p=2 its π₀ is ℤ₂ with mod-2 quotient 𝔽₂, and at p=3 its π₀ is ℤ₃ with mod-3 quotient 𝔽₃, rather than 0; the zero C_(p²)-spectrum gives 0. The sphere has nonzero positive stable stems, so it is not bounded above and the fixpoint lemma does not apply to it. Together with the KU computation of §7.4, this shows that the fixpoint and orbit lemmas each need their own boundedness hypothesis.


### Dependencies

GeneralizedCohomology G5.4 and TopologicalKTheory T1–T5 (KU, Bott and splitting); GeneralizedCohomology G5.4 and RefinedTraceMethods §5.3 (the KU orientation); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model); GeneralizedCohomology G3.9 and StableHomotopyKTheory §7.19 (rationalization); RefinedTraceMethods §5.1 (localized stable Adams operations); RefinedTraceMethods §2.8 (E∞ Tate-valued Frobenius); RefinedTraceMethods §2.3 (Tate fixpoint lemma and p-completion invariance of Tate, applied in the Examples); §2.7 and AInfCohomology §AI.7.2 (Tate orbit lemma), for the sphere counterexample derived in the Examples; RefinedTraceMethods §2.3 and KTheoryFiniteLocalFields §4.4 (boundedness and residual Tate comparison); AInfCohomology §AI.7.2 (Spectral Tate diagonal); BordismFormalGroups §F6.1 and §F6.5 (height-one finite-local Tate descent); BordismFormalGroups §F6.4 (smashing) and §F3 (ku_(2)≃BP⟨1⟩ and E(1) as the v₁-localization of BP⟨1⟩, giving E(1)≃KU_(2)). The individual Needs lines specify the earlier local targets and distinguish the general statement from its application.

## Layer 8: The free-loop Segal theorem

Prove the free-loop suspension-spectrum comparison with its connectivity bounds before interchanging Tate with totalization. Apply the bounded-below Segal theorem levelwise and retain the genuine fixed-point pullbacks.


### 8.1 Suspension spectra of the free-loop totalization

For every based simply connected space Y, the standard cosimplicial free-loop model Y^(n+1) has a comparison Σ∞_+LY→Tot_([n]∈Δ)Σ∞_+(Y^(n+1)) which is an equivalence. The same statement holds after any fixed p-fold edgewise subdivision, with terms Y^(p(n+1)) and its coherent C_p-action. The fibers of successive partial-totalization stages have connectivity tending to +∞. No finite CW or finite-type hypothesis on Y is imposed. This is a theorem for this cosimplicial model, not preservation of arbitrary limits by Σ∞_+. (kuhn04, §6, Definitions 6.1, Theorems 6.2 and 6.6, preprint pp.15–16; kuhn04 line 596; malkiewich17, §2.5, Proposition 2.22 and proof, preprint pp.14–15; malkiewich17 line 609; ns18, §IV.3, proof of Theorem IV.3.7, p.355; ns18 line 5988)

Throughout this statement, Y is based and simply connected, in spaces up to weak equivalence.

For Y=pt, the totalization is S and the comparison is the identity.

The simply connected hypothesis remains visible in every application.

One proof route is as follows. For finite simply connected CW input use the McCord/Kuhn comparison with the circle model. Analyze the normalized fiber at cosimplicial degree n≥1: it is built from Ω^nΣ∞Y^(∧n) and Ω^nΣ∞Y^(∧(n+1)). Since Y is 1-connected their connectivity grows with n; retain the reduced suspension spectrum in these terms. For arbitrary simply connected Y, express it as a filtered homotopy colimit of finite simply connected models. At each fixed totalization stage the construction is finite; increasing connectivity lets the filtered colimit commute with the complete totalization degree by degree, as in Malkiewich’s proof. Use the same finite-stage fiber analysis for a fixed edgewise subdivision and retain the resulting C_p-equivariance. (kuhn04, §6, Definitions 6.1, Theorems 6.2 and 6.6, preprint pp.15–16; kuhn04 line 596; malkiewich17, §2.5, Proposition 2.22 and proof, preprint pp.14–15; malkiewich17 line 609; ns18, §IV.3, proof of Theorem IV.3.7, p.355; ns18 line 5988)

**Checks.**

- At Y=* the cosimplicial object is constantly S and its totalization comparison is the identity.
- For Y=S², the normalized fiber terms ΩⁿΣ∞Y^∧n and ΩⁿΣ∞Y^∧(n+1) have bottom degrees n and n+2. At n=1,2 these are (1,3) and (2,4), increasing in both terms.
- For the excluded input Y=S¹, the first bottom degree is n−n=0 for every n; no growing-connectivity conclusion follows. For a wedge of κ copies of S² the same lower degrees n,n+2 hold independently of κ.

*Needs:* RefinedTraceMethods §2.5 (cyclic realization and subdivision); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); GeneralizedCohomology G3.8 and StableHomotopyKTheory §7.9 (homotopy limits and Milnor comparison); StableHomotopyKTheory §7.9 (spectral Milnor sequence).


### 8.2 Tate commutation with a controlled totalization

Let Z_• be a tower of spectra with coherent finite G-action, and suppose the connectivity of fib(holim_mZ_m→Z_n) tends to +∞. Then (holim_nZ_n)_(hG)→holim_n(Z_n)_(hG) is an equivalence. Homotopy fixed points preserve this limit without a connectivity condition, hence (holim_nZ_n)^(tG)→holim_n(Z_n)^(tG) is an equivalence. Apply this to the partial totalizations of the edgewise-subdivided free-loop model from the preceding theorem. The connectivity hypothesis is essential to the orbit step. (ns18, §IV.3, proof of Theorem IV.3.7, p.355; ns18 line 5996)

This does not license commuting Tate with arbitrary homotopy limits.

One proof route is as follows. Homotopy orbits preserve the given connectivity bounds by their bar realization/connective t-structure compatibility. For a fixed degree, the maps from the limit to a sufficiently late stage induce stable isomorphisms, before and after homotopy orbits. Milnor’s sequence therefore identifies the orbit comparison as an equivalence. Homotopy fixed points are limits and commute with all limits. Take the cofiber of the natural norm comparison; finite limits and colimits agree in Sp. Finite partial totalizations commute with Tate by exactness, so the tower result yields the cosimplicial comparison. (ns18, §IV.3, proof of Theorem IV.3.7, p.355; ns18 line 5996)

**Checks.**

- For a constant tower with identity maps every comparison fiber is 0, so the orbit, fixed-point and Tate comparisons are identities.
- For a tower with fibers ΣⁿH𝔽_p in stage n, homotopy orbit fibers have no groups below n; at degree 0 they vanish for n≥1. This is the bound used before taking limits.
- For the S² free-loop tower the bottom degrees n and n+2 become (1,3),(2,4) at n=1,2; taking a fixed edgewise subdivision retains an increasing bound. The S¹ test gives the constant bound 0 and does not satisfy the hypothesis.

*Needs:* BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); StableHomotopyKTheory §7.9 (spectral Milnor sequence).

For the free-loop application, also use §8.1.


### 8.3 The free-loop Segal theorem for spherical group rings

For every based simply connected space Y, identify THH(S[ΩY])≃Σ∞_+LY by the imported cyclotomic equivalence. Its cyclotomic Frobenius φ_p:Σ∞_+LY→(Σ∞_+LY)^(tC_p) is a p-completion for every prime p. For the associated genuine cyclotomic suspension spectrum and every n≥1, the canonical comparison (Σ∞_+LY)^(C_(p^n))→(Σ∞_+LY)^(hC_(p^n)) is a p-adic equivalence. Genuine fixed points are meant on the left; the underlying naive action alone does not define them. (ns18, §IV.3, Proposition IV.3.2 and Corollary IV.3.3, pp.347–351; Theorem IV.3.7 and proof, pp.354–355; §II.4, Corollary II.4.9, p.265; ns18 line 5978)

No finite-type hypothesis on H*Y is added.

The first assertion concerns cyclotomic φ_p on Σ∞_+LY, not the unrelated raw tensor diagonal on that spectrum.

At Y=pt the result recovers the sphere Segal theorem.

One proof route is as follows. Import, rather than reconstruct, the cyclic/bar equivalence THH(S[ΩY])≃Σ∞_+LY and its genuine cyclotomic model. Use the controlled cosimplicial comparison to identify φ_p with the limit of Δ_p on the connective spectra Σ∞_+(Y^(n+1)). Each level is a p-completion by the generalized Segal theorem. Commute Tate through this totalization using the connectivity theorem, and commute p-completion with limits using its function-spectrum model. This proves the first assertion. For n=1 the genuine fixed-point pullback square identifies the comparison after completion. Iterate the imported restriction-pullback criterion through geometric fixed points; cyclotomic structure identifies all such inputs with the same bounded-below spectrum. (ns18, §IV.3, Proposition IV.3.2 and Corollary IV.3.3, pp.347–351; Theorem IV.3.7 and proof, pp.354–355; §II.4, Corollary II.4.9, p.265; ns18 line 5978)

**Checks.**

- At Y=* the Frobenius is S→S^(tC_p), with target π₀=ℤ_p; the genuine C_p-fixed sphere has π₀ of rank 2, illustrating why the last claim is a p-adic equivalence, not an integral equivalence.
- For Y=S² the tower fibers have bottom degrees n and n+2; for an uncountable wedge of S² they have the same bounds. Neither application imposes finite type.
- At n=1 the genuine comparison follows from one restriction pullback; at n=2 it uses two such steps. For n=0 both fixed-point constructions have trivial group and the comparison is the identity.

*Needs:* §3.4; §8.1; §8.2; RefinedTraceMethods §2.10 (THH of spherical group rings); RefinedTraceMethods §§2.6, 2.8 (THH Frobenius); RefinedTraceMethods §2.16 and KTheoryFiniteLocalFields §4.4 (genuine restriction pullback); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model).


### Examples

For Y=S² the normalized totalization fiber terms have bottom degrees n and n+2, giving (1,3) and (2,4) in the first two positive stages. The same bounds apply to any wedge of S². For Y=S¹ the first degree stays 0, so this convergence argument has no such hypothesis.


### Dependencies

RefinedTraceMethods §2.5 (cyclic realization and subdivision); StableHomotopyKTheory Layer 5 (smash, suspension, Eilenberg–MacLane and connectivity); GeneralizedCohomology G3.8 and StableHomotopyKTheory §7.9 (homotopy limits and Milnor comparison); StableHomotopyKTheory §7.9 (spectral Milnor sequence); BordismFormalGroups §F6.5 (finite-action norm, Tate and transfers); RefinedTraceMethods §2.10 (THH of spherical group rings); RefinedTraceMethods §§2.6, 2.8 (THH Frobenius); RefinedTraceMethods §2.16 and KTheoryFiniteLocalFields §4.4 (genuine restriction pullback); GeneralizedCohomology G3.9 (derived completion and its function-spectrum model). The individual Needs lines specify the earlier local targets and distinguish the general statement from its application.

## Downstream consumers

Trace and cyclotomic applications use the bounded-below Segal equivalence with its exactness and unit normalization, the all-degree Frobenius comparison and the free-loop cyclotomic theorem. Power-operation and arithmetic K-theory consumers use the total Steenrod components, the finite-field spherical Witt Frobenius and the localized KU Adams comparison. Roadmaps that construct spherical lifts of general perfect p-complete δ-rings import §4.8 for the finite-field case W(k) rather than constructing SW(k) again. The two counterexamples of Layer 7 and the sphere counterexample of the Layer 7 Examples accompany these interfaces: a consumer must retain the bounded-above condition of the fixpoint lemma, the bounded-below condition of the orbit lemma, and the bounded-below condition of generalized Segal. The maps on genuine fixed points in Layer 8 are p-adic equivalences; they are not asserted to be integral equivalences.

## Worked examples

The normalizations can be read together in three two-term calculations. At p=2, a degree-one projective class maps to u+u²s, with both terms in total degree 1; the same degree-one sphere transposition has sign −1 in Layers 1 and 5. At p=3, v−v³t² has total degree 2, and x−β(x)e has total degree 1, where e is the generator of Layer 1 normalized by βe=1; these distinguish the invariant even period 4 from the odd Bockstein shift. For KU on S², H=1+β and β²=0 give H^p=1+pβ, so Frobenius has Bott value pβ while the constant coefficient comparison has Bott value β. Each is evaluated in its actual coefficient or cohomology ring; the nilpotence β²=0 in KU⁰(S²) is not imposed on the periodic coefficient ring π_*KU.

## References

All locators use the editions specified below; source-id line locators refer to their numbered text extractions. Negative integer binomial coefficients, virtual Thom bundles and graded Laurent rings use the conventions above.

- **ns18** — Thomas Nikolaus and Peter Scholze, [On topological cyclic homology](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf). Acta Mathematica 221 (2018), 203–409; corrected publisher online PDF. I.2 Examples I.2.3 and Lemmas I.2.6–I.2.9, pp.219–224; II.4 Lemma II.4.1 and Corollary II.4.9, pp.260–265; III.1, pp.285–292; IV.1, pp.324–340; IV.3 Lemma IV.3.1, Proposition IV.3.2, Corollary IV.3.3 and Theorem IV.3.7 with proof, pp.345–355; ns18 line 4833.
- **ns19-correction** — Thomas Nikolaus and Peter Scholze, [Correction to On topological cyclic homology](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0222/0001/ACTA-2019-0222-0001-a002.pdf). Acta Mathematica 222 (2019), 215–218. pp.215–218; this typesetting correction does not change the coefficient conventions used above; ns19-correction line 18.
- **lnr12** — Sverre Lunøe-Nielsen and John Rognes, [The topological Singer construction](https://ems.press/content/serial-article-files/26162?nt=1). Documenta Mathematica 17 (2012), 861–909. 2.1 Proposition 2.2 and proof, pp.864–869; 2.2 Definition 2.3; 3.1 Definition 3.1 and augmentation formulas, Proposition 3.3 and Theorem 3.4, pp.875–877; 4.3 Tate tower and Corollary 4.11, pp.885–890; 4.4 Definition 4.12, Remark 4.13 and Propositions 4.14–4.16, pp.891–894; 4.5 Proposition 4.17, p.895; 5.1 Lemma 5.1 and Theorem 5.2, pp.896–898; 5.2 Proposition 5.7 and Theorem 5.9, pp.902–903; 5.3 Definition 5.10 through Theorem 5.13 and proof, pp.903–906; lnr12 line 641.
- **agm85** — J. F. Adams, J. H. Gunawardena and H. Miller, [The Segal conjecture for elementary abelian p-groups](https://math.mit.edu/~hrm/papers/adams-gunawardena-miller-segal-conjecture.pdf). Topology 24 (1985), 435–460. 1 Proposition 1.2 and Theorem 1.3, p.436; 2 Lemmas 2.1–2.2 and proof of Theorem 1.3, pp.438–441; only cyclic Singer input used; agm85 line 90.
- **bmms86** — Robert R. Bruner, J. Peter May, James E. McClure and Mark Steinberger, [H∞ ring spectra and their applications](https://www.math.uchicago.edu/~may/BOOKS/h_infty.pdf). Lecture Notes in Mathematics 1176 (1986); author-hosted two-page scan. VIII.1 Propositions 1.1–1.4, scan PDF pp.130–132; VIII.2 Propositions 2.1–2.4 and Adem proof, scan PDF pp.133–135; VIII.4 Theorem 4.1, Proposition 4.2 and Lemma 4.3, scan PDF pp.141–142; bmms86 line 4297.
- **milnor58** — John Milnor, [The Steenrod algebra and its dual](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Milnor-A.pdf). Annals of Mathematics 67 (1958), 150–171. 2–3, pp.153–156, Theorem 1; 5 Theorems 2–3 and triangular-pairing proof, pp.159–162; 8 Proposition 2, pp.169–170; Appendix 1, p.171; milnor58 line 406.
- **cartan55-I** — Henri Cartan, [Opérations cohomologiques, I](https://www.numdam.org/item/SHC_1954-1955__7_2_A3_0.pdf). Séminaire Henri Cartan 7, no.2 (1954–1955), exposé 14. Exposé 14 entire, pp.14-01–14-12; especially §§2–6; cartan55-I line 131.
- **cartan55-II** — Henri Cartan, [Opérations cohomologiques, II](https://www.numdam.org/item/SHC_1954-1955__7_2_A4_0.pdf). Séminaire Henri Cartan 7, no.2 (1954–1955), exposé 15. Exposé 15 entire, pp.15-01–15-10; especially §§3–5, Theorems 1–3; cartan55-II line 153.
- **cartan55-III** — Henri Cartan, [Opérations cohomologiques, III](https://www.numdam.org/item/SHC_1954-1955__7_2_A5_0.pdf). Séminaire Henri Cartan 7, no.2 (1954–1955), exposé 16. Exposé 16 entire, pp.16-01–16-14; especially §§2–4, Theorems 1 and 1 bis; cartan55-III line 114.
- **kuhn04** — Nicholas J. Kuhn, [The McCord model for the tensor product of a space and a commutative ring spectrum](https://arxiv.org/pdf/math/0202042v1). Progr. Math. 215 (2004), 213–236; preprint A model for a space tensored with a ring spectrum. 6 Definitions 6.1 and Theorems 6.2, 6.6 with proof, preprint pp.15–16; kuhn04 line 596.
- **malkiewich17** — Cary Malkiewich, [Cyclotomic structure in the topological Hochschild homology of DX](https://arxiv.org/pdf/1505.06778v4). Algebraic & Geometric Topology 17 (2017), 2307–2356; arXiv v4 (18 February 2017). 2.5 Proposition 2.22 and full proof, preprint pp.14–15; malkiewich17 line 609.
