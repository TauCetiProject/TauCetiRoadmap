# Roadmap: q-Hodge filtrations and Habiro cohomology

**Summary.** This roadmap constructs global q-de Rham cohomology, q-Hodge filtrations on
specified classes of algebras, and the resulting Habiro–Hodge descent. The
parameter q starts near 1, but a Habiro-complete object records all cyclotomic
neighborhoods. A chosen q-Hodge filtration supplies the compatibility needed to
pass from one neighborhood to all of them. Its reductions connect derived de
Rham forms, q-de Rham–Witt forms and local prismatic cohomology.

The endpoints are a symmetric monoidal Habiro–Hodge functor on algebras with a
chosen q-Hodge filtration, canonical sections on the stated smooth and
quasi-regular classes, finite-coefficient pairs on ℤ/m, and algebraic Habiro
cohomology of smooth schemes over a perfectly covered base with the required
small primes inverted. The chosen q-Hodge objects and their Habiro descent data
form an exported interface (§4.28) that trace-theoretic consumers import before
their comparisons. Comparison squares explain exactly
which classical theories are reached, after which coefficient changes. The
analytic Habiro comparison and two compatibility equalities with classical
A_inf specializations are additional mathematical problems, with their missing
interfaces stated below.

## Scope and ownership

The following ownership conventions keep the constructions reusable. Polynomial Jackson calculus, the initial differential q-Witt system, generic completion and regular-sequence Koszul acyclicity belong to the named suppliers below. Cyclotomic radical comparison and comaximal coefficient splitting belong to QWittVectors §6.2 and HabiroCyclotomicCompletions §5.2; this roadmap owns their enhanced closed-cover application. Split-torus character evaluation belongs to Tau Ceti; §1.23 adds its Laurent-algebra automorphisms over an arbitrary commutative ring and unit parameter.

| Supplier | Imported mathematics and use |
| --- | --- |
| QWittVectors §§2.1–2.4, 4.2–4.4, 5.1–5.2 and 6.1–6.3 | Arithmetic Λ-rings and perfect coverage; relative degree-zero q-Witt rings, ghosts, Frobenius, Verschiebung, Teichmüller maps and étale base change. |
| HabiroCyclotomicCompletions §§1.1, 4.1 and 5.2; QWittVectors §6.2 | Polynomial Jackson calculus, integral distinct-order cyclotomic intersections, comaximal product splitting and radical invariance of cyclotomic completion. Section 0.2 adds enhanced finite closed-cover descent. |
| This roadmap, Layer 0 | Specialize generic enhanced completion to the Habiro family; construct finite cyclotomic descent and the étale coefficient lifts. HabiroRings subsequently uses these cohomological contracts to compare its ordinary models. |
| QWittVectors §§7.1–7.7, 8.1–8.3, 9.6–9.7 and 10.1–10.2 | Positive-degree systems, initial q-Witt differential algebra, operators, ghosts, differential base change, complete framed calculus, smooth torsion and completion. This roadmap imports these and builds global q-de Rham, animation, Nygaard and Habiro applications. Polynomial Jackson calculus over arbitrary commutative rings and scalars is imported from HabiroCyclotomicCompletions §1.1. |
| DerivedModuleAlgebra §§0.4, 0.8–0.14, 1.1–1.4; DerivedDeRhamCohomology §§1.14–1.17, 1.22, 2.22–2.27, 3.2–3.6, 4.6 | Full cotangent complexes, derived powers and generic enhanced completion; filtered completion, derived de Rham, conjugate filtrations and the torsion boundary. |
| EnhancedDerivedSheaves E0, E1, E2 and E5 | Enhanced categories, affine/étale descent, animation, presentability and monoidal transport. The additional dual-cartesian/oplax interface is the declared gap below. E4 uses the completion of DerivedModuleAlgebra §§1.1–1.4. |
| AInfCohomology AI.1; DerivedModuleAlgebra §0.K.1 | Generic Koszul complexes, weak-regular-sequence acyclicity, Berthelot–Ogus décalage and its filtered and completion properties. |
| PrismaticCohomology Layers 0–2; PrismaticCohomologyPartII §§3.13–3.16, 5.2–5.11, 5.13–5.25; PerfectoidSpaces §P4.15.2 | δ-rings, bounded prisms and derived prismatic descent; relative Frobenius/Nygaard; local q-PD envelopes, framed, AΩ and uniqueness comparisons; perfect prisms and integral perfectoid rings. |
| AInfCohomology AI.3–AI.5, DerivedDeRhamCohomology §PD.6, CrystallineCohomology CR.2/CR.4 and CohomologyComparisons §§1.2, 1.4, 1.7–1.9 and 6.10 | AΩ, canonical perfectoid specializations, ordinary PD envelopes and the PD Poincaré lemma, ordinary de Rham–Witt/crystalline comparison and their normalization. |
| This roadmap, Layer 6 | The analytic comparison problem and its required input specification; it exports no analytic construction or algebraic prerequisite. |

The cohomological completion and étale comparison interfaces are constructed
in §§0.1–0.3, 4.21 and 4.28, before their trace applications. They allow
HabiroRings to compare an independently constructed ordinary relative ring
with the cohomological coefficient object. Ordinary ring presentations and
the rootwise Taylor calculus of HabiroCyclotomicCompletions are not direct
inputs to this construction; the relative q-Witt rings remain inputs from
QWittVectors §§4.2–4.4 and 5.1–5.2, including those suppliers' cyclotomic prerequisites.
HabiroRings Layer 6 and arithmetic Habiro consumers use the finite étale exports; their
arithmetic modules do not become prerequisites for this roadmap. No six-functor
formalism, diamond or Langlands construction is needed here. Local
q-crystalline theory is imported from PrismaticCohomologyPartII §§5.9–5.21; the global arithmetic gluing is the
new construction in HQ.1.

CohomologyComparisons §1.7 owns compatibility of the local AΩ/prismatic specializations. Sections 8.18–8.19 here instead compare those supplied maps with the composite β_S from the global arithmetic qΩ construction. HabiroRings §§0.1–0.6 own general ordinary marked étale deformations; §0.3 here constructs the enhanced cohomological coefficient lifts and their full cyclotomic descent.

The native algebraic starting point is Mathlib at
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`, with Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Reuse `Polynomial`, `PowerSeries`,
`MvPolynomial`, modules, linear maps, monoid algebras, finite projectivity,
ordinary categorical diagrams, Kähler differentials, étale and smooth
algebras, cyclotomic polynomials and degree-zero Witt vectors. In particular:

- `geom_sum_mul`, `geom_sum_succ` and `one_geom_sum` provide the q-integer
  identities. `Polynomial.cyclotomic_prime`,
  `Polynomial.cyclotomic_prime_mul_X_sub_one` and
  `Polynomial.eval_one_cyclotomic_prime` provide the prime cyclotomic formula
  and its specialization. Their prime hypothesis is `Fact p.Prime`.
- `Algebra.Etale` means formally étale and of finite presentation;
  `Algebra.Smooth` means formally smooth and of finite presentation.
  `KaehlerDifferential.D` and `KaehlerDifferential.linearMapEquivDerivation`
  supply the ordinary universal derivation and its universal property.
- `IsAdicComplete` is ordinary completeness and separatedness of modules.
  Its presence does not supply the enhanced derived completion used below.
  Ordinary `DerivedCategory` does not supply the coherent totalizations,
  homotopy fixed points and filtered enhanced categories required here.
- `DividedPowerAlgebra.dp_mul` supplies the integral divided-power
  multiplication relation used in the p=2 test of §1.3. This native algebra
  does not supply the universal completed PD/q-PD envelopes below.
- Cyclotomic association and `WittVector.fontaineTheta_teichmuller` support
  the native coefficient calculations in HQ.8. Their presence does not
  construct AΩ, a prismatic site or its comparison maps.

HQ.4 precedes HQ.3 in construction order: its twisted q-Witt and Nygaard
objects are inputs to the chosen-filtration descent, while its framed
constructions do not use that descent.

Tau Ceti at the pin supplies general split-torus character evaluation in
`TauCeti/LinearAlgebra/Basis/DiagonalTorus/Basic.lean`:
`TauCeti.torusCharacter`, `torusCharacter_add`, `torusCharacter_neg` and
`torusCharacter_zsmul`. For the point with coordinates `q^{a_i}`, its value
on m is `q^{Σ_i a_i m_i}`; no new character-evaluation theory is proposed.
The torus application below instead constructs the associated algebra
automorphisms and their coherent module descent. AlgebraicVectorBundles
Layers L0B and L2B own ordinary finite locally free sheaves and their
geometric total spaces; the lattice application uses that dictionary and
adds its specified semilinear equivariance.

## Conventions

Write h=q−1, f_m=q^m−1 for m≥1, and `[r]_q=Σ_{j=0}^{r−1}q^j` for r≥0. The empty geometric sum is zero. The case m=0 is not a cyclotomic reduction. Unless a smaller condition is
stated, HQ.1–HQ.2 assume a Λ-base A torsion-free at every prime; HQ.3 onward
assume A perfectly covered. Only the base carries Adams operations. Smooth
algebras over it need not carry a compatible Λ-structure. A fixed-prime
construction uses the p-completed base Â_p and p-completed input, with all
complexes implicitly p-completed when specified locally.

All categorical limits, colimits, quotients and tensors in the cohomological
constructions are derived and enhanced. A quotient M/f is a cofiber, not its
ordinary degreewise quotient. Completed tensors include the displayed
completion ideal. Rationalizing and then p-completing kills rational objects;
p-completing and then inverting p has a different value. Infinite prime
products cannot be interchanged with rationalization without the stated
uniform denominator estimate.

Filtrations descend: `F^{i+1}→F^i`. In filtered quotients f_m has filtration
degree one, so `(F/f_m)^i=cofib(f_m:F^{i−1}→F^i)`. Ascending conjugate and q-Witt
filtrations have the opposite direction. We use cohomological degrees for
complexes and homological degrees for cotangent Tor-amplitude. An underived
form module Ω^i in cohomological degree i is written Ω^i[−i]; a derived form and
its already shifted graded piece are distinguished explicitly.

The global smooth object is qΩ, its polynomial animation is qdR, its chosen
filtration modification is qHdg, and its Habiro descent is H(R,F), also called
the Habiro–Hodge object. These names distinguish constructions rather than
claiming that they coincide. Smooth qΩ is the filtration completion of qdR
only when a suitable q-Hodge filtration is chosen. The modification colimit
precedes h-completion; the Habiro limit is taken along coherent factorial
transitions. Ordinary framed q-connections, modified torus connections and
homotopy-coherent derived equivariance are distinct notions.

In graded presentations β has degree one and t degree
−1 (§2.2). A consumer that works with even homotopy, such as `π_{2∗}` of TC⁻
over ku, places β in homotopical degree two; no statement below changes.

A reference to a derived category below means its stable enhancement, with
coherent functors, mapping spaces and homotopy limits. Completeness is derived
completeness in that enhancement. The only ordinary preimage filtration is the
explicit static construction of Layer 5; its staticity and saturation
hypotheses are part of its domain.

## Exact supplier contracts

### From Mathlib

Use the native algebraic interfaces listed in Scope and ownership. `AddMonoidAlgebra.lift` in `Mathlib/Algebra/MonoidAlgebra/Basic.lean` makes the Laurent coefficient character into a B-algebra homomorphism; no domain or nonzero-ring hypothesis is needed. `Polynomial.cyclotomic_prime` in `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean` gives the geometric-sum formula with `[Fact p.Prime]`; `Polynomial.eval_one_cyclotomic_prime` in `Mathlib/RingTheory/Polynomial/Cyclotomic/Eval.lean` gives its value p at one. `Algebra.Etale` and `Algebra.Smooth` in `Mathlib/RingTheory/Etale/Basic.lean` and `Mathlib/RingTheory/Smooth/Basic.lean` include finite presentation. `IsAdicComplete` in `Mathlib/RingTheory/AdicCompletion/Basic.lean` includes ordinary separatedness and completeness, with no enhanced derived-completion data.

### From Tau Ceti

Use `TauCeti.torusCharacter` and its addition, negation and integer-scaling laws in `TauCeti/LinearAlgebra/Basis/DiagonalTorus/Basic.lean`, as specified in Scope and ownership. These evaluate a unit-valued character of a finite lattice; the Laurent-algebra action and its coherent module descent are the distinct constructions of §§1.23–1.28.

### From TauCetiRoadmap: algebraic and cohomological interfaces

From **QWittVectors §§2.1–2.4**, import arithmetic Λ-rings, the perfection of arithmetic Λ-rings and the perfect-coverage predicate; use the arithmetic Λ-structure on the base, its
commuting Adams operations and the faithfully flat perfect covers of the stated
perfectly covered classes. QWittVectors §§5.1–5.2 and 6.1–6.3, through QWittVectors §§2.1–2.4 and the δ-ring/étale lifting
interface of PerfectoidQuotients §0.0, supply the unique completed Frobenius lifts on étale
algebras. No global Λ-structure on an arbitrary smooth or étale algebra is
assumed.

From **QWittVectors §§4.2–4.4 and 5.1–5.2**, import relative FV-systems, relative q-Witt rings, relative ghosts, étale base change and étale ghost pushouts; use the actual relative rings qW_m(R/A). They are the initial
relative q-FV-system of QW Lemma 2.41 and Definition 2.42 (§2.5, p.30),
constructed from `qW_m(R)⊗_{qW_m(A)}A[q]/(q^m−1)` by the Verschiebung
coefficient-balancing ideal. For d|m the ghost target is exactly
`R⊗_{A,ψ^d}A[q]/Φ_d(q)`, with the cyclotomic quotient and coefficient twist
(QW Paragraph 2.44, §2.5, p.31). QWittVectors §§5.1–5.2 supply the étale theorem and the
derived ghost pushouts of QW Proposition 2.48 and Corollary 2.51 (§2.6,
pp.33–34). Neither an arbitrary family of rings with FV relations nor a product
of rational ghost rings replaces this input. The coefficient lifts, finite
complete descent and Habiro-complete tensor used below are constructed in
Layer 0 from these inputs and DerivedModuleAlgebra §§1.1–1.4, not imported from a later Habiro package.

From **QWittVectors §§6.1–6.3**, import the completed étale Frobenius equivalence of §6.1, the q-fixed cyclotomic completion equivalence of §6.2 and completed ghost compatibility of §6.3. Their completed linearizations are equivalences for étale algebras over perfectly covered bases; they fix q on cyclotomic overlaps and carry the displayed Adams coefficient twists. These are the inputs to §0.3.

From **QWittVectors §§7.1–7.7**, import differential V-systems, differential FV-systems, the prime Verschiebung differential relation, the initial differential q-Witt algebra, differential Frobenius, differential ghosts and differential base change. In §7.1 the structure maps s_m:qW_m(R/A)→P_m⁰ satisfy s_m V_(m/d)=V_(m/d) s_d, V_1=id and composition. An arbitrary P_m⁰ need not be qW_m(R/A); that identification belongs to §7.2's initial object. The DGAs are nonnegative, graded commutative and strictly odd alternating, including at 2. Thus the zero family is allowed, but the family P_m=ℚ[q]/f_m with d=0 and V_n=0 for n>1 is excluded by the degree-zero square: V₂(1)=1+q is nonzero at level 2 (QW Definition 3.1(b), p.37).

From **QWittVectors §7.7**, import the unique étale differential extension and étale descent of differential q-Witt forms. The differential on qW_m(R′/A)⊗_(qW_m(R/A))qW_mΩ for étale R→R′ is the unique extension. Its generic input requires central degree zero, graded commutativity and strict odd alternation. The associative DGA with P⁰=ℤ[q,x], P¹=P⁰u, u²=d=0 and ub=b(q,0)u is excluded: localization at x leaves a nonzero left-module generator u, whereas compatible multiplication would force u=(ux)x⁻¹=0. These underived differential base changes use ordinary degreewise tensor (QW Lemma 3.32, p.51).

From **QWittVectors §§8.1–8.3**, import coordinate-scaling automorphisms, framed Jackson derivatives and the framed difference complex on any finite étale frame over a commutative base, with the h-completion and coordinate regularity needed to divide by hT_i. The p-completely étale local framing and q-PD-envelope comparison instead use PrismaticCohomologyPartII §§5.2–5.11, 5.13–5.21 as specified in §1.1. The empty frame is S[[h]]; D_q(x²)=(1+q)x and D_1(x²)=0 in characteristic 2. The global/framed equivalence is the target of §1.14; §1.2 records the imported polynomial calculus.

From **QWittVectors §§9.6–9.7 and 10.1–10.2**, import prime-power smooth induction, the smooth de Rham comparison, the p-local differential decomposition, integer torsion-freeness of smooth q-Witt forms and bounded difference-parameter torsion, including degreewise completion of smooth forms. The smooth hypotheses require perfectly covered A, arbitrary smooth R/A, every positive index and every prime, including 2. For m=pᵃn, p∤n, the underived p-local product is over d|n with scalar ring C_a=A[q]/(q^(pᵃ)−1) and scalar map a↦ψ_d(a), q↦qᵈ into A_(p)[q]/Φ_d(q^(pᵃ)). Tensor is ordinary degreewise over C_a; perfect coverage makes these maps flat and identifies it with derived tensor over C_a. It is never derived tensor over A[q]. The smooth p-completed comparison instead uses Ω*_(R/A)⊗ᴸ_(A,ψ_(pᵃd))A[q]/Φ_d(q^(pᵃ)) (QW Lemma 4.36 and Proposition 4.2, pp.74–75 and p.54). The framed cohomology comparison is §9.6; integer torsion-freeness and bounded h-power torsion justify its degreewise completion.

From **DerivedModuleAlgebra §0.K.1**, import vanishing of positive Koszul homology of a finite weakly regular sequence. Apply the weak-regularity component of Mathlib `RingTheory.Sequence.IsRegular` in perfect-regular presentations; this package owns no second regular-to-Koszul-regular theorem.

From **PrismaticCohomologyPartII §§5.2–5.11, 5.13–5.21**, **DerivedDeRhamCohomology §PD.6** and **CrystallineCohomology CR.2**, use
δ-rings, the local q-PD pair and universal envelopes. In the rational envelope
argument fix p and a p-completely smooth S/Â_p, choose a surjection P↠S
from a p-completely ind-smooth δ-Â_p-algebra, and put J=ker(P↠S). The inputs
are D=D_P(J)^∧_p and qD, the universal (p,h)-complete q-PD envelope of
(P[[h]],(J,h)), with δ(q)=0. Their maps are induced by the same presentation,
and qD/h≃D is the canonical envelope base-change map. Include the envelope
universal properties, complete flatness and p-torsion-freeness used in the
convergence estimates; γ and γ_q are the associated actual operations.
Rational h-completion has q↦1+h. This is the construction of QH Lemma A.4
(§A.1, p.70), using BS Lemma 16.10 (§16.1, pp.110–111). Its envelope flatness theorem uses completely regular generators relative to the base in the local presentations; four independently
chosen rings do not satisfy this contract. From **PrismaticCohomologyPartII §§3.13–3.16**, use actual relative
prismatic Frobenius and its Nygaard-divisibility/descent functors.

From **PrismaticCohomology §§1.4–1.10, 2.1–2.4 and 2.17**, use prismatic cohomology for a bounded prism and its
derived (p,I)-complete animation, conjugate filtration and quasisyntomic
descent on the stated bounded-torsion, cotangent-amplitude domains. Source
colimits are p-completed and target colimits (p,I)-completed.
From **PerfectoidSpaces §P4.15.2**, use the perfect-prism/integral-perfectoid equivalence and a distinguished generator ξ of the oriented kernel; PerfectoidQuotients imports this in its “From PerfectoidSpaces: derived and prism interfaces” contract. Here the explicit Nygaard calculation
requires δ(ξ) to be a unit and uses its canonical q-divided-power monomials.

From **DerivedModuleAlgebra §§0.4, 0.8–0.14 and 1.1–1.4**, use the full cotangent complex, derived exterior powers, generic module completion reflector and quotient towers. EnhancedDerivedSheaves §§0.1–0.3 and E5:animation provide coherent diagrams and animated rings. From **DerivedDeRhamCohomology §§1.14–1.17, 1.22 and 2.22–2.27**, use filtered completion/tensor, valid exchanges of derived operations, and derived de Rham with its Hodge filtration and completed base changes; §§3.2–3.6 supply conjugate filtrations, §§5.1–5.7 quasisyntomic descent, and §4.6 the torsion boundary. The arithmetic-square arrows are the natural maps of these constructions, including Adams twists. Finite-projective extension uses dualizability to exchange the entire enhanced limit and completion diagrams; ordinary flatness alone does not supply this exchange.
From **AInfCohomology AI.1**, use the actual Koszul and Lη constructions with the
stated regularity, filtration and completion properties.

In particular, **DerivedDeRhamCohomology §4.6** retains the torsion boundary for derived de Rham
cohomology of 𝔽_p over ℤ_p. Its derived p-completed two-term divided-power
model differs from crystalline cohomology over (ℤ_p,(p)) with its specified
divided powers (Bhatt, Proposition 8.5 and Corollary 8.6, §8, p.32).

From **EnhancedDerivedSheaves E0/E1/E2/E5**, use stable coherent diagrams,
module-category enhancements, sheaves on an affine basis, extension from that
basis and their enhanced limits; E5 supplies animation, presentability and
monoidal transport. The affine module identifications and descent
transformations must be natural and compatible with coefficient extension.
For the infinite discrete lattice in Layer 1, construct its action-groupoid
prestacks, flat sheafification and the QCoh right Kan extension here, using
E0 coherent limits and E1 affine modules and flat descent. Identify
`Mod_{HC}` with the enhanced D(C) for the Eilenberg–Mac Lane ring HC. QCoh
takes the groupoid realization to its totalization and is invariant under
flat sheafification.
This supplies the specific lattice application of DAG VIII Proposition 2.7.6,
Definition 2.7.8 (p.71) and Proposition 2.7.14 (§2.7, p.72), including the
pointwise t-structure and affine-local perfectness. A finite-group-only
fixed-point interface is insufficient. General parameter-stack theory is not
an input to this construction.

From **AI.3–AI.5, CR.2/CR.4 and CohomologyComparisons §§1.2, 1.4, 1.7–1.9 and 6.10**, use the specified
AΩ, Fontaine θ and Witt maps, PD Poincaré/de Rham–crystalline equivalences,
and their normalization. Layer 6 is a research problem requiring an analytic coefficient ring, an analytic Habiro stack and a solid coefficient category; it has no imported analytic construction or comparison theorem.

Import the distinct-order integral cyclotomic intersection classification from HabiroCyclotomicCompletions §4.1: for distinct positive a,b, the quotient ℤ[q]/(Φ_a,Φ_b) is zero unless the orders have prime-power ratio pᵏ with k≥1, when it is 𝔽_p[q]/Φ_min(a,b). Equal orders retain their integral quotient.

From **QWittVectors §6.2**, use equality of the radicals of (p,Φ_d) and (p,Φ_(pd)) and the resulting equality of derived completion functors for every commutative coefficient ring. From **HabiroCyclotomicCompletions §5.2**, use comaximal cyclotomic product decomposition, with component maps the restrictions. Together with its §4.1 integral ideal classification these supply the coefficient topology in §0.2; that section constructs the enhanced category descent.

The following are required extensions, not assertions that the base roadmaps already state these interfaces. Their Part II ownership preserves the earlier suppliers; the affected targets below are conditional on these contracts.

What CrystallineCohomology must provide (gap:relative-witt-factorization): For every Λ-ring A that is a ℤ_(p)-algebra and every A-algebra R, prove that the absolute restriction-free FV map W_(a+1)Ω_(R/ℤ_(p))→qW_(pᵃ)Ω_(R/A), for all a≥0, kills the differentials of the image of W_(a+1)(A), hence factors through the relative ordinary complex, compatibly with Frobenius and Verschiebung. Required extension: Part II: relative restriction-free de Rham–Witt, extending CR.4.

What PrismaticCohomologyPartII must provide (gap:finite-projective-nygaard): For a finite-projective Λ-map A→B of perfectly covered bases, supply coherent completed scalar-extension equivalences for the actual relative Frobenius and Nygaard filtration of every twisted smooth q-de Rham input of §§3.15 and 3.22, natural in smooth algebras and compatible with divisor maps, products, identity and composition. Required extension: finite-projective Frobenius/Nygaard transport beyond PrismaticCohomologyPartII §§3.13–3.16, owned by a further Part II extension of that roadmap.

What AInfCohomology must provide (gap:finite-projective-filtered-decalage): For the finite-projective Λ-base changes and twisted q-de Rham inputs of §4.26, supply natural scalar-extension equivalences for Lη and its entire décalage filtration, with the displayed regular parameters, completed tensors, coefficient twists and coherence under identity, composition and tensor products. Required extension: Part II: finite-projective filtered décalage transport, extending AI.1.

What EnhancedDerivedSheaves must provide (gap:unbounded-derived-commutative): For every commutative coefficient ring B, construct the unbounded derived commutative category DAlg_B and a conservative forgetful functor to CAlg(D(B)) creating limits and colimits, naturally under coefficient extension, with the static-ring and cosimplicial-envelope realizations used in §1.18; this is distinct from connective animated rings. Required extension: Part II: unbounded derived commutative algebras, extending E5:animation.4.

What EnhancedDerivedSheaves must provide (gap:filtered-graded-derived-commutative): Supply filtered and graded refinements of the unbounded DAlg_B contract, compatible with Day tensor, associated graded, Rees modules, localization, degree-one filtered quotients, completion, animation and enhanced descent as used in §§3.18, 3.30, 4.23 and 5.22, with conservative forgetful comparisons preserving the required diagrams. Required extension: Part II: filtered and graded derived commutative algebras, extending E5:abstract and E5:animation.4.

What EnhancedDerivedSheaves must provide (gap:fully-faithful-pushout): For every pushout C⊔_A B in Cat∞ with A→B fully faithful, prove C→C⊔_A B fully faithful, with the mapping-space comparison natural in the pushout diagram; generic existence of coherent pushouts or stable pushouts does not supply this theorem. Required extension: Part II: fully faithful pushouts in Cat∞, extending E0.4–E0.5.

What EnhancedDerivedSheaves must provide (gap:oplax-dual-fibration): For each symmetric monoidal ∞-category C⊗→N(Fin_*), construct its dual cartesian fibration over N(Fin_*)ᵒᵖ, give the cocartesian-leg span description of its morphisms, and identify oplax symmetric monoidal functors with inert-preserving functors of the dual fibrations. Identify strong monoidality with preservation of all cartesian edges, coherently under identity and composition. Required extension: Part II: dual fibrations and oplax monoidal functors, extending E5:abstract.1–E5:abstract.3. The unit comparison is F(1)→1; the lax unit comparison 1→F(1) has the opposite direction (QH Paragraph 4.14, p.59, QH lines 2689–2701).

The unbounded derived-commutative requirements are the extra input used in QH Paragraph A.13, p.76, and §3.8, p.50; EnhancedDerivedSheaves E5:animation.4 only compares connective animated rings with E∞-objects. The categorical pushout requirement is the additional theorem invoked in QH Lemma 4.9, pp.56–57.

## How to read the build

Layer 0 constructs the cohomological coefficient and completion interfaces.
Layer 1 constructs global qΩ and its framed and torus applications. Layer 2
sets the stable filtered conventions and animates qΩ. Layer 3 (HQ.4) imports positive-degree q-Witt theory and constructs
its twisted, animated and Nygaard applications before Layer 4 (HQ.3) uses it to
descend chosen q-Hodge pairs; its last subsection (§4.28) collects the exported
interface. Layer 5 gives the canonical algebraic sections and the
finite-coefficient pairs (§5.26). Layer 6 poses the analytic
problem, Layer 7 works the basic examples, and Layer 8 assembles the comparison
squares. The HQ labels identify these mathematical families across the build. Subsection labels are stable locators; the text orders estimates before their rational comparison, animation before its deformation theorem, both Nygaard constructions before their comparison, the ascending q-Witt filtration before strong monoidality, and smooth completion before the étale identification.

## Layer 0: Habiro completion and étale coefficients

Construct the specialized cohomological infrastructure here, using DerivedModuleAlgebra §§1.1–1.4's
generic enhanced completion and QWittVectors §§2.1–2.4, 4.2–4.4 and 5.1–5.2's arithmetic and degree-zero theory.
The construction is on the actual enhanced D(A[q]); it does not assume an
ordinary Habiro-ring presentation or Taylor expansion theorem.

### 0.1 Habiro-complete modules and their completed tensor

For any commutative ring A, put B=A[q], let S be the multiplicative set generated
by f_m=q^m−1 for all m≥1, and let C=fib(B→S⁻¹B) in D(B). Define the
Habiro-complete subcategory by RHom_B(S⁻¹B,M)=0 and its reflection by
L_H(M)=RHom_B(C,M), with unit induced by C→B. Prove the natural formulas
`L_H(M)≃lim_{m, divisibility}` `M^∧_{f_m}≃lim_N` M/P_N, where
`P_N=∏_{j=1}^N` f_j and every quotient is derived. Use the countable localization
telescope and DerivedModuleAlgebra §§1.1–1.4's principal completion to prove the reflection and these
formulas; no weak-proregularity assumption or ordinary quotient replacement is
needed. Positive factorial indices are cofinal in the divisibility diagram.

Construct the symmetric monoidal structure
M⊗̂_H N=L_H(M⊗^L_B N), with unit L_H(B), its associativity and unit
coherences, and L_H(L_H(M)⊗^L_B L_H(N))≃L_H(M⊗^L_B N).
This is the full subcategory of Habiro-complete B-modules, not the unrestricted
module category of the ordinary ring π₀L_H(B). Prove cyclotomic
conservativity: a Habiro-complete M is zero if M/Φ_d(q)=0 for every d≥1;
consequently the same reductions detect equivalences between complete objects.
Also prove the degreewise detection used for staticity: if a fixed cohomology
degree of every M/Φ_d is zero, the same degree of M is zero.

(See QH Paragraph B.1 and Lemma B.2, §B, pp.77–78; Lemma B.3 and Corollary B.4,
§B, p.78; Remark B.5, §B, pp.78–79.)

This uses DerivedModuleAlgebra §§1.1–1.4, EnhancedDerivedSheaves E0 and E5:presentability.

Use the following maps and laws:

- L_H and its natural unit, initial among maps to Habiro-complete objects; the counit on a complete object and multiplication L_H L_H→L_H are equivalences.
- The two natural limit equivalences above, compatible with their projection maps and with restriction to factorials.
- The completed tensor and its symmetric monoidal coherences; its f_m-completion is the f_m-completed derived tensor of the corresponding completions.
- Cyclotomic reductions detect zero objects, equivalences and the stated vanishing of each cohomology degree, within the complete subcategory.

**Checks.**

- For M=0 the reflection and all tower terms are zero. For M=B, the reflected object is the tensor unit, not B itself asserted to be complete; for A=ℤ its h-completion is ℤ⟦h⟧.
- For B=ℤ[q] and M=B/(q−1) in degree zero, multiplication by every f_m is zero. The object is already Habiro-complete, so the derived tower returns M. Its derived quotient by h has M in degrees −1 and 0; replacing the tower by ordinary quotients loses this test of derived reduction.
- For A=ℚ, the nonzero module ℚ(q) has every cyclotomic reduction zero and L_H(ℚ(q))=0. It fails the completeness hypothesis and cannot contradict or extend conservativity to all modules.
- For M=N=L_H(B), the completed tensor is L_H(B). In contrast, there is no assertion that the ordinary uncompleted tensor of two complete modules is complete. A unit-ideal completion is zero; the zero polynomial f_0 is excluded throughout.

### 0.2 Finite cyclotomic complete descent

For a commutative A and m≥1, construct the finite descent equivalence for
`f_m=∏_{d|m}Φ_d(q)`. On the poset of nonempty subsets U of the divisors of m,
use DerivedModuleAlgebra §§1.1–1.4's category of modules complete along the closed intersection
defined by (Φ_d(q):d∈U); restriction is the corresponding derived completion.
The full diagram is in presentable stable symmetric monoidal categories and
colimit-preserving completed scalar-extension functors. Prove that its limit
recovers the f_m-complete category, and the corresponding equivalence on
E∞-algebras. This is finite closed-cover descent: prove the tensor-compatible
reflector hypotheses, not descent for an arbitrary collection of categories.

Reduce this diagram by right Kan extension to singleton terms and p-primary
chains {d,pd,…,p^a d}, with p prime and p∤d. Thus E_d is Φ_d-complete and
adjacent terms have equivalences `(E_{pd})^∧_p≃(E_d)^∧_p` over their common
(p,Φ_d)-complete base. Reconstruct E by the homotopy limit of the intersection
diagram. Keep the coherent comparison transformations on overlaps, including
paths and higher homotopies in mapping spaces. A list of abstract prime-edge
isomorphisms with an ordinary equalizer on morphisms is insufficient.
The same proof gives derived commutative descent conditional on `gap:unbounded-derived-commutative` and its filtered/graded refinement when used. For n|m, restriction of the closed cover is f_n-completion;
these restrictions commute on every divisor chain with their coherences.
Construct naturality for coefficient maps through completed scalar extension.
In particular, a semilinear map preserving q and the completion ideals induces
the same map whether applied to the full intersection diagram or to its
reconstruction; this is the functoriality used for coordinate scaling in §3.31.

(See QH Setup 2.1 and Lemma 2.2, §2.1, pp.13–14; Remark 2.3 and
Corollary 2.4, §2.1, pp.14–15; Remarks 2.5–2.6, §2.1, p.15.
The integral overlap calculation is imported from HabiroCyclotomicCompletions §4.1 (QW Lemma 2.1, §2.1, pp.8–9). The common-completion identifications use QWittVectors §6.2; the prime-to-p coefficient product splitting uses HabiroCyclotomicCompletions §5.2.)

*Needs:* §0.1, DerivedModuleAlgebra §§1.1–1.4, EnhancedDerivedSheaves E0 and E5:presentability, Mathlib `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`, QWittVectors §6.2 the radical comparison for cyclotomic completion ideals, HabiroCyclotomicCompletions §4.1 for integral intersections, and HabiroCyclotomicCompletions §5.2 for comaximal coefficient product splitting.

Use the following maps and laws:

- The inverse equivalence, as an enhanced finite homotopy limit, with Φ_d-completion naturally E_d.
- The equivalence of mapping spaces with the limit of the intersection mapping-space diagram; it retains all comparison homotopies.
- For m=p^a n with (p,n)=1, the p-completion is `∏_{d|n}(E_{p^i d})^∧_p` for any 0≤i≤a. After inverting m and then f_m-completing, the reconstruction is the product of the correspondingly completed singleton terms.
- Restricting to divisors of n|m computes f_n-completion, with identity, composition and higher compatibility laws.
- Completed coefficient extension and semilinear maps preserving the completion ideals commute with reconstruction and its projections.

**Checks.**

- For m=1 there is one singleton and no overlap: reconstruction is exactly h-completion. The zero algebra reconstructs to zero for every m, including m=2.
- For A=ℚ and m=2, Φ₁=q−1 and Φ₂=q+1 are comaximal, so reconstruction of the coefficient pieces is ℚ⟦q−1⟧×ℚ⟦q+1⟧. Over ℤ they meet at (2,q−1): the pair of constant values (1,0) disagrees modulo 2 and cannot come from a global section. In characteristic 2, q−1=q+1; the two singleton terms have the same completed support and must be glued, rather than treated as two independent factors.
- For the distinct orders (3,12), the imported pair quotient is 𝔽₂[q]/(q²+q+1): q²=q+1 and 2q=0. For (1,6), Φ₆−qΦ₁=1, so the quotient is zero. Equal orders (3,3) give ℤ[q]/Φ₃ instead; the distinct-order hypothesis cannot be omitted.
- For m=6 the restrictions to 1 through 2 and through 3 agree with direct restriction; the unit maps to 1 on both paths. A comparison carrying 1 to −1 fails already over ℤ, before passing to a discrete approximation of the coherent diagram.
- The arithmetic formula for m=12, p=2 uses the divisors 1,3 of n=3 and any one of the levels i=0,1,2; it does not multiply three copies along the same 2-primary chain. No empty m=0 divisor cover is allowed.

### 0.3 Étale coefficient lifts and Frobenius descent

Let A be a perfectly covered Λ-ring and R an étale A-algebra. For each m≥1,
construct E_m(R/A) as the unique f_m-complete formally étale lift of
qW_m(R/A) over B/f_m, with its specified reduction marking. Formal étaleness
here is in the complete category: the reductions through B/f_m^r are étale,
without an assertion of ordinary finite presentation after completion.
Use formal étale invariance through these powers and DerivedModuleAlgebra §§1.1–1.4's derived inverse
limit. Prove that reduction gives an equivalence between f_m-complete
E∞-B-algebras with étale reduction and étale B/f_m-algebras; in particular,
complete formal étaleness follows from the étale reduction. Here
qW_m(R/A) is étale over B/f_m by QWittVectors §§5.1–5.2 and 6.1–6.3. Define E(R/A)=lim_k `E_{k!}(R/A)`. Prove staticity of
each lift and the limit using their cyclotomic reductions and §0.1's
degreewise detection, rather than assuming that inverse limits of static
rings have no derived-limit contribution.

Construct the equivalent description using §0.2. Its d-th singleton is
`(R⊗_{A,ψ^d}A)[q]^∧_{Φ_d}`; the p-primary overlap maps are induced by the
linearized completed Frobenius
`(R̂_p⊗_{A,ψ^p}A)^∧_p≃R̂_p`. These are equivalences because R/A is étale.
No global Frobenius on R is required. The ghost pushouts identify the reduction
E_m/f_m with qW_m(R/A). For n|m, lift the actual q-Witt Frobenius
`F_{m/n}:qW_m(R/A)→qW_n(R/A)`, with the appropriate coefficient quotient,
to E_m→E_n. Uniqueness in the marked formally étale deformation category
supplies composition and proves `(E_m)^∧_{f_n}≃E_n`. This gives both a coherent
divisibility diagram and its factorial limit. The identity branch is
E_1=R⟦h⟧, and E→E_1 is its canonical h-completion map.

(See QH Paragraph 2.7, §2.2, pp.15–16; Theorem 2.9 and Remark 2.10,
§2.2, pp.16–17; QW Proposition 2.48 and Corollary 2.51, §2.6, pp.33–34;
Corollary 2.52, §2.6, p.35, for the Frobenius-extension boundary.)

This uses §§0.1–0.2, QWittVectors §§2.1–2.4, 4.2–4.4, 5.1–5.2 and 6.1–6.3, PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71, DerivedModuleAlgebra §§1.1–1.4 and EnhancedDerivedSheaves E0.

Use the following maps and laws:

- E_m with its marked derived reduction qW_m(R/A), functorial on étale A-algebras.
- The space of marked formally étale complete lifts, and of compatible maps lifting a fixed map, is contractible.
- The Φ_d-completion and its actual linearized Frobenius overlap equivalences, compatible with the marked relative ghost maps.
- E_m→E_n for n|m, reducing to `F_{m/n}`, with the stated completion, identity and coherent composition laws.
- The static Habiro-complete E(R/A), its partial completions, and its canonical h-completion E→R⟦h⟧.

**Checks.**

- For R=A, `E_m=A[q]^∧_{f_m}` and E is the coefficient unit L_H(A[q]); the marked reduction is A[q]/f_m. At m=1 one obtains A⟦h⟧, including for the zero base.
- For R=A×A with the diagonal étale map, every E_m and E splits into two copies of the coefficient object; the two projections preserve both the reduction markings and the h-completion maps.
- For A=ℤ and R=ℤ[∛2,1/6], the map R→R̂_5 is injective and the completed Frobenius at 5 does not restrict to R. QW Corollary 2.52 therefore excludes replacing qW_5(R/ℤ) by R[q]/f_5, and excludes `E_5≃R[q]^∧_{f_5}` with that reduction. The construction uses completed Frobenius, not a nonexistent global Adams operation on R.
- Over ℚ at m=1, qW_1(ℚ/ℚ)=ℚ has no h-direction, whereas E_1=ℚ⟦h⟧ contains h≠0. The completed lift cannot be replaced by its first q-Witt reduction. If étaleness is dropped, the h-complete flat algebras ℚ⟦h⟧[y]/(y²) and ℚ⟦h⟧[y]/(y²−h) both reduce to ℚ[y]/(y²), but the first has a nonzero nilpotent and the second is a domain. They are not equivalent lifts.

### Examples

The two cyclotomic neighborhoods at m=2 separate over ℚ and meet over 𝔽₂.
For the identity étale algebra, all coefficient lifts are the ordinary
principal completions of A[q]; for a general étale algebra the completed
Frobenius changes their gluing. Both computations precede q-Hodge filtrations.

### Dependencies

QWittVectors §§2.1–2.4, 4.2–4.4 and 5.1–5.2; DerivedModuleAlgebra §§1.1–1.4; EnhancedDerivedSheaves
E0 and E5:presentability; PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71. The specialized completion,
descent and coefficient targets of this layer are owned here.

## Layer 1: Global q-de Rham and framed connections (HQ.1)

Construct the global object from local q-crystalline and rational de Rham inputs. Then derive its sheaf descent, and distinguish framed connections from lattice-equivariant torus modules.

### 1.1 Imported local theory and common framed calculus

Import local q-PD and q-crystalline theory from PrismaticCohomologyPartII §§5.2–5.11, 5.13 and 5.19–5.21. If p is prime, A is a p-torsion-free Λ-ring and S is p-completely smooth over Â_p, `qΩ_{S/Â_p}` is q-crystalline cohomology for the q-PD pair (Â_p[[h]],(h)), complete for (p,h). Its prismatic realization is `Δ_{S^(p)[ζ_p]/Â_p[[h]]}` for the prism ideal ([p]_q), with `S^(p)=(S⊗_{A,ψ^p}A)^∧_p`. These ideals have different quotients. The common complete framed difference calculus is imported from QWittVectors §§8.1–8.3 (coordinate-scaling automorphisms, framed Jackson derivatives, the framed difference complex); PrismaticCohomologyPartII §§5.19–5.21 supply the local comparison. Mathlib's geometric-sum identities supply q-integers.

(See QH §A, pp.69–76; Theorem A.1(b), §A, p.69; §A.1, p.70.)

This uses PrismaticCohomologyPartII §§5.2–5.11, 5.13 and 5.19–5.21, QWittVectors §§2.1–2.4, Mathlib geom_sum_mul, Mathlib Polynomial.eval_geom_sum, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_pow_eq_geom_sum, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.prod_cyclotomic_eq_geom_sum.

### 1.2 Polynomial Jackson specialization

Import polynomial Jackson calculus over every commutative ring A and scalar q∈A from HabiroCyclotomicCompletions §1.1. Write D_q(xⁿ)=[n]_q xⁿ⁻¹, with constants sent to zero. Its coefficientwise definition needs no division, completion or invertibility. The imported laws are f(qx)−f(x)=(q−1)xD_q(f), D_q(fg)=D_q(f)g(qx)+fD_q(g), and D_1(f)=f′; the product law also equals the supplier's D_q(f)g(x)+f(qx)D_q(g), by its divided-difference identity. The complete framed Koszul complex is imported from QWittVectors §8.3; this roadmap owns its global comparison in §1.14 (QH Theorem A.1(d), p.69; QW §4.7, p.57). With the supplier's adapted derivative D′=(1−q)D_q, the framed q-Hodge differential of §4.8 is −D′.

*Needs:* HabiroCyclotomicCompletions §1.1; QWittVectors §§8.1–8.3 for the completed application.

**Checks.**

- At q=0, D_0(x³)=x². D_q(a)=0, including the constant term n=0; natural subtraction n−1 creates no spurious constant contribution because [0]_q=0.
- Over ℤ, D_2(x³)=7x², D_2(x²)=3x and D_1(x)=1. Over 𝔽₂, D_1(x²)=0. These values distinguish Jackson differentiation from the ordinary derivative at general q.
- D_q(x²)=(1+q)x, and the twisted product rule gives qx+x rather than 2x. At q=2, D′(x²)=−3x while the q-Hodge differential is +3x; the adapted operator has the opposite sign. In the zero ring both sides are zero.

### 1.3 The local derived q-de Rham complex at a prime, and its agreement with the underived one on smooth algebras

For a fixed p and a p-torsion-free Λ-base A, animate the p-complete local functor on completed polynomial Â_p-algebras, then p-complete. This defines qdR on p-complete animated Â_p-algebras, valued in (p,h)-complete E∞-algebras. Reduction by h gives p-completed derived de Rham cohomology. On p-completely smooth inputs the map qdR→qΩ is an equivalence, detected modulo (p,h) using smooth derived de Rham in characteristic p. All complexes relative to a p-complete base here are implicitly p-completed. The equality on smooth inputs is local at p.

(See QH §A.1, p.70; Convention A.3, §A, p.70.)

This uses HQ.1, PrismaticCohomologyPartII §§5.9–5.13, 5.19–5.21, EnhancedDerivedSheaves E5:animation, DerivedModuleAlgebra §§1.1–1.4, DerivedDeRhamCohomology §§2.22, 2.26–2.27 and 3.6, DerivedDeRhamCohomology §4.6, CrystallineCohomology CR.2.

Use the following maps and laws:

- For a prime p, the functor `qdR_{−/Â_p}` from p-complete animated Â_p-algebras to (p, q−1)-complete E∞-Â_p⟦q−1⟧-algebras.
- For p-completely smooth S, the canonical map `qdR_{S/Â_p}` → `qΩ_{S/Â_p}` is an equivalence.
- `qdR_{R/Â_p}/(q−1)` ≃ `dR_{R/Â_p}`, p-completed.
- It preserves sifted colimits from p-complete animated algebras to (p,h)-complete E∞-algebras: complete the input colimit at p and the target colimit at (p,h). It is the unique such extension from p-completed polynomial algebras.
- Functorial in R, and in A along maps of p-torsion free Λ-rings.

**Checks.**

- For R = Â_p the value is Â_p⟦q−1⟧.
- For R = (Â_p[x])^∧_p, the p-completed polynomial ring in one variable, the value is the (p,q−1)-completed two-term complex R⟦q−1⟧ → R⟦q−1⟧dx, x^n ↦ [n]_q `x^{n−1}dx`. (Angle brackets are reserved for divided-power polynomial algebras below.)
- Modulo q−1 the value is the p-completed derived de Rham complex `dR_{R/Â_p}`; for R smooth, the p-completed de Rham complex.
- For A = ℤ and R = 𝔽_p, reduction by q−1 gives the derived p-completion of [ℤ_p⟨x⟩ —(x−p)→ ℤ_p⟨x⟩] in degrees −1,0, where ⟨x⟩ is the divided-power polynomial algebra. This is `dR_{𝔽_p/ℤ_p}`, not crystalline cohomology over the fixed PD base (ℤ_p,(p)). At p=2, the quotient contains the nonzero 2-torsion class x^[2]−2: 2x^[2]=x²=4, and x^[2] survives in the reduction modulo 2. Thus replacing this value by ℤ_2 already fails (Bhatt, Proposition 8.5 and Corollary 8.6, §8, p.32).

### 1.5 Denominator estimates for δ and for the q-divided power in the rationalised q-PD envelope

Choose a surjection P↠S from a p-completely ind-smooth δ-Â_p-algebra, with S p-completely smooth, kernel J, p-completed PD envelope D and q-PD envelope qD. Extend δ with δ(q)=0. In (qD⊗ℚ)^∧_h write γ_q(x)=φ(x)/[p]_q−δ(x). For n,α≥1, δ(h^n qD)⊂h^n qD and δ(p^(−α)h^n qD)⊂p^(−(pα+1))h^n qD. The corresponding γ_q images lie in h^(n+1)qD and p^(−(pα+1))h^(n+1)qD. Flatness of qD over ℤ_p[[h]] supplies p-regularity and the intersection calculation. Here [p]_q is inverted only in the rational h-complete ring.

(See QH Lemma A.5, §A, p.71; Lemma A.5(b), §A, p.71.)

This uses HQ.1, PrismaticCohomologyPartII §§5.2, 5.4–5.8, PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71.

### 1.6 The iterated divided power expansion in the rationalised q-PD envelope

With the same envelope data, define γ(x)=x^p/p in qD⊗ℚ. For x∈J and n≥1, find y_0,…,y_n∈qD, with y_0 admitting q-divided powers, such that `γ^(n)(x)=y_0+Σ_{i=1}^n` p^(−2(1+p+⋯+p^(i−1)))h^(p−2+i)y_i. The superscript denotes iteration. This is an identity after rationalization and does not assert integrality of γ^(n)(x). The δ-structure on P is arbitrary over the base; a framing is unnecessary.

(See QH Lemma A.6, §A, p.71.)

This uses HQ.1, PrismaticCohomologyPartII §§5.7–5.8, DerivedDeRhamCohomology §PD.6.

Use the following maps and laws:

- The operation γ on the rationalized envelope is x↦x^p/p, with p prime and therefore nonzero in ℚ.
- Its n-fold iterate is x^(p^n)/p^(1+p+⋯+p^(n−1)); it is an iteration, rather than the single divided power of index p^n.
- For a rational scalar c, γ(cx)=c^pγ(x). The envelope expansion above is required for each x∈J, not for unrelated scalar data.

**Checks.**

- At p=2, γ(x)=x²/2 and γ²(x)=x⁴/8. The ordinary divided power of index 4 is x⁴/24, so substituting it for the iterate changes the factor by 3.
- At p=3, γ(x)=x³/3, while x^[3]=x³/6, and γ²(x)=x⁹/81. Using factorial denominators instead of iteration fails both values.
- γ(0)=0 at every prime. At p=2, γ(2x)=4γ(x); at p=3 it is 8γ(x), so the operation is not ℚ-linear.

### 1.7 The reverse expansion: iterated q-divided powers in the rationalised PD envelope

The reverse estimate is an h-adically convergent expansion in D⊗ℚ[[h]]: `γ_q^(n)(x)=y_0+Σ_{i≥1}p^(−2(1+p+⋯+p^(i−1)))h^(p−2+i)y_i`, where y_i∈D and y_0 admits ordinary divided powers. Consequently, for each animated R and truncation order n, the p-completed map qdR→(dR)^∧_p[1/p][[h]]/h^n lands in p^(−N)(dR)^∧_p[[h]]/h^n for some N depending on p and n. No estimate uniform in p is supplied in this direction. This bound serves the later filtration comparisons.

(See QH Remark A.7, §A, p.72; Lemma 3.29, §3, p.38; Lemma 4.27, §4, p.65.)

This uses HQ.1, DerivedDeRhamCohomology §PD.6, PrismaticCohomologyPartII §§5.7–5.8.

### 1.8 One denominator that works for every prime at once

Set `N_n=∏_{ℓ≤n prime}ℓ^(2(1+ℓ+⋯+ℓ^(n−1)))`, with N_0=N_1=1. Every N_n is positive, since each factor is a positive prime power. In the forward envelope comparison D→(qD/h^n)⊗ℚ, the image lies in N_n^(−1)qD/h^n for every p. For a torsion-free Λ-base and animated R, these bounds give maps from each local dR into N_n^(−1)qdR/h^n and hence an equivalence (∏_p `dR_{R̂_p/Â_p}⊗^Lℚ)[[h]]` ≃ (∏_p `qdR_{R̂_p/Â_p}⊗^Lℚ)^∧_h`. The denominator independent of p is what permits rationalization of the product; replacing it by the product of rationalizations changes the statement.

(See QH Paragraph A.11, §A, p.74.)

This uses HQ.1, DerivedDeRhamCohomology §PD.6, DerivedModuleAlgebra §§1.1–1.4.

**Checks.**

- N_0=N_1=1: no prime contributes, including the empty exponent range.
- `N_2=2^{2(1+2)}=64`. The inverse estimate cannot silently replace this denominator by 2.
- `N_3=2^{14}3^{26}>0`; all factors are positive prime powers. A prime-dependent denominator alone does not justify rationalizing an infinite product.

### 1.4 After rationalisation, derived q-de Rham cohomology is a base change of derived de Rham cohomology

For p-torsion-free A and p-complete animated R over Â_p, construct a coordinate-free, natural equivalence `(qdR_{R/Â_p}⊗^Lℚ)^∧_h` ≃ `(dR_{R/Â_p}⊗^Lℚ)[[h]]`, inducing the identity modulo h. Both input complexes are p-completed before rationalization. Use PD and q-PD envelopes, the denominator estimates of §§1.5–1.8 and derived complete conservativity. Rationalization followed by h-completion is essential.

(See QH Lemma A.4, §A, p.70; §A.1, p.70.)

This uses HQ.1, PrismaticCohomologyPartII §§5.7–5.11, PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71, DerivedDeRhamCohomology §PD.6, DerivedDeRhamCohomology §§2.22–2.27, DerivedDeRhamCohomology §4.6, DerivedModuleAlgebra §§1.1–1.4.

### 1.9 Koszul complexes are unchanged by twisting each endomorphism by a suitably commuting automorphism

Import the generic Koszul complex from AI.1. For commuting endomorphisms g_i of an abelian group and commuting automorphisms u_i, assume u_i g_j=g_j u_i for i≠j. Then the u_i g_i commute, and K(M;g_i)≅K(M;u_i g_i), using `∏_{i∈I}u_i` on the summand indexed by I. No assumption u_i g_i=g_i u_i is allowed: it fails for the rational framed application.

(See QH Paragraph A.8, §A, p.73.)

This uses AInfCohomology AI.1.

### 1.10 The explicit framed comparison after rationalisation

For B=A or B=Â_p and an étale or p-completely étale framing T_i of smooth S, compare rational h-completed framed q-de Rham and ordinary de Rham complexes. The operator factor is `D_i=(log(q)/h+Σ_{r≥2}(log(q)^r/(r!h))(∂_i∘T_i)^(r−1))∂_i`, where ∂_i∘T_i means multiplication by T_i followed by ∂_i. The parenthesis is an automorphism equal to id modulo h, commuting with ∂_j for j≠i. Apply the Koszul twist lemma. The same comparison holds for framed ind-smooth PD and q-PD envelopes P↠S; there use δ(T_i)=0, extended uniquely through ind-étale maps. Powers are iterates, not divided powers. Logarithms occur only rationally and h-completely.

(See QH Paragraph A.8, §A, p.73; Lemma A.9, §A, p.73; Theorem A.1, §A, p.69 · Sch Lemma 4.1, §4, p.8.)

This uses HQ.1, PrismaticCohomologyPartII §§5.14–5.21, PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71, DerivedDeRhamCohomology §PD.6.

### 1.11 The coordinate-free and the explicit framed comparisons agree

For the framed envelope situation, prove equality of the two routes from rational h-completed q-crystalline cohomology to the ordinary PD de Rham model: the coordinate-free envelope comparison followed by the crystalline PD realization, and PrismaticCohomologyPartII §§5.19–5.21's framed q-crystalline realization followed by the explicit Koszul comparison. The result is a commuting square, with independently constructed horizontal maps. It supplies the compatibility needed for arithmetic gluing.

(See QH Lemma A.10, §A, p.74.)

This uses HQ.1, PrismaticCohomologyPartII §§5.19–5.21, CrystallineCohomology CR.2.

### 1.12 The global q-de Rham complex, as a pullback of p-completions and rational de Rham data

For a Λ-ring A torsion-free at every prime and a smooth A-algebra S, define `qΩ_{S/A}` in h-complete E∞-A[[h]]-algebras as the pullback of ∏_p `qΩ_{Ŝ_p/Â_p}` and `(Ω^•_{S/A}⊗^Lℚ)[[h]]` over (∏_p `Ω^•_{Ŝ_p/Â_p}⊗^Lℚ)[[h]]`. The map out of the prime product uses the uniform-denominator equivalence, followed in the required direction by rationalization and h-completion. Its local smooth animated/underived identifications are p-complete. That map from the integral product to its rationalisation is not an equivalence; only its rationalised, h-completed source is identified with the target. The definition is functorial in S and uses no global q-crystalline site.

(See QH Construction A.12, §A, p.75; §A, pp.69–76.)

This uses HQ.1, PrismaticCohomologyPartII §§5.9–5.13, DerivedModuleAlgebra §§1.1–1.4, DerivedDeRhamCohomology §4.6, EnhancedDerivedSheaves E5.

Use the following maps and laws:

- For a Λ-ring A that is p-torsion free for all p and a smooth A-algebra S, the object `qΩ_{S/A}` of (q−1)-complete E∞-algebras over A⟦q−1⟧.
- The defining square, with its four corners and two maps named, is a pullback square. This characterises the object.
- For each prime p, the map `qΩ_{S/A}` → `qΩ_{Ŝ_p/Â_p}`. It identifies the p-completion of `qΩ_{S/A}` with `qΩ_{Ŝ_p/Â_p}`.
- The map `qΩ_{S/A}` → `(Ω*_{S/A}` ⊗ ℚ)⟦q−1⟧. It identifies the (q−1)-completed rationalisation of `qΩ_{S/A}` with its target.
- A map S → S′ of smooth A-algebras induces `qΩ_{S/A}` → `qΩ_{S′/A}`, with coherent identity and composition laws.
- `qΩ_{S/A}/(q−1)` ≃ `Ω*_{S/A}`, naturally in S (Theorem A.1(a)).
- The base change equivalence `(qΩ_{S/A}` ⊗^L_A `A′)^∧_{(q−1)}` ≃ `qΩ_{(S⊗_A A′)/A′}`.
- For an étale framing □ of S, an equivalence `qΩ_{S/A}` ≃ `qΩ*_{S/A,□}` of underlying objects.

**Checks.**

- For A = ℤ and S = ℤ[x], `qΩ_{S/A}/(q−1)` is the two-term complex ℤ[x] → ℤ[x]dx of that ring and its module of differentials.
- If A is a ℚ-algebra, every Â_p vanishes, so both right-hand corners vanish and `qΩ_{S/A}` is `Ω*_{S/A}⟦q−1⟧`, the trivial q-deformation.
- For A = ℤ and S = ℤ[x] with the identity framing, `qΩ_{S/A}` is the q-difference complex ℤ[x]⟦q−1⟧ → ℤ[x]⟦q−1⟧dx, x^n ↦ [n]_q `x^{n−1}dx`.
- For A = S = ℤ, `qΩ_{S/A}` is ℤ⟦q−1⟧, while the product over all primes of the p-complete complexes is Π_p ℤ_p⟦q−1⟧. A definition that dropped the rational corner would already be wrong here.

### 1.13 The global complex deforms de Rham, is prismatic at every prime, and is rationally trivial

For this global functor, prove natural equivalences qΩ/h≃Ω^•, `(qΩ)^∧_p≃qΩ_{Ŝ_p/Â_p}≃Δ_{S^(p)[ζ_p]/Â_p[[h]]}`, and (qΩ⊗^Lℚ)^∧_h≃(Ω^•⊗^Lℚ)[[h]]. In the local equivalence the prism ideal is ([p]_q) and S^(p) is completed Adams base change. The hypotheses are smoothness of S and prime-by-prime torsion-freeness of A; perfect coverage is unnecessary.

(See QH Theorem A.1(a), §A, p.69; Theorem A.1(b), §A, p.69; Theorem A.1, §A, p.69.)

This uses HQ.1, PrismaticCohomologyPartII §5.13, DerivedModuleAlgebra §§1.1–1.4.

### 1.14 For a framed smooth algebra, the global complex is the coordinate-dependent complex

For the same A and an étale-framed smooth S, identify the underlying derived A[[h]]-module `qΩ_{S/A}` with K(S[[h]];D_i). Compare their completed arithmetic fracture squares, using the local q-crystalline realization and the compatible rational framed comparison. This identifies underlying complexes; it does not identify a chosen framing with a canonical E∞-model.

(See QH Theorem A.1(d), §A, p.69; Theorem A.1, §A, p.69.)

This uses HQ.1, PrismaticCohomologyPartII §§5.19–5.21, DerivedModuleAlgebra §§1.1–1.4.

### 1.15 Base change for the global q-de Rham complex, with its (q−1)-completion

If A→A′ is a morphism of Λ-rings, both torsion-free at every prime, and S is smooth over A, prove `(qΩ_{S/A}⊗^L_A` `A′)^∧_h≃qΩ_{S⊗_A A′/A′}`. A′ need not be flat. Smoothness makes ordinary and derived base change of S agree, while the complex still uses derived tensor and h-completion. Reduction by h is smooth de Rham base change. Already ℤ[[h]]⊗ℚ≠ℚ[[h]], so completion cannot be deleted.

(See QH Theorem A.1, §A, p.69.)

This uses HQ.1, PrismaticCohomologyPartII §§5.8–5.13, DerivedModuleAlgebra §§1.1–1.4.

### 1.16 Comparison maps between framed models, and the cocycle identity

For three étale framings of the same smooth S, define the comparison from one Koszul model to another through `qΩ_{S/A}`. The identity framing comparison is id, and `c_{3,2}c_{2,1}≃c_{3,1}`, with coherence inherited from the common enhanced object. This is a formal consequence of the global framed equivalences on underlying derived modules. It does not assert framing independence of ordinary q-connections.

(See QH Theorem A.1(d), §A, p.69; §A, pp.69–76.)

This uses HQ.1.

Use the following maps and laws:

- For each ordered pair of étale framings, the comparison of underlying complete derived modules obtained through the global qΩ equivalences.
- The identity comparison and the composition homotopy for every triple, natural in the algebra and coherent for longer sequences of frames.
- Compatibility with the local and rational framed identifications used in §1.14.

**Checks.**

- For the repeated coordinate frame on ℤ[x], the comparison sends 1 to 1 and dx to dx. Multiplication by −1 fails the unit normalization.
- On ℚ[x], compare x with y=2x. After h=0, dx maps to dy/2, and the reverse sends dy to 2dx; the composite sends dx to dx. Omitting the factor 1/2 fails.
- With z=3x as the third frame, the route dx↦dy/2↦dz/3 equals the direct route dx↦dz/3 after h=0. The empty-frame identity sends 1 to 1 as well.

### 1.17 The de Rham complex of a smooth algebra is the totalisation of the PD envelopes of a Čech nerve

For smooth S over A and a functorial surjection P↠S from an ind-smooth A-algebra, take the Čech nerve P^• of A→P and ordinary PD envelopes of the kernels of P^•↠S. Identify Tot D^• with `Ω^•_{S/A}` as derived commutative A-algebras. The de Rham structure comes from its cdga structure, while the totalization structure comes from static rings. These envelopes are not p-completed.

(See QH Paragraph A.13, §A, p.76.)

This uses DerivedDeRhamCohomology §PD.6, CrystallineCohomology CR.2, EnhancedDerivedSheaves E5.

### 1.18 The global complex lifts to a derived commutative algebra, by cosimplicial PD realisations

Lift the global functor canonically from E∞-algebras to h-complete derived commutative A[[h]]-algebras. Use the envelope totalizations for all corners and maps of the defining pullback: ordinary PD, p-completed PD and q-PD Čech–Alexander realizations. The completion maps and rational envelope maps lift the two gluing arrows. Require `gap:unbounded-derived-commutative`: the unbounded category DAlg and its conservative forgetful functor creating the required limits and colimits. Animated rings alone do not supply this input. This derived-commutative lift is conditional on that contract; the E∞ construction is independent of it. This establishes the lift for these constructions, without asserting that an arbitrary E∞-algebra has such a lift.

(See QH Paragraph A.13, §A, p.76.)

This uses §§1.12–1.17, `gap:unbounded-derived-commutative`, PrismaticCohomologyPartII §§5.10–5.11 and CrystallineCohomology CR.2.

Use the following maps and laws:

- The lift of `qΩ_{−/A}` to (q−1)-complete derived commutative A⟦q−1⟧-algebras.
- Its composite with the forgetful functor to E∞-algebras is `qΩ_{−/A}`.
- It is the pullback, in (q−1)-complete derived commutative algebras, of the lifted corners.
- On each corner of the defining square it is the derived commutative structure of the cosimplicial realisation named there.
- Functorial in S and natural in the base A.

**Checks.**

- For A=S=ℤ and P=ℤ[T]→ℤ, T↦0, the zeroth PD envelope is ℤ⟨T⟩ but its Čech–Alexander totalization is ℤ. Substituting the zeroth envelope for the totalization fails this calculation.
- For S=A the lifted unit is A[[h]], and its product sends (1,1) to 1; the zero multiplication does not give this lift.
- For S=ℤ[x], reduction by h has d(x)=dx and d(x²)=2x dx. After coefficient reduction to 𝔽₂ these values are dx and 0 respectively; replacing the differential by zero or retaining the characteristic-zero coefficient both fail.

### 1.19 Étale descent for the global q-de Rham complex

For a smooth finitely presented S over a torsion-free Λ-ring A and a finite jointly surjective family of finitely presented étale S-algebras T_i, prove `qΩ_{S/A}≃Tot` `qΩ_{T^•/A}` in derived h-complete E∞-algebras. The Čech terms use products over all multi-indices of tensor-product overlaps. Only A has Adams operations. Reduction by regular h is a finite cofiber operation, hence commutes with the enhanced totalization. In each form degree, ordinary étale descent is the exact Amitsur resolution; the common finite range of forms controls convergence. Derived h-complete conservativity then proves the result. This supplies Zariski descent as well. No tensor product of qΩ over S is used: its differential is only A-linear.

(See QH Theorem A.1(a), §A, p.69 · Stacks Definition 15.93.4, §15.93; Lemma 15.93.20, §15.93; Theorem 59.22.4, §59.22; Lemma 59.22.1, §59.22 (unpaginated HTML).)

This uses HQ.1, QWittVectors §§2.1–2.4, DerivedModuleAlgebra §§1.1–1.4, DerivedDeRhamCohomology §§2.22–2.27.

### 1.20 Coherent framed Čech comparisons

For an étale Čech diagram equipped with a finite étale framing on each term to which a framed model is assigned, transport its face, degeneracy and augmentation maps through the chosen global framed equivalences. This gives an equivalence of enhanced diagrams and their totalizations, with the identity and cocycle laws of §1.16. For general smooth diagrams, use étale local framed refinements and §1.19 to descend the comparisons; retain unframed terms in their global qΩ model. No global frame on the augmentation is assumed. The smooth finite-presentation and finite étale-cover hypotheses are those of §1.19.

(See QH Theorem A.1(d), §A, p.69, QH lines 3156–3159.)

*Needs:* §§1.14, 1.16 and 1.19; EnhancedDerivedSheaves E0 for coherent transport.

**Checks.**

- For the identity cover of ℚ[x], the coordinate frame gives the identity diagram; x² maps to (2+h)x dx on both models. Changing the differential to 2x dx before setting h=0 fails this test.
- For S=ℚ[x,y]/(y²−x³+x), the identity cover uses qΩ_S on its augmentation. Over an algebraic closure its smooth projective elliptic completion has one point at infinity. A nonconstant regular f has a pole of order n≥2 there, so df has a pole of order n+1 and a zero divisor of degree n+1 on the affine curve. Thus df cannot trivialize Ω¹ everywhere: there is no global étale coordinate. Local framed refinements still give the descent comparison.
- For the split cover S→S×S, the two projections of the transported comparison send 1 to 1; on the linear coordinate they send dx to dx. Choosing −id on one copy gives −1 on the unit and fails compatibility.

### 1.21 The étale sheaf of global q-de Rham algebras

On a smooth finitely presented A-scheme X, evaluate U=Spec `S↦qΩ_{S/A}` on affine étale opens. Denote the resulting derived h-complete E∞-A[[h]]-valued sheaf by qΩ_X. It has section object Tot `qΩ_{U^•/A}` on a finite affine étale cover. Use DerivedModuleAlgebra §§1.1–1.4's enhanced complete limits and E1's enhanced sheafification; an ordinary triangulated sheaf axiom is insufficient. This constructs a global q-de Rham sheaf and does not yet choose a q-Hodge filtration.

(See QH Theorem A.1(a), §A, p.69 · Stacks Theorem 59.22.4, §59.22 (unpaginated HTML).)

This uses HQ.1, EnhancedDerivedSheaves E2, DerivedModuleAlgebra §§1.1–1.4, DerivedDeRhamCohomology §§2.22–2.27.

Use the following maps and laws:

- Writing B=A[[h]], the complete E∞ B-algebra sheaf determined by U=Spec S ↦ `qΩ_{S/A}` on the affine étale basis.
- For affine étale U=Spec S, `RΓ(U_et,qΩ_X|_U)≃qΩ_{S/A}`, naturally in U.
- The enhanced global-section object RΓ(X_et,qΩ_X).
- For a finite affine open cover of separated X, global sections are Tot of the products of the affine qΩ values on intersections; compatible with refinement.
- The derived reduction of the sheaf is the ordinary de Rham sheaf complex, and `sections/h≃RΓ(X,Ω*_{X/A})`.
- For U→V in X_et, the restriction RΓ(V_et,qΩ_X|_V)→RΓ(U_et,qΩ_X|_U) is a complete B-algebra map; on affine objects it is the existing qΩ map for the corresponding ring homomorphism. Identity and composition hold with all coherent functor laws.
- Restriction to the affine étale basis induces equivalences on mapping spaces between sheaves valued in complete E∞ B-algebras. A specified comparison of basis functors extends with contractible choice; in particular qΩ_X is characterized by its affine-value functor.

**Checks.**

- For X=Spec S and its identity affine cover, sections identify with `qΩ_{S/A}` and the restriction is identity.
- For X=Spec S₁ ⊔ Spec S₂, sections are `qΩ_{S₁/A}×qΩ_{S₂/A}`; cross intersections contribute the zero-ring value.
- For Spec Z[x] covered by D(x), D(1−x), the section object modulo h is the ordinary de Rham Čech totalization, equivalent to `Ω*_{Z[x]/Z}`.

### 1.22 Modules with framed flat q-connection

Let C=S[[h]] for an étale-framed smooth A-algebra with coordinates x_i and complete operators σ_i,D_i. A flat framed q-connection on a finite projective C-module M consists of commuting A[[h]]-linear ∇_i with ∇_i(fm)=σ_i(f)∇_i(m)+D_i(f)m. Morphisms are C-linear intertwining maps. Projectivity is over C; the completed flat étale prefix supplies the division defining D_i. Over A=ℤ this recovers Scholze's definition. Its independence of framing is a conjecture.

(See Sch Definition 7.3, §7, p.15; Remark 7.4, §7, p.15.)

This uses HQ.1, Mathlib Module.Projective.

Use the following maps and laws:

- The finite-projective module with coefficient-linear ∇, twisted Leibniz and pairwise commutation.
- C-linear maps f with f∇_i=∇′_if for every i; identity and composition.
- M=C, ∇_i=D_i.
- For the framed formal parameter h, reduction of the equations gives an integrable ordinary connection on M/hM; D_i mod h is ∂/∂T_i.

**Checks.**

- On Z[T]⟦h⟧, ∇(T³)=(1+q+q²)T².
- An empty frame gives finite-projective C-modules with no extra operators.
- The equation at q=1 becomes ∇(fm)=f∇(m)+(∂f)m.
- For M=C and ∇=D, D(T)=1 but T·D(1)=0; a C-linear connection field would be wrong.

### 1.23 Integer coordinate scaling on the torus

For a commutative B, unit q∈B× and C=B[ℤ^d], set σ_a(x^m)=q^⟨a,m⟩x^m for a,m∈ℤ^d, fixing B. Construct this B-algebra automorphism for every a, including negative coordinates, and prove σ_0=id, `σ_{a+b}=σ_aσ_b` and `σ_{−a}=σ_a^(−1)`. This is the integer coordinate-scaling action, used for a quotient prestack rather than a coarse orbit space. It extends the framed action to Laurent coordinates and a unit parameter, with no smoothness or h-completion requirement. The endomorphism σ_a is the native `torusScaleHom q a`, obtained from Mathlib's `AddMonoidAlgebra.lift` and the character m↦single m `q^{Σ_i a_i m_i}`. Its action law is `torusScaleHom_action`, and `torusScale_exists_unique` states the invertible refinement.

(See Sch §8, p.16, coordinate torus action; §7, Definition 7.3, p.15, for the framed connection application.)

This uses Mathlib AddMonoidAlgebra, Mathlib AlgEquiv, HQ.1.

Use the following maps and laws:

- `torusScale_exists_unique`: There is exactly one native B-algebra equivalence of B[ℤ^d] sending each single monomial (m,1) to `(m,q^{Σ_i a_i m_i})`.
- `torusScaleHom`: The native B-algebra endomorphism of AddMonoidAlgebra B (Fin d→ℤ) lifting that character; σ_a is its invertible refinement.
- `torusScaleHom_action`: torusScaleHom q 0 is the identity and torusScaleHom q (a+b) is the composite of torusScaleHom q a after torusScaleHom q b.
- The B-algebra automorphism σ_a of AddMonoidAlgebra B (Fin d→ℤ), whose existence and uniqueness is the native `torusScale_exists_unique`; its underlying map is the native `torusScaleHom q a`.
- σ_a(single m r)=single m `(r·q^{Σ_i a_i m_i})`, with integer powers of the unit q.
- σ_0 is the identity B-algebra equivalence.
- `σ_{a+b}(f)=σ_a(σ_b(f))` for every Laurent polynomial f.
- `σ_{−a}` equals the inverse equivalence σ_a⁻¹.
- Any B-algebra automorphism with the same single-monomial formula equals σ_a.

**Checks.**

- For d=0 every σ_a is the identity, using the native B[Z^0] carrier.
- For q=1 and any d,a, σ_a is identity. The group of labels still exists.
- For d=1, a=(1), m=(−1), σ_a(single m 1)=single m q⁻¹.
- For d=2, a=(2,−1) and m=(−1,3), σ_a(single m 1)=single m q⁻⁵.

### 1.24 Modified q-connections on a Habiro torus

A modified connection on C=B[x_1^±1,…,x_d^±1] is a C-module with commuting invertible σ_i-semilinear Γ_i. Define ∇̃_i=x_i^(−1)(Γ_i−id); its rule is ∇̃_i(fm)=σ_i(f)∇̃_i(m)+x_i^(−1)(σ_i(f)−f)m. Tensor products use Γ_i⊗Γ_i. All modules give the descent heart and finite projectives give vector bundles. There is no congruence modulo h and no division by h. Recovering an ordinary q-connection from Γ_i=id+hx_i∇_i requires h-completeness, continuity, regularity and the divisibility congruence as additional assumptions.

(See Sch Definition 7.3 and Remark 7.4, §7, p.15, for the ordinary framed notion; the invertible semilinear variant here is the algebraic action used in the quotient construction below.)

This uses HQ.1, Mathlib LinearEquiv.

Use the following maps and laws:

- Commuting invertible σ_i-semilinear automorphisms of a C-module.
- ∇̃_i(m)=x_i⁻¹·(Γ_i(m)−m).
- Γ_i(m)=m+x_i·∇̃_i(m).
- Balanced semilinear tensor action with inverse; target on M⊗_C N.
- On complete formal modules Γ_i=id+h x_i∇_i; ∇̃=h∇, subject to the stated completeness and regularity hypotheses.

**Checks.**

- On M=C with Γ=σ, ∇̃(x^n)=(q^n−1)x^(n−1); no q−1 denominator.
- id+x_i∇̃_i returns Γ_i, including on negative Laurent exponents.
- Γ((fm)⊗n)=σ(f)Γ(m)⊗Γ(n)=Γ(m)⊗σ(f)Γ(n).
- On C=Q[x±1]⟦h⟧ with q=1+h, Γ(f)=2σ(f) is invertible but Γ(1)−1=1 is not divisible by h; it is not from an ordinary q-connection.

### 1.25 Torus descent for modified q-connections

The ordinary equivariant-module category for the lattice action is the category of modified connections, equivalently modules over C⋊ℤ^d. Its enhanced analogue is QCoh([Spec `C/ℤ^d])≃D(C)^{hℤ^d}`. Here homotopy fixed points mean coherent descent, not commuting maps in the homotopy category. The action need not be free. The following two targets specify the enhanced import and its heart; this quotient comparison says nothing about analytic Habiro cohomology.

(See DAG VIII Proposition 2.7.6 and Definition 2.7.8, §2.7, p.71; Remark 2.7.10 and Proposition 2.7.14, §2.7, p.72, for the enhanced descent construction.)

This uses HQ.1.

### 1.26 Derived modified q-connections on a torus

Define the derived modified-connection category using the coherent action `F_a(M)=C⊗^L_{C,σ_a}M`, with coherent unit and composition equivalences. A descent isomorphism θ_a:F_aM≃M yields Γ_a(m)=θ_a(1⊗m), positive σ_a-semilinear. The underlying restriction-of-scalars twist of F_a is σ_a^(−1); reversing θ reverses the convention. Describe mapping spectra by homotopy fixed points of the conjugation action on Map_C(M,N), and supply the symmetric monoidal structure and t-exact action. A collection of commuting homotopy-category isomorphisms omits the higher cocycles.

(See DAG VIII Definition 2.7.8, §§2.6–2.7, pp.66–76.)

This uses the lattice action of §1.23, EnhancedDerivedSheaves E5:presentability and EnhancedDerivedSheaves E0/E1 coherent module-category limits.

Use the following maps and laws:

- The enhanced limit of the explicit discrete lattice action on D(C).
- Conservative exact evaluation functor to D(C).
- The tensor unit has underlying C and generator actions `σ_{e_i}`.
- The derived C-tensor with diagonal coherent action; on flat strict representatives Γ_i(m⊗n)=Γ_i(m)⊗Γ_i(n).
- For an object with underlying M, extract θ_a:F_a(M)≃M, θ_0, the coherent cocycle `θ_{a+b}=θ_a∘F_a(θ_b)`, and all higher compatibilities. On strict complexes Γ_a(m)=θ_a(1⊗m); on tensors θ_a is the tensor of the two θ_a maps through monoidal pullback.
- A C-complex with commuting invertible σ_i-semilinear chain maps gives an enhanced modified connection by integer iterates and their coherent action. Horizontal chain maps induce morphisms, coherently respecting identity and composition. This constructs examples without asserting an equivalence from the localization of strict models.
- For M,N, the mapping spectrum is `Map_{D(C)}(M,N)^{hZ^d}`; the coherent action on the underlying mapping spectrum sends f to θ_a^N∘F_a(f)∘(θ_a^M)⁻¹. In particular the forgetful functor need not be faithful on homotopy-category morphisms.
- For every enhanced category K, `Fun(K,D(C)^{hZ^d})≃lim_{BZ^d}` Fun(K,D(C)) naturally in K and compatibly with evaluation. A coherent cone of functors lifts with contractible choice. This is the specialized limit universal property imported from E5.

**Checks.**

- For d=0 the category is D(B) via the native B[Z^0]≃B identification and the trivial group.
- For the unit, `Γ_i(x^m)=q^{m_i}x^m`, agreeing with the ordinary modified connection.
- For B=Q, q=1, d=1 and `C=Q[x^{±1}]`, Hom(unit,unit[1])≅C, whereas the mapping group in D(C) is zero. The Z action has not been discarded.
- For `B=Q,q=2,d=1,C=Q[x^{±1}]`, the unit θ_1:F_1(C)→C sends 1⊗x to 2x. Under η_1(c⊗m)=σ_1⁻¹(c)m its inverse C→F_1(C) sends x to x/2. Reversing θ while retaining positive semilinearity fails this test.

### 1.27 Derived torus quotient comparison

For X=Spec C and the discrete lattice action, form the geometric realization Q_pre of its action groupoid in prestacks, then its flat sheafification Q=[X/ℤ^d]. Prove QCoh(Q)≃QCoh(Q_pre)≃Tot `QCoh(X×(ℤ^d)^•)≃D(C)^{hℤ^d}`. QCoh is an enhanced right Kan extension from affines, sends colimits of prestacks to limits and is invariant under flat sheafification. Each nerve term is a disjoint union of affines, giving a product indexed by lattice tuples. Regard Spec C as the affine functor of HC and use `Mod_{HC}≃D(C)`, compatibly with pullback and tensor. The map X→Q is a torsor under the infinite constant group; it need not be a quasi-compact fpqc cover. The comparison, its monoidality and its pointwise t-structure require the enhanced flat module-descent interface; ordinary groupoid sheaf descent is only the heart-level input. At q=1 retain the full stabilizer ℤ^d, and at a parameter of finite order N retain Nℤ^d.

(See DAG VIII Proposition 2.7.6 and Definition 2.7.8, §2.7, p.71; Remark 2.7.10, Proposition 2.7.14 and Remark 2.7.15, §2.7, p.72.)

This uses the coherent action limit of §1.26, EnhancedDerivedSheaves E0/E1 affine modules and flat descent, and EnhancedDerivedSheaves E5:presentability. The prestack right Kan extension in this subsection is constructed from their enhanced limits.

**Checks.**

- For d=0 the groupoid has only identity arrows, Q=Spec B and QCoh(Q)≃D(B). A nontrivial fixed-point factor would fail this case.
- For B=ℚ, q=1 and d=1, Q=Spec ℚ[x^±1]×Bℤ; the stabilizer is ℤ. The degree-one self-maps of its unit are ℚ[x^±1], whereas a coarse quotient gives zero.
- For B=ℚ, q=−1 and d=1, every geometric point has stabilizer 2ℤ. Replacing the acting lattice by ℤ/2 discards these stabilizers and gives a different quotient.

### 1.28 The heart, vector bundles and perfect complexes

Show that the descent t-structure has heart the modules with commuting invertible semilinear Γ_i. Under the quotient comparison, vector bundles correspond to finite projective underlying C-modules with this equivariance; perfect complexes correspond to equivariant complexes whose underlying C-complex is perfect, by affine-local perfectness. This condition is not compactness in the equivariant category. The restriction to perfect objects and the symmetric monoidal equivalence require coherent enhanced descent, while the all-module heart is an ordinary algebraic construction.

(See Stacks Proposition 96.14.3, §96.14 (unpaginated HTML) · DAG VIII Definition 2.6.14; Proposition 2.6.15; Definition 2.7.8; Remark 2.7.12; Proposition 2.7.20; Example 2.7.23; Remark 2.7.24; Proposition 2.7.28, §§2.6–2.7, pp.66–76.)

This uses the quotient comparison of §1.27, EnhancedDerivedSheaves E0/E1, and AlgebraicVectorBundles L0B's affine finite-projective dictionary, with the specified lattice equivariance added here.

**Checks.**

- The tensor unit has underlying C and Γ_i=σ_i; it is a rank-one vector bundle. For q=2 over ℚ in rank one, Γ(x)=2x, so a C-linear identity action is not the unit descent datum.
- The zero module with its unique action is in the heart and is a rank-zero vector bundle and a perfect complex. Requiring positive rank would exclude it incorrectly.
- For q=1, B=ℚ and d=1, the regular representation C[ℤ] is compact in D(C[ℤ]) but is an infinite free C-module, hence is not perfect on Q. Compactness in the equivariant category therefore cannot replace affine-local perfectness.

### Examples

For A=ℤ[x], D_q(x³)=(1+q+q²)x² and specialization at q=1 gives 3x²; at q=2 it gives 7x². On a Laurent torus the negative monomial x⁻¹ acquires q⁻¹ under one coordinate scaling. These computations fix the divided operator and the direction of the semilinear action.

### Dependencies

The preceding constructions in this layer and Layer 0, QWittVectors, PrismaticCohomology, AInfCohomology, DerivedDeRhamCohomology, EnhancedDerivedSheaves, CrystallineCohomology. The subsection dependencies above specify the exact stages and maps.

## Layer 2: Animation and filtered conventions (HQ.2)

Fix the filtered coefficient conventions before extending qΩ by animation. The local smooth equivalence does not extend to all global smooth inputs.

### 2.1 Enhanced filtered and completion conventions

Import stable enhanced modules, filtered/graded objects, derived completion and fracture squares from EnhancedDerivedSheaves E1, DerivedModuleAlgebra §§1.1–1.4 and DerivedDeRhamCohomology §§1.14–1.17, 1.22. Descending filtrations have `F^{i+1}→F^i` and `gr^i=cofib(F^{i+1}→F^i)`; ascending ones have `gr_i=cofib(F_{i−1}→F_i)`. Exhaustivity is `colim_{i→−∞}F^i≃M` and completeness is `lim_{i→∞}F^i=0`. Completion is lim_n `cofib(F^{•+n}→F^•)`, with recovery by pullback along M→M̂. Day convolution requires tensor products preserving colimits separately. `Fil(C)≃Mod_{1_Gr[t]}Gr(C)`, |t|=−1. Write M/f for a derived cofiber and M^*/f for cofib(M(i)→M) when |f|=i. Derived completion is lim_n M/(f_1^n,…,f_r^n). Ordinary quotients require Koszul regularity. Use the principal fracture square and complete conservativity, including its vanishing consequences.

(See QH Paragraph 1.22(a), §1, pp.10–11; Paragraph 1.22(c), §1, pp.11–12; Paragraph 1.22(d), §1, p.12.)

This uses EnhancedDerivedSheaves E1, DerivedModuleAlgebra §§1.1–1.4.

The two-term witness for this derived-reduction convention is a computation with library objects. Let K be the degree-zero complex ℤ/2 and Q the cofiber of 0:K→K, which is Mathlib's `CochainComplex.mappingCone` of the zero map. Then H^(−1)(Q)≅ℤ/2 and H⁰(Q)≅ℤ/2, whereas the ordinary cokernel keeps only H⁰. No carrier of this roadmap enters, so the witness is the first Check below rather than a Lean target, and it constructs no enhanced completion.

**Checks.**

- Multiplication by 2 on ℤ/2 is zero. Its derived quotient has ℤ/2 in degrees −1 and 0; an ordinary cokernel loses the former.
- The cone of the identity of any complex is acyclic. A definition that appends a kernel without the cone differential fails this.
- Multiplication by 2 on ℤ has zero kernel and cokernel ℤ/2, so the derived quotient is concentrated in degree 0. Regularity is exactly what allows this ordinary quotient computation.

### 2.2 The filtered coefficient ring as a graded ring with one generator in each direction

The Rees ring of h^•A[q] is A[β,t], |β|=1, |t|=−1 and q=1+βt. For f_m=q^m−1 it is A[q,β,t]/(βt−f_m), with |q|=0; f_m is regular even if A has zero divisors. For m≥2 q remains a separate generator. Quotient by t gives associated graded, quotient by β gives the filtered f_m quotient, and quotient by (β,t) gives its associated graded. Fix these degree conventions before forming q-Hodge pairs.

(See QH proof of Lemma 3.9, §3.1, p.24; Theorem 3.11, §3.2, p.25.)

This uses HQ.2.

Use the following maps and laws:

- In MvPolynomial (Fin 3) A, X₁X₂−(X₀^m−1), with variable order (q,β,t).
- Evaluation at (q,β,t) vanishes iff βt=q^m−1, over any commutative A and any m≥0; the filtered coefficient construction below uses m≥1.
- The graded ring A[q, β, t]/(βt − (q^m−1)) for m ≥ 1, with |q| = 0, |β| = 1, |t| = −1. For m = 1 it is the polynomial ring A[β, t] with q = 1 + βt.
- The identification of filtered (q^m−1)^⋆A[q]-modules with graded modules over the displayed coefficient ring, natural in A.
- Modding out t is passage to the associated graded.
- Modding out β is the quotient by q^m−1 in filtration degree one (the quotient convention).
- Modding out both is the associated graded of the quotient by β.
- q = 1 + βt when m = 1, and βt = q^m−1 in general.

**Checks.**

- In A[β, t], βt = q − 1 with q = 1 + βt. A presentation with βt=q fails this. Over ℤ with variable weights (0,1,−1), β individually has degree +1 and t has degree −1; exchanging their weights fails those two assertions, although βt and the relation still have degree zero.
- A[β, t]/t is A[β], the graded ring `⊕_{n≥0}` A·β^n. This is the associated graded ⊕_n `(q−1)^nA[q]/(q−1)^{n+1}A[q]` of the (q−1)-adic filtration, and q maps to 1 in it.
- A[β, t]/β is A[t], the filtered ring A with the trivial filtration (A in degrees ≤ 0, zero in positive degrees). q maps to 1.
- Modulo β the image of q is 1, not 0. The presentation is of the (q−1)-adic filtration; for the q-adic one the relation would be βt = q, and q would map to 0.
- At (q,β,t)=(2,3,1), the polynomial βt−(q²−1) evaluates to 0; at (2,2,1) it evaluates to −1. For m=1 the triple (2,1,1) satisfies the relation. For m=0 the triple (2,0,0) also does: the evaluation identity holds for every m≥0, while the cyclotomic construction uses only m≥1.

### 2.3 The quotient of a filtered module by q^m-1 places the element in filtration degree one

For a filtered f_m^•A[q]-module, F/f_m means base change to the trivially filtered A[q]/f_m, placing f_m in filtration degree one. Its i-th piece is `cofib(f_m:F^{i−1}→F^i)`, equivalently quotient by β in the Rees description. The degreewise cofiber of f_m:F^i→F^i is a different construction. Only for m=1 is the target coefficient ring A itself. Use this convention in every twisted-filtration and Nygaard comparison.

(See QH Convention 3.1, §3, p.20.)

This uses HQ.2.

Use the following maps and laws:

- The quotient of a filtered (q^m−1)^⋆A[q]-module by q^m−1, as base change to the trivially filtered A[q]/(q^m−1).
- Its n-th piece is cofib((q^m−1): `fil^{n−1}M` → fil^nM).
- In the graded presentation it is the quotient by β.
- For a filtration constant in degrees ≤ 0 and n ≤ 0, the n-th piece is the unfiltered derived quotient M/(q^m−1) of the underlying object.
- It is a functor, symmetric monoidal for Day convolution because it is a base change.

**Checks.**

- For the h-adic filtration of B=A[q] and m=1, the quotient is A in steps ≤0 and zero in steps ≥1: h:h^(n−1)B→h^nB is an isomorphism for n≥1. The same-index quotient has A in step 1 instead of zero.
- Put B=ℤ[q] and M=B/h in degree zero with constant filtration. Every quotient step is the cofiber of 0:M→M, hence has H⁻¹=M and H⁰=M. Ordinary quotients lose H⁻¹.
- On the same M with trivial filtration, the degree-one quotient is M[1], with H⁻¹=M and H⁰=0; the degree-zero quotient is M⊕M[1]. Treating the filtration as constant would add an unwanted H⁰=M in degree one.

### 2.4 The derived q-de Rham complex, by animation of the global complex on polynomial algebras

Animate the global qΩ functor on finite polynomial A-algebras for a torsion-free Λ-base, taking sifted colimits in h-complete E∞-algebras. Thus `qdR_R=(|qΩ_{P_•/A}|)^∧_h` for a polynomial simplicial resolution, independently of the resolution. Conditional on `gap:unbounded-derived-commutative`, it inherits the derived commutative lift; independently qdR/h≃dR and `(qdR_R)^∧_p≃qdR_{R̂_p/Â_p}`. Its arithmetic pullback uses the prime product, rational dR[[h]] and the rationalization of the prime product, with the uniform-denominator gluing map. Its agreement with qΩ is prescribed on polynomial algebras, rather than on every smooth algebra.

(See QH Paragraph 1.22(b), §1, p.11; Paragraph A.14, §A, p.76.)

This uses HQ.1, EnhancedDerivedSheaves E5:animation, DerivedModuleAlgebra §§1.1–1.4, DerivedDeRhamCohomology §§2.22–2.27, QWittVectors §§2.1–2.4.

Use the following maps and laws:

- A sifted-colimit-preserving functor from animated A-algebras to (q−1)-complete E∞-algebras over A⟦q−1⟧.
- Its restriction to polynomial A-algebras in finitely many variables is `qΩ_{−/A}`.
- For a simplicial polynomial resolution P_• → R, `qdR_{R/A}` is the (q−1)-completed geometric realisation of `qΩ_{P_•/A}`. The colimit is formed before completing, and the result does not depend on the resolution.
- `qdR_{R/A}/(q−1)` ≃ `dR_{R/A}`.
- `(qdR_{R/A})^∧_p` ≃ `qdR_{R̂_p/Â_p}`, the local derived complex.
- The pullback square with the three named corners, for every animated A-algebra.
- It preserves sifted colimits and is the unique such extension of its restriction to polynomial algebras; maps out of it are determined on polynomial algebras.
- It lifts to (q−1)-complete derived commutative A⟦q−1⟧-algebras.
- Functorial in R.

**Checks.**

- For A=ℤ and R=ℤ[x], animation returns the polynomial qΩ model. Its differential sends x² to (2+h)x dx and reduces to 2x dx at h=0; replacing [2]_q by 2 before reduction fails.
- For A=ℚ and R=ℚ×ℚ, qdR has H⁰=ℚ[[h]], whereas qΩ has H⁰=(ℚ×ℚ)[[h]]. A construction that preserved products of these animated unit inputs would give the wrong H⁰.
- For R=ℚ[x,x⁻¹] over ℚ, qdR≃ℚ[[h]] has H¹=0, while qΩ=Ω*[[h]] has H¹=ℚ[[h]] generated by dlog x. This distinguishes animation from Hodge completion on a smooth localization.

### 2.5 Where animation changes the answer, and where it does not

Locally at p, qdR agrees with qΩ on p-completely smooth algebras. Globally animation changes smooth values: for S=ℚ[x^±1], `qdR_{S/ℚ}≃ℚ[[h]]`, whereas `qΩ=Ω^•_{S/ℚ}[[h]]` has nonzero first cohomology. Ordinary Ω is the Hodge completion of derived dR. For smooth S with a chosen q-Hodge pair, qΩ is the corresponding q-Hodge completion of qdR, as proved in HQ.3.

(See QH Paragraph A.14, §A, p.76; §A.1, p.70.)

This uses HQ.2, HQ.1, DerivedDeRhamCohomology §§2.22–2.27.

### 2.6 Base change for the derived q-de Rham complex, with the completion it requires

For a Λ-map A→A′ between prime-by-prime torsion-free bases and any animated R, prove `(qdR_{R/A}⊗^L_A` `A′)^∧_h≃qdR_{R⊗^L_A A′/A′}`. No flatness of A′ is assumed. Both sides preserve the appropriate completed sifted colimits, so extend the polynomial base-change equivalence by animation. Reduction by h is derived de Rham base change. Keep the completed tensor even for R=A.

(See QH Theorem A.1, §A, p.69; Paragraph 1.22(b), §1, p.11.)

This uses HQ.2, HQ.1, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology §§2.22–2.27.

### 2.7 The combined Hodge and (q−1)-adic filtration

Define the combined Hodge/h-adic filtration by the h-completed Day tensor of fil_Hdg dR with h^•ℚ[q]. Its i-th piece is the h-completion of `colim_{a+b≥i}fil_Hdg^a(dR⊗ℚ)⊗h^bℚ[q]`. This is not Hodge completion. The p-completed version uses (dR)^∧_p[1/p] and Â_p[1/p]. Both are constant in degrees ≤0 and exist for every animated R. They are the rational targets of the q-Hodge axioms.

(See QH Definition 3.2(c), §3, p.21; Proposition 3.47(a), §3, p.48.)

This uses DerivedDeRhamCohomology §§2.22–2.27, DerivedModuleAlgebra §§1.1–1.4, HQ.2.

Use the following maps and laws:

- `fil^⋆_{(Hdg,q−1)}(dR_{R/A}` ⊗ ℚ)⟦q−1⟧, a filtered (q−1)^⋆(A ⊗ ℚ)[q]-module, functorial in R.
- The p-completed variant on `((dR_{R/A})^∧_p[1/p])⟦q−1⟧`.
- For n≥0, gr^n ≃ `⊕_{i+j=n, i,j≥0}` `gr^i_Hdg(dR_{R/A}` ⊗ ℚ)·(q−1)^j.
- Its quotient by q−1 in filtration degree one is the rationalised Hodge filtration `fil^⋆_Hdg(dR_{R/A}` ⊗ ℚ).
- In filtration degrees ≤ 0 it is `(dR_{R/A}` ⊗ ℚ)⟦q−1⟧.
- The canonical map from the rational to the p-completed rational variant, natural in R.
- For S smooth over A, the completion of `(dR_{S/A}` ⊗ ℚ)⟦q−1⟧ at this filtration is `(Ω*_{S/A}` ⊗ ℚ)⟦q−1⟧.

**Checks.**

- For R = A the Hodge filtration is A in degree 0 and nothing above, and the combined filtration is the (q−1)-adic filtration on (A ⊗ ℚ)⟦q−1⟧.
- For R = A[x], after filtration completion the n-th step is the subcomplex (q−1)^nA_ℚ[x]⟦q−1⟧ → `(q−1)^{max(n−1,0)}A_ℚ[x]⟦q−1⟧dx` of `(Ω*_{A[x]/A}` ⊗ ℚ)⟦q−1⟧. In particular fil^1 contains dx and q−1 but not 1.
- In this completed polynomial model, it is not the Hodge filtration tensored with the trivial filtration on ℚ⟦q−1⟧. That would give fil^1 = `Ω^{≥1}⟦q−1⟧`, which does not contain q−1; the combined fil^1 does.
- Its quotient by q−1 in filtration degree one is `fil^⋆_Hdg(dR_{R/A}` ⊗ ℚ), as the diagram of Definition 3.2(c) requires.

### 2.8 The rational comparison for the derived q-de Rham complex

The global derived arithmetic square gives a natural E∞-equivalence `(qdR_{R/A}⊗^Lℚ)^∧_h≃(dR_{R/A}⊗^Lℚ)[[h]]`, equal to the canonical identification modulo h, for every animated R over a torsion-free Λ-base. On smooth underived inputs the corresponding statement is the global qΩ rational comparison.

(See QH Definition 3.2, §3, p.20; Theorem A.1(a), §A, p.69.)

This uses HQ.2, HQ.1, DerivedModuleAlgebra §§1.1–1.4.

### 2.9 The p-completed rational comparison for the derived q-de Rham complex

For each prime, identify `((qdR_{R/A})^∧_p[1/p])^∧_h` with `((dR_{R/A})^∧_p[1/p])[[h]]`, using the local rational equivalence and p-completed base change. The sequence is p-completion, inversion of p, then h-completion. The final completion matters: Σ_n p^(−n)h^n is absent from ℤ_p[[h]][1/p]. This is a separate operation from the global rational comparison.

(See QH Remark 1.8, §1, p.5; Lemma A.4, §A, p.70; Definition 3.2, §3, p.20.)

This uses HQ.2, HQ.1, DerivedModuleAlgebra §§1.1–1.4, DerivedDeRhamCohomology §§2.22–2.27.

### 2.10 The two rational comparisons are compatible, and the p-completed one is a separate condition on filtrations

The global and p-completed rational comparisons commute with the maps to the rationalized p-completion and reduce by h to the natural de Rham maps. The unfiltered square follows from the construction. For filtrations, its refinement is an additional axiom (c_p), with coherence. The source leaves open whether this axiom follows from (a)–(c); no result here removes it.

(See QH Remark 1.8, §1, p.5; Definition 3.2, §3, p.20.)

This uses HQ.2, HQ.1.

### 2.11 The decalage functor is imported; the q-specific applications are owned here

Import Lη_f, its cohomology formula and its natural filtration from AI.1, and relative prismatic Frobenius from PrismaticCohomologyPartII §§3.13–3.16. If α≥1 and qΩ is h-complete, [p^α]_q≡p^α mod h identifies its p-completion with [p^α]_q-completion, so `(Lη_{[p^α]_q}qΩ)^∧_p≃Lη_{[p^α]_q}(qΩ)^∧_p`. At α=0 the functor is id. For (B,J)=(Â_p[[h]],[p]_q) and T=S^(p)[ζ_p], transport `Δ_{T/B}⊗̂_{B,φ_B}B≃Lη_JΔ_{T/B}`, where φ_B acts by ψ^p and q↦q^p. The h-décalage application requires a chosen smooth q-Hodge pair. The canonical local décalage filtrations do not automatically glue.

(See QH Paragraph 3.14, §3, p.28; Remark 3.49, §3, p.49.)

This uses AInfCohomology AI.1, PrismaticCohomologyPartII §§3.13–3.16, PrismaticCohomologyPartII §5.13, HQ.2, HQ.1.

### Examples

For the h-adic unit filtration, the degree-one quotient has A in step zero and zero in positive steps. Its degreewise quotient would have A in each positive step. The zero map on ℤ/2 has a two-term cone with ℤ/2 in degrees −1 and 0, so the derived quotient remembers the kernel as well as the cokernel.

### Dependencies

The preceding constructions in this layer and DerivedDeRhamCohomology, EnhancedDerivedSheaves, QWittVectors, PrismaticCohomology, AInfCohomology. The subsection dependencies above specify the exact stages and maps.

## Layer 3: q-de Rham–Witt and Nygaard (HQ.4)

Import QWittVectors §§7.1–7.7, 9.6–9.7 and 10.1–10.2 for the restriction-free differential theory and its smooth comparisons. Construct the additional crystalline identification, twisted complexes, animation and Nygaard theory here before q-Hodge descent.

### 3.3 Why there are no restrictions, and the comparison with ordinary de Rham-Witt that survives

Import QWittVectors §§4.2–4.4 and 5.1–5.2's degree-zero obstruction to restriction maps: for prime-power indices over bases not of characteristic p, a compatible restriction would induce the incompatible cyclotomic quotient map. For the initial differential system, whose degree-zero ring is qW_m(R/A), this rules out a functorial ordinary restriction system on the full coefficient domain. Special differential q-V-systems can admit restrictions; the terminal zero family has unique such maps. For maps of ℤ_(p)-algebras, import CR.4's precise restriction-free initiality of the ordinary Langer–Zink FV-pro-complex; this supplies the comparison below. No inverse limit along ordinary restrictions defines untruncated q-Witt objects here.

(See QW Paragraph 2.14, §2, p.13; Paragraph 3.11, §3, p.40.)

*Needs:* QWittVectors §§3.2–3.3 and 7.1–7.2; CrystallineCohomology CR.4 for restriction-free ordinary initiality.

### 3.6 The comparison map from ordinary de Rham-Witt complexes, compatible with Frobenius and Verschiebung

For a Λ-base that is also a ℤ_(p)-algebra and arbitrary R, use restriction-free ordinary FV initiality to construct `W_{a+1}Ω_{R/A}→qW_{p^a}Ω_{R/A}`, a≥0. Require Frobenius and Verschiebung compatibility with the displayed indexing. The source derives the map using absolute restriction-free initiality; its factorization through the relative ordinary complex still needs a proof that the differential of the image of `W_{a+1}(A)` is killed. This is exactly `gap:relative-witt-factorization`; the relative comparison is conditional on that contract, rather than a consequence of forgetting restriction maps alone. The resulting target is a comparison map, not an isomorphism; ordinary restriction compatibility is absent on the q-side.

(See QW Remark 3.18, §3, p.42.)

*Needs:* QWittVectors §§7.2 and 7.5; CrystallineCohomology CR.4 and `gap:relative-witt-factorization`.

### 3.13 Under the p-complete identification the rescaled Frobenius is the crystalline Frobenius

In degree i put F̃_n=n^iF_n, making a chain map. Under the smooth p-completed qW comparison, identify F̃_p with the relative crystalline Frobenius, retaining its coefficient twist. This identification supplies the right map of the q-Witt arithmetic square.

(See QW Corollary 4.38, §4, p.77 · QH Proposition 3.19, §3, p.31.)

*Needs:* QWittVectors §§7.5 and 9.7; CrystallineCohomology CR.2 and DerivedDeRhamCohomology §4.6.

### 3.12 The arithmetic fracture square of the q-de Rham-Witt complex

For smooth R over perfectly covered A, m≥1 and nonzero N divisible by m, construct the qW_mΩ arithmetic pullback. Its upper-right factors, for p|N and d_p|m_p, are p-completed `Ω⊗^L_{A,ψ^{p^{v_p(m)}d_p}}A[q]/Φ_{d_p}(q^{p^{v_p(m)}})`. Lower-left factors for d|m are `Ω⊗^L_{A,ψ^d}A[1/N,q]/Φ_d(q)`. Lower-right factors for p|N,d|m are the p-completion of `Ω⊗^L_{A,ψ^d}A[q]/Φ_d(q)`, then p-inverted. Left arrows are ghosts and right components are crystalline relative Frobenius iterated v_p(m/d) times. Here m_p,d_p are prime-to-p parts. Construct that Frobenius through crystalline cohomology.

(See QW Corollary 4.37, §4, p.76.)

*Needs:* §3.13 for its crystalline right maps; QWittVectors §§7.6, 9.7 and 10.1–10.2; DerivedDeRhamCohomology §4.6.

**Checks.**

- At A=R=ℤ, p=m=2, C₁=ℤ[q]/(q²−1), the n=d=1 factor is C₁⊗_(C₁)C₁,(2)=C₁,(2), with no negative cohomology. Derived tensor over ℤ[q] instead has Tor₁=C₁,(2), by the regular one-equation resolution.
- At m=1 the complex is ordinary Ω* and the fracture square is its usual arithmetic square; for R=0 all four corners vanish.
- At A=R=ℤ, m=2, the rational ghosts give ℚ×ℚ. Integrally their image consists of pairs congruent modulo 2; (1,0) fails the overlap and V₂(1) has ghosts (2,0).

### 3.14 No functorial q-Hodge complex has the q-de Rham-Witt complexes as functorial cohomology

For perfectly covered A that is not a ℚ-algebra, no functor on all smooth A-algebras to derived h-complete A[[h]]-modules can have functorial isomorphisms H^*(qHdg/^L(q^m−1))≅(qW_mΩ)^∧_h for every m with divisor projections inducing `F_{m/d}`. The candidate is one derived complex functor: all the reductions and divisor projections come from that same functor. The isomorphisms are graded, in every cohomological degree, and the projections must induce the unrescaled Frobenii. An unrelated family of q-Witt modules with Frobenius maps exists and is not excluded by this theorem. A Habiro descent must therefore be a complex with its derived cyclotomic filtration, rather than this family of cohomology groups. This does not contradict descent from chosen pairs.

(See QW Theorem 5.1, §5, p.78 · QH Paragraph 1.10, §1, p.6.)

This uses QWittVectors §§7.2, 7.5 and 9.7, EnhancedDerivedSheaves E5:animation and PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71.

### 3.15 The twisted q-de Rham complexes, glued from decalage twists by the p-adic Frobenii

For smooth S over perfectly covered A, glue the Φ_d(q)-complete pieces `(Lη_{[m/d]_q}qΩ)⊗_{A[q],ψ^d}A[q]`, for d|m, using the relative-Frobenius equivalences of PrismaticCohomologyPartII §3.16 on their p-adic overlaps. Section 0.2 supplies complete descent. The result qΩ^(m) is a (q^m−1)-complete E∞-algebra. Animate on polynomial algebras to get qdR^(m). Construct individual divisor maps `(qΩ^(m))^∧_{q^n−1}→qΩ^(n)` for n|m. They usually fail to be equivalences; their naive limit is not a Habiro descent, except in the étale case. A Λ-structure on A does not extend globally to every étale S, so local Frobenius rather than global Adams on S supplies the gluing.

(See QH Paragraph 3.14, §3, p.28; §3.3, pp.28–31; Paragraph 3.16, §3, p.30; Remark 3.17, §3, p.30.)

*Needs:* §§0.1–0.2, §§1.12–1.14 and §2.11; PrismaticCohomologyPartII §§3.13–3.16 and 5.13–5.21, AInfCohomology AI.1 and EnhancedDerivedSheaves E5:animation.

Use the following maps and laws:

- For smooth S and a positive integer m, the (q^m-1)-complete E-infinity A[q]-algebra glued from the pieces E_d, functorial in S.
- Its Phi_d(q)-completion, for d | m, is the piece E_d: the Phi_d-completed Adams base change of the decalage at [m/d]_q of the q-de Rham complex.
- The arithmetic fracture pullback square.
- For n | m, the map from the (q^n-1)-completion of the m-th complex to the n-th, functorial in S.
- For m = 1 it is the q-de Rham complex.
- For smooth S and m=p^a its p-completion is `(qΩ_{S/A}` `⊗^L_{A[q],ψ^{p^a}}` `A[q])^∧_{(p,h)}`, where `ψ^{p^a}` acts on A and sends q to `q^{p^a}`. The animated version uses `qdR_{R/A}` for animated R.
- The animation, a functor from animated A-algebras to (q^m-1)-complete E-infinity A[q]-algebras, agreeing with qΩ^(m) on polynomial algebras (not on all smooth algebras).

**Checks.**

- For m = 1 the construction returns the q-de Rham complex, since the decalage at [1]_q = 1 is the identity and the only divisor is 1.
- The quotient of the m-th twisted complex by q^m-1 is the m-truncated q-de Rham-Witt complex, and the transition map for d | m induces the rescaled Frobenius.
- For S etale over A the limit over m of the twisted complexes is the relative Habiro ring of S over A (Remark 3.17).
- For A = Z and S = Z[x], the transition map from the (q-1)-completion of the p-th twisted complex to the first is, on the only surviving piece, the canonical map from the decalage at [p]_q of the q-de Rham complex to the q-de Rham complex; its image in H^1 lies in [p]_q times H^1, so it misses the class of `x^{p-1}` dx, which spans a summand Z[[q-1]]/[p]_q. The transition maps are not equivalences, which is why their limit is not a Habiro descent.

### 3.16 The arithmetic fracture square of the twisted q-de Rham complex

For the same smooth S, m and N, exhibit qΩ^(m) as an arithmetic pullback. Upper-right factors for p|N,d_p|m_p are `(p,Φ_{d_p}(q))-completed` qΩ base-changed along `ψ^{p^{v_p(m)}d_p}`. Lower-left factors for d|m are Φ_d-completed qΩ base-changed along ψ^d to A[1/N,q]. Lower-right factors for p|N,d|m are p-completed qΩ base-changed along ψ^d, then p-inverted and Φ_d-completed. The right components are relative Frobenius iterated v_p(m/d) times. The décalage parameters become units in these corners, which must be proved when replacing the original pieces by these simpler ones.

(See QH Lemma 3.15, §3, p.29.)

*Needs:* §3.15, §§0.1–0.2 and the relative Frobenius of PrismaticCohomologyPartII §§3.13–3.16.

### 3.18 The derived q-de Rham-Witt complex and the animated stupid filtration

Animate qW_mΩ and its stupid filtration on polynomial A-algebras to define qW_m dR and fil_Hdg_m on animated inputs. Its i-th graded piece is the animated degree-i form in cohomological degree i, written Σ^(−i)qW_m dR^i. The animated deformation theorem is proved in §3.17 after this construction. Conditional on `gap:filtered-graded-derived-commutative`, the filtered object has a derived commutative structure inherited at the polynomial level; arbitrary animated forms need not be underived modules.

(See QH Theorem 3.11, §3, p.25; §3.5, p.40; §3.8, p.50.)

*Needs:* QWittVectors §7.2 the initial differential q-Witt algebra, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology §§2.22–2.27; its derived-commutative refinement additionally needs `gap:filtered-graded-derived-commutative`.

Use the following maps and laws:

- The derived m-truncated q-de Rham-Witt complex, the animation of the imported initial differential q-Witt algebra.
- The derived forms qW_m dR^n, the animations of qW_m Omega^n.
- The animated stupid filtration `fil_{Hdg_m}` on qWittDR.
- Its n-th graded piece is qW_m dR^n shifted by -n.
- For m = 1, the Hodge filtration on derived de Rham cohomology.
- On polynomial algebras the derived objects are the underived ones.
- The canonical filtered derived commutative A[q]/(q^m-1)-algebra structure.

**Checks.**

- At m=1, A=ℚ and S=ℚ×ℚ, qW₁dR≃ℚ, gr⁰=ℚ×ℚ, and F¹≃ℚ[−1] has H¹=ℚ. The ordinary stupid F¹ is zero, so equality of graded forms cannot identify the uncompleted filtrations.
- At A=S=ℤ and m=p, qW_p dR is ℤ[q]/f_p in degree zero. Its stupid F¹ is zero, whereas Nygaard N¹ in degree zero is im V_p and contains [p]_q≠0. For A=S=0 the element is zero; nonvanishing is asserted only in the ℤ example.
- At m=1 and S=ℤ[x], gr¹ is ℤ[x]dx[−1], with H¹=ℤ[x]dx and H⁰=0. An unshifted form would interchange these two groups.

### 3.17 Reducing the twisted complex modulo q^m-1 gives the q-de Rham-Witt complex

For smooth S over perfectly covered A, prove the canonical E∞-equivalence `qΩ^(m)/(q^m−1)≃qW_mΩ_{S/A}`, natural in S. Check locally by the framed and prismatic formulas and glue with the arithmetic square. Animate to extend the deformation statement to qdR^(m)/(q^m−1)≃qW_m dR. This is a derived reduction.

(See QH Proposition 3.19, §3, p.31.)

*Needs:* §§3.12–3.16, §3.18 for the animated conclusion, QWittVectors §§9.6–9.7 and PrismaticCohomologyPartII §5.21 for the local comparison.

### 3.20 The Nygaard filtration on q-de Rham-Witt complexes

For p prime, a≥1 and smooth S over perfectly covered A, define N^n `qW_{p^a}Ω` in degree i<n by `p^(n−1−i)V_p(qW_{p^{a−1}}Ω^i)`, and in degree i≥n by the full `qW_{p^a}Ω^i`. Verify a subcomplex and descending filtration compatible with products. At n=0 it is the whole complex. At degree zero the first two positive steps are im V_p and p·im V_p.

(See QH Paragraph 3.21, §3, p.32.)

*Needs:* QWittVectors §§7.2–7.6 and 10.1, §3.18 and EnhancedDerivedSheaves E5:animation; smooth agreement of the animated filtration is the theorem of §3.26, and its prismatic comparison is §3.28.

Use the following maps and laws:

- For a prime p, a >= 1 and smooth S, the descending filtration by subcomplexes of `qW_{p^a}` `Omega_{S/A}`.
- Its n-th term in degree i is `p^{n-1-i}` `V_p(qW_{p^{a-1}}` Omega^i) for i < n and `qW_{p^a}` Omega^i for i >= n.
- The zeroth term is the whole complex.
- The n-th stupid term is contained in the n-th Nygaard term.
- The animation on polynomial algebras of the explicit Nygaard filtration; §3.26 proves agreement with the underived filtration on smooth algebras after p-completion.

**Checks.**

- At p=2, a=1 and A=S=ℤ, the ghosts ordered as q=1 and q=−1 send N¹ and N² in degree zero to (2ℤ,0) and (4ℤ,0). Indeed V₂(1)=1+q has ghosts (2,0). Omitting p^(n−1) makes the two images incorrectly equal.
- At p=3 the ghosts at 1 and ζ₃ send these steps to (3ℤ,0) and (9ℤ,0), since [3]_1=3 and [3]_(ζ₃)=0. The stupid first step is zero, so it cannot replace N¹.
- For A=ℤ and S=ℤ×ℤ at p=2, the first two images are two independent copies of (2ℤ,0) and (4ℤ,0). The first contains ((2,0),(0,0)); a diagonal ideal would exclude it. For S=0 every step is zero.

### 3.21 The stupid filtration is the pullback of the Nygaard filtration along the divided Frobenius

For smooth S, a≥1 and n≥0, prove the pullback square with top row fil_stupid^n `qW_{p^a}Ω→N^n` `qW_{p^a}Ω` and bottom row fil_stupid^n `qW_{p^{a−1}}Ω→qW_{p^{a−1}}Ω`. The right map is p^(−n)F̃_p. The stupid step is brutal truncation in form degrees ≥n. This square identifies the explicit Nygaard filtration by the divided-Frobenius condition in the derived category of A[q].

(See QH Lemma 3.30, §3, p.40.)

*Needs:* §3.20, QWittVectors §§7.5 and 10.1.

### 3.22 The prismatic Nygaard filtration on the p-completed twisted q-de Rham complexes

Define prismatic Nygaard on (qΩ^(p))^∧_p as the preimage of the canonical décalage filtration along relative Frobenius. For a≥2 pull it back along φ^(a−1) to (qΩ^(p^a))^∧_p. Animate and use quasisyntomic descent. The owner of the Frobenius-divisibility construction is PrismaticCohomologyPartII §3.14; no trace comparison defines this filtration. In a static realization, identify both rings and the map with the actual relative Frobenius before taking its ordinary ideal preimage. A realization of the filtration diagram alone does not identify that ring map. In the explicit root-adjoined quotient example below, the monomials are the canonical q-divided-power generators of the completed q-PD model, not freely chosen elements.

(See QH Paragraph 3.20, §3, p.32.)

*Needs:* §3.15, §2.11, PrismaticCohomologyPartII §§3.13–3.16 and 5.13–5.21 and AInfCohomology AI.1.

Use the following maps and laws:

- The prismatic Nygaard filtration on the p-completed p^a-th twisted complex, a >= 1.
- For a = 1 it is the preimage of the decalage filtration under the relative Frobenius.
- For a >= 2 it is the pullback along `phi^{a-1}` of the a = 1 filtration.
- A filtered E-infinity algebra over `Phi_{p^a}(q)^*` A[q], hence over `(q^{p^a}-1)^*` A[q].
- Its animation to animated A-algebras.

**Checks.**

- At A=S=ℤ and a=1, identify the twisted degree-zero unit with B=ℤ_p[[h]] by 1⊗b↦b. The linearized relative Frobenius to Lη_(Φ_p)B=B is the identity in this identification; it is not the absolute substitution q↦qᵖ. Thus N⁰=B, N¹=Φ_p(q)B and N²=Φ_p(q)²B. In particular 1∉N¹.
- For R=(ℤ_p[x^(1/p^r):r≥0]/(x))^∧_p over A=ℤ, in its canonical completed q-PD model, the completed monomial xⁱ/[⌊i⌋]_(qᵖ)! has coefficient ideal Φ_p(q)^max(n−⌊i⌋,0) in Nⁿ (QH, proof of Lemma 3.29, p.39, QH lines 1719–1729). At n=1 and i=0,1/p,1,2 the exponents are 1,1,0,0; at n=2 they are 2,2,1,0. The input uses ordinary polynomial roots followed by p-completion, not a divided-power polynomial algebra. The envelope generator x is nonzero although x=0 in R.
- The envelope generator x at i=1 belongs to N¹ without a Φ_p factor, while 1 at i=0 requires that factor. Thus this Nygaard filtration is not the Φ_p-adic filtration on that envelope. For the zero algebra all steps vanish.

### 3.23 The divided Frobenius on the Nygaard graded pieces

For a≥1,n≥0, F̃_p on N^n `qW_{p^a}Ω` is divisible by p^n. Its divided map on gr_N^n targets `τ^{≤n}(qW_{p^{a−1}}Ω/p)`, is surjective in degree n and an isomorphism in every other degree. Smoothness and the degreewise torsion theorem justify the division.

(See QH Lemma 3.23, §3, p.32.)

*Needs:* §3.20, QWittVectors §§9.6 and 10.1.

### 3.24 The kernel of the Frobenius on q-de Rham-Witt forms

For smooth S and a≥1, identify `ker(F_p:qW_{p^a}Ω^n→qW_{p^{a−1}}Ω^n)` with `Ω^n⊗_{A,φ^a}A[ζ_{p^a}]`. The same module identifies the kernel of the induced map `qW_{p^a}Ω^n/im` `V_p→qW_{p^{a−1}}Ω^n/p`. Preserve the coefficient Frobenius twist and cyclotomic quotient.

(See QH Lemma 3.24, §3, p.33.)

*Needs:* §3.20, QWittVectors §§7.6 and 9.6.

### 3.25 The Nygaard graded pieces sit in a cofibre sequence with the conjugate filtration

For animated R,a≥1,n≥0, the divided Frobenius from `gr_N^n(qW_{p^a}dR)^∧_p` targets `fil_n^conj(dR/p)⊗^L_{A,φ^{a−1}}A[q]/(q^{p^{a−1}}−1)`. Its fiber is `(dR^n⊗^L_{A,φ^a}A[ζ_{p^a}])[−n]`, with the p-completions implicit in this local statement. The conjugate filtration is the animation of `τ^{≤n}(Ω/p)`. There is no a=0 formula with an index p^(−1).

(See QH Corollary 3.25, §3, p.34.)

*Needs:* §3.20 and §§3.23–3.24; DerivedDeRhamCohomology §§2.22–2.27.

### 3.26 The animated Nygaard filtration satisfies quasi-syntomic descent and agrees with the underived one on smooth inputs

The p-completed animated Nygaard filtration on `qW_{p^a}dR` satisfies quasisyntomic descent and agrees with the p-completed explicit underived filtration on smooth S, a≥1. Prove the latter by descent and the preceding graded fiber sequences, rather than by omitting the animated construction.

(See QH Corollary 3.26, §3, p.35.)

*Needs:* §3.20, §3.25, DerivedDeRhamCohomology §§2.22–2.27 and PrismaticCohomology §§2.1–2.4 and 2.17.

### 3.27 The fibre sequence for the prismatic Nygaard filtration modulo `q^{p^a}-1`

Reduce the prismatic Nygaard filtration on p-completed qdR^(p^a) by `q^{p^a}−1` in filtration degree one, a≥1. Its n-th graded divided Frobenius has the same conjugate target as the q-Witt Nygaard sequence and fiber `(dR^n⊗^L_{A,φ^a}A[ζ_{p^a}])[−n]`, p-completed. Supply the specified fiber inclusion and its compatibility with the cyclotomic comparison.

(See QH Lemma 3.27, §3, p.35.)

*Needs:* §3.22, §3.25, §2.3 and PrismaticCohomology §2.17 and PrismaticCohomologyPartII §§3.13–3.16.

### 3.28 The Nygaard filtration of the twisted complex reduces to the Nygaard filtration of the q-de Rham-Witt complex

Prove the unique natural filtered E∞-equivalence `(N^•(qΩ^(p^a))^∧_p)/(q^{p^a}−1)≃N^•(qW_{p^a}Ω)^∧_p`, recovering the deformation equivalence at degree zero; extend by animation. Hypotheses are perfectly covered A, smooth S in the underived version and a≥1. The filtered quotient uses the shifted source step, rather than degreewise reduction.

(See QH Proposition 3.22, §3, p.32; Lemma 3.52, §3, p.50.)

*Needs:* §3.17, §3.20, §3.22 and §§3.25–3.27; PrismaticCohomologyPartII §§3.13–3.16 and PerfectoidSpaces §P4.15.2.

Construct also the inverse comparison, with exactly the preceding smooth, a≥1 and p-completion hypotheses and the same degree-one filtered quotient. This is a local application target here, not an extra field of the imported differential q-Witt object.

### 3.19 On smooth algebras the derived q-de Rham-Witt forms are the shifted underived forms

For smooth S, identify the animated unshifted degree-i q-Witt form with qW_mΩ^i, hence gr^i=qW_mΩ^i[−i]. This identifies associated graded pieces, not the entire uncompleted filtered complex. At A=ℚ, S=ℚ×ℚ and m=1, dR≃ℚ but Ω*=ℚ×ℚ. The first derived Hodge step is fib(ℚ→ℚ×ℚ)≃ℚ[−1], whereas the first stupid step of Ω* is zero. Completion hypotheses remain necessary. Record the form separately from its shifted graded piece to avoid counting the shift twice.

(See QH Corollary 3.31, §3, p.40.)

*Needs:* §3.18 and §§3.21–3.28, QWittVectors §9.7 and DerivedDeRhamCohomology §§2.22–2.27.

### 3.29 After inverting p the Nygaard filtration is the combined Hodge and cyclotomic-adic filtration

For animated R, p-invert and Φ_p-complete the prismatic Nygaard filtration on the p-completed p-th twisted qdR. Identify it uniquely with the combined Hodge/Φ_p-adic filtration of p-completed dR base-changed along φ. This is a filtered E∞-equivalence after the specified operations, and supplies the rational agreement used in twisted q-Hodge gluing.

(See QH Lemma 3.29, §3, p.38.)

*Needs:* §3.22, §3.28, §2.7, §§1.4 and 1.7; PrismaticCohomologyPartII §§3.13–3.16.

### 3.30 Multiplicative structure is carried, never created

Track multiplicative structures through the local pieces, lax monoidal décalage, completed Adams base change and enhanced gluing. The twisted smooth qΩ objects are E∞-algebras. The animated stupid filtration has a filtered derived commutative structure. The Nygaard comparisons and rational filtration comparisons have corresponding derived commutative refinements conditional on `gap:unbounded-derived-commutative` and `gap:filtered-graded-derived-commutative`; their enhanced proofs are targets here. Descent carries structures on pairs; it supplies no unconditional E∞-structure on every smooth scheme's Habiro cohomology.

(See QH §3.8, p.50; Lemma 3.52, §3, p.50; Paragraph 1.17(c), §1, p.9.)

*Needs:* §§3.15–3.29, EnhancedDerivedSheaves E5 and the declared unbounded and filtered/graded derived-commutative gaps.

### 3.31 Uncompleted framed Habiro Koszul complex

For perfectly covered A and an étale framing A[x]→S, apply §0.3 to the toric Λ-base A[x], with ψ^m(x_i)=x_i^m, and write `H_{S/A[x]}=E(S/A[x])`. Polynomial and Laurent rank-one extensions preserve perfect coverage by QWittVectors §§2.1–2.4. Construct coordinate scaling directly on §0.2's complete cyclotomic diagram. On its d-th reduced piece `(S⊗_{A[x],ψ^d}A[x])[q]/Φ_d`, let γ_i act identically on S and send the base coordinate x_i to qx_i, fixing the other coordinates and q. This is well-defined because q^d=1 in the reduced piece. All complete pieces already invert q, so work over `A[x,q^{±1}]` for this semilinear coefficient automorphism. Formal étale lifting gives a unique automorphism on the Φ_d-complete lift. Prove compatibility with the actual p-primary Frobenius overlap maps and descend by §0.2's semilinear naturality; the inverse uses q⁻¹. This constructs the scaling without a rootwise Taylor theorem.

For polynomial coordinates prove (γ_i−id)H⊂x_iH and x_i-regularity using the flat étale pieces and their coherent descent before dividing; for Laurent coordinates x_i is a unit. Define D̃_i=(γ_i−id)/x_i and prove the divided operators commute. Form the uncompleted Koszul complex K(H;D̃_i), with no division by h. On a toric framing rescale to K(H;γ_i−id). The comparison to the cohomological Habiro–Hodge object is the separate target §4.17a; this complex uses no chosen filtration or Habiro–Hodge descent.

(See QH Example 3.12, §3.2, pp.25–26, especially the coefficient-scaling construction on p.26; Corollary 3.13, §3.2, p.27.)

This uses §§0.2–0.3, QWittVectors §§2.1–2.4, HQ.1 and AInfCohomology AI.1.

Use the following maps and laws:

- Koszul complex on E(S/A[x]) and the constructed divided commuting scaling operators.
- Lifted scaling automorphisms compatible with the complete cyclotomic diagram and its Frobenius overlaps.
- x_i D̃_i(f)=γ_i(f)−f, with uniqueness conditional on x_i-regularity.
- For Laurent coordinates compare K(D̃_i) with K(γ_i−id) by an invertible basis change.

**Checks.**

- The empty-frame complex is `H_{S/A}` in degree zero.
- For a coordinate x_i, D̃_i(x_i^n)=(q^n−1)x_i^(n−1), with no q−1 denominator.
- In rank one multiplication by x on degree one intertwines D̃ and γ−id; use the corresponding wedge factors in higher rank.
- The carrier remains the full relative Habiro ring; substituting its q−1 completion silently discards other cyclotomic directions.

### Examples

For S=A=ℤ, qW_mΩ is concentrated in degree zero and is ℤ[q]/(q^m−1). At m=p, N¹ in degree zero contains [p]_q whereas the first stupid step is zero. The rescaled Frobenius p^iF_p commutes with the differential; F_p alone does not.

### Dependencies

The preceding constructions in this layer and Layer 0, QWittVectors, CrystallineCohomology, DerivedDeRhamCohomology, PrismaticCohomology, EnhancedDerivedSheaves, AInfCohomology, PerfectoidQuotients. The subsection dependencies above specify the exact stages and maps.

## Layer 4: Chosen q-Hodge pairs and Habiro descent (HQ.3)

A pair includes the filtration and its coherent comparisons. The twisted q-Witt and Nygaard interfaces used in its construction are supplied by HQ.4; their independent construction precedes this layer. No canonical choice of pair is assumed here.

### 4.1 q-Hodge filtrations: the four conditions and the coherences between them

For perfectly covered Λ-ring A and animated R, a q-Hodge pair consists of a descending h^•A[q]-module F, constant in degrees ≤0, with (a) F^0≃qdR; (b) F/β≃fil_Hdg dR; (c) (F⊗ℚ)^∧_h≃fil_(Hdg,h)(dR⊗ℚ)[[h]]; and (c_p), for every p, (F^∧_p[1/p])^∧_h≃fil_(Hdg,h)((dR)^∧_p[1/p])[[h]]. Each equivalence agrees in degrees ≤0 with the previously defined unfiltered comparison. Include the square between (b) and (c), the squares linking (c_p) with (b) and (c), and the compatibility between those squares as higher data. Clause (c_p) is retained independently. Define the enhanced category of pairs by iterated pullbacks, with forgetful functor to animated A-algebras.

(See QH Definition 3.2, §3, p.20; Definition 3.2(b), §3, p.20; Remark 1.8, §1, p.5.)

This uses HQ.2, DerivedDeRhamCohomology §§2.22–2.27, DerivedModuleAlgebra §§1.1–1.4, HQ.1.

Use the following maps and laws:

- The data of a q-Hodge filtration on the derived q-de Rham complex of an animated A-algebra: a filtered (q-1)^* A[q]-module with the equivalences c_0, `c_{(q-1)}`, c_Q, `c_{Q_p}` and all the coherences of Definition 3.2.
- Clause (a): the equivalence from the derived q-de Rham complex onto the zeroth step.
- Clause (b): the equivalence `c_{(q-1)}` from the filtered quotient by q-1 onto the Hodge filtration of derived de Rham cohomology, agreeing in degrees at most zero with the unfiltered one.
- Clause (c): the equivalence c_Q with the combined Hodge and (q-1)-adic filtration after (q-1)-completed rationalisation, with its square against `c_{(q-1)}`.
- Clause (c_p): the equivalence `c_{Q_p}`, with its squares against c_Q and `c_{(q-1)}` and the compatibility between them.
- The category of pairs (R, q-Hodge filtration), as an iterated pullback of animated A-algebras and categories of filtered modules, with the forgetful functor its forgetful functor to animated A-algebras.
- The forgetful functor to filtered h^•A[q]-modules. A chosen filtration need not be filtration-complete; its completion is a separate construction.
- For smooth S, a filtration of the underived q-de Rham complex satisfying the analogues of (a) to (c_p) pulls back along the map from the derived complex to a q-Hodge filtration (Remark 3.6).
- Over a Q-algebra A the combined Hodge and (q-1)-adic filtration, transported along the rational comparison, is a q-Hodge filtration.

**Checks.**

- For A=R=ℤ, the unit filtration is F^n=h^max(n,0)B with B=ℤ[[h]]. Its degree-one filtered quotient is ℤ in step 0 and zero in positive steps; a same-index quotient would have ℤ in step 1.
- For the rational pair on R=ℚ×ℚ over A=ℚ, qdR=ℚ[[h]] and qΩ=ℚ²[[h]]. The uncompleted step F¹ has H⁰=hℚ[[h]] and H¹=ℚ[[h]]/h. The degree-one filtered reduction has first step ℚ[−1], rather than a static zero module.
- The naive pullback of the Hodge filtration on the unit qΩ has F²=hB, whereas clause (b) requires F²=h²B. Its positive filtered quotient is nonzero, so it is not a q-Hodge pair.

### 4.2 The forgetful functor is not essentially surjective, so it has no section

When perfectly covered A is not a ℚ-algebra, that forgetful functor is not essentially surjective on all animated algebras. Its restriction over all smooth algebras has no functorial section, since such a section could be animated. This does not assert failure of essential surjectivity on smooth objects. Choose p with Â_p≠0 and use the quotient by the generator of the free p-complete perfect δ-ring. The obstruction uses clauses (b) and (c_p), not just (a)–(c).

(See QH Lemma 3.3, §3, p.22.)

This uses HQ.3, EnhancedDerivedSheaves E5:animation.

### 4.3 The q-divided power of the witness cannot be corrected into the p-th step

Fix p with Â_p≠0 and B=Â_p{x}_∞, the free p-complete perfect δ-ring on the universal generator x. For its exponent-one quotient R=B/(x), the local qdR is its static completed q-PD envelope. No lift of the ordinary divided power x^p/p can lie in the p-th step prescribed rationally by (x,h)^p. The qdR carrier is B[[h]]{φ(x)/[p]_q}^∧_(p,h), identified with the universal q-PD envelope of (x), and its ordinary counterpart is the p-complete PD envelope. The generator x remains an element of these envelopes, although its image in R is zero. Nonmembership is in the completed rational ideal (x,h)^p for this specific generator, not for a freely chosen element. The calculation also applies before perfection to ℤ_p{x}/x. Thus clauses (b) and (c_p) cannot both hold for this witness. An exponent at least two changes the calculation and is treated separately in HQ.5.

(See QH Lemma 3.3, §3, p.22; Example 4.24, §4, p.63.)

This uses HQ.3, HQ.2, PrismaticCohomology §§0.55, 0.63 and 0.69–0.71, PrismaticCohomologyPartII §§5.7–5.8, DerivedDeRhamCohomology §§2.22–2.27.

### 4.4 The q-Hodge complex, as the completed colimit of the filtration along multiplication by q-1

For a pair (R,F), define qHdg(R,F)=(colim(F^0 —h→ F^1 —h→ F^2→⋯))^∧_h. The colimit is formed before completion. Replacing F by its filtration completion leaves this modification unchanged because elements of F^i acquire division by h^i. For smooth S, a filtration on qΩ satisfying the four underived comparison conditions pulls back along qdR→qΩ to a pair, and computes the same qHdg. This uses Ω as the Hodge completion of dR; it does not identify the two original filtrations.

(See QH Paragraph 3.5, §3, p.22; Remark 3.6, §3, p.22.)

This uses HQ.3, HQ.2, DerivedDeRhamCohomology §§2.22–2.27.

Use the following maps and laws:

- For a pair, the (q-1)-complete A[q]-module given by the completed colimit along multiplication by q-1.
- The construction is unchanged when the filtration is replaced by its completion.
- A functor from the category of pairs to (q-1)-complete A[q]-modules, with map_id and map_comp.
- For smooth S and a filtration of the underived complex satisfying the analogues of the clauses, the q-Hodge complex of the pulled-back filtration is the colimit computed on the underived filtration.
- Its reduction modulo q-1 carries the conjugate filtration.
- For a framed smooth algebra with the coordinate filtration, it is the q-difference complex with every differential multiplied by q-1.

**Checks.**

- For the unit pair, identify F^n=h^nB with B. The transition h:F^n→F^(n+1) becomes id_B, so the colimit and its completion are B. A zero-transition colimit gives zero instead.
- For S=ℚ×ℚ with its rational pair, the completed modification has H⁰=ℚ²[[h]], while qdR has H⁰=ℚ[[h]]. Modifying only the zeroth step misses an idempotent.
- On the coordinate pair of A[x], the linear summand is [B x —h→ B dx], whose H¹ is B/h. The unmodified qΩ summand has differential 1 and H¹=0. For the quadratic monomial the modified differential is (q²−1)x dx, including zero at q=1.

### 4.5 The category of pairs is symmetric monoidal and the q-Hodge complex functor is monoidal

Equip pairs with completed Day tensor over h^•A[q], underlying derived tensor of algebras over A. Prove that qHdg is symmetric monoidal, with its h-completed target tensor. The construction initially gives lax maps; reduction by h and complete conservativity prove they are equivalences. Coherent rational and p-rational data are carried through the tensor product.

(See QH Proposition 3.7, §3, p.23.)

This uses HQ.3, DerivedModuleAlgebra §§1.1–1.4, DerivedDeRhamCohomology §§2.22–2.27.

### 4.6 The conjugate filtration on the q-Hodge complex modulo q-1, and its associated graded

The modification diagram is bifiltered: its colimit direction is ascending and its original filtration direction is descending. Passing to descending associated graded gives an exhaustive ascending conjugate filtration on qHdg/h, whose graded pieces identify with gr_Hdg dR, namely the shifted derived de Rham forms. Do not exchange the two directions or infer qHdg/h≃dR as unfiltered objects.

(See QH Paragraph 3.8, §3, p.23; Lemma 3.9, §3, p.23.)

This uses HQ.3, HQ.2.

Use the following maps and laws:

- The exhaustive ascending filtration on the reduction of the q-Hodge complex modulo q-1, given by the colimit of the Hodge-graded pieces along multiplication by q-1.
- Its n-th graded piece is the n-th derived de Rham form shifted by -n, equivalently the n-th Hodge graded piece of derived de Rham cohomology.
- Its colimit is the whole reduction modulo q-1.
- The zeroth step is the zeroth Hodge graded piece, which is R.
- A lax symmetric monoidal structure compatible with the one on the reduction modulo q-1, whose associated graded is the symmetric monoidal Hodge-graded de Rham functor.

**Checks.**

- For the unit A over itself, gr⁰=A and all positive conjugate graded pieces vanish; a repeated copy of A in gr¹ is incorrect.
- For S=ℤ[x,y], the conjugate graded pieces are S, S²[−1], S[−2] in indices 0,1,2 and zero in index 3. The two one-forms satisfy dx∧dy=−dy∧dx; replacing the degree-one interchange sign by + gives 2dx∧dy≠0.
- For S=ℤ[x] with the coordinate pair, H¹(qHdg/h)=ℤ[x]dx because its differential is zero. Ordinary de Rham instead has H¹=⊕_(n≥1)ℤ/n. Thus the associated-graded identification cannot identify the underlying qHdg/h with dR.

### 4.7 One graded lemma produces both the conjugate filtration and the q-Witt filtration

For any graded A[β,t]-module M with |β|=1 and |t|=−1, give the degree-zero object (M[1/β]/(βt))_0 an exhaustive ascending filtration with associated graded M/(β,t). Filter the β-localization by its successive powers and transport along base change. No connectivity or completeness is assumed. With q in degree zero and βt=q^m−1, the same argument constructs the q-Witt filtration.

(See QH Lemma 3.10, §3, p.24.)

This uses HQ.2.

**Checks.**

- Take M=ℤ[β,t]. The degree-zero reduction after β-inversion is ℤ, and the associated graded has ℤ only in index zero, since M/(β,t)=ℤ. Repeating that copy in each index is incorrect.
- With the grading shift that puts the generator of M in degree one, its surviving graded copy is ℤ in filtration index one. Putting it in index −1 reverses the ascending convention.
- Take M=ℤ[β,t]/β, with the quotient derived. β-localization is zero. The derived quotient by (β,t) has ℤ in internal degree zero and ℤ[1] in internal degree one; the resulting ascending filtration has zeroth term ℤ and first term zero, so its colimit is zero. Replacing the derived quotients by ordinary ones would instead predict a surviving copy of ℤ.

### 4.8 The framed q-Hodge filtration and its explicit Koszul model

For smooth S with étale framing, use the filtration whose i-th step in form degree j is h^max(i−j,0)Ω^j[[h]], pulled back from the framed qΩ model to qdR. Construct all four comparison data to obtain a pair. Its qHdg is the coordinate Koszul complex with differential hD_i. The toric Adams operations are ψ^m(x_i)=x_i^m. The pair has an E_0-structure; stronger commutative structure needs additional input. Comparison with HQ.4's uncompleted framed Habiro Koszul complex is a separate source assertion without a supplied proof, and remains an open target.

Now let the base be a Λ-ring R that is flat over ℤ, so A=R, and let the framing R[x_1,…,x_d]→S be a formally étale map of Λ-rings with every x_i of rank one. Then the coordinate q-Hodge complex `(Ω^•_{S/R}⟦q−1⟧,(q−1)∇_q)` is quasi-isomorphic, by an R⟦q−1⟧-linear zigzag, to Pridham's completed q-cohomology of S as a Λ-algebra over R. That cohomology is built from q-stratifications by flat (q−1)-complete Λ-rings and is functorial in Λ-maps over R. Its décalage `Lη_{q−1}` is the coordinate q-de Rham complex, and both reductions modulo q−1 are independent of the framing. Record this as the framed Λ-compatible comparison. It is the first appearance of the coordinate q-Hodge complex, which QH credits to Pridham. Pridham's functoriality is for Λ-maps between Λ-algebras with rank-one framings, so it does not conflict with §3.14, which concerns functors on all smooth algebras.

(See QH Example 3.12, §3.2, pp.25–26; Paragraph 1.10, §1, p.6 · Pridham Theorem 1.23, §1.3, p.9; Theorem 1.17, §1.2, p.7, for polynomial rings.)

*Needs:* §1.14, §2.7, §§4.1 and 4.4, and QWittVectors §§8.1–8.3; the separate uncompleted comparison is §4.17a.

Use the following maps and laws:

- The complete coordinate filtration in form degree j and step i is h^max(i−j,0)Ω^j⟦h⟧, with its actual inclusion maps and h-action.
- Its derived pullback to qdR has all four comparison data of §4.1, and its completed modification has differential hD_i.
- For flat Λ-bases and formally étale rank-one Λ-framings as above, construct the stated comparison zigzag with Pridham's q-stratification cohomology, natural for those Λ-maps, and its décalage and reduction compatibilities.

**Checks.**

- On ℤ[x], the first completed step is [hℤ[x]⟦h⟧→ℤ[x]⟦h⟧dx]. It contains h and dx, but excludes 1; a filtration with h in every positive step fails the second step.
- The linear summand of its modification is [ℤ⟦h⟧x —h→ ℤ⟦h⟧dx]. Its first cohomology is ℤ⟦h⟧/h, whereas décalage gives the differential 1 and zero first cohomology. This distinguishes the q-Hodge and q-de Rham models.
- With an empty frame the completed filtration is h^max(i,0)A⟦h⟧. For A=ℚ and the étale algebra ℚ×ℚ the pair still has zeroth term ℚ⟦h⟧ before filtration completion, whereas its completion is ℚ²⟦h⟧; using the completed coordinate model as the animated pair loses this distinction.

### 4.9 The p-adic twisted q-Hodge filtration, by recursion on the exponent

For a pair and fixed p, construct the twisted q-Hodge filtration at index p^a recursively. At a=0 use F^∧_p. At a≥1 pull back the Nygaard filtration via relative Frobenius against the previous filtration rescaled by `Φ_{p^a}(q)` and the cyclotomic-adic filtration. Rescaling sends the graded transition parameter t to `Φ_{p^a}(q)t` and is only lax monoidal. The result is a `(q^{p^a}−1)^•A[q]-module`, with filtered reduction the animated stupid filtration on `qW_{p^a}dR`. Supply the Frobenius-compatible transitions to a−1 and their multiplicative naturality, using quasisyntomic descent to the ideal-valued case.

(See QH Paragraph 3.32, §3, p.41; Remark 3.33, §3, p.41; Paragraph 3.34, §3, p.41; Paragraph 3.35, §3, p.42.)

*Needs:* §4.1, §3.22, §3.28, §3.29 and the rescaling convention of §2.1.

Use the following maps and laws:

- For a prime p and a >= 0, the filtration on the p-completed twisted derived q-de Rham complex of index p^a.
- For a = 0 it is the p-completed given q-Hodge filtration.
- For a >= 1 it is the pullback of the prismatic Nygaard filtration and the `Phi_{p^a}(q)-rescaled` filtration of index `p^{a-1}`.
- The rescaling of a filtration by a polynomial f, restriction along t -> f t; lax symmetric monoidal.
- Its reduction modulo `q^{p^a}-1` is the p-completed animated stupid filtration on `qW_{p^a}` dR.
- The canonical map to the filtration of index `p^{a-1}`, compatible with the relative Frobenius; compatibility with the lax symmetric monoidal structures.
- The lax symmetric monoidal structure in the pair.
- After inverting p and completing at `Phi_{p^a}(q)` it is the combined Hodge and `Phi_{p^a}(q)-adic` filtration.

**Checks.**

- For A=R=ℤ, p=2 and index 2, write f₂=q²−1. The unit's twisted steps are F¹=f₂B and F²=f₂²B in the completed coefficient ring B; the positive degree-one filtered reduction is zero. Nygaard N¹ instead reduces to the nonzero class [2]_q, so it is the wrong filtration here.
- For the trivial unit filtration over ℤ[q], rescaling by Φ₂=q+1 changes F⁰→F⁻¹ from id to multiplication by q+1. Its value on 1 is q+1, a nonunit; rescaling is not strong monoidal.
- On the unit at index 1 over ℚ₂, the completed rational first step is hℚ₂[[h]]. At index 2 near q=−1 it is (q+1)ℚ₂[[q+1]], with quotient ℚ₂. Keeping the h-adic ideal at that second point would make it the whole ring because h=−2+(q+1) is a unit there.

### 4.10 After inverting p the p-adic twisted q-Hodge filtration is the combined Hodge and cyclotomic-adic filtration

For a≥0, after p-inversion and `Φ_{p^a}(q)-completion`, identify the p-adic twisted q-Hodge filtration with the combined Hodge/cyclotomic-adic filtration of p-completed dR base-changed along `ψ^{p^a}`. Preserve the rational comparison. At a=0 this is exactly clause (c_p), which starts the induction.

(See QH Lemma 3.36, §3, p.42.)

This uses HQ.3, HQ.4.

### 4.11 At lower cyclotomic points the p-adic twisted q-Hodge filtrations of successive indices agree

For a≥1 and 0≤i≤a−1, the transition from index p^a to `p^{a−1}` becomes a filtered equivalence after p-inversion and completion at `Φ_{p^i}(q)`. There is no integral transition equivalence asserted before those operations.

(See QH Lemma 3.37, §3, p.42.)

This uses HQ.3, HQ.4.

### 4.12 The global twisted q-Hodge filtration, glued along a fracture square

For m≥1 choose a nonzero multiple N of m and filter the arithmetic fracture square of the m-th twisted complex. On N-inverted cyclotomic factors and p-completed p-inverted factors use the Adams-base-changed pair filtration. On the `(p,Φ_{d_p})-complete` factors use the prime-power recursion of index `p^{v_p(m)}`, then base-change along `ψ^{d_p}`. The p-rational agreements use clause (c_p) and the two prime-power compatibility lemmas. Prove independence under enlarging N; a cofinal factorial sequence gives a canonical functorial lax monoidal construction. Construct the divisor transitions n|m with their Frobenius compatibilities. For every finite divisor chain, use a common arithmetic fracture diagram and the enhanced pullback functor to supply the composition and higher coherence of §4.28. A factorial chain suffices to compute the eventual limit, but does not replace the coherent divisor diagram exported to consumers.

(See QH Paragraph 3.38, §3, p.42; Paragraph 3.41, §3, p.44.)

This uses HQ.3, HQ.4.

Use the following maps and laws:

- For each positive integer m, a filtration on the m-th twisted derived q-de Rham complex, functorial in the pair.
- Its restrictions are the prime-power recursive filtrations on `(p,Φ_{d_p})-complete` factors, the Adams-base-changed given filtrations on N-inverted cyclotomic factors, and their p-completed, p-inverted cyclotomic-complete versions on the overlap factors.
- The construction does not depend on the auxiliary integer N.
- Its reduction modulo q^m-1 is the animated stupid filtration on qW_m dR.
- For n | m, the canonical map to the filtration of index n; the transition is compatible with the lax symmetric monoidal structures.
- The lax symmetric monoidal structure in the pair.
- For m = 1 it is the given q-Hodge filtration.

**Checks.**

- For A=R=ℚ and m=2, the completed unit coefficient ring is ℚ[[q−1]]×ℚ[[q+1]], with n-th step ((q−1)^n,(q+1)^n) for n≥0. A single h-adic factor loses the second idempotent.
- For the same unit at m=6 there are exactly four rational factors, indexed 1,2,3,6. At d=3 and d=6 they are ℚ(ζ₃)[[Φ₃]] and ℚ(ζ₆)[[Φ₆]], with first ideals (Φ₃) and (Φ₆). Repeating factors along prime chains gives the wrong four idempotents.
- For S=ℚ[x] and m=1, in the completed coordinate model the first step is [hS[[h]]→S[[h]]dx]. It contains h and dx but excludes 1. The ordinary Hodge first step excludes h, while the constant filtration includes 1.

### 4.13 The twisted q-Hodge filtration reduces modulo q^m-1 to the stupid filtration on the derived q-de Rham-Witt complex

For every pair and m≥1, refine qdR^(m)/(q^m−1)≃qW_m dR to an equivalence F_m/β_m≃fil_Hdg_m qW_m dR of filtered A[q]/(q^m−1)-modules. It is natural and lax symmetric monoidal. For an E_n-pair it respects filtered E_n-structures. The quotient places q^m−1 in degree one.

(See QH Proposition 3.39, §3, p.44; Remark 3.40, §3, p.44.)

This uses HQ.3, HQ.4, HQ.2.

### 4.14 Adjoining the twisted filtration divided by powers of q^m-1, and its compatibility in m

Define the m-th partial modification T_m as the (q^m−1)-completion of colim_i(F_m^i —(q^m−1)→ `F_m^{i+1})`. It formally adjoins F_m^i/(q^m−1)^i, and is lax monoidal. At m=1 this is qHdg. Completion follows the colimit; compatibility at divisors is a theorem rather than part of the definition.

(See QH Paragraph 3.42, §3, p.45; Paragraph 3.45, §3, p.47.)

This uses HQ.3.

Use the following maps and laws:

- For each positive integer m, the (q^m-1)-complete A[q]-module obtained as the completed colimit of the twisted q-Hodge filtration along q^m-1, functorial in the pair.
- For m = 1 it is the q-Hodge complex.
- The lax symmetric monoidal structure in the pair.
- For n | m, the (q^n-1)-completion of the m-th partial descent is the n-th.
- Its reduction modulo q^m-1 is the colimit of the graded pieces of the twisted q-Hodge filtration along q^m-1, an exhaustive ascending filtration.

**Checks.**

- For the unit over ℚ at m=2, modification identifies every normalized transition with id on each factor, giving T₂=ℚ[[q−1]]×ℚ[[q+1]]. An unglued repetition of the 2-primary chain gives an extra factor.
- Completing this T₂ at h kills the q=−1 factor because h has constant term −2 there, and returns T₁=ℚ[[h]]. Keeping both factors after h-completion is incorrect.
- For S=ℚ[x] with its coordinate pair at m=1, the linear summand of T₁ is [ℚ[[h]]x —h→ ℚ[[h]]dx], with H¹=ℚ[[h]]/h. The unmodified Jackson complex has H¹=0.

### 4.15 Adjoining the Nygaard filtration divided by Phi_p(q) recovers the q-de Rham complex; divided by q^p-1 it gives zero

For animated R and prime p, modifying the p-completed p-th twisted complex by the Nygaard filtration with denominator Φ_p(q), then (p,h)-completing, recovers p-completed qdR through relative Frobenius. Using denominator q^p−1 instead gives qdR with h inverted followed by (p,h)-completion, hence zero. Keeping these denominators distinct proves the partial-modification transition theorem.

(See QH Lemma 3.44, §3, p.46; Proposition 3.43, §3, p.45.)

This uses HQ.4, HQ.3, PrismaticCohomologyPartII §§3.13–3.16.

### 4.16 The partial descents are compatible under completion

For n|m, prove `(T_m)^∧_{q^n−1}≃T_n` through the specified filtration transition. This is a compatible descent of qHdg from the q=1 neighborhood to the m-th cyclotomic neighborhood. It asserts a completed equivalence, not equality of the original partial objects.

(See QH Proposition 3.43, §3, p.45.)

This uses HQ.3.

### 4.17 The Habiro-Hodge complex, and the symmetric monoidality of the descent

Define the Habiro–Hodge object `H(R,F)=lim_{k≥1}T_{k!}`, with coherent factorial transitions. This computes the divisibility-indexed limit, is Habiro-complete, satisfies `H^∧_{q^m−1}≃T_m` for every m and H^∧_h≃qHdg. Section 0.1 supplies Habiro completion and its completed tensor. The construction first carries lax symmetric monoidal maps; these are strengthened below.

(See QH Paragraph 3.45, §3, p.47; Paragraph 3.16, §3, p.30.)

This uses HQ.3, §0.1.

Use the following maps and laws:

- For a pair, the Habiro-complete object of the derived category of A[q] given by the limit of the partial descents.
- Its (q-1)-completion is the q-Hodge complex.
- Its (q^m-1)-completion is the m-th partial descent.
- The limit may be computed along the factorials.
- A functor on the category of pairs, with map_id and map_comp.
- The lax symmetric monoidal structure, compatible with the one on the q-Hodge complex; §4.18 proves its tensor maps are equivalences.

**Checks.**

- For the étale unit R=A, H is E=L_H(A[q]); its h-completion is A[[h]] and its f₂-completion reduces to A[q]/(q²−1). Substituting the reduction itself loses the complete parameter.
- For the diagonal étale algebra R=A×A, H=E×E, with idempotents (1,0) and (0,1). A single coefficient unit or its diagonal cannot give both projections when A=ℤ.
- For the coordinate pair on ℤ[x], the h-completed linear summand has differential h and cokernel ℤ[[h]]/h. Returning qΩ instead would have differential 1 and zero cokernel.

### 4.17a Framed Habiro comparison

For the framed pair of §4.8 over a perfectly covered Λ-ring A, construct the framed Habiro comparison map: K(E(S/A[x]);D̃_i)→H(S,F_frame) and prove it is an equivalence, compatibly with every f_m-completion and their divisor transitions. Under h-completion its differential is hD_i and its comparison is the framed qHdg identification. This is the explicit-complex assertion in QH Example 3.12, pp.25–26, and Corollary 3.13, p.27; a proof must identify local differentials and transition maps, beyond identifying coefficient rings.

*Needs:* §§0.2–0.3, §3.31 the framed Habiro Koszul complex, §4.8, §§4.14–4.17.

**Checks.**

- With an empty frame, both sides are E(S/A) in degree zero and the comparison is the marked coefficient equivalence.
- On ℤ[x], h-completion sends x to h dx; using the Jackson differential alone would send it to dx.
- On a Laurent coordinate, multiplying degree one by x identifies D̃ with γ−id; the coordinate x⁻¹ acquires q⁻¹. This fixes both the rescaling and sign.

### 4.20 The descent theorem, clause (b): the q-de Rham-Witt filtration on the reduction modulo q^m-1

For each m≥1, put an exhaustive ascending filtration on H/(q^m−1), natural in the pair, with i-th graded piece the i-th associated graded of the animated stupid filtration on qW_m dR. In the form convention this is Σ^(−i)qW_m dR^i. The identification is lax monoidal and becomes the conjugate filtration at m=1. It is an associated-graded theorem, rather than an unfiltered identification with qW_m dR.

(See QH Theorem 3.11(b), §3, p.25.)

*Needs:* §4.7, §§4.13–4.17, §3.18 the animated stupid filtration of §3.18; strong monoidality of §4.18 is not an input.

### 4.18 The Habiro-Hodge complex functor is symmetric monoidal

Prove the lax tensor maps for H are equivalences in the Habiro-complete category. Because H is Habiro-complete, it suffices to check, for every m, the localisation of H/(q^m−1) at the elements q^d−1 for the proper divisors d of m. There the q-Witt filtration of §4.20 is lax monoidal, and its associated graded is that of the animated stupid filtration of qW_m dR, so it suffices that this filtration become symmetric monoidal after the localisations. After those localisations the first ghost map identifies this filtration with fil_Hdg `dR⊗_{A,ψ^m}A[ζ_m]`, with the elements ζ_m^d−1 inverted. The identification holds because each qW_dΩ with d a proper divisor is (q^d−1)-torsion and dies, and the Hodge filtration is symmetric monoidal. The stupid filtration itself is not symmetric monoidal before localising, so the localisation is essential. This gives strict symmetric monoidality with the completed tensor product of §0.1.

(See QH Lemma 3.46, §3, p.47.)

*Needs:* §4.17 the lax tensor maps of §4.17, §4.20, §0.1 the complete-object detection theorem of §0.1, QWittVectors §7.6 and DerivedDeRhamCohomology §§2.22–2.27.

- For finitely many pairs, the canonical map from the completed tensor product of their Habiro-Hodge complexes to the Habiro-Hodge complex of their tensor product in the category of pairs is an equivalence (the Kuenneth form of strict monoidality).

### 4.19 The descent theorem: the q-Hodge complex factors symmetric monoidally through Habiro-complete objects

For every perfectly covered Λ-base, the qHdg functor on chosen pairs factors symmetric monoidally through Habiro-complete A[q]-modules by H, followed by h-completion. This is the descent theorem's first clause. The choice of F is essential; the factorization is not a functor selecting filtrations on arbitrary animated algebras.

(See QH Theorem 3.11, §3, p.25; Theorem 3.11(a), §3, p.25; Theorem 1.11(a), §1, p.7.)

This uses HQ.3, §0.1.

### 4.22 For smooth inputs, q-Omega is the q-Hodge completion of the derived complex and the decalage of the q-Hodge complex

For smooth S over perfectly covered A with a chosen pair, show that filtration completion of qdR is qΩ, using the p-rational comparison datum to glue local and rational identifications. Also prove Lη_h qHdg≃qΩ; applying Lη_h to the Habiro–Hodge object supplies a Habiro descent of the smooth qΩ object. These conclusions do not make uncompleted qdR equal to qΩ on all smooth inputs.

(See QH Proposition 3.47, §3, p.48; Proposition 3.47(a), §3, p.48; Proposition 3.47(b), §3, p.48; Remark 3.6, §3, p.22.)

*Needs:* §§2.7–2.10, §4.1, §4.4, §4.8, AInfCohomology AI.1 and DerivedDeRhamCohomology §§1.14–1.17, 1.22 and 2.22–2.27; DerivedModuleAlgebra §§1.1–1.4.

### 4.21 For an étale algebra the Habiro–Hodge complex is the relative coefficient ring

Let A be a perfectly covered Λ-ring and R an étale A-algebra. The empty-frame
underived complex is `qΩ_{R/A}=R⟦h⟧`, with completed filtration
F̂^j=h^max(j,0)R⟦h⟧. Its q-Hodge pair on the animated complex is the derived
pullback
`F^j=qdR_{R/A}×_{R⟦h⟧}h^max(j,0)R⟦h⟧`
along the canonical qdR→qΩ map. By the smooth completion comparison and
clause (b), any chosen q-Hodge filtration on R has this completed filtration
and this pullback description. Neither qdR=R⟦h⟧ nor staticity of its positive
filtration steps is asserted before filtration completion. Identify its
Habiro–Hodge object with E(R/A) of §0.3, denoted `H_{R/A}` here, as E∞-A[q]-algebras.
The comparison is natural in étale A-algebras, preserves the coefficient unit
and all partial-completion projections, and sends the h-completion map to
E(R/A)→R⟦h⟧. No Frobenius lift on R, spherical lift, resolution or inverted
small prime is required.

Construct the comparison without a later ring model. By QWittVectors §7.7 and §4.20 here,
H(R,F)/f_m=qW_m(R/A) in degree zero, with the prescribed relative ghost maps.
Étaleness and the marked deformation equivalence of §0.3 uniquely lift this
identification to T_m≃E_m(R/A). Uniqueness makes those equivalences compatible
with the divisor transitions, which reduce to `F_{m/n}` for n|m. Taking the
coherent factorial limit gives H(R,F)≃E(R/A). Staticity follows from §0.1's
degreewise detection, not from an assumed vanishing of inverse-limit terms.
This argument also characterizes comparison with any independently constructed
ordinary model: if its partial completions are the marked formally étale lifts
of the same qW_m and it is their coherent limit, the induced comparison is
unique. This characterization lets HabiroRings identify its ordinary
relative Habiro ring; that later identification is a consumer of this result.

(See QH Corollary 3.13, §3.2, p.27; Paragraph 2.7 and Theorem 2.9,
§2.2, pp.15–17; Remark 2.10, §2.2, p.17; Remark 3.6, §3.1, pp.22–23;
Proposition 3.47(a), §3.7, p.48; Paragraph A.14, §A.2, p.76.)

*Needs:* §§0.1–0.3, §4.20, §4.22, QWittVectors §7.7 and EnhancedDerivedSheaves E5.

Use the following maps and laws:

- The empty-frame completed filtration F̂^j=h^max(j,0)R⟦h⟧ and its derived pullback to the canonical animated `qdR_{R/A}`, with the q-Hodge comparisons of §4.1.
- Every chosen q-Hodge filtration on an étale R has this completed filtration and is recovered by the displayed pullback; its q-Hodge modification is R⟦h⟧.
- The unique marked E∞-equivalence T_m≃E_m(R/A), reducing to the identity of qW_m(R/A) and respecting every relative ghost map.
- For n|m, the square of these equivalences with T_m→T_n and E_m→E_n commutes, with identity, composition and higher compatibility.
- The natural E∞-equivalence `H(R,F)≃H_{R/A}=E(R/A)`, characterized by its partial-completion projections.
- Its h-completion is the identity of R⟦h⟧ under the empty-frame identifications, so the two canonical maps to R⟦h⟧ agree.
- A marked formally étale partial-completion model as above has a unique compatible equivalence with H(R,F); an arbitrary ring with abstractly isomorphic reductions is not such a model.

**Checks.**

- For R=A, the comparison identifies H(A,F) with the tensor unit L_H(A[q]); its f_m-completion is `A[q]^∧_{f_m}`, and its h-completion sends 1 to 1 in A⟦h⟧. For R=0 all of these objects are zero.
- For the diagonal étale map A→A×A, the comparison is the product of two identity comparisons and commutes with both projections. Thus a comparison that forgets a component fails even in relative dimension zero.
- For R=ℤ[∛2,1/6] over ℤ at m=5, the comparison reduces to qW_5(R/ℤ), not R[q]/f_5 (§0.3). Its h-completion is nevertheless R⟦h⟧; identifying only that completion would lose the nontrivial Frobenius gluing.
- At m=1 the q-Witt filtration is concentrated in filtration degree zero, with reduction R and no shifted copy in degree one. For n|m the reduced transition is `F_{m/n}`; an ordinary Witt restriction map is not an alternative.
- The smooth non-étale algebra ℤ[x] has the coordinate differential x↦h dx and nonzero positive q-Witt forms. Its Habiro–Hodge object cannot be replaced by a static étale coefficient ring. This comparison asserts no identification of K₃-indexed arithmetic modules.
- For A=ℚ and R=ℚ(i), polynomial animation of rational de Rham gives `dR_{R/ℚ}≃ℚ` and `qdR_{R/ℚ}≃ℚ⟦h⟧`, while `qΩ_{R/ℚ}=R⟦h⟧`. For j>0 the displayed pullback has H⁰(F^j)=h^jℚ⟦h⟧ and H¹(F^j)=(R/ℚ)⟦h⟧/h^j. Indeed these are the kernel and cokernel of ℚ⟦h⟧⊕h^jR⟦h⟧→R⟦h⟧. Thus positive steps are not static. Filtration completion gives the stated h-adic filtration on R⟦h⟧, and the q-Hodge modification is still R⟦h⟧.

### 4.23 Operadic and derived commutative upgrades of the descent, and the differential on cohomology

If the pair carries a compatible E_n-structure, 0≤n≤∞, transport it to H, its cyclotomic filtration and the graded identification. The compatibility includes the filtration comparisons and all higher data, not merely the underlying complex's multiplication. Conditional on `gap:filtered-graded-derived-commutative`, a filtered derived commutative lift similarly produces a derived commutative H and a derived differential graded structure on the associated graded. The source supplies the derived commutative upgrade as a sketch; its full enhanced construction is an implementation target.

(See QH Paragraph 3.50, §3, p.50; Lemma 3.52, §3, p.50.)

This uses HQ.3, HQ.4, HQ.1, EnhancedDerivedSheaves E5.

### 4.24 For smooth algebras the reduction modulo q^m-1 has cohomology the q-de Rham-Witt complex, with the Bockstein as differential

For smooth S, identify the cyclotomic filtration with the cohomological Postnikov filtration `τ^{≤i}`. Hence H^*(H/(q^m−1))≅qW_mΩ^* as graded modules; for at least an E_1-pair it is an algebra isomorphism. The qW differential is the Bockstein for q^m−1. Use the underived shifted-forms result of HQ.4, keeping derived reductions and the intrinsic shifts.

(See QH Corollary 3.54, §3, p.51; Corollary 3.54(c), §3, p.51.)

This uses HQ.3, HQ.4.

### 4.25 Finite-projective scalar extension of chosen q-Hodge filtrations

For a Λ-map f:A→B between perfectly covered bases with B finite projective over A, define P_B by derived scalar extension of every filtration step of a chosen pair P, including (a),(b),(c),(c_p), both comparison squares and their compatibility. DerivedModuleAlgebra §§1.1–1.4 and DerivedDeRhamCohomology §§1.22 and 2.23 supply enhanced finite-projective exchange and filtered de Rham base change. The result is functorial with coherent identity and composition, and E_f qHdg_A(P)≃qHdg_B(P_B). Finite projectivity makes B dualizable and permits the limits used here; mere flatness does not. This transports a chosen pair and selects none on a bare algebra.

(See QH Definition 3.2, §3, p.20; Theorem A.1, §A, p.69 · Stacks Lemma 10.78.2, §10.78 (unpaginated HTML).)

This uses Mathlib Module.Finite, Mathlib Module.Projective, HQ.3, HQ.2, DerivedModuleAlgebra §§1.1–1.4, DerivedDeRhamCohomology §§2.22–2.27, Mathlib CategoryTheory.preservesColimitIso.

Use the following maps and laws:

- The scalar-extension functor BC_f on chosen pairs, retaining Definition 3.2 equivalences and higher compatibility data.
- Natural equivalence fil(P_B) ≃ E_f fil(P) as modules over (q−1)^⋆B[q]; evaluation at every step is F^i ⊗^L_A B.
- For forgetful functors U_A,U_B, BC_f ⋙ U_B ≃ U_A ⋙ (−⊗^L_A B).
- Transport the full defining diagram: degree-one q−1 quotient, rational completion, and p-completion then p-inversion then q−1-completion. Comparisons with the filtered de Rham diagrams commute with all supplied squares and homotopies.
- BC_id ≃ id on the category of chosen pairs, with the identity on algebra and every filtration step.
- For finite-projective A → B → C, BC_g ∘ BC_f ≃ `BC_{gf}`, compatible with the tensor associator and the unit and associativity coherences.
- E_f qHdg_A(P) ≃ qHdg_B(P_B), induced by the maps of modification colimits and q−1-completion; no additional completion on the left in this finite-projective range.

**Checks.**

- For f=id_A the extended pair is P, and the map on F^i is the tensor-unit equivalence for every i.
- For the diagonal Λ-map A → A×A with componentwise Adams operations, B is free of rank two; R_B ≃ R×R and every filtration step and each clause datum splits into two copies. After the two projections to A both recovered pairs are P.
- For the base pair R=A with F^i=(q−1)^i A[[q−1]] (constant for i≤0), its degree-one filtered quotient is B in step 0 and zero in positive steps. The degreewise quotient instead has B in every positive step and fails (b). This tests the cofiber `F^{i−1}` → F^i, not its unshifted substitute.

### 4.26 Finite-projective base change of the twisted q-Hodge filtrations

Under the same finite-projective hypotheses, target equivalences `E_fF_{A,m}≃F_{B,m}` for every m, compatible with divisor transitions and lax monoidal structures. This requires finite-projective compatibility of relative Frobenius and Nygaard from PrismaticCohomologyPartII §§3.13–3.16 and filtered décalage from AI.1. These are `gap:finite-projective-nygaard` and `gap:finite-projective-filtered-decalage`; the equivalences are conditional on those precise contracts.

(See QH Construction 3.38, §3, p.42.)

This uses HQ.3, HQ.4, DerivedModuleAlgebra §§1.1–1.4, PrismaticCohomologyPartII §§3.13–3.16, AInfCohomology AI.1.

### 4.27 Finite-projective base change of the Habiro–Hodge complex

Write H_A(P)=lim_k `T_{A,k!}(P)`. Define β_f:E_fH_A(P)→H_B(P_B) by the limit-exchange map followed by the coherent partial comparisons `E_fT_{A,k!}≃T_{B,k!}`. Conditional on the preceding twisted-filtration interfaces, β_f is an equivalence for finite projective B, and E_fH_A is already Habiro-complete. Require compatibility with every partial completion, cyclotomic reduction, its ascending filtration and its graded pieces, using their intrinsic cohomological shifts without another shift. Include projection characterization, identity, composition and the Künneth square. This is a constructed extension of the source's descent, not a theorem stated there for arbitrary base change.

(See QH Construction 3.45, §3, p.47; Theorem 3.11(b), §3, p.25; Lemma 3.46, §3, p.47.)

This uses HQ.3, HQ.4, §0.1, DerivedModuleAlgebra §§1.1–1.4, Mathlib CategoryTheory.Limits.limit.post, Mathlib CategoryTheory.Limits.limMap, Mathlib CategoryTheory.Limits.limMap_π, Mathlib CategoryTheory.Limits.limit.post_π, Mathlib CategoryTheory.Limits.isIso_limMap, Mathlib CategoryTheory.preservesLimitIso.

Use the following maps and laws:

- β_f(P)=lim(σ) ∘ [E_f(lim T_A)→lim E_f(T_A)], a B[q]-linear map, natural in chosen pairs.
- For every factorial stage k, β_f(P) followed by `π_{B,k}` equals `E_f(π_{A,k})` followed by σ_k; this determines β.
- For finite-projective f and the requested enhanced and Frobenius/Nygaard compatibilities, β is an equivalence; E_f H_A is already Habiro-complete.
- β_id is the identity under the tensor-unit identifications.
- For A → B → C in the range, `β_{gf}=β_g` ∘ E_g(β_f), with the canonical tensor-associativity and target-pair identifications and their coherences.
- The q^m−1-completion of β identifies with σ_m under `H_A^∧_{q^m−1}≃T_{A,m}`, for every m, not only factorial m.
- At m=1 the completed β is the q-Hodge modification comparison of §4.25: E_f qHdg_A(P)≃qHdg_B(P_B).
- The reduced β lifts to an equivalence of exhaustive ascending filtered modules on H/(q^m−1). Its graded map is E_f `G^i_{A,m}≃G^i_{B,m}`, where G^i=gr^i of the animated stupid filtration, with no additional shift.
- For chosen pairs P,Q, scalar extension of `H_A(P)⊗̂_{H,A[q]}H_A(Q)≃H_A(P⊗Q)` followed by `β_{P⊗Q}` agrees with β_P⊗̂β_Q followed by the B-base Künneth equivalence; the unit square also commutes.

**Checks.**

- For f=id_A and the identity stagewise comparison, β is id on the limit, with identity projections at all factorial stages.
- For f:A→A×A diagonal, E_f H_A≃H_A×H_A; σ_m is the corresponding two-copy comparison at every m, and β has the two expected component maps. This distinguishes tensoring before the limit from forgetting one component.
- For the coordinate q-Hodge filtration on A[x] and finite-projective A→B, the q−1-completion of β is coefficient extension of the complex with differential `D(x^r)=(q^r−1)x^{r−1}dx` (r≥1). In particular D(x²)=(q²−1)x dx. The differential has not been replaced by (q−1)r `x^{r−1}dx`.
- Do not infer the needed limit/completion exchange from flatness: for the Λ-map ℤ→ℚ, ℤ[[t]]⊗ℚ→ℚ[[t]] is not surjective. Its image has a common nonzero integer denominator for all coefficients, whereas the series with coefficients 1/(n+1)! has no such denominator. This lies outside the finite-projective hypothesis and prevents silently upgrading this range to all Λ-maps.

### 4.28 The exported q-Hodge and Habiro–Hodge interface

Fix a perfectly covered Λ-ring A. For every object (R,F) of the category of pairs of §4.1, export the following objects as one package, functorial on pairs. Every item is built in §§2.1–2.7 and §§4.1–4.27 from Layer 0, QWittVectors, DerivedDeRhamCohomology, EnhancedDerivedSheaves, AInfCohomology AI.1, PrismaticCohomology Layers 0–2 and PrismaticCohomologyPartII §§3.13–3.16, 5.2–5.21, CrystallineCohomology and PerfectoidSpaces §P4.15.2. The package carries no lift, resolution or prime-inversion hypothesis. Additional hypotheses belong to the theorems that produce particular pairs: the framed pairs of §4.8, the étale pairs of §4.21, the canonical sections of §5.8 and §5.22, the finite-coefficient pairs of §5.26, or a pair that a consumer constructs and verifies against Definition 3.2 itself.

Consumer note: RefinedTraceMethods imports this interface for its finite-coefficient TC⁻ computation, its ku and KU comparisons and its homotopical Habiro descent. HabiroCohomologyFoundationsPartII then imports this interface and those trace theorems for trace pairs, their Habiro descent and the number-field trace comparison. Those downstream comparisons retain their own lift, resolution and prime-inversion hypotheses (TC Paragraph 1.8, §1.2, p.5; Corollary 3.8, §3.1, p.32 · KU Theorem 1.14, §1.2, p.7).

*The β-periodic q-Hodge object.* Regard F as the graded A[β,t]-module Rees(F), |β|=1, |t|=−1, βt=q−1 (§2.2). Inverting β is the filtered localisation of F at q−1 placed in filtration degree one. Its degree-n part is the colimit of `F^n→F^{n+1}→⋯` along q−1, and multiplication by β^n identifies it with the degree-zero part. After derived t-adic completion in the category of graded modules, the localisation is `qHdg(R,F)⊗_{A[q]}A[q][β^{±1}]` as a graded `A[q][β^{±1}]-module`, and its localised filtration becomes the (q−1)-adic filtration of qHdg(R,F). Completion here is degreewise; after β is inverted, `t=(q−1)β^{−1}`, so in each degree it is (q−1)-completion. The identification is symmetric monoidal on pairs: localisation is symmetric monoidal, and so is qHdg (§4.5). Before either completion, inverting t instead gives the graded module `qdR_{R/A}⊗_{A[q]}A[q][t^{±1}]`; its degree-zero part is `qdR_{R/A}` with the filtration forgotten.

*Completion.* The filtration completion F^ of F (§2.1) has as degree-zero term the q-Hodge-completed derived q-de Rham complex `q-dR^_{R/A}`. The map F→F^ is an equivalence on associated graded pieces, and F is the pullback of F^ along `qdR_{R/A}→q-dR^_{R/A}`. Completion does not change the q-Hodge complex: in the colimit every element of F^i becomes divisible by (q−1)^i, and the result is (q−1)-complete. For smooth S, `q-dR^_{S/A}≃qΩ_{S/A}` (§4.22).

*The Habiro descent datum.* Export the following record in the enhanced categories of §§2.1–2.7:
(i) the twisted q-Hodge filtrations F_m on `qdR^{(m)}_{R/A}` for every m≥1, with F_1=F, the divisor transitions for n|m, and `F_m/β_m≃fil_{Hdg_m}qW_m` `dR_{R/A}` (§4.12–4.13);
(ii) the partial descents T_m and the equivalences `(T_m)^∧_{q^n−1}≃T_n` for n|m (§4.14 and §4.16), compatible with the divisor transitions, identities, compositions and their higher homotopies;
(iii) the Habiro–Hodge object H(R,F)=lim_k `T_{k!}`, with `H^∧_{q^m−1}≃T_m` for every m and `H^∧_{q−1}≃qHdg(R,F)` (§4.17);
(iv) on H/(q^m−1) the exhaustive ascending q-Witt filtration with `gr^i≃Σ^{−i}qW_m` `dR^i_{R/A}`, which is the conjugate filtration at m=1 (§4.6 and §4.20); for smooth S, `H^*(H/(q^m−1))≅qW_mΩ^*_{S/A}` with the Bockstein as differential (§4.24);
(v) strict symmetric monoidality for the completed tensor of §0.1 (§4.18); for a pair equipped with a compatible E_n-structure, including its comparison data, the E_n-upgrade, and for a filtered derived commutative lift the corresponding upgrade, under exactly the hypotheses of §4.23;
(vi) finite-projective scalar extension of pairs, of the twisted filtrations and of H, with the projection, identity, composition and Künneth laws, under the relative Frobenius/Nygaard and filtered décalage compatibilities specified in §§4.25–4.27. Item (vi), including its export, is conditional on `gap:finite-projective-nygaard` and `gap:finite-projective-filtered-decalage`; it is not an unconditional consequence of items (i)–(v).
Construct the twisted filtrations and T_m as homotopy-coherent diagrams on positive integers with arrows m→n for n|m, natural in the pair. Their quotient and completion comparisons must be natural transformations, compatible with the monoidal structure and with the scalar extensions in (vi). For ℓ|n|m, the direct transition m→ℓ and the composite m→n→ℓ agree with the specified homotopy, coherently on longer chains. QH Paragraph 3.41 (§3.5, pp.44–45) constructs the individual natural transformations and explicitly leaves their full divisibility functoriality unwritten. Supply that construction here: use a common arithmetic fracture diagram of §4.12 for any finite divisor chain, use its projection and relative Frobenius maps, and apply the enhanced pullback functor. Composition and higher compatibility come from that diagram; independence of the auxiliary integer N is the compatible refinement of the same diagrams (QH Paragraph 3.38, pp.42–44). Pass to the completed localisations by §4.16. Restriction to factorials then computes the same limit by cofinality (§4.17); it does not discard the divisor comparisons required by consumers.

The β-periodic Habiro–Hodge object is `H(R,F)⊗_ℤℤ[β^{±1}]`, graded with |β|=1. Its degreewise derived (q−1)-completion is the β-periodic q-Hodge object above, and its degreewise (q^m−1)-completions are `T_m⊗_ℤℤ[β^{±1}]`.

For an étale R, export the natural marked E∞-comparison `H(R,F)≃H_{R/A}=E(R/A)` of §4.21, its staticity, every partial-completion comparison and the h-completion map. Include the h-adic completed filtration on `qΩ_{R/A}=R⟦h⟧` and the derived pullback description of F on `qdR_{R/A}`; the staticity assertion concerns H, not the uncompleted filtration steps. This contract is constructed here from the q-Witt étale theorem and complete deformation theory. It lets HabiroRings compare its later ordinary relative Habiro model with the cohomological coefficient object by the marked-model characterization of §4.21.

For R=O_K[1/Δ] over A=ℤ, with Δ divisible by the discriminant of the number field K, the further identification with the GSWZ ring is a downstream theorem of HabiroRings. The latter ring has a Frobenius-twisted rootwise power-series presentation and is finite projective of rank [K:ℚ] over `H_{ℤ[1/Δ]}` (GSWZ Definition 1.1, §1.4, pp.6–7; §5.2, p.64). HabiroRings supplies that ordinary-model/number-field identification to RefinedTraceMethods and Part II; this export requires neither it nor the Taylor re-expansion calculus. QH Corollary 2.13 (§2.2, p.19) records the number-field consequence with Δ the discriminant. The relative étale comparison above has no factor-6 restriction; additional inversions in trace applications belong to those consumers.

(See QH Paragraph 3.8, §3.1, p.23, and the proof of Lemma 3.9, §3.1, p.24, for the localisation at q−1 and the graded presentation; Remark 3.6, §3.1, pp.22–23, for completion; Theorem 3.11, §3.2, p.25; Paragraphs 3.42 and 3.45, §3.6, pp.45 and 47; Proposition 3.47(a), §3.7, p.48.)

This uses Layer 0, HQ.2, HQ.3, HQ.4, DerivedModuleAlgebra §§1.1–1.4, DerivedDeRhamCohomology §§2.22–2.27.

Use the following maps and laws:

- `(Rees(F)[β^{−1}])^∧_t` ≃ `qHdg(R,F)⊗_{A[q]}A[q][β^{±1}]` as graded `A[q][β^{±1}]-modules`, natural and symmetric monoidal on pairs, with completion taken degreewise; its degree-zero part is qHdg(R,F).
- The localised filtration on the degree-zero part, completed, is the (q−1)-adic filtration of qHdg(R,F).
- Before completion, `Rees(F)[t^{−1}]≃qdR_{R/A}⊗_{A[q]}A[q][t^{±1}]` as graded modules; taking degree zero gives `qdR_{R/A}` with its filtration forgotten.
- F^ := lim_n `cofib(F^{⋆+n}→F^⋆)`, with F→F^ an equivalence on associated graded pieces and F the pullback of F^ along `qdR_{R/A}→(F^)^0`.
- `q-dR^_{R/A}` := (F^)^0, with qHdg(R,F^)≃qHdg(R,F), and `q-dR^_{S/A}≃qΩ_{S/A}` for smooth S.
- The record (i)–(vi), including the coherent divisor diagrams and natural comparison transformations, as a functor on pairs, with forgetful maps to each component.
- For n|m, the canonical transition T_m→T_n, exhibiting T_n as the (q^n−1)-completion of T_m; the analogous filtered transitions are those in (i).
- For ℓ|n|m, compatibility of the direct and composite transitions, with identity and higher coherence laws, natural in pairs and compatible with all the comparisons in the record.
- `H(R,F)⊗_ℤℤ[β^{±1}]`, whose degreewise derived (q−1)-completion is the β-periodic q-Hodge object above and whose degreewise (q^m−1)-completion is `T_m⊗_ℤℤ[β^{±1}]`.
- For étale R, H and T_m are static, with the marked E∞-comparison `H≃H_{R/A}=E(R/A)`, `T_m≃E_m(R/A)≃(H_{R/A})^∧_{q^m−1}` and H/(q^m−1)=qW_m(R/A) in filtration degree zero. Export the naturality, transition, projection, ghost and h-completion laws of §4.21, its completed-filtration/pullback description, and its characterization for later ordinary models.

**Checks.**

- For R=A with F^i=(q−1)^iA⟦q−1⟧ (constant for i≤0), each map `F^i→F^{i+1}` along q−1 is an isomorphism for i≥0. So the β-localisation in degree zero is A⟦q−1⟧, the periodic object is `A⟦q−1⟧[β^{±1}]`, and H is the Habiro ring of A, the limit of the (q^m−1)-completions of A[q].
- For the coordinate pair on A[x] (§4.8), the degree-zero part of the β-localisation has differential `x^r↦(q^r−1)x^{r−1}dx`, whereas inverting t gives x^r↦[r]_q `x^{r−1}dx`. Localising at the wrong generator returns the q-de Rham complex instead of the q-Hodge complex.
- Completion can change the underlying object. For A=ℚ and `S=ℚ[x^{±1}]` with the rational pair of §4.1, `qdR_{S/ℚ}≃ℚ⟦q−1⟧`, while `q-dR^_{S/ℚ}≃Ω^•_{S/ℚ}⟦q−1⟧` has H¹ spanned by dx/x (§2.4). F and F^ nevertheless have the same q-Hodge complex.
- For étale R, gr^i of the q-Witt filtration vanishes for i>0 and H/(q^m−1)=qW_m(R/A). A datum with nonzero classes in positive q-Witt degrees fails this case.
- For the diagonal Λ-map A→A×A, every item of the record splits into two copies (§4.25 and §4.27). A record that extends the limit H by scalars only after forgetting a component fails this.
- For the unit pair over ℤ, the two paths T_6→T_2→T_1 and T_6→T_3→T_1 both send 1 to 1, as does the direct transition T_6→T_1. Changing one edge to its negative at the level of underlying modules still gives an individual completion equivalence but sends 1 to −1 on one path in the static target ℤ⟦q−1⟧. It cannot be the exported coherent datum.
- Apply the periodic construction to the unit pair degree by degree: each β-degree completes to A⟦q−1⟧. Completing the underlying ungraded Laurent direct sum is a different operation; the export makes no assertion that completion commutes with that infinite direct sum.
- Finite projectivity in (vi) cannot be replaced by flatness: for ℤ→ℚ the series with coefficients 1/(n+1)! lies in ℚ⟦t⟧ but not in ℤ⟦t⟧⊗ℚ (§4.27). The export retains the stated scalar-extension range.

### Examples

For the coordinate pair on A[x], qHdg has differential x^r↦(q^r−1)x^(r−1)dx. Its reduction by h has zero differential and hence A[x]dx in H¹, whereas ordinary de Rham has the derivative differential. At an étale algebra the empty-frame pair descends to the static relative Habiro ring.

### Dependencies

The preceding constructions in this layer and DerivedDeRhamCohomology, EnhancedDerivedSheaves, PrismaticCohomology, Layer 0, QWittVectors, AInfCohomology. The subsection dependencies above specify the exact stages and maps.

## Layer 5: Canonical filtrations and algebraic Habiro cohomology (HQ.5)

The smooth and quasi-regular sections have different domains, different universal properties and different multiplicative scope. Scheme cohomology uses the smooth section over a perfectly covered Λ-base, with ℤ as the principal case.

### 5.1 Filtrations supported in degrees at most n: the truncation functor, its oplax left adjoint on modules, and the relative truncation

On descending filtrations constant in degrees ≤0, let τ*_n retain degrees through n and set degrees ≥n+1 to zero. It is right adjoint to extension by zero and left adjoint to constant extension above n. The localization identity τ*_n(M⊗τ*_nN)≃τ*_n(M⊗N) gives its symmetric monoidal structure. For a filtered E∞-algebra T, the induced module functor preserves limits and colimits and has an oplax monoidal left adjoint `τ^T_{n,!}`. Require relative scalar-extension compatibility for T_1→T_2 and compatibility with successive truncations n,n+1. For the filtered unit the left adjoint is fully faithful extension by zero. Do not replace the oplax structure by a lax one. QH Lemma 4.2(a) calls τ*_n the left adjoint of the inclusion of filtrations vanishing above n. For the formula it gives, which replaces the degrees ≥n+1 by zero, τ*_n is the right adjoint of that inclusion, as stated here. The left adjoint of the inclusion is the quotient by the (n+1)-st step, which the third Check separates from τ*_n. The proof of Lemma 4.2(a) itself uses the counit τ*_n Z(j)→Z(j), the direction of a right adjoint.

(See QH Lemma 4.2, §4.1, pp.53–54; Lemma 4.6, §4.1, p.55; Lemma 4.10, §4.1, p.57.)

This uses HQ.2, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E5:abstract.

Use the following maps and laws:

- τ*_n : `Fil^{≥0}D(Z)` → `Fil^{[0,n]}D(Z)`, keeping degrees at most n.
- (τ*_n M)^i ≃ M^i for i ≤ n and (τ*_n M)^i ≃ 0 for i ≥ n+1, with the transition maps of M below n+1.
- Extension by zero ⊣ τ*_n ⊣ constant extension above n, the last functor fully faithful.
- τ*_n(M ⊗^L τ*_n N) ≃ τ*_n(M ⊗^L N), making τ*_n symmetric monoidal.
- `τ^T_{n,!}`, the oplax symmetric monoidal left adjoint of τ*_n on T-modules.
- Clause (c): `τ^{T_2}_{n,!}(M` `⊗_{τ*_n T_1}` τ*_n T_2) ≃ `τ^{T_1}_{n,!}M` `⊗_{T_1}` T_2.
- Clause (d): `τ*_{n,n+1}` with `τ*_{n,n+1}` ∘ `τ*_{n+1}` ≃ τ*_n, and its oplax left adjoint `τ_{n,n+1,!}` on modules.
- Clause (e): `τ^Z_{n,!}` is extension by zero and is fully faithful.

**Checks.**

- τ*_n Z(j) ≃ Z(min(j, n)) for all j ≥ 0, where Z(j) is Z in filtration degrees at most j and zero above.
- For M vanishing in degrees at least n+1 (for example the Hodge filtration of `Ω_{S/A}` with dim(S/A) ≤ n), `τ^Z_{n,!}` τ*_n M ≃ M.
- τ*_n is not the quotient by the (n+1)-st step (the left adjoint of the inclusion): on Z(n+1) the quotient is zero while τ*_n Z(n+1) ≃ Z(n).
- For T = (q−1)^⋆Z⟦q−1⟧ and M = τ*_n T, `τ^T_{n,!}` M ≃ T; in general `τ^T_{n,!}` continues a module above degree n by multiplication by powers of q−1, which is the intended (q−1)-adic extension above degree n of Paragraph 4.1.

### 5.2 The canonical q-Hodge filtration on a smooth algebra with small primes inverted

Let A be perfectly covered, S smooth and n≥1, with all primes ≤n invertible in S; the construction allows any relative dimension. Factor qΩ→Ω through the E∞-map qΩ→Ω[[h]]/h^n, using the local factorization modulo h^(p−1) when p>n and vanishing p-completions when p≤n. Reduce the combined Hodge/h-adic filtration by h^n in filtration degree n, truncate with τ*_n and pull back along that map in truncated modules. Apply `τ_{n,!}`, then h-complete, to obtain F_n on qΩ; pull it back to qdR. The finite coefficient filtration on Ω[[h]]/h^n is part of the construction. The q-Hodge axioms require the additional dimension bound below.

(See QH Paragraph 4.1, §4, p.53; Paragraph 4.3, §4, p.54.)

This uses HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology §§2.22–2.27, Mathlib Algebra.Smooth.

Use the following maps and laws:

- For S smooth over A with all primes p ≤ n invertible, the filtered (q−1)^⋆A⟦q−1⟧-module `fil^⋆_{q-Hdg,n}` `q-Ω_{S/A}` and its pullback to `q-dR_{S/A}`.
- The E∞-A⟦q−1⟧-algebra map `q-Ω_{S/A}` → `Ω_{S/A}⟦q−1⟧/(q−1)^n` lifting the canonical map to `Ω_{S/A}`.
- In truncated filtered modules, τ*_n F_n is qΩ pulled back against τ*_n of the combined Hodge/h-adic filtration on Ω[[h]]/h^n, along the fixed factorization map of the preceding bullet.
- Maps from `fil^⋆_{q-Hdg,n}` `q-Ω_{S/A}` to a (q−1)-complete filtered (q−1)^⋆A⟦q−1⟧-module N are maps from `fil^{⋆≤n}_{q-Hdg,n}` `q-Ω_{S/A}` to τ*_n N (adjunction and completion); this is how comparison maps are built.
- The reduction modulo q−1 (q−1 in filtration degree one) is `τ^Z_{n,!}` τ*_n fil^⋆_Hdg `Ω_{S/A}`.
- Functoriality in S among smooth A-algebras with the primes p ≤ n invertible, with identity and composition laws.
- For an étale framing in n coordinates, the equivalence with the coordinate filtration.

**Checks.**

- For S = A and n = 1 we have `q-dR_{A/A}` ≃ A⟦q−1⟧ and the filtration is the (q−1)-adic filtration (q−1)^i A⟦q−1⟧.
- For S = A[x] and n = 1 (no prime inverted), in the coordinate model the i-th step for i ≥ 1 is the subcomplex (q−1)^i A[x]⟦q−1⟧ → `(q−1)^{i−1}` A[x]⟦q−1⟧ dx: the pullback of the Hodge filtration in degree one continued (q−1)-adically (Paragraph 1.14).
- If dim(S/A) > n the reduction modulo q−1 is `τ^Z_{n,!}` τ*_n of the Hodge filtration, which vanishes in degree n+1 while the Hodge filtration does not; so the q-Hodge property genuinely needs dim(S/A) ≤ n.
- Without τ*_n, the pullback of the Hodge filtration along `q-Ω_{S/A}` → `Ω_{S/A}` contains `(q−1)q-Ω_{S/A}` in every step (Paragraph 1.14); for S = A[x] its second step contains q−1 times the unit, which violates the rational clause, since (q−1) ∉ (q−1)^2 A⟦q−1⟧ + (q−1) fil^1_Hdg.

### 5.3 In relative dimension at most n the canonical filtration is a q-Hodge filtration

If also dim(S/A)≤n, identify F_n/β with fil_Hdg Ω and its global and p-completed rationalizations with the combined Hodge/h-adic filtrations. Construct their agreement data to obtain a q-Hodge pair on qdR, natural in S, whose filtration completion is F_n on qΩ. Smoothness, perfect coverage and invertibility of all primes ≤n remain in force. The dimension bound ensures that the Hodge filtration is supported through n.

(See QH Lemma 4.6, §4, p.55; Lemma 4.7, §4, p.56.)

This uses HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology §§2.22–2.27.

### 5.4 The canonical filtration of a framed smooth algebra is the coordinate filtration

For S étale-framed in n coordinates with all primes ≤n invertible, identify F_n with the coordinate filtration h^max(i−j,0)Ω^j[[h]]. Both truncated filtrations are identified with the same defining pullback. The counit of `τ_{n,!}⊣τ*_n`, composed with this fixed pullback identification and the canonical framed qΩ comparison, supplies a particular map F_n→F_frame. Its reduction by h is the identity on fil_Hdg Ω under the canonical reductions; both filtered objects are complete, so that map is an equivalence. Completeness alone would not turn an arbitrary map, including the zero map, into an equivalence. The identification is filtered on the underived complex and then pulls back to the pair.

(See QH Remark 4.4, §4, p.55; Paragraph 1.10, §1, p.6.)

This uses HQ.5, HQ.3, HQ.2.

### 5.5 The p-complete description through the p-tilde-de Rham complex

At p, use the `μ_{p−1}` homotopy fixed points of the ℤ_p×-action on (qΩ)^∧_p induced by q↦q^u on the prism. This is the p-tilde-de Rham object. Pull back its Hodge filtration along the map to p-completed Ω, apply `τ_{n,!}` and base-change to h^•ℤ_p[[h]]. The source identifies the global canonical filtration with the gluing of these local filtrations and the rational combined filtration. Its omitted gluing argument is a further target; it is not supplied just by having the group action. This description is the input to the action-normalized uniqueness assertion.

(See QH Remark 4.5, §4, p.55.)

This uses HQ.5, HQ.1, PrismaticCohomologyPartII §5.21, EnhancedDerivedSheaves E5:presentability, HQ.2.

### 5.6 The categories with the bounds n and n+1 form a pushout of ∞-categories

For n≥0, prove the pushout of full smooth-algebra subcategories in enhanced categories: the overlap `Sm^{≤n}_{A[(n+1)!^(−1)]}` maps to `Sm^{≤n+1}_{A[(n+1)!^(−1)]}` and to `Sm^{≤n}_{A[dim!^(−1)]}`, and their pushout is `Sm^{≤n+1}_{A[dim!^(−1)]}`. These ordinary categories are viewed as ∞-categories; require `gap:fully-faithful-pushout` in addition to E0's existence of coherent pushouts. Retain the localization adjunction S↦S[1/(n+1)!] on the overlap: maps from the lower-bound component to the prime-inverted component factor through it, reducing to mapping spaces in one component. In the reverse direction, if (n+1)! is not invertible in the target the mapping space is empty, since an algebra map preserves units. These are the two cross-component arguments in the source; the result is conditional on the declared categorical contract. An ordinary set union alone is insufficient.

(See QH Lemma 4.9, §4, p.56.)

This uses EnhancedDerivedSheaves E0, Mathlib Algebra.Smooth.

### 5.7 The constructions for the bounds n and n+1 agree, and assemble into one functor

On the overlap of dimension ≤n with all primes ≤n+1 inverted, prove a natural equivalence of the canonical pairs built with bounds n and n+1. In dimension zero, the completed filtration on qΩ is h-adic and the pair is its derived pullback to qdR (§4.21). Assemble the bound-dependent functors along the preceding pushouts into a functor on `Sm_{A[dim!^(−1)]}`, the full class with primes ≤relative dimension invertible. This is a functor on that class only.

(See QH Paragraph 4.8, §4, p.56; Lemma 4.10, §4, p.57.)

This uses HQ.5, HQ.3.

### 5.8 Existence away from small primes

For perfectly covered A and smooth S with every prime p≤dim(S/A) invertible in S, obtain the canonical q-Hodge pair and a partial section of the forgetful functor. The condition uses relative dimension over A. The no-section theorem prevents extension to all smooth inputs over non-ℚ bases, but supplies no optimality result for the particular set of primes inverted here.

(See QH Theorem 4.11, §4, p.58; Theorem 1.15, §1, p.8; Lemma 3.3, §3, p.22.)

This uses HQ.5, HQ.3, Mathlib Algebra.Smooth.

### 5.8a Locally admissible smooth algebras

Call a smooth A-algebra S locally admissible if, on its open-and-closed relative-dimension-d locus, every prime ≤d is invertible. The finite projective module Ω¹_(S/A) has finitely many ranks on Spec S; write S=∏_d S_d for these loci. Define the completed locally admissible filtration on qΩ_S≃∏_d qΩ_(S_d) as the product of the completed canonical filtrations from §5.8. Then define the locally admissible pair on qdR_S by pulling that filtration back along qdR_S→qΩ_S as in §4.1. Products of animated pairs cannot replace this pullback: qdR need not preserve products.

Prove functoriality of locally admissible pairs, their compatibility with étale localization and their agreement on the global-prime domain: every A-map between such smooth algebras preserves the constructed pair, the construction commutes with étale localization and with its dimension decomposition, and on the global-prime domain it agrees with §5.8. For maps, refine the target's rank loci by the images of the source's idempotents, localize the source at the primes invertible on each target component, and compare both bounds through §5.7 at their maximum. Use naturality of the canonical filtration and the pullback to qdR. These are the affine extension targets required for the locally stated scheme domain (QH Theorem 4.11, p.58, and Remark 3.6, pp.22–23; the finite-rank decomposition and this extension are consequences required here).

*Needs:* §§1.19–1.21, §4.1 the pullback of an underived filtration in §4.1, §4.22 and §§5.2–5.8; Mathlib finite projectivity of smooth differentials.

Use the following maps and laws:

- The finite open-and-closed rank decomposition of a smooth algebra, the product filtration on qΩ and its derived pullback to qdR.
- Functorial maps of these pairs for all algebra maps in the locally admissible class, coherent under identity and composition.
- Agreement with the canonical global-prime construction and compatibility with rank-locus projections and étale localization.

**Checks.**

- S=ℤ×ℤ[1/2][x,y] has relative ranks 0 and 2; 2 is not a unit in S, yet the first component uses bound 0 and the second bound 2. The completed filtration and H are the component products, while the pair is their pullback to qdR_S.
- For S=ℚ×ℚ, qdR_S=ℚ[[h]] and qΩ_S=(ℚ×ℚ)[[h]]. In positive degree j the pulled-back Fʲ has H⁰=hʲℚ[[h]] and H¹=ℚ[[h]]/hʲ; the product of the two animated unit pairs instead has zeroth term (ℚ×ℚ)[[h]].
- The localization from the mixed-rank example to its plane component, and the projection to its rank-zero component, recover exactly those completed filtrations. For S=0 the decomposition is empty, all underived terms vanish, and the pullback prescription still uses the actual qdR_0.

### 5.9 The partial sub-operad of smooth algebras with the small primes inverted

Define admissible vertices of the smooth tensor nerve as lists of smooth algebras satisfying the dimension-dependent prime condition. An edge over α∈Fin_* is admissible when its endpoints and every tensor product over a fiber of α satisfy that condition. Take the largest simplicial subset containing precisely simplices with admissible vertices and edges. Over non-ℚ bases these edges need not compose, so this is a simplicial set over N(Fin_*), not an ∞-subcategory or an ∞-operad. Define the bounded version likewise; its dual cartesian variant is conditional on `gap:oplax-dual-fibration`. Over a ℚ-base every edge is admissible. This correction matters for the scope of multiplication claims.

(See QH Paragraph 4.12, §4, p.58; Paragraph 4.12(b), §4, p.58; Corollary 4.16, §4, p.60.)

This uses HQ.5, EnhancedDerivedSheaves E5:abstract, Mathlib Algebra.Smooth.

Use the following maps and laws:

- A morphism over α is admissible iff source, target and the target of the cocartesian lift of α from the source are admissible objects.
- The simplicial subset `Sm⊗_{A[dim!^{-1}]}` of the nerve of Sm⊗_A spanned by admissible vertices and edges, with its map to N(Fin_*).
- Its fibre over ⟨1⟩ is the full subcategory `Sm_{A[dim!^{-1}]}` of smooth A-algebras.
- For S of relative dimension d the multiplication (S, S) → S over ⟨2⟩ → ⟨1⟩ is admissible iff every prime p ≤ 2d is invertible in S; the r-fold multiplication is admissible iff every prime p ≤ r·d is.
- The bounded-dimension variant `Sm^{≤n,⊗}_{A[n!^{-1}]}` and its dual in `(Sm⊗_{A[n!^{-1}]})^∨`.
- On étale A-algebras (dimension zero) every morphism is admissible and the construction is the symmetric monoidal category of étale A-algebras.

**Checks.**

- Over A = Z: the edges (Z[x], Z[x]) → (Z, Z) over id_⟨2⟩ and (Z, Z) → Z over ⟨2⟩ → ⟨1⟩ are admissible but their composite is not, since Z[x] ⊗ Z[x] = Z[x, y] needs 2 inverted.
- Z[x] lies in `Sm_{Z[dim!^{-1}]}`, but its multiplication is not admissible; Z[1/2][x] has an admissible multiplication (an A_2-structure) but its triple product is not admissible, and Z[1/6][x] has an admissible triple product (A_3).
- Over ⟨1⟩ the condition (b) is vacuous, so the fibre is the full subcategory `Sm_{A[dim!^{-1}]}`.
- The full sub-operad spanned by `Sm_{Z[dim!^{-1}]}` contains the multiplication of Z[x], which is not admissible; the two notions differ.

### 5.10 The truncated canonical construction is symmetric monoidal

Fix n. The truncated canonical functor, before applying `τ_{n,!}`, is symmetric monoidal on all smooth A-algebras with primes ≤n inverted, without a dimension bound. Its target consists of h-complete modules over τ*_n(h^•A[[h]]) with completed tensor. Supply the enhancement of the source's proof sketch, including the truncated pullback's multiplicativity.

(See QH Lemma 4.13, §4, p.59.)

This uses HQ.5, DerivedDeRhamCohomology §§2.22–2.27, EnhancedDerivedSheaves E5:abstract.

### 5.11 In bounded dimension the oplax structure preserves cartesian lifts

Conditional on `gap:oplax-dual-fibration`, encode oplax functors through the supplied dual cartesian fibrations over Fin_*^op and their cocartesian-leg span description. Compose the truncated symmetric monoidal construction with `τ_{n,!}(−)^∧_h`. For a cartesian arrow whose source tensor-product entries have dimension ≤n, prove its image is cartesian. The bound is on the entries at the source in the dual fibration; it is what makes the corresponding tensor comparison an equivalence.

(See QH Paragraph 4.14, §4, p.59; Lemma 4.15, §4, p.59.)

This uses §5.10, §5.1, DerivedDeRhamCohomology §§2.22–2.27 and `gap:oplax-dual-fibration`.

**Checks.**

- For the identity functor on ℤ-modules, the oplax unit map sends 1 to 1 and the binary comparison sends a⊗b to a⊗b. Both are isomorphisms, so the dual functor preserves the corresponding cartesian edges.
- Let C=ℤe₀⊕ℤe₁ with coproduct e_i↦e_i⊗e_i and counit e_i↦1. The oplax functor F(M)=M⊗C has unit comparison F(ℤ)=ℤ²→ℤ, (a,b)↦a+b; in particular (1,1)↦2. Its binary comparison has ranks 2→4 on units and is not an isomorphism. Inert preservation alone cannot mean strong monoidality.
- For that coproduct, the two ternary composites send e₀ to e₀⊗e₀⊗e₀ and e₁ to e₁⊗e₁⊗e₁. Replacing the coproduct of e₀ by e₀⊗e₁ would make (ε⊗id)Δ(e₀)=e₁ instead of e₀, so a collection of arbitrary span maps fails the unit coherence.

### 5.12 The multiplicativity is operadic and partial: the category is not closed under tensor products

Conditional on the dual-fibration interface of §5.11 (`gap:oplax-dual-fibration`), extend the canonical section to the admissible simplicial subset, preserving the cocartesian edges present there. For relative dimension d, invert primes ≤2d for a homotopy-unital multiplication and primes ≤rd for A_r-coherence through r factors, r≥3; commutative coherence has analogous bounds. For positive d an A_∞ or E∞ assertion from this construction requires every prime invertible; étale inputs are tensor-closed already. A general object with only primes ≤d inverted has no supplied multiplication. The admissible subset is not an ∞-operad, so no unconditional operadic functor theorem is asserted over ℤ.

(See QH Corollary 4.16, §4, p.60; Paragraph 4.12, §4, p.58.)

This uses §§5.9–5.11 and `gap:oplax-dual-fibration`.

### 5.13 Algebraic Habiro cohomology of a smooth scheme

Let A be a perfectly covered Λ-ring and X a smooth A-scheme on which every prime p≤dim(X/A) is invertible, with the relative dimension taken locally. Over the affine étale opens Spec S of X, glue the Habiro–Hodge objects of the canonical pairs of §5.8a to an enhanced derived étale sheaf `qHdg_{X/A}` of Habiro-complete A[q]-modules. Define algebraic Habiro cohomology as `RΓ(X,qHdg_{X/A})`. For every m, glue the exhaustive ascending q-Witt filtration of the reduction modulo q^m−1; its gr^i is `qW_mΩ^i_{X/A}[−i]`. Descent rests on three inputs: the functoriality and étale localization of §5.8a on locally admissible affine algebras, the étale sheaf property of qW_mΩ^i over a perfectly covered base (QWittVectors §7.7), and conservativity of the cyclotomic reductions on Habiro-complete objects. The source states the scheme construction for A=ℤ, where the values lie in its D(X,H). All three inputs, and Theorems 3.11 and 4.11, hold over any perfectly covered A, so the target is stated at that generality, with ℤ as the principal case.

(See QH Paragraph 1.16, §1.3, p.8; Theorem 1.11(b), §1.2, p.7; Theorem 3.11, §3.2, p.25; Theorem 4.11, §4.1, p.58 · QW Proposition 3.31 and Corollary 3.33, §3, pp.50–52.)

This uses HQ.5, HQ.3, HQ.4, §0.1.

Use the following maps and laws:

- For a perfectly covered Λ-ring A and X smooth over A with the primes p ≤ dim(X/A) invertible, the étale sheaf `q-Hdg_{X/A}` of Habiro-complete A[q]-modules and RΓ(X, `q-Hdg_{X/A})`; for A = ℤ, `q-Hdg_{X/ℤ}` ∈ D(X, H).
- For X = Spec S, RΓ(X, `q-Hdg_{X/A})` ≃ `q-Hdg_{S/A}`, the Habiro–Hodge complex of the locally admissible canonical pair of §5.8a.
- `q-Hdg_{−/A}` satisfies étale descent on the locally admissible smooth domain of §5.8a.
- Pullback along étale maps of such schemes, with identity and composition laws.
- Its reduction modulo q^m − 1 carries the ascending filtration whose i-th graded piece is RΓ(X, q-W_m `Ω^i_{X/A})` shifted to cohomological degree i.
- Its (q−1)-completion is the q-Hodge complex (Theorem 3.11(a)), and its sections are Habiro-complete.

**Checks.**

- For X = Spec O_F[1/Δ] with F a number field of discriminant Δ, RΓ(X, `q-Hdg_{X/Z})` is the static coefficient ring `H_{O_F[1/Δ]/Z}` (Corollary 3.13). The subsequent identification with the ordinary GSWZ Habiro ring is the HabiroRings application of the export in §§4.28 and 5.25 (Corollary 2.13).
- A prime invertible on every component of X acts invertibly on RΓ. For X=Spec(ℤ×ℤ[1/2][x,y]), 2 is invertible on the dimension-two component but not the dimension-zero one: the first factor remains L_H(ℤ[q]). The local dimension condition does not invert every prime below the global maximum on all components.
- For X = A^1_Z = Spec Z[x] (no prime inverted), RΓ is the Habiro–Hodge complex whose (q−1)-completion is Z[x]⟦q−1⟧ → Z[x]⟦q−1⟧ dx, x^m ↦ (q^m − 1) `x^{m−1}` dx.
- Its (q−1)-completion is the q-Hodge complex, not the q-de Rham complex: for Z[x] the differential sends x^m to (q^m − `1)x^{m−1}dx`, not to [m]_q `x^{m−1}dx` (Paragraph 1.13).
- Over A = ℤ[t] with ψ^m(t) = t^m, which is perfectly covered because each ψ^m is finite free, take X = A^1_A = Spec A[x]. The (q−1)-completion of RΓ is A[x]⟦q−1⟧ → A[x]⟦q−1⟧dx with x^r ↦ `(q^r−1)x^{r−1}dx`. Here t is a coefficient and has no differential; a construction that treated t as a coordinate would produce dt and fail.
- The domain depends on the base: over A = ℚ every smooth X qualifies, while over A = ℤ[1/2] the affine plane qualifies but affine 3-space needs 3 inverted.

### 5.14 Smooth proper perfectness target

For smooth proper X/ℤ[1/N] of relative dimension d, where N>0 is divisible by every prime ≤d, target perfectness of RΓ(X,H_X) over the Habiro completion of H[1/N]. That order of localization and completion is part of the coefficient object. The source states this example without a proof; a global enhanced perfectness proof and its coefficient base change remain to be supplied.

(See QH Paragraph 1.16, §1, p.8.)

This uses HQ.5, §0.1, HQ.4.

### 5.15 The rings of interest: p-completely perfectly covered bases, quasi-lci algebras and relative semiperfectness

At fixed p, a p-completely perfectly covered δ-base A is p-complete with p-completely faithfully flat map to its perfection A_∞, equivalently p-completely flat Frobenius. A p-quasi-lci R has p-completed cotangent Tor-amplitude [0,1] in homological indexing. Relative semiperfectness is surjectivity of `R/p⊗_{A,φ}A→R/p`; for p-quasi-lci R it forces the p-completed cotangent amplitude to degree 1. Here p is prime and φ lifts Frobenius modulo p; these conditions make r⊗a↦r^p a well defined. Cotangent Tor means H^(−i) of the derived reduction of the full cotangent complex, derived-tensored with every discrete R/p-module. It is not an independently supplied family of modules. A perfect-regular presentation is R=B/J with B relatively perfect and J Koszul-regular; its δ-structure and base map commute with the base Frobenius. The free p-complete δ-ring on x is characterized by unique δ-compatible maps to any p-complete δ-ring sending x to a specified element. Its perfect analogue has the same property among perfect p-complete δ-rings. The names alone do not give freeness for an arbitrary distinguished element. Globally condition (R) requires prime-by-prime torsion-freeness, p-quasi-lci completed inputs and relative semiperfectness modulo p. These imply the introductory staticity/ideal-filtration condition; no converse is asserted. Tor-amplitude 1 alone does not imply relative semiperfectness, and a perfect-regular presentation is sufficient rather than necessary.

(See QH Paragraph 4.17, §4, p.60; Construction 4.28, §4, p.66; Paragraph 1.18, §1, p.9; Remark 4.20, §4, p.62.)

This uses HQ.2, QWittVectors §§2.1–2.4, PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71, DerivedModuleAlgebra §§0.4, 0.8–0.14, Mathlib RingTheory.Sequence.IsRegular, Mathlib Algebra.Etale.

Use the following maps and laws:

- A p-complete δ-ring whose Frobenius is p-completely flat; p-torsion free.
- `L_{R/A}` has p-complete Tor-amplitude in homological degrees [0, 1].
- The relative Frobenius R/p `⊗_{A,φ}` A → R/p is surjective.
- For p-quasi-lci R/A, relative semiperfectness gives `Ω¹_{R/A}/p=0`, so the p-completed full cotangent complex has Tor-amplitude concentrated in homological degree 1.
- R ≅ B/J with B relatively perfect over A and J generated by a Koszul-regular sequence.
- For every p: p-torsion free, R̂_p p-quasi-lci over Â_p, R/p relatively semiperfect over Â_p.
- A p-torsion free quotient of an étale algebra over a perfect Λ-ring by a Koszul-regular sequence satisfies (R).

**Checks.**

- For the quasi-lci predicate, L_(A/A)=0, L_(A[x]/A)=R dx in degree 0, and L_((A/(x))/A)=R[1] for a regular x. All have amplitude [0,1]; the polynomial example fails concentration in degree 1, and Kähler differentials alone miss the regular-quotient term.
- For relative semiperfectness modulo p, the identity and every étale extension have invertible relative Frobenius. In (A/p)[x] over a nonzero A/p, x is outside the image, so a polynomial variable fails the predicate. For A=0 this negative control is inapplicable.
- For perfect-regular presentations, take the relatively perfect algebra B=A. The empty sequence gives R=A and zero positive Koszul homology; for a regular x, J=(x²) gives R=A/(x²) and H₁(K(x²))=0. The zero generator in nonzero B instead gives H₁(K(0))=B and is excluded.
- For p-complete perfect coverage, ℤ_p has φ=id and a perfect δ-base has invertible φ. The p-completed polynomial δ-ring ℤ_p[x]^∧_p with φ(x)=x^p has mod-p Frobenius free of rank p, with basis 1,x,…,x^(p−1), so it qualifies without being perfect. At p=2 and 3 those ranks are 2 and 3; flatness must not be replaced by invertibility.
- For global condition (R), an étale algebra over a perfectly covered Λ-base has cotangent complex zero and invertible relative Frobenius. A prime-by-prime torsion-free quotient B/(x²) in a stated perfect-regular presentation has cotangent R[1] and surjective relative Frobenius, hence satisfies the condition; ℤ→𝔽_p has that cotangent amplitude but fails p-torsion-freeness and is excluded.
- For the free p-complete δ-ring on x, prescribing x↦0 or x↦1 in ℤ_p determines δ(x)↦0 or (1−1^p)/p=0, respectively. The ordinary polynomial δ-ring with δ(x)=0 cannot be free: x↦p would force δ(p)=1−p^(p−1) to vanish, which it does not. For the perfect free ring, the same 0 and 1 evaluations in the perfect δ-ring ℤ_p persist; a nonperfect target such as ℤ_p[x]^∧_p lies outside its universal property.
- Over A=ℤ_p{x}^∧_p and R=A/(x^α), α≥1, the identity B=A is relatively perfect and x^α is regular, so this is a perfect-regular presentation. The exponent-one case meets the p-complete predicates yet its naive filtration is not a q-deformation (§5.20); these predicates do not assert the higher-power conclusion.

### 5.16 Staticity of de Rham and q-de Rham complexes of quasi-lci inputs

For p-completely perfectly covered A and p-torsion-free R with cotangent Tor-amplitude concentrated in degree 1, prove staticity and p-torsion-freeness of p-completed dR, its Hodge completion, the completed Hodge steps and qdR. The uncompleted Hodge steps are static precisely when R/p is relatively semiperfect. With a perfect-regular presentation, identify dR with the p-completed PD envelope and its Hodge filtration with the PD filtration, and qdR with the q-PD envelope. Do not substitute the larger amplitude interval [0,1] for concentration in degree 1 in this theorem.

(See QH Lemma 4.18(a), §4, p.61; Lemma 4.18(b), §4, p.61; Remark 4.19, §4, p.61.)

This uses HQ.5, HQ.2, HQ.1, DerivedDeRhamCohomology §§2.22–2.27, DerivedDeRhamCohomology §§PD.6, 2.24–2.26, 3.8 and 5.3–5.7, PrismaticCohomologyPartII §§3.13–3.16, PrismaticCohomologyPartII §§5.7–5.8.

### 5.17 The one-categorical preimage filtration, and the injectivity that always holds

For p-torsion-free p-quasi-lci R over the same A, with R/p relatively semiperfect, the complexes are static. Define the naive filtration as the ordinary preimage of the combined Hodge/h-adic ideals of dR[1/p][[h]] under the canonical qdR map. This is an ordinary filtered-module pullback, not a derived preimage. It is a filtration by ideals in a static ring and hence has a filtered E∞-structure, with a unique filtered map to fil_Hdg dR. Surjectivity after filtered reduction by h remains a separate question.

The ordinary static interface uses D=dR and Q=qdR, with comparison Q→D[1/p][[h]], q↦1+h, and a surjective projection Q→D with kernel (h). Constant-coefficient evaluation of the comparison equals localization of the projection. The Hodge ideals satisfy F_Hdg^0=D, descend and multiply, and each is the preimage of its localized ideal. This saturation follows from p-torsion-freeness of the Hodge associated graded modules. Define C^n in D[1/p][[h]] by the coefficient rule: for k<n, the coefficient of h^k lies in F_Hdg^(n−k)D[1/p]; coefficients with k≥n are unrestricted. Then F^n is exactly the comap of C^n. These primitive equations imply multiplicativity, hF^n⊆F^(n+1), the filtered projection and the injectivity identity below. They do not identify arbitrary ring models with dR or qdR and do not imply surjectivity of filtered reduction.

(See QH Construction 4.21, §4, p.62.)

This uses HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology §§2.22–2.27.

Use the following maps and laws:

- For R as above, the descending filtration of ideals of the static ring `q-dR_{R/A}`.
- x ∈ fil^i iff the image of x in `dR_{R/A}[1/p]⟦q−1⟧` lies in the i-th step of the combined Hodge and (q−1)-adic filtration.
- fil^i · fil^j ⊆ `fil^{i+j}`, and (q−1) fil^i ⊆ `fil^{i+1}`: a filtered E∞-algebra over (q−1)^⋆A⟦q−1⟧.
- The unique filtered map to fil^⋆_Hdg `dR_{R/A}` induced by the projection.
- The map from the reduction modulo q−1 to the Hodge filtration is degreewise injective.
- For a p-completely flat δ-map A→A′ of p-completely perfectly covered bases, set R′=(R⊗_A A′)^∧_p. Then `(F^•qdR_{R/A}⊗^L_A` `A′)^∧_{(p,h)}≃F^•qdR_{R′/A′}`; also retain functoriality in R (QH Lemma 4.27).

**Checks.**

- For R étale over A, `q-dR_{R/A}` = R⟦q−1⟧ (p-completed) and the filtration is the (q−1)-adic filtration; its reduction modulo q−1 is the Hodge filtration (R in degree 0).
- For A = Z_p{x}^∧_p and R = A/x, the filtration is not a q-deformation of the Hodge filtration.
- For R = A/x^2, the element γ_q(x^2) − `(u^{−1}` − 1)δ(x^2) + `u^{−2}(q−1)^{p−1}δ(x)^2`, with [p]_q = pu + `(q−1)^{p−1}`, lies in fil^p and reduces to `x^{2p}/p` modulo q−1 (Example 4.24).
- For A=R=ℤ_p, D=ℤ_p, Q=ℤ_p[[h]] and C^1=hℚ_p[[h]], the ordinary preimage is hℤ_p[[h]], hence static. The derived pullback instead has H^1=ℚ_p/ℤ_p: constant-coefficient evaluation identifies the cokernel of Q⊕C^1→ℚ_p[[h]] with this quotient, and 1/p represents a nonzero class. Thus the derived pullback does not define the static naive filtration.

### 5.18 The naive filtration is always injective modulo q−1

Under the naive-filtration hypotheses, prove injection F/β↪fil_Hdg dR degreewise. Equivalently `hF^{n−1}=F^n∩h·qdR` for every n. No perfect-regular presentation is needed. This gives injectivity before the additional conditions used to prove it is a q-deformation.

(See QH Lemma 4.26, §4, p.64.)

This uses HQ.5, HQ.2.

### 5.19 Higher powers of a Koszul-regular sequence make the naive filtration a q-deformation

If `R=B/(x_1^{α_1},…,x_r^{α_r})` has a perfect-regular presentation with every α_i≥2, the naive filtered reduction is fil_Hdg dR. Retain p-torsion-freeness, p-quasi-lci and relative semiperfectness over a p-completely perfectly covered δ-base. The theorem includes p=2 and does not require even exponents. The elementary proof constructs, inside each step of the naive filtration, lifts of the iterated divided powers of the generators. It then deduces surjectivity of the filtered reduction, and injectivity is §5.18; §5.26 gives the one-variable lifts explicitly. No spherical-lift hypothesis is used in this algebraic theorem (QH Remark 4.23, §4.2, p.63).

(See QH Theorem 4.22(a), §4.2, pp.62–63; Remark 4.23, §4.2, p.63; Example 4.24, §4.2, p.64 · TC Paragraph 3.15 and Lemmas 3.16–3.17, §3.2, pp.38–40.)

This uses HQ.5, HQ.2, PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71.

### 5.20 For the quotient by x itself the naive filtration is not a q-deformation

For A=ℤ_p{x}^∧_p and R=A/x, compute D_1=A{φ(x)/p}^∧_p and qD_1=A[[h]]{φ(x)/[p]_q}^∧_(p,h), where braces mean universal δ-adjoining in the PD and q-PD envelopes. The ordinary divided-power class x^p/p in the PD envelope has no lift in the p-th naive step. Here x is the image of the ambient free generator in that envelope; its image in R=A/(x) is zero and cannot represent this obstruction. Modulo h^p the correcting term involves u^(−2)h^(p−1)δ(x)/p, which is not integral and cannot be removed by hqD_1. Flat passage to the perfection gives the no-section witness. For x^α, α≥2, the expansion of δ(x^α) splits into an `x^{p(α−1)}-multiple` and a p-multiple, removing this obstruction.

(See QH Example 4.24, §4, p.63.)

This uses HQ.5, PrismaticCohomology §§0.55, 0.63 and 0.69–0.71.

### 5.21 Flat base change, which reduces the well-behavedness theorem to a perfect base

For a p-completely flat δ-map A→A′ between p-completely perfectly covered bases, and R satisfying the naive-filtration conditions, identify the (p,h)-completed scalar extension of the naive filtration with the naive filtration of R′=(R⊗^L_A A′)^∧_p. This permits reduction to the perfect base. It is a statement about the constructed static preimage filtration, not arbitrary q-Hodge pairs under flat base change.

(See QH Lemma 4.27, §4, p.65.)

This uses HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology §§2.22–2.27.

### 5.22 The global filtration for quasi-regular inputs, and the section it defines

For perfectly covered Λ-base A and R satisfying global condition (R), glue the p-complete naive filtrations and the rational combined Hodge/h-adic filtration by an arithmetic pullback in filtered E∞-algebras. The map from the product is a set-level submodule comparison. Restrict to `QReg_A^{qHodge}`, where each p-complete naive filtration is a q-deformation; obtain a canonical partial section with compatible filtered derived commutative structure conditional on `gap:filtered-graded-derived-commutative`. Prime-by-prime torsion-free higher-power perfect-regular quotients give objects. Condition (R) alone is not enough for membership.

(See QH Construction 4.28, §4, p.66; Theorem 4.29, §4, p.66; Remark 4.31, §4, p.67; Remark 4.30, §4, p.67.)

This uses HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology §§2.22–2.27.

Use the following maps and laws:

- The global arithmetic pullback filtration on algebras satisfying condition (R), with the specified maps to its rational and p-complete factors.
- The full subcategory on which every local naive filtration satisfies the degree-one q-deformation axiom; membership includes all prime-by-prime torsion-free higher-power perfect-regular quotients of §5.19.
- The canonical section on this subcategory, natural in algebra maps, with all comparison coherences; its filtered derived commutative refinement has the stated additional contract.

**Checks.**

- For A=R=ℤ, the local steps are h^max(i,0)ℤ_p⟦h⟧ and the rational steps h^max(i,0)ℚ⟦h⟧. Their arithmetic pullback is h^max(i,0)ℤ⟦h⟧. A product of only the local factors has coefficient ring ∏_pℤ_p in place of ℤ.
- In the free δ-base quotient by x at p=2, condition (R)'s cotangent-amplitude and semiperfectness tests hold, but the correction coefficient hδ(x)/2 is not integral. The naive filtration therefore fails the q-deformation test; condition (R) cannot replace membership in this subcategory.
- For a torsion-free perfect-regular quotient by x² at p=2, the lift Γ₁²/(q+1) reduces to x⁴/2 and belongs to filtration step 2. Omitting the higher-power hypothesis would include the preceding failed exponent-one example.

### 5.23 Tensor products of quasi-regular inputs and the operadic structure of the section

For R_1,R_2 in `QReg_A^{qHodge}`, if R_1⊗^L_A R_2 is static and torsion-free at every prime, it belongs to that class and its canonical filtration is the completed tensor of the two filtrations. Staticity and torsion-freeness are the tensor-closure conditions. Define the admissible simplicial subset as in the smooth case, keeping its composition limitation. On the full subcategory flat over A the tensor products remain in the class, giving a symmetric monoidal section.

(See QH Paragraph 4.32, §4, p.67; Lemma 4.33, §4, p.67; Corollary 4.34, §4, p.68.)

This uses HQ.5, DerivedModuleAlgebra §§0.4, 0.8–0.14, DerivedDeRhamCohomology §§2.22–2.27, EnhancedDerivedSheaves E5:abstract.

### 5.24 In what sense each section is unique, and what extra datum the smooth case needs

Target uniqueness of the quasi-regular section by terminality of the canonical filtration among pairs over the same qdR; the q-deformation axiom makes any such map an equivalence. In the smooth dimension-dependent class the canonical filtration is instead initial, only after requiring compatibility with qΩ→Ω[[h]]/h^n or a compatible ℤ_p×-action at every p. The source announces these uniqueness assertions without full body proofs. The smooth extra normalization must remain a hypothesis; the two directions of the universal property must remain distinct.

(See QH Paragraph 1.21, §1, p.10.)

This uses HQ.5, HQ.3.

### 5.25 What is exported for finite etale arithmetic inputs, and the comparison that is not claimed

For étale R over perfectly covered A, the canonical H object is the static coefficient ring E(R/A), denoted `H_{R/A}`, with H/(q^m−1)≃qW_m(R/A) and H^∧_h≃R⟦h⟧. The map to the latter is the canonical h-completion map of §§0.3 and 4.21, compatible with all the partial projections. For R=O_F[1/Δ], with the discriminant inverted, HabiroRings subsequently identifies its ordinary model and the GSWZ ring by the exported étale comparison contract. HabiroRings Layer 6 consumes the degree-zero and Taylor interfaces for arithmetic modules. Their K_3(F)-indexed modules and possible loss under Taylor completion are separate constructions; a finite étale ring comparison supplies no higher-dimensional cohomology class identification.

(See QH Corollary 3.13, §3, p.27; Corollary 2.13, §2, p.19; Paragraph 1.4, §1, p.4 · GSWZ Definition 1.1, §1.4, pp.6–7.)

This uses HQ.5, HQ.3 and §§0.3, 4.21 and 4.28.

### 5.26 Finite-coefficient q-Hodge pairs: higher-power quotients and ℤ/m

Fix p and the free p-complete δ-ring B=ℤ_p{x}^∧_p. Let D_α be the p-completed PD envelope of (x^α) and `qD_α=B⟦q−1⟧{φ(x^α)/[p]_q}^∧_{(p,q−1)}` its q-PD envelope; these are dR and qdR of B/x^α over B (QH Example 4.24, §4.2, p.63). Take α≥2 and any p, p=2 included. Then the naive filtration of §5.17 on qD_α is generated, as a (p,q−1)-complete filtered qD_α-algebra, by q−1 in filtration degree one and, for each n≥0, an explicit lift `γ̃^{(n)}_q(x^α)` in filtration degree p^n of the n-fold iterated divided power `γ^{(n)}(x^α)`. The lift is Γ_n^α divided by `∏_{i=1}^n` `Φ_{p^i}(q)^{p^{n−i}}`. Here Γ_0=x and `Γ_n=φ(Γ_{n−1})−Q_n(q)Φ_{p^n}(q)δ(Γ_{n−1})`, where P_n,Q_n∈ℤ[q] are any polynomials with `p=P_n(q)(q−1)^{(p−1)p^{n−1}}+Q_n(q)Φ_{p^n}(q)`. The divisibility of Γ_n^α by that product in qD_α uses α≥2, and p-torsion-freeness of the relevant quotients of B[q] uses flatness of the Frobenius. Surjectivity of the filtered reduction then follows, and with the injectivity of §5.18 this is the one-variable case of §5.19, proved without any spherical lift (TC Paragraph 3.15, Lemma 3.16 and Lemma 3.17, §3.2, pp.38–40).

Call m≥1 *powerful* if v_p(m)≥2 for every prime p dividing m. For such m and p|m, base change along the δ-map B→ℤ_p, x↦p, gives a filtration F_p of `qdR_{(ℤ/p^{v_p(m)})/ℤ_p}` satisfying clause (b), with the p-local rational clause inherited from the naive filtration as in §5.22. Globally, ℤ/m is not covered by condition (R): it is not torsion-free. Glue the F_p with the rational corner as in §5.22. The non-Hodge-completed derived de Rham complex of the zero ℚ-algebra is ℚ (write `0=ℚ⊗_{ℚ[y]}ℚ` along y↦0 and y↦1, and use the Poincaré lemma). So `dR_{(ℤ/m)/ℤ}⊗^Lℚ≃ℚ`, with all Hodge graded pieces zero and hence the constant Hodge filtration, and the rational corner of `qdR_{(ℤ/m)/ℤ}` is ℚ⟦q−1⟧ with the constant filtration. Put `C_p=((dR_{(ℤ/p^{v_p(m)})/ℤ_p})^∧_p)[1/p]`, with p-completion taken before inverting p. Define F on `qdR_{(ℤ/m)/ℤ}` as the pullback of `∏_{p|m}F_p` and this constant rational filtration over the constant filtration on `(∏_{p|m}C_p)⟦q−1⟧`, using the canonical rational comparison maps. The overlap is constant because its Hodge graded pieces vanish after inverting p. Retain C_p as the actual rationalisation: it need not be ℚ_p. Infinite p-adically convergent sums of divided-power torsion classes can survive rationalisation, although each finite divided-power polynomial becomes a scalar (Bhatt Proposition 8.5, p.32, and the completion warning in Remark 8.7, p.33). Prove that (ℤ/m,F) is a q-Hodge pair over ℤ: (a) and (b) hold cornerwise, (c) holds by construction, (c_ℓ) is vacuous for ℓ∤m, and (c_p) for p|m is the local clause. Prove that `qdR_{(ℤ/m)/ℤ}` and `qHdg_{(ℤ/m)/ℤ}` are static and (q−1)-torsion-free, and that F is a descending filtration by ideals. For staticity of the arithmetic pullback, first reduce modulo q−1. Here the p-local complex is the cokernel of multiplication by y−p^α on the p-completed PD polynomial algebra, whose injectivity follows successively on coefficients starting at degree zero. Every polynomial class differs from an integral scalar by a p-power torsion class. For any d/p^k∈C_p, approximate d modulo p^k by a divided-power polynomial; consequently d/p^k is the sum of an integral local class and a scalar in ℚ_p. Thus the local-to-overlap map together with `ℚ→∏_{p|m}ℚ_p` is surjective, by finite-prime approximation, without identifying C_p with ℚ_p. Derived (q−1)-completeness then lifts staticity and (q−1)-torsion-freeness to qdR. Use the local higher-power filtration theorem for qHdg; its arithmetic overlap is a constant filtration and disappears under the completed modification. A constant filtration has zero filtration completion. Its modification colimit is its h-localization, whose h-completion is zero; it therefore contributes zero to qHdg. Hence the completion of F is `∏_{p|m}F_p^∧`, the q-Hodge complex is `∏_{p|m}qHdg(F_p)`, and so is its β-periodic object (§4.28). For m|m′ with both powerful, the quotient ℤ/m′→ℤ/m is a map of pairs: it is induced by `B/x^{α′}→B/x^α`, using functoriality of the naive filtration (§5.17) and of base change. This gives a contravariant functor from powerful integers, ordered by divisibility, to the category of pairs over ℤ.

The source defines the pair for its "high-powered" integers: exponent at least 2 at odd primes, and even and at least 4 at 2. That condition is needed only to choose compatible E₁ quotient spectra, and those integers are cofinal among powerful ones. As a downstream consumer, RefinedTraceMethods compares the completed filtration with the even filtration of TC⁻((ku⊗S/m)/ku) and proves independence of the chosen lift. HabiroCohomologyFoundationsPartII uses this algebraic pair and the trace comparison for its finite-coefficient trace application. The spectral quotient construction retains the high-powered restriction; it is not a hypothesis of the algebraic pair above. The source also asserts that the global uncompleted `qdR_{(ℤ/m)/ℤ}` is p-complete and that clauses (c) and (c_p) are vacuous because the rationalisations vanish. This fails for the non-Hodge-completed complex, whose rationalisation is ℚ⟦q−1⟧. The completed filtration and the q-Hodge complex that the source uses are unaffected, which is why the gluing above, rather than the bare product, is the definition of the pair (TC Paragraph 3.5 and Lemma 3.7, §3.1, pp.31–32; Paragraph 3.3, §3.1, p.30).

(See TC Paragraph 3.3, §3.1, p.30; Paragraph 3.5, §3.1, p.31; Lemma 3.7, §3.1, p.32; Paragraph 3.15 and Lemmas 3.16–3.17, §3.2, pp.38–40 · QH Construction 4.21, §4.2, p.62; Theorem 4.22(a), §4.2, p.62; Remark 4.23, §4.2, p.63; Example 4.24, §4.2, pp.63–64; Paragraph A.14, §A.2, p.76.)

This uses HQ.5, HQ.3, HQ.2, HQ.1, PrismaticCohomology §§0.55, 0.63 and 0.69–0.71, PrismaticCohomologyPartII §§5.7–5.8, DerivedDeRhamCohomology §§2.22–2.27, DerivedDeRhamCohomology §4.6.

Use the following maps and laws:

- For α≥2 and n≥0, the element `γ̃^{(n)}_q(x^α)=Γ_n^α/∏_{i=1}^nΦ_{p^i}(q)^{p^{n−i}}` of `fil^{p^n}qD_α`, reducing to `γ^{(n)}(x^α)` modulo q−1.
- The naive filtration on qD_α is generated by q−1 in degree one and these lifts, as a (p,q−1)-complete filtered algebra.
- m≥1 and v_p(m)≥2 for every prime p dividing m.
- For powerful m, the q-Hodge pair (ℤ/m,F) glued from the base-changed local filtrations and the constant rational filtration.
- `F^≃∏_{p|m}F_p^∧` and `qHdg_{(ℤ/m)/ℤ}≃∏_{p|m}qHdg(F_p)`; both are static and (q−1)-torsion-free.
- `(F^i⊗^Lℚ)^∧_{(q−1)}≃ℚ⟦q−1⟧` for every i, with identity transitions.
- For powerful m|m′, the map of pairs induced by ℤ/m′→ℤ/m, functorial along divisibility.

**Checks.**

- m=1: ℤ/1=0 and every p-local factor vanishes, yet `qdR_{0/ℤ}≃ℚ⟦q−1⟧` with the constant filtration. Its completion and its q-Hodge complex are 0. A definition that sets the pair to the empty product misplaces the rational corner.
- m=4 is powerful but not high-powered. The algebraic construction applies, since Theorem 4.22(a) needs no evenness at p=2 (QH Remark 4.23), while the source's E₁ quotient spectra are not provided.
- Exponent one is excluded: for m=12 the factor at 3 would be the base change of B/x, whose naive filtration is not a q-deformation (§5.20). This says nothing about other filtrations on `qdR_{(ℤ/3)/ℤ}`.
- Modulo q−1 the local factor at p is the Hodge filtration on `dR_{(ℤ/p^α)/ℤ_p}`, the p-completed quotient ℤ_p⟨y⟩/(y−p^α) of the divided-power polynomial algebra. Its class `y^{[p]}−p^{αp}/p!` is p-torsion and nonzero: the unique formal preimage under y−p^α has coefficient 1/p at `y^{[p−1]}`. At p=α=2 this is `y^{[2]}−8`, killed by 2. So the local factor is neither ℤ_p nor p-torsion-free, and only (q−1)-torsion-freeness is asserted.
- The overlap cannot be replaced by ℚ_p. Write z=y−p^α in the PD polynomial model, with α≥2. Translation by p^α is integral in this model. In the cokernel of multiplication by z on the p-completed PD polynomial algebra, the convergent sum `∑_{r≥1}p^{⌊r/2⌋}γ_{p^r}(z)` has scalar evaluation zero and is not killed by any p^k: in the `γ_{p^r}(z)` coordinate, every multiple of z is divisible by p^r, whereas `p^{k+⌊r/2⌋}` is not when r is sufficiently large. Its image in C_p is therefore nonzero. Replacing C_p by its scalar quotient would lose this class.
- At p=2 and n=1, P_1=−1 and Q_1=1 satisfy 2=−(q−1)+(q+1); the choice P_1=Q_1=1 gives 2q instead. So Γ_1=φ(x)−(q+1)δ(x)=x²−(q−1)δ(x), and `γ̃^{(1)}_q(x^α)=Γ_1^α/(q+1)` reduces modulo q−1 to `x^{2α}/2`.

### Examples

The affine line over ℤ needs no prime inverted for existence, but its square requires 2 inverted for the multiplication constructed here. For the free δ-ring quotient by x the naive filtration fails, while the quotient by x² has the displayed integral correction, including at p=2.

### Dependencies

The preceding constructions in this layer and EnhancedDerivedSheaves, DerivedDeRhamCohomology, PrismaticCohomology, Layer 0, QWittVectors. The subsection dependencies above specify the exact stages and maps.

## Layer 6: The analytic comparison problem (HQ.6)

The following targets pose and delimit a comparison problem; they do not supply an analytic equivalence.

### 6.1 The comparison problem, stated with its domain, its coefficient change and its status

Keep an open comparison problem for smooth ℤ-schemes X with primes ≤dim(X/ℤ) inverted: compare algebraic RΓ(X,H_X) with the cohomology of the analytic Habiro stack after a specified suitably completed localization of H^an, and determine its equivalence range. Ask the analogous question for the arithmetic coefficient rings and regulator line bundles. The required analytic model consists of an analytic ring H^an with a map from the algebraic coefficient object, a functor X↦X^Hab with structural maps to its coefficient stack and a solid section functor, and specified completed localization maps on both sides. Neither those objects nor the localization are asserted to be supplied by an earlier roadmap. Constructing that model and choosing its precise localization are prerequisites to formulating the proposed transformation; this paragraph asserts no analytic comparison theorem. The expected equality loses information on both sides and is not an equivalence of the original theories or a hypothesis for later theorems.

(See QH Paragraph 1.17, §1, pp.8–9; Paragraph 1.3, §1, p.3; Paragraph 1.4, §1, p.4.)

This uses §§0.1 and 5.13 for the algebraic side; an analytic model and its localization as specified above are required to formulate the comparison.

Use the following maps and laws:

- The class of X on which both sides are defined: smooth over Z with the primes p ≤ dim(X/Z) invertible.
- The construction problem of specifying H^an, the coefficient maps and the exact completed localization of both sides before a comparison map can be stated. This is an input specification, not an existing coefficient functor.
- The natural transformation to be constructed, at the levels of complexes, rings and line bundles.
- The base change is not conservative on either side; an equivalence after it is not an equivalence of the theories.
- The algebraic constructions use no analytic comparison hypothesis.

**Checks.**

- Already for X = Spec O_F[1/Δ] the source says Spf `H_{O_F[1/Δ]}` does not precisely match (Spec O_F[1/Δ])^Hab; a formulation asserting an equivalence before the completed localisation fails this case.
- For X of relative dimension d without the primes p ≤ d inverted (for example A^2_Z), the algebraic side is not defined and the problem does not arise.
- For X over Z[1/N], the algebraic side has every prime p ≤ dim X inverted while the analytic side does not (N is not invertible everywhere on Z[1/N]^Hab); any comparison therefore has to invert those primes on the analytic side, which is part of the completed localisation.
- The constructions of the global q-de Rham complex, chosen q-Hodge descent and canonical algebraic Habiro cohomology use no analytic comparison; specifying or proving that comparison supplies none of their defining data.

### 6.2 Small primes, roots of unity and the absence of a stacky approach

Retain the source's three distinctions in that problem. The algebraic construction inverts the locally required small primes; the analytic account cited by QH can retain their information. At roots of unity the analytic stack's specialization is the infinitesimal/de Rham-stack theory, not the algebraic q-Witt specialization. Finally, the dimension bounds on diagonals and tensor powers limit the available multiplication coherence on the algebraic side. The first distinction follows from construction; the latter stack behavior and expectation about global commutative structure have the scope of the cited analytic account and do not constitute a non-existence theorem.

(See QH Paragraph 1.17(a), §1, p.8; Paragraph 1.17(b), §1, p.9; Paragraph 1.17(c), §1, p.9; Paragraph 1.17, §1, pp.8–9.)

This uses HQ.6, HQ.3, HQ.5, HQ.4.

### 6.3 The discipline: a language for a comparison is not a comparison

Use analytic and condensed theories as suppliers of language and actual objects, without treating their existence as a proof of the open comparison. Layer 0 and the algebraic constructions use the enhanced derived category of modules and its completed tensor. A solid analytic model requires a coefficient category and its bounded-below tensor compatibility, with the localization and product-continuity hypotheses used in QH Lemma B.8. These are required mathematical constructions in the analytic problem, not an imported theorem. Record this as the solid-coefficient requirement, an obligation on the analytic comparison's target, rather than a prerequisite for algebraic Habiro descent. No six-functor formalism is required for an algebraic result here. An analytic-stack assertion drawn from Scholze's cited lecture course remains an assertion from that source until that analytic construction and its actual specialization maps have been specified and proved.

(See QH §B, pp.77–81; Lemma B.8, §B, p.79; bibliography, pp.81–82.)

This uses §6.1 and §0.1; the required analytic and solid constructions enter only the analytic problem.

**Checks.**

- On the algebraic coefficient unit L_H(A[q]), the tensor and h-completion of §0.1 are defined before choosing any solid analytic target. Omitting the analytic comparison leaves this unit calculation unchanged.
- The solid tensor assertion, once its coefficient category is constructed, is for bounded-below inputs as in QH Lemma B.8. A family with no common lower bound cannot be passed through that assertion by forgetting its bound; no unbounded solid closure is exported here.
- Continuity through products is extra data: even the map `(∏_{n≥0}ℤ)⊗ℚ→∏_{n≥0}ℚ` misses (1/(n+1)!)_n, which has no common denominator. An analytic construction that moves rationalization through an infinite product without its own continuity estimate fails this test.

### Examples

The affine arithmetic example Spec O_F[1/Δ] already needs a completed analytic localization before any proposed comparison. The affine plane over ℤ is outside the algebraic canonical domain until 2 is inverted; a coefficient-change formulation must respect both restrictions.

### Dependencies

Sections 6.1–6.3 specify an analytic research problem with unsupplied analytic objects and localization; the algebraic coefficient interface is §0.1. No analytic statement is a supplier to Layers 0–5.

## Layer 7: Worked examples and suggested interfaces (HQ.7)

These computations distinguish the definitions and verify the proposed interface. They exercise the established comparison statements and their hypotheses.

### 7.1 Polynomial, étale and scheme examples

Work through polynomial, finite étale, small-prime-inverted smooth-scheme examples under the two supplied specializations, q=1 and the local q-de Rham prism. For A[x], D_q(x^r)=[r]_q x^(r−1), while the q-Hodge differential is (q^r−1)x^(r−1). For the latter M, H^0(M/^Lh)=ℤ[x] but H^0(M)/h=ℤ, with the difference carried by H^1(M)[h]. The étale arithmetic case gives H and its q-Witt reductions. ℤ[x]⊗ℤ[x]=ℤ[x,y] leaves the canonical smooth class until 2 is inverted. The Laurent ℚ example distinguishes dR from Hodge-completed Ω. None of these examples uses the analytic comparison.

(See QH Remark 1.13, §1, p.7; Paragraph 1.10, §1, p.6; Paragraph 1.17(c), §1, p.9; Remark 3.6, §3, p.22.)

This uses HQ.1, HQ.3, HQ.5, HQ.2.

### 7.2 Native and enhanced signature interfaces

The polynomial Jackson operator is imported from HabiroCyclotomicCompletions §1.1. Its divided-difference identity, twisted product rule and derivative specialization hold over every commutative coefficient ring. Multiplying it by h gives the framed q-Hodge differential xⁿ↦(qⁿ−1)xⁿ⁻¹, which vanishes at q=1, including for n=0. Over ℤ[q], [2]_q=2+(q−1) and [3]_q=3q+(q−1)²; at q=2, [2]_q−(q−1)=2 and [2]_q+(q−1)=4. On the Laurent torus, `torusScaleHom` is the coordinate scaling of §1.23, with action law `torusScaleHom_action` and invertible characterization `torusScale_exists_unique`. The decomposition `cyclotomic_prime_decomposition` of §8.2 is the integral identity behind the denominators of §§1.5–1.8. Coherent pairs, completion, animation, décalage and cohomology objects use the enhanced suppliers of Layers 1–5. An ordinary categorical cokernel is sufficient only where staticity and vanishing of the preceding kernel have first been proved.

(See QH Remark 1.13, §1, p.7; Definition 3.2, §3, p.20.)

This uses HQ.1, HQ.3, HQ.4, Mathlib geom_sum_mul, Mathlib Polynomial.comp, Mathlib Polynomial.derivative_X_pow, Mathlib Polynomial.cyclotomic_prime.

**Checks.**

- The framed q-Hodge differential sends each constant a to zero for every q over any commutative coefficient ring; exponent zero contributes no term.
- At q=1 the framed q-Hodge differential is zero on every polynomial, while the Jackson operator is the ordinary derivative. For f=x this distinguishes zero from one.
- At q=2 over ℤ, the framed q-Hodge differential sends x² to 3x, agreeing with (q²−1)x. At q=1 over 𝔽₂, the Jackson derivative of x² is zero; replacing characteristic-two differentiation by the characteristic-zero value 2x fails this test.

### Examples

In the coordinate pair over ℤ[x], H⁰(M/^Lh)=ℤ[x] while H⁰(M)/h=ℤ. The missing polynomial classes are detected by h-torsion in H¹(M), so reduction of cohomology cannot replace cohomology of a derived reduction.

### Dependencies

The preceding layers and their stated suppliers. The subsection dependencies above specify the exact stages and maps.

## Layer 8: Comparison squares and specialization compatibility (HQ.8)

Use the previously constructed maps. For every square, retain the coefficient base and the order of derived operations; add no equivalence before its necessary base change.

### 8.1 Comparison-square data

Define a comparison-square record with four named functorial corners and four actual maps, together with: coefficient base, input class, completion ideal for each corner, inversion and its order, Frobenius linearization, filtrations, and Tate/Breuil–Kisin twists. State whether its conclusion is an equivalence, a base-changed equivalence, a map or a torsion exact sequence. The domains are intersections of the hypotheses of the imported maps. This is mathematical bookkeeping rather than a construction of any corner. Keep distinct the q-PD ideal (h), prism ideal ([p]_q), perfectoid ξ=φ^(−1)([p]_q), and cyclotomic quotient q^m−1. The corners and compositions are the specified enhanced constructions; the parameter record carries none of their existence or equivalence assertions by itself.

(See QH Theorem A.1(b), §A, p.69; Definition 3.2, §3, p.20; Paragraph 1.17, §1, pp.8–9 · BS Notation 16.1, §16, p.106.)

This uses HQ.1, HQ.2, HQ.3.

Use the following maps and laws:

- The record of a square: base, input class, completion ideal, inversion, linearisation, source and target filtration, twist and loss, one field each.
- Four specified enhanced corners and four maps on their common input domain, with a coherent equality of the two composites; the following fields record hypotheses and coefficient operations rather than supply arbitrary substitute corners.
- The base vocabulary: the q-de Rham prism at p, the q-PD pair (Â_p⟦q−1⟧, (q−1)) at p, the perfectoid base at p with the primitive system ε of §8.2, the global ring A⟦q−1⟧, or A[q]/(q^m − 1).
- The input classes: smooth, smooth with a q-Hodge filtration, p-completely smooth, smooth proper, quasi-lci, quasi-syntomic.
- The completion ideals: (p, q−1) (equivalently (p, [p]_q)), (p, ξ) in A_inf, (p), (q−1), (q^m − 1).
- Nothing inverted; p-complete then rationalise then complete at q−1; rationalise then complete at q−1.
- None, ψ^p with q ↦ q^p, its α-fold iterate, or the Frobenius pullback φ_A^* over A_inf.
- None, Hodge, combined Hodge and (q−1)-adic, Nygaard, conjugate, stupid, twisted q-Hodge, décalage, q-de Rham–Witt.
- Trivial, or a Breuil–Kisin twist {n}.
- Whether the comparison is an equivalence outright, after a named base change, a map only, or a short exact sequence.
- The record of the local prismatic square at p: q-de Rham prism, smooth, (p, q−1), nothing inverted, ψ^p, no filtration, trivial twist, outright.
- The record of the q-crystalline compatibility square: q-PD pair (Â_p⟦q−1⟧, (q−1)), p-completely smooth, (q−1), p-complete then rationalise then h-complete, no linearisation, no filtration, outright.
- The record of the A_inf square: perfectoid base with the primitive system ε of §8.2, smooth over ℤ, (p, ξ), nothing inverted, φ_A^*, no filtration, trivial twist, only after base change.
- The record of the décalage square at q−1: A⟦q−1⟧, smooth with a chosen q-Hodge filtration, (q−1), nothing inverted, source Lη_h(qHdg) and target qΩ; h-complete over A[[h]], no inversion or Frobenius, trivial twist; an equivalence. The chosen filtration constructs qHdg.
- The record of the décalage square at [p]_q: q-de Rham prism, smooth, (p, q−1), ψ^p, Nygaard on the source and décalage on the target, outright.
- The record of the Nygaard square at p and α: q-de Rham prism, smooth, (p), α-fold Frobenius twist, Nygaard on both sides, outright.
- The record of the crystalline square at p and α: `A[q]/(q^{p^α}` − 1), smooth, (p), `ψ^{p^α}`, q-de Rham–Witt filtration and stupid filtration, a map only.
- The record of the square at q = 1: A⟦q−1⟧, smooth, (q−1), nothing inverted, a torsion short exact sequence; the conjugate-filtered version additionally requires a chosen q-Hodge pair.

**Checks.**

- On the coefficient unit S=A=ℤ, the local prismatic comparison sends 1 to 1 in ℤ_p[[h]]. The two base ideals have quotients B/(h)=ℤ_p and B/(Φ_p)=ℤ_p[ζ_p]; at p=2 their parameters are h and h+2. Interchanging them changes the specified coefficient maps.
- On the linear summand of the coordinate pair on ℤ[x], qHdg is [B —h→ B] with H¹=B/h, while Lη_h gives [B —1→ B] with H¹=0, agreeing with qΩ. Recording the source as qHdg without décalage fails this square.
- For the coefficient ℚ, p-completion followed by p-inversion is 0. Starting with ℤ and p-completing before inverting gives ℚ_p≠0; for p=2 and 3 these are ℚ₂ and ℚ₃. A record omitting the order of operations conflates these values.

### 8.2 The two bases, imported, and the congruences that identify completion ideals across corners

For a prime p, import the q-de Rham prism over ℤ_p and its base change to p-torsion-free Â_p. Its δ(q)=0, [p]_q≡p mod h and φ(h)=h[p]_q. In its prism quotient, h^(p−1) and p differ by a unit, giving equality of derived (p,[p]_q)- and (p,h)-completion. The unit comes from the integral decomposition `[p]_q=p·u+(q−1)^{p−1}` with u∈ℤ[q] and u(1)=1. To prove it, expand [p]_q=((h+1)^p−1)/h binomially; every binomial coefficient strictly between the ends is divisible by p. At p=2 one has u=1, since [2]_q=2+h, and at p=3 one has u=1+h, since [3]_q=3(1+h)+h². The Lean milestone is `cyclotomic_prime_decomposition`. The same decomposition drives the denominator estimates of §1.5–1.8 and the correction terms of §5.17 and §5.20. For a characteristic-zero perfectoid field C, choose primitive pⁿ-th roots ζ_(pⁿ) for every n≥1 with ζ_(pⁿ⁺¹)ᵖ=ζ_(pⁿ), and put ε=(1,ζ_p,ζ_(p²),…)∈O_C^♭. With this primitive system, put A_inf=W(O_C^♭), q=[ε], μ=h and ξ=φ^(−1)([p]_q). Import the bounded-prism and q-PD-pair maps ℤ_p[[h]]→A_inf; their complete flatness upgrades to flatness, and the map is faithfully flat. Fontaine θ(q)=1, ker θ=(ξ); (p,ξ),(p,[p]_q),(p,μ) have the same radical. PrismaticCohomologyPartII §§5.1–5.6's q-PD property includes φ(I)⊂[p]_qD, γ(I)⊂I, bounded prism (D,[p]_q), and the p-torsion-free finite complete Tor-amplitude condition on D/h. None is another chosen divided-power structure.

(See BS Notation 16.1, §16, p.106; Definition 16.2, §16, p.106; Notation 17.1, §17, p.117 · QH Lemma A.6, §A.1, pp.71–72; Example 4.24, §4.2, p.64.)

This uses HQ.1, PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71, PrismaticCohomologyPartII §§5.1–5.6, DerivedModuleAlgebra §§1.1–1.4, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib geom_sum_mul, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib PreTilt, Mathlib WittVector.teichmuller, Mathlib WittVector.fontaineTheta, Mathlib WittVector.fontaineTheta_teichmuller.

**Checks.**

- At p=2, [2]_q=2+(q−1), so u=1; at p=3, [3]_q=3q+(q−1)², so u=q and u(1)=1.
- The p=2 correction uses 2=−(q−1)+(q+1). The opposite sign gives 2q, which evaluates to 4 at q=2 rather than 2; this is the sign used in §5.26.
- The trivial compatible system ε=(1,1,…) gives q=1, h=0 and ξ=p, with θ(ξ)=p≠0 in O_C. It cannot define the asserted prism parameter or the faithfully flat coefficient map. The same primitive choice is used in §§8.1, 8.6, 8.18 and 8.19.
- The prime hypothesis excludes p=0 and p=1. No cyclotomic-prism or ramification conclusion is inferred for these indices from the polynomial evaluation identities.

### 8.3 Domains of the comparisons

The comparisons below apply to their displayed input classes after their specified operations. Smooth chosen pairs yield the h-décalage statement; no general animated Habiro descent of qdR is supplied. The perfectoid comparison is after a non-conservative base change selecting p and depends on ε. The analytic comparison remains a separate problem after a completed localization. Define the local objects and filtrations independently before comparing them, so that a comparison does not supply its own prerequisites.

(See QH Paragraph 1.17, §1, pp.8–9; Remark 3.48, §3, p.49 · BS Theorem 17.2, §17, p.117.)

This uses HQ.8, HQ.3, HQ.6.

### 8.4 The p-complete square: the global complex against prismatic cohomology over the q-de Rham prism

For smooth S over prime-by-prime torsion-free Λ-base A, compose `(qΩ_{S/A})^∧_p≃qΩ_{Ŝ_p/Â_p}` with PrismaticCohomologyPartII §5.13's q-crystalline/prismatic equivalence to `Δ_{S^(p)[ζ_p]/Â_p[[h]]}`. Arithmetic gluing commutes with this comparison by its defining corner. Record: q-de Rham prism at p; smooth inputs; (p,h) completion, equivalently (p,[p]_q); no inversion; coefficient ψ^p and q↦q^p; no filtration or Tate twist; an E∞-equivalence at p. The Frobenius-twisted S is indispensable.

(See QH Theorem A.1(b), §A, p.69; Construction A.12, §A, p.75; Theorem A.1, §A, p.69 · BS Theorem 16.18, §16, p.113.)

This uses HQ.8, HQ.1, PrismaticCohomologyPartII §5.13.

### 8.5 q-crystalline cohomology against the framed q-de Rham complex, and the coordinate-free comparison

For a q-PD pair (D,I) with D flat over ℤ_p[[h]], p-completely smooth R over D/I, and a surjection from a p-completely ind-smooth D-algebra with p-completely ind-étale framing X_s, import PrismaticCohomologyPartII §§5.14–5.21's unique extensions γ_s to the q-PD envelope, congruent to id modulo hX_s. The Koszul complex of (γ_s−id)/(hX_s) computes q-crystalline cohomology. In the special pair (Â_p[[h]],(h)), the coordinate-free and framed rational comparisons form HQ.1's commuting envelope square. Record: that q-PD base and framed presentation; p-completion, then rationalization, then h-completion; no Frobenius linearization, filtration or twist; the resulting equivalences hold after these operations. The framed models remain frame-dependent.

(See BS §16.3, p.114; Lemma 16.21, §16, p.115; Theorem 16.22, §16, p.115 · QH Lemma A.10, §A, p.74.)

This uses HQ.8, HQ.1, PrismaticCohomologyPartII §§5.14–5.21.

### 8.6 The A_inf square, over the perfectoid base

For p, a characteristic-zero perfectoid C with the primitive system ε fixed in §8.2 and p-completely smooth R/O_C, import PrismaticCohomologyPartII §§5.22–5.24's `AΩ_R≃qΩ_{R/A_inf}≃φ_A^*Δ_{R/A_inf}`, Frobenius-compatible. Here qΩ is over the pair (A_inf,(ξ)). The initial E_1 comparison upgrades to E∞ by the source's semiperfectoid left Kan extension and quasisyntomic descent. For smooth ℤ-algebra S and R=(S⊗O_C)^∧_p, define `β_S:qΩ_{S/ℤ}⊗̂_{ℤ[[h]]}A_inf≃AΩ_R` as the composite of the local square, bounded-prism base change, the q-crystalline comparison and this AΩ comparison. Likewise allow torsion-free Λ-base A with a δ-map Â_p→A_inf. Record: chosen perfectoid base; (p,ξ)-completed tensor; no inversion; φ_A-pullback; no filtration or Tate twist; equivalence after this base change. The original global theories are not thereby equivalent.

(See BS Notation 17.1, §17, p.117; Theorem 17.2, §17, p.117; Remark 17.3, §17, p.117; Theorem 1.8, §1, p.4; Corollary 4.12, §4, p.40 · Sch Conjecture 4.3, §4, p.9.)

This uses HQ.8, HQ.1, PrismaticCohomology §§0.1–0.7, 0.29–0.40 and 0.55–0.71, PrismaticCohomology §§1.4 and 1.21, PrismaticCohomologyPartII §§5.22–5.24, AInfCohomology AI.3.

### 8.7 The décalage square at q − 1

For a smooth q-Hodge pair over perfectly covered A, the square is Lη_h qHdg≃qΩ, compatible with h-completion and with the Habiro descent. Record: A[[h]] with h; chosen smooth pair; h-complete objects; no inversion or Frobenius; chosen q-Hodge filtration and the unfiltered qΩ target; trivial twist; an equivalence on this class. Import AI.1's formula H^i(η_IK)=(H^iK/H^iK[I])⊗I^⊗i for I-torsion-free models, and its completion commutation for invertible locally rank-one I in a replete topos. The Beilinson connective-cover description requires a Cartier divisor. Lη is not exact; no exactness is used here.

(See QH Proposition 3.47(b), §3, p.48 · BMS1 Lemma 6.4, §6, p.49; Lemma 6.20, §6, p.55 · BMS2 Proposition 5.8, §5, p.32.)

This uses HQ.8, HQ.2, HQ.3, AInfCohomology AI.1.

### 8.8 The décalage square at the prism ideal: the relative Frobenius of the p-completed q-de Rham complex

For smooth S over perfectly covered A, let B=Â_p[[h]], J=([p]_q) and T=S^(p)[ζ_p]. Transport PrismaticCohomologyPartII §§3.13–3.16's relative-Frobenius equivalence `Δ_{T/B}⊗̂_{B,φ_B}B≃Lη_JΔ_{T/B}` through the local square to `(qΩ^(p))^∧_p≃Lη_{[p]_q}(qΩ)^∧_p`. Record: bounded q-de Rham prism; smooth p-adic formal input T over B/J; (p,h)-completion; no inversion; ψ^p with q↦q^p; Nygaard on the source and décalage filtration on the target; no additional Tate twist; an equivalence at p. This supplies the twisted gluing datum without confusing [p]_q with h.

(See QH Paragraph 3.14, §3, p.28; Paragraph 3.20, §3, p.32 · BS Theorem 15.3, §15, p.103.)

This uses HQ.8, HQ.2, HQ.4, PrismaticCohomologyPartII §§3.13–3.16, AInfCohomology AI.1.

### 8.9 Filtration-gluing obstruction

The canonical filtrations of the décalages in the twisted construction fail to agree on its evident gluing square. At m=p the trivial filtration of the identity piece on the Frobenius twist is incompatible with the natural filtration on `Lη_{[p]_q}(qΩ)^∧_p`. A candidate global Nygaard filtration would need the prescribed p-adic filtration, the combined rational Hodge/[p]_q filtration, and the corresponding agreements at every other prime. A chosen q-Hodge pair supplies the necessary data. This is an obstruction to that particular canonical construction, not a theorem excluding every possible descent without a pair.

(See QH Remark 3.18, §3, p.30; Remark 3.49, §3, p.49.)

This uses HQ.8, HQ.2, HQ.4, AInfCohomology AI.1.

### 8.10 The Nygaard filtrations on the two sides, and the staging that keeps the argument non-circular

For smooth S over perfectly covered A and a≥1, compare the prismatic Nygaard filtration on (qΩ^(p^a))^∧_p with the explicit q-Witt Nygaard filtration after the degree-one filtered quotient by `q^{p^a}−1`. The unique filtered E∞-equivalence extends the twisted deformation at filtration degree zero. Record: q-de Rham prism with iterated Frobenius and cyclotomic reduction; smooth inputs; p-completion; no inversion; a-fold coefficient Frobenius; Nygaard on both sides; trivial extra twist. Construct the prismatic filtration via Frobenius divisibility and quasisyntomic descent before using the comparison. It has no trace-theoretic prerequisite.

(See BS Theorem 15.2, §15, p.102; Theorem 15.3, §15, p.103 · QH Proposition 3.22, §3, p.32.)

This uses HQ.8, HQ.4, HQ.2, PrismaticCohomologyPartII §§3.13–3.16.

### 8.11 The cyclotomic specialisation: q-de Rham-Witt against ordinary de Rham-Witt and crystalline cohomology

For smooth S over perfectly covered A, the cyclotomic comparison combines H/(q^m−1)'s ascending q-Witt filtration, the smooth underived graded forms, and qΩ^(m)/(q^m−1)≃qW_mΩ. At p use the explicit Adams-twisted de Rham formula of HQ.4 for m=p^a and its prime-to-p product extension. If A is additionally a ℤ_(p)-algebra, retain `W_{a+1}Ω→qW_{p^a}Ω` as a Frobenius/Verschiebung-compatible map. Reach classical crystalline cohomology only via CR.4's ordinary de Rham–Witt comparison on the smooth special fiber over a perfect characteristic-p field and the required relative base reduction. This relative map is conditional on `gap:relative-witt-factorization` of §3.6; no unconditional relative factorization is imported. Record: `A[q]/(q^{p^a}−1)`; p-completion; no inversion; `ψ^{p^a}`; ascending q-Witt versus stupid filtrations; no extra Tate twist. The ordinary-to-q-Witt map is neither inverted nor equipped with restrictions on its target.

(See QH Theorem 3.11(b), §3, p.25; Proposition 3.19, §3, p.31 · QW Proposition 4.2, §4, p.54; Remark 3.18, §3, p.42 · BMS1 Theorem 1.10(i), §1, p.6.)

This uses HQ.8, HQ.3, HQ.4, CrystallineCohomology CR.4, Mathlib Polynomial.prod_cyclotomic_eq_X_pow_sub_one.

### 8.12 The specialisation at the parameter value one, with its torsion correction

At q=1, smooth qΩ reduces to Ω while animated qdR reduces to dR. For a pair, F/β is the Hodge filtration and qHdg/h carries the ascending conjugate filtration with graded shifted derived forms. On smooth cohomology retain `0→H^i(qΩ)/h→H^i_dR→H^{i+1}(qΩ)[h]→0`, from the derived cofiber of multiplication by h. For smooth schemes proper over ℤ[1/N], use completed descent and proper de Rham finiteness to obtain the corresponding finitely generated q-de Rham groups over ℤ[1/N][[h]]. Record: global h-adic coefficient base, not a prism; smooth inputs for Ω and the torsion sequence, chosen animated pairs for the filtered clauses; no inversion or Frobenius; Hodge and conjugate filtrations; trivial twist. The cohomology conclusion is an exact sequence rather than an isomorphism.

(See QH Theorem A.1(a), §A, p.69; Paragraph A.14, §A, p.76; Definition 3.2(b), §3, p.20; Lemma 3.9, §3, p.23 · Sch Remark 3.2, §3, p.7.)

This uses HQ.8, HQ.1, HQ.2, HQ.3, DerivedDeRhamCohomology §§2.22–2.27.

### 8.13 Commutation of the eight squares

Combine the eight commuting comparison squares: local prismatic, rational framed q-crystalline, perfectoid A_inf, h-décalage, prism-ideal décalage, Nygaard, cyclotomic/classical crystalline and q=1. Each uses its stated domain and its already constructed maps. Their conjunction adds no enlarged input class. Compatibility of β_S with the canonical θ and Witt specializations of CohomologyComparisons §§1.2 and 1.4 is a further pair of targets below; it is not inferred from the existence of an A_inf equivalence.

(See QH Theorem A.1, §A, p.69; Proposition 3.19, §3, p.31; Proposition 3.22, §3, p.32.)

This uses HQ.8.

### 8.14 Information retained by coefficient changes

Track information along the maps. The local prism sees p alone; the rational framed comparison loses integral information. Perfectoid base change first p-completes, killing rational objects and other-prime components, and depends on ε. The h-décalage equivalence needs smooth chosen pairs and its functor is not exact. The prism-ideal and Nygaard comparisons are local at p, the latter also cyclotomically reduced. The ordinary-to-q-Witt map forgets restrictions and is not an equivalence; q=1 retains a torsion correction. CohomologyComparisons Layer 1's proper smooth étale comparison is accessible only through the non-conservative perfectoid change and μ-inversion, so no étale equivalence of the original global Habiro objects is asserted. On each relative-dimension locus the algebraic scheme construction has inverted the primes required there; the mixed-dimension caveat is §5.13.

(See QH Paragraph 1.17(a), §1, p.8 · BS Notation 17.1, §17, p.117 · Sch Conjecture 4.3, §4, p.9 · BMS1 Remark 6.6, §6, p.50.)

This uses HQ.8, HQ.5, HQ.6, CohomologyComparisons §§1.2, 1.4, 1.7–1.9 and 6.10.

### 8.15 Independent prismatic Nygaard construction

Use PrismaticCohomologyPartII §§3.13–3.16's Frobenius-divisibility construction on large quasisyntomic algebras over a bounded prism, then its descent to smooth p-adic formal schemes. The Nygaard and décalage squares use PrismaticCohomologyPartII §§3.13–3.16, AI.1 and HQ.4. The q-specific filtration is the twisted prismatic Nygaard filtration of §3.22: first construct prismatic Nygaard and relative Frobenius, then compare with q-Witt Nygaard after the degree-one filtered cyclotomic quotient, with the coefficient twist and completions of §8.10. The comparison uses the already constructed filtration on each side.

(See BS Theorem 15.2, §15.1, pp.102–103; Theorem 15.3, §15.1, pp.103–104 · QH Paragraph 3.20 and Proposition 3.22, §3.4, p.32.)

This uses HQ.4, PrismaticCohomologyPartII §§3.13–3.16, AInfCohomology AI.1.

### 8.16 Examples for the eight squares

Check each square on its smallest informative input. For ℤ[x], use the Frobenius-twisted p-adic affine line, two framed envelope models, the completed A_inf base change and the coordinate h-décalage calculation. For S=A=ℤ, the prism-ideal décalage is ℤ_p[[h]] in degree zero and (qW_pΩ)^∧_p=ℤ_p[q]/(q^p−1). Check the first two degree-zero Nygaard steps, and the derived q=1 torsion sequence. Every example retains its coefficient, input, completion, inversion, Frobenius, filtration and twist record. The θ/Witt compatibility targets have their own map-equality tests and do not follow from these object examples.

(See QH Remark 1.13, §1, p.7; Paragraph 1.10, §1, p.6 · Sch §2, p.4 · BS Theorem 17.2, §17, p.117.)

This uses HQ.8.

### 8.17 Comparison signature interfaces

Coefficient identities use the native cyclotomic, geometric-sum, Witt, tilt and Fontaine-θ declarations; `cyclotomic_prime_decomposition` (§8.2) is the integral input among them. The eight enhanced squares are built from the actual maps and identifications of their owners. Their compatibility is a map-equality theorem on the stated common input domains, including higher naturality and multiplication. The θ/Witt natural equalities below require full-functor uniqueness with its Hodge–Tate normalization and global descent; objectwise isomorphisms between unrelated models do not supply those equalities.

(See BS Notation 16.1, §16, p.106 · QH Theorem A.1(b), §A, p.69.)

This uses HQ.8, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib WittVector.fontaineTheta_teichmuller.

### 8.18 Canonical θ/de Rham compatibility target

Fix p, a complete algebraically closed nonarchimedean C/ℚ_p with residue field k, and the primitive system ε fixed in §8.2. For smooth ℤ-algebra S let R=(S⊗O_C)^∧_p and `F_S=qΩ_{S/ℤ}⊗̂A_inf`, with β_S exactly the composite defined above. Write `D_R=Ω^{•,cont}_{R/O_C}`. The target is equality `c_{θ,R}∘β_{S,θ}=a_{θ,S}`: `(F_S⊗^L_{A_inf,θ}O_C)^∧_p→D_R`. Here `a_{θ,S}` uses transitivity of completed base change, θ(q)=1, qΩ/h≃Ω and smooth de Rham base change; `c_{θ,R}` is AI.4/CohomologyComparisons Layer 1's canonical BMS de Rham map. This affine enhanced multiplicative natural equality remains to be proved. θ has kernel ξ; θ̃ is the different Hodge–Tate map. A possible BS uniqueness argument must extend to all p-completely smooth algebras over the perfect-prism quotient and preserve its Hodge–Tate structure map; agreement on ℤ-defined lifts or arbitrary reduced maps is insufficient. Sheaf compatibility and descent are needed for CohomologyComparisons Layer 1's proper smooth diagram. Record (p,ξ)-completion before θ, p-completion afterwards, no inversion, retained φ_A-pullback, and no new filtered or Tate-twisted comparison.

(See BMS1 Theorem 14.1(ii), §14, p.118, proof pp.118–119 · BS Notation 18.1, §18, p.122; Theorem 18.2, §18, p.122; Lemma 18.3, §18, p.122, proof pp.122–123.)

This uses HQ.8, HQ.1, DerivedModuleAlgebra §§1.1–1.4, AInfCohomology AI.4, CohomologyComparisons §§1.2, 1.4, 1.7–1.9 and 6.10, PrismaticCohomologyPartII §5.25.

**Checks.**

- For S=ℤ both routes send 1 to 1 in O_C; the coefficient map is θ and the target comparison is id_(O_C).
- For S=ℤ[T,T⁻¹], both routes send dlog T to dlog T and its differential to 0 in D_R. Rescaling the one-form by −1 fails over characteristic-zero O_C.
- For T↦T² the two transported maps send dlog T to 2 dlog T, and for T↦T³ they send it to 3 dlog T. A comparison that preserves only the coefficient unit but kills degree-one forms fails these naturality tests.

### 8.19 Canonical Witt/crystalline compatibility target

With the same data and β_S, let w:A_inf→W(k), w(q)=1, S_k=S⊗k, S_W=(S⊗W(k))^∧_p, `D_W=Ω^{•,cont}_{S_W/W(k)}` and C_k=RΓ_crys(Spec S_k/W(k)). Construct `a_{w,S}:(F_S⊗^L_w` W(k))^∧_p≃D_W by q=1 and completed smooth de Rham base change. Import ι_S:D_W≃C_k, the inverse of the crystalline-to-de-Rham smooth-lift map, from CR.2's finite-Witt PD Poincaré lemma and derived inverse limit. Import `c_{w,R}` from AInfCohomology AI.4, CrystallineCohomology CR.4 and CohomologyComparisons §1.4. The target equality is `c_{w,R}∘β_{S,w}=ι_S∘a_{w,S}`, with compatibility with the relevant q-crystalline/prismatic base reductions. It remains to be proved, including enhancement, multiplicativity and lift independence. Retain Frobenius on β and the transported Witt Frobenius; ℤ-descent identifies the lift's coefficient twist. Do not invert `W_{a+1}Ω→qW_{p^a}Ω`. The same full-functor/Hodge–Tate uniqueness and global descent prerequisites as in the θ target apply. Record (p,ξ)-completion before w, p-completion afterwards, no inversion and no additional filtration or Tate twist.

(See BMS1 Theorem 14.1(i), §14, p.118, proof pp.118–119 · BS Notation 18.1, §18, p.122; Theorem 18.2, §18, p.122; Lemma 18.3, §18, p.122, proof pp.122–123.)

This uses HQ.8, DerivedModuleAlgebra §§1.1–1.4, AInfCohomology AI.4, CrystallineCohomology CR.2, CrystallineCohomology CR.4, CohomologyComparisons §§1.2, 1.4, 1.7–1.9 and 6.10, PrismaticCohomologyPartII §5.25.

**Checks.**

- For S=ℤ both routes send 1 to 1 in W(k), identified with crystalline cohomology of Spec k; the zero comparison fails.
- For S=ℤ[T,T⁻¹], both composites send dlog T to its crystalline class, with crystalline Frobenius p·dlog T: the coefficients are 2 at p=2 and 3 at p=3. Ordinary de Rham–Witt F fixes dlog[T], and its degree-scaled chain Frobenius multiplies this degree-one class by p; conflating them gives the wrong normalization.
- Pullback T↦T² sends that crystalline class to 2 dlog T by both routes, and T↦T³ sends it to 3 dlog T. Neither equality uses an inverse to the ordinary-to-q-Witt map or a qW restriction; a zero map on forms passes the unit test but fails these two computations.

### Examples

At p=3, (q−1)²+3q=[3]_q fixes the sign of the cyclotomic ramification relation. At S=ℤ the θ and Witt maps are coefficient reductions; on ℤ[T,T⁻¹] their required normalization is tested on dlog T as well as on the differential.

### Dependencies

The preceding constructions in this layer and DerivedDeRhamCohomology, PrismaticCohomology, AInfCohomology, CrystallineCohomology, CohomologyComparisons. The subsection dependencies above specify the exact stages and maps.

## Downstream consumers

HabiroRings can compare its ordinary relative Habiro models with the
cohomological coefficient object through §§0.3, 4.21 and 4.28.
The framed construction of §3.31 uses the finite complete descent of §0.2;
it needs no ordinary Taylor re-expansion theorem.
HabiroRings Layer 6 uses the finite-étale
degree-zero and Taylor interfaces of Layer 5; its arithmetic regulator
modules are separate constructions. HabiroNumberFields can consume the same finite-étale export for its arithmetic regulator modules. RefinedTraceMethods imports the interface
of §4.28 (derived q-de Rham complexes, chosen pairs, their completions, their
β-periodic q-Hodge and Habiro–Hodge objects and the full descent datum) and
the finite-coefficient pairs of §5.26 before its trace comparisons. It then
compares its independently constructed trace filtrations with these objects
and with prismatic Nygaard. HabiroCohomologyFoundationsPartII imports these
algebraic objects and RefinedTraceMethods' theorems for trace pairs, their
Habiro descent, framed trace comparisons and the homotopical number-field
application. The canonical specialization equalities and their scheme descent
are outputs of Layer 8. Their classical comparison maps are imported from
CohomologyComparisons §§1.2, 1.4, 1.7–1.9 and 6.10. The analytic problem does not supply any algebraic prerequisite.

## References

Page numbers refer to the following fixed public versions and to their printed
pagination. Numbered paragraphs share the statement counter in the Wagner
papers. Stacks Project pages are unpaginated HTML, identified by section,
statement number and stable tag instead of a page number.

- **QH:** Ferdinand Wagner, [q-Hodge complexes over the Habiro ring](https://arxiv.org/pdf/2510.04782v2), v2. The main constructions here use §§3–4 and Appendix A; coefficient infrastructure is in §2 and Appendix B.
- **QW:** Ferdinand Wagner, [q-Witt vectors and q-Hodge complexes](https://arxiv.org/pdf/2410.23078v5), v5, §§2–5.
- **KU:** Ferdinand Wagner, [q-de Rham cohomology and topological Hochschild homology over ku](https://arxiv.org/pdf/2510.06057v1), v1, §1.2 (the downstream comparison noted in §4.28).
- **TC:** Samuel Meyer and Ferdinand Wagner, [q-Hodge complexes and refined TC⁻](https://arxiv.org/pdf/2410.23115v4), v4, §§1.2, 3.1 and 3.2.
- **GSWZ:** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler and Don Zagier, [The Habiro ring of a number field](https://arxiv.org/pdf/2412.04241v2), v2, §1.4 and §5.2.
- **Pridham:** J. P. Pridham, [On q-de Rham cohomology via Λ-rings](https://arxiv.org/pdf/1608.07142v4), v4, §§1.2–1.3.
- **BS:** Bhargav Bhatt and Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), v4, §§15–18 and the base-change theorem in §4.
- **Bhatt:** Bhargav Bhatt, [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), v1, §8, Proposition 8.5 and Corollary 8.6, p.32; Remark 8.7, p.33.
- **BMS1:** Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), v3, §§6 and 14.
- **BMS2:** The same authors, [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), v2, §5 and Theorem 1.12.
- **Sch:** Peter Scholze, [Canonical q-deformations in arithmetic geometry](https://arxiv.org/pdf/1606.01796v1), v1, §§2–4 and 7.
- **DAG VIII:** Jacob Lurie, [Quasi-Coherent Sheaves and Tannaka Duality Theorems](https://www.math.ias.edu/~lurie/papers/DAG-VIII.pdf), 5 November 2011, §§2.6–2.7, pp.66–76.
- **Stacks:** [Derived completion](https://stacks.math.columbia.edu/tag/091N), §15.93; [étale cohomology of quasi-coherent sheaves](https://stacks.math.columbia.edu/tag/03OY), §59.22; [quasi-coherent sheaves and presentations](https://stacks.math.columbia.edu/tag/06WT), §96.14, Proposition 96.14.3; and [finite projective modules](https://stacks.math.columbia.edu/tag/00NV), §10.78, Lemma 10.78.2. The ordinary results are enhanced by their named suppliers before use here.

- **Sch25:** Peter Scholze, [Habiro Cohomology](https://archive.mpim-bonn.mpg.de/id/eprint/5155/), lecture course, summer 2025. The institutional index identifies the analytic proposal mentioned by QH; it is not a definition or proof of the analytic inputs in §6.1.
