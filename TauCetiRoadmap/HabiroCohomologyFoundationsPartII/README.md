# Roadmap: Habiro cohomology foundations, Part II — trace q-Hodge pairs and their Habiro descent

**Summary.** Topological Hochschild homology over connective complex K-theory produces q-Hodge filtrations: under the spherical hypotheses of §1.1, the even filtration on TC⁻ relative to ku is a q-deformation of the Hodge filtration. The algebraic side — chosen q-Hodge pairs, the q-Hodge complex and its Habiro descent — belongs to HabiroCohomologyFoundations; the trace side and the existence theorem for such pairs belong to RefinedTraceMethods. The base roadmap stops at algebraic pairs and their descent; the trace applications here use the exact supplier contracts below. This roadmap joins the two theories under those contracts. It descends trace pairs to Habiro-complete objects, with their cyclotomic reductions and the multiplicative structure the lifts allow (Layer 1). It proves that a spherical lift after perfection makes the naive filtration of a quasi-regular quotient a q-deformation, records sufficient exponent conditions under which higher-power quotients have such lifts at each prime, and identifies trace pairs of quasi-regular quotients with the canonical algebraic pairs (Layer 2). It imports Raksit's full framed trace theorem and its E∞ refinement from RefinedTraceMethods, and identifies the resulting trace pair with the canonical algebraic pair on their common domain (Layer 3). Finally it transports the cyclotomic and Taylor specialisations of the Habiro ring of a number field to its realisation as π₀ of a limit of genuine fixed points of THH over KU (Layer 4). The end theorems are the descent construction traceHabiro (§1.3), the spherical-lift criterion perfectedLiftNaive (§2.2), the comparison tracePair_quasiRegular (§2.3), the agreement canonicalFramedTrace (§3.1) and the export numberFieldTraceExports (§4.2).

## Scope and ownership

This roadmap owns the applications of trace theory to Habiro cohomology that need both the algebraic q-Hodge formalism and the trace comparisons:

- the category of trace inputs with its morphisms, and the functoriality of the trace pair along them (§§1.1–1.2);
- the Habiro descent of trace pairs and its interface: completions, cyclotomic reductions, the q-Witt graded pieces, multiplicative transport and the β-periodic comparison with genuine fixed points (§1.3);
- spherical E₁- and E₂-lifts of higher-power quotients, with their exponent ranges at odd primes and at 2 (§2.1);
- the spherical-lift criterion for the naive filtration (§2.2) and the identification of trace pairs of quasi-regular quotients with the canonical quasi-regular pairs, hence their independence of the lift (§2.3);
- the agreement of canonical and framed trace pairs and the induced multiplicative Habiro comparison (§3.1), using the full framed theorem and its proof inputs from RefinedTraceMethods §6.10;
- the trace inversion condition on number-field coefficients and the transport of the number-field Habiro specialisations to the genuine-fixed-point realisation (§§4.1–4.2).

The following ownership boundary fixes the inputs from named supplier sections and the exact contracts; none of their objects is planned again here.

| Supplier | What is imported |
| --- | --- |
| HabiroCohomologyFoundations Layers 0–5 | The global and derived q-de Rham complexes, the filtered quotient convention, chosen q-Hodge pairs, the q-Hodge complex, twisted filtrations and partial descents, the Habiro–Hodge object with its descent theorem and multiplicative upgrades, the exported interface of §4.28, the canonical smooth filtration, the naive filtration of quasi-regular quotients with its section, and the finite-coefficient pairs of §5.26. |
| RefinedTraceMethods Layers 6 and 8 | Spherical bases and compatible spherical lifts (§6.1), the local and global trace comparisons with their q-Hodge filtration, the full framed theorem with its E∞ refinement, q-PD diagonal and Čech proof (§§6.9–6.10), cyclonic spectra, TC⁻⁽ᵐ⁾ and the Habiro–Hodge comparison over KU (§§6.11–6.13), étale spherical lifts and the number-field ring comparison (§6.14), and the coherent Habiro trace interface (§8.8). |
| QWittVectors §§2.1–2.5 | Arithmetic Λ-rings, arithmetic perfection, perfect coverage and relative perfection, including toric examples and integer torsion-freeness. |
| HabiroRings HR.2, HR.5 and HR.7 | The ordinary/derived completion comparison, coefficient base change, the relative Habiro ring with its compatible roots, Taylor maps and Taylor equalizer, the number-field coefficient rings, and the examples where constant families do not glue. The étale Habiro–Hodge identification is supplied by HabiroCohomologyFoundations §4.21. |
| StableHomotopyKTheory §§7.32, 7.34 | Burklund's towers of Eₙ-algebra quotients in a stably Eₘ-monoidal category, their v-compatible uniqueness and the Moore-spectrum structures, including the stronger prime-two range. |
| PrismaticCohomology Layer 0 and PrismaticCohomologyPartII Layer 3 | δ-rings and the toric δ-structure; the independently constructed Nygaard filtration by Frobenius divisibility on quasiregular semiperfectoid prisms, the relative Nygaard filtration on the Frobenius twist with its graded pieces and the Lη_I factorisation, and Nygaard completion. The q-PD proof inputs to the framed theorem are imported through RefinedTraceMethods §6.10. |
| PrismaticCohomologyPartIII §7.0 and AInfCohomology §AI.7.2 | The motivic filtrations of Bhatt–Morrow–Scholze on THH, TC⁻ and TP by quasisyntomic descent of double-speed Postnikov truncations, and the absolute and relative trace–prismatic comparisons with Nygaard-completed prismatic cohomology. |

Two constructions of a filtration on p-adic cohomology meet in this subject, and they are kept separate. The prismatic Nygaard filtration is built by Frobenius divisibility on quasiregular semiperfectoid covers and quasisyntomic descent (PrismaticCohomologyPartII §§3.1, 3.13–3.16), with no trace input. The motivic filtration on TC⁻ is built by descent of double-speed Postnikov truncations from the same covers (AInfCohomology §AI.7.2); evenness is a property of the covers, not of global THH. The trace–prismatic comparison of PrismaticCohomologyPartIII §7.0 on quasisyntomic rings identifies the trace complex with the Nygaard completion of prismatic cohomology, keeping the Breuil–Kisin twists: gr^nTC⁻ ≃ `N^{>=n}DeltaHat{n}[2n]` and gr^nTP ≃ `DeltaHat{n}[2n]` (BMS2 Theorem 1.12, pp.6–7). It does not identify Δ with Δ̂, and it proves no equality of the canonical θ and Witt specialisation maps of HabiroCohomologyFoundations §§8.18–8.19. Nothing in this roadmap defines a filtration by a theorem meant to compare it with another. The Nygaard/décalage squares use the independent prismatic and A_inf constructions with the algebraic q-de Rham–Witt objects of HabiroCohomologyFoundations Layer 3; the trace existence theorem consumes the early pair/descent interface and the local comparisons, without using those comparison squares. Syntomic trace comparisons are supplied by RefinedTraceMethods Layer 8 and are not additional targets here.

Within this family the supplier order is HabiroCyclotomicCompletions, QWittVectors, HabiroCohomologyFoundations, HabiroRings, RefinedTraceMethods, then this roadmap. HabiroCyclotomicCompletions supplies ordinary polynomial-module completion; HabiroRings §2.4 constructs the subsequent ordinary/derived comparison. RefinedTraceMethods consumes the trace-free interface of HabiroCohomologyFoundations §§4.28 and 5.26 and proves its comparisons. None of these supplier contracts uses this roadmap as an input. The algebraic constructions stay with HabiroCohomologyFoundations: the higher-power criterion for the naive filtration (§5.19), the exponent-one failure (§5.20), the finite-coefficient pairs with their rational corner (§5.26), and every trace-free worked example. The trace existence theorem itself, the local comparisons at odd primes and at 2, the identity-cover description and the number-field ring isomorphism stay with RefinedTraceMethods, with their hypotheses unchanged; this roadmap states what it consumes from them in its supplier contracts and states as targets only what they do not contain.

The arithmetic statements here concern a ring in degree zero. The K₃-indexed line bundles, regulators and Nahm-series classes of HabiroNumberFields and HabiroNahmSeries remain with those roadmaps; no comparison of higher modules or higher cohomology follows from the ring isomorphisms below.

## Conventions

Rings and affine algebras lie in one fixed Grothendieck universe. Indexing diagrams are small there; enhanced module categories and their functor categories lie in a larger universe, using the enhancement conventions of HabiroCohomologyFoundations §§2.1 and 4.1. Coefficients are commutative ordinary rings unless a connective ring spectrum or an animated algebra is explicitly specified. No characteristic-zero or torsion-free hypothesis is implicit beyond the named base and input conditions.

In monomial differential formulas containing x^(r−1), r is a positive integer; constants have differential zero. Write h = q − 1, [0]_q = 0 and, for n ≥ 1, [n]_q = 1 + q + ⋯ + `q^{n−1}`. Filtrations descend, `F^{i+1}` → F^i, and the filtrations of q-de Rham objects are constant in degrees ≤ 0. In the Rees description of HabiroCohomologyFoundations §2.2 a filtered h^•A[q]-module is a graded A[β,t]-module with |β| = 1, |t| = −1 and βt = h; β is "h in filtration degree one" and t is the filtration parameter. On the trace side β is the Bott class in π₂ku and t a complex orientation in `π₋₂ku^{hS¹};` the identification `Σ^{−2∗}gr^∗_{ev}(ku^{hS¹})` ≅ ℤ[β][[t]] ≅ Rees(h^•ℤ[[h]]) of RefinedTraceMethods §6.9 matches the two, and `Σ^{−2i}` moves the i-th graded piece, which sits in homotopical degree 2i, to degree zero.

The filtered quotient by h is the base change to the trivially filtered A, so (F/β)^i = cofib(h : `F^{i−1}` → F^i) (HabiroCohomologyFoundations §2.3; QH Convention 3.1, p.20). The degreewise cofiber of h : F^i → F^i is a different object and is never used. All tensor products, quotients, limits and completions are derived and enhanced unless an ordinary static preimage is named; completed tensor products carry their completion ideal.

A **chosen pair** (R,F) is an object of the category of pairs of HabiroCohomologyFoundations §4.1 (QH Definition 3.2, pp.20–21): a filtered h^•A[q]-module F with (a) F^0 ≃ `qdR_{R/A},` (b) F/β ≃ fil_Hdg `dR_{R/A},` (c) the rational comparison with the combined Hodge and h-adic filtration on `(dR_{R/A}⊗ℚ)[[h]],` and (c_p) for every prime p the p-adic rational comparison with the combined filtration on `((dR_{R/A})^∧_p[1/p])[[h]],` together with the agreement of each with the unfiltered comparisons in degrees ≤ 0 and the squares and higher compatibilities between them. A filtered object alone is not a pair. Write F̂ for the filtration completion, qHdg(R,F) = (colim(F^0 →h F^1 →h ⋯))^∧_h for the q-Hodge complex, and H(R,F) = lim_k `T_{k!}` for the Habiro–Hodge object of HabiroCohomologyFoundations §4.17, with T_m its m-th partial descent (§4.14).

All spectral objects are those of RefinedTraceMethods. ku and KU are connective and periodic complex K-theory, THH(−/ku_A) is relative to ku_A = ku⊗S_A, and TC⁻ = `THH^{hS¹}.` All cyclonic divisibility limits use positive integers m ≥ 1 with transitions from mn to m, including the limits in §§1.3 and 4.1; C₁ is the trivial subgroup and C₀ is excluded. For a cyclonic spectrum X, `TC^{−(m)}(X)` = `(X^{C_m})^{h(S¹/C_m)}:` genuine C_m-fixed points first, then homotopy fixed points of the residual circle (RefinedTraceMethods §6.12). A p-complete statement uses p-completed rings and complexes; F(R;ℤ_p) means p-completion of F(R), and completion precedes inverting p. Relative semiperfectness of R/p over a δ-ring A means surjectivity of R/p `⊗_{A,φ}` A → R/p; p-quasi-lci means the p-completed cotangent complex `L_{R/A}` has Tor-amplitude in homological degrees [0,1] (HabiroCohomologyFoundations §5.15).

Names of this roadmap’s intended API are written in prose; they are README targets rather than declarations at the pins. The six headline theorems are traceHabiro, quotientLift, perfectedLiftNaive, tracePair_quasiRegular, canonicalFramedTrace and numberFieldTraceExports; each needs an enhanced or spectral carrier absent at the pins, as detailed in Suggested.lean. Sources are cited by the abbreviations of the References, with theorem numbers and printed pages.

## Exact supplier contracts

HabiroCohomologyFoundations and HabiroRings supply the contracts cited below at their named sections. The trace contracts specify the interfaces consumed from RefinedTraceMethods at the indicated sections. The base roadmap owns the algebraic constructions, while this Part II owns their trace applications.

### From Mathlib

The arithmetic definitions and Checks of Layers 2 and 4 use `Nat`, `Even`, `NumberField.discr` with `Rat.numberField_discr` (the discriminant of ℚ is 1), `NumberField.RingOfIntegers` (written 𝓞 F), `Localization.Away` with `IsLocalization.Away.algebraMap_isUnit`, `map_dvd`, `isUnit_of_dvd_unit` and `Commute.isUnit_mul_iff` (a product of commuting elements is a unit exactly when both factors are). `Algebra.Etale` and `Algebra.Smooth` fix the meaning of étale and smooth for the framed inputs of Layer 3 (formally étale or smooth and of finite presentation); `MvPolynomial` supplies the polynomial source of a framing. None of these supplies a spectrum, a filtered enhanced module or a pair; those carriers are absent at the pins (Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039).

The pinned source locations are Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean lines 36 and 75 (discriminant and its rational value), Mathlib/NumberTheory/NumberField/Basic.lean line 101 (integers), Mathlib/RingTheory/Localization/Away/Basic.lean line 82 (the localized element is a unit), Mathlib/Algebra/Divisibility/Hom.lean line 31 (divisibility under a homomorphism), Mathlib/Algebra/Divisibility/Units.lean line 129 (a divisor of a unit), and Mathlib/Algebra/Group/Commute/Units.lean line 74 (commuting products). The classes in Mathlib/RingTheory/Etale/Basic.lean line 205 and Mathlib/RingTheory/Smooth/Basic.lean line 539 include finite presentation; neither includes module finiteness. The polynomial and exponent carriers are Mathlib/Algebra/MvPolynomial/Basic.lean line 79, Mathlib/Algebra/Group/Even.lean line 55 and Mathlib/Data/Nat/Factorization/Defs.lean line 50.

### From Tau Ceti

No Tau Ceti declaration is used. Tau Ceti at the pin contains no Habiro, q-Hodge, spherical-lift, THH or Nygaard carrier.

### From TauCetiRoadmap.QWittVectors

QWittVectors §§2.1–2.5 provides arithmetic Λ-rings, arithmetic perfection (§2.3), perfect coverage (§2.4) and relative perfection (§2.5), including the toric examples and integer torsion-freeness. These are the objects used whenever a Λ-base or a relatively perfect Λ-algebra occurs below. The p-complete δ-ring specialization and relative semiperfectness used by the naive filtration remain HabiroCohomologyFoundations §5.15.

### From TauCetiRoadmap.HabiroCohomologyFoundations

- Supplied by HabiroCohomologyFoundations §0.1: The Habiro-complete derived category of A[q] for every commutative A, its reflection L_H, and its completed symmetric monoidal tensor.

- Supplied by HabiroCohomologyFoundations §§2.1–2.3: Enhanced filtered modules, completion lim_n `cofib(F^{•+n} → F^•)` with recovery of F as the pullback of F̂ along M → M̂, the Rees ring A[β,t] and the filtered quotient convention.
- Supplied by HabiroCohomologyFoundations §§1.14–1.16, 2.4–2.10: The derived q-de Rham complex `qdR_{R/A}` by animation, its completed base change, the combined Hodge and h-adic filtration, and the rational and p-adic rational comparisons, with the p-adic one a separate datum. §1.14 identifies `qΩ_{S/A}` of an étale-framed smooth S with the coordinate Koszul complex; §1.16 gives the comparisons between framings.
- Supplied by HabiroCohomologyFoundations §4.1: The category of pairs and its forgetful functors; pullback along qdR → qΩ takes a filtration of `qΩ_{S/A}` satisfying the underived clauses back to a pair on `qdR_{S/A}` (QH Remark 3.6, p.22); the combined filtration gives the pair over a ℚ-algebra.
- Supplied by HabiroCohomologyFoundations §4.4: The q-Hodge complex, functorial on pairs and unchanged under filtration completion; its framed model is the coordinate q-Hodge complex with every differential multiplied by h.
- Supplied by HabiroCohomologyFoundations §4.8: The coordinate pair of an étale-framed smooth S: in form degree j its i-th step is `h^{max(i−j,0)}Ω^j_{S/A}[[h]],` pulled back to `qdR_{S/A};` it carries an E₀-structure only.
- Supplied by HabiroCohomologyFoundations §§4.12–4.24: Twisted q-Hodge filtrations F_m, partial descents T_m with `(T_m)^∧_{q^n−1}` ≃ T_n for n | m, the Habiro–Hodge functor H with its completions and strict symmetric monoidality, the descent theorem (QH Theorem 3.11(a),(b), p.25), the étale identification H(R,F) ≃ `H_{R/A}` (QH Corollary 3.13, p.27), the smooth identifications of §4.22 and the Eₙ and derived commutative upgrades of §4.23.
- Supplied by HabiroCohomologyFoundations §4.28: The exported descent record (twisted filtrations, coherent divisor maps, partial descents, limit, q-Witt filtration and monoidality), the β-periodic q-Hodge object and filtration completion with its zeroth step. The derived commutative upgrades retain the additional enhanced contract of §4.23. The finite-projective base-change component retains the Frobenius/Nygaard and filtered décalage contracts of that section. The record carries no lift, resolution or prime-inversion hypothesis.
- Supplied by HabiroCohomologyFoundations §§5.2–5.8: The canonical smooth filtration F_n for n ≥ 1 on smooth S with every prime ≤ n inverted and dim(S/A) ≤ n, its pair structure (QH Lemmas 4.6–4.7, pp.55–56), and the specific map to the coordinate filtration of §5.4 built from the counit of `τ_{n,!}` ⊣ τ*_n and the fixed pullback identification (QH Remark 4.4, p.55).
- Supplied by HabiroCohomologyFoundations §§5.15–5.23: Perfectly covered δ-bases, p-quasi-lci algebras, relative semiperfectness, condition (R), staticity (QH Lemma 4.18, p.61), the naive filtration as an ordinary preimage (QH Construction 4.21, p.62) with its injectivity modulo h (QH Lemma 4.26, p.64) and completed flat base change (QH Lemma 4.27, p.65), the higher-power theorem (QH Theorem 4.22(a)), the exponent-one failure (QH Example 4.24, pp.63–64), and the canonical quasi-regular section on `QReg^{qHdg}_A` by arithmetic gluing (QH Construction 4.28 and Theorem 4.29, p.66).
- Supplied by HabiroCohomologyFoundations §5.26: Finite-coefficient pairs on ℤ/m for powerful positive m, glued with the constant rational corner.

### From TauCetiRoadmap.RefinedTraceMethods

- From RefinedTraceMethods **§6.1.** Cyclotomic base data (a perfectly covered base with the condition (tC_p) of KU 3.1, p.24, at every prime), spherical lifts, étale spherical lifting, arithmetic gluing of spherical lifts and compatible spherical lifts with local choices, gluing and multiplicative refinements: for each prime p either an (E₂) choice, a connective p-complete `E₂-S_{Â_p}-algebra` reducing to R̂_p, or an (E₁) choice, consisting of p-torsion-free R̂_p, a p-quasisyntomic cover R̂_p → R_∞ with R_∞/p relatively semiperfect over Â_p, and an augmented cosimplicial connective p-complete `E₁-S_{Â_p}-algebra` lifting the p-completed Čech nerve (KU 3.2, p.24); the global gluing (KU 4.18, p.46). Its ku-lift counterexample records KU 1.11.
- From RefinedTraceMethods **§6.1.** For every prime p and p-complete perfect δ-ring B, provide its unique p-complete connective E∞ spherical lift S_B, functorial on δ-maps; in particular lift the δ-map ℤ_p{x}_∞ → ℤ_p, x ↦ p, to `S_{ℤ_p{x}_∞}` → S_p (KU proof of Lemma A.1, p.87; TC §3.4, p.31).
- From RefinedTraceMethods **§6.1.** For a p-complete p-completely perfectly covered δ-ring A with the cyclotomic spherical base of KU 3.1, construct the unique p-complete connective E∞ spherical lift `S_{A_∞}` of its completed perfection and an E∞-map S_A → `S_{A_∞}` reducing to A → A_∞ (KU Lemma A.1, p.87).
- From RefinedTraceMethods **§6.9.** The comparison ψ⁰_R : `qdR_{R/A}` → `gr⁰_{ev,hS¹}TC⁻_■(ku_R/ku_A),` the local q-Hodge filtration as the pullback along ψ⁰_R, the p-complete comparison for p > 2 (KU Theorem 4.8 with Remark 4.9, p.39), the comparison at p = 2 in case (E₁) (KU Theorem 4.14, p.43), and the identity-cover description (KU Theorem 4.17, p.45): for R p-torsion free, p-quasi-lci, with R/p relatively semiperfect and a connective E₁-S_A-algebra lift, the q-Hodge filtration is the ordinary preimage of the combined Hodge and h-adic filtration under `qdR_{R/A}` → `dR_{R/A}[1/p][[h]],` independent of the lift and a filtered E∞-algebra.
- From RefinedTraceMethods **§6.10.** The global even filtration and the global comparison (KU 4.21–4.26, pp.47–50), the global theorem (KU Theorems 1.2 and 4.27, pp.3, 50) under 4.18 and the addendum (R₂) of 4.18a (p.49): the completed q-Hodge filtration F̂ is `Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A)` as graded ℤ[β][[t]]-modules, its reduction by β is the Hodge filtration, its completed rationalisation is the combined filtration, and (R,F) is a pair; completeness, the Eₙ₋₁-monoidality of Remark 4.28 (p.50) and the identification of qHdg with gr⁰ after Bott inversion.
- From RefinedTraceMethods **§6.10 (framed comparison).** Raksit's full framed comparison (KU Theorem 6.10, p.83), with the following exact contract. For torsion-free A satisfying §1.1 and every smooth S with an étale framing □ : A[x₁,…,x_d] → S, the even-graded TC⁻ of the étale E∞-lift `ku_{S,□}` is the coordinate filtration whose i-th step in form degree j is `h^{max(i−j,0)}Ω^j_{S/A}[[h]].` The equivalence is natural in compatible étale framed maps and in degrees ≤ 0 agrees with ψ⁰ followed by qdR^∧ ≃ qΩ ≃ q-Ω^∗_□. With Ŝ₂ 2-torsion free, its identification with the filtration of TraceInput.ofFramed includes the comparison of the polynomial resolution of KU Proposition 3.11 with the perfect-root Čech resolution of Remark 3.10 (p.27), including p = 2, and respects all four pair clauses. The coordinate filtration has a filtered E∞ and filtered derived commutative refinement for this fixed framing (KU Remark 6.14, p.86). No primes up to d are inverted for this framed theorem. Its proof, the q-PD diagonal, the normalized divided-power generators and their q-derivative laws, and the filtered framed Čech totalisation of KU Lemmas 6.11–6.13 (pp.84–86) are all owned by RefinedTraceMethods §6.10. The case ℤ[x] is the specialization of KU Theorem 1.4 (p.3), not the full supplier statement.
- From RefinedTraceMethods **§6.10 (framed exports and proof model).** The intrinsic framed E₂ input uses the intrinsic E₂ choice at every prime; ofFramed uses the perfect-root E₁ cover at 2. The prime-two framed comparison compares their completed filtrations at 2, so the completed framed comparison and the framed pair comparison apply to the latter input, with its four pair clauses. The framed E∞ refinement supplies both the E∞-structure and the stronger filtered derived commutative refinement; the latter comes from totalising static filtered commutative rings. Its framed Čech model completes `S^{⊗_A(n+1)}` along the full diagonal ideal `ker(S^{⊗_A(n+1)}` → S), including any idempotent part left by an étale framing. Completion along coordinate differences alone is insufficient for a general étale S, as the supplier's full-diagonal completion check demonstrates already in relative dimension zero. These proof inputs and checks are supplied there, rather than additional constructions here.
- From RefinedTraceMethods **§§6.11–6.13.** Cyclonic spectra, cyclonic ku and KU, the cyclonic base coherence (A₂) of KU 5.43 (p.70), `TC^{−(m)}` and its cyclonic even filtration, the twisted comparison (KU Theorem 5.51, p.73) and the Habiro–Hodge comparison H(R,F_tr)[β⁻¹] ≃ `Σ^{−2∗}gr^∗` lim_m `fil_{ev,S¹}TC^{−(m)}(KU_R/KU_A)` under 4.18, 2 ∈ R^× and (A₂) (KU Theorem 5.63, pp.79–80).
- From RefinedTraceMethods **§6.14.** Unique étale E∞-lifts of étale algebras (Lurie, Higher Algebra Theorem 7.5.0.6, p.1374) and the ring isomorphism `H_{𝒪_F[1/Δ]}` ≅ π₀ lim_m `(THH(KU⊗S_{𝒪_F[1/Δ]}/KU)^{C_m})^{h(S¹/C_m)}` for 6 | Δ and disc(F) | Δ (KU Corollary 6.15, p.86).
- From RefinedTraceMethods **§8.8.** The coherent Habiro trace interface: the S¹ and genuine finite C_m maps, complete even filtrations and graded module comparisons, with the multiplicative enhancement only under the chosen Eₙ hypotheses.

- From RefinedTraceMethods **§6.10.** For torsion-free A as in §1.1 and an étale-framed smooth S with Ŝ₂ 2-torsion free, compare the polynomial and perfect-root Čech resolutions at 2, preserving the map from qdR and all four pair clauses.

- From RefinedTraceMethods **§6.10.** For the fixed étale framing of §3.1, export the filtered derived commutative refinement obtained from the full-diagonal framed Čech totalisation, together with its underlying E∞ comparison.

- From RefinedTraceMethods **§7.6.** For high-powered positive m, provide the completed finite-coefficient trace comparison of TC Corollary 3.8 with the exponent convention of §2.1.

- From RefinedTraceMethods **§6.10.** For the framed trace comparison on its full torsion-free domain, supply the zeroth-step, filtered-quotient, rational and p-adic rational identifications with all squares and higher compatibilities in the category of pairs.

### From TauCetiRoadmap.HabiroRings

- Supplied by HabiroRings §§2.1, 2.4–2.5: The Laurent-convention comparison for Habiro completion and the completed coefficient base change of §2.5; the Habiro-complete category, reflection and completed tensor are required from HabiroCohomologyFoundations §0.1. The ordinary/derived comparison of §2.4 is a HabiroRings target: for every commutative ring B and B-module M, the derived completion of the static Laurent polynomial module M[q,q⁻¹] is the static ordinary cyclotomic completion of M[q], naturally with its finite projections. No flatness or integer torsion-freeness of B or M is assumed. Its ordinary inputs come from HabiroCyclotomicCompletions §§1.4, 2.3 and 5.1; HabiroCyclotomicCompletions uses no derived Habiro input.
- Supplied by HabiroRings §§5.1–5.9: The ordinary relative ring `H_{R/A}` for étale R over a perfectly covered Λ-base A, with its projections, finite q-Witt quotients, cyclotomic completions and maps of pairs (§5.1); compatible primitive roots, full coefficient algebras `R^{(m)}⊗ℤ[ζ_m]`, Taylor factors T_m, coefficient-extension and Frobenius re-expansion maps and change-of-root isomorphisms (§5.2); the full Taylor equalizer (§5.4), completed base change (§5.6), and the number-field coefficient and GSWZ comparisons (§§5.8–5.9). For nonzero Δ with disc(F) | Δ, 𝒪_F[1/Δ] is étale over ℤ, and the equalizer is the ring of GSWZ Definition 1.1 (pp.6–7).
- Supplied by HabiroRings §7.3: The localized cubic ring ℤ[∛2][1/6], where constant Taylor families do not glue.

### From TauCetiRoadmap.StableHomotopyKTheory

- **§§7.32, 7.34.** Import the v-compatible Moore quotient towers, with v = p at odd p and v = 4 for the chosen even-exponent tower at 2, and the stronger prime-two Moore structures of §7.34. For a stably Eₘ-monoidal stable ∞-category, m ≥ 2, and v : I → 1 whose cofiber admits a right-unital multiplication, 1/v^q carries a unique v-compatible Eₙ-algebra structure for n ≤ m and q > n, with a tower of Eₙ-algebra maps (Bu Theorem 1.5, p.2).

### From TauCetiRoadmap.PrismaticCohomology, PrismaticCohomologyPartII, PrismaticCohomologyPartIII and AInfCohomology

- **PrismaticCohomology Layer 0.** δ-rings and the toric δ-structure φ(x) = x^p used in §2.2. RefinedTraceMethods §6.10 consumes the q-PD envelope and base-change results of PrismaticCohomologyPartII §§5.7–5.8 for its framed proof; they are not an additional construction here.
- **PrismaticCohomologyPartII §§3.1, 3.13–3.16, 3.20–3.23.** The ideal filtration φ⁻¹(Jⁱ) on a prism, the relative filtration on the Frobenius twist `Δ^{(1)}` = φ_A^*Δ with `Prismatic.Nygaard.relativeFrobenius`, its graded pieces gr^n_N ≃ `Fil^{conj}_nΔ̄{n}` and the Lη_I factorisation of BS Theorem 15.3 (pp.103–104), and Nygaard completion with an example where a quasiregular semiperfectoid prism is not Nygaard complete.
- **AInfCohomology §AI.7.2 and PrismaticCohomologyPartIII §7.0.** The quasisyntomic unfolding of the trace coefficients with its Nygaard filtration, the motivic filtrations on THH, TC⁻, TP and TC, `Prismatic.Trace.gradedTCMinus`, `Prismatic.Trace.gradedTP`, `Prismatic.Trace.gradedTC`, and the relative trace–prismatic Breuil–Kisin comparison of BS Proposition 15.7 (p.105): for a complete mixed-characteristic DVR with perfect residue field and its Eisenstein prism, on p-completely smooth algebras, with the Frobenius twist and Nygaard completion retained.

## How to read the build

Layer 1 fixes the input of the trace theorem, makes the trace pair a functor on it and descends it to Habiro-complete objects; everything there is a composite of supplied functors, and the content is the bookkeeping of hypotheses, completions and multiplicative levels. Layer 2 treats quasi-regular quotients: sufficient exponent conditions for higher-power quotients to have spherical lifts at each prime, the criterion that a lift after perfection makes the algebraic naive filtration a q-deformation, and the identification of the trace pair with the canonical algebraic pair when every prime uses the identity cover. Layer 3 uses the framed trace theorem of RefinedTraceMethods §6.10 to identify the trace pair with the canonical pair on their common domain and to transport the E∞ refinement. Layer 4 transports the number-field specialisation maps through the genuine-fixed-point realisation. `Suggested.lean` lists the headline theorems and the enhanced carriers each lacks at the pins. The exponent predicates, unit consequences and boundary Checks belong to this README; they do not replace the headline theorems in the acceptance test.

## Layer 1: Trace pairs and their Habiro descent

The trace theorem takes as input a ring together with structured spherical data at every prime, and returns a chosen pair. This layer fixes that input as a category, makes the pair functorial on it and applies the existing Habiro descent. No trace pair, completion or descent functor is constructed a second time.

### 1.1 Trace inputs and their morphisms

Fix a perfectly covered Λ-ring A (QWittVectors §§2.1–2.4) whose p-completions carry the spherical base data of KU 3.1 (p.24): for every prime p a p-complete connective E∞-ring `S_{Â_p}` with `S_{Â_p}⊗_{S_p}ℤ_p` ≃ Â_p whose Tate-valued Frobenius `S_{Â_p}` → `S_{Â_p}^{tC_p}` agrees with the δ-Frobenius on π₀ and carries an S¹-equivariant E∞-structure, trivial on the source and residual on the target. This is the cyclotomic base data of RefinedTraceMethods §6.1 at every prime, the assumption 4.18(A) of KU (p.46). A map of underlying spectra that agrees with φ on π₀ does not supply it.

Define the category TraceInput A. An object is a pair (R,L): R is an A-algebra whose cotangent complex `L_{R/A}` has Tor-amplitude in homological degrees [0,1], with bounded p^∞-torsion for every prime p, and L is a system of compatible spherical lifts in the sense of RefinedTraceMethods §6.1 over R (KU 4.18(R), p.46): for every prime p a choice of an (E₂) or an (E₁) datum for R̂_p as in KU 3.2 (p.24), the reduction equivalences, the rational identifications and the arithmetic gluing, with their coherences. The choices may differ from prime to prime. At p = 2 the choice is required to be (E₁) unless R̂₂ = 0. This is how the addendum (R₂) of KU 4.18a (p.49) enters: the comparison at 2 is proved only in case (E₁) (KU Theorem 4.14, p.43), the E₂ comparison of KU Theorem 4.8 is restricted to p > 2, and the global comparison uses the case (E₁) at 2 (KU, proof of Lemma 4.29 with footnote (4.6), p.51). If 2 is a unit in R the condition is empty.

A morphism (R,L) → (R′,L′) is an A-algebra map g : R → R′ such that the two inputs make the same choice at every prime, together with maps of the local data over g: in case (E₂), a map of `E₂-S_{Â_p}-algebras` `S_{R̂_p}` → `S_{R̂′_p}` reducing to ĝ_p; in case (E₁), a map of covers R_∞ → R′_∞ over ĝ_p and a map of the lifted augmented cosimplicial E₁-diagrams reducing to the induced map of Čech nerves; and compatible maps of the rational identifications and of the gluing data, with their higher coherences. Identities and composition are those of the underlying diagrams. A map of rings alone, or a map of underlying spectra, does not specify a morphism.

Provide the following operations and laws.

- TraceInput.forget: the functor (R,L) ↦ R to A-algebras.
- TraceInput.lifts: the underlying compatible spherical lifts, with the local choice at p returning the branch and local datum at p.
- TraceInput.ofSpherical: over A = ℤ, a quasisyntomic ring R with 2 ∈ R^× and a connective E₂-ring spectrum S_R with S_R⊗_Sℤ ≃ R gives an input: at each odd p use the p-completion of S_R as the (E₂) datum, and at 2 the completion is zero. Here quasisyntomic includes the global Tor-amplitude [0,1] and bounded p^∞-torsion conditions, not just their p-complete analogues. Maps of these E₂-lifts reducing to maps of rings give morphisms of inputs (KU Theorem 1.2, p.3; 4.18 and 4.18a, pp.46, 49). The resulting pair and its descent are tracePair and traceHabiro, rather than a second existence construction.
- TraceInput.ofEtale: for R étale over A and torsion free (automatic when A is torsion free), the input whose datum at every prime is the identity cover (E₁) of the unique étale E∞-lift of R̂_p (RefinedTraceMethods §6.14); R/p is relatively semiperfect because the relative Frobenius of an étale algebra is an isomorphism. Every A-algebra map of étale algebras lifts uniquely to a morphism of these inputs.
- TraceInput.ofFramed: for S smooth over A with an étale framing □ : A[x₁,…,x_d] → S and Ŝ₂ 2-torsion free, the input of KU Examples 6.7–6.8 (pp.82–83): at odd p the (E₂) choice given by the unique étale E∞-lift `S_{S,□}` of S_A[x₁,…,x_d] → S, and at p = 2 the (E₁) choice with cover Ŝ₂ → `(Â₂⟨x₁^{1/2^∞},…,x_d^{1/2^∞}⟩` `⊗_{Â₂⟨x₁,…,x_d⟩}` Ŝ₂)^∧₂, whose Čech nerve is lifted by base change of the Čech nerve of S_A[x₁,…,x_d] → `S_A[x₁^{1/2^∞},…,x_d^{1/2^∞}]` along S_A[x₁,…,x_d] → `S_{S,□}.`
- TraceInput.ofIdentityCover: for an A-algebra R with `L_{R/A}` of Tor-amplitude [0,1], and, at every prime p, R p-torsion free, R/p relatively semiperfect over Â_p and a connective p-complete `E₁-S_{Â_p}-algebra` lift of R̂_p, the input choosing the identity cover (E₁) everywhere (KU §4.3, p.45; global Assumption 4.18(R), p.46). The global cotangent condition is separate from the conditions on the p-completions.
- TraceInput.unit assigns to R = A the lift S_A at every prime, as an identity-cover input when A is torsion free.

**Checks.**

- TraceInput.sphericalAbsolute: R = ℤ[1/2][x] with the E∞-lift S[1/2][x] is an input of ofSpherical, and gives an E∞-pair. For R = ℤ[x], the E₂-lift S[x] alone does not satisfy this constructor because 2 is not invertible; ofFramed supplies the separate (E₁) cover at 2.
- TraceInput.invertTwo: A = R = ℤ[1/2] with S[1/2]: the condition at 2 is empty because R̂₂ = 0, and the input exists without any datum at 2. For R = ℤ the datum at 2 must be an (E₁) choice; the identity cover of S is one.
- TraceInput.polynomial: for R = ℤ[x] with S[x] the (E₂) choice is available at every prime, but the input must use the (E₁) cover ℤ₂⟨x⟩ → `ℤ₂⟨x^{1/2^∞}⟩` at 2. A definition accepting (E₂) at 2 would require the E₂ comparison of KU Theorem 4.8 at p = 2, which the source does not prove (KU §4.2, issues (!) and (!!), p.43).
- TraceInput.kuLift: for p fixed, the ring ℤ_p{x}_∞/x has an E₁-algebra lift over ku (KU 1.11, p.5), but such a lift is not a local datum of an input: the ku-lift counterexample of RefinedTraceMethods §6.1. By §2.2 this ring has no spherical E₁-lift at all. This is an E₁ counterexample; KU 1.11 (pp.5–6) supplies no E₂ ku-counterexample. Its proposed image-of-J replacement is an expectation whose required S¹-equivariant THH diagram fails to commute, not an available theorem or constructor.
- TraceInput.rationalAmplitude: over A = ℤ, let R = ℚ[u,v]/(u²,uv,v²). Every p-completion is zero and has the zero spherical lift, and R is torsion free. Nevertheless R is not quasi-lci: at (u,v) its defining ideal has height 2 and needs three generators, so `L_{R/ℚ}` ≃ `L_{R/ℤ}` is not of Tor-amplitude [0,1]. Thus it cannot be an identity-cover input. Testing only the p-completions would incorrectly admit it.
- TraceInput.mixedBranch: for R = ℤ[x] and an odd prime p, the identity of ℤ[x] is not a morphism from the input choosing (E₂) at p to the one choosing the (E₁) cover ℤ_p⟨x⟩ → `ℤ_p⟨x^{1/p^∞}⟩` at p; comparing the two filtrations is a separate statement (for quasi-regular quotients it is §2.3), not part of the category.

*Needs:* RefinedTraceMethods §6.1 (cyclotomic base data, compatible spherical lifts), §6.14 (étale lifts); QWittVectors §§2.1–2.5; HabiroCohomologyFoundations §5.15 (relative semiperfectness, p-quasi-lci); Mathlib `Algebra.Etale`, `Algebra.Smooth`, `MvPolynomial`.

### 1.2 The trace pair as a functor on inputs

Define tracePair : TraceInput A → Pairs_A by (R,L) ↦ (R, F_tr(L)), where F_tr(L) is the q-Hodge filtration of KU 4.26 (p.50): the pullback of `qdR_{R/A}` → `gr⁰_{ev,hS¹}TC⁻(ku_R/ku_A)` ← `Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A)` along the glued comparison ψ⁰_R of KU 4.25 (pp.49–50), with the even filtration glued from the local and rational pieces (KU 4.21–4.23, pp.47–48; RefinedTraceMethods §6.10 the global even filtration, the global comparison). The pair structure is KU Theorem 4.27 (p.50; RefinedTraceMethods §6.10): F̂_tr ≃ `Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A)` as graded ℤ[β][[t]]-modules, F_tr/β ≃ fil_Hdg `dR_{R/A},` (F_tr⊗ℚ)^∧_h is the combined Hodge and h-adic filtration on `(dR_{R/A}⊗ℚ)[[h]],` and the p-adic rational clause (c_p) is the rationalisation of the local theorems (KU Theorems 4.8 and 4.14, pp.39, 43). Only the completion of F_tr has the trace description: F_tr is the pullback of F̂_tr along `qdR_{R/A}` → (F̂_tr)⁰, and need not be complete.

In the local (E₁) branch the ad hoc even filtration is formed as the limit over the lifted Čech diagram of the double-speed Postnikov truncations `τ_{≥2i}THH,` followed by even-filtered circle homotopy fixed points hT_ev (KU 1.9, p.5). The comparison at 2 uses KU Theorems 4.14 and 4.16 with Remark 4.15 (p.43); it does not assert that global THH is even or replace the descended filtration by the Postnikov filtration of global TC⁻. This is the supplied construction of RefinedTraceMethods §6.9, not a new filtration defined here.

The functoriality is the target of this subsection. Every step of the construction — the cyclotomic Frobenius and Devalapurkar's or Nikolaus's comparison giving ψ_R (KU 4.4–4.7, pp.36–38; Theorem 4.16, p.43), the solid or ad hoc even filtrations, the profinite and rational gluing (KU 4.21–4.25) and the pullback (KU 4.26) — is functorial in maps of the lifted diagrams. Prove that a morphism of inputs induces a map of pairs over g, compatibly with the four clauses and their coherences, with identity and composition laws. KU states the construction objectwise; the functor on TraceInput is stated here.

Provide the following operations and laws.

- tracePair: the pair (R, F_tr(L)) in the category of pairs of HabiroCohomologyFoundations §4.1.
- tracePair_map, tracePair_map_id, tracePair_map_comp: the induced maps of pairs and their laws.
- tracePair_completion: F̂_tr(L) ≃ `Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A),` naturally in morphisms of inputs, as graded ℤ[β][[t]]-modules; in filtration degrees ≤ 0 it is ψ⁰_R composed with the completion map of `qdR_{R/A}.`
- tracePair_modBeta, tracePair_rational, tracePair_pRational: the clauses (b), (c), (c_p) of the pair, with their squares, as supplied by KU Theorems 4.8, 4.14 and 4.27.
- tracePair_multiplicative: if 2 ≤ n ≤ ∞ and at every prime either the choice is (E₁) or `S_{R̂_p}` carries an `Eₙ-S_{Â_p}-algebra` structure compatible with the datum, then tracePair(R,L) is an `E_{n−1}-algebra` in pairs (KU Remark 4.28, p.50); at (E₁)-primes the multiplicative structure is obtained by applying the identity-cover description to every term of the lifted Čech resolution and then taking its coherent limit (KU Remarks 4.9 and 4.15, pp.39, 43; Theorem 4.17, p.45). For a general cover this does not identify the filtration on R itself with an ordinary preimage; that identification requires the identity-cover hypotheses of §2.3. No structure beyond `E_{n−1}` is inferred from an Eₙ lift.
- tracePair_etale: for TraceInput.ofEtale, the completed filtration is F̂^i_tr ≃ `h^{max(i,0)}R[[h]],` and the uncompleted filtration is its pullback
  F^i_tr ≃ `qdR_{R/A}` `×_{R[[h]]}` `h^{max(i,0)}R[[h]].` Here the map `qdR_{R/A}` → R[[h]] is the comparison with the empty framed model (QH Remark 3.6, pp.22–23, and Corollary 3.13, p.27). The complex qdR is already h-complete; the completion changing it to R[[h]] is completion of the q-Hodge filtration, not h-completion of its zeroth step. An étale algebra need not have `qdR_{R/A}` ≃ R[[h]].

**Checks.**

- tracePair_unit: for A = R = ℤ with S, F_tr^i = `h^{max(i,0)}ℤ[[h]]` (RefinedTraceMethods §6.10, Check the identity-base calculation), and the filtered quotient F_tr/β is ℤ in degrees ≤ 0 and 0 in positive degrees. The degreewise quotient would instead leave ℤ in every positive degree, failing clause (b).
- tracePair_zero: for A = ℤ and R = 0 every local datum is zero and `Σ^{−2∗}gr^∗TC⁻(ku_0/ku_ℤ)` = 0, so F_tr^i = `qdR_{0/ℤ}` for every i: the constant filtration on `qdR_{0/ℤ}` ≃ ℚ[[h]] (the rational corner of HabiroCohomologyFoundations §5.26 at m = 1). Its completion is 0, and F_tr/β is the constant filtration ℚ, which is fil_Hdg `dR_{0/ℤ}` since `dR_{0/ℤ}` ≃ ℚ has vanishing Hodge graded pieces. Defining F_tr as the completed object `Σ^{−2∗}gr^∗` would give 0 and fail clause (a).
- tracePair_etaleUncompleted: take A = ℚ and R = ℚ(i), an étale torsion-free A-algebra. Animation of the polynomial Poincaré lemma gives `dR_{R/ℚ}` ≃ ℚ and `qdR_{R/ℚ}` ≃ ℚ[[h]], whereas the empty framed model is R[[h]] (QH Remark 3.6, pp.22–23; Paragraph A.14, p.76). For k ≥ 1 the pullback above has H⁰ = h^kℚ[[h]] and H¹ = (R/ℚ)[[h]]/h^k, so it is not the static h-adic step h^kqdR. Its filtered quotient by β is the uncompleted Hodge filtration of dR, whose positive steps have H¹ = R/ℚ. The q-Hodge completion is the static h-adic filtration on R[[h]]. Substituting that completed pair would change the zeroth step and fail clause (a).
- tracePair_polynomial: for R = ℤ[x] with S[x] (and the (E₁) cover at 2), F̂_tr is the coordinate filtration: F̂^i_tr = ((q−1)^iℤ[x][[h]] → `(q−1)^{i−1}ℤ[x][[h]]dx)` for i ≥ 1 (KU Theorem 1.4, p.3; RefinedTraceMethods §6.10). It is not the h-adic filtration h^iqΩ: dx lies in `F̂^{i}` with coefficient `(q−1)^{i−1},` not (q−1)^i (RefinedTraceMethods §6.9, Check the distinction from the h-adic filtration).
- tracePair_einfty: for R = ℤ[x] with the E∞-lift S[x] the pair is an E∞-algebra in pairs; for a lift known only to be E₂ at some odd prime the conclusion is E₁, and a construction asserting E∞ from an E₂ lift fails tracePair_multiplicative.

*Needs:* §1.1; RefinedTraceMethods §6.9 (ψ⁰_R, KU Theorems 4.8, 4.14, 4.17), §6.10 (global even filtration, KU Theorem 4.27, Remark 4.28); HabiroCohomologyFoundations §2.3 (filtered quotient), §4.1 (pairs), §4.28 (filtration completion).

### 1.3 Habiro descent of a trace pair

Define

```text
traceHabiro(R,L) := H(tracePair(R,L)) = lim_{k≥1} T_{k!}(R, F_tr(L)),
```

the Habiro–Hodge object of HabiroCohomologyFoundations §4.17 applied to the trace pair, an object of the Habiro-complete derived category of A[q] (HabiroCohomologyFoundations §0.1). Its morphisms are the images under H of the maps tracePair_map; traceHabiro is a functor on TraceInput A and not on arbitrary maps of rings. The partial descents T_m, the factorial limit, the completed tensor product and the monoidal descent theorem are those of HabiroCohomologyFoundations §§4.14–4.20 (QH Theorem 3.11, p.25); no second Habiro completion or category of pairs is introduced.

For every trace input and every m ≥ 1 the derived reduction traceHabiro(R,L)/(q^m−1) carries the exhaustive ascending q-Witt filtration of HabiroCohomologyFoundations §4.20, with

```text
gr_i(traceHabiro(R,L)/(q^m−1)) ≃ Σ^{−i} qW_m dR^i_{R/A}.
```

This is an associated-graded statement: at m = 1 it is the conjugate filtration of qHdg/h (QH 3.8 and Lemma 3.9, pp.23–24), and it does not identify the reduction with an unfiltered q-Witt complex (KU Theorem 4.27 and Remark 4.28, p.50, composed with QH Theorem 3.11(a),(b), p.25).

Provide the following operations and laws.

- traceHabiro: the Habiro-complete object H(tracePair(R,L)).
- traceHabiro_map: the map induced by a morphism of inputs, with identity and composition laws inherited from tracePair_map and the Habiro–Hodge functor of HabiroCohomologyFoundations §4.17.
- traceHabiro_hCompletion: traceHabiro(R,L)^∧_h ≃ qHdg(tracePair(R,L)), the q-Hodge complex of the trace pair; it is not asserted to be `qdR_{R/A}` or qΩ.
- traceHabiro_partialCompletion: for every m ≥ 1, `traceHabiro(R,L)^∧_{q^m−1}` ≃ T_m(R,F_tr), compatibly with the transitions `T_{(k+1)!}` → `T_{k!}` and with `(T_m)^∧_{q^n−1}` ≃ T_n for n | m.
- traceHabiro_qWittGraded: the ascending filtration on traceHabiro(R,L)/(q^m−1) with the displayed graded pieces, lax monoidal, the conjugate filtration at m = 1.
- traceHabiro_smooth: for R smooth over A, H^∗(traceHabiro(R,L)/(q^m−1)) ≅ `qW_mΩ^∗_{R/A}` as graded A[q]/(q^m−1)-modules, with the Bockstein as differential (HabiroCohomologyFoundations §4.24).
- traceHabiro_multiplicative: under the hypothesis of tracePair_multiplicative, traceHabiro(R,L) is an `E_{n−1}-algebra` in Habiro-complete A[q]-modules and the reductions and q-Witt filtrations are `E_{n−1}-compatible` (HabiroCohomologyFoundations §4.23; KU Remark 4.28). A bare E₂-lift gives E₁ and no more.
- traceHabiro_pairEquiv: a specified equivalence of pairs tracePair(R,L) ≃ (R,F) induces traceHabiro(R,L) ≃ H(R,F), compatible with the h-completions, the partial completions and the q-Witt filtrations. Independence of the choice of lift is not part of this map; where it holds it is a theorem (§2.3).
- traceHabiro_periodic: `traceHabiro(R,L)⊗_ℤℤ[β^{±1}]` is the β-periodic Habiro–Hodge object of the trace pair, whose degreewise h-completion is the β-periodic q-Hodge object of HabiroCohomologyFoundations §4.28.
- traceHabiro_cyclonic: if moreover 2 ∈ R^× and the base satisfies the cyclonic coherence (A₂) of KU 5.43 (p.70; RefinedTraceMethods §6.11 cyclonic base coherence), then `traceHabiro(R,L)⊗ℤ[β^{±1}]` ≃ `Σ^{−2∗}gr^∗` lim_m `fil^⋆_{ev,S¹}TC^{−(m)}(KU_R/KU_A),` the limit over positive m with transitions mn → m (KU Theorem 5.63, pp.79–80; RefinedTraceMethods §6.13). The comparison is a `ℤ[β^{±1}]-linear` module equivalence; a multiplicative enhancement is not inferred from it.

**Checks.**

- Completion boundaries: for A = 0 the Habiro-complete category, reflection and completed tensor are zero. For B = M = 𝔽₂, multiplication by qᵐ−1 is injective on M[q,q⁻¹] for every m ≥ 1; the quotients by 1−q and (1−q)(1−q²) have dimensions 1 and 3. Their derived quotients and cyclotomic completion are static, despite the nonflat coefficient module ℤ/2 over ℤ (HabiroCohomologyFoundations §0.1; HabiroRings §2.4).
- traceHabiro_etale: for R finite étale over A with TraceInput.ofEtale, traceHabiro(R,L) is the static relative Habiro ring `H_{R/A}` of HabiroRings HR.5 (HabiroCohomologyFoundations §4.21; QH Corollary 3.13, p.27), and its h-completion is R[[h]]. A construction returning a new coefficient ring instead of `H_{R/A}` fails the finite-quotient theorem of HabiroRings §5.1: traceHabiro/(q^m−1) must be qW_m(R/A), with no classes in positive q-Witt degree.
- traceHabiro_unitFiltration: for the unit input over A = ℤ, traceHabiro is Habiro's ring lim_m `ℤ[q]^∧_{q^m−1},` and the filtered quotient of F^i = `h^{max(i,0)}ℤ[[h]]` by h is ℤ in degrees ≤ 0 and 0 in positive degrees; the degreewise quotient incorrectly leaves ℤ in degree one.
- traceHabiro_polynomial: for R = ℤ[x] with S[x], traceHabiro(R,L)^∧_h is the complex ℤ[x][[h]] → ℤ[x][[h]]dx with x^r ↦ `(q^r−1)x^{r−1}dx.` The q-de Rham complex has x^r ↦ [r]_q `x^{r−1}dx` instead; at r = 2 the two coefficients are q²−1 and 1+q, which differ already at q = 1 (0 against 2). Returning qΩ as the h-completion fails this.
- traceHabiro_kuLiftInsufficient: the perfected exponent-one quotient ℤ_p{x}_∞/x of KU 1.11 (p.5) admits an E₁-lift over ku, but no input over it exists: QH Lemma 3.3 (p.22), using Example 4.24 (pp.63–64), excludes any q-Hodge pair on its q-de Rham complex, whereas an input would produce one. Its naive filtration is not a q-deformation (HabiroCohomologyFoundations §5.20), and §2.2 also excludes a spherical E₁-lift. A constructor that accepted a ku-lift would produce a filtration violating clause (b).
- traceHabiro_mOne: at m = 1 the ascending filtration on traceHabiro/(q−1) has gr_i ≃ `Σ^{−i}dR^i_{R/A};` for R = ℤ[x] the reduction has H⁰ = ℤ[x] and H¹ = ℤ[x]dx with zero differential, while F_tr/β is the descending Hodge filtration of `dR_{ℤ[x]/ℤ},` whose H¹ is `⊕_{r≥1}(ℤ/r)x^{r−1}dx.` The two filtrations live on different objects and are not exchanged.
- traceHabiro_zero: for R = 0, traceHabiro = 0 although the uncompleted trace pair is the nonzero constant filtration on ℚ[[h]] (tracePair_zero); `H_{0/A}` = 0 (HabiroRings §5.1).

*Needs:* §§1.1–1.2; HabiroCohomologyFoundations §§4.14–4.24 and §4.28 (descent record, β-periodic object and coherent divisor maps); HabiroCohomologyFoundations §0.1; HabiroRings HR.2, HR.5; RefinedTraceMethods §§6.11–6.13 (cyclonic coefficients, KU Theorem 5.63) and §8.8 (coherent Habiro trace interface).

### Examples

For A = R = ℤ the trace pair is the h-adic filtration on ℤ[[h]], its Habiro descent is Habiro's ring, and the m = 1 reduction is ℤ. For R = ℤ[x] the h-completed descent is the coordinate q-Hodge complex, whose reduction by h has zero differential: H⁰ = ℤ[x], H¹ = ℤ[x]dx. For R = 0 the uncompleted pair is the constant filtration on ℚ[[h]] and the descent is zero. An E₂-lift at an odd prime makes the descent E₁, an E∞-lift makes it E∞, and at 2 the input always uses an (E₁) datum.

### Dependencies

HabiroCohomologyFoundations §§0.1, 2.1–2.3, 4.1, 4.14–4.24, 4.28 and 5.15; RefinedTraceMethods §§6.1, 6.9–6.14 and 8.8; QWittVectors §§2.1–2.5; HabiroRings HR.2, HR.5.

## Layer 2: Quasi-regular quotients

HabiroCohomologyFoundations Layer 5 defines the naive filtration of a quasi-regular quotient as an ordinary preimage and proves, by explicit divided-power lifts, that it is a q-deformation for higher powers of a regular sequence. The trace theory gives a second, independent criterion: a spherical lift after perfection. This layer records sufficient exponent conditions for higher-power quotients to have such lifts at each prime, proves the criterion, and shows that the trace pair of a quasi-regular quotient with identity-cover data is the canonical algebraic pair.

### 2.1 Spherical lifts of higher-power quotients

For natural numbers p and α define the exponent conditions

```text
E1QuotientExponent p α  :⇔  if p = 2 then (α even and α ≥ 4) else α ≥ 2,
E2QuotientExponent p α  :⇔  if p = 2 then (α even and α ≥ 6) else α ≥ 3.
```

At an odd prime the conditions are α ≥ 2 and α ≥ 3, respectively; at 2 they require even exponents at least 4 and 6. The displayed formulas also specify their values at nonprime p. Their application to spherical lifts always assumes p prime; the arithmetic implication E₂ ⇒ E₁ holds for all natural p and α.

**Theorem quotientLift.** Let p be a prime, T a p-complete connective E∞-ring and y₁,…,y_r ∈ π₀T. If E1QuotientExponent p α_i holds for every i, then

```text
T/(y₁^{α₁},…,y_r^{α_r}) := T/y₁^{α₁} ⊗_T ⋯ ⊗_T T/y_r^{α_r}
```

carries an E₁-T-algebra structure, the tensor product of the y_i-compatible quotient structures at odd p and the y_i²-compatible quotient structures at p = 2, where the quotient exponent relative to y_i² is α_i/2; if E2QuotientExponent p α_i holds for every i, it carries an E₂-T-algebra structure. For odd p, 2 is a unit in π₀T, so the obstruction Q₁(y) vanishes (it is killed by 2) and T/y has a unital multiplication (Bu Theorem 1.4 and footnote 4, p.2); StableHomotopyKTheory §7.32 in the E∞-monoidal category of T-modules, with v = y, makes T/y^q an Eₙ-T-algebra for q > n. At p = 2 apply §7.32 with v = y², whose cofiber has a unital multiplication by the Cartan formula for Q₁ (Bu Remark 5.5, p.12); this makes `T/y^{2q}` an Eₙ-T-algebra for q > n. Tensor products of Eₙ-T-algebras are Eₙ-T-algebras. (QH Remark 4.23, p.63; KU Examples 6.8–6.9, pp.82–83; TC 3.4 and Remark 3.6, p.31.)

Its consequences for the trace inputs are the following targets.

- quotientLift_framed (KU Example 6.8, pp.82–83). Let (S,□) be étale-framed smooth over A as in §1.1, y₁,…,y_r a regular sequence in S, and R = `S/(y₁^{α₁},…,y_r^{α_r}).` At a prime p with E2QuotientExponent p α_i for all i, the ring R̂_p satisfies (E₂) with the lift `(S_{S,□}/(y^α))^∧_p.` At a prime p with E1QuotientExponent p α_i for all i and R̂_p p-torsion free, R̂_p satisfies (E₁) with the cover R̂_p → `(Â_p⟨x^{1/p^∞}⟩` `⊗_{Â_p⟨x⟩}` R̂_p)^∧_p and the Čech lift obtained by base change of the Čech nerve of S_A[x] → `S_A[x^{1/p^∞}]` along S_A[x] → `S_{S,□}` → `S_{S,□}/(y^α).`
- quotientLift_identityCover (KU Example 6.9, p.83). Let B be a relatively perfect Λ-A-algebra (every relative Adams operation `B⊗_{A,ψ^m}A` → B is an isomorphism) with A → B quasi-lci, B′ an étale B-algebra, y₁,…,y_r a regular sequence in B′, and R = B′/(y^α) torsion free. At every prime p with E1QuotientExponent p α_i for all i, R̂_p has the identity-cover (E₁) datum with lift `(S_{B̂′_p}/(y^α))^∧_p,` where `S_{B̂′_p}` is the unique p-complete connective `E∞-S_{Â_p}-algebra` lifting the p-completely formally étale B̂′_p. If E1QuotientExponent holds at every prime, or at every odd prime and 2 ∈ R^×, then R is an object of TraceInput.ofIdentityCover.
- quotientLift_perfected (QH Remark 4.23, p.63). For a perfect-regular presentation R = `B/(x₁^{α₁},…,x_r^{α_r})` over a p-complete p-completely perfectly covered δ-ring A (HabiroCohomologyFoundations §5.15), R_∞ = (R⊗_A A_∞)^∧_p is B_∞/(x^α) with B_∞ = (B⊗_A A_∞)^∧_p perfect, hence with a unique p-complete connective E∞-lift; if E1QuotientExponent p α_i for all i, R_∞ has a spherical E₁-lift. This lift assertion does not require R to be p-torsion free.

Import the v-compatible Moore quotient towers from StableHomotopyKTheory §§7.32 and 7.34. At odd p use v = p; at p = 2 use v = 4 for the even-exponent tower selected by TC §3.3 (p.30). The high-powered predicate is supplied by RefinedTraceMethods §7.6: a positive integer m is high-powered exactly when E1QuotientExponent p v_p(m) holds for every prime p dividing m. Specialization of quotientLift to these supplied towers is the compatibility Check below (TC §3.4, p.31).

**Checks.**

- E1QuotientExponent at 2: α = 2 and α = 3 fail; applying the odd-prime lower bound at 2 would incorrectly admit both.
- E1QuotientExponent at 2: α = 4 and α = 6 hold, with tower exponents 2 and 3 relative to y², while α = 5 fails. Dropping evenness accepts α = 5, for which the tower with v = y² gives nothing.
- E1QuotientExponent at 3: α = 1 fails and α = 2 holds; imposing the 2-primary bound at every prime would lose the square at 3.
- E2QuotientExponent at 2: α = 4 and α = 7 fail, while α = 6 holds; the E₁ bound or a bound without evenness gives the wrong answer.
- E2QuotientExponent at 3: α = 2 fails and α = 3 holds, distinguishing the E₂ tower from the E₁ tower.
- Every exponent satisfying E2QuotientExponent satisfies E1QuotientExponent, including α = 6 at 2 and α = 3 at 3. The arithmetic implication holds for all natural inputs: the lower bounds are 6 ≥ 4 at 2 and 3 ≥ 2 otherwise.
- The conditions are sufficient, not necessary: S/8 is an E₁-algebra (Bu Theorem 1.1, p.1, proved by a separate 2-primary argument), although α = 3 fails the condition at 2, and the tower with v = 4 gives Eₙ-structures on `S/2^{2(n+1)}` only (Bu Remark 5.7, p.12).
- Moore-tower compatibility: specializing the tower `S_{ℤ_p{x}_∞}`/x^α along `S_{ℤ_p{x}_∞}` → S_p, x ↦ p, gives the supplied p-compatible tower at odd p and the supplied 4-compatible tower at 2, by v-compatible uniqueness (TC §3.4, p.31). Thus S/9 and S/16 are E₁, and S/64 is E₂. This compares the specified towers; it asserts no uniqueness of arbitrary Moore-algebra structures.
- Perfect δ-ring lifts: for B = ℤ_p the lift is S_p and the identity δ-map lifts to the identity, including p = 2 and 3. For B = 0 the lift is zero. For B = ℤ_p{x}_∞ the δ-maps x ↦ 0 and x ↦ p give spectral maps whose reductions differ by p ≠ 0 in ℤ_p; replacing the second map by the zero specialization would give cofiber S_p ⊕ ΣS_p instead of S/p^α after quotienting by x^α.
- High-powered integers: 1, 9, 16 and 64 satisfy the condition at every prime divisor, while 8 (v₂ = 3), 32 (v₂ = 5) and 12 (v₃ = 1) do not, matching RefinedTraceMethods §7.6.
- For A = B = ℤ₃, x = 3 and α = 2, the regular quotient R = ℤ/9 has E1QuotientExponent 3 2 and a spherical E₁-lift, but 3·3 = 0 with 3 ≠ 0 in R. It therefore fails the p-torsion-free hypothesis of §2.2; perfect-regular presentations do not imply that hypothesis.
- α = 1 is excluded at every prime: ℤ_p{x}_∞/x has no spherical E₁-lift (§2.2).

*Needs:* StableHomotopyKTheory §§7.32, 7.34; §1.1; RefinedTraceMethods §6.1 (spherical lifts, perfect δ-ring spherical lifts), §6.14 (étale lifts), §7.6 (high-powered integers); HabiroCohomologyFoundations §5.15 (perfect-regular presentations); QWittVectors §2.5 (relative perfection); Mathlib `Even`, `Nat.factorization`.

### 2.2 A spherical lift after perfection makes the naive filtration a q-deformation

**Theorem perfectedLiftNaive.** Let p be any prime, A a p-complete p-completely perfectly covered δ-ring with perfection A → A_∞ (p-completely faithfully flat, A_∞ perfect), and R a p-complete, p-torsion-free, p-quasi-lci A-algebra with R/p relatively semiperfect over A. Put

```text
R_∞ = (R ⊗_A A_∞)^∧_p.
```

If R_∞ admits a lift to a p-complete connective E₁-ring spectrum `S_{R_∞}` with `S_{R_∞}⊗_{S_p}ℤ_p` ≃ R_∞, then the naive filtration F_naive on `qdR_{R/A}` of HabiroCohomologyFoundations §5.17 is a q-deformation of the Hodge filtration: the canonical filtered map of QH Construction 4.21 induces

```text
F_naive / β  ≃  fil_Hdg dR_{R/A},
```

the quotient taken with h in filtration degree one. The lift proves a property of a filtration defined without it; only its existence matters. The theorem includes p = 2. (QH Theorem 4.22(b), pp.62–63, with proof pp.65–66; QH Theorem 1.19(b) and the remark after it, pp.9–10.)

**Proof route.** The map F_naive/β → fil_Hdg `dR_{R/A}` is degreewise injective (HabiroCohomologyFoundations §5.18; QH Lemma 4.26, p.64), so only surjectivity remains. Completed base change along A → A_∞ identifies (F_naive ⊗^L_A `A_∞)^∧_{(p,h)}` with the naive filtration of R_∞ over A_∞ (HabiroCohomologyFoundations §§5.17, 5.21; QH Lemma 4.27, p.65); the tensor product is completed at (p,h), and an uncompleted tensor product does not replace it. Since A → A_∞ is p-completely faithfully flat, surjectivity descends. Over the perfect base, `L_{A_∞/ℤ_p}` vanishes after p-completion, so `qdR_{R_∞/A_∞}` ≃ `qdR_{R_∞/ℤ_p}` and dR likewise, and the naive filtrations agree (QH, proof of Theorem 4.22, p.66). Now R_∞ is p-torsion free, p-quasi-lci over ℤ_p and R_∞/p is semiperfect, and `S_{R_∞}` is an identity-cover (E₁) datum over the base S_p; RefinedTraceMethods §6.9 (KU Theorem 4.17, p.45) identifies its trace q-Hodge filtration with the ordinary preimage of the combined Hodge and h-adic filtration, that is, with F_naive of R_∞, and KU Theorems 4.8 (p > 2, p.39) and 4.14 (p = 2, p.43) show that it reduces modulo β to the Hodge filtration.

Also provide the global corollary perfectedLiftNaive_qReg: let A be a perfectly covered Λ-ring and R satisfy condition (R) of HabiroCohomologyFoundations §5.15 (for every p: p-torsion free, R̂_p p-quasi-lci over Â_p, R/p relatively semiperfect over Â_p). If for every p the ring (R̂_p `⊗_{Â_p}` (Â_p)_∞)^∧_p, with (Â_p)_∞ the perfection of Â_p, admits a p-complete connective E₁-ring lift, then R belongs to `QReg^{qHdg}_A` and HabiroCohomologyFoundations §5.22 supplies its canonical pair, glued from the local naive filtrations and the rational combined filtration (QH Construction 4.28 and Theorem 4.29, p.66).

Also provide perfectedLiftNaive_higherPowers: for a perfect-regular presentation as in quotientLift_perfected, assume R is p-torsion free, p-quasi-lci and R/p relatively semiperfect, and that every exponent satisfies E1QuotientExponent at p. The lift from §2.1 supplies the spherical hypothesis of perfectedLiftNaive, so the naive filtration is a q-deformation in this exponent range (QH Remark 4.23, p.63). At p = 2 and α = 2 the algebraic theorem of HabiroCohomologyFoundations §5.19 applies independently, while this spherical route supplies no lift.

**Checks.**

- Higher powers: by quotientLift_perfected, a p-torsion-free perfect-regular quotient satisfying the standing p-quasi-lci and relative semiperfectness hypotheses, with exponents ≥ 2, satisfies the spherical hypothesis at odd p, and at p = 2 when every exponent is even and ≥ 4 (QH Remark 4.23, p.63). For A = ℤ₂{x}^∧₂ and R = A/x² the hypothesis is not supplied by this route, but HabiroCohomologyFoundations §5.19 (QH Theorem 4.22(a)) still proves the conclusion; this theorem does not replace that argument.
- Toric x − 1 (QH Example 4.25, p.64): for A = ℤ_p[x]^∧_p with δ(x) = 0 and R = A/(x−1) ≅ ℤ_p, the E∞-map S_p[x]^∧_p → S_p, x ↦ 1, base changed along S_p[x]^∧_p → `S_p[x^{1/p^∞}]^∧_p,` lifts R_∞ as an E∞-ring. The q-divided powers `δ^{(n)}_q(x,1)` = `∏_{0≤i<n}(x−q^i)/[n]_q!` lie in `qdR_{R/A}` (by the argument of KU Lemma 6.11, as supplied by RefinedTraceMethods §6.10) and in the n-th naive step, and reduce at q = 1 to (x−1)^n/n!; for n = 2 this is (x−1)(x−q)/(1+q) ↦ (x−1)²/2. These quotients are elements of the q-PD envelope constructed by the supplier, not divisions in A or R; in particular at p = 2 the value (x−1)²/2 denotes the divided-power element. The presentation is not of higher-power form.
- Exponent one: for A = ℤ_p{x}^∧_p and R = A/x, R_∞ = ℤ_p{x}_∞/x and the naive filtration is not a q-deformation (HabiroCohomologyFoundations §5.20; QH Example 4.24, pp.63–64). By this theorem ℤ_p{x}_∞/x admits no p-complete connective E₁-ring lift, although it admits an E₁-lift over ku (KU 1.11, p.5). The spherical hypothesis cannot be weakened to a ku-lift.
- Gluing: for a ℚ-algebra R every local hypothesis is empty and perfectedLiftNaive_qReg returns the rational pair of HabiroCohomologyFoundations §4.1 (rational pair); the local factors are zero and do not determine the global pair, whose rational combined-filtration corner is retained.

*Needs:* The general criterion and its global corollary need HabiroCohomologyFoundations §2.6 (completed base change), §§5.15–5.22; RefinedTraceMethods §6.9 (KU Theorems 4.8, 4.14, 4.17).

The higher-power application additionally needs §2.1 quotientLift_perfected.

### 2.3 Trace pairs of quasi-regular quotients are the canonical quasi-regular pairs

**Theorem tracePair_quasiRegular.** Let A be as in §1.1 and R an A-algebra with `L_{R/A}` of Tor-amplitude [0,1], such that for every prime p, R is p-torsion free, R/p is relatively semiperfect over Â_p, and R̂_p admits a p-complete connective `E₁-S_{Â_p}-algebra` lift. Let L be an identity-cover input over R (TraceInput.ofIdentityCover, with any compatible gluing data). Then:

1. R belongs to `QReg^{qHdg}_A:` the base change of the lift of R̂_p along the E∞-map `S_{Â_p}` → `S_{(Â_p)_∞}` of KU Lemma A.1 (p.87) lifts (R̂_p ⊗ (Â_p)_∞)^∧_p, so perfectedLiftNaive_qReg applies;
2. tracePair(R,L) ≃ (R, F_QReg), the canonical quasi-regular pair of HabiroCohomologyFoundations §5.22, naturally in morphisms of identity-cover inputs; in particular F_tr is independent of the lifts and of the gluing data, and it carries the filtered E∞ structure of F_QReg and its filtered derived commutative refinement under the enhanced contract of HabiroCohomologyFoundations §5.22 (QH Construction 4.28 and Remark 4.31, pp.66–67);
3. traceHabiro(R,L) ≃ H(R, F_QReg).

**Proof route.** Both filtrations have F⁰ = `qdR_{R/A},` and each is the pullback of its completion along `qdR_{R/A}` → F̂⁰ (HabiroCohomologyFoundations §2.1), so it suffices to identify the completions compatibly with the maps from `qdR_{R/A}.` The completion of F_QReg is the arithmetic pullback of the completed local naive filtrations and the completed rational combined filtration (QH Construction 4.28). The completion of F_tr is `Σ^{−2∗}gr^∗` of the glued even filtration, which by KU 4.21–4.23 (pp.47–48) is the pullback of the local pieces `Σ^{−2∗}gr^∗TC⁻_■(ku_{R̂_p}/ku_{Â_p})` and the rational piece `Σ^{−2∗}gr^∗HC⁻(R⊗ℚ[β]/A⊗ℚ[β]).` At each prime the identity-cover description (KU Theorem 4.17, p.45; RefinedTraceMethods §6.9) identifies the local piece with the completed naive filtration, and the rational piece is the combined Hodge and h-adic filtration on the Hodge-completed `(dR_{R/A}⊗ℚ)^∧[[h]]` (KU 4.25(b), p.50), the completion of the rational corner of QH Construction 4.28. The corner identifications intertwine the gluing maps. In filtration degree zero this is KU Lemma 4.29 (p.51): the glued ψ⁰_R restricts to the local maps and to the rational Hodge-completion map, which are the maps of the algebraic gluing (QH Construction A.12, used in Theorem 4.29, p.66). In positive degrees, the proof of KU Theorem 4.17 (pp.45–46) identifies each local filtration as the preimage of its rationalisation, so both the trace and the algebraic filtrations are preimages of the same combined filtration on (∏_p `dR_{R̂_p/Â_p}⊗ℚ)[[h]]` and the identification is forced. The pair data (b), (c), (c_p) are induced from the corners on both sides. Neither source states this global comparison; the local statement is KU Theorem 4.17, and this target assembles it with the two gluing constructions.

**Checks.**

- Perfection map: for A = R = ℤ_p, A_∞ = ℤ_p and the spherical perfection map is the identity S_p → S_p. For A = R = ℤ_p⟨x⟩ with φ(x) = x^p, its reduction is the inclusion into ℤ_p⟨`x^{1/p^∞}`⟩, and extension of scalars of S_A reduces to A_∞. Modulo p, roots through `x^{1/p^N}` cannot generate `x^{1/p^{N+1}}`; the extension is not finitely presented, so finite-presentation étale lifting cannot supply this map. For A = R = 0, both the map and its base change are the unique maps between zero objects.
- Toric base: A = ℤ[x] with ψ^m(x) = x^m and S_A = S[x] satisfies the hypotheses of §1.1 (KU Example 6.1, p.81). For R = ℤ[x]/(x−1) = ℤ, the E∞-map S[x] → S lifts R and R/p = 𝔽_p is relatively semiperfect over ℤ[x]. The trace filtration is the canonical one and contains `δ^{(n)}_q(x,1)` in step n, the global form of QH Example 4.25.
- Higher powers with identity cover: A = ℤ, B = `ℤ[x^{1/n}` : n ≥ 1] with the toric Λ-structure (relatively perfect; KU Example 6.9, p.83) and R = B/(x⁴). By quotientLift_identityCover the identity-cover datum exists at every prime, the trace pair is the canonical pair, and it is independent of the chosen lift S_B/(x⁴). For R = B/(x²) the identity-cover datum is supplied at odd primes only; after inverting 2 it is supplied everywhere.
- For m > 1, ℤ/m is not torsion free and is outside this theorem. For positive powerful m (every nonzero prime valuation is at least 2), the algebraic pair is required from HabiroCohomologyFoundations §5.26. For high-powered m in the sense of §2.1, RefinedTraceMethods §7.6 supplies its completed trace description (TC Corollary 3.8, p.32). For m = 1 the zero ring is an identity-cover input; its pair and descent are the zero-ring Checks of Layer 1. Its uncompleted pair keeps the rational corner ℚ[[h]] with the constant filtration, which a product of local factors would drop (see Remarks on the sources).
- Branch dependence is not asserted: for R = ℤ[x] the input of §1.1 uses (E₂) at odd primes and is not an identity-cover input (ℤ[x]/p is not relatively semiperfect over ℤ, since Ω¹/p ≠ 0); its trace pair is compared with the canonical smooth pair in §3.1, not here.

*Needs:* §§1.2–1.3, §2.2; RefinedTraceMethods §6.1 (spherical perfection map), §6.9 (KU Theorem 4.17), §6.10 (gluing); HabiroCohomologyFoundations §2.1, §§5.17–5.23.

### Examples

At an odd prime every higher power y^α with α ≥ 2 has a spherical E₁-quotient, and α ≥ 3 an E₂-quotient; the chosen tower at 2 uses even exponents at least 4 or 6. The toric quotient ℤ_p[x]/(x−1) has a spherical lift without a higher-power presentation, and its naive filtration contains the q-divided powers `∏_{i<n}(x−q^i)/[n]_q!.` The exponent-one quotient of the perfect free δ-ring has a ku-lift but no spherical lift.

### Dependencies

Layer 1; StableHomotopyKTheory §§7.32, 7.34; RefinedTraceMethods §§6.1, 6.9, 6.10, 6.14, 7.6; HabiroCohomologyFoundations §§2.1, 2.6, 4.1, 5.15–5.23 and 5.26.

## Layer 3: Framed smooth algebras

This layer compares the canonical filtration of HabiroCohomologyFoundations with the framed trace pair supplied by RefinedTraceMethods §6.10. The framed theorem has every relative dimension as its domain; the canonical comparison also requires the primes up to the relative dimension to be inverted. The framed trace theorem and its q-divided-power and Čech proofs are imported through the contract above.

Throughout, A is as in §1.1 and torsion free, S is smooth over A with an étale framing □ : P = A[x₁,…,x_d] → S, and the coordinate q-de Rham complex is

```text
q-Ω^∗_{S/A,□} = ( S[[h]] → Ω¹_{S/A}[[h]] → ⋯ → Ω^d_{S/A}[[h]] ),  ∇_q = Σ_k ∇_{q,k} dx_k,
∇_{q,k} f = (γ_k f − f)/((q−1)x_k),  γ_k(x_k) = q x_k,
```

with γ_k extended to S by the infinitesimal lifting property of □ (QH Example 3.12, pp.25–26). The displayed quotient denotes the integral Jackson operator: its numerator is divisible by hx_k in the framed model. It does not invert h or x_k. In particular it is defined at x_k = 0; after q = 1 it is the ordinary partial derivative. Its coordinate filtration `fil^i_{q-Hdg,□}` has `h^{max(i−j,0)}Ω^j_{S/A}[[h]]` in form degree j (HabiroCohomologyFoundations §4.8). On the trace side the complex sits in homotopical degrees [−d,0].

### 3.1 Agreement of the canonical and framed trace filtrations

**Theorem canonicalFramedTrace.** Let A, S and □ be as above with d framing coordinates, put n = max(d, 1), and assume every prime p ≤ n is a unit in S (for d ≥ 2 this inverts 2, so the datum of ofFramed at 2 is empty; for d ≤ 1 no prime is inverted). Then on this common domain the canonical pair (S, F_n) of HabiroCohomologyFoundations §§5.2–5.3 (compatible larger admissible bounds give the same pair by §5.7) and the trace pair tracePair(S, ofFramed □) are equivalent as pairs, through the coordinate pair:

```text
(S, F_n)  ≃  (S, F_□)  ≃  tracePair(S, ofFramed □),
```

and hence traceHabiro(S, ofFramed □) ≃ H(S, F_n), the affine value of algebraic Habiro cohomology of HabiroCohomologyFoundations §5.13. The comparison uses the full common framed domain; it imposes no inversion of 2 beyond the stated domain and the trace hypotheses.

**Proof route.** The first equivalence is the particular map of HabiroCohomologyFoundations §5.4: the counit of `τ_{n,!}` ⊣ τ*_n composed with the fixed identification of the truncated defining pullbacks gives F_n → F_□ on `qΩ_{S/A},` its reduction by β is the identity on fil_Hdg `Ω_{S/A},` and since both filtrations are complete this map is an equivalence (QH Remark 4.4, p.55, with Lemmas 4.6–4.7, pp.55–56). Completeness would not make an arbitrary map, such as the zero map, an equivalence; the specified map is used. The second equivalence is the framed pair equivalence imported from RefinedTraceMethods §6.10, with its prime-two resolution comparison and pair coherences. Pull both back along `qdR_{S/A}` → `qΩ_{S/A},` carrying the zeroth-step, mod-β, rational and p-adic rational identifications and their coherences through the defining pullbacks (HabiroCohomologyFoundations §4.1, pullback of underived pairs; QH Remark 3.6, p.22; Example 3.12, pp.25–26), and apply traceHabiro_pairEquiv. This uses no uniqueness statement for arbitrary filtrations and no uncompleted framed Habiro Koszul model (the comparison with the uncompleted framed Koszul complex is HabiroCohomologyFoundations §4.17a).

Provide canonicalFramedTrace_pair (the composite equivalence of pairs), canonicalFramedTrace_habiro (the induced equivalence of Habiro–Hodge objects, compatible with h-completion, partial completions and q-Witt filtrations) and canonicalFramedTrace_einfty (the E∞-structure supplied by RefinedTraceMethods §6.10 (KU Remark 6.14, p.86) transported to H(S,F_n) for this framed S).

**Checks.**

- canonicalFramedTrace_line: for S = ℤ[x] (d = 1, no prime inverted) with the lift S[x], the trace, coordinate and canonical filtrations agree: F^i = ((q−1)^iℤ[x][[h]] → `(q−1)^{i−1}ℤ[x][[h]]dx)` for i ≥ 1, the canonical filtration of HabiroCohomologyFoundations §5.2 at n = 1. The same holds for ℤ[1/2][x] with S[1/2][x], where the datum at 2 is empty.
- canonicalFramedTrace_etale: for d = 0 every framing is étale and n = 1; the completed filtrations on all three sides are F̂^i = `h^{max(i,0)}S[[h]],` and the pairs themselves are their pullbacks along `qdR_{S/A}` → S[[h]]. The Habiro descent is `H_{S/A}.` With A = ℚ and S = ℚ(i), tracePair_etaleUncompleted distinguishes these pairs from their completed filtrations already at step zero.
- canonicalFramedTrace_derivedReduction: for the polynomial q-Hodge complex M = (ℤ[x][[h]] → ℤ[x][[h]]dx, x^r ↦ `(q^r−1)x^{r−1}dx),` H⁰(M/^Lh) = ℤ[x] while H⁰(M)/h = ℤ; the missing classes x^r, r ≥ 1, map under the Bockstein to the nonzero h-torsion classes [r]_q `x^{r−1}dx` of H¹(M)[h]. Replacing the derived reduction of the descended object by the reduction of its cohomology fails the comparison of the q-Witt filtrations at m = 1.
- Jackson normalization: on the framed line, ∇_q(1) = 0, ∇_q(x) = dx and ∇_q(x²) = (1+q)x dx. At q = 1 these are 0, dx and 2x dx; at x = 0 the last is 0. Literal division by x would be undefined there, and a zero operator would fail the linear test.
- canonicalFramedTrace_tensorDomain: ℤ[x] lies in the canonical domain but its tensor square ℤ[x,y] has d = 2 and requires 2 to be inverted; RefinedTraceMethods §6.10 applies to ℤ[x,y] over ℤ, while this theorem applies only to ℤ[1/2][x,y]. The canonical domain is not closed under this tensor product, and no closure is claimed.
- canonicalFramedTrace_laurent: for A = ℚ and S = `ℚ[x^{±1}]` framed by ℚ[x] → `ℚ[x^{±1}],` `qdR_{S/ℚ}` ≃ ℚ[[h]] while `qΩ_{S/ℚ}` ≃ `Ω^•_{S/ℚ}[[h]]` has H¹ spanned by dx/x (HabiroCohomologyFoundations §4.28). The comparison holds for the completed filtrations and is pulled back to qdR; it does not identify qdR with qΩ.

*Needs:* §1.3; RefinedTraceMethods §6.10 (full framed comparison, prime-two resolution agreement, pair coherences and E∞ refinement); HabiroCohomologyFoundations §1.14, §4.1, §4.8, §§5.2–5.4, §5.7 (agreement of bounds), §5.13.

### Examples

For ℤ[x] the trace filtration is ((q−1)^i → `(q−1)^{i−1}dx)` for i ≥ 1, the canonical filtration with no prime inverted is the same, and the descended object has h-completion with differential x^r ↦ `(q^r−1)x^{r−1}dx.` For ℤ[x,y] the trace pair exists over ℤ and is E∞, while the canonical pair needs 2 inverted. For the fixed framing on the line, the transported E∞-structure is not an untwisted product on the coordinate complex: ∇_q(x²) = (1+q)x dx, whereas ordinary Leibniz would give 2x dx. The multiplicative comparison uses the supplied enhanced structure.

### Dependencies

Layer 1; RefinedTraceMethods §6.10 (full framed comparison) and §6.14 (étale lifts); HabiroCohomologyFoundations §§1.14, 4.1, 4.4, 4.8, 4.21–4.23, 5.2–5.4, 5.7, 5.13. The q-PD and Čech proof inputs are supplied through RefinedTraceMethods §6.10, not constructed in this layer.

## Layer 4: Number-field trace specialisations

The Habiro ring of a number field is defined by Frobenius-twisted gluing of power series at roots of unity (GSWZ Definition 1.1, pp.6–7), identified with the relative Habiro ring of HabiroRings HR.5, and realised by RefinedTraceMethods §6.14 as π₀ of a limit of genuine fixed points of THH over periodic K-theory. This layer makes the second description usable: it transports the cyclotomic reductions and Taylor maps along that ring isomorphism.

### 4.1 The trace inversion condition and the genuine-fixed-point realisation

For a number field F and an integer Δ define

```text
TraceInversion F Δ  :⇔  0 < Δ,  6 ∣ Δ  and  disc(F) ∣ Δ,
```

with disc(F) = `NumberField.discr F` ∈ ℤ. The coefficient ring is R = 𝒪_F[1/Δ], the localisation of 𝓞 F away from Δ. The étaleness of R over ℤ when disc(F) | Δ is required from HabiroRings §5.8; 6 | Δ is the additional hypothesis of the trace realisation, which needs 2 ∈ R^× for KU Theorem 5.63 (RefinedTraceMethods §6.13). The factor 3 is retained from the stated hypothesis of KU Corollary 6.15 (p.86); Theorem 5.63 does not explain its role. Prove TraceInversion.isUnit_two_three: under the condition, 2 and 3 are units of R, because Δ becomes a unit in R, 6 divides Δ, and a product of commuting elements is a unit exactly when both factors are (Mathlib `IsLocalization.Away.algebraMap_isUnit`, `isUnit_of_dvd_unit`, `Commute.isUnit_mul_iff`).

For such F and Δ let S_R be the unique étale E∞-S-algebra lifting R (RefinedTraceMethods §6.14; Lurie, Higher Algebra Theorem 7.5.0.6, p.1374) and put

```text
P_R := π₀ lim_{m ∈ ℕ, m ≥ 1, with transitions from mn to m} ( THH(KU⊗S_R/KU)^{C_m} )^{h(S¹/C_m)}.
```

The order of operations is part of the definition: genuine C_m-fixed points of the cyclonic spectrum THH(KU⊗S_R/KU), then homotopy fixed points of the residual circle S¹/C_m, then the limit in spectra along the divisibility maps (KU Remark 5.62; RefinedTraceMethods §6.12), then π₀. RefinedTraceMethods §6.14 supplies the ring isomorphism

```text
ε_R : H_{R/ℤ} ≅ P_R
```

(KU Corollary 6.15, p.86; Corollary 1.15, p.8), with `H_{R/ℤ}` the relative Habiro ring of HabiroRings HR.5. The proof there uses periodic KU, obtained from the connective cyclonic construction by Bott inversion, and the static Habiro–Hodge object of the étale algebra (HabiroCohomologyFoundations §4.21; QH Corollary 3.13, p.27). Neither homotopy C_m-fixed points nor lim_m π₀ is substituted for the expression above, and connective ku is not substituted for KU.

Provide TraceInversion, TraceInversion.isUnit_two_three, TraceInversion.finiteEtale (R is finite étale over ℤ[1/Δ] via the localization map ℤ[1/Δ] → 𝒪_F[1/Δ]: finite by localization of the finite free ℤ-module 𝓞 F, and étale by base change of the HabiroRings §5.8 contract along ℤ → ℤ[1/Δ], using R⊗_ℤℤ[1/Δ] ≅ R), genuineRealisation (the ring P_R) and genuineRealisation.epsilon (the imported ε_R).

**Checks.**

- TraceInversion.rat: TraceInversion ℚ 6 holds, since disc(ℚ) = 1. TraceInversion ℚ 1 fails although disc(ℚ) | 1: the coefficient ring ℤ exists, but 6 ∤ 1 and the realisation of KU Corollary 6.15 is not available. In ℤ[1/6] both 2 and 3 are units.
- TraceInversion.positive: Δ = 0 and Δ = −6 fail for F = ℚ even though both divisibility conditions hold. Dropping positivity would admit them, and localising at 0 would give the zero ring rather than the intended number-field coefficient ring.
- TraceInversion.notIntrinsic: for F = ℚ(i), disc(F) = −4; Δ = 6 fails (4 ∤ 6) while Δ = 12 holds, and both give the ring ℤ[i][1/6]. The condition is on the chosen integer, and the realisation needs one admissible Δ for the ring.
- For F = ℚ and Δ = 6 the localized scalar map is the identity ℤ[1/6] → ℤ[1/6], a finite étale map of rank 1; for F = ℚ(i), Δ = 12 gives rank 2 with basis 1,i and invertible discriminant −4. With Δ = 1 the Gaussian extension has nonzero differentials modulo 2 (Ω¹ = 𝔽₂[i]·di ≠ 0, since 2i = 0), so omitting discriminant inversion would fail étaleness.
- TraceInversion.cubic: for F = ℚ(∛2), disc(F) = −108 = −2²·3³; Δ = 108 is admissible and R = ℤ[∛2][1/6] (HabiroRings HR.7).
- For the positive divisibility diagram, C₁ = {1} and the term at m = 1 is `THH(KU⊗S_R/KU)^{hS¹}`; the edge 2 → 1 has this target. An index 0 would require a finite subgroup of order 0, which does not exist.
- Zero coefficient datum: for R = 0 the lifted algebra and THH are zero, so every positive-index fixed-point term, its limit and P_R are zero. For R = ℤ[1/6] the order-one completion is ℤ[1/6][[h]] and sends 1 to 1. These distinguish the zero functor from the specified realisation.
- genuineRealisation.order: replacing `(THH^{C_m})^{h(S¹/C_m)}` by `THH^{hC_m}` followed by the residual action, or by TR-type restriction limits, changes the object: cyclonic spectra carry no restriction maps (RefinedTraceMethods §6.12, Check the absence of TR restriction maps), and the limit is along the divisibility maps of KU Remark 5.62.

*Needs:* Mathlib `NumberField.discr`, `Rat.numberField_discr`, `NumberField.RingOfIntegers`, `Localization.Away`, `IsLocalization.Away.algebraMap_isUnit`, `map_dvd`, `isUnit_of_dvd_unit`, `Commute.isUnit_mul_iff`; HabiroRings HR.5 (number-field coefficients); HabiroCohomologyFoundations §4.21; RefinedTraceMethods §§6.11–6.14.

### 4.2 Cyclotomic and Taylor maps on the realisation

**Construction numberFieldTraceExports.** For F, Δ with TraceInversion F Δ and R = 𝒪_F[1/Δ], fix a compatible system of roots of unity (HabiroRings §5.2). For every m ≥ 1 define

```text
ρ_m := (H_{R/ℤ} → H_{R/ℤ}/(q^m−1) ≅ qW_m(R/ℤ)) ∘ ε_R^{−1} : P_R → qW_m(R/ℤ),
τ_m := (H_{R/ℤ} → T_m = (R⊗ℤ[ζ_m])[[q−ζ_m]]) ∘ ε_R^{−1} : P_R → T_m,
```

The base ℤ[1/Δ] gives canonically equivalent maps. The constant Taylor family 1/Δ satisfies every prime-edge relation: Frobenius fixes it away from Δ, and the completed terms at primes dividing Δ vanish. Thus Δ is a unit in `H_{R/ℤ}.` Applying the completed base-change equivalence of HabiroRings §5.6 to ℤ → ℤ[1/Δ] and R⊗_ℤℤ[1/Δ] ≅ R gives `H_{R/ℤ}` ≃ `H_{R/ℤ[1/Δ]},` hence qW_m(R/ℤ) ≃ qW_m(R/ℤ[1/Δ]) through their finite quotients. This identifies the two base conventions without inserting all elements of R as constant Taylor families.

The first map is the finite-quotient map of HabiroRings §5.1 (QH Theorem 2.9, pp.16–17) and the second the Taylor component of §5.2 at ζ_m. The coefficient algebra R⊗ℤ[ζ_m] is the full tensor algebra, with all its idempotent factors (HabiroRings §5.2). The family (τ_m)_m identifies P_R with the Frobenius-twisted Taylor equalizer of HabiroRings HR.5: for every prime p and every m, the components satisfy `can_{p,m}(τ_m` z) = `φ_{p,m}(τ_{pm}` z) in `T_{p,m}` = `(R̂_p[ζ_{pm}])[[q−ζ_m]],` where can extends coefficients and `φ_{p,m}` applies the completed Frobenius of R̂_p on coefficients and re-expands at ζ_m (GSWZ (13), p.7). At p | Δ the completed terms vanish. All laws follow by applying the corresponding law of `H_{R/ℤ}` to `ε_R^{−1}(z);` the construction proves no fixed-point theorem and reconstructs no coefficient ring. (KU Corollary 6.15, p.86; GSWZ Definition 1.1 with (12)–(13), pp.6–7; QH Corollary 3.13, p.27.)

Provide the following operations and laws.

- numberFieldTraceExports: the family (ρ_m, `τ_m)_{m≥1}` on P_R.
- numberFieldTraceExports_cyclotomic: ρ_m = reduction_m ∘ `ε_R^{−1},` with its completed version P_R → `H_{R/ℤ,m}` = `(H_{R/ℤ})^∧_{q^m−1},` compatible with the transitions, which deform the q-Witt Frobenius (HabiroRings §5.1).
- numberFieldTraceExports_taylor: τ_m = Taylor_m ∘ `ε_R^{−1},` with the chosen root ζ_m and the change-of-root isomorphisms of HabiroRings §5.2.
- numberFieldTraceExports_transition: the prime-edge relations `can_{p,m}` ∘ τ_m = `φ_{p,m}` ∘ `τ_{pm},` transported from HabiroRings HR.5.
- numberFieldTraceExports_equalizer: z ↦ (τ_m z)_m identifies P_R with Eq(∏_m T_m ⇉ `∏_{p,m}` `T_{p,m}),` the HabiroRings HR.5 Taylor equalizer. No R-algebra structure by constant families is introduced.
- numberFieldTraceExports_hCompletion: the h-completion of P_R is R[[h]] by τ₁, and its Φ_m(q)- and (q^m−1)-completions are those of HabiroRings §5.1, transported along ε_R.
- numberFieldTraceExports_naturality: for an embedding F → E and one Δ with TraceInversion F Δ and TraceInversion E Δ, the induced map R = 𝒪_F[1/Δ] → S = 𝒪_E[1/Δ] lifts uniquely to S_R → S_S (étale lifts form an equivalence of categories), and the squares relating ε_R, ε_S, ρ_m and τ_m with the maps of relative rings of HabiroRings §5.1 commute, with identity and composition laws. The source states Corollary 6.15 objectwise; the naturality of ε in such maps is part of this target.

**Checks.**

- numberFieldTraceExports_rational: for F = ℚ and Δ = 6, R = ℤ[1/6] has identity Adams operations and `H_{R/ℤ}` is the Habiro completion of ℤ[1/6][q] (HabiroRings, untwisted case). The m = 1 completion is ℤ[1/6][[h]], and h maps to the formal parameter.
- numberFieldTraceExports_mOne: at m = 1, ζ₁ = 1 and qW₁(R/ℤ) = R; reducing τ₁ modulo h gives ρ₁. This does not identify the uncompleted ring P_R with R, nor is τ₁ injective: for R = ℤ[1/6] the prime-edge relations at 2 and 3 are empty, the Taylor equalizer splits into factors indexed by the 2- and 3-adic valuations of the root orders, and τ₁ is zero on every factor other than the one containing order one (HabiroCyclotomicCompletions §5.3, imported through HabiroRings HR.5, and GSWZ Remark 1.2, p.7).
- Full coefficients: for F = ℚ(i), Δ = 12 and m = 4, R⊗ℤ[i] ≅ R×R. The idempotent (1⊗1−i⊗i)/2 has values 1 and 0 under the two root embeddings, and the Taylor factor is (R×R)[[q−ζ₄]]. Keeping one embedding loses a factor.
- Re-expansion direction: at p = 2, m = 1 before coefficient localization, ζ₂ = −1 and φ₂,₁(q+1) = (q−1)+2. For R = ℤ[1/6] this overlap is zero; at p = 5, m = 1 the analogous substitution is q−ζ₅ = (q−1)+(1−ζ₅). Reversing the root difference changes this equality.
- numberFieldTraceExports_twisted: for F = ℚ(i), Δ = 12 and R = ℤ[i][1/6], the constant family f_m = i does not glue at p = 7, m = 1: f₁(x + ζ₇ − 1) = i, while φ₇(f₇) = φ₇(i) = i⁷ = −i in ℤ₇[i][ζ₇][[x]], since 7 is inert in ℚ(i) and the Frobenius of ℤ₇[i] raises roots of unity of order prime to 7 to the seventh power. At p = 2 and p = 3 the relation is empty because R̂₂ = R̂₃ = 0. The twisted family f_m = φ_m⁻¹(i), with φ_m the product of the Frobenius elements `φ_ℓ^{v_ℓ(m)}` over the primes ℓ ∤ Δ (they exist globally because F is abelian over ℚ; GSWZ footnote 1, p.6), glues: φ₇(f₇) = φ₇(−i) = i = f₁. Treating every coefficient as a constant Taylor family fails the gluing law.
- numberFieldTraceExports_frobeniusDirection: let F = ℚ(ζ₇), Δ = 6·7⁵, a = ζ₇ and p = 11. Arithmetic Frobenius sends a to a⁴ and has order three: 4² ≡ 2 and 4³ ≡ 1 modulo 7. On the m = 1 edge, f₁ = a and f₁₁ = φ₁₁⁻¹(a) = a² satisfy φ₁₁(a²) = a⁸ = a. Choosing f₁₁ = φ₁₁(a) = a⁴ instead gives φ₁₁(a⁴) = a¹⁶ = a² ≠ a. Thus the compatible constant-coefficient family in an abelian field is f_m = φ_m⁻¹(a); the Gaussian and cubic Frobenius Checks alone cannot distinguish the inverse convention (GSWZ (13), p.7).
- numberFieldTraceExports_nonabelian: for F = ℚ(∛2), Δ = 108 and R = ℤ[∛2][1/6], at p = 5 one has x³ − 2 ≡ (x − 3)(x² + 3x + 4) mod 5 with an irreducible quadratic factor, so the completed Frobenius at 5 moves the quadratic component of ∛2 and the constant family ∛2 fails the gluing law; no global field automorphism replaces this Frobenius (HabiroRings HR.7). Every element of P_R nevertheless has a Taylor family satisfying the twisted equalizer.
- numberFieldTraceExports_gluing: every family (f_m)_m ∈ ∏_m T_m satisfying all prime-edge relations is τ(z) for exactly one z ∈ P_R; an unrestricted product of independent expansion rings is strictly larger, already for F = ℚ, Δ = 6, where (1, 0, 0, …) fails the relation at p = 5, m = 1.
- numberFieldTraceExports_inversion: for F = ℚ and Δ = 1 the coefficient ring ℤ is étale over ℤ but TraceInversion fails; this construction cannot be invoked there, although HabiroRings constructs `H_{ℤ/ℤ}.`

*Needs:* §4.1; HabiroRings §§5.1–5.9 (relative ring, compatible roots, full coefficient algebras, Taylor maps, equalizer and number-field coefficients), §7.3; RefinedTraceMethods §6.14.

### Examples

For F = ℚ and Δ = 6 the realisation P_R is the Habiro completion of ℤ[1/6][q], τ₁ is its expansion at q = 1 into ℤ[1/6][[h]], and ρ₁ its value at q = 1. For F = ℚ(i) and Δ = 12 the compatible embedding R → H_R sends i to the twisted family (φ_m⁻¹(i))_m, not the constant family. For F = ℚ(∛2) the constant family of ∛2 does not glue and no global Frobenius is available to twist it, but every element of P_R still has its Frobenius-glued Taylor family.

### Dependencies

Layer 1 (only through the étale case of §1.3); HabiroRings HR.5, HR.7; HabiroCohomologyFoundations §4.21; RefinedTraceMethods §§6.11–6.14; Mathlib number-field discriminants and localisations.

## Downstream consumers

Section 4.2 tests the coefficient specialisations supplied by HabiroRings HR.5 and HR.7 against the genuine-fixed-point description. HabiroNahmSeries may consume these trace specialisations after this roadmap; its K₃-indexed modules, regulator lines and series remain its own constructions. Consumers of trace-produced pairs — the finite-coefficient computations of RefinedTraceMethods §7.6 excepted, which use HabiroCohomologyFoundations §5.26 directly — import Layer 1 for their Habiro descent and Layer 2 or 3 to identify the pair with an algebraic one. Algebraic consumers stay with HabiroCohomologyFoundations and HabiroRings.

## Remarks on the sources

- GSWZ footnote 1 (p.6) displays the general abelian-field coefficient embedding using φ_m. With its arithmetic Frobenius and prime-edge direction (13), p.7, the compatible formula is a ↦ (φ_m⁻¹(a))_m: for p ∤ Δ, φ_p `φ_{pm}⁻¹` = φ_m⁻¹. The order-three Check in §4.2 distinguishes the two formulas; the Gaussian case has order two and agrees with either.

- KU, proof of Corollary 6.15 (p.86), cites QH Corollary 3.12 for the étale identification of the Habiro–Hodge object with the Habiro ring; the statement used is QH Corollary 3.13 (p.27), Example 3.12 being the framed construction that precedes it. The ring isomorphism is unaffected.
- TC 3.5 (p.31) defines the finite-coefficient pair on ℤ/m as the product of its p-local factors, and Lemma 3.7 (p.32) treats the rational comparisons as vacuous because (ℤ/m)⊗ℚ = 0. The uncompleted derived de Rham complex of the zero ℚ-algebra is ℚ (write 0 = `ℚ⊗_{ℚ[y]}ℚ` along y ↦ 0 and y ↦ 1 and use the Poincaré lemma), so the rational corner of `qdR_{(ℤ/m)/ℤ}` is ℚ[[h]] with the constant filtration; already for m = 1 the product of local factors is empty while this corner is not. HabiroCohomologyFoundations §5.26 defines the pair by the arithmetic pullback that keeps it, and tracePair_zero checks the case m = 1 on the trace side. The filtration completion and the q-Hodge complex used in TC Corollary 3.8 are unchanged.
- KU Lemma 6.11 and the proof of Theorem 6.10 (pp.84, 86) write γ̃^d_q(x−y) = `(x−y)(x−qy)⋯(x−q^{d−1}y)/(q;q)_d` and state λ^d((x−y)/(q−1)) = γ̃^d_q(x−y) and q-∂_xγ̃^d_q(x−y) = `γ̃^{d−1}_q(x−y).` With the q-Pochhammer symbol (q;q)_d = `∏_{k=1}^d(1−q^k)` of QH (Appendix B, p.77), (q−1)^dγ̃^d_q(x−y) = `(−1)^dδ^{(d)}_q(x,y),` so the first identity holds up to the sign (−1)^d (already at d = 1: λ¹ = (x−y)/(q−1) and γ̃¹ = (x−y)/(1−q)), and the q-derivative identity holds for `δ^{(d)}` with ∇_q rather than for γ̃^d. The generated ideals, hence the lemma and its use in Lemma 6.13, are unaffected; RefinedTraceMethods §6.10 supplies the diagonal construction with `δ^{(d)}.`
- KU Remark 3.10 (p.27) indicates, without proof, that the perfectoid resolution may replace the polynomial resolution of Proposition 3.11; the full framed supplier contract of RefinedTraceMethods §6.10 includes this resolution comparison because the trace input at 2 uses the perfectoid cover. It is required to identify its framed theorem with the pair of §1.2.

## References

Locators use the printed pagination of the following fixed public versions. Numbered paragraphs share the statement counter in the Wagner papers.

- **QH:** Ferdinand Wagner, [q-Hodge complexes over the Habiro ring](https://arxiv.org/pdf/2510.04782v2), arXiv:2510.04782v2. Used: §1.3, pp.9–10; Convention 3.1 to Corollary 3.13, pp.20–27; §4.1, pp.53–56; §4.2, pp.61–67.
- **KU:** Ferdinand Wagner, [q-de Rham cohomology and topological Hochschild homology over ku](https://arxiv.org/pdf/2510.06057v1), arXiv:2510.06057v1. Used: Theorems 1.2, 1.4, 1.14 and Corollary 1.15 with Paragraphs 1.9–1.11, pp.3–8; Assumptions 3.1–3.2 and Remark 3.10 to Proposition 3.11, pp.24–27; §§4.1–4.4, pp.39–51; 5.43 and Theorem 5.63, pp.70, 79–80; §6, pp.81–86; Lemma A.1, p.87.
- **TC:** Samuel Meyer and Ferdinand Wagner, [q-Hodge complexes and refined TC⁻](https://arxiv.org/pdf/2410.23115v4), arXiv:2410.23115v4. Used: Paragraphs 3.3–3.6, Lemma 3.7 and Corollary 3.8, pp.30–32.
- **GSWZ:** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler and Don Zagier, [The Habiro ring of a number field](https://arxiv.org/pdf/2412.04241v2), arXiv:2412.04241v2. Used: §1.4, Definition 1.1 with (12)–(15), footnote 1 and Remark 1.2, pp.6–7.
- **Bu:** Robert Burklund, [Multiplicative structures on Moore spectra](https://arxiv.org/pdf/2203.14787v2), arXiv:2203.14787v2. Used: Theorems 1.1, 1.4 (with footnote 4) and 1.5, pp.1–2; Remarks 5.5 and 5.7, p.12.
- **BS:** Bhargav Bhatt and Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), arXiv:1905.08229v4. Used: Theorem 15.3, pp.103–104; Proposition 15.7, p.105, as supplied by the prismatic roadmaps.
- **BMS2:** Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), arXiv:1802.03261v2. Used: Theorem 1.12, pp.6–7, as supplied by AInfCohomology §AI.7.2 and PrismaticCohomologyPartIII §7.0.
- **HA:** Jacob Lurie, [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), September 2017 version, Theorem 7.5.0.6, p.1374, as supplied by RefinedTraceMethods §6.14.
