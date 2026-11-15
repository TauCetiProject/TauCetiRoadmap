# Roadmap: refined trace methods, part II — K-theory of curve singularities, truncated polynomials and finite chain rings

**Summary.** This roadmap turns the trace machinery of RefinedTraceMethods into closed formulas for the algebraic K-theory of the standard singular and finite rings. RefinedTraceMethods stops at the general theory (THH and TC of ring spectra, the cyclotomic trace, the Dundas–Goodwillie–McCarthy theorem, truncating excision and continuity) and at the low-degree symbol calculations of its §4.19; it computes no K-group of a singular curve, of a truncated polynomial algebra in all degrees or of a finite chain ring. This roadmap builds the Nikolaus–Scholze calculus of pointed-monoid algebras: the cyclotomic splitting `THH(k(Π)) ≃ THH(k) ⊗ Σ^∞B^cy(Π)` with its unstable Frobenius, the circle-cell Tate calculus over perfect and perfectoid coefficients, and the passage from K to TC through normalization squares. It then proves the end theorems. Over a regular noetherian 𝔽_p-algebra k, `K_q(k[x,y]/(xy),(x,y))` is a sum of p-typical de Rham–Witt groups of k (Hesselholt). The relative K-groups of the coordinate axes in affine d-space are computed over every perfect field of positive characteristic, including p = 2, and over every ind-smooth ℚ-algebra (Speirs). For the planar cusps `y^a = x^b` over perfect 𝔽_p-algebras, the even relative K-groups are `W_S(k)/(V_aW_{S/a}(k) + V_bW_{S/b}(k))` and the odd ones vanish (Hesselholt–Nikolaus). For every perfectoid ring R, `K_{2r−1}(R[x]/x^e,(x);ℤ_p) ≅ W_{re}(R)/V_eW_r(R)` and the even groups vanish (Riggenbach). Finally, for every finite chain ring `O_K/ϖ^n` it gives the structure of the p-adic K-groups, Angeltveit's order quotient, the even vanishing theorem and the bound on v₁-nilpotence (Antieau–Krause–Nikolaus), with the relative and filtered prismatic cohomology over δ-rings that these need.

## Scope and ownership

This roadmap owns the following.

- The cyclotomic splitting of THH of pointed-monoid algebras in the Nikolaus–Scholze framework, with its unstable Frobenius, and the rational Hochschild analogue (Layer 2).
- The weight decompositions and circle-equivariant cell types of the cyclic bar constructions of the coordinate-axes monoids and of the cusp inclusion `⟨t^a,t^b⟩ ⊂ ⟨t⟩` (Layer 2).
- The circle-cell Tate calculus: the Tate comparison for finite C_p-complexes, the Frobenius on fixed-point cells, the circle-orbit identity, the homotopy of `THH(R;ℤ_p)^{hC_{p^v}}` and `THH(R;ℤ_p)^{tC_{p^v}}` for perfectoid R with their canonical, Frobenius and Verschiebung maps, and the staircase lemma that evaluates the Nikolaus–Scholze equalizer on such pieces (Layer 3).
- Birelative K-theory and TC of normalization squares, the conductor squares of numerical-semigroup rings, and the comparison of relative with birelative K-theory (Layer 4).
- The calculations for the coordinate axes (Layer 5), the planar cusps (Layer 6), the truncated polynomial algebras over perfectoid rings (Layer 7) and finite chain rings (Layer 9).
- Prismatic and syntomic cohomology relative to a δ-ring, its filtered variant and crystalline degeneration, as far as Layer 9 uses them (Layer 8). No prismatic roadmap plans prismatic cohomology relative to δ-rings or of filtered rings.
- The arithmetic of the indexing data: the cusp counting function and its truncation sets, Sylvester's count, cyclic-word counts, the axes and cusp index functions, and the finite-chain-ring exponents (Layer 1).

The following are imported, not planned again.

- THH of E₁-rings with its Frobenius, symmetric monoidality, TC and its fibre formula, spherical monoid rings with the unstable Frobenius of an unpointed E₁-monoid, parametrized Tate constructions and dualizing spectra, representation-graded TR, relative K and TC with `K^inv`, the Dundas–Goodwillie–McCarthy theorem, henselian rigidity, Goodwillie's rational theorem, truncating excision with the Land–Tamme correction and the KABI consequence, and continuity: RefinedTraceMethods §§1.4, 1.9, 2.3–2.4, 2.6, 2.8–2.10, 2.13, 4.12, 4.17–4.18.
- Pointed-monoid THH in the classical genuine model and the cell types of `B^cy(Π_e)`, λ-graded TR of regular noetherian 𝔽_p-algebras and the truncated-polynomial K-groups over regular noetherian 𝔽_p-algebras and perfect fields: KTheoryFiniteLocalFields §§5.16, 5.17; the power-series groups `𝕎_N(k)` these are written in are its Conventions. The truncated-polynomial theorem over perfect fields is a Check of Layer 7 here, not a target. K-theory of finite fields, Gabber rigidity and TC of perfect fields come from KTheoryFiniteLocalFields §§1.1–1.6, 2.1 and 5.1.
- Truncation sets, big Witt rings, F, V and Teichmüller maps, the big Witt power-series comparison and the comparison with p-typical Witt vectors: QWittVectors §§1.1–1.5 (the power-series comparison is §1.4a). p-typical de Rham–Witt complexes: CrystallineCohomology CR.4.
- Vanishing of NK and of negative K-groups for regular noetherian rings: SchemeKTheoryOperations §5.2. Relative K-theory as a fibre: GeneralAlgebraicKTheory §8.1.
- Filtered derived categories, their completion, the Rees description and completed Day convolution: DerivedDeRhamCohomology §§1.14–1.17. Symmetric monoidal ∞-categories, E∞-algebras and their modules, and limits of presentable ∞-categories: EnhancedDerivedSheaves §§E5:abstract.1–E5:abstract.2 and §E5:presentability.2. Milnor sequences of towers of spectra, the homotopy of p-completions and p-complete spectra: StableHomotopyKTheory §§7.9, 7.11, 7.14–7.15 and 7.17.
- δ-rings, prisms, Breuil–Kisin prisms and prismatic envelopes: PrismaticCohomology §§0.55–0.56, 0.73–0.76, 0.93 and 2.13. Nygaard filtrations, Breuil–Kisin twists, the ideals `I_r` of transversal prisms, Nygaard completion, the Cartier–Witt stack, prismatic crystals and absolute prismatic and Hodge–Tate cohomology: PrismaticCohomologyPartII §§3.6, 3.9–3.10, 3.20 and Layer 4. Syntomic complexes, their values in weights 0 and 1 and on smooth algebras over perfect fields, and the motivic filtration on TC: PrismaticCohomologyPartIII §§6.8–6.9, 6.16, 6.24, 6.31 and 7.0. Perfectoid rings, `A_inf`, Bökstedt periodicity for perfectoid rings and the perfectoid trace coefficients: AInfCohomology AI.0 and §AI.7.2.

What is left out:

- The algorithmic content of the finite-chain-ring calculation (akn24 §7 and its tables), whose values enter only as Checks.
- The chromatic purity theorem, owned by GeneralAlgebraicKTheoryPartII (its target "The chromatic purity theorem", in the layer on trace comparison, CMNN vanishing and purity). At height one it gives `L_{T(1)}K(ℤ/p^n) = L_{T(1)}K(0) = 0` because ℤ/p^n is T(0)- and T(1)-acyclic. This roadmap does not state `L_{T(1)}K(ℤ/p^n) = 0`. Its §9.6 is the nilpotence of v₁ on the motivic associated graded `⊕_i 𝔽_p(i)(R)` only; akn24 Corollary 6.4 (line 2356) passes from there to the spectrum, using in addition the finiteness of the motivic filtration on each `π_rTC(ℤ/p^n;𝔽_p)` and the identification of `L_{T(1)}K` with `L_{T(1)}TC`.
- K-theory of `O_K` and of local fields, owned by KTheoryFiniteLocalFields Layer 6.
- Hahn–Levy–Senger's mod (p, v₁) calculation.
- The F-smooth extension of the truncated-polynomial theorem (riggenbach-trunc Theorem 1.2), which needs the Nygaard-dimension theory of F-smooth rings, and the cusp calculation over fields of characteristic zero (recalled at hesselholt-cusp-polytopes line 198 through the cyclic homology of the cusp). This roadmap stops at perfectoid coefficients for truncated polynomials and at perfect 𝔽_p-algebras for cusps.
- Prismatic cohomology relative to animated δ-rings. Descent for relative syntomic complexes along maps of pairs whose base map A → B is not flat needs it, because the derived Čech nerve of such a base map is not a diagram of δ-rings; akn-delta (lines 165–170) announces this extension without constructing it. Layer 8 proves descent along flat base maps, which is the case Layer 9 uses.
- The p-completed lax comparison: for bounded-below T with C_p-action and finite pointed C_p-CW Z, the lax structure map `T^{tC_p} ⊗ (Σ^∞Z)^{tC_p} → (T ⊗ Σ^∞Z)^{tC_p}` is an equivalence after p-completion of its source (speirs-axes Lemma 15, line 506, states it without the completion, which is needed). Its proof needs the Segal equivalence `𝕊^{tC_p} ≃ 𝕊^∧_p`, which StableHomotopyKTheoryPartII §2.7 owns. No layer here uses either: §3.6 factors the Frobenius through the fixed-point comparison of §3.1, which holds for every T.
- The filtered and graded Hodge–Tate comparison of akn-delta Proposition 10.37, a statement about the Hodge–Tate locus of the filtered relative Cartier–Witt stack. No layer here uses it: Layer 9 uses the base-change, envelope and degeneration statements of §8.5 and §8.6.

## Conventions

Rings are commutative and unital unless they are E₁-ring spectra. K is connective algebraic K-theory and IK the nonconnective theory, as in RefinedTraceMethods; `K^inv = fib(IK → TC)`. For a ring map f : A → B and a common ideal I, `K(A,I) = fib(IK(A) → IK(A/I))` and the birelative term `K(A,B,I)` is the total fibre of the square `IK(A) → IK(A/I)` over `IK(B) → IK(B/I)`; similarly for THH, TC, HH and HC. For a prime p, `F(−;ℤ_p)` is the p-completion of a spectrum-valued invariant F.

Homological grading is used for spectra and mixed complexes. `TC^-(X) = X^{hT}`, `TP(X) = X^{tT}` and `can` is the canonical map. The circle norm is `ΣX_{hT} → X^{hT}`. In a residual action, T/C_m is identified with T by `z ↦ z^m`. `C(i)` is the complex T-representation on which `z` acts by `z^i`, and `λ_d = C(1) ⊕ ⋯ ⊕ C(d)`, with `λ_0 = 0`.

A pointed monoid is a monoid Π with an absorbing element 0, that is a `MonoidWithZero` of Mathlib. Its pointed monoid algebra is `k(Π) = k[Π]/k·[0]`. The reduced cyclic bar construction `B^cy(Π)` is the realization of the pointed cyclic set `[n] ↦ Π^{∧(n+1)}`. For an unpointed monoid M, `M_+ = M ⊔ {0}` is pointed and `k(M_+) = k[M]`.

Big Witt vectors use QWittVectors' coordinate model on a truncation set S. `W_S(R)` has F_n, V_n and Teichmüller maps. `W_N(R)` means `W_{{1,…,N}}(R)`, with `W_0(R) = 0`. The power-series comparison `γ_N(a) = ∏ (1 − a_d t^d)^{−1}` of QWittVectors §1.4a fixes signs: `γ_1(a) = 1 + at`. Mathlib's `WittVector p R` and `TruncatedWittVector p n R` are the p-typical carriers; `W_s(R)` denotes the p-typical Witt vectors of length s, with `W_0 = 0`. For a positive integer d prime to p and a truncation set S, put `s_S(d) = #{j ≥ 0 : dp^j ∈ S}`. For S = {1,…,m} this is the unique s ≥ 1 with `p^{s−1}d ≤ m < p^s d`, written `s(m,d)`, when d ≤ m. `J_p` is the set of positive integers prime to p.

Prismatic conventions follow PrismaticCohomologyPartII and PrismaticCohomologyPartIII. `Δ_R{i}` is the Breuil–Kisin twisted absolute prismatic cohomology, `N^{≥i}Δ̂_R{i}` its Nygaard filtration, and `ℤ_p(i)(R) = fib(can − φ_i : N^{≥i}Δ̂_R{i} → Δ̂_R{i})`. Cohomological degrees are written `H^j`, with `H^j(C) = π_{−j}(C)`. For a δ-ring A and an A-algebra R, `Δ_{R/A}` is the prismatic package of Layer 8.

A finite chain ring is `R = O_K/ϖ^n` with K/ℚ_p finite, `e = v_K(p)`, residue field `𝔽_q` with q = p^f, and n ≥ 1. Put `j = ⌈n/e⌉`, the least integer with `p^jR = 0`, so that the additive group of R has exponent `p^j`, and `[j]_p = 1 + p + ⋯ + p^{j−1}`. The class `v₁ ∈ H⁰(𝔽_p(p−1)(ℤ_p))` is akn24's; for p odd it is the image of the Adams class.

**Pinned witnesses.**

- *Witt sign.* Over ℤ, `τ(1) + τ(1) = (2,−1)` in `W_{{1,2}}(ℤ)`, and `γ_2(2,−1) = 1 + 2t + 3t² mod t³`. A componentwise sum would give `1 + 2t + 4t²`.
- *Verschiebung.* `V_1` is the identity, so the quotient `W_{re}(R)/V_eW_r(R)` vanishes at e = 1. For k = 𝔽_2, `W_{{1,2}}(𝔽_2) ≅ W_2(𝔽_2) = ℤ/4` and `V_2W_1(𝔽_2) = 2ℤ/4`, so `W_2(𝔽_2)/V_2W_1(𝔽_2) = ℤ/2`. This is the order of the principal units `1 + x𝔽_2[x]/x²`.
- *Tate grading.* For trivial C_p acting on Hℤ, `π_{2r}((Hℤ)^{tC_p}) = ℤ/p` and the odd groups vanish (RefinedTraceMethods §2.13 Examples).
- *Circle cells.* `(X ⊗ (T/C_m)_+)^{hT} ≃ Σ X^{hC_m}`. For X = Hℤ with trivial action and m = 1 this is `ΣHℤ`, with π₁ = ℤ. An unshifted formula would put ℤ in degree 0.
- *Syntomic degrees.* `ℤ_p(1)` is the derived p-completion of `G_m[−1]` (akn-delta line 118, where it is written as the p-adic Tate module of `G_m`), so for a local ring R with finite unit group `H¹(ℤ_p(1)(R))` is the p-primary part of `R^×`. For R = ℤ/4 this is `(ℤ/4)^× = ℤ/2 = K_1(ℤ/4;ℤ_2)`, in cohomological degree 1, not 0.

## Exact supplier contracts

### From Mathlib

- `MonoidWithZero` (Mathlib/Algebra/GroupWithZero/Defs.lean) is the pointed-monoid carrier. `MonoidAlgebra` (Mathlib/Algebra/MonoidAlgebra/Defs.lean) is the unpointed algebra; Mathlib has no contracted (pointed) monoid algebra, so Layer 2 defines it as a quotient.
- `WittVector`, `TruncatedWittVector` (Mathlib/RingTheory/WittVector/Defs.lean, Truncated.lean), `WittVector.verschiebung`, `WittVector.frobenius` and `WittVector.teichmuller` are the p-typical carriers and operations.
- `Nat.divisors` and `ArithmeticFunction.moebius` with `ArithmeticFunction.moebius_mul_coe_zeta` (Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean) are used for the cyclic-word counts; `finRotate` (Mathlib/Logic/Equiv/Fin/Rotate.lean) is the cyclic successor on `Fin m`, and `Set.ncard` and `Finset.card` the cardinalities of Layer 1.
- `frobeniusNumber_pair` (Mathlib/NumberTheory/FrobeniusNumber.lean): for coprime m, n > 1 the largest natural number outside the additive submonoid generated by m and n is `m*n − m − n`. It fixes the conductor of the cusp (§§1.1, 4.2).
- `KaehlerDifferential` and exterior powers supply absolute Kähler forms `Ω^j_{k/ℚ}`.
- `Polynomial`, `PowerSeries`, `Ideal.Quotient` and `MvPolynomial` supply the coordinate rings `k[x]/x^e`, `k[x_1,…,x_d]/(x_ix_j)_{i≠j}` and `k[x,y]/(y^a − x^b)`.

Mathlib and Tau Ceti have no big Witt vectors, cyclic bar constructions, THH, TC, higher or relative algebraic K-groups, cyclic homology, mixed complexes or syntomic complexes at the pins. Tau Ceti has Grothendieck groups (`TauCeti/CategoryTheory/GrothendieckGroup`) and the Hochschild and cyclic cohomology of cochains (`TauCeti/RingTheory/HochschildCohomology`, `TauCeti/RingTheory/CyclicCohomology`); the theorems here need the relative groups `K_q(A,I)` in all degrees and the homology theories HH and HC with their circle action, which those do not give. Mathlib/RingTheory/Perfectoid has Fontaine's θ and untilts; Tau Ceti has the predicate `TauCeti.Perfectoid.IsIntegralPerfectoid p A` (TauCeti/RingTheory/Perfectoid/Integral.lean), the integral perfectoid rings of Bhatt–Morrow–Scholze, which are the perfectoid rings of Layers 3 and 7, but no big Witt vectors or K-theory.

### From Tau Ceti

- `TauCeti.NodeAlgebra R 0`, the quotient `MvPolynomial (Fin 2) R ⧸ Ideal.span {X 0 * X 1 − C 0}` with `TauCeti.NodeAlgebra.coord`, `TauCeti.NodeAlgebra.coord_zero_mul_coord_one` and `TauCeti.NodeAlgebra.lift` (TauCeti/RingTheory/Node/Basic.lean), is the coordinate ring of the axes in the plane for d = 2.

### From TauCetiRoadmap.BordismFormalGroups

- §F6.5: the Borel category `Sp^{BG}` of a finite group G with homotopy orbits, homotopy fixed points, the norm and the Tate cofibre; the projection formula and the vanishing of `(−)^{tG}` on the tensor ideal generated by induced objects; and the lax symmetric monoidal structure of `(−)^{tG}`, with `can : (−)^{hG} → (−)^{tG}` lax symmetric monoidal and the universal property of `(−)^{tG}` among exact functors under `(−)^{hG}` that vanish on that ideal. Layer 3 uses them for G = C_p.

### From TauCetiRoadmap.RefinedTraceMethods

- §§1.2–1.3: mixed complexes, the Connes operator and the coherent derived mixed category.
- §§1.4 and 1.9: cyclic, negative cyclic and periodic cyclic homology, and the smooth HKR comparison.
- §2.1: spectra with an action of a topological group and the adjunctions between them.
- §2.3: convergence of `(−)^{hG}`, `(−)_{hG}` and `(−)^{tG}` along Postnikov towers for finite G, the vanishing of `Y^{tC_p}` when p acts invertibly on `π_*Y`, and, for bounded-below X, p-completeness of `X^{tC_p}` with `X^{tC_p} ≃ (X^∧_p)^{tC_p}`.
- §2.4: the parametrized Tate construction of a Kan complex and its dualizing spectrum (NS Theorem I.4.1), with `D_{BT} = Σ𝕊` and `D_{BC_m} = 𝕊`.
- §2.5: cyclic realization and edgewise subdivision.
- §2.6: THH of E₁-rings and its Frobenius `φ_p`, and THH relative to an E∞-ring.
- §2.8: the symmetric monoidal structure of cyclotomic spectra and of THH, with Frobenius on a tensor product given through the lax structure of `−^{tC_p}`.
- §2.9: the Nikolaus–Scholze fibre formula `TC(X) ≃ fib(φ − can : TC^-(X) → TP(X)^∧)` for bounded-below X.
- §2.10: THH of spherical monoid rings `𝕊[M]` of E₁-monoids M with the unstable Frobenius `ψ_p : B^cyM → (B^cyM)^{hC_p}`.
- §2.13: genuine F-genuine T-spectra, representation spheres and representation-graded `TR^n_{q−λ}` with R, F, V; for a commutative ring A, `TR(A;p)` with `π_0TR(A;p) ≅ W(A)` compatibly with F, and genuine TC as the equalizer of id and F on `TR(A;p)`.
- §2.16: restriction pullbacks and the comparison of genuine with Nikolaus–Scholze TC.
- §4.12: relative K, relative TC and `K^inv`.
- §4.17: the Dundas–Goodwillie–McCarthy theorem, henselian rigidity with finite coefficients and Goodwillie's rational theorem.
- §4.18: `K^inv` is truncating; nil-invariance and excision of truncating invariants, with the rational (KABI) consequence for `KQinf` and HC; continuity modulo p.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

- §§1.1–1.6: `K_{2i−1}(𝔽_q) ≅ ℤ/(q^i − 1)`, `K_{2i}(𝔽_q) = 0` for i ≥ 1, with coefficients.
- §2.1: Gabber rigidity for henselian pairs with invertible finite coefficients.
- §4.0: the ordinary cyclic bar and the genuine cyclotomic foundations.
- §4.4: the norm, homotopy orbits and the comparison of the genuine with the modern cyclotomic model.
- §5.1: `π_*TC^-(k)`, `π_*TP(k)`, can and φ for perfect fields, and TC of perfect fields.
- §5.16: the classical pointed-monoid THH equivalence and the cofibre sequences for the weight pieces of `B^cy(Π_e)`.
- Conventions: the series groups `𝕎_N(k)` of truncated power series with constant term 1 modulo `t^{N+1}` and `𝕎(k)` of such formal series, with the substitution Verschiebung `V_n` induced by `t ↦ t^n` and the Teichmüller class `(1 − at)^{−1}`; QWittVectors §1.4a identifies them with the coordinate groups `W_N(k)` and `W(k)`.
- §5.17: `TR^n_{q−λ}(A;p) ≃ ⊕_{r=1}^{n} ⊕_{ℓ_{n−r} ≤ m < ℓ_{n−1−r}} W_rΩ^{q−2m}_A` for regular noetherian 𝔽_p-algebras A, and the truncated-polynomial K-groups over perfect fields.

### From TauCetiRoadmap.QWittVectors

- §§1.1–1.5: `BigWitt.TruncationSet`, `S/n`, the big Witt ring `W_S(R)`, F_n, V_n, τ with `F_nV_n = n` and `x·V_n(y) = V_n(F_n(x)·y)`, the power-series comparison of §1.4a, and the comparison with p-typical Witt vectors on the p-power truncation sets `Div(p^a)` of §1.5.
- What QWittVectors must provide (gap:bigwitt-ptypical-decomposition): for a prime p, a `ℤ_(p)`-algebra R and a truncation set S, the natural ring isomorphism `W_S(R) ≅ ∏_{d ∈ S ∩ J_p} W_{s_S(d)}(R)` that commutes with restriction, carries `V_n` and `F_n` for n prime to p to the evident reindexings up to the unit n, and carries V_p and F_p to the p-typical V and F (the decomposition used at hesselholt-axes line 36 and hn-cusp line 43). Layers 6 and 7 use it to pass from p-typical answers to the big Witt forms of their statements.

### From TauCetiRoadmap.CrystallineCohomology

- CR.2: crystalline cohomology, the PD Poincaré lemma and its computation by divided-power de Rham complexes of embeddings.
- CR.4: p-typical de Rham–Witt complexes `W_sΩ^*_k` with R, F, V, d, for every 𝔽_p-algebra k.

### From TauCetiRoadmap.DerivedDeRhamCohomology

- §§1.14–1.17: the filtered derived category `DF(A)` with `gr^i F = cofib(F^{i+1} → F^i)`, completion of filtered objects (which leaves every `gr^i` unchanged and kills constant filtrations), the Rees equivalence of filtered objects with graded `A[t]`-modules (t = 1 gives the underlying object, derived t = 0 the associated graded), and the completed Day-convolution tensor product, whose unit is the step filtration of A. Applied in each grading, they give the complete filtered graded objects of Layer 8 and the Rees algebras of §8.5.
- Layer 2: ordinary and derived de Rham cohomology with its Hodge filtration.
- Layer 5: the cotangent complex, Tor-amplitude conditions and the quasisyntomic sites.

### From TauCetiRoadmap.GeneralAlgebraicKTheory

- §8.1: relative K as a homotopy fibre with its long exact sequence. §10.5: the Fundamental Theorem with Nil terms.

### From TauCetiRoadmap.SchemeKTheoryOperations

- §5.2: for every regular noetherian X, `NK_n(X) = 0` for every integer n and `K_n(X) = 0` for every n < 0.
- What SchemeKTheoryOperations must provide (gap:perfect-homotopy-invariance): for every perfect 𝔽_p-algebra A, the map `IK(A) → IK(A[T])` is an equivalence (amm-perfectoid Proposition 5.1, which proves `K ≃ KH` for smooth algebras over perfect 𝔽_p-algebras through cdh descent for perfect schemes). Layer 6 uses it, and only it, to identify birelative with relative K-theory of cusps over a perfect 𝔽_p-algebra that is not regular noetherian.

### From TauCetiRoadmap.AInfCohomology

- AI.0: perfectoid rings, `A_inf(R)`, θ and its principal kernel `(d)`, with `d̃ = φ(d)` and `d̃_k = φ(d)φ²(d)⋯φ^k(d)`.
- §AI.7.2: THH of connective E∞-rings with circle Tate constructions and `(X^{tT})^∧_p ≃ (X^{tC_p})^{h(T/C_p)}` for bounded-below X; Bökstedt periodicity `π_*THH(R;ℤ_p) = R[u]` for perfectoid R; the perfectoid trace coefficients `π_*TC^-(R;ℤ_p) = A_inf(R)[u,v]/(uv − d)`, `π_*TP(R;ℤ_p) = A_inf(R)[σ^{±1}]` with can and φ (BMS2 Theorem 6.1 and Propositions 6.2–6.4); quasisyntomic unfolding.

### From TauCetiRoadmap.PrismaticCohomology

- §§0.55–0.56: free δ-rings, limits, colimits and Witt vectors of δ-rings. §§0.73–0.76: prisms, bounded, oriented, crystalline and Breuil–Kisin prisms. §0.93: prismatic envelopes over orientable prisms. §§1.2–1.4: the relative prismatic site and relative prismatic cohomology. §§2.1–2.13: derived prismatic cohomology, ending with the prismatic cohomology of a regular quotient as the prismatic envelope (§2.13).

### From TauCetiRoadmap.PrismaticCohomologyPartII

- §3.6: transversal prisms and the ideals `I_r`. §§3.9–3.10: Breuil–Kisin twists and the divided Frobenius. §3.19: comparison of the Nygaard filtration with the Hodge filtration of derived de Rham cohomology. §3.20: Nygaard completion. §3.24: the Nygaard filtration in de Rham coordinates. Layer 4: WCart, its points and fibre products, quasi-coherent complexes and prismatic crystals (§§4.4–4.10), relative prismatic complexes (§4.17), absolute prismatic cohomology (§§4.18–4.19), the diffracted Hodge complex (§4.22), the crystalline comparison in characteristic p (§4.23), the absolute Nygaard filtration (§§4.25, 4.29) and the absolute Frobenius (§4.31).

### From TauCetiRoadmap.PrismaticCohomologyPartIII

- §§6.8–6.9: syntomic complexes `ℤ_p(i)` of quasisyntomic and of animated rings. §6.16: for a smooth algebra A over a perfect field, `ℤ_p(i)` is the logarithmic de Rham–Witt sheaf `WΩ^i_log[−i]` on the pro-étale site of Spec A. §6.24: `ℤ_p(i) = 0` for i < 0, `ℤ_p(0)(R) ≃ RΓ_ét(Spec R;ℤ_p)` for p-complete R, and `ℤ_p(1)(R) ≃ RΓ_ét(Spec R;G_m)^∧[−1]` for quasisyntomic R. §6.31: connectivity, rigidity and left Kan extension. §7.0: the motivic filtration with `gr^iTC(R;ℤ_p) ≃ ℤ_p(i)(R)[2i]`, and `gr^iTC^-`, `gr^iTP`.

### From TauCetiRoadmap.StableHomotopyKTheory

- §7.9: the Milnor sequence `0 → lim¹_r π_{k+1}X_r → π_k holim_r X_r → lim_r π_kX_r → 0` of a tower of spectra, with lim¹ = 0 for a Mittag-Leffler tower. §7.11: for a spectrum E, `π_n(E^∧_p)` maps onto `lim_r π_n(E/p^r)`, which is an extension of the Tate module `T_pπ_{n−1}E` by `lim_r π_nE/p^r`. §§7.14–7.15 and 7.17: p-complete spectra, their closure under fibres, products and limits of countable towers, and the p-completeness of every spectrum each of whose homotopy groups is killed by some power of p.

### From TauCetiRoadmap.EnhancedDerivedSheaves

- §§E5:abstract.1–E5:abstract.2: symmetric monoidal ∞-categories and ∞-operads, E∞-algebras `CAlg(C)` in a symmetric monoidal ∞-category C, and modules over them. §E5:presentability.2: presentable ∞-categories, and the limit of a diagram of presentable ∞-categories along colimit-preserving functors, which is presentable with colimits computed by the projections.

## How to read the build

Layer 1 is elementary arithmetic and Witt bookkeeping, close to Mathlib: it fixes every index function that appears in an answer. Layer 2 splits THH of a pointed-monoid algebra as THH of the coefficients tensored with a cyclic bar construction, and computes the circle-equivariant cell types of the three cyclic bar constructions the calculations need. Layer 3 develops the Tate calculus on circle cells over perfectoid coefficients, ending in the staircase lemma that evaluates the TC equalizer on a tower of cells. Layer 4 forms the birelative terms of the normalization squares of axes and cusps, which excision for `K^inv` (RefinedTraceMethods §4.18) identifies with birelative TC (p-adically) and birelative HC (rationally), and compares relative with birelative K-theory. Layers 5, 6 and 7 assemble the calculations for the coordinate axes, the cusps and the truncated polynomial algebras. Layer 8 builds prismatic cohomology relative to δ-rings and of filtered rings, with crystalline degeneration. Layer 9 applies Layers 1, 7 and 8 to finite chain rings. Layers 5–7 are independent of each other, and Layer 8 depends only on suppliers.

## Layer 1: Indexing arithmetic and Witt bookkeeping

This layer fixes every index function that appears in an answer below and proves its elementary properties. Everything here is statable on Mathlib's `ℕ`, `Finset`, `Nat.divisors`, `ArithmeticFunction.moebius` and the big Witt carrier of QWittVectors.

### 1.1 The cusp counting function and its truncation sets

Define the cusp counting function `cuspCount a b m`, written `ℓ(a,b,m)`: for positive integers a, b and m ≥ 0, it is the number of pairs (i,j) of positive integers with `ai + bj = m`. For r ≥ 0 define the set `cuspTruncationSet a b r`, written `S(a,b,r) = {m ≥ 1 : ℓ(a,b,m) ≤ r}`, and its coprime part `cuspCoprimeSet a b r`, written `T(a,b,r) = {m ∈ S(a,b,r) : a ∤ m and b ∤ m}` (hn-cusp line 20; hesselholt-cusp-polytopes line 384). In the Lean statements both sets are subsets of ℕ and their sizes are `Set.ncard`, which is 0 on an infinite set; the cardinality formulas below therefore also assert finiteness.

- For coprime a, b ≥ 2 and every m ≥ 1, `ℓ(a,b,m+ab) = ℓ(a,b,m) + 1`. If `rab + 1 ≤ m ≤ (r+1)ab`, then ℓ(a,b,m) ∈ {r, r+1}, and ℓ(a,b,m) = r if a | m or b | m (hesselholt-cusp-polytopes Lemma 1.4(1)–(2), line 329).
- If s divides m then ℓ(a,b,s) ≤ ℓ(a,b,m), for all positive a, b. Hence S(a,b,r) is closed under positive divisors and is a truncation set in the sense of QWittVectors §1.1 (hesselholt-cusp-polytopes Lemma 1.4(5)).
- S(a,b,r) ⊆ S(a,b,r+1), and every positive integer lies in S(a,b,r) for r large.
- `ncard_cuspTruncationSet`: for coprime a, b ≥ 2 and r ≥ 0, S(a,b,r) is finite with `#S(a,b,r) = ½(a+1)(b+1) − 1 + rab`, stated without subtraction or halving as `2·#S(a,b,r) + 2 = (a+1)(b+1) + 2rab` (hesselholt-cusp-polytopes Corollary 1.6, line 386).
- For coprime a, b ≥ 2: `#(S(a,b,r)/a) = (r+1)b`, `#(S(a,b,r)/b) = (r+1)a` and `#(S(a,b,r)/ab) = r+1` (hesselholt-cusp-polytopes Corollary 1.6, line 386).
- *Sylvester's count* (`ncard_cuspCoprimeSet`). For coprime a, b ≥ 2 and r ≥ 0, the set T(a,b,r) is a finite truncation set with `2·#T(a,b,r) = (2r+1)(a−1)(b−1)`. When k is a perfect field this is the length over W(k) of the cusp K-group `K_{2r}` of §6.2, because each graded piece of the V-filtration of `W_T(k)` is then the simple W(k)-module k; for k = 𝔽_p × 𝔽_p the length is `2·#T(a,b,r)`, and for a non-noetherian perfect k it is infinite. The proof is inclusion–exclusion on the four cardinalities above (hesselholt-cusp-polytopes Corollary 1.7, line 395; hn-cusp line 37).
- *Conductor.* For coprime a, b ≥ 2 the largest integer that is not a nonnegative combination of a and b is `ab − a − b`, Mathlib's `frobeniusNumber_pair`. Since `ab − a − b + 1 = (a−1)(b−1)`, every m ≥ (a−1)(b−1) is such a combination and (a−1)(b−1) − 1 is not; this is the conductor exponent of the cusp (hesselholt-cusp-polytopes Remark 1.5, line 373).

*Needs:* Mathlib `Finset.card`, `Set.ncard`, `Nat.Coprime`, `frobeniusNumber_pair`; QWittVectors §1.1 (truncation sets).

**Checks.**

- For (a,b,r) = (2,3,0): ℓ vanishes exactly on {1,2,3,4,6}, so S(2,3,0) = {1,2,3,4,6}. Its cardinality is 5 = ½·3·4 − 1, and T(2,3,0) = {1} has 1 = ½·1·1·2 element. Forgetting the positivity of i and j would put 6 = 2·3 + 3·0 outside S.
- For (2,3,1): S(2,3,1) = {1,…,10} ∪ {12}, of cardinality 11 = 5 + 6. Here ℓ(2,3,12) = 1 from (3,2) alone, while ℓ(2,3,11) = 2 from (4,1) and (1,3). T(2,3,1) = {1,5,7} has 3 = ½·3·2 elements.
- For (2,3,2): T(2,3,2) = {1,5,7,11,13}, of cardinality 5. For (2,5,0): S(2,5,0) = {1,2,3,4,5,6,8,10} and T(2,5,0) = {1,3}, of cardinality 2 = ½·1·4.
- Non-example: the set {2,3,4,6} fails divisor closure because it omits 1. A definition of S by "ℓ(a,b,m) < r" would make S(2,3,0) empty and Sylvester's count false at r = 0.

### 1.2 Restriction to the coprime part

For a truncation set S, positive integers n_1, …, n_k and `T = {m ∈ S : n_i ∤ m for all i}`, the set T is a truncation set. For every commutative ring R, the restriction `R^S_T : W_S(R) → W_T(R)` is surjective with kernel `Σ_i V_{n_i}W_{S/n_i}(R)` (hesselholt-cusp-polytopes Corollary 1.7 proof, line 398). Prove it from the coordinate expansion `x = Σ_{d∈S} V_dτ(x_d)` of QWittVectors §1.4: the kernel of restriction consists of the vectors whose coordinates vanish on T, and these are exactly the sums of `V_{n_i}`-images. In particular `W_S(k)/(V_aW_{S/a}(k) + V_bW_{S/b}(k)) ≅ W_{T(a,b,r)}(k)` for S = S(a,b,r), and `W_{re}(R)/V_eW_r(R) ≅ W_{T_{r,e}}(R)` with `T_{r,e} = {m ≤ re : e ∤ m}`.

*Needs:* QWittVectors §§1.3–1.4 (restriction, V_n, τ and the coordinate expansion).

**Checks.**

- For S = {1,2}, n_1 = 2 and R = 𝔽_2: `W_{{1,2}}(𝔽_2) = ℤ/4` (by QWittVectors §1.5), `V_2W_{{1}}(𝔽_2) = {0,2}` and `W_{{1}}(𝔽_2) = 𝔽_2`. The quotient has two elements on both sides.
- For n_1 = 1 the set T is empty, `W_∅ = 0` and `V_1` is the identity, so both sides are zero. A version keeping the index 1 in T would give R instead of 0.
- Over ℤ with S = {1,2,3,4} and n_1 = 2: T = {1,3}. The vector `V_2τ(1)` has coordinates (0,1,0,0) and restricts to 0, while τ(1) restricts to (1,0) ≠ 0. Keeping 2 in T would give the truncation set {1,2,3}, and a quotient with three coordinates instead of #T = 2; over 𝔽_2 that wrong quotient has 8 elements, the right one `W_{{1,3}}(𝔽_2) = 𝔽_2²` has 4.

### 1.3 The p-typical index functions

For a prime p, a truncation set S and d ∈ S ∩ J_p, put `s_S(d) = #{j ≥ 0 : dp^j ∈ S}`. For S = {1,…,m} and d ≤ m this is the unique s ≥ 1 with `p^{s−1}d ≤ m < p^s d`, written s(m,d) (hesselholt-axes line 41). For the cusp, put `s = s(a,b,r,p,m′)`, the unique s ≥ 1 with `ℓ(a,b,p^{s−1}m′) ≤ r < ℓ(a,b,p^s m′)`, or 0 if none exists. Assume p ∤ b, write `a = p^u a′` with p ∤ a′, and put h = s if neither a′ nor b divides m′, h = min{s,u} if a′ but not b divides m′, and h = 0 if b divides m′ (hn-cusp lines 43–57).

- `Σ_{d ∈ S∩J_p} s_S(d) = #S` for every finite truncation set S.
- For the cusp, `h(a,b,r,p,m′) = s_{T(a,b,r)}(m′)` whenever m′ ∈ J_p. Hence `Σ_{m′∈J_p} h(a,b,r,p,m′) = ½(2r+1)(a−1)(b−1)`.

*Needs:* §1.1; Mathlib `Nat.Prime`, `Nat.Coprime`.

**Checks.**

- (a,b,r,p) = (2,3,0,2): u = 1, a′ = 1. For m′ = 1, s = 3 because ℓ vanishes on 1, 2, 4 and ℓ(2,3,8) = 1; since a′ | 1, h = min{3,1} = 1. For m′ = 3, h = 0 because b | 3. For m′ = 5, s = 0 because ℓ(2,3,5) = 1, so h = 0. Total 1 = #T(2,3,0), and `s_{{1}}(1) = 1`.
- (2,3,0,5): u = 0. For m′ = 1, s = 1 since ℓ(2,3,5) = 1, and neither 2 nor 3 divides 1, so h = 1. Every other m′ gives h = 0. Total 1.
- For S = {1,…,4} and p = 2, the indices are d ∈ {1,3} with s_S(1) = 3 and s_S(3) = 1; the sum 4 = #S. Using the convention "s ≥ 0 with p^s d ≤ m" would give s_S(1) = 2 and total 3.

### 1.4 Cyclic words and the axes indices

For d ≥ 1 and s ≥ 1, let `cyc_d(s)` be the number of cyclic words of length s and period s in d letters having no cyclic repetitions: consecutive letters differ, and so do the last and the first (speirs-axes line 17, Definition 8). Let `A_d(m)` count the words of length m with no cyclic repetitions. For d ≥ 2 put `c_{d−1}(m) = Σ_{s | m, s ≡ m mod 2} cyc_d(s)`. For a prime p, r ≥ 0 and m′ ≥ 1, let `t_ev(p,r,m′)` be the unique t ≥ 1 with `p^{t−1}m′ ≤ 2r < p^t m′`, and `t_od(p,r,m′)` the unique t ≥ 1 with `p^{t−1}m′ ≤ 2r+1 < p^t m′`. Each is 0 if no such t exists (speirs-axes line 23).

- `card_noCyclicRepetition`: for every d ≥ 0 and m ≥ 1, the number of maps `w : Fin m → Fin d` with `w(i) ≠ w(i+1)` for every i, indices read cyclically through `finRotate m`, is `A_d(m) = (d−1)^m + (−1)^m(d−1)`, an identity in ℤ (speirs-axes Lemma 33, line 1250, for d ≥ 1; for d = 0 both sides are 0). For m = 1 the condition `w(0) ≠ w(0)` is never met and both sides are 0. For m = 0 the empty word would be counted once while the right side is d, so m ≥ 1 is needed.
- `A_d(m) = Σ_{s|m} s·cyc_d(s)`, hence by Möbius inversion `cyc_d(s) = (1/s)Σ_{j|s} μ(s/j)A_d(j)` (speirs-axes line 1264).
- `cyc_d(1) = 0` and `cyc_d(2) = d(d−1)/2`; for d = 2, cyc_2(s) = 0 unless s = 2.
- `t_od(p,r,m′) = t_ev(p,r,m′)` unless `p^{t−1}m′ = 2r+1` for t = t_od. For m′ = 2r+1 and every p, t_od = 1 and t_ev = 0.

*Needs:* Mathlib `Nat.divisors`, `ArithmeticFunction.moebius`, `ArithmeticFunction.moebius_mul_coe_zeta`, `finRotate`.

**Checks.**

- For d = 3: A_3(2) = 6, A_3(3) = 6, A_3(4) = 18 and A_3(6) = 66. The counts are cyc_3(2) = 3, cyc_3(3) = 2, cyc_3(4) = 3 and cyc_3(6) = (66 − 6 − 6 + 0)/6 = 9 (speirs-axes line 1282).
- For d = 2: A_2(m) is 2 for m even and 0 for m odd, so `cyc_2(2) = 1` and cyc_2(4) = (2 − 2)/4 = 0. A count of words that allowed one cyclic repetition would make cyc_2(4) nonzero.
- `c_1(m)` is 1 for m even and 0 for m odd, and c_2(2) = 3. For (p,r,m′) = (2,1,3): t_od = 1 and t_ev = 0, so the two functions differ.

### 1.5 Finite-chain-ring exponents

For a finite chain ring with invariants (p, e, f, n) put `j = ⌈n/e⌉`, `[j]_p = (p^j − 1)/(p − 1)`, and define the even-vanishing threshold `B(p,e,n) = (p/(p−1))·(p[j]_p − p^j(j − n/e))`, a rational number (akn24 Theorem 5.2, line 2074). For i, n ≥ 1, let `ε(i,j′) = 1` if `⌊j′/n⌋ < ⌈j′/n⌉ ≤ i`, and 0 otherwise (akn24 line 443).

- For 1 ≤ j′ ≤ in − 1, ε(i,j′) = 1 exactly when n ∤ j′. Hence `Σ_{j′=1}^{in−1} ε(i,j′) = i(n−1)` (akn24 lines 448–452).
- `j − n/e ∈ [0, 1)`, so `B(p,e,n) ≤ p²(p^j − 1)/(p−1)²`, the bound of akn24 Remark 5.4 (line 2078).
- For n ≤ e, j = 1 and `B(p,e,n) = p²n/((p−1)e)`.

*Needs:* Mathlib `Nat.ceil`, `Rat`.

**Checks.**

- The additive exponent of R is `p^j`, not j. Since `p = uϖ^e` with u a unit, `p^jR = 0` exactly when ej ≥ n, so `⌈n/e⌉` is the least such j and the additive exponent is `p^j`. For ℤ/4, j = 2 and 2·1 ≠ 0 = 4·1, so the exponent is 4; for 𝔽_2 (n = 1), j = 1 and the exponent is 2. For `ℤ_2[√2]/(√2)³` (e = 2, n = 3), j = 2: `2 = (√2)²` is nonzero while `4 = (√2)⁴` vanishes, so the exponent is 4 = 2^j, whereas the unramified reading j = n would give 8.
- For ℤ/4 (p = 2, e = 1, n = 2): j = 2, [2]_2 = 3 and B = 2·(2·3 − 4·0) = 12. The even vanishing theorem therefore applies from i = 13.
- For 𝔽_2[z]/z³, viewed as `O_K/ϖ³` with e = 3: j = 1 and B = 4·3/3 = 4, so i ≥ 5. As e → ∞ the threshold tends to 0. The weaker bound p²(p^j − 1)/(p − 1)² = 4 does not tend to 0.
- For i = 2 and n = 2, the indices 1 ≤ j′ ≤ 3 not divisible by 2 are {1,3}, so the count is 2 = 2·1. For n = 1 every j′ is divisible by n and the count is 0 = i·0 for every i ≥ 1. This is consistent with the finite field having no p-primary torsion in positive degrees: for i ≥ 2, `|K_{2i−1}(𝔽_q)|/|K_{2i−2}(𝔽_q)| = (q^i − 1)/1` is prime to p, and for i = 1 the group `K_1(𝔽_q) = 𝔽_q^×` has order q − 1, prime to p; the order of `K_0(𝔽_q) = ℤ` is never divided by. For q = 2: i = 2 gives 3/1 = 3, and i = 1 gives `|K_1(𝔽_2)| = 1`.

### Examples

For (a,b) = (2,3) the truncation sets are S(2,3,0) = {1,2,3,4,6} and S(2,3,1) = {1,…,10,12}, with coprime parts {1} and {1,5,7}. For d = 3 the first word counts are cyc_3(2), …, cyc_3(6) = 3, 2, 3, 6, 9. For ℤ/p^n, j = n, the additive group has exponent p^n, and the threshold is p²(p^n − 1)/(p−1)².

### Dependencies

Mathlib arithmetic (`Nat.divisors`, `ArithmeticFunction.moebius`, `Finset`, `frobeniusNumber_pair`) and QWittVectors §§1.1–1.5. No other layer.

## Layer 2: Pointed-monoid algebras and their cyclic bar constructions

### 2.1 Pointed-monoid algebras

Define the pointed-monoid algebra `k(Π)` of a commutative ring k and a pointed monoid Π (a `MonoidWithZero`) as the quotient of `MonoidAlgebra k Π` by the ideal generated by the basis element of 0 (speirs-axes line 286; hn-cusp line 105).

- The images of the nonzero elements of Π form a k-basis of k(Π).
- *Universal property.* k-algebra maps k(Π) → B correspond to maps of monoids with zero from Π to the multiplicative monoid of B.
- k(Π) is functorial in maps of monoids with zero and in ring maps k → k′, with `k′ ⊗_k k(Π) ≅ k′(Π)`.
- `k(Π) ⊗_k k(Π′) ≅ k(Π ∧ Π′)`, where `Π ∧ Π′` is the smash product of pointed monoids.
- For an unpointed monoid M, `k(M_+) ≅ MonoidAlgebra k M`.
- `MonoidAlgebra k Π ≅ k × k(Π)` as k-algebras, because the basis element of 0 is a central idempotent.

*Needs:* Mathlib `MonoidAlgebra`, `MonoidWithZero`, `Ideal.Quotient.mk`.

**Checks.**

- For Π_0 = {0,1}, k(Π_0) = k, while the unquotiented `MonoidAlgebra k Π_0` is k × k of rank 2.
- For `Π_e = {0,1,x,…,x^{e−1}}` with x^e = 0, `k(Π_e) ≅ k[x]/x^e` has rank e. The unquotiented `MonoidAlgebra k Π_e` has rank e + 1, so omitting the quotient fails already at e = 1.
- For `Π_d = {0} ∪ {x_i^n : 1 ≤ i ≤ d, n ≥ 0}` with x_ix_j = 0 for i ≠ j, `k(Π_d) ≅ k[x_1,…,x_d]/(x_ix_j)_{i≠j}`. For d = 2 this is the node `k[x,y]/(xy)` of the supplier contract.
- For the numerical semigroup `⟨t^a,t^b⟩ ⊂ ⟨t⟩`, `k(⟨t^a,t^b⟩_+) ≅ k[t^a,t^b] ≅ k[x,y]/(y^a − x^b)` for coprime a, b (hn-cusp line 89).

### 2.2 The reduced cyclic bar construction and the unstable Frobenius

For a pointed monoid Π, define the pointed cyclic set `B^cy(Π)[n] = Π^{∧(n+1)}`, with the Hochschild face maps, degeneracies inserting 1 and cyclic operator `t_n(π_0∧⋯∧π_n) = π_n∧π_0∧⋯∧π_{n−1}`. Its realization `B^cy(Π)` is a pointed T-space (speirs-axes §3.1, line 206). For every prime p, the unstable Frobenius `ψ_p : B^cy(Π) → B^cy(Π)^{C_p}` is the composite of the simplicial diagonal into the C_p-fixed points of the p-fold edgewise subdivision with the subdivision homeomorphism D_p. It is a T ≅ T/C_p-equivariant homeomorphism onto the genuine fixed points (speirs-axes lines 223–255).

- B^cy(Π) is functorial in maps of monoids with zero, with `B^cy(Π_0) = S⁰` and `B^cy(M_+) = B^cy(M)_+` for an unpointed monoid M.
- *Smash products.* `B^cy(Π ∧ Π′) ≃ B^cy(Π) ∧ B^cy(Π′)` T-equivariantly, compatibly with ψ_p.
- *Weights.* A map `w : Π ∖ {0} → (ℕ,+)` with w(πσ) = w(π) + w(σ) whenever πσ ≠ 0 splits `B^cy(Π) = ⋁_{m≥0} B^cy(Π;m)` as pointed T-spaces, and ψ_p restricts to homeomorphisms `B^cy(Π;m) → B^cy(Π;pm)^{C_p}`. The same holds for a word grading by cyclic words (speirs-axes line 331).
- Composing ψ_p with the map from genuine to homotopy fixed points gives the Borel unstable Frobenius `B^cy(Π) → B^cy(Π)^{hC_p}`. For Π = M_+ it agrees with RefinedTraceMethods §2.10's ψ_p.

*Needs:* RefinedTraceMethods §2.5 (cyclic realization and edgewise subdivision) and §2.10; KTheoryFiniteLocalFields §4.0 (cyclic sets and genuine T-spaces).

**Checks.**

- For Π_0, B^cy(Π_0) = S⁰ with trivial action and ψ_p the identity of S⁰. A definition that forgot the basepoint would give S⁰ ∨ S⁰.
- For Π = ⟨t⟩_+ = {0,1,t,t²,…} the weight-m piece is `(T/C_m)_+` for m ≥ 1 and S⁰ for m = 0 (hn-cusp line 122; speirs-axes line 1160). ψ_p sends weight m to weight pm, not to weight m.
- For Π_2 = {0,1,x}, x² = 0 (e = 2), the weight-1 piece is `(T/C_1)_+` and the weight-2 piece is the cofibre of `(T/C_1)_+ → (T/C_2)_+` (KTheoryFiniteLocalFields §5.16), which is not a point although e | 2.

### 2.3 The cyclotomic splitting

Prove that for every E₁-ring k and every pointed monoid Π, the E₁-ring `k(Π) := k ⊗ Σ^∞Π` satisfies `THH(k(Π)) ≃ THH(k) ⊗ Σ^∞B^cy(Π)` as cyclotomic spectra. For a discrete ring k this E₁-ring is the Eilenberg–Mac Lane spectrum of the pointed-monoid algebra of 2.1. Under the equivalence the Frobenius is the composite of `φ_p ⊗ Σ^∞ψ_p : THH(k) ⊗ Σ^∞B^cy(Π) → THH(k)^{tC_p} ⊗ (Σ^∞B^cy(Π))^{hC_p}`, of `id ⊗ can` and of the lax structure map into `(THH(k) ⊗ Σ^∞B^cy(Π))^{tC_p}` (hn-cusp line 105; speirs-axes Lemma 4, line 272; speirs-trunc lines 319–346). In particular `THH(Σ^∞Π) ≃ Σ^∞B^cy(Π)` with Frobenius Σ^∞ψ_p followed by can.

The route: Σ^∞Π is an E₁-ring because Σ^∞ is symmetric monoidal from pointed spaces. RefinedTraceMethods §2.8 makes THH symmetric monoidal into cyclotomic spectra. The cyclic bar construction of Σ^∞Π is Σ^∞ of B^cy(Π)[−] levelwise, and the Tate diagonal of a suspension spectrum is Σ^∞ of the space-level diagonal (RefinedTraceMethods §2.10).

- Naturality in E₁-maps k → k′ and in maps of pointed monoids.
- Compatibility with weight decompositions: `THH(k(Π)) ≃ ⊕_m THH(k) ⊗ Σ^∞B^cy(Π;m)`, with φ_p carrying weight m into the Tate construction of weight pm.
- For Π = M_+ the equivalence is RefinedTraceMethods §2.10 tensored with THH(k). It agrees on underlying T-spectra with the classical equivalence of KTheoryFiniteLocalFields §5.16 through the genuine–modern comparison of KTheoryFiniteLocalFields §4.4.
- Suppose that THH(k) is bounded below, for instance k connective (in particular a discrete ring), and that the connectivity of B^cy(Π;m) tends to infinity with m. Then X_m = THH(k) ⊗ Σ^∞B^cy(Π;m) has connectivity tending to infinity, so the sum `⊕_m X_m` is also the product, and `(⊕_m X_m)^{tT} ≃ ∏_m X_m^{tT}` (speirs-axes Lemma 21, line 709, for discrete k). Without the bound on THH(k) this fails (Checks).

*Needs:* RefinedTraceMethods §§2.6, 2.8, 2.10; §2.2 here; AInfCohomology §AI.7.2 (circle Tate construction).

**Checks.**

- For Π = Π_0, the statement is the identity `THH(k) ≃ THH(k)`. For k = 𝕊 and Π = ⟨t⟩_+, THH(𝕊[t]) ≃ Σ^∞B^cy(ℕ)_+, whose weight-1 summand is `Σ^∞(T/C_1)_+`. Its π₀ is ℤ, generated by the class of t.
- For k = 𝔽_p and Π = Π_2 in weight 1, `π_*(THH(𝔽_p) ⊗ Σ^∞T_+) = 𝔽_p[u] ⊗ H_*(T_+;𝔽_p)` has dimension one in every degree n ≥ 0. A splitting with the unreduced cyclic bar construction, which treats Π_2 as an unpointed monoid, computes THH of `MonoidAlgebra 𝔽_p Π_2 ≅ 𝔽_p × 𝔽_p[x]/x²` (§2.1) instead, with an extra summand THH(𝔽_p) for the basepoint, which has 𝔽_p in every even degree.
- The Frobenius on weight 1 lands in weight p, so it cannot be the identity on summands. For Π_e with e = p, weight 1 maps to weight p, where e | p and the cofibre term of 2.2 appears.
- Negative control for the convergence statement: let k = `ℚ[β^{±1}]` with |β| = 2, a rational E∞-ring, and Π = Π_2. For odd m = 2j + 1 the weight-m piece is `S^{λ_j} ∧ (T/C_m)_+`, whose underlying space is `Σ^{2j}(T/C_m)_+`, of connectivity 2j − 1. But k is a retract of THH(k), so `π_0X_m ⊇ π_{−2j}THH(k) ⊇ ℚ·β^{−j}` for every j, and on π_0 the map from the sum to the product contains `⊕_j ℚ → ∏_j ℚ`, which misses (1,1,1,…). For k = 𝔽_p the same pieces have `π_0X_m = 0` for j ≥ 1.

### 2.4 The linear and rational splittings

For a commutative ring k and a pointed monoid Π, prove `HH(k(Π)/k) ≃ k ⊗ Σ^∞B^cy(Π)` (the reduced chains `C̃_*(B^cy(Π);k)` with their circle action) and `HH(k(Π)/ℤ) ≃ HH(k/ℤ) ⊗ Σ^∞B^cy(Π)`. Both are equivalences of T-equivariant objects of D(k), resp. D(ℤ), natural in k and Π and compatible with weights (speirs-axes Lemma 29, line 1128). Over ℚ, `HC(k(Π)/ℚ) = (HH(k/ℚ) ⊗ B^cy(Π))_{hT}`.

*Needs:* §2.2 (the T-space `B^cy(Π)`); RefinedTraceMethods §§1.4 and 2.6 (THH relative to an E∞-ring; THH(Hk/Hk′) ≃ HH); KTheoryFiniteLocalFields §4.0.

**Checks.**

- For Π = ⟨t⟩_+ = {0,1,t,t²,…} and k = ℚ, weight m ≥ 1 gives `HH(ℚ[t]/ℚ)_{(m)} = ℚ ⊗ (T/C_m)_+`, with homology ℚ in degrees 0 and 1 (the classes t^m and `t^(m−1) dt`). Connes' operator `B : HH_0 → HH_1` is multiplication by m, hence surjective, so the weight-m part of `HC_*(ℚ[t]/ℚ)` is ℚ·t^m in degree 0 and zero in every degree q ≥ 1; equivalently `(ℚ ⊗ (T/C_m)_+)_{hT} = ℚ_{hC_m} = ℚ` in degree 0. A computation claiming `HC_0 = 0` in weight m contradicts `HC_0(A) = HH_0(A) = A`.
- For k = 𝔽_2 and a word with s odd and i even (speirs-axes Proposition 12), the reduced homology is k/2k = 𝔽_2 in degree m − 1 and k[2] = 𝔽_2 in degree m. Over ℚ both vanish (line 456).
- For Π = M_+ the splitting is the Künneth formula `HH(k[M]/k) = k ⊗ B^cyM_+`.

### 2.5 Cell types: coordinate axes

For d ≥ 2 and the pointed monoid Π_d of 2.1, prove the following (speirs-axes Lemmas 6, 9 and 11 and Proposition 12, lines 334–464).

- *Word decomposition.* `B^cy(Π_d) = ⋁_ω B(ω)` over cyclic words ω in the letters x_1, …, x_d, with B(∅) = S⁰. The birelative term is `THH(A_d,B_d,I_d) ≃ ⊕_ω THH(k) ⊗ B(ω)`, summed over cyclic words of period at least 2, for every ring k.
- *Contractibility.* If ω has period at least 2 and a cyclic repetition, B(ω) is T-equivariantly contractible (speirs-axes Lemma 9(2), line 366). The words of period 1 are the powers `x_j^m` (m ≥ 1), which all have a cyclic repetition; `B(x_j^m)` is the weight-m part of `B^cy(⟨x_j⟩_+)`, hence `B(x_j^m) ≃ (T/C_m)_+`, which is not contractible (speirs-axes line 1160). These are the cells of the line `k[x_j]` and lie in the image of the normalization, which is why the birelative sum omits them.
- *Cell type.* If ω has period s ≥ 2, no cyclic repetition, length m and i = m/s blocks, then: for s even, `ΣB(ω) ≃ S^{λ_{m/2}} ∧ (T/C_i)_+`; for s and i odd, `B(ω) ≃ S^{λ_{(m−1)/2}} ∧ (T/C_i)_+`; for s odd and i even, `B(ω) ≃ S^{λ_{(m−2)/2}} ∧ RP²(i)`, where RP²(i) is the mapping cone of `(T/C_{i/2})_+ → (T/C_i)_+`.
- *Homology.* `H̃_*(B(ω);R)` is concentrated in degrees m − 1 and m. It is R in both degrees when s is even, or s and i are odd, with Connes' operator multiplication by i. When s is odd and i is even it is R/2 in degree m − 1 and R[2] in degree m, with Connes' operator zero.
- *Frobenius.* ψ_p restricts to homeomorphisms `B(ω) → B(ω^{⋆p})^{C_p}`, where `ω^{⋆p}` has length pm and the same period.

*Needs:* §1.4 (cyclic words, period and repetition); §§2.2–2.3; RefinedTraceMethods §2.13 (representation spheres).

**Checks.**

- For d = 2 the only cyclic words without repetition are `(x_1x_2)^i`, with s = 2. Thus `B(ω) ≃ Σ^{−1}S^{λ_i} ∧ (T/C_i)_+`, which recovers hesselholt-axes Proposition 1.2 (line 131).
- For d = 3 and ω = x_1x_2x_3 (m = s = 3, i = 1), `B(ω) ≃ S^{λ_1} ∧ T_+`, with reduced homology in degrees 2 and 3. Connes' operator is multiplication by i = 1.
- The word x_1x_1x_2 (period 3, with the repetition `w_1 = w_2`) has B(ω) contractible and contributes nothing. The word x_1x_1 has period 1: `B(x_1x_1) ≃ (T/C_2)_+` (speirs-axes line 1160) has reduced homology ℤ in degrees 0 and 1, so it is not contractible, and it is excluded from the birelative sum as a cell of `k[x_1]`. A contractibility statement without the period hypothesis would be refuted by it, and a decomposition that kept it would add `THH(k) ⊗ (T/C_2)_+` to the birelative term.

### 2.6 Cell types: truncated polynomials and cusps

For Π_e, import the cofibre sequences `S^{λ_d} ∧ (T/C_{s/e})_+ → S^{λ_d} ∧ (T/C_s)_+ → B^cy(Π_e;s)` with d = ⌊(s−1)/e⌋ from KTheoryFiniteLocalFields §5.16. These are statements about pointed T-spaces and hold in the Borel model used here (riggenbach-trunc Theorem 5.1, line 846). For the cusp put `B_m = B^cy(⟨t⟩,⟨t^a,t^b⟩;m)`, the weight-m part of the cofibre of `B^cy(⟨t^a,t^b⟩_+) → B^cy(⟨t⟩_+)`, and prove the following.

- `B_m ≃ T_+ ∧_{C_m} X(a,b,m)` for a finite pointed C_m-CW complex X(a,b,m), compatibly with the isomorphisms `ρ_s^*(B_m)^{C_s} ≅ B_{m/s}` for s | m (hesselholt-cusp-polytopes Proposition 3.1, line 792). Hence each B_m is a finite pointed T-CW complex.
- *Mixed complex.* For coprime a, b ≥ 2 and m ≥ 1, `ℤ ⊗ Σ^∞B_m` in `D(ℤ)^{BT}` is the total cofibre of the square of `ℤ ⊗ (T/C_{m/c})_+[2ℓ(a,b,m)]` for c ∈ {ab, a, b, 1}, with maps the canonical projections and with `T/C_{m/c}` empty when c ∤ m (hn-cusp Theorem 1, line 131). The input is the mixed complex of `ℤ[x,y]/(y^a − x^b)` (bach-hypersurfaces; larsen-mixed), translated through the formality of `C_*(T;ℤ)`.
- The connectivity of B_m tends to infinity with m, so for every ring k, whose THH is connective, `THH(k) ⊗ Σ^∞B^cy(⟨t⟩,⟨t^a,t^b⟩) ≃ ∏_{m≥1} THH(k) ⊗ Σ^∞B_m` by §2.3 (hn-cusp line 156).
- For p | m, the cofibre of `B_{m/p} →^{ψ_p} (B_m)^{C_p} → B_m` is a finite colimit of free C_p-cells (hn-cusp line 165, from hesselholt-cusp-polytopes §3).

*Needs:* §1.1 (the count ℓ(a,b,m)); §§2.2–2.4; KTheoryFiniteLocalFields §5.16; RefinedTraceMethods §§1.2–1.3 (mixed complexes and the coherent derived mixed category).

**Checks.**

- For (a,b) = (2,3) and m = 1, ℓ = 0 and only c = 1 divides m. Hence `ℤ ⊗ B_1 = ℤ ⊗ T_+`, with homology ℤ in degrees 0 and 1: the classes of t and dt not in the subalgebra.
- For m = 6 = ab, ℓ(2,3,6) = 0 and all four c divide 6. The total cofibre of the square of `(T/C_1)_+ → (T/C_3)_+`, `(T/C_2)_+ → (T/C_6)_+` is contractible, matching t⁶ ∈ k[t²,t³] together with all its cyclic words.
- For e = 1 in the truncated case the first map of each cofibre sequence is an equivalence, so every positive weight vanishes. This matches k[x]/x = k.

### Examples

For k = 𝔽_p and d = 2, the birelative THH is `⊕_{i≥1} Σ^{−1}THH(𝔽_p) ⊗ S^{λ_i} ∧ (T/C_i)_+`. The summand i has bottom cell in degree 2i − 1, so the lowest homotopy group is 𝔽_p in degree 1, from the word x_1x_2. For Π_e with e = p, the THH Connes differential on the divided-power classes has coefficient e/p = 1 and need not vanish, while the Hochschild one does (KTheoryFiniteLocalFields §5.16 Checks).

### Dependencies

Layer 1 for the word counts. Suppliers: RefinedTraceMethods §§1.2–1.4, 2.5–2.6, 2.8, 2.10, 2.13; KTheoryFiniteLocalFields §§4.0, 4.4, 5.16; AInfCohomology §AI.7.2; Mathlib `MonoidAlgebra`, `MonoidWithZero`; Tau Ceti `TauCeti.NodeAlgebra`.

## Layer 3: Circle-cell Tate calculus over perfectoid coefficients

This layer computes `TC^-`, TP and the Frobenius on spectra of the form `THH(R;ℤ_p) ⊗ S^λ ∧ (T/C_m)_+` for a perfectoid ring R. It then proves the staircase lemma, which evaluates the Nikolaus–Scholze equalizer on a tower of such pieces. Perfect 𝔽_p-algebras are the perfectoid rings with p = 0. For them `A_inf(R) = W(R)`, the orientation is d = p, and every formula below specializes to the one in hn-cusp, speirs-trunc and speirs-axes.

### 3.1 Tate constructions of finite C_p-complexes

Prove the following for every spectrum T with C_p-action and every finite pointed C_p-CW complex Z (cells `C_p/H_+ ∧ D^n` with H ∈ {e, C_p}). The fixed-point map `T^{tC_p} ⊗ Σ^∞Z^{C_p} → (T ⊗ Σ^∞Z)^{tC_p}` is an equivalence. It is the exactness equivalence `T^{tC_p} ⊗ Σ^∞Z^{C_p} ≃ (T ⊗ Σ^∞Z^{C_p})^{tC_p}` for the finite complex `Z^{C_p}` with trivial action, followed by the map induced by the inclusion `Z^{C_p} → Z`. That map is an equivalence because the cofibre `Z/Z^{C_p}` is a finite colimit of free cells, on which `(T ⊗ −)^{tC_p}` vanishes (hn-cusp Lemma 2, line 162; speirs-trunc Lemma 8, line 347).

Prove that the fixed-point map is compatible with the lax structure of `(−)^{tC_p}`. It is homotopic to the composite `T^{tC_p} ⊗ Σ^∞Z^{C_p} → T^{tC_p} ⊗ (Σ^∞Z)^{hC_p} → T^{tC_p} ⊗ (Σ^∞Z)^{tC_p} → (T ⊗ Σ^∞Z)^{tC_p}`, whose first map is induced by `Σ^∞Z^{C_p} → (Σ^∞Z)^{hC_p}` (adjoint to the inclusion of `Z^{C_p}` with trivial action), whose second is `id ⊗ can` and whose third is the lax structure map (speirs-trunc Lemma 7, line 304, and the diagram in the proof of Lemma 8, lines 350–376). The route: both maps are natural in T, and their source and target are exact functors of T that vanish on induced objects. Since `Σ^∞Z^{C_p}` is a finite, hence dualizable, spectrum, the universal property of `(−)^{tC_p}` under `(−)^{hC_p}` shows that such a transformation is determined by its restriction along `can ⊗ id : T^{hC_p} ⊗ Σ^∞Z^{C_p} → T^{tC_p} ⊗ Σ^∞Z^{C_p}`. The two restrictions agree because `can` is lax symmetric monoidal. Neither statement uses p-completion or the Segal equivalence `𝕊^{tC_p} ≃ 𝕊^∧_p`.

*Needs:* BordismFormalGroups §F6.5 (exactness of `(−)^{tC_p}`, the projection formula and Tate vanishing on induced objects, the lax symmetric monoidal Tate functor with lax monoidal `can`, the universal property of `(−)^{tC_p}` under `(−)^{hC_p}`).

**Checks.**

- For `Z = C_{p+}` both sides of the fixed-point map vanish. `Z^{C_p}` is the base point, so the source is 0, and `T ⊗ Σ^∞_+C_p` is induced, so its Tate construction is zero.
- For Z = S⁰ with trivial action, the fixed-point map is the identity of `T^{tC_p}`. The lax composite is `T^{tC_p}` tensored with the unit `𝕊 → 𝕊^{hC_p} → 𝕊^{tC_p}` of the lax structure, followed by the product, so by unitality it is also the identity. For T = Hℤ with trivial action, π₀ of both maps is the identity of ℤ/p. No identification of `𝕊^{tC_p}` enters.
- Finiteness of Z is needed. For `Z = S⁰ ∨ EC_{p+}`, with EC_p a free contractible C_p-CW complex, `Z^{C_p} = S⁰`, while `Σ^∞_+EC_p ≃ 𝕊` with trivial action in Borel spectra. So the target is `T^{tC_p} ⊕ T^{tC_p}` and the map is the inclusion of the first summand. For T = Hℤ with trivial action, π₀ of the map is the inclusion `ℤ/p → ℤ/p ⊕ ℤ/p`, not an isomorphism.

### 3.2 The circle-orbit identity

Prove that for every X in `Sp^{BT}` and every m ≥ 1 there are natural equivalences `(X ⊗ (T/C_m)_+)^{hT} ≃ ΣX^{hC_m}`, `(X ⊗ (T/C_m)_+)^{tT} ≃ ΣX^{tC_m}` and `(X ⊗ (T/C_m)_+)_{hT} ≃ X_{hC_m}`. They are compatible with the map induced by `T/C_m → T/C_{m′}` for m | m′, which becomes the transfer `X^{hC_m} → X^{hC_{m′}}`, and with can. This is the circle case of hn-cusp Proposition 3 (line 179), where the adjoint representation of T on the tangent space of T/C_m is trivial of dimension 1. The route uses RefinedTraceMethods §2.4: the fibration `BC_m → BT` has relative dualizing spectrum `S^{−1}`, and `p_!(D ⊗ −) ≃ p_*` on `Sp^{BC_m}`. The Tate statement follows because the fibre of `can` preserves colimits and vanishes on `Σ^∞_+C_m`-induced objects.

*Needs:* RefinedTraceMethods §§2.1, 2.4; AInfCohomology §AI.7.2 (circle Tate construction).

**Checks.**

- For m = 1 and X = Hℤ with trivial action: `(Hℤ ⊗ T_+)^{hT} ≃ ΣHℤ`, with π₁ = ℤ, and the Tate side is 0.
- For X = Hℤ with trivial action and m = p: `π_*((Hℤ ⊗ (T/C_p)_+)^{tT}) = π_{*−1}((Hℤ)^{tC_p})`. This is ℤ/p in every odd degree, following the Tate grading witness of the Conventions.
- The suspension is required: without it the m = 1 homotopy-fixed-point formula would place ℤ in degree 0, which contradicts the free T-action on T_+ (whose homotopy orbits are 𝕊).

### 3.3 Suspension invariance for even E∞-rings

Prove that for every E∞-ring E with `π_{2r+1}E = 0` for all r, and every T-equivariant E-module X (an object of `Fun(BT, Mod_E)`), there is an equivalence of Borel T-spectra `X ⊗ S^V ≃ Σ^{dim_ℝ V}X` for every finite-dimensional complex T-representation V. In particular this holds for every T-equivariant E∞-ring X whose homotopy is concentrated in even degrees, with `E = X^{hT}` (riggenbach-double Proposition 4.2 and Corollary 4.4, lines 296–347). The route classifies E-module local systems on BT with fibre E by maps `BT → BhAut_E(E)`. These are null because `BhAut_E(E)` has homotopy only in odd degrees and BT has cells only in even degrees.

- For a perfectoid ring R, `THH(R;ℤ_p)` is even by Bökstedt periodicity (AInfCohomology §AI.7.2), so every T-equivariant `THH(R;ℤ_p)`-module is suspension invariant. For an 𝔽_p-algebra k, `THH(k)` is a T-equivariant `Hℤ`-module through `Hℤ → Hℤ_p ≃ τ_{≥0}TC(𝔽_p) → THH(𝔽_p) → THH(k)` (hn-cusp line 115; KTheoryFiniteLocalFields §5.1), and Hℤ is even.
- The equivalence is not natural in V: it is a choice, and only its existence is used.

*Needs:* RefinedTraceMethods §2.1; AInfCohomology §AI.7.2 (Bökstedt periodicity for perfectoid rings); KTheoryFiniteLocalFields §5.1 (`τ_{≥0}TC(𝔽_p) ≃ Hℤ_p`); EnhancedDerivedSheaves §E5:abstract.2 (modules over E∞-rings).

**Checks.**

- For E = Hℤ, `BhAut(Hℤ) ≃ B{±1}` is a K(ℤ/2,1), and maps from the simply connected BT to it are null. This confirms the statement in the simplest case.
- Non-example: E = 𝕊 is not even, and `S^{C(1)} ⊗ 𝕊` is not Borel equivalent to `Σ²𝕊` as a T-spectrum. Its homotopy orbits are the Thom spectrum `(CP^∞)^{C(1)}`, which is not `Σ²Σ^∞_+CP^∞`, because the stable Hopf map η acts nontrivially on its bottom cells.
- For V = C(1) and X = Hℤ with trivial action: `(Hℤ ⊗ S^{C(1)})^{hT} ≃ Σ²Hℤ^{hT}`, which has `π_{2−2j} = ℤ` for all j ≥ 0.

### 3.4 The perfectoid coefficient tower

For a perfectoid ring R with orientation `ker θ = (d)`, write `d̃ = φ(d)` and `d̃_n = φ(d)φ²(d)⋯φ^n(d)`. Prove the following (riggenbach-double Corollary 5.8 and Lemma 5.13, lines 517 and 668; riggenbach-trunc Lemma 4.1, line 575; for perfect 𝔽_p-algebras hn-cusp lines 294–311).

- For n ≥ 0, `π_*(THH(R;ℤ_p)^{hC_{p^n}}) ≅ A_inf(R)[u,v]/(uv − d, d̃_n v)`, with |u| = 2 and |v| = −2. The map from `π_*TC^-(R;ℤ_p) = A_inf(R)[u,v]/(uv − d)` is the quotient map.
- For n ≥ 1, `π_*(THH(R;ℤ_p)^{tC_{p^n}}) ≅ A_inf(R)[v^{±1}]/(d̃_n)`, with `A_inf(R)/d̃_n ≅ W_n(R)` through θ̃_n. The map can sends u to `d v^{−1}` and v to v.
- The transfers `THH(R;ℤ_p)^{hC_{p^{n−1}}} → THH(R;ℤ_p)^{hC_{p^n}}` and `THH(R;ℤ_p)^{tC_{p^{n−1}}} → THH(R;ℤ_p)^{tC_{p^n}}` are Verschiebung maps in even degrees. On the Tate constructions in every even degree, and on the homotopy fixed points in negative even degrees, the transfer is `V : W_{n−1}(R) → W_n(R)`. On the homotopy fixed points in even degrees ≥ 0, where `π_0 = A_inf(R)/(d·d̃_n) ≅ W_{n+1}(R)`, it is `V : W_n(R) → W_{n+1}(R)`. As maps of `A_inf(R)[u,v]/(uv − d)`-modules they are multiplication by `r·d̃_n/d̃_{n−1}` for a unit r.
- The Frobenius `φ^{hC_{p^n}} : THH(R;ℤ_p)^{hC_{p^n}} → THH(R;ℤ_p)^{tC_{p^{n+1}}}` is an isomorphism on π_j for j ≥ 0. The map can is an isomorphism on π_j for j < 0 (riggenbach-double Proposition 5.7, line 507).
- For m = p^n m′ with p ∤ m′, the restriction `THH(R;ℤ_p)^{hC_m} ≃ THH(R;ℤ_p)^{hC_{p^n}}` is an equivalence, and likewise for Tate. The reason is that `BC_{m′}` is p-adically contractible and the action is restricted from T.

For a perfect 𝔽_p-algebra k (d = p, A_inf = W(k)): `π_*THH(k)^{hC_{p^n}} = W(k)[u,v]/(uv − p, p^n v)`, `π_*THH(k)^{tC_{p^n}} = W_n(k)[v^{±1}]`, and the transfer from level n − 1 to level n is multiplication by p (hn-cusp line 309).

*Needs:* AInfCohomology AI.0 and §AI.7.2 (A_inf, θ, perfectoid trace coefficients, `(X^{tT})^∧_p ≃ (X^{tC_p})^{h(T/C_p)}`, the Tate orbit lemma); RefinedTraceMethods §§2.3, 2.9; QWittVectors §1.5 (p-typical Witt vectors); KTheoryFiniteLocalFields §5.1.

**Checks.**

- For R = 𝔽_p and n = 1: `π_0THH(𝔽_p)^{tC_p} = ℤ_p/p = 𝔽_p = W_1(𝔽_p)`, and `π_{−2}THH(𝔽_p)^{hC_p} = ℤ_p/p·v`. A formula without the relation `d̃_n v` would make `π_{−2}` equal to ℤ_p, the value for TC^-.
- For R = 𝔽_p and n = 2: `π_0THH(𝔽_p)^{tC_{p²}} = ℤ/p² = W_2(𝔽_p)` and `π_0THH(𝔽_p)^{hC_{p²}} = ℤ_p/(p·p²) = ℤ/p³ = W_3(𝔽_p)`. The transfer from n = 1 is multiplication by p in both, which is `V : W_1 → W_2` on the Tate constructions and `V : W_2 → W_3` on the homotopy fixed points. A map sending 1 to 1 would not be a module map from ℤ/p to ℤ/p², and indexing the homotopy fixed points like the Tate constructions would give ℤ/p² instead of ℤ/p³.
- n = 0: `THH(R;ℤ_p)^{hC_1} = THH(R;ℤ_p)`, and `A_inf(R)[u,v]/(uv − d, d̃_0v)` with `d̃_0 = 1` is `A_inf[u]/(d) = R[u]`. This is Bökstedt periodicity.

### 3.5 The staircase lemma

Let `(A_v)_{v≥0}` and `(B_v)_{v≥1}` be abelian groups with maps `φ_v : A_v → B_{v+1}` (v ≥ 0) and `c_v : A_v → B_v` (v ≥ 1). Suppose there is an integer s ≥ 0 such that φ_v is an isomorphism for 0 ≤ v < s, and c_v is an isomorphism for every v ≥ max(s,1). Then the map `δ : ∏_{v≥0}A_v → ∏_{v≥1}B_v`, `δ(x)_v = φ_{v−1}(x_{v−1}) − c_v(x_v)`, is surjective. Its kernel maps isomorphically to `A_{s−1}` by projection if s ≥ 1, and to A_0 if s = 0 (hn-cusp lines 330–349; speirs-axes lines 1025–1046; riggenbach-trunc lines 1266–1272). Applied to the homotopy groups of the factors of a product decomposition `TC^-(m′) = ∏_v X_v^{hT}` and `TP(m′) = ∏_v X_v^{tT}` with homotopy in one parity, it computes TC(m′) in that parity and shows TC(m′) vanishes in the other. Such a product decomposition needs the connectivity of the X_v to tend to infinity (§2.3); for the polynomial ring it fails (Examples).

*Needs:* abelian groups and their products (Mathlib `AddCommGroup`, `Pi.addCommGroup`); RefinedTraceMethods §2.9 for the application.

**Checks.**

- s = 0, A_v = B_v = ℤ/p^v (with A_0 = 0), c_v the identity and φ_v arbitrary: δ is bijective and the kernel is A_0 = 0.
- s = 2 with `A_v = W_{v+1}(k)` for v < 2, `A_v = W_v(k)` for v ≥ 2, `B_v = W_v(k)`, φ_v the identity for v < 2 and c_v the identity for v ≥ 2. The kernel is `A_1 = W_2(k)`, which is HN's answer W_s(k) with s = 2.
- Without the isomorphism hypotheses the conclusion fails. For A_v = B_v = ℤ/p and all φ_v and c_v zero, δ = 0, so its kernel is the infinite product `∏_v ℤ/p` and its cokernel `∏_{v≥1} ℤ/p` is nonzero. Neither is a single A_v.

### 3.6 Homotopy of circle cells

For a perfectoid ring R, a complex T-representation λ of complex dimension d, and m = p^n m′ with p ∤ m′, prove `π_j((THH(R;ℤ_p) ⊗ S^λ ∧ (T/C_m)_+)^{hT}) ≅ π_{j−2d−1}(THH(R;ℤ_p)^{hC_{p^n}})` and the same with tT and `tC_{p^n}`. For the Frobenius, let B and B′ be finite pointed T-CW complexes, B of dimension N, and let `ψ : B → B′^{C_p}` be a T-equivariant homeomorphism, where `B′^{C_p}` carries the residual action of T/C_p ≅ T of the Conventions. Then the restricted Frobenius `THH(R;ℤ_p) ⊗ Σ^∞B → (THH(R;ℤ_p) ⊗ Σ^∞B′)^{tC_p}` is an isomorphism on π_j for j ≥ N, and so is its map of homotopy T-fixed points (speirs-axes Corollary 17, line 603; speirs-trunc Lemma 8 and Corollary 9, lines 347 and 377). Here the restricted Frobenius is, as in §2.3, the composite of `φ_p ⊗ Σ^∞ψ` into `THH(R;ℤ_p)^{tC_p} ⊗ (Σ^∞B′)^{hC_p}` (through `Σ^∞B′^{C_p} → (Σ^∞B′)^{hC_p}`), of `id ⊗ can` and of the lax structure map. The route factors it through fixed cells. By the compatibility statement of 3.1 for Z = B′ with the restricted C_p-action, it is homotopic to `φ_p ⊗ id_{Σ^∞B}`, followed by the equivalence `id ⊗ Σ^∞ψ : THH(R;ℤ_p)^{tC_p} ⊗ Σ^∞B → THH(R;ℤ_p)^{tC_p} ⊗ Σ^∞B′^{C_p}` and by the fixed-point map of 3.1, which is an equivalence (speirs-trunc lines 341–376). Finiteness of B′ is what makes 3.1 apply: `B′^{C_p}` is then a finite complex, and `B′/B′^{C_p}` is a finite colimit of free C_p-cells, because a cell T/H with C_p ⊄ H is C_p-free and built from finitely many free C_p-cells. This route uses neither p-completion nor the Segal equivalence; speirs-axes Proposition 16 (line 532) factors the Frobenius instead through the lax structure map on `(Σ^∞B′)^{tC_p}`, which needs both. The inputs are 3.1, 3.2, 3.3 and 3.4. The Frobenius bound uses that φ_p is the connective cover onto `THH(R;ℤ_p)^{tC_p}`, whose `π_{−1}` vanishes. So the fibre of φ_p has homotopy only in degrees ≤ −3, the fibre of `φ_p ⊗ id_{Σ^∞B}` only in degrees ≤ N − 3, and `φ_p ⊗ id_{Σ^∞B}` is an isomorphism on π_j for j ≥ N − 1.

*Needs:* §§3.1–3.4; Layer 2 §2.3 (Frobenius factorization).

**Checks.**

- For R = 𝔽_p, λ = 0 and m = 1: `π_j((THH(𝔽_p) ⊗ T_+)^{hT}) = π_{j−1}THH(𝔽_p)`, which is 𝔽_p for j odd and j ≥ 1. This is the weight-1 summand of TC^-(𝔽_p[t]).
- For λ = C(1), d = 1 and m = p: π_j of the homotopy fixed points is `π_{j−3}(THH(R;ℤ_p)^{hC_p})`. Forgetting the representation sphere would shift by 1 instead of 3.
- For `B = S^{λ_1} ∧ T_+` (N = 3), the restricted Frobenius is an isomorphism from π_3 on but not on π_1. In π_1 the source is zero, while the target receives `π_{−2}` of a Tate construction, which is nonzero.
- Finiteness of B′ is needed. Take R = 𝔽_p, B = S⁰ (N = 0) and `B′ = S⁰ ∨ ET_+` with ET a free contractible T-CW complex, so that `B′^{C_p} = S⁰` and ψ is the identity. In Borel spectra `Σ^∞_+ET ≃ 𝕊`, so the target is `THH(𝔽_p)^{tC_p} ⊕ THH(𝔽_p)^{tC_p}` and π_0 of the map is the inclusion `𝔽_p → 𝔽_p²` of one summand, not an isomorphism. With the finite free complex T in place of ET, `(THH(𝔽_p) ⊗ T_+)^{tC_p} = 0` and π_0 is the identity of 𝔽_p.

### Examples

For a perfect field k of characteristic p, §2.3 splits `THH(k[t])` as `⊕_{m≥0} THH(k) ⊗ Σ^∞B^cy(⟨t⟩_+;m)`, and the weight-m summand for m ≥ 1 is `THH(k) ⊗ (T/C_m)_+` (§2.2 Checks), of connectivity −1 for every m (its π_0 is `π_0THH(k) = k`), in the convention of the §2.3 Checks. The convergence hypothesis of §2.3 therefore fails: `TC^-(k[t])` is not the product of the `(THH(k) ⊗ (T/C_m)_+)^{hT}`, and the staircase lemma cannot be applied weight by weight. Reading the sum as a product gives a wrong answer. In degree 1 the weights p^v would give `A_v = π_0THH(k)^{hC_{p^v}} = W_{v+1}(k)` and `B_v = π_0THH(k)^{tC_{p^v}} = W_v(k)` (§§3.2, 3.4), with φ an isomorphism for every v and c the restriction, so that no finite s exists and the kernel of φ − can on the product is `lim_R W_{v+1}(k) = W(k) ≠ 0`. In fact `TC_1(k[t],(t)) = 0`. By the motivic filtration (PrismaticCohomologyPartIII §7.0), `TC_1(k[t];ℤ_p)` is built from the groups `H^{2i−1}(ℤ_p(i)(k[t]))`. For i = 0 the degree is −1 and the group vanishes. For i = 1 it is the derived p-completion of `k[t]^× = k^×` (PrismaticCohomologyPartIII §6.24, with `Pic(k[t]) = 0`), which is 0 because `k^×` is uniquely p-divisible. For i ≥ 2, `ℤ_p(i)(k[t]) = 0` because `WΩ^i_{k[t]} = 0` on a curve (PrismaticCohomologyPartIII §6.16). Since `k[t] → k`, t ↦ 0, is split by the constants, `TC_1(k[t],(t))` is a summand of `TC_1(k[t];ℤ_p) = 0`.

Relative K and relative TC of the non-henselian pair `(k[t],(t))` still differ, in degree −1. On the K side, `K_{−1}(k[t],(t)) = 0`, because k[t] is regular noetherian (SchemeKTheoryOperations §5.2) and `K_0(k[t]) → K_0(k)` is an isomorphism. On the TC side, for an 𝔽_p-algebra A, TC is the equalizer of id and F on `TR(A;p)`, which has `π_0 = W(A)` and no negative homotopy (it is a limit of connective spectra along restriction maps that are onto on π_0), so `TC_{−1}(A) = coker(1 − F : W(A) → W(A))` (RefinedTraceMethods §§2.13, 2.16). The class of the Teichmüller lift [t] lies in the relative group, since [t] restricts to 0 at t = 0, and it is nonzero: the first Witt component carries F to the Frobenius of k[t], so it maps the class to that of t in `k[t]/{f^p − f : f ∈ k[t]}`, and t is not of the form f^p − f, which is constant or of degree divisible by p. The passage from K to TC needs the birelative or nilpotent hypotheses of Layer 4.

### Dependencies

Layer 2 (§2.3). Suppliers: BordismFormalGroups §F6.5; RefinedTraceMethods §§2.1, 2.3–2.4, 2.9; AInfCohomology AI.0, §AI.7.2; KTheoryFiniteLocalFields §5.1; QWittVectors §1.5; EnhancedDerivedSheaves §E5:abstract.2. The Examples also use RefinedTraceMethods §§2.13, 2.16, PrismaticCohomologyPartIII §§6.16, 6.24, 7.0 and SchemeKTheoryOperations §5.2.

## Layer 4: Normalization squares and birelative theory

### 4.1 Birelative theories

For a map of rings f : A → B and an ideal I ⊂ A mapped isomorphically onto an ideal of B (a Milnor square), define the birelative terms `K(A,B,I)`, `TC(A,B,I)`, `THH(A,B,I)` and `HC(A⊗ℚ,B⊗ℚ,I⊗ℚ)` as total fibres of the evident squares. Use IK for K (hesselholt-axes line 47; speirs-axes line 123).

- There is a natural fibre sequence `K(A,B,I) → K(A,I) → K(B,I)`, and the trace induces `K(A,B,I) → TC(A,B,I)`.
- Functoriality in maps of Milnor squares; for p nilpotent in A, `TC(A,B,I) ≃ TC(A,B,I;ℤ_p)`. The route: p is then nilpotent in each corner C ∈ {A, B, A/I, B/I}, and the homotopy groups of THH(C) are C-modules, so each is killed by a fixed power of p and every prime ℓ ≠ p acts invertibly on it. Hence THH(C) is p-complete and `THH(C)^{tC_ℓ} = 0` for ℓ ≠ p, so the fibre sequence of RefinedTraceMethods §2.9 exhibits TC(C) as the fibre of a map from `THH(C)^{hT}` to `(THH(C)^{tC_p})^{hT}`, two p-complete spectra; a total fibre of p-complete spectra is p-complete.

*Needs:* RefinedTraceMethods §4.12 (relative K, TC and K^inv), §§2.3 and 2.9 (Tate vanishing and p-completeness, and the fibre formula, for the p-adic statement); GeneralAlgebraicKTheory §8.1; StableHomotopyKTheory §§7.14–7.15 and 7.17 (p-complete spectra, their closure under fibres and limits, and p-completeness under bounded p-power exponent).

**Checks.**

- For B = A and f the identity, every birelative term vanishes.
- For A = B × C and the ideal B × 0, the square is a product square and the birelative terms vanish, because K and TC preserve finite products.
- For the coordinate axes A_2 → k[x] × k[y] over a field k, `K_2(A_2,B_2,I_2) ≅ k`: Dennis–Krusemeyer computed `K_2(A_2,I_2) = k` (hesselholt-axes line 31), and the relative and birelative terms agree because k is regular (hesselholt-axes lines 55–57). A birelative term that ignored the K₂ failure of excision would give zero in degree 2.
- Non-example: the square of the reduction map f : A = ℤ → B = ℤ/p with I = pℤ and `A/I = B/f(I) = ℤ/p` is not a Milnor square, because f carries I = pℤ to 0 and not isomorphically onto an ideal of B. Its birelative term is the relative term `K(ℤ, pℤ)`, so excision for `K^inv` (RefinedTraceMethods §4.18) says nothing about it, and relative K is not relative TC there (RefinedTraceMethods §4.17 Checks).

### 4.2 The normalization squares of axes and cusps

Prove the following for every ring k.

- *Axes.* For d ≥ 2, `A_d = k[x_1,…,x_d]/(x_ix_j)_{i≠j} → B_d = ∏_i k[x_i]`, with ideal `I_d = (x_1,…,x_d)` and quotient square `k → k^d` (the diagonal), is a Milnor square (speirs-axes line 110).
- *Cusps.* For coprime a, b ≥ 2, the inclusion `A = k[t^a,t^b] ⊂ B = k[t]`, with conductor ideal `c = t^{(a−1)(b−1)}k[t] ⊂ A`, is a Milnor square. The quotients `A/c` and `B/c` are finite k-algebras whose augmentation ideals are nilpotent, so excision and nil-invariance of `K^inv` (RefinedTraceMethods §4.18) give `K^inv(A) ≃ K^inv(B)`. Equivalently the square of K(A), TC(A), K(B) and TC(B) is cartesian (hn-cusp lines 89 and 97; hesselholt-cusp-polytopes Remark 1.5 and Theorem 4.1, lines 373 and 839).

*Needs:* §§1.1, 4.1; RefinedTraceMethods §4.18 (excision and nil-invariance of truncating invariants, applied to `K^inv`); Mathlib `Polynomial`, `Ideal`, `frobeniusNumber_pair` (the conductor exponent).

**Checks.**

- For (a,b) = (2,3), the conductor is `t²k[t]`: t² and t³ lie in A, but t does not. A conductor exponent ab − a − b = 1 would make the inclusion `tk[t] ⊂ A` false.
- For d = 2 and k = ℤ the square is `ℤ[x,y]/(xy) → ℤ[x] × ℤ[y]` over `ℤ → ℤ × ℤ`. It is cartesian as a square of rings, and I_2 maps isomorphically onto `xℤ[x] × yℤ[y]`.
- For the cusp (a,b) = (2,3), `c = t²k[t]` and `A/c = k`, while `B/c = k[t]/t²`. The two quotients are not isomorphic, but both reduce to k modulo a nilpotent ideal. Nil-invariance of `K^inv`, not an isomorphism of the quotients, therefore gives `K^inv(A) ≃ K^inv(B)`.

### 4.3 Relative versus birelative K-theory

Prove the following. If `NK_n(k) = 0` for every integer n, then `K(A_d,I_d) ≃ K(A_d,B_d,I_d)`, and for the cusp `K(A,(x,y)) ≃ fib(IK(A) → IK(k[t]))`. Here `A → A/(x,y) = k` and `A_d → k` are split by the inclusion of constants, so `IK_q(A) = IK_q(k) ⊕ K_q(A,(x,y))`. The hypothesis holds for every regular noetherian ring k (SchemeKTheoryOperations §5.2), and for every ind-smooth ℚ-algebra, because NK commutes with filtered colimits. For a perfect 𝔽_p-algebra it is gap `perfect-homotopy-invariance` (amm-perfectoid Proposition 5.1, line 558; hn-cusp line 101; riggenbach-cusp line 152; speirs-axes line 128; hesselholt-axes line 55).

*Needs:* §4.1; SchemeKTheoryOperations §5.2; GeneralAlgebraicKTheory §10.5; gap `perfect-homotopy-invariance` (perfect 𝔽_p-algebras that are not regular noetherian).

**Checks.**

- For k = 𝔽_p[ε]/ε², which is neither regular nor perfect, `NK_1(k) ≠ 0`: the unit `1 + εt` is not constant. So `K(A_2,I_2)` differs from the birelative term there, and the hypothesis is necessary.
- For a perfect field k both cases apply with no gap, since a field is regular noetherian.
- The splitting `IK_q(A) = IK_q(k) ⊕ K_q(A,(x,y))` holds for every k. For the Milnor square it gives `K_0(A_d,I_d) = 0` for a field k: K_0(A_d) = ℤ by Milnor's Mayer–Vietoris sequence, since `K_1(k) ⊕ K_1(B_d) → K_1(k^d)`, `(a,(b_i)) ↦ (a/b_i)_i`, is onto and `K_0(k) ⊕ K_0(B_d) → K_0(k^d)` has kernel ℤ.

### Examples

For a field k and d ≥ 2, Milnor's Mayer–Vietoris sequence shows that `K_0(A_d,I_d) = 0` (§4.3 Checks) and that the image of `K_1(A_d)` in `K_1(k) ⊕ K_1(B_d)` is the diagonal copy of `k^×`. It says nothing about the kernel of that map, since the sequence has no K_2 term on the left, and the failure of excision in degree 2 (§4.1 Checks) is invisible to it. The vanishing of `K_1(A_d,I_d)` is a theorem: for d = 2 and every field it is the degree-1 case of hesselholt-axes Theorem A (line 21) and of the Geller–Reid–Weibel formula (line 99), and for every d ≥ 2 it is the case q = 1 of §5.3 over perfect fields of positive characteristic and of §5.4 over fields of characteristic 0, which are ind-smooth ℚ-algebras. These are the degree-1 and degree-0 values that Layer 5 must reproduce. For the cusp (2,3) over a field, `Pic(A) ≅ k`, which is `K_0(A,(x,y))`. Layer 6 must reproduce it at r = 0.

Excision for `K^inv` and its rational form (RefinedTraceMethods §4.18) make the birelative trace `K(A,B,I) → TC(A,B,I)` of every Milnor square an equivalence and give `K(A,B,I) ⊗ ℚ ≃ ΣHC(A⊗ℚ,B⊗ℚ,I⊗ℚ)`. On the axes A_2 over k = 𝔽_p, `K_2(A_2,B_2,I_2) = 𝔽_p` (Layer 5), and on the TC side the lowest birelative THH summand `Σ^{−1}THH(𝔽_p) ⊗ S^{λ_1} ∧ T_+` has bottom cell in degree 1 and contributes `W_1(𝔽_p)` to TC in degree 2; a trace that missed the `Σ^{−1}` would put the first nonzero group in degree 3. Over k = ℚ, `K_2(A_2,B_2,I_2) ⊗ ℚ ≅ HC_1(A_2,B_2,I_2) = ℚ` (Geller–Reid–Weibel as recalled at hesselholt-axes line 97), while `HC_2(A_2,B_2,I_2) = 0`, so a shift by 0 instead of 1 would give the wrong group.

### Dependencies

Layer 1 (§1.1). Suppliers: RefinedTraceMethods §§2.3, 2.9, 4.12, 4.17–4.18; GeneralAlgebraicKTheory §§8.1, 10.5; SchemeKTheoryOperations §5.2; StableHomotopyKTheory §§7.14–7.15, 7.17; gap `perfect-homotopy-invariance`.

## Layer 5: Coordinate axes

### 5.1 The birelative TC of the axes in the plane

Prove that for every 𝔽_p-algebra k, with A = k[x,y]/(xy), B = k[x] × k[y] and I = (x,y), there is a natural isomorphism for every integer q, `TC_q(A,B,I;p) ≅ ∏_{d∈J_p} lim_R TR^r_{q−λ_{p^{r−1}d}}(k;p)`. The limit is over r ≥ 1 along the restriction maps of RefinedTraceMethods §2.13 (with `λ_{p^{r−1}d}` restricting to `λ_{p^{r−2}d}` on C_p-fixed points). For every ring k the same holds with ℤ/p^v-coefficients (hesselholt-axes Theorem B, line 70). The limit stabilizes: R is an isomorphism `TR^r_{q−λ_{p^{r−1}d}} → TR^{r−1}_{q−λ_{p^{r−2}d}}` whenever `q < 2p^{r−1}d` (hesselholt-axes Lemma 2.3, line 82). So for fixed q and d the towers of homotopy groups in degrees q and q + 1 are eventually constant, the lim¹ term of the Milnor sequence vanishes, and `π_q` of the homotopy limit over R is the limit of the `π_q`. The route goes through the F-equivalence `⋁_{i≥1} Σ^{−1}THH(k) ∧ S^{λ_i} ∧ (T/C_i)_+ ≃ THH(A,B,I)` of genuine T-spectra (hesselholt-axes Proposition 1.2, line 131; §2.5 here for its Borel form). Then group the summands `i = p^{r−1}d` and identify the genuine fixed points of `S^{λ_i} ∧ (T/C_i)_+` with representation-graded TR.

*Needs:* §§2.3, 2.5, 4.1; RefinedTraceMethods §§2.13, 2.16 (genuine TC and the restriction pullback); KTheoryFiniteLocalFields §§4.0, 4.4 and §5.16 (the pointed-monoid equivalence in genuine cyclotomic spectra, which gives the F-equivalence its genuine form); StableHomotopyKTheory §7.9 (the Milnor sequence of the tower over R).

**Checks.**

- For q ≤ 1 every factor vanishes. The reason is that `TR^r_{q−λ}(k;p) = 0` for `q < 2·dim_ℂλ^{C_{p^{r−1}}}`, and `λ_{p^{r−1}d}^{C_{p^{r−1}}}` has complex dimension d ≥ 1. This agrees with `K_q(A,I) = 0` for q ≤ 1 (§§4.3, 5.2).
- For q = 2 only d = 1, r = 1 contributes: `TR^1_{2−λ_1}(k;p) = π_0THH(k) = k`. So `TC_2(A,B,I;p) = k`.
- With λ replaced by 0 the formula would give `∏_d TR_q(k;p)`, which is nonzero in degree 0. This contradicts `K_0(A,I) = 0` (§4.3 Checks).

### 5.2 The axes in the plane over regular noetherian 𝔽_p-algebras

Prove that for every regular noetherian 𝔽_p-algebra k and every integer q, `K_q(k[x,y]/(xy),(x,y)) ≅ ⊕_{m≥1} ⊕_{d∈J_p, d≤m} W_{s(m,d)}Ω^{q−2m}_k`, where `s(m,d)` is the unique s ≥ 1 with `p^{s−1}d ≤ m < p^s d`. This is the p-typical form of `⊕_{m≥1} 𝕎_mΩ^{q−2m}_k` (hesselholt-axes Theorem A and the decomposition at line 36). The route combines §4.3 (NK vanishes for regular noetherian rings), excision for `K^inv` (RefinedTraceMethods §4.18, giving `K(A,B,I) ≃ TC(A,B,I)`, which is p-complete because p = 0 in A, by §4.1), §5.1 and KTheoryFiniteLocalFields §5.17. In that formula, for `λ = λ_{p^{r−1}d}`, one has `ℓ_s = p^{r−1−s}d` for s ≤ r − 1. So the summand `W_tΩ^{q−2m}_k` occurs for `p^{t−1}d ≤ m < p^t d`, that is, for t = s(m,d), and the limit over r stabilizes to `⊕_{m≥d} W_{s(m,d)}Ω^{q−2m}_k`.

*Needs:* §§1.3, 4.1, 4.3, 5.1; RefinedTraceMethods §4.18; KTheoryFiniteLocalFields §5.17; CrystallineCohomology CR.4; SchemeKTheoryOperations §5.2.

**Checks.**

- q = 1: every term has q − 2m < 0, so `K_1(A,I) = 0`, the degree-1 value recorded in Layer 4 (Examples). Its unit part is visible directly: A is reduced and its units are the constants `k^×`, those of `B = k[x] × k[y]` being `k^× × k^×`.
- q = 2: only m = d = 1, giving `W_1Ω⁰_k = k`. This is the Dennis–Krusemeyer group. q = 3: `Ω¹_k`, which vanishes for perfect k.
- q = 4: `Ω²_k ⊕ W_{s(2,1)}(k) ⊕ W_{s(2,2)}(k)`. For p odd, s(2,1) = s(2,2) = 1, giving `Ω²_k ⊕ k ⊕ k`. For p = 2, d = 2 is excluded and s(2,1) = 2, giving `Ω²_k ⊕ W_2(k)`. For k = 𝔽_2 this is ℤ/4, and a formula with big Witt vectors read componentwise would give `𝔽_2²` (hesselholt-axes line 108).
- Exponent: for `p^{s−1} ≤ n < p^s` and k = 𝔽_p, `K_{2n}(A,I)` has exponent exactly p^s (hesselholt-axes line 110). For n = 2 and p = 2 this is 4.

### 5.3 The axes in affine d-space in positive characteristic

For d ≥ 2 put `A_d = k[x_1,…,x_d]/(x_ix_j)_{i≠j}`, `B_d = ∏_i k[x_i]` and `I_d = (x_1,…,x_d)`. Prove that for every perfect field k of characteristic p > 0 and every r ≥ 0 (speirs-axes Theorems 1–2, lines 27 and 153; Proposition 28 and §5.1, lines 976–1117):

```text
p odd:  K_{2r}(A_d,I_d)   ≅ ∏_{m′∈J_p even} ∏_{s′|m′, s′ even} ∏_{0≤u≤t_ev} W_{t_ev−u}(k)^{⊕cyc_d(p^u s′)}
        K_{2r+1}(A_d,I_d) ≅ ∏_{m′∈J_p odd}  ∏_{s′|m′}         ∏_{0≤u≤t_od} W_{t_od−u}(k)^{⊕cyc_d(p^u s′)}
p = 2:  K_{2r}(A_d,I_d)   ≅ ∏_{m′ odd} ∏_{s′|m′} ∏_{1≤u≤t_ev} W_{t_ev−u}(k)^{⊕cyc_d(2^u s′)}
        K_{2r+1}(A_d,I_d) ≅ ∏_{m′ odd, m′≤2r+1} ∏_{s′|m′} k^{⊕cyc_d(s′)}
```

Here t_ev = t_ev(p,r,m′) and t_od = t_od(p,r,m′) are as in §1.4, and `W_0 = 0`, so each product is finite. The same formulas give `TC_q(A_d,B_d,I_d)` for every perfect field.

The route has three parts. First, `THH(A_d,B_d,I_d)` splits by §2.5 into `THH(k) ⊗ B(m,s)` summands with multiplicity cyc_d(s). Second, Layer 3 computes their TC^- and TP: in the families with m and s of equal parity, the homotopy groups are `W_{v−u+1}(k)` or `W_{v−u}(k)` (speirs-axes Proposition 26, line 857). In the p = 2 family with m even and s odd, they are k in every odd degree, with homotopy fixed points of the v = 0 term equal to k exactly in odd degrees ≥ m′ (speirs-axes Proposition 28). Third, apply the staircase lemma §3.5 with s = t_ev or t_od. In the last family it applies with s = t_od(2,r,m′) and `A_{s−1} = k^{⊕cyc_d(s′)}`, giving one copy for each odd m′ ≤ 2r + 1.

speirs-axes Theorem 2 prints the p = 2 odd-degree formula with the index 0 ≤ v ≤ t_ev, and that version is false; the count above is the correct one. For d ≥ 3 the printed version is an infinite product in every odd degree: for each odd m′ > 2r + 1, t_ev = 0, and the index 0 ≤ v ≤ 0 still keeps one copy of `∏_{s′|m′} k^{⊕cyc_d(s′)}`, which is nonzero because `cyc_d(m′) > 0`. For d = 3 and r = 0 the factors from m′ = 3 and m′ = 5 are `k^{cyc_3(3)} = k²` and `k^{cyc_3(5)} = k⁶`. This contradicts the finiteness of the products stated at speirs-axes line 69, and Proposition 28 (line 982), by which the v = 0 term contributes only in degrees 2r + 1 ≥ m′.

*Needs:* §§1.4, 2.5, 3.1–3.6, 4.3; RefinedTraceMethods §4.18; KTheoryFiniteLocalFields §5.1.

**Checks.**

- d = 2: only cyc_2(2) = 1 is nonzero. For p odd, `K_{2r} = ∏_{m′ = 2d′, d′∈J_p} W_{t_ev}(k)` with `p^{t−1}·2d′ ≤ 2r < p^t·2d′`, that is t = s(r,d′), and the odd groups vanish. For p = 2, u = 1 and s′ = 1 give `∏_{m′ odd} W_{t_ev−1}(k)` with t_ev − 1 = s(r,m′), and the odd groups vanish because cyc_2 of an odd number is 0. Both agree with §5.2 for a perfect field.
- d = 3, q = 3: for p = 2, m′ = 3 gives `k^{cyc_3(3)} = k²`. For p = 3, m′ = 1, u = 1 gives `W_1(k)^{cyc_3(3)} = k²`. For p = 5, m′ = 3, u = 0 gives k². All primes agree with each other and with the char-0 count c_2(3) = 2 of §5.4.
- d = 3, q = 5: p = 2 gives `k^{cyc_3(3)} ⊕ k^{cyc_3(5)} = k^8`, and p = 3 gives `W_1(k)^{cyc_3(3)} ⊕ W_1(k)^{cyc_3(5)} = k^8`. The printed index 0 ≤ v ≤ t_ev would give two copies of k² for m′ = 3, since t_ev(2,2,3) = 1, and a copy of `k^{cyc_3(s′)}` for every odd m′ > 5, an infinite product.
- d = 3, q = 2: for p odd, m′ = 2 and u = 0 give `k^{cyc_3(2)} = k³ = k^{d(d−1)/2}`, the Dennis–Krusemeyer rank.

### 5.4 The axes in affine d-space in characteristic zero

Prove that for every commutative ℚ-algebra k, every d ≥ 2 and q ≥ 1 there is an isomorphism (speirs-axes Theorem 30, line 1163):

```text
HC_q((A_d,I_d)/ℚ) ≅ ⊕_{m≥2 even} ⊕_{s|m even} HH_{q+1−m}(k/ℚ)^{⊕cyc_d(s)}
                  ⊕ ⊕_{m≥3 odd}  ⊕_{s|m odd}  HH_{q+1−m}(k/ℚ)^{⊕cyc_d(s)}
                  ⊕ ⊕_{i≥1} HH_q(k/ℚ)^{⊕d}
```

The last summand is the relative HC of the d lines and disappears in the birelative term. Prove further that for every ind-smooth ℚ-algebra k, `K_q(A_d,I_d) ≅ ⊕_{j=0}^{q−2} (Ω^j_{k/ℚ})^{⊕c_{d−1}(q−j)}` (speirs-axes Theorem 31, line 1228).

The route: §2.4 identifies `HH(A_d/ℚ)` with `HH(k/ℚ) ⊗ B^cy(Π_d)`. Over ℚ, the words with s odd and i even have no rational homology (§2.5), and `(HH(k) ⊗ S^{λ_j} ∧ (T/C_i)_+)_{hT}` has homotopy `HH_{q−2j}(k)` because rational group homology of C_i is concentrated in degree 0. Then the rational form of excision for `K^inv` (RefinedTraceMethods §4.18) gives `K_q(A_d,B_d,I_d) ⊗ ℚ ≅ HC_{q−1}(A_d,B_d,I_d)`. Nothing is lost by tensoring with ℚ, because the birelative K-groups are already ℚ-vector spaces (speirs-axes line 1232 records this for the relative groups, which agree with them by §4.3, citing Cortiñas). Indeed, excision for `K^inv` gives `K(A_d,B_d,I_d) ≃ TC(A_d,B_d,I_d)`. Each corner C of the square is a ℚ-algebra, so every prime p acts invertibly on the C-modules `π_*THH(C)`, hence `THH(C)^{tC_p} = 0` (RefinedTraceMethods §2.3), and the fibre sequence of RefinedTraceMethods §2.9 gives `TC(C) ≃ THH(C)^{hT}`, on which every nonzero integer acts invertibly. §4.3 applies since NK vanishes for ind-smooth ℚ-algebras, and the smooth HKR theorem of RefinedTraceMethods §1.9 identifies `HH_j(k/ℚ) ≅ Ω^j_{k/ℚ}`, extended to filtered colimits.

*Needs:* §§1.4, 2.4–2.5, 4.3; RefinedTraceMethods §§1.4, 1.9, 2.3, 2.9, 4.17–4.18.

**Checks.**

- The rationality of the birelative groups needs the corners to be ℚ-algebras. Over k = ℚ and d = 2, `K_2(A_2,B_2,I_2) = HC_1(A_2,B_2,I_2) = ℚ` (Layer 4 Examples), a ℚ-vector space. Over k = 𝔽_p the same group is `𝔽_p` (§4.1 Checks), which is not, and there `THH(𝔽_p)^{tC_p} ≠ 0`, so `TC(𝔽_p)` is not `THH(𝔽_p)^{hT}`.
- d = 2: `c_1(m) = 1` for m even, so `K_q(A_2,I_2) ≅ ⊕_{m≥1} Ω^{q−2m}_{k/ℚ}` (hesselholt-axes line 100). For k = ℚ and q = 4 this is ℚ, while a perfect field of characteristic p > 2 gives k ⊕ k (§5.2), so the two characteristics differ from degree 4 on.
- q = 2, k algebraic over ℚ: `K_2 = k^{c_{d−1}(2)} = k^{d(d−1)/2}`, the same count as §5.3.
- For k = ℚ(t), q = 3 and d = 2: `K_3 = Ω¹_{ℚ(t)/ℚ} = ℚ(t)dt ≠ 0`. A formula using only `k^{c(q)}` would give 0.

### Examples

For k = 𝔽_3 and d = 2, the groups `K_q(A_2,I_2)` for q = 1, …, 6 are 0, 𝔽_3, 0, 𝔽_3², 0, ℤ/9 ⊕ 𝔽_3. In degree 6, m = 3 and d ∈ {1,2} prime to 3 give `W_{s(3,1)}(𝔽_3) = W_2(𝔽_3) = ℤ/9` and `W_{s(3,2)}(𝔽_3) = 𝔽_3`. The exponent 9 = 3² is the one §5.2 predicts for 3 ≤ n = 3 < 9.

### Dependencies

Layers 1–4. Suppliers: RefinedTraceMethods §§1.4, 1.9, 2.3, 2.9, 2.13, 2.16, 4.17–4.18; KTheoryFiniteLocalFields §§4.0, 4.4, 5.1, 5.16, 5.17; CrystallineCohomology CR.4; SchemeKTheoryOperations §5.2; StableHomotopyKTheory §7.9.

## Layer 6: Planar cuspidal curves

### 6.1 TC of the cusp relative to its normalization

Prove that for every perfect 𝔽_p-algebra k and coprime a, b ≥ 2, with A = k[x,y]/(y^a − x^b) and B = k[t], the fibre F of TC(A) → TC(B) satisfies `π_{2r}F ≅ ∏_{m′∈J_p} W_{h(a,b,r,p,m′)}(k)` for r ≥ 0, with every other homotopy group zero. The index h is that of §1.3, for a labelling with p ∤ b (hn-cusp §2, lines 216–393).

The route: by §2.6, `cofib(THH(A) → THH(B)) ≃ ∏_{m≥1} THH(k) ⊗ Σ^∞B_m`, and THH(k) is a T-equivariant Hℤ-module (§3.3). So `THH(k) ⊗ B_m` is the total cofibre of the square of `THH(k) ⊗ (T/C_{m/c})_+[2ℓ(a,b,m)]`. By §3.2 and §3.4 its homotopy fixed points and Tate construction are cofibres of transfer maps `THH(k)^{hC_{p^{v−u}}} → THH(k)^{hC_{p^v}}`, each multiplication by p^u. The Frobenius carries weight m to weight pm and is an isomorphism in the relevant degrees (§3.1, using the free-cell cofibre of §2.6, and §3.6). The staircase lemma (§3.5), applied for each m′ ∈ J_p in each of the three cases (neither a′ nor b divides m′, a′ but not b divides m′, b divides m′), gives `W_h(k)` in degree 2r + 1 of the cofibre, and zero otherwise.

*Needs:* §§1.1, 1.3, 2.6, 3.1–3.6, 4.2; KTheoryFiniteLocalFields §5.1.

**Checks.**

- (a,b,r) = (2,3,0), p = 2: the product is `W_1(k)` from m′ = 1, so `π_0F = k`. For k = 𝔽_2 this is 𝔽_2, of length 1 = ½·1·1·2.
- (2,3,1) and k = 𝔽_5: here `T(2,3,1) = {1,5,7}`, so m′ = 1 has `h = s_T(1) = 2` and m′ = 7 has h = 1, giving `ℤ/25 ⊕ 𝔽_5`. For k = 𝔽_3, the three indices 1, 5, 7 each give h = 1, so the answer is `𝔽_3³`. Both have length 3 = ½·3·1·2.
- Odd vanishing: F has no odd homotopy groups. A computation that kept the even TC^- groups would produce classes in odd degrees of F from the Tate side.

### 6.2 K-theory of planar cuspidal curves

Prove that for every perfect 𝔽_p-algebra k and coprime a, b ≥ 2, `K_j(k[x,y]/(y^a − x^b),(x,y)) ≅ W_S(k)/(V_aW_{S/a}(k) + V_bW_{S/b}(k))` for j = 2r ≥ 0 with S = S(a,b,r), and that all other relative K-groups vanish (hn-cusp Theorem A, line 27). The isomorphism is canonical, and the right-hand side is identified with `W_{T(a,b,r)}(k)` by §1.2. The route: §4.2 gives `fib(IK(A) → IK(B)) ≃ F`, and §4.3 identifies the left side with `K(A,(x,y))`. For perfect fields, and more generally regular noetherian perfect k, this uses SchemeKTheoryOperations §5.2; for other perfect 𝔽_p-algebras it uses gap `perfect-homotopy-invariance`. Then §6.1 computes F, and §§1.2–1.3 with gap `bigwitt-ptypical-decomposition` identify `∏_{m′} W_h(k) ≅ W_{T(a,b,r)}(k)`.

*Needs:* §§1.2–1.3, 4.2–4.3, 6.1; SchemeKTheoryOperations §5.2; gaps `perfect-homotopy-invariance` and `bigwitt-ptypical-decomposition`.

**Checks.**

- r = 0 and k a perfect field: `K_0(A,(x,y))` has length `(a−1)(b−1)/2` over W(k), the δ-invariant of the cusp (hn-cusp line 37). For (a,b) = (2,3) and a perfect field k this is `W_{{1}}(k) = k`, the unipotent Picard group `(k[t]/t²)^×/k^× ≅ k` of the conductor square.
- For a perfect field k and every r, the length is `½(2r+1)(a−1)(b−1)` by Sylvester's count (§1.1). For (2,5) and r = 0 this is 2, and `T(2,5,0) = {1,3}`. For k = 𝔽_3 this gives `W_{{1,3}}(𝔽_3) = W_2(𝔽_3) = ℤ/9`, cyclic, while a componentwise reading would give `𝔽_3²`. The length formula needs a field: for k = 𝔽_3 × 𝔽_3 the theorem gives `ℤ/9 × ℤ/9`, of length 4 over `W(k) = ℤ_3 × ℤ_3`, and for k the perfection of `𝔽_3[t]` the same cusp gives `K_0 = W_{{1,3}}(k) = W_2(k)`, of infinite length: restriction maps it W(k)-linearly onto `W_1(k) = k`, whose ideals `(t) ⊋ (t²) ⊋ ⋯` are W(k)-submodules.
- Negative degrees: `K_{−1}(A,(x,y)) = 0` for every perfect field, because F has no negative homotopy (§6.1) and `NK_{−1}(k) = 0`. The theorem therefore excludes negative K-groups, which a nonconnective statement over a singular base k would have to track.

### Examples

For (a,b) = (2,3) and k = 𝔽_2, the relative K-groups are `K_0 = 𝔽_2`, `K_2 = W_{{1,5,7}}(𝔽_2) = 𝔽_2³` and `K_4 = W_{T(2,3,2)}(𝔽_2)` with `T(2,3,2) = {1,5,7,11,13}`, so `K_4 = 𝔽_2^5`. The odd groups vanish. Over k = 𝔽_5 the 5-adic index set changes: in degree 4, `T(2,3,2) ∩ J_5 = {1,7,11,13}` with `s_T(1) = #{1,5} = 2`, giving `ℤ/25 ⊕ 𝔽_5³`, again of length 5.

### Dependencies

Layers 1–4. Suppliers: KTheoryFiniteLocalFields §5.1; SchemeKTheoryOperations §5.2; QWittVectors §§1.3–1.5; gaps `perfect-homotopy-invariance` and `bigwitt-ptypical-decomposition`.

## Layer 7: Truncated polynomial algebras over perfectoid rings

### 7.1 TC^- and TP of truncated polynomial algebras

Prove that for every perfectoid ring R and e ≥ 1 there is an equivalence `TC^-(R[x]/x^e,(x);ℤ_p) ≃ ∏_{n≥1, e∤n} Σ^{2⌊(n−1)/e⌋+1}THH(R;ℤ_p)^{hC_{p^{v_p(n)}}} × ∏_{k≥1} Σ^{2(k−1)+1}cofib(V_{e,k})`. Here `V_{e,k} : THH(R;ℤ_p)^{hC_{p^{v_p(k)}}} → THH(R;ℤ_p)^{hC_{p^{v_p(ek)}}}` is the transfer induced by `T/C_k → T/C_{ek}`, and the second product runs over the weights n = ek. The analogous statement holds for TP, with Tate constructions (riggenbach-trunc Lemma 5.2, line 889). Under these equivalences the Frobenius carries weight n into weight pn. The route uses §2.6 (KTheoryFiniteLocalFields §5.16's cofibre sequences), the product decomposition of §2.3, §3.2 and §3.3.

*Needs:* §§2.3, 2.6, 3.2–3.4; KTheoryFiniteLocalFields §5.16.

**Checks.**

- e = 1: the first product is empty, and each `V_{1,k}` is the identity map, so both sides vanish.
- R = 𝔽_p, e = 2, n = 1: the factor is `(ΣTHH(𝔽_p))^{hC_1} = ΣTHH(𝔽_p)`, with π_1 = 𝔽_p. This is the class of x in the relative `TC^-_1`.
- For e = p and k = 1, `V_{p,1}` is the transfer `THH^{hC_1} → THH^{hC_p}`. For R = 𝔽_p it is multiplication by p from ℤ/p to ℤ/p² in degree 0, so its cofibre has π_0 = ℤ/p. Treating the e | n weights like the others would lose this cofibre.

### 7.2 The p-adic K-theory of truncated polynomial algebras

Prove that for every perfectoid ring R, every e ≥ 1 and r ≥ 1, `K_{2r−1}(R[x]/x^e,(x);ℤ_p) ≅ W_{re}(R)/V_eW_r(R)`, with big Witt vectors on {1,…,n}, and that `K_j(R[x]/x^e,(x);ℤ_p) = 0` for every even j (riggenbach-trunc Theorem 1.1 and Corollary 6.5, lines 67 and 1279).

The route: DGM (RefinedTraceMethods §4.17) identifies the relative p-adic K-theory with relative TC, because (x) is nilpotent. §7.1 and §3.4 give the homotopy groups of each factor, in odd degrees only. For each u ∈ J_p, the staircase lemma (§3.5) applies to the weights p^v u with `s = s(p,re,u)`, the unique s with `up^{s−1} ≤ re < up^s`, or 0 if none exists. It yields `W_s(R)` if e′ ∤ u and `W_{min(s,v_p(e))}(R)` if e′ | u, where `e = p^{v_p(e)}e′` (riggenbach-trunc lines 74–99). That index is `s_{T_{r,e}}(u)` for `T_{r,e} = {m ≤ re : e ∤ m}`. Finally §1.2 and gap `bigwitt-ptypical-decomposition` identify `∏_u W_{s_T(u)}(R) ≅ W_{T_{r,e}}(R) ≅ W_{re}(R)/V_eW_r(R)`.

Prove also the syntomic form: for every perfect 𝔽_p-algebra k and i ≥ 1, the reduced syntomic complex `ℤ̃_p(i)(k[x]/x^e) = fib(ℤ_p(i)(k[x]/x^e) → ℤ_p(i)(k))` is `(W_{ei}(k)/V_eW_i(k))[−1]` (sulyma-slopes Theorem 1.1, line 43). Its route: the crystalline comparison (PrismaticCohomologyPartII §4.23) and the PD de Rham model of `Δ_{k[x]/x^e}` with Nygaard filtration the product of the PD-Hodge and p-adic filtrations (PrismaticCohomologyPartII §§3.19, 3.24; CrystallineCohomology CR.2), followed by the explicit diagonalization by monomial degree (sulyma-slopes §3, lines 232–330).

*Needs:* §§1.2–1.3, 3.4–3.5, 7.1; RefinedTraceMethods §4.17; PrismaticCohomologyPartII §§3.19, 3.24, 4.23; PrismaticCohomologyPartIII §7.0; CrystallineCohomology CR.2; gap `bigwitt-ptypical-decomposition`.

**Checks.**

- e = 1: `W_r(R)/V_1W_r(R) = 0`, as for `R[x]/x = R`.
- R a perfect field: the group is `𝕎_{re}(k)/V_e𝕎_r(k)` of KTheoryFiniteLocalFields §5.17, transported by the big Witt comparison of QWittVectors §1.4a. For R = 𝔽_2, e = 2 and r = 1 it is ℤ/2, the principal units `1 + x𝔽_2[x]/x²`. For R = 𝔽_3, e = 2 and r = 2: `T_{2,2} = {1,3}` and the group is `W_2(𝔽_3) = ℤ/9`, not `𝔽_3²`.
- Mixed characteristic: for `R = O_C` (the ring of integers of the completed algebraic closure of ℚ_p), e = 2 and r = 1, the group is `W_{{1}}(O_C) = O_C`. This agrees with relative K_1, the p-completed principal units `1 + xO_C`, which are additively O_C through `1 + ax ↦ a`.

### Examples

For R = 𝔽_p and e = 2 the odd groups are `K_{2r−1}(𝔽_p[x]/x²,(x)) ≅ W_{T_{r,2}}(𝔽_p)` with `T_{r,2}` the odd numbers ≤ 2r. For p odd this is `∏_{u odd, p∤u, u≤2r} W_{s}(𝔽_p)` with s the number of j ≥ 0 such that `up^j ≤ 2r`. For r = 1 it is 𝔽_p, the relative K_1. For R = 𝔽_p and e = p, r = 1, `T_{1,p} = {1,…,p−1}` and `K_1 = 𝔽_p^{p−1}`, which is `(1 + x𝔽_p[x]/x^p)^×`, of order `p^{p−1}`.

### Dependencies

Layers 1–3. Suppliers: RefinedTraceMethods §4.17; KTheoryFiniteLocalFields §§5.16, 5.17 and Conventions; QWittVectors §1.4a; PrismaticCohomologyPartII §§3.19, 3.24, 4.23; PrismaticCohomologyPartIII §7.0; CrystallineCohomology CR.2; AInfCohomology §AI.7.2; gap `bigwitt-ptypical-decomposition`.

## Layer 8: Prismatic and syntomic cohomology relative to δ-rings and of filtered rings

This layer builds the prismatic package of a commutative algebra R over a δ-ring A, both with bounded p^∞-torsion, its syntomic complexes and its filtered variant, with crystalline degeneration. It generalizes the relative prismatic cohomology over a prism (PrismaticCohomology Layers 1–2) and the absolute theory (PrismaticCohomologyPartII Layer 4), and agrees with both. Locators refer to akn-delta v2. akn24 cites the v1 numbering: its "Theorem 1.1", "Corollary 1.2", "Corollary 10.32", "Proposition 10.41" and "Proposition 10.44, Corollary 10.45" are v2's Theorem 1.2, Corollary 1.3, Corollary 10.34, Proposition 10.43, and Proposition 10.46 with Corollary 10.47.

### 8.1 δ-pairs

Define a δ-pair as a δ-ring A with a map of commutative rings A → R. It is bounded if A and R have bounded p^∞-torsion. It is finitely presented free if A is the free δ-ring on finitely many generators and R is a polynomial A-algebra in finitely many variables. A bounded δ-pair is relatively quasisyntomic if R is derived p-complete and `L_{R/A}` has p-complete Tor-amplitude in [0,1]. A δ-pair (A′, R) is pre-prismatic if the kernel of A′ → R contains an invertible ideal I such that, Zariski locally on Spec A′, every generator d of I has δ(d) mapping to a unit of the p-completion of R (akn-delta Definition 2.2, line 307). A bounded δ-pair (A, R) is relatively quasiregular semiperfectoid if R is p-complete and it admits a pre-prismatic factorization: a factorization `A → A′ → R` with A → A′ a p-completely relatively perfect map of δ-rings, (A′, R) pre-prismatic as exhibited by an ideal I ⊆ A′, `A′ → R` surjective and `L_{R/A′}` of p-complete Tor-amplitude in [1,1] (akn-delta line 121 and Definitions 9.1–9.2, lines 1838–1850). Such a pair is relatively quasisyntomic, and replacing A′ by `A′[δ(I)^{−1}]^∧_{(p,I)}` one may take (A′, I) to be a prism (akn-delta Remark 2.3, line 311, and line 1851). Maps of δ-pairs are commuting squares with a δ-map on the first entry.

- The δ-pairs form a category Pairs_δ (akn-delta Definition 2.1, line 296). The bounded δ-pairs form a full subcategory, closed under finite products and under base change `(A,R) ↦ (A′, R ⊗_A A′)` along flat δ-maps A → A′ with A′ bounded: by flatness `(R ⊗_A A′)[p^∞] = R[p^∞] ⊗_R (R ⊗_A A′)`, so a power of p that kills `R[p^∞]` kills it. Infinite products and base change along non-flat δ-maps can leave the bounded δ-pairs (Checks).
- If A is a δ-ring and R an A-algebra, each with bounded p^∞-torsion, then (A,R) is a bounded δ-pair; boundedness of A alone does not suffice (Checks). Examples: (ℤ_p, R) and (W(k), R) for a perfect 𝔽_p-algebra k and any such R, for instance ℤ/p^n, `O_K/ϖ^n`, a p-torsion-free ring or an 𝔽_p-algebra; and the bounded prismatic δ-pairs (A, R), where (A, I) is a prism, A has bounded p^∞-torsion and R is an A/I-algebra with bounded p^∞-torsion (akn-delta Definitions 2.1–2.2 and Remark 2.14, lines 296–310 and 416). Relatively qrsp pairs form a basis of the relatively quasisyntomic pairs for the quasisyntomic topology (akn-delta Proposition 9.14, line 1974).
- The sequence `W(k)⟦z_0⟧ → W(k)⟦z_0,z_1⟧ → ⋯`, the p-complete Amitsur complex of `W(k) → W(k)⟨z_0⟩` with each term completed along the augmentation ideal of `z_i ↦ 0`, and with every δ(z_i) = 0, is a cosimplicial δ-ring. It maps to `O_K/ϖ^n` by z_i ↦ ϖ (akn24 lines 501–507).

*Needs:* PrismaticCohomology §§0.55–0.56 (free δ-rings, limits and colimits), §§0.73–0.76 (prisms, Breuil–Kisin prisms); DerivedDeRhamCohomology Layer 5 (cotangent complex and Tor-amplitude conditions, quasisyntomic sites).

**Checks.**

- `W(k)⟦z⟧` with δ(z) = 0 is a δ-ring, the Breuil–Kisin base. Its map to `O_K` sending z to ϖ makes `(W(k)⟦z⟧, O_K)` a bounded, relatively quasisyntomic δ-pair: `L_{O_K/W(k)⟦z⟧}` is `(E(z))/(E(z))²[1]`.
- Non-example: 𝔽_p carries no δ-structure. From p = 0 one gets `δ(0) = δ(p) = 1 − p^{p−1} = 1` in 𝔽_p, while δ(0) = 0. So (𝔽_p, 𝔽_p) is not a δ-pair, and characteristic-p rings enter only as the second entry.
- `(ℤ_p, ℤ/p^n)` is bounded and relatively quasisyntomic: `L_{(ℤ/p^n)/ℤ_p} = (p^n)/(p^{2n})[1]` has Tor-amplitude in [0,1] after p-completion. `(ℤ_p, ℚ_p)` is a δ-pair but not relatively quasisyntomic, because the derived p-completion of ℚ_p is 0 ≠ ℚ_p.
- Non-example for boundedness: `R = ℤ_p ⊕ M` with `M = ⊕_{n≥1} ℤ/p^n` and `M² = 0` is a ℤ_p-algebra, so `(ℤ_p, R)` is a δ-pair, but the element (0, e_n), with e_n a generator of ℤ/p^n, has exact order p^n for every n, so no power of p kills `R[p^∞]`. For R = ℤ/p^n the exponent p^n works, and ℤ_p has no p-torsion at all.
- `(ℤ_p, 𝔽_p)` is relatively quasiregular semiperfectoid with A′ = ℤ_p and I = (p): `δ(p) = 1 − p^{p−1}` maps to the unit 1 of 𝔽_p, and `L_{𝔽_p/ℤ_p} = (p)/(p²)[1]`. The pair `(ℤ_p, ℤ/p²)` with A′ = ℤ_p meets the other three conditions (the identity is relatively perfect, `ℤ_p → ℤ/p²` is onto and `L_{(ℤ/p²)/ℤ_p} = (p²)/(p⁴)[1]`) but is not pre-prismatic: an invertible ideal inside `p²ℤ_p` is `(p^m)` with m ≥ 2, and for a unit u, `δ(p^m u) = p^{m−1}u − p^{mp−1}u^p` lies in `pℤ_p`, so it is not a unit of ℤ/p². Without the pre-prismatic condition this pair would carry no prism (A′, I), and the agreement property of §8.3 would have nothing to agree with.
- Infinite products and non-flat base change leave the bounded δ-pairs: `∏_n (ℤ_p, ℤ/p^n) = (∏_n ℤ_p, ∏_n ℤ/p^n)` has elements of exact order p^n for every n. For the free δ-ring `A = ℤ_p{y}`, the A-algebra `R = A[z_1, z_2, …]/(y^n z_n : n ≥ 1)` is p-torsion free (as an A-module it is a sum of copies of A and of the `A/y^mA`), but along the δ-map A → ℤ_p with y ↦ p its base change `ℤ_p[z_1, z_2, …]/(p^n z_n : n ≥ 1)` contains z_n of exact order p^n.

### 8.2 Prismatic packages and their syntomic complexes

For a bounded δ-ring A, define first the ∞-category G_A of quadruples (H, N, c, φ) of modules. H is a p-complete and complete `(ℤ,≥) × ℤ`-filtered graded A-module (the Hodge–Tate tower); N is a p-complete and complete filtered graded A-module whose filtration is constant in nonpositive filtration degrees, so that it is indexed by `(ℕ,≥) × ℤ` (the Nygaard-completed Frobenius twist); c is a φ_A-semilinear map `H → sc_p(N)` of `(ℕ,≥) × ℤ`-filtered graded A-modules; and φ is a map of filtered graded A-modules from N to the shearing `sh(H)`, with `sh(H)^{≥m}{i} = H^{≥m−i}{i}`, which lowers the filtration degree by the grading degree (akn-delta Definition 8.1, line 1701; Definition 1.1, line 89, states c without its filtration). G_A is the pullback, along evaluation at the four vertices of two arrows, of the ∞-categories of complete p-complete filtered graded objects of D(A) under the functors H, sh(H), N and `φ_A^*sc_p(N)`. Since sh and sc_p are lax symmetric monoidal for the completed Day convolution, this pullback is an ∞-operad and G_A is symmetric monoidal (akn-delta lines 1680–1713). Define the ∞-category of prismatic packages as `C_A = CAlg(G_A)`, the E∞-algebras in G_A (akn-delta line 1714). Concretely, an object of C_A is a quadruple in which H and N are filtered graded E∞-A-algebras, c is a φ_A-semilinear map of filtered graded E∞-algebras `H → sc_p(N)`, unital and multiplicative up to coherent homotopy, and φ : N → sh(H) is a map of filtered graded E∞-A-algebras; C_A is also the pullback of the ∞-categories of E∞-algebras in the four vertices (akn-delta lines 1714–1717). A quadruple whose c is only a map of modules lies in G_A and need not lie in C_A (Checks). Here `sc_p(N)` is, in each grading, the Day convolution of the rescaled filtration `N^{≥p·⋆}` with the p-adic filtration `p^⋆ℤ` (akn-delta Construction 7.3, line 1557): its m-th piece is assembled from the terms `N^{≥pa} ⊗ p^bℤ` with a + b = m, its 0-th piece is `N^{≥0}`, and modulo p it maps canonically to `N^{≥p·⋆}/p`, the terms with b ≥ 1 going to zero (akn-delta lines 1689–1699). So c restricts to `H^{≥0} → N^{≥0}`, and modulo p it induces `H^{≥m}/p → N^{≥pm}/p` for every m ≥ 0. For i ∈ ℤ, define the syntomic complex `ℤ_p(i)(H,N,c,φ) = fib(can − cφ : N^{≥i}{i} → N^{≥0}{i})`, where cφ is φ into `sh(H)^{≥i}{i} = H^{≥0}{i}` followed by c (akn-delta Definition 8.4, line 1753).

- G_A and C_A have all colimits, and taking associated graded pieces of H and N preserves them (akn-delta Proposition 8.3, line 1745). Colimits in G_A are computed in the underlying filtered graded objects and then completed.
- *Finite-stage formula.* Let i ≥ 0 and (p−1)j > pi, equivalently p(j−i) > j. Modulo p, let `cφ : N^{≥j}{i}/p → N^{≥j−i}{i}/p` be φ into `H^{≥j−i}{i}/p`, then the map `H^{≥j−i}{i}/p → N^{≥p(j−i)}{i}/p` induced by c, then can. It exists only modulo p: the axioms give no integral map `N^{≥j} → N^{≥j−i}`, and followed by can into `N^{≥0}{i}/p` it is the reduction of the integral cφ. Then `can − cφ : N^{≥j}{i}/p → N^{≥j−i}{i}/p` factors, canonically and functorially, as an automorphism of `N^{≥j}{i}/p` followed by `can : N^{≥j}{i}/p → N^{≥j−i}{i}/p`. The reason is that cφ lifts through `N^{≥p(j−i)} → N^{≥j}`, and the identity minus a map that raises the complete filtration is invertible (akn-delta Lemma 8.5 and its proof, lines 1759–1769). The map need not be an equivalence: it is zero on the absolute package of 𝔽_2 at i = 1, j = 3. Hence `𝔽_p(i)(H,N,c,φ) ≃ fib(can − cφ : (N^{≥i}{i}/N^{≥j}{i})/p → (N^{≥0}{i}/N^{≥j}{i})/p)`, where the map on the quotients is the one induced by the comparison square below. The route compares the square with top row the automorphism of `N^{≥j}{i}/p`, right column `can : N^{≥j}{i}/p → N^{≥0}{i}/p`, and bottom row `can − cφ` mod p: the top fibre is zero, so passing to vertical cofibres does not change the horizontal fibre. This is akn-delta Proposition 8.6 (line 1770) with the strict bound (p−1)j > pi of Lemma 8.5 in place of its printed bound (p−1)j ≥ i, which fails in the Checks below.
- The syntomic complexes `ℤ_p(i)` and `𝔽_p(i)`, defined by the same formula on G_A, preserve all limits and all colimits as functors from G_A to `D(ℤ)^∧_p` (akn-delta Corollary 8.7, line 1787). On C_A they preserve all limits and all sifted colimits. The reason is that C_A is the pullback of the ∞-categories of E∞-algebras in the vertices of the pullback defining G_A (akn-delta lines 1714–1717); in each vertex limits and sifted colimits of E∞-algebras are computed underlying (lurie-ha Corollaries 3.2.2.5 and 3.2.3.2), because the completed Day convolution preserves colimits in each variable. They do not preserve all colimits of C_A: its initial object is the unit package (akn-delta Remark 8.2(ii), line 1723), which is not sent to 0. Sifted colimits are what the left Kan extension of §8.4 uses.

*Needs:* DerivedDeRhamCohomology §§1.14–1.17 (filtered objects, their completion and the completed Day convolution); EnhancedDerivedSheaves §§E5:abstract.1–E5:abstract.2 (∞-operads and E∞-algebras), §E5:presentability.2 (limits of presentable ∞-categories along colimit-preserving functors, for the colimits of G_A and C_A); PrismaticCohomologyPartII §§3.9–3.10 (Breuil–Kisin twists and divided Frobenius), §3.20 (Nygaard completion).

**Checks.**

- For A = ℤ_p and R = 𝔽_p in weight 0: the package is the absolute one of 𝔽_p (§8.3 (3)), with `Δ̂_{𝔽_p} = ℤ_p` in degree 0, `N^{≥0}` everything and φ = id, the Frobenius of `W(𝔽_p) = ℤ_p`, which is an isomorphism (PrismaticCohomologyPartII §§4.18 and 4.31, Checks). So `ℤ_p(0)(𝔽_p) = fib(0 : ℤ_p → ℤ_p) = ℤ_p ⊕ ℤ_p[−1]`. This matches `H^*_ét(Spec 𝔽_p; ℤ_p)`, and `TC_{−1}(𝔽_p) = ℤ_p` (§9.1 Checks) through `gr^0TC = ℤ_p(0)`. A definition using can alone would give `fib(id) = 0`.
- Negative control: the absolute package of ℤ_p is not of this form. `Δ_{ℤ_p}` is Nygaard-complete, because ℤ_p is p-torsion free and `ℤ_p/p = 𝔽_p` is regular noetherian (PrismaticCohomologyPartII §4.29), and its Frobenius is not an isomorphism: its cofibre is `ℤ_p[−1]` (PrismaticCohomologyPartII §4.31, Checks). A model `Δ̂_{ℤ_p} = ℤ_p` with φ = id has cofibre 0 and is excluded; in particular the unit package of `C_{ℤ_p}` below is not the prismatic package of ℤ_p.
- For the absolute package of 𝔽_2 (`Δ̂ = ℤ_2`, `N^{≥n} = 2^nℤ_2`, `cφ = φ/2`) and i = 1, the map `can − cφ` sends 2a to a, so `ℤ_2(1)(𝔽_2) = 0`, as it must be since `𝔽_2^×` is trivial. With j = 3 (so (p−1)j = 3 > pi = 2), `can : N^{≥3}/2 → N^{≥2}/2` is zero (`8b ∈ 2·4ℤ_2`). The mod-p cφ factors through `can : N^{≥4}/2 → N^{≥2}/2`, which is also zero, so `can − cφ = 0 = can ∘ id` there. The top row of the comparison square is an automorphism with zero fibre, and the finite-stage formula gives 0 again. The naive reduction of the integral divided Frobenius `8ℤ_2 → 4ℤ_2`, `8b ↦ 4b`, is nonzero in `N^{≥2}/2 = 4ℤ_2/8ℤ_2` for b odd, and no automorphism α makes `can ∘ α = 0` equal to it. So the factorization needs the filtered structure of c, and fails for a package whose c is only a map `H^{≥0} → N^{≥0}`. With j = 1, allowed by the printed bound (p−1)j ≥ i, it gives `fib(0 → (ℤ_2/2ℤ_2) ⊗^L 𝔽_2) = 𝔽_2 ⊕ 𝔽_2[−1] ≠ 0`.
- For the Breuil–Kisin pair `(ℤ_2⟦z⟧, ℤ_2)` with z ↦ 2, E(z) = z − 2, p = 2 and i = 1, `ℤ_2(1) = fib(E·ℤ_2⟦z⟧ → ℤ_2⟦z⟧, fE ↦ fE − φ(f))` (akn24 line 2337, with p − 1 = 1), which modulo 2 is `fz ↦ fz + f²` on `k⟦z⟧`, k = 𝔽_2. Directly: H⁰ = k (from f = z) and H¹ = k², since the image is cut out by b₀ = b₁ and b₂ = 0. The formula with j = 3 has source `⟨z, z²⟩`, target `k⟦z⟧/z³`, and sends z ↦ 1 + z, z² ↦ 0, so H⁰ = k and H¹ = k², as it must. With j = 2, allowed by the printed bound but not by (p−1)j > pi, the source `⟨z⟩` maps injectively into `k⟦z⟧/z²`, giving H⁰ = 0 and H¹ = k, which is wrong. A target quotient by `N^{≥j−i}` instead of `N^{≥j}` gives, for j = 3, the map `⟨z, z²⟩ → k⟦z⟧/z²` with H⁰ = k and H¹ = k, also wrong.
- For the zero object of G_A (all objects zero), every syntomic complex is zero, as preservation of the empty colimit requires; the zero package is also the terminal object of C_A, consistent with preservation of the empty limit. The unit package of `C_{ℤ_p}` (the trivial filtration on ℤ_p in weight 0, c the canonical map, φ = id) is initial in `C_{ℤ_p}`, and `ℤ_p(0)` sends it to `fib(id − id = 0 : ℤ_p → ℤ_p) = ℤ_p ⊕ ℤ_p[−1] ≠ 0`. So the syntomic functors do not preserve all colimits on C_A, only the sifted ones.
- G_A versus C_A: over A = ℤ_p take H = N = ℤ_p in grading 0 with the step filtration at 0, φ = id and c = 2·id. This is an object of `G_{ℤ_p}`, since c is a ℤ_p-linear map of filtered modules into `sc_p(N)`, whose 0-th piece is ℤ_p. It is not an object of `C_{ℤ_p}`, because c(1) = 2 ≠ 1, so c is not unital. Its syntomic complex is `ℤ_p(0) = fib(id − 2·id) = fib(−id) = 0`, whereas the unit package, with c = id, gives `ℤ_p ⊕ ℤ_p[−1]`. A definition of C_A that asked c to be only a map of modules would admit it.

### 8.3 Prismatic cohomology relative to a δ-ring

Construct, functorially in bounded δ-pairs (A, R), the prismatic package `Δ_{R/A} = (Δ^{[⋆]}_{R/A}{⋆}, N^{≥⋆}Δ̂^{(1)}_{R/A}{⋆}, c, φ) ∈ C_A`, whose c is a natural φ-semilinear multiplicative filtered map `Δ^{[⋆]}_{R/A}{⋆} → sc_p(N^{≥⋆}Δ̂^{(1)}_{R/A}{⋆})`. On transversal oriented prisms it refines the semilinear map to the Nygaard completion, because `φ_A(d) = d^p + pδ(d)` lies in filtration 1 of the target (akn-delta Lemma 7.5, line 1579). Here `Δ^{[n]}_{R/A}{i}` is the global sections over WCart of the prismatic crystal whose value on a transversal prism (B,J) is the derived relative prismatic cohomology `Δ^{rel,[n]}_{R⊗̂B/A⊗̂B}{i}` (akn-delta §1.2, lines 184–197). Prove the properties of akn-delta Theorem 1.2 (line 126):

1. Insensitivity to localization at elements of A invertible in R, and to derived (p,K)-completion of A for a finitely generated K ⊆ ker(A → R) and derived p-completion of R.
2. If (A, I) is a prism with A of bounded p^∞-torsion and R is an A/I-algebra with bounded p^∞-torsion (a bounded prismatic δ-pair, §8.1), then `Δ_{R/A}` agrees naturally with Bhatt–Scholze's derived prismatic cohomology of R relative to (A, I), the (p, I)-completed left Kan extension of PrismaticCohomology §§2.1–2.13; by (1) both depend only on the derived p-completion of R (akn-delta Theorem 1.2(2), where R is an algebra over A/I by the convention of line 54; Remark 2.14, line 416). A prism structure on A alone is not enough: R must be killed by I.
3. For A = ℤ_p, or A = W(k) with k a perfect 𝔽_p-algebra, it is the absolute prismatic cohomology of PrismaticCohomologyPartII §4.18, and the Frobenius twist is equivalent to `Δ_{R/A}`.
4. Left Kan extension from finitely presented free δ-pairs.
5. p-completely quasisyntomic descent in R for fixed A, on the relatively quasisyntomic δ-pairs (A, R) of §8.1 (akn-delta Theorem 1.2(5) and Definition 9.1, lines 144 and 1838).
6. p-completely quasismooth descent in A for fixed R, on the relatively quasisyntomic δ-pairs (A, R) of §8.1 (akn-delta Theorem 1.2(6), line 146).
7. Base change: for every δ-map A → A′ to a bounded δ-ring such that `R ⊗^L_A A′` is discrete with bounded p^∞-torsion (for instance A → A′ flat, §8.1), `Δ_{R/A} ⊗_A A′ → Δ_{R⊗_AA′/A′}` is an equivalence after completing the source for the Hodge–Tate filtration, and likewise for the Nygaard-completed term. The condition keeps the base change inside the bounded δ-pairs on which the functor is constructed; akn-delta states (7) for animated R ⊗_A A′ (lines 148 and 473–474).
8. Invariance under p-adically relatively perfect maps A → A′.

The functor is uniquely determined by (4), (6) and the following agreement property, and alternatively by (4), (5) and it: on relatively quasiregular semiperfectoid pairs (A, R) with a chosen prism `(A′, I)` of a pre-prismatic factorization, `Δ_{R/A}` agrees, naturally in the choice, with Bhatt–Scholze's derived prismatic cohomology `Δ_{R/A′}` (akn-delta line 1991 and Proposition 9.15, line 2010). Prove the δ-conjugate filtration: the Hodge–Tate cohomology `Δ̄_{R/A}{i}` (the weight-zero piece `Δ^{[0]}_{R/A}{i}/Δ^{[1]}_{R/A}{i}` of the Hodge–Tate tower) has an exhaustive increasing filtration with `gr_u ≃ LΩ^u_{R/A} ⊗ fib(i − u : ℤ_p → ℤ_p)[−u]` (akn-delta Proposition 1.6 = Proposition 3.9, line 200). Prove that when `L_{R/A}` has p-complete Tor-amplitude in [0,1], `Δ_{R/A}` is computed by the relative prismatic site (akn-delta Theorem 1.7(1), line 211).

*Needs:* §§8.1–8.2; PrismaticCohomology §§1.2–1.4 and 2.1–2.13 (relative and derived prismatic cohomology, prismatic envelopes); PrismaticCohomologyPartII §§4.4–4.10 (WCart, its points, fibre products and prismatic crystals), §4.17 (relative prismatic complexes of animated rings), §§4.18–4.19, §4.22 (diffracted Hodge complex), §§4.25, 4.29, 4.31 (absolute Nygaard filtration and Frobenius); DerivedDeRhamCohomology Layer 5.

**Checks.**

- For A = R = ℤ_p and i = 0, only u = 0 occurs, and `gr_0 = fib(0 : ℤ_p → ℤ_p) = ℤ_p ⊕ ℤ_p[−1]`. This is the absolute Hodge–Tate cohomology of ℤ_p, on which the Sen operator acts by 0 in weight 0. A filtration with graded pieces `LΩ^u[−u]` alone would give ℤ_p, the Hodge–Tate cohomology relative to a prism, not the absolute one.
- For A = W(k)⟦z⟧ and R = O_K, property (2) applies to the Breuil–Kisin prism `(W(k)⟦z⟧, E(z))`, and `Δ_{O_K/W(k)⟦z⟧} = W(k)⟦z⟧` because O_K is the reduction modulo E(z).
- Property (2) needs R to be an A/I-algebra. For the prism (ℤ_p, (p)) and R = 𝔽_p it gives the crystalline cohomology `Δ_{𝔽_p/ℤ_p} = ℤ_p`, in agreement with (3), since the absolute prismatic cohomology of 𝔽_p is ℤ_p. For R = ℤ_p, p maps to p ≠ 0, so R is not a ℤ_p/(p)-algebra and (2) says nothing; (3) applies instead and gives the absolute prismatic cohomology of ℤ_p, whose Hodge–Tate cohomology in weight 0 is `ℤ_p ⊕ ℤ_p[−1]` (first Check), not the ℤ_p of a theory relative to a prism.
- Property (8): `ℤ_p → W(𝔽_q)` is relatively perfect, so `Δ_{R/ℤ_p} ≃ Δ_{R/W(𝔽_q)}` for every `W(𝔽_q)`-algebra R. This is the identification `Δ_{R/ℤ_p} ≃ Δ_{R/W(k)}` used for `O_K/ϖ^n` (akn24 line 498).

### 8.4 Relative syntomic complexes

Define the relative syntomic complexes `ℤ_p(i)(R/A) = fib(can − cφ : N^{≥i}Δ̂^{(1)}_{R/A}{i} → Δ̂^{(1)}_{R/A}{i})` for i ∈ ℤ (akn-delta Definition 7.8, line 1599). Prove the following.

- They satisfy descent along maps of bounded δ-pairs `(A,R) → (B,S)` with A → B flat and R → S faithfully flat: the map from `ℤ_p(i)(R/A)` to the totalization over the Čech nerve `(B^{⊗_A(•+1)}, S^{⊗_R(•+1)})`, a cosimplicial diagram of bounded δ-pairs, is an equivalence (akn-delta Corollary 1.3 = Corollary 7.10, line 1607, in the form of lines 165–170). The flatness of A → B keeps the Čech nerve of the base among δ-rings; akn-delta's version with only R → S of universal descent and no condition on A → B passes through prismatic cohomology relative to animated δ-rings, which is not constructed here (Scope).
- They are left Kan extended from finitely presented free δ-pairs (akn-delta Corollary 1.4 = Corollary 8.9, line 1812).
- They vanish for i < 0 (akn-delta Corollary 8.10, line 1824).
- For A = ℤ_p they are the syntomic complexes of PrismaticCohomologyPartIII §6.8 (akn-delta Remark 7.9, line 1604).

*Needs:* §§8.2–8.3; PrismaticCohomologyPartIII §§6.8–6.9, 6.31.

**Checks.**

- `ℤ_p(1)(R/ℤ_p)` is the derived p-completion of `G_m(R)[−1]` for local R. For R = ℤ/4 its H¹ is `(ℤ/4)^× = ℤ/2`.
- For i = −1 the complex vanishes, while the Breuil–Kisin twisted prismatic cohomology `Δ_R{−1}` does not. The vanishing comes from the Nygaard condition, not from the twist.
- The flatness condition is used. For A = ℤ_p⟦x⟧ with δ(x) = 0, B = ℤ_p via x ↦ 0 (a δ-map, since δ(0) = 0) and R = S = 𝔽_p, the map R → S is the identity, but A → B is not flat: the Koszul resolution `A →^x A` of B gives `Tor_1^A(B,B) = ℤ_p`, so the derived Čech nerve of A → B has `π_1(B ⊗^L_A B) = ℤ_p` and is not a diagram of δ-rings, while the ordinary tensor product `B ⊗_A B = ℤ_p` loses this class. The descent used in Layer 9, along `(W(k), R) → (W(k)⟦z_0⟧, R)` with R → R the identity, has W(k) → W(k)⟦z_0⟧ flat, and after the completion allowed by §8.3 (1) its Čech nerve is the Amitsur complex `A^•` of §8.1.
- For A = W(k)⟦z_0⟧ and R = O_K, `ℤ_p(p−1)(O_K/A)` is `fib(W(k)⟦z_0⟧·d^{p−1} → W(k)⟦z_0⟧)`, with `f·d^{p−1} ↦ f d^{p−1} − φ(f)` for d = E(z_0) (akn24 Proposition 4.24, line 1399, and line 2337). The map is not zero, so a version using can alone would give the wrong H⁰.

### 8.5 Filtered prismatic cohomology

Define the following (akn-delta Definitions 10.2–10.10, lines 2105–2136). A filtered abelian group is strict if each `F^mM → F^{m_0}M` is injective. A filtered δ-ring is a strict filtered commutative ring F^⋆A with a δ-structure on A = F^0A, compatible with the filtration in the sense that δ carries `F^m` into `F^{pm}`. A filtered prism is a filtered δ-ring F^⋆A with a prism structure (A, I) on A = F^0A such that each graded piece `gr^iA` is `I ⊗_A gr^0A`-torsion free and `I ⊗_A gr^0A`-complete; then `(gr^0A, I ⊗_A gr^0A)` is a prism. For a filtered δ-ring with a prism structure this holds if and only if the flat filtration `A/I ⊗_A F^⋆A` on A/I (akn-delta Definition 10.8) is strict (akn-delta Definition 10.6 and Remark 10.9, lines 2116–2135). A filtered δ-pair is a filtered δ-ring with a map of filtered rings to F^⋆R. Construct the filtered prismatic package `F^⋆Δ_{R/A}` by descent along `Spf Rees(F^⋆A) → F Spf A`, and the filtered syntomic complexes `F^{≥⋆}ℤ_p(i)(R/A)` (akn-delta Definition 10.29 and Construction 10.44, lines 2301 and 2530). Prove the following.

- *Base change to the fibres.* Call a filtered δ-pair F^⋆A → F^⋆R relatively quasisyntomic if both filtrations are strict and the p-completed Rees algebras form a relatively quasisyntomic δ-pair `(Rees(F^⋆A)^∧_p, Rees(F^⋆R)^∧_p)` in the sense of §8.1; equivalently, A → R and `(⊕_m gr^mA)^∧_p → (⊕_m gr^mR)^∧_p` are relatively quasisyntomic (akn-delta Definition 10.32 and Remark 10.33, lines 2381–2385). For such a pair there are natural equivalences: at the generic fibre, the underlying object `F^{−∞}Δ_{F^⋆R/F^⋆A}` of the filtration is `Δ_{R/A}`, with no completion; at the special fibre, `gr^⋆Δ_{F^⋆R/F^⋆A} ≃ Δ_{gr^⋆R/gr^⋆A}`, the prismatic package of the graded δ-pair gr^⋆A → gr^⋆R; and the Rees module `Rees(F^⋆Δ_{F^⋆R/F^⋆A})`, completed along the Hodge–Tate tower, is `Δ_{Rees(F^⋆R)/Rees(F^⋆A)}` (akn-delta Corollary 10.34 and Proposition 10.46, lines 2386–2394 and 2583–2587). Hence `gr^⋆ℤ_p(i)(F^⋆R/F^⋆A) ≃ gr^⋆ℤ_p(i)(gr^⋆R/gr^⋆A)` and `F^0ℤ_p(i)(F^⋆R/F^⋆A) ≃ ℤ_p(i)(F^0R/F^0A)` for every i (akn-delta Corollary 10.47, line 2588). The route: `F^⋆Δ_{R/A}` is formed by descent along the Čech nerve of `Spf Rees(F^⋆A) → F Spf A`, and its fibres are computed by base change for the prismatic package (§8.3 (7)) along the δ-maps `Rees(F^⋆A) → A` (t ↦ 1) and `Rees(F^⋆A) → gr^⋆A` (t ↦ 0), where t is the Rees parameter. By strictness, t and t − 1 are nonzerodivisors on `Rees(F^⋆R)`, so both derived base changes are discrete, equal to R and gr^⋆R. The Hodge–Tate completion is needed on the Rees side only, because the p-completed Rees construction need not be complete for the Hodge–Tate filtration (akn-delta Remark 10.36, line 2401).
- *Filtered envelopes.* For an oriented filtered prism (F^⋆A,(d)) and a filtered Koszul-regular sequence (d, x_1, …, x_c), the filtered prismatic envelope `F^⋆A{x_1/d, …, x_c/d}^∧` is a filtered prism representing the final object of the filtered relative prismatic site, and `F^⋆Δ_{R/A}` is equivalent to it (akn-delta Proposition 10.43, line 2489). In particular it is discrete.

*Needs:* §§8.1–8.4, in particular §8.3 (7); PrismaticCohomology §0.93 and §2.13 (envelopes over orientable prisms); DerivedDeRhamCohomology §§1.14–1.17 (filtered objects, their completion and the Rees description).

**Checks.**

- For the trivial filtration (F^m = 0 for m > 0), the filtered package is constant and `gr^⋆` is concentrated in weight 0. A filtered theory that ignored the base filtration would differ already for `W(k)⟦z⟧` with z in weight 1.
- For F^⋆ the z-adic filtration on `W(k)⟦z⟧` and R = k⟦z⟧, the associated graded pair is `(W(k)[z], k[z])`, graded with z of weight 1. Corollary 10.47 identifies `gr ℤ_p(i)` with the graded syntomic complexes of `k[z]` over `W(k)[z]`.
- The filtered Breuil–Kisin prism: `W(k)⟦z⟧` with the z-adic filtration and I = (E(z)) has `gr^uA ≅ W(k)·z^u` for u ≥ 0 and `I ⊗_A gr^0A = (p) ⊆ W(k)`; each `W(k)` is p-torsion free and p-complete, so it is a filtered prism (akn-delta Example 10.7, lines 2121–2124). For the trivial filtration on a prism (A, I) the condition reduces to A being I-torsion free and I-complete, which is part of being a prism, so the graded conditions carry content only in positive weights; there, by Remark 10.9, they amount to strictness of the flat filtration on A/I, which a filtered δ-ring with a prism structure need not have.
- A filtered δ-ring must have `δ(F^m) ⊆ F^{pm}`, not merely F^m. For z of weight 1, `δ(z) = 0` is allowed, while `δ(z) = 1` is not, since 1 has weight 0 < p.
- Base change on the filtered Breuil–Kisin pair: `F^⋆A = W(k)⟦z⟧` with the z-adic filtration and `F^⋆R = O_K` with the ϖ-adic filtration, z ↦ ϖ. Both filtrations are strict, `L_{O_K/W(k)⟦z⟧} = (E)/(E²)[1]` and, on associated gradeds, `L_{k[z]/W(k)[z]} = (p)/(p²)[1]`, so the pair is relatively quasisyntomic. The special fibre gives `gr^⋆Δ_{O_K/W(k)⟦z⟧} ≃ Δ_{k[z]/W(k)[z]}`. Both sides are `W(k)·z^u` in weight u: on the left, the z-adic graded pieces of `Δ_{O_K/W(k)⟦z⟧} = W(k)⟦z⟧` (§8.3 (2)); on the right, the z-graded pieces of `Δ_{k[z]/W(k)[z]} = W(k)[z]^∧_p`, by §8.3 (1)–(2) for the crystalline prism `(W(k)[z]^∧_p, (p))`. The generic fibre gives back `W(k)⟦z⟧`.

### 8.6 Crystalline degeneration and completeness

Prove crystalline degeneration (akn24 Proposition 2.6, line 325). Let F^⋆R and F^⋆S be filtered rings that are quasisyntomic in the filtered sense: their p-completed Rees algebras are quasisyntomic over the p-completed Rees algebra of the trivially filtered ℤ_p. An equivalence `gr^⋆R ≃ gr^⋆S` of associated graded rings induces equivalences `gr^⋆_FΔ_R ≃ gr^⋆_FΔ_S` and `gr^⋆_Fℤ_p(i)(R) ≃ gr^⋆_Fℤ_p(i)(S)` for every i. This is §8.5 with A = ℤ_p trivially filtered.

Prove completeness (akn24 Proposition 2.11 and Lemma 2.12, lines 357 and 381). If F^⋆R is a complete filtered ring that is the filtered quotient of the completion of a finitely generated filtered polynomial ring by a filtered regular sequence, then the F-adic filtration on ℤ_p(i)(R) is complete. The route uses the finite-stage formula (§8.2), the conjugate filtration of absolute Hodge–Tate cohomology through the diffracted Hodge complex (PrismaticCohomologyPartII §4.22), and completeness of the derived forms `LΩ^j_{R/ℤ_p}`.

Prove the comparison of completions (akn24 Theorem 2.20, line 457). For a filtered prismatic δ-pair: (1) if F^⋆R is complete and `L_{R/A}` is a perfect filtered R-module, the Nygaard completion of `Δ^{(1)}_{R/A}` is F-complete; (2) if `gr^0R` is smooth over `gr^0A`, the F-completion is Nygaard-complete.

*Needs:* §§8.2–8.5; PrismaticCohomologyPartII §§4.22, 4.29; DerivedDeRhamCohomology Layer 2 (derived de Rham and its Hodge pieces).

**Checks.**

- `O_K/ϖ^n` with the ϖ-adic filtration and `𝔽_q[z]/z^n` with the z-adic filtration have the same associated graded `𝔽_q[z]/z^n`. Degeneration therefore identifies `gr_Fℤ_p(i)(O_K/ϖ^n)` with `gr_Fℤ_p(i)(𝔽_q[z]/z^n)`, although `ℤ_p(i)(ℤ/p²) ≇ ℤ_p(i)(𝔽_p[z]/z²)` in general. For i = 1 both have H¹ of order p, but `K_3` differs: `K_3(ℤ/4;ℤ_2) = ℤ/8` while `K_3(𝔽_2[z]/z²;ℤ_2)` is `W_4(𝔽_2)/V_2W_2(𝔽_2) = W_{{1,3}}(𝔽_2) = 𝔽_2²` by §7.2.
- Completeness needs a complete filtered ring. Syntomic complexes are formed on p-complete rings (PrismaticCohomologyPartIII §6.8), so take `ℤ_p⟨z⟩` with the z-adic filtration, which is separated but not complete. The F-adic filtration on `ℤ_p(1)(ℤ_p⟨z⟩)` is not complete. Its completion has the same graded pieces as `ℤ_p(1)(ℤ_p⟦z⟧)`, whose H¹ contains the p-completed principal units `1 + zℤ_p⟦z⟧`, in particular 1 + z. In contrast `H¹(ℤ_p(1)(ℤ_p⟨z⟩))` is the p-completion of `ℤ_p⟨z⟩^× = {Σ a_n z^n : a_0 ∈ ℤ_p^×, a_n ∈ pℤ_p for n ≥ 1, a_n → 0}`, which contains 1 + pz but not 1 + z.
- For `R = O_K/ϖ^n` with the ϖ-adic filtration, R is the quotient of `W(k)⟦z⟧` (complete, z of weight 1) by the filtered regular sequence `(E(z), z^n)`, so completeness applies. Combined with §9.2 it reduces ℤ_p(i)(R) to the finitely many F-weights 1 ≤ j′ ≤ in − 1.

### Examples

For R = ℤ/p^n over the Breuil–Kisin pair (ℤ_p⟦z⟧, z ↦ p), the relative prismatic cohomology `Δ_{R/ℤ_p⟦z⟧}` is the prismatic envelope `ℤ_p⟦z⟧{z^n/E(z)}^∧` with E(z) = z − p. Its filtered version is discrete with an explicit W(k)-basis (§9.4).

### Dependencies

Suppliers only: PrismaticCohomology §§0.55–0.56, 0.73–0.76, 0.93, 1.2–1.4, 2.1–2.13; PrismaticCohomologyPartII §§3.9–3.10, 3.20, 4.4–4.10, 4.17–4.19, 4.22, 4.25, 4.29, 4.31; PrismaticCohomologyPartIII §§6.8–6.9, 6.31; DerivedDeRhamCohomology §§1.14–1.17 and Layers 2 and 5; EnhancedDerivedSheaves §§E5:abstract.1–E5:abstract.2, E5:presentability.2.

## Layer 9: K-theory of finite chain rings

Throughout, `R = O_K/ϖ^n` is a finite chain ring with invariants (p, e, f, n), q = p^f and `j = ⌈n/e⌉` (Conventions); F-weights are written j′, as in §1.5. Every quotient of O_K by a nonzero proper ideal has this form, and `ℤ/p^n = ℤ_p/p^n` is the case e = f = 1.

### 9.1 Reduction to syntomic cohomology

Prove the following.

- `K(R;ℤ[1/p]) → K(𝔽_q;ℤ[1/p])` is an equivalence (akn24 Corollary 2.3, line 279). The route: for every prime ℓ ≠ p, the pair (R, ϖR) is henselian with ℓ invertible, so Gabber rigidity gives `K(R)/ℓ ≃ K(𝔽_q)/ℓ` (KTheoryFiniteLocalFields §2.1). Rationally, `K(R,ϖR) ⊗ ℚ ≃ ΣHC(R ⊗ ℚ, ϖR ⊗ ℚ) = 0` because `R ⊗ ℚ = 0` (RefinedTraceMethods §4.17, Goodwillie). Hence the relative term is p-primary torsion with vanishing mod-ℓ reductions.
- `K_r(R;ℤ_p) → TC_r(R)` is an isomorphism for r ≥ 0 (akn24 Corollary 2.5, line 295). This follows from DGM for the nilpotent ideal ϖR (RefinedTraceMethods §4.17), together with the fact that `K(𝔽_q;ℤ_p) → TC(𝔽_q)` is (−2)-truncated (KTheoryFiniteLocalFields §§1.1–1.6 and 5.1).
- `gr^i TC(R;ℤ_p) ≃ ℤ_p(i)(R)[2i]` for the motivic filtration (PrismaticCohomologyPartIII §7.0).

*Needs:* RefinedTraceMethods §4.17; KTheoryFiniteLocalFields §§1.1–1.6, 2.1, 5.1; PrismaticCohomologyPartIII §7.0.

**Checks.**

- n = 1: R = 𝔽_q, and every statement reduces to Quillen's `K_{2i−1}(𝔽_q) = ℤ/(q^i − 1)`, `K_{2i}(𝔽_q) = 0`. In particular `K_{2i−1}(𝔽_q;ℤ_p) = 0`, since p ∤ q^i − 1.
- `K_1(ℤ/4) = (ℤ/4)^× = ℤ/2`, which is 2-primary, while `K_1(𝔽_2) = 0`. The prime-to-2 parts agree, as the first statement requires.
- Degree −1: `TC_{−1}(𝔽_q) = ℤ_p ≠ 0` while `K_{−1}(𝔽_q) = 0`. So the second statement is limited to r ≥ 0.

### 9.2 Bounded syntomic cohomology of finite chain rings

Prove the following for i ≥ 1, with the ϖ-adic filtration F on R.

- For `R_0 = 𝔽_q[z]/z^n` with its z-adic filtration, `Δ̂_{R_0}` and its Nygaard filtration are computed by the p-completed divided-power de Rham complex of `W(𝔽_q)[z]` along (z^n), with the product of the PD-Hodge and p-adic filtrations, compatibly with the grading (akn24 Lemma 2.8, line 344). For F-weights j′ ≥ 1, `gr^{j′}_FΔ̂_{R_0} ≅ W(𝔽_q)/{j′,n}[−1]` and `gr^{j′}_FN^{≥i}Δ̂_{R_0} ≅ W(𝔽_q)/p^{ε(i,j′)}{j′,n}[−1]`. Here {j′,n} is n if n | j′ and j′ otherwise, and ε is the function of §1.5 (akn24 line 437; sulyma-slopes §3).
- `gr^{j′}_Fℤ_p(i)(R)` lies in cohomological degrees [1,2] and vanishes for j′ = 0 and for j′ ≥ in. The F-adic filtration on ℤ_p(i)(R) is complete. Hence `ℤ_p(i)(R) ≃ F^{[1,in−1]}ℤ_p(i)(R)`, concentrated in cohomological degrees 1 and 2 (akn24 Corollaries 2.13–2.14, lines 388–399).
- `K_{2i−1}(R;ℤ_p) ≅ H¹(ℤ_p(i)(R))` for i ≥ 1, and `K_{2i−2}(R;ℤ_p) ≅ H²(ℤ_p(i)(R))` for i ≥ 2. The motivic spectral sequence degenerates and has no extensions, for degree reasons (akn24 Corollary 2.16, line 408).
- Every `K_r(R)` with r ≥ 1 is finite. Its prime-to-p part is that of K_r(𝔽_q) by §9.1. Its p-adic part is finite because H¹ and H² of a complex of finitely generated ℤ_p-modules with torsion cohomology are finite. A p-primary torsion group whose derived p-completion has finite homotopy in every degree has no divisible part, since a divisible part would contribute a nonzero Tate module one degree up.

*Needs:* §§1.5, 7.2, 8.6, 9.1; PrismaticCohomologyPartII §§3.19, 3.24, 4.23; CrystallineCohomology CR.2; PrismaticCohomologyPartIII §7.0; StableHomotopyKTheory §7.11 (the Tate-module term in the homotopy of a p-completion, for the finiteness statement).

**Checks.**

- n = 1, i = 1: the window [1, in − 1] = [1, 0] is empty, so ℤ_p(1)(𝔽_q) = 0. Indeed `𝔽_q^×` is prime to p.
- R = ℤ/4, i = 1: H¹ = ℤ/2 = K_1(ℤ/4;ℤ_2), and H² = 0, consistent with `K_0(ℤ/4;ℤ_2) = ℤ_2` being carried by weight 0. The upper end of the window is sharp: here it is [1,1], and the smaller window [1, in − 2] = [1,0] is empty and would give 0 instead of H¹ = ℤ/2. The lower end may be taken to be 0 or 1, since `gr^0_Fℤ_p(i)(R) ≃ 0` for i ≥ 1 (akn24 Corollaries 2.13(iii) and 2.14, lines 391 and 398).
- The table values of akn24 (line 144) satisfy the finiteness statement: `K_3(ℤ/8) = ℤ/3 ⊕ ℤ/4 ⊕ ℤ/8` and `K_5(ℤ/8) = ℤ/7 ⊕ ℤ/2 ⊕ ℤ/2^6`. The prime-to-2 parts ℤ/3 = K_3(𝔽_2) and ℤ/7 = K_5(𝔽_2) are as §9.1 requires.

### 9.3 Angeltveit's quotient

Prove that for i ≥ 1, `|H¹(ℤ_p(i)(R))| / |H²(ℤ_p(i)(R))| = q^{i(n−1)}`. Hence `|K_{2i−1}(R;ℤ_p)| / |K_{2i−2}(R;ℤ_p)| = q^{i(n−1)}` for i ≥ 2 (akn24 Proposition 2.18 and Proposition 1.5, lines 419 and 162). The route: by §9.2 the Euler characteristic of `ℤ_p(i)(R) = fib(can − φ : F^{[1,in−1]}N^{≥i}Δ̂_R{i} → F^{[1,in−1]}Δ̂_R{i})` is computed on F-graded pieces. By crystalline degeneration (§8.6) these are the pieces of `𝔽_q[z]/z^n`, whose orders differ by `q^{ε(i,j′)}` in F-weight j′. The count of §1.5 gives `Σ_{j′} ε(i,j′) = i(n−1)`.

*Needs:* §§1.5, 8.6, 9.2.

**Checks.**

- ℤ/4, i = 2: `|K_3(ℤ/4;ℤ_2)| = 8` and `|K_2(ℤ/4)| = 2`, ratio `4 = 2^{2·1}` (akn24 line 144).
- ℤ/8, i = 2: `|K_3(ℤ/8;ℤ_2)| = 4·8 = 32` and `|K_2(ℤ/8)| = 2`, ratio `16 = 2^{2·2}`. For i = 3: `|K_5(ℤ/8;ℤ_2)| = 2·64 = 128` and `|K_4(ℤ/8)| = 2`, ratio `64 = 2^{3·2}`.
- `𝔽_2[z]/z³` (n = 3), i = 3: `|K_5;ℤ_2| = 4·16 = 64` and `K_4 = 0`, ratio `64 = 2^{3·2}`. A ratio `q^{in}` would give 2^9.

### 9.4 Relative-to-absolute descent and the finite free model

Let `A^• = W(k)⟦z_0⟧ ⇉ W(k)⟦z_0,z_1⟧ ⋯` be the completed Amitsur complex of §8.1, filtered with every z_i of weight 1 and δ(z_i) = 0, mapping to R by z_i ↦ ϖ. Prove the following.

- *Descent.* The maps `F^{≥⋆}Δ_{R/W(k)}{i} → Tot F^{≥⋆}Δ_{R/A^•}{i}`, the analogous map for `F^{≥⋆}N^{≥i′}Δ̂^{(1)}{i}` at every Nygaard level i′, and `F^{[m_1,m_2]}ℤ_p(i)(R) → Tot F^{[m_1,m_2]}ℤ_p(i)(R/A^•)` for i ≥ 1 and every interval [m_1, m_2] ⊂ ℤ are equivalences (akn24 Theorem 2.22, line 515). On F^0 this is the descent of §8.4 along the flat map W(k) → A^0.
- *Discreteness and bases.* Each `F^{≥⋆}Δ_{R/A^s}`, `F^{≥⋆}N^{≥i}Δ̂^{(1)}_{R/A^s}` and `F^{≥⋆}Δ̂^{(1)}_{R/A^s}` is discrete (akn24 Proposition 2.23, line 532), and for every interval [m_1, m_2] ⊂ ℤ the pieces `F^{[m_1,m_2]}` are finite free W(k)-modules with the following bases (akn24 Propositions 2.24, 3.33 and 3.34, lines 537, 1037 and 1070). Put d = E(z_0) ∈ A^s. By §8.3 (2) and PrismaticCohomology §2.13, `Δ_{R/A^s}` is the prismatic envelope `A^s{a, b_1, …, b_s}^∧` with `d·a = z_0^n` and `d·b_v = z_v − z_0` for 1 ≤ v ≤ s. In the F-filtration a has weight n and b_v weight 1, so `δ^u(a)` has weight np^u and `δ^u(b_v)` weight p^u.
  - A W(k)-basis of `F^{[m_1,m_2]}Δ_{R/A^s}` consists of the monomials `z_0^k ∏_{u≥0} δ^u(a)^{e_u} ∏_{u≥0, 1≤v≤s} δ^u(b_v)^{e_{u,v}}` with `0 ≤ k < n`, finitely many nonzero exponents, `0 ≤ e_u < p` and `0 ≤ e_{u,v} < p` for all u and v, and F-weight `k + nΣ_u p^u e_u + Σ_{u,v} p^u e_{u,v}` in [m_1, m_2].
  - Let `d_N ∈ N^{≥1}Δ̂^{(1)}_{R/A^s}` be d placed in Nygaard filtration 1 (akn24's d̃, not the element φ(d) of §3.4). Let `f_u ∈ F^{≥np^u}N^{≥p^u}Δ̂^{(1)}_{R/A^s}` and `g_{u,v} ∈ F^{≥p^u}N^{≥p^u}Δ̂^{(1)}_{R/A^s}` be the Nygaard generators attached to the relations z_0^n and z_v − z_0, characterized by `φ_{p^u}(f_u) = δ^u(a)` and `φ_{p^u}(g_{u,v}) = δ^u(b_v)` for the divided Frobenius `φ_{p^u} : N^{≥p^u}Δ̂^{(1)}_{R/A^s} → Δ_{R/A^s}` (akn24 Construction 3.21 and Corollary 3.23, lines 883 and 906). A W(k)-basis of `F^{[m_1,m_2]}N^{≥i}Δ̂^{(1)}_{R/A^s}` consists of the elements `d_N^w z_0^k ∏_u f_u^{e_u} ∏_{u,v} g_{u,v}^{e_{u,v}}` with the same conditions on k, `e_u` and `e_{u,v}`, the same F-weight condition, and `w = max(0, i − Σ_u p^u e_u − Σ_{u,v} p^u e_{u,v})`.
  - The input is a presentation of δ-ideals in an oriented prism (B, d). For x, r ∈ B put `λ_0 = −1/δ(d)`, `R_0 = δ(r)/δ(d)`, `λ_{u+1} = λ_u^p/(1 − δ(d^{p^{u+1}}λ_u))` and `R_{u+1} = (δ(R_u) + w_1(d^{p^{u+1}}λ_uδ^{u+1}(x), R_u))/(1 − δ(d^{p^{u+1}}λ_u))`, where `w_1(y, y′) = (y^p + y′^p − (y + y′)^p)/p`, so that `δ(y + y′) = δ(y) + δ(y′) + w_1(y, y′)`. Then every λ_u is a unit, R_u is a polynomial in x, δ(x), …, δ^u(x) in which δ^u(x) occurs with exponent < p, and the δ-ideal generated by dx − r is generated as an ideal by dx − r and the elements `δ^u(x)^p − (−p + d^{p^{u+1}}λ_u)δ^{u+1}(x) − R_u` for u ≥ 0 (akn24 Lemma 3.6, line 670). In the Nygaard filtration the same recursion gives `f_u^p = (−p + λ_u d^{p^{u+1}}) f_{u+1} + d_N^{p^{u+1}} R′_u` in `N^{≥p^{u+1}}Δ̂^{(1)}_{R/A^s}`, with `R′_u = 0` for the relation z_0^n because δ(z_0^n) = 0, and likewise for the `g_{u,v}` (akn24 Lemma 3.24, Remark 3.29, Proposition 3.30 and Corollary 3.31, lines 914, 983, 984 and 1008).
- *Breuil–Kisin orientations.* A prism is orientable if and only if it admits a Breuil–Kisin orientation `s : B → B{1}`. Crystalline prisms have a crystalline orientation, and complete filtered-crystalline prisms are orientable (akn24 Lemmas 4.6, 4.7, 4.10 and 4.13–4.15, lines 1204–1306). With an orientation, the relative syntomic complexes of R over A^s are computed with trivialized twists (akn24 Proposition 4.24, line 1399).
- *Finite model.* For i ≥ 1, `ℤ_p(i)(R)` is the total fibre of the square formed by `can − φ` on `F^{[1,in−1]}N^{≥i}Δ̂^{(1)}_{R/A^0}{i}` and on the kernel of `d_0 − d_1 + d_2` on the level-1 term (akn24 Theorem 2.27, line 576). Equivalently, by the connection `∇` of the Hopf algebroid `(Δ̂_{R/A^0}, Δ̂_{R/A^1})`, it is the total fibre of `can − φ` and `can − φ^∇` between `∇`-sources and `∇`-targets (akn24 Lemma 4.43 and Corollary 4.44, lines 1644 and 1664). Consequently `ℤ_p(i)(R)` is quasi-isomorphic to a three-term complex `ℤ_p^{f(in−1)} → ℤ_p^{2f(in−1)} → ℤ_p^{f(in−1)}` of finite free ℤ_p-modules in cohomological degrees 0, 1, 2, with injective first differential (akn24 Theorem 1.1, line 108, structurally).

*Needs:* §§8.1–8.6, 9.2; PrismaticCohomology §§0.73–0.76, 0.93, 2.13; PrismaticCohomologyPartII §§3.6, 3.9.

**Checks.**

- n = 1 (R = 𝔽_q), i = 1: f(in − 1) = 0, so the model is zero, matching ℤ_p(1)(𝔽_q) = 0.
- ℤ/4, i = 1: f(in − 1) = 1, so the model is `ℤ_2 → ℤ_2² → ℤ_2` with injective first map. Its H¹ ⊕ H² has total order 2, consistent with H¹ = ℤ/2, H² = 0 and Angeltveit's quotient `2 = 2^{1·1}`.
- The digit bound e_u < p is essential. At p = 2 the relation for u = 0 reads `a² = (−2 + d²λ_0)δ(a) + R_0` with R_0 = 0, so a² is a multiple of δ(a), both of F-weight 2n, and a basis allowing e_0 = 2 would count that weight twice.
- The bound k < n is a different condition from the digit bound. For p = 2, n = 3, s = 0 and the interval [2,2], the unique basis vector of `F^{[2,2]}Δ_{R/A^0}` is z_0², which a bound k < p would exclude, giving rank 0 instead of 1. For the interval [3,3] and i = 1, the unique basis vector of `F^{[3,3]}N^{≥1}Δ̂^{(1)}_{R/A^0}` is f_0 (k = 0, e_0 = 1, w = 0); dropping k < n would add `d_N z_0³` (k = 3, w = 1) and give rank 2 instead of 1.

### 9.5 The even vanishing theorem

Prove that if i ≥ 2 and `i − 1 ≥ B(p,e,n)`, with B the threshold of §1.5, then `K_{2i−2}(R) = 0` (integrally) and `K_{2i−1}(R)` has order `(q^i − 1)·q^{i(n−1)}` (akn24 Theorem 5.2, Corollary 5.6 and Theorem 1.4, lines 2074, 2091 and 156). The route is as follows.

1. Nilpotence modulo p in the Frobenius-twisted envelope over A^0 = W(k)⟦z⟧, with z = z_0, d = E(z), and d_N and f_u as in §9.4 (akn24 Lemmas 5.7–5.9 and Corollary 5.10, lines 2105–2163). For n ≥ 2 and j = ⌈n/e⌉: (a) `z^{p[j]_p e − p^j(je − n)} = 0` in `Δ̂^{(1)}_{R/A^0}/p`, while `z^{p[j]_p e − p^j(je − n) − 1} ≠ 0` there; (b) for every i ≥ p^j − 1, `z^{[j]_p e − p^{j−1}(je − n)}·d_N^i = 0` in `N^{≥i}Δ̂^{(1)}_{R/A^0}/p`, while `z^{[j]_p e − p^{j−1}(je − n) − 1}·d_N^i ≠ 0` there. For every u ≥ j, `f_u^p = μ_u·p·f_{u+1}` in `N^{≥p^{u+1}}Δ̂^{(1)}_{R/A^0}` for a unit μ_u. The route iterates the relation `f_u^p = (−p + λ_u d^{p^{u+1}}) f_{u+1}` of §9.4 with d ≡ z^e up to a unit modulo p, and detects the nonvanishing on the bases of §9.4.
2. A prismatic Cartier isomorphism: the Frobenius twist identifies the ∇-rows of the descent model (akn24 Theorem 5.12, Lemma 5.15, lines 2169 and 2197).
3. Divisibility of can by p under the threshold, so that can − φ is surjective in cohomological degree 2 (akn24 Lemma 5.16, line 2219).

The integral statement uses §9.1 for the prime-to-p part, and the order statement uses §9.3 and `|K_{2i−1}(𝔽_q)| = q^i − 1`.

*Needs:* §§1.5, 9.1, 9.3, 9.4; KTheoryFiniteLocalFields §§1.1–1.6.

**Checks.**

- n ≤ e (so R ≅ 𝔽_q[z]/z^n): j = 1 and B = p²n/((p−1)e). Since `𝔽_q[z]/z^n = O_K/ϖ^n` for K with arbitrarily large e, the theorem gives `K_{2i−2}(𝔽_q[z]/z^n) = 0` for every i ≥ 2 (akn24 Corollary 5.5, line 2084). This agrees with KTheoryFiniteLocalFields §5.17 and §7.2 here, where the even relative groups vanish.
- Step 1 for ℤ/4 (p = 2, e = 1, n = 2, so j = 2 and [2]_2 = 3): the exponent in (a) is 2·3·1 − 4·(2 − 2) = 6, so z⁶ = 0 and z⁵ ≠ 0 modulo 2; the exponent in (b) is 3 − 2·0 = 3, so `z³d_N^i = 0` and `z²d_N^i ≠ 0` modulo 2 for every i ≥ 3. For n ≤ e (j = 1) the exponent in (a) is pe − p(e − n) = pn.
- ℤ/4: B = 12, so `K_{2i−2}(ℤ/4) = 0` for i ≥ 13, and `|K_{2i−1}(ℤ/4)| = (2^i − 1)2^i` there. The table shows the stronger fact that `K_2(ℤ/4) = ℤ/2` is the only nonzero even group, and `|K_5(ℤ/4)| = 56 = 7·8` (akn24 Example 1.7, line 172).
- The weaker bound `p²(p^j − 1)/(p−1)²` of akn24 Remark 5.4 does not give the characteristic-p case: for j = 1 it is p²/(p−1) ≥ 4 independently of e, so it never covers i = 2. The exact threshold is therefore part of the statement.

### 9.6 Nilpotence of v₁

Prove that the class `v₁ ∈ H⁰(𝔽_p(p−1)(ℤ_p))` acts on `⊕_{i∈ℤ} 𝔽_p(i)(R)` with nilpotence degree at most `[j]_p`, with equality if e | n. For `ℤ/p^n` the degree is exactly `[n]_p = (p^n − 1)/(p − 1)` (akn24 Theorem 6.3 and Theorem 1.8, lines 2330 and 197). The route: locate v₁ in `H⁰(𝔽_p(p−1)(O_K/A^0))` through the relative-to-absolute descent sequence. Using the oriented description `ℤ_p(p−1)(O_K/A^0) = fib(W(k)⟦z_0⟧·d^{p−1} → W(k)⟦z_0⟧)` of §8.4, identify v₁ with the class `v = d^p` up to a unit. For n ≥ 2, prove `v^{[j]_p} = 0` in `N^{≥[j]_p(p−1)}Δ̂^{(1)}_{R/W(k)⟦z⟧}/p`, and `v^{[j]_p−1} ≠ 0` when e | n (akn24 Proposition 6.2, line 2321). For n = 1 the statement is the first Check below.

*Needs:* §§8.4, 9.4, 9.5 (Lemmas 5.7–5.9); PrismaticCohomologyPartIII §7.0 (multiplicative motivic filtration).

**Checks.**

- n = 1: [1]_p = 1, so v₁ acts by zero on `⊕_i 𝔽_p(i)(𝔽_q)`, which is concentrated in weight 0, where `𝔽_p(0)(𝔽_q) = 𝔽_p ⊕ 𝔽_p[−1]`, and v₁ shifts weight by p − 1. This is consistent: v₁ maps to zero in `𝔽_p(p−1)(𝔽_q) = 0`.
- ℤ/4: [2]_2 = 3, so v₁³ acts by zero and v₁² does not. Here e = 1 divides n = 2, so equality holds.
- For K with e = 2 and n = 3: j = 2, so the bound is [2]_p = p + 1, but e ∤ n, so only the inequality is asserted. Claiming equality there would go beyond akn24 Remark 1.10 (line 206).

### Examples

For ℤ/4: K_1 = ℤ/2, K_2 = ℤ/2, K_3 = ℤ/3 ⊕ ℤ/8, K_4 = 0, K_5 = ℤ/7 ⊕ ℤ/8 (akn24 line 144). Angeltveit's quotient at i = 2 is 8/2 = 4 = 2², and the order formula `(2^i − 1)2^i` at i = 3 gives 56. For `𝔽_2[z]/z³`, `K_3 = ℤ/3 ⊕ ℤ/2 ⊕ ℤ/8` and `K_4 = 0`; the 2-part of K_3 is `W_6(𝔽_2)/V_3W_2(𝔽_2) = W_{{1,2,4,5}}(𝔽_2)`. By §7.2 and the 2-typical decomposition (d = 1: {1,2,4}, d = 5: {5}) this is `W_3(𝔽_2) ⊕ W_1(𝔽_2) = ℤ/8 ⊕ ℤ/2`, as in the table. Likewise `K_1 = W_{{1,2}}(𝔽_2) = ℤ/4` and the 2-part of K_5 is `W_{{1,2,4,5,7,8}}(𝔽_2) = ℤ/16 ⊕ ℤ/2 ⊕ ℤ/2`, both matching akn24 line 144.

### Dependencies

Layers 1, 7 and 8. Suppliers: RefinedTraceMethods §4.17; KTheoryFiniteLocalFields §§1.1–1.6, 2.1, 5.1, 5.17; PrismaticCohomology §§0.73–0.76, 0.93, 2.13; PrismaticCohomologyPartII §§3.6, 3.9, 3.19, 3.24, 4.23; PrismaticCohomologyPartIII §7.0; CrystallineCohomology CR.2; StableHomotopyKTheory §7.11.

## Downstream consumers

The calculations are built for the following consumers.

- Non-A¹-invariant motivic cohomology of singular schemes, whose motivic refinements of the coordinate axes, cusps and truncated polynomials are bouis-motivic §§2–3. Layers 5–7 are the weight-graded targets of its motivic spectral sequences.
- The p-adic K-theory of `O_K` through continuity: `K(O_K;ℤ_p) ≃ lim_n K(O_K/ϖ^n;ℤ_p)` (RefinedTraceMethods §4.18) together with Layer 9 gives the finite-level groups whose limit is KTheoryFiniteLocalFields Layer 6.

## References

Locators cite the line-numbered extractions of the versions below as `<source id> line N`, with theorem and page numbers from the same version. All statements above are paraphrases.

- **akn24**: Benjamin Antieau, Achim Krause, Thomas Nikolaus, *On the K-theory of ℤ/p^n*, arXiv:2405.04329v1 (2024).
- **akn-delta**: Benjamin Antieau, Achim Krause, Thomas Nikolaus, *Prismatic cohomology relative to δ-rings*, arXiv:2310.12770v2 (7 May 2026). Locators use v2 numbering; akn24 cites v1.
- **amm-perfectoid**: Benjamin Antieau, Akhil Mathew, Matthew Morrow, *The K-theory of perfectoid rings*, arXiv:2203.06472 (2022). Proposition 5.1 (K ≃ KH for smooth algebras over perfect 𝔽_p-algebras).
- **hesselholt-axes**: Lars Hesselholt, *On the K-theory of the coordinate axes in the plane*, arXiv:math/0508251v2; Nagoya Math. J. 185 (2007), 93–109.
- **hesselholt-cusp-polytopes**: Lars Hesselholt, *On the K-theory of planar cuspical curves and a new family of polytopes*, arXiv:1303.6060v2; Contemp. Math. 620 (2014), 145–182.
- **hn-cusp**: Lars Hesselholt, Thomas Nikolaus, *Algebraic K-theory of planar cuspidal curves*, arXiv:1903.08295v2 (2019).
- **speirs-axes**: Martin Speirs, *On the K-theory of coordinate axes in affine space*, arXiv:1901.08550v2; Algebr. Geom. Topol. 21 (2021), 137–171.
- **speirs-trunc**: Martin Speirs, *On the K-theory of truncated polynomial algebras, revisited*, arXiv:1901.10602v3 (2019).
- **riggenbach-trunc**: Noah Riggenbach, *K-theory of truncated polynomials*, arXiv:2211.11110v2 (2022).
- **riggenbach-double**: Noah Riggenbach, *On the algebraic K-theory of double points*, arXiv:2007.01227v2; Algebr. Geom. Topol. 22 (2022), 373–403.
- **riggenbach-cusp**: Noah Riggenbach, *K-theory of cuspidal curves over a perfectoid base and formal analogues*, arXiv:2203.17136 (2022). Its §2 (line 152) records how homotopy invariance over a perfectoid base enters the cusp calculation.
- **sulyma-slopes**: Yuri J. F. Sulyma, *Floor, ceiling, slopes, and K-theory*, arXiv:2110.04978v2; Ann. K-Theory 8 (2023), 331–354.
- **bouis-motivic**: Tess Bouis, *On the motivic cohomology of some singular rings*, arXiv:2608.05220v1 (2026).
- **bach-hypersurfaces**: Jorge Alberto Guccione, Juan José Guccione, María Julia Redondo, Orlando Eugenio Villamayor, *Hochschild and cyclic homology of hypersurfaces*, Adv. Math. 95 (1992), 18–60; the mixed complex of `k[x,y]/(y^a − x^b)`, cited through hn-cusp Theorem 1.
- **lurie-ha**: Jacob Lurie, *Higher Algebra*, author-page version of September 18, 2017. Corollaries 3.2.2.5 and 3.2.3.2 (limits and sifted colimits of E∞-algebras are computed underlying).
- **larsen-mixed**: Michael Larsen, *Filtrations, mixed complexes, and cyclic homology in mixed characteristic*, K-Theory 9 (1995), 173–198; cited through hn-cusp Theorem 1.
