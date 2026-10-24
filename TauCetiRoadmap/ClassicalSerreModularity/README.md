# Roadmap: Serre's modularity conjecture over ℚ

**Summary.** This roadmap proves Serre's modularity conjecture in its strong form. Let `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` be continuous, odd and absolutely irreducible. Then `ρ̄` arises from a normalised newform of weight `k(ρ̄)`, level `N(ρ̄)` and a character lifting `ε(ρ̄)`: there are such a newform `f`, a prime `λ` above `p` of its coefficient field, and an isomorphism between `ρ̄` and the reduction of `ρ_{f,λ}`. This is Khare–Wintenberger's theorem. Its proof runs through Khare's level-one theorem, and the roadmap also gives the shorter qualitative proof of Dieulefait–Pacetti. Both proofs end in one public statement.

EllipticCurveModularity uses the finite-flat weight-two case: an absolutely irreducible residual representation that is finite at `p ≥ 5` with cyclotomic determinant comes from a weight-two newform of level `N(ρ̄)` and trivial character. The roadmap also proves weight-one modularity by descent: every odd irreducible two-dimensional Artin representation of `G_ℚ` is the representation attached to a weight-one newform.

The build is organised in three strands.

```text
classical seed (R26):
  prescribed lifts and compatible systems in conductor one
  -> prime estimates and the weight recursion
  -> ordinary and degenerate branches, the terminal weights up to 32
  -> Khare's level-one theorem, Corollary 1.2, and the start (W₁)

classical induction (R27):
  good-dihedral primes and the Chebotarev choice of auxiliary primes
  -> (W_r) ⇒ (L_r) and (L_r) ⇒ (W_{r+1})
  -> raising levels: (D_r) removes the good-dihedral hypothesis
  -> characteristic two and even conductor through Hypothesis (H)
  -> the strong form, its finite-flat export and weight one

modern qualitative proof (R33):
  a weight-two system -> a prescribed dihedral type at an auxiliary prime N
  -> remove the odd level -> change the type at 2 and remove 2
  -> remove N -> the level-one system in characteristic five
  -> the odd-characteristic theorem -> characteristic two
  -> the strong form, through the same refinement as the classical route
```

The roadmap is an application roadmap. It owns the specific arguments of Khare, Khare–Wintenberger and Dieulefait–Pacetti: the weight recursion, the conductor induction, the dyadic reductions, the chain of compatible systems and the weight-one descent. The general machinery is specified by the arithmetic suppliers and Layer I: Galois representations and their conductors, deformation rings, modularity lifting theorems, potential modularity and compatible systems, Serre weights, weight and level optimisation, and the small-ramification base cases. Each input has the contract specified under Exact supplier contracts or in the layers below.

Headline statements in [`Suggested.lean`](Suggested.lean) express qualitative Serre modularity, level-one modularity and semisimple finiteness, auxiliary-prime density, and Artin weight-one modularity on pinned newform and Galois carriers. The exact Serre invariants, finite-flat weight-two export, prescribed lifts, compatible systems, geometric forms and weight-one descent require the arithmetic and geometric objects specified here, with their hypotheses and source locators. Names in the targets describe library interfaces to build; the compiled declarations are listed under Suggested Lean forms.

## Scope and ownership

### Owned here

- The rational-field Khare–Wintenberger constructions of Layer I: arithmetic global finiteness and point extraction in I.2, the four prescribed lifts, families through those lifts, and residual links with their lifting hypotheses in I.3. These are shared exports. Representation, deformation and compatibility interfaces come from the named suppliers. The full-scope ordinary dihedral argument and the globalisation independence requirement are included as proof targets.
- Khare's level-one theorem with the exact meaning of "arises from", its application of Böckle's presentation, the prescribed lifts in conductor one and their compatible systems (R26.1–R26.2).
- The prime estimates of the weight recursion: elementary prime intervals, the consecutive-prime ratio, the finite-range auxiliary-prime estimate, the weight-interval containment and the well-founded induction on the weight bound (R26.3, R27.2).
- The ordinary, reducible, bad-dihedral and solvable branches of the level-one step, and the terminal table of weights `8` to `32` (R26.4–R26.5).
- The level-one assembly, Corollary 1.2 (prime conductor, weight two) with its corrected proof, the finiteness of level-one representations, and Corollary 8.1(ii), which starts the conductor induction (R26.6).
- The good-dihedral predicate of Khare–Wintenberger Definition 2.1, its image lemma, Khare–Wintenberger Lemmas 6.1 and 6.2 as the classical strand applies them (solvable dyadic images are dihedral; dihedral modularity at the optimal weight and level; the weights of bad-dihedral representations), the Chebotarev choice of auxiliary primes and the insertion of a good-dihedral prime (R27.1).
- The hypotheses `(L_r), (W_r), (D_r)` and the theorems linking them: weight reduction, killing ramification, the initial case, raising levels and the dyadic closure (R27.2–R27.5).
- The strong form of Serre's conjecture, its finite-flat weight-two export, Theorem 10.1(i) for regular compatible systems, and weight-one modularity of odd Artin representations with its three ingredients (R27.6).
- The Dieulefait–Pacetti chain Paso 1 to Paso 6, the dihedral local type at an auxiliary prime, the order-three type at `2`, the qualitative theorem in every characteristic, the comparison of the two notions of modularity, and the comparison of the two proofs (R33.1–R33.6).

### Arithmetic and geometric boundaries

| Owner | Interface used here |
| --- | --- |
| ArithmeticGaloisRepresentations Layers 1–5 and [§6.1](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation) | Continuous representations of `G_ℚ` and of local Galois groups, lattices and reduction, inertia and Frobenius, local class field theory for characters, the Artin conductor with its wild part and monodromy term, Dickson's classification with the dyadic refinement, bad-dihedral representations, recognition by characteristic polynomials, and the basis-free elliptic action `TateModule.residualRep E p` with its scalar extension and matrix realization. |
| DeformationAndDerivedPatchingAlgebra §§1.9, 3.4–3.5 and 3.14 | Finite-equation continuous formal presentations, regular-sequence ideals, absolute local complete intersections, dimension and flatness criteria, and the formal/relative comparison. I.2 specializes these shared interfaces to the coefficient DVR and the arithmetic deformation rings. |
| GlobalGaloisDeformations R04.3, [R04.6 §6.7](../GlobalGaloisDeformations/README.md#hecke-galois-datum) and [§6.8](../GlobalGaloisDeformations/README.md#hecke-galois-points), and LocalGaloisDeformationRings Layers 2 and 8 | The local-to-global presentation of global deformation rings; `HeckeGaloisDatum` and its unframed classifying surjection `R → T`, with trace generation and the prescribed local and determinant conditions; reconstruction from jointly injective characteristic-zero points; minimally ramified local lifting rings; the crystalline, ordinary, endpoint and Barsotti–Tate exports at `p` with their dimensions; the exports at `ℓ ≠ p`, including the level-two inertia-rigid condition. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.24a, R07.3–R07.5 and R07.5.6a | `GaloisModel`, `HasFiniteFlatModel` and the coefficient-independent `IsFiniteFlatResidual` at odd `p`; Fontaine–Laffaille tame inertia weights, the crystalline Hodge–Tate `{0,1}` to Barsotti–Tate comparison, and the integral classification of Breuil–Mézard and Savitt for tame potentially Barsotti–Tate types. |
| `AlgebraicModularFormsAndSerreWeights:R15.1`–`R15.6`, including [S-type and modularity predicates](../AlgebraicModularFormsAndSerreWeights/README.md#target-s-type-arises-from-and-modular) | Katz forms and their analytic comparison, base change and finite generation of spaces of forms, Hecke operators with torsion coefficients, the Deligne–Serre lifting lemma, Serre's local weight recipe including `p = 2`, the bad-dihedral weight lemma, and the definitions of S-type, `N(ρ̄), k(ρ̄), ε(ρ̄)`, `TauCeti.ResidualModularity.ArisesFrom` and `IsModular`, with the integral-model and coefficient-prime comparisons. |
| `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `R17.6` | Langlands–Tunnell and Rohrlich–Tunnell: solvable and dyadic dihedral residual modularity. |
| `AlgebraicModularFormsAndSerreWeights §R15.5A.3` | The Deligne–Serre representation of a weight-one eigenform. |
| SerreWeightAndLevelOptimisation Layers 3–6 | `θ`-operators, Edixhoven's weight theorem, Gross's companion forms and the local shape of ordinary and supersingular eigenforms; Carayol's change of nebentypus; Buzzard's dyadic level lowering and the dyadic multiplicity-one obstruction; Ribet–Edixhoven optimisation. |
| SmallRamificationAndAbelianVarietyBaseCases Layers 2, 4 and 5 | Tate and Serre in characteristics `2` and `3`, Schoof's theorem, `GL₂`-type abelian varieties with descent, Snowden's realisation and reduction control, the level-one dihedral classification and the terminal case tables. §5.0d owns the arbitrary-rank raw carrier `AutomorphicSystemData`, its operations and Frobenius/Weil–Deligne and Hodge-sign adapters, and its marked rank-two specialization `ArithmeticCompatibleFamily`; §§5.1–5.4 supply marked isogeny and base-change transports for the realizations. AutomorphicGaloisRepresentations §7.1 supplies the almost-strict predicate on these shared data. |
| [Chebotarev, Layer 10][cheb] | Dirichlet density of the primes whose Frobenius lies in a given union of conjugacy classes, and infinitude of every Frobenius class. |
| [ClassFieldTheory, Layer 13][cft] | Kronecker–Weber and the classification of abelian characters by conductor. |
| [ModularForms, Layers 4–5][mf] | Layer 4 supplies primitive/newform decomposition and the conductor; Layer 5 supplies fixed-space and cross-level strong multiplicity one, including weight one. |
| AutomorphicGaloisRepresentations §§3.10–3.14, 4.4, 4.7, 6.8–6.12, 7.1 and 7.3 | General-weight Hilbert attachments, their arithmetic-dual normalization, Hodge–Tate and local Weil–Deligne comparisons, the integral Hecke-valued arithmetic representation with conditions on the whole family for GlobalGaloisDeformations R04.6's classifying map, the almost-strict predicate and transport API on shared system data (§7.1), and fixed-eigenform compatible families. |
| HilbertModularVarietiesAndShimuraCurves H1, §§H6.2–H6.5, H6.9 and R18.3 | The HBAV moduli problem, paired torsion twist, selected geometrically irreducible component and real and finite local loci under the supplier's input hypotheses; integral quaternionic Hecke modules and algebras. |

Each change of prime in the proofs below checks the exact contract of the supplier it uses: the residual image condition, the local type, the coefficient field and the ramification set. A weight recipe never stands in for the integral classification, and a solvable image never stands in for ordinarity.

### Consumers and boundaries

- `EllipticCurveModularity:R29.2` uses the finite-flat weight-two export of R27.6.
- PotentialModularityAndCompatibleSystems uses `I.2/full-kw-global-finiteness` and I.2's characteristic-zero point extraction for its Layers 8–10; `I.3/prescribed-lifts` for its §§10.5–10.9; `I.3/families-through-prescribed-lifts` for its §12.4; and `I.3/residual-links-and-modularity-transfer` for the classical branch of its §13.3. It owns the additional base-field and rank generalizations, the all-place strict-family upgrades and the transfers with additional de Rham lifting hypotheses; these retain their stronger hypotheses. The generic presentation and complete-intersection interfaces remain with DeformationAndDerivedPatchingAlgebra.

### Outside this roadmap

The general theorem for irregular compatible systems is outside this roadmap. Other base fields, representations of dimension greater than two, the general construction of attached Galois representations, local classifications, deformation theory and modularity lifting theorems are owned by the suppliers above. Katz weight-one forms in residue characteristic two and Edixhoven's strong form at `p = 2` are not part of the strong theorem here. Corollary 10.2(i) of Khare–Wintenberger, modularity of `GL₂`-type abelian varieties over `ℚ`, follows from Theorem 10.1(i) together with Faltings' isogeny theorem and is outside this roadmap.

## Conventions

### 2.1 Representations

`G_ℚ = Gal(ℚ̄/ℚ)` carries its Krull topology. As in EllipticCurveModularity, `GQ` in the representative signatures is the unfolded automorphism group `AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ`, the body of Mathlib's `Field.absoluteGaloisGroup ℚ`, so Tau Ceti's actions on algebraic integers and elliptic torsion apply directly. Fix embeddings `ℚ̄ → ℂ` and, for every prime `p, ι_p : ℚ̄ → ℚ̄_p`. A *residual representation* is a continuous homomorphism `ρ̄ : G_ℚ → GL₂(𝔽), 𝔽` a finite field of characteristic `p`, or its extension to `𝔽̄_p`. Continuity means that the kernel is open. *Odd* means `det ρ̄(c) = −1` for a complex conjugation `c`; in characteristic two it is automatic. Irreducibility over an algebraically closed field is absolute irreducibility. A residual representation is *of S-type* if it is continuous, odd and absolutely irreducible.

Lemma 8.2 of Khare–Wintenberger (R27.1), and the insertion step that applies it, are the only statements in the roadmap whose coefficients must be the prime field `𝔽_p`. Every use of it first arranges an `𝔽_p`-valued representation, by choosing the coefficient prime to split completely in the coefficient field.

Always distinguish the inertia group `I_q`, the decomposition group `D_q` and their images in `PGL₂`. The *projective image* of `ρ̄` is the image of `G_ℚ` in `PGL₂(𝔽̄_p)`.

### 2.2 Serre's invariants

- `N(ρ̄)` is the Artin conductor of `ρ̄` away from `p`, a positive integer prime to `p`; *level* means `N(ρ̄)`.
- `k(ρ̄)` is Serre's weight, defined by his local recipe at `p`, with `k(ρ̄) ≥ 2`. For `p = 2, k(ρ̄) ∈ {2, 4}`, and `k(ρ̄) = 4` exactly when `ρ̄|_{D₂}` is *très ramifiée*.
- `ε(ρ̄)` is the character with `det ρ̄ = ε(ρ̄) χ̄_p^{k(ρ̄)−1}, χ̄_p` the mod-`p` cyclotomic character.
- `ρ̄` *arises from* a newform `f` of positive weight `k` in the sense of AlgebraicModularFormsAndSerreWeights R15.6's coefficient-defined `TauCeti.ResidualModularity.ArisesFrom`. For continuous absolutely irreducible `ρ̄`, its integral-model comparison gives a prime `λ` above `p` of the coefficient field of `f` (relative to `ι_p`) and an integral model of `ρ_{f,λ}` whose reduction is isomorphic to `ρ̄`, with compatible residue embeddings. Conductor `N(ρ̄) = 1` does not say that the `p`-adic lift is unramified at `p`.
- `ρ̄` is *modular* if it arises from a newform of some weight `k ≥ 2` and some level. Dieulefait–Pacetti phrase modularity with an eigenform in `S_k(Γ₀(N), ε), k ≥ 2`; R33.6 proves the two notions equivalent, so the roadmap has one notion of modularity.

AlgebraicModularFormsAndSerreWeights R15.6, [S-type and modularity predicates](../AlgebraicModularFormsAndSerreWeights/README.md#target-s-type-arises-from-and-modular), owns `TauCeti.ResidualModularity.ArisesFrom` and its comparisons. The trace/determinant interface follows the Imperial College London FLT project. In `Suggested.lean`, `TauCeti.SerreConjecture.ArisesFrom` is its consumer spelling on `HeckeRing.GL2.Newform N k`, with the same coefficient ring map and arithmetic Frobenius identities. Here `coeff f n` reads the Fourier expansion and `coefficientRing f` is the subring of `ℂ` generated by all coefficients and zero-extended nebentypus values. One ring homomorphism to `FpBar p` kills `p` and gives unramifiedness and the trace and determinant identities at every prime `ℓ ∤ pN`. The determinant formula uses `χ_f(ℓ) ℓ^(k−1)` for `k ≥ 1`; all residual modularity statements require `k ≥ 2`. For S-type representations the supplier's integral-model comparison identifies this with the integral-model reading; without semisimplicity only the semisimplification is determined. The consumer comparison must preserve basis invariance and the supplier's integral-closure congruence comparison on these carriers. The integral-prime comparison also supplies the prime and residue map for elliptic Serre witnesses. The coefficient-map extension needs no additional weight bound: the same exponent `k.toNat - 1` occurs on both sides.

**Checks.**

- Every newform has `coeff f 1 = 1` and `coeff f 0 = 0`, by normalization and cuspidality. For `Δ = q∏(1−q^n)^24`, all coefficients are integral and the character is trivial, so `coefficientRing Δ = ℤ` inside `ℂ`; its map to `𝔽̄_p` is uniquely the reduction of integers.
- Ramanujan's congruence `τ(ℓ) ≡ 1 + ℓ^11 (mod 691)` gives `ArisesFrom (1 ⊕ χ̄₆₉₁^11) Δ`. Thus attachment alone does not imply irreducibility or recover extension data; the S-type hypothesis makes the attached semisimplification an actual isomorphism class of irreducible representations.
- For the level-`11`, weight-`2` form with trivial character, `a₂ = −2`. At `p = 3` the required trace and determinant at arithmetic Frobenius `2` are `1` and `2`. The action on `11a1[3]` has these values, whereas the trivial rank-two action has `2` and `1` and fails `ArisesFrom`.
- Fix a coefficient map `φ` and put `d = φ(χ_f(ℓ))ℓ^(k−1)` at a good prime. If `d² ≠ 1`, the contragredient has determinant `d⁻¹ ≠ d` and cannot satisfy attachment through this same map. Failure of the existential `ArisesFrom` requires excluding every coefficient map. For the preceding rational-coefficient form at `p = 7, ℓ = 2`, the map is unique and the dual determinant `4` differs from the required `2`.
- The [level-`23`, weight-`2` newform](https://www.lmfdb.org/ModularForm/GL2/Q/holomorphic/23/2/a/a/) has coefficient field `ℚ(√5)` and `a₂² + a₂ − 1 = 0`. At the split prime `p = 11`, its two coefficient maps give traces `3` and `7` at Frobenius `2`. The two reductions are non-isomorphic but both satisfy `ArisesFrom ρ f`, using different maps.

For `p ≥ 5`, finiteness at `p` is the supplier's `IsFiniteFlatResidual` from FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.6a, using `GaloisModel` and `HasFiniteFlatModel` of §R07.1.24a. It asserts that a finite coefficient model of the actual local representation has a finite flat commutative group scheme over `ℤ_p`, its coefficient-field action and a coefficient-linear Galois-equivariant points identification. The supplier proves independence of the model and invariance under finite coefficient extension; finite flatness of the semisimplification alone does not suffice. This interface is specified here in the README.

For an elliptic curve `E/ℚ`, `ρ̄_{E,p}` is supplied by ArithmeticGaloisRepresentations §6.1, [Basis-free elliptic residual representation](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation): use `TateModule.residualRep E p` on the native geometric `p`-torsion, extend scalars from `ZMod p` to `𝔽̄_p`, and choose a basis for its matrix realization. Its trace, determinant and attachment are independent of that basis. This is the residual action used in the finite-flat exports and in EllipticCurveModularity's application.

The exact Serre invariants, reduction-isomorphism definition and determinant identity belong to `AlgebraicModularFormsAndSerreWeights:R15.6`, the Artin conductor underlying `N(ρ̄)` to `ArithmeticGaloisRepresentations Layer 3`, and the local weight recipe to `AlgebraicModularFormsAndSerreWeights:R15.4`.

### 2.3 Lifts and compatible systems

A *minimal* lift is minimal in the sense of Khare–Wintenberger §5, pp. 8–9 (Diamond §3 for odd `p`; Khare–Wintenberger (II) §3.3.1 for `p = 2`). At `ℓ ≠ p` the map `ρ(I_ℓ) → ρ̄(I_ℓ)` is bijective, with two exceptions: if `ρ̄(I_ℓ)` is projectively cyclic of order `p, ρ|_{I_ℓ}` is the Teichmüller twist of a unipotent lift; if `p = 2` and `ρ̄|_{D_ℓ}` is induced from a wildly ramified character `γ` of a ramified quadratic extension `L` of `ℚ_ℓ, ρ` agrees on inertia with the induction of the Teichmüller lift of `γ` times a ramified quadratic character of `G_L`. In every case the determinant on inertia is the Teichmüller lift. Minimal lifts preserve the prime-to-`p` conductor, and away from the two exceptions they keep the inertial type of `ρ̄` at `ℓ`. It is stronger than "unramified wherever `ρ̄` is unramified", and the type-preservation steps of R33 need the stronger notion.

An *almost strictly compatible system* is a system `(ρ_λ)` over a number field `E` in the sense of Dieulefait–Pacetti Definition 1.10 and the paragraph after Remark 3, pp. 6–7: a fixed finite ramification set, Weil–Deligne parameters at each `ℓ` that do not depend on the coefficient place away from `ℓ`, and the matching `p`-adic Hodge-theoretic condition at coefficient places above `ℓ` itself, with exceptions only at pairs `(ℓ,λ)` where `λ|ℓ`, the global residual member is reducible, and either `ℓ = 2` or the common Weil–Deligne parameter at `ℓ` is ramified. De Rhamness and the fixed Hodge pair remain required at these pairs. Khare–Wintenberger §5, p. 8, require de Rhamness only outside the exceptional pairs; their Theorem 5.1 supplies the stronger condition through the automorphic restrictions in [KW-II], §10.3.2, pp. 93–94. A finite exceptional set of coefficient places alone does not establish this pairwise condition. Each member may also ramify at its own coefficient prime. The targets of R33.3 and R33.5 say which clause each step uses; in particular, an odd unramified prime `ℓ` of the system gives a crystalline member at `ℓ` even when its residual reduction is reducible, while at a ramified coefficient prime with reducible reduction only the de Rham condition is available. Irreducibility of every characteristic-zero member does not imply irreducibility of its residual reductions: residual reducibility after a change of prime is always a branch of the proof.

### 2.4 Numerical conventions

`Q(n)` is Mathlib's `Nat.maxPrimeFac`: `Q(1) = 1`, and `Q(n)` is the greatest prime divisor of `n` for `n > 1`. `π(x)` is `Nat.primeCounting ⌊x⌋₊`. In Khare's recursion `p₀` (or `p_n`) is the previous characteristic bound, `P = P_{n+1}` the new characteristic, `ℓ` the *foil* prime, `ℓ^e = 2m + 1` the exact odd prime-power divisor of `P − 1`, and `j` the tame exponent of the nebentypus at `P`. In Khare–Wintenberger's hypotheses `r` counts the odd conductor primes, or bounds the dyadic conductor valuation; `r` and `e` are unrelated. In the modern strand `q` is the coefficient characteristic and `N` an auxiliary rational prime, not the level `N(ρ̄)`. The printed constant `1.46` with a repeating bar is `22/15`.

### 2.5 Local types

`ℚ_{N²}` is the unramified quadratic extension of `ℚ_N`, with residue field `𝔽_{N²}`. A character of `I_N` has *niveau 2* if it factors through `𝔽_{N²}^×` and not through `𝔽_N^×`. A residual `ρ̄` is *bad dihedral* if it is irreducible but becomes reducible over `ℚ(√p*), p* = (−1)^{(p−1)/2}p`; equivalently over `ℚ(ζ_p)` (`ArithmeticGaloisRepresentations Layer 4`).

### 2.6 Finite-range numerical estimate

`Hfinite` denotes the finite assertion of `R26.3/finite-auxiliary-prime-checks`: for each prime `5 ≤ p ≤ 21591`, the least non-Fermat prime `P > p` has an exact odd prime-power divisor `ℓ^e = 2m+1` of `P−1`, with `ℓ ≤ p`, `e ≥ 1` and `(m+1)P+m ≤ (2m+1)p`. R26.3 proves this estimate throughout the stated range. The classical endpoints use that theorem and carry no standing finite hypothesis.

### Arithmetic interfaces for the theorem statements

The following arithmetic interfaces specialize ArithmeticGaloisRepresentations Layers 1–4 to the actual absolute Galois group and two-dimensional matrices. The Frobenius, unramifiedness, oddness and image-algebra predicates used by the headline statements have definitions in `Suggested.lean`; the other interfaces are specified as library targets. They use existing carriers and retain the same coefficient, inertia and conjugation conventions. Their comparison with the supplier's bundled representation API is part of the specialization. Sources: [KW-I], §1, p. 2, and §5, p. 8; [Kh], §1.1, p. 2. The aliases `GQ`, `IntBar` and `FpBar p` denote Mathlib's algebraic-closure automorphisms, algebraic integers and algebraic closure of `ZMod p`; they introduce no new Galois groups or fields.

`IsFrobAt σ r` means that some prime ideal `Q` of the algebraic integers contains `r` and satisfies Mathlib's `IsArithFrobAt ℤ σ Q`. Its API gives existence at an unramified rational prime, conjugacy under changing `Q`, and independence of trace and determinant for an unramified representation. Here `r` is prime whenever a Frobenius is used in a theorem. `IsUnramifiedAt ρ r` requires every such inertia group to lie in the kernel of `ρ`. Its API is invariance under conjugation, equivalence with the inertia action being trivial, and compatibility with restriction and coefficient extension.

**Checks.**

- At `r = 1` there is no prime ideal containing `r`, so `IsFrobAt σ 1` fails for every `σ`.
- For prime `r`, a witness prime `Q` has residue characteristic exactly `r`. At `r = 2` there is a residue element `u` with `u² + u + 1 = 0` and `u² ≠ u`; arithmetic Frobenius sends it to `u²`, and geometric Frobenius reverses the action.
- A representation trivial on inertia is unramified, including the trivial representation at every `r`; a nontrivial unipotent inertia action fails unramifiedness even when its semisimplification is trivial.
- Replacing a chosen prime `Q` by a conjugate transports its inertia subgroup and preserves kernel containment, whereas checking only decomposition-group triviality would incorrectly exclude a nontrivial unramified character.

`IsOdd ρ` says that every complex conjugation has determinant `−1`. Its API is invariance under conjugation, equivalence with checking one complex conjugation, and compatibility with coefficient extension. `IsAbsIrreducible ρ` is the rank-two image-algebra criterion: the `k`-linear span of the matrices `ρ(g)` is all of `M₂(k)`. Its API compares it to irreducibility after every field extension and proves conjugacy and coefficient-extension invariance. `IsSType ρ` is the conjunction of open kernel, oddness and absolute irreducibility, for discrete residual coefficients. Its API extracts these three conditions and transports them under isomorphism and finite coefficient descent.

**Checks.**

- The trivial rank-two action over `ℚ` fails oddness at complex conjugation; over `ZMod 2` its determinant sign is `−1`, as required by the characteristic-two convention. The action `diag(1,χ̄₃)` is odd in characteristic three, with determinant `−1` at every complex conjugation.
- The trivial rank-two action spans only scalar matrices and fails absolute irreducibility, although its kernel is open.
- The natural action of `GL₂(ℚ)` spans all four matrix units and passes the image-algebra criterion. A diagonal action preserves both coordinate lines and fails it.
- The splitting field of `x³−4x+1` is totally real with Galois group `S₃` (the cubic is irreducible and has positive nonsquare discriminant `229`). Its standard action over `𝔽₅`, with a 3-cycle acting by `(0,−1;1,−1)` and a transposition by `(0,1;1,0)`, has open kernel and spans `M₂(𝔽₅)`. Every complex conjugation acts trivially: precisely oddness fails in `IsSType`. A noncontinuous action fails the open-kernel condition even if it passes the algebraic image test.
- The continuous surjection onto this totally real `S₃` extension, followed by `S₃ ≅ GL₂(𝔽₂)`, gives an S-type action. Its matrices span `M₂(𝔽₂)` and oddness is automatic.

`IsProjConj ρ a b` means that for some `τ` in the source group and scalar `z` the matrix `ρ(a)` is `z ρ(τbτ⁻¹)`. Its API is reflexivity, symmetry, transitivity, invariance under conjugation and equivalence with conjugacy in the projective image. For field coefficients the scalar is automatically nonzero because both matrices are invertible.

**Checks.**

- Multiplying by a nonzero scalar preserves the projective conjugacy class, even when it changes the ordinary trace.
- A nontrivial unipotent matrix over `ℚ` is not projectively conjugate to the identity.
- The matrices `diag(1,−1)` and `diag(−1,1)` are conjugate by the swap; their projective class has order two in odd characteristic.

For integral matrix representations, use `Matrix.GeneralLinearGroup.map` to compose with the residue map of a local coefficient ring or the map to the fraction field of a domain. The supplied elliptic action `TateModule.residualRep E p` has a different source carrier. The comparison API gives evaluation entry by entry, preservation of determinant and trace under the ring map, and compatibility with conjugation by integral invertible matrices. No lattice independence of the full reduction is asserted. `toRepresentation ρ` uses Mathlib's matrix-to-linear-equivalence map to view the same action on `Fin 2 → R`. Use `Representation.invariants` on its restriction to a subgroup for fixed vectors; use `Representation.IsIrreducible` for ordinary irreducibility. There is no separate fixed-vector submodule or stable-line irreducibility definition.

**Checks.**

- A trivial integral action reduces and extends to a trivial action, with determinant `1`.
- For `diag(u,v)` reduction applies the residue map to `u` and `v`; a nonzero uniformizer entry becomes zero and must not be retained.
- The entry `1` above the diagonal in a unipotent action remains `1` after fraction-field extension, so the extension is not its semisimplification.
- The linear adapter sends a vector `v` to the actual matrix product `ρ(g)v`; the identity matrix fixes both coordinate vectors and the swap interchanges them.
- At `(q,N)=(3,2)`, the two full stable-lattice reductions in R33.3 differ while their semisimplifications agree. This rejects lattice-independent full reduction.

`primesOfRat S` is the inverse image of a set of natural numbers `S` under the absolute norm on the height-one spectrum of the integers of `ℚ`. Its API is membership, preservation of unions and intersections, and transport of rational-prime conditions to `NumberField.Set.HasDirichletDensity`. The auxiliary level `N′` is `N` for `5 ≤ N` and `5N` otherwise. Its API gives the two branches, `N ∣ N′`, positivity for positive `N` and the representable-level bound `5 ≤ N′` for positive `N`. The auxiliary level uses the fine-moduli threshold `N ≥ 5` for `X₁(N)` and retains divisibility by `N`. [KW-I], proof of Theorem 10.1, p. 20, uses level `N` and refers the weight-one argument to [Kh97].

**Checks.**

- `primesOfRat ∅ = ∅` and `primesOfRat Set.univ = Set.univ`; using image instead of inverse image would have the wrong domain.
- At the prime ideal `(r)` of `ℤ` for prime `r`, membership is exactly `r ∈ S`, with norm `r` rather than a power depending on a chosen extension field.
- A singleton `{4}` pulls back to the empty height-one spectrum subset; composite norms do not create rational primes.
- The auxiliary levels for `N = 1, 4, 5, 11` are `5, 20, 5, 11`, respectively.
- At `N = 0` the auxiliary level is zero under the total-function convention; the lower bound `5` requires positive `N`.
- Multiplication by `5` below the threshold retains divisibility by `N`; using a maximum would give `5` at `N = 4` and fail this requirement.

## Exact supplier contracts

Use Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. The following declarations are used as they stand.

| Declaration | Use |
| --- | --- |
| `Matrix.GeneralLinearGroup` | `GL₂` of the coefficient ring. |
| `AlgebraicClosure`, `AlgEquiv`, Krull topology | `G_ℚ = AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ`, the body of `Field.absoluteGaloisGroup ℚ`, used unfolded so that its actions on algebraic integers apply, and its topology. |
| `IsArithFrobAt`, `Ideal.inertia` | Frobenius elements and inertia groups at primes of the algebraic integers. |
| `NumberField.ComplexEmbedding.IsConj` | Complex conjugations. |
| `NumberField.Set.HasDirichletDensity` | Dirichlet density of a set of primes. |
| `NumberField.Chebotarev.frobeniusPrimeSet`, `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`, `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean`, `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean`) | For a finite Galois extension of number fields, density `#C/#G` and infinitude for each conjugacy class `C`. `lemma_8_2` uses finite unions of these classes in `MC/ℚ`; `R27.6/artin-reductions-of-serre-type`(d) uses a single class in `M/ℚ`, through `primesOfRat`. |
| `Nat.maxPrimeFac`, `Nat.maxPrimeFac_one`, `Nat.isGreatest_maxPrimeFac`, `Nat.maxPrimeFac_mul`, `Nat.maxPrimeFac_pow` | `Q(n)` and its API: `Q(mn) = max(Q(m), Q(n))` for `m, n ≠ 0, Q(n^e) = Q(n)` for `e ≠ 0`. |
| `Nat.primeCounting`, `Nat.exists_prime_lt_and_le_two_mul` | `π` and Bertrand's postulate; Bertrand does not give the sharper ratio of R26.3. |
| `existsUnique_sub_zsmul_mem_Ioc` (`Mathlib/Algebra/Order/Archimedean/Basic.lean`, the additive form of `existsUnique_sub_zpow_mem_Ioc`) | The unique representative of a residue class in a half-open interval of positive integral length, used in `R26.3/weight-interval-containment`. |
| `MonoidAlgebra.Submodule.exists_isCompl` | Maschke's theorem over a field in which the group order is invertible. |
| `ModularForm`, `CuspForm`, `DirichletCharacter` | The analytic carriers; the attached Galois representations are supplied by other roadmaps. |

In Tau Ceti, `HeckeRing.GL2.Newform` has level and weight parameters, a nebentypus character, newness and normalisation `a₁ = 1`, and `TauCeti.AlgebraicGeometry.AbelianVariety` is a proper geometrically integral group scheme over a field. Neither is redefined by the roadmap; Use `HeckeRing.GL2.Newform N k` directly at a positive level `N` and integer weight `k`; its residual and characteristic-zero Galois attachments are supplied separately by their owning roadmaps. Neither library contains residual Galois representations with their conductor and Serre weight, compatible systems, or any of the theorems below.

Use Mathlib `Representation.invariants` from `Mathlib/RepresentationTheory/Invariants.lean` for fixed submodules, `Representation.IsIrreducible` from `Mathlib/RepresentationTheory/Irreducible.lean` for ordinary irreducibility, and `Matrix.GeneralLinearGroup.map` from `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` for residual and fraction-field matrix actions. These retain the given coefficient ring and source group; the finite-image reduction theorems require the image order invertible in the residue field. Use `LinearMap.ker` and `Matrix.toLin'` for the matrix invariant-dimension Checks. The `Eis` and `M2` coordinate arithmetic is replaced by the existing ring and matrix operations; the relations and both lattice reductions are specified in R33.3 and the Worked examples.

Use `HeckeRing.GL2.Newform.qExpansion_coeff_one` and `HeckeRing.GL2.Newform.dirichletLift` from `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` for normalization and the Dirichlet-character extension of the existing nebentypus. The integer weight parameter accommodates weight one directly. AlgebraicModularFormsAndSerreWeights §§R15.5A.2–R15.5A.3 and R15.6 supply the Galois and residual attachments with a chosen coefficient place; the analytic carrier by itself contains neither.

Use `TauCeti.localCyclotomicCharacter` and `TauCeti.localCyclotomicCharacter_apply` from `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean` for the `p`-adic cyclotomic character on the absolute Galois group of a field. LocalGaloisGroups Layer 0 supplies its local arithmetic comparisons; LocalFieldsRamification Layer 4 supplies the tame frame, and ClassFieldTheory Layer 7 supplies local reciprocity. These supply the local-character and tame-group comparisons used in the rank-two constructions.

## How to read the build

Layer I first proves the controlled potential-modularity, ordinary-lifting, global-ring and prescribed-system inputs. Within it, I.0 constructs the auxiliary automorphic seeds, I.1–I.2 establish lifting and finiteness, and I.3 extracts the required lifts and systems. The almost-strict-family definition is available before the theorems constructing its members.

The labels R26.1–R33.6 identify the level-one, classical-induction and modern-proof strands. No target of R27.1 depends on R26. Three of them are needed early: the definition of a good-dihedral prime, Lemma 6.3 and the Chebotarev choice of Lemma 8.2. They use only ArithmeticGaloisRepresentations Layers 2–4, `AlgebraicModularFormsAndSerreWeights:R15.4`, Input I.3 and Chebotarev Layer 10. Build them, together with the definitions `(L_r), (W_r), (D_r)` of `R27.2/hypotheses-Lr-Wr-and-Dr`, before Corollary 8.1(ii) in R26.6, which uses both definitions. The other two R27.1 targets, the insertion of a good-dihedral prime and the Dickson–Lemma 6.2 package, are first needed in R27.4.

The modern qualitative proof R33.1–R33.5 uses no target of R26 or of R27.2–R27.6. From the classical strand it uses only the three early R27.1 targets. The strong form of R33.6 uses from the classical strand only R27.4's passage from modularity to weight and level. That passage needs Khare–Wintenberger Theorems 4.1 and 5.1(1), Lemmas 6.1 and 6.2(i) from R27.1, `θ`-operators, Edixhoven's weight theorem and the Deligne–Serre lemma, and no part of the conductor induction. The comparison of the two routes in R33.6 uses, in addition, the classical theorem of R27.6.

```text
R27.1 (definition, Lemma 6.3, Lemma 8.2)
  ├─> R27.2 (definitions of (L_r), (W_r), (D_r)) ─> R26.6 Corollary 8.1(ii) ─> R27.3 (W₁) ─> R27.3–R27.5 ─> R27.6
  └─> R33.1–R33.3 ─> R33.4 ─> R33.5 ─> R33.6 <─ R27.4 (weight and level)
                                       R33.6 <─ R27.6 (comparison of the routes)
R26.1–R26.6 (level one) ─> R26.6 Corollary 1.2 ─> Corollary 8.1(ii)
R26.3 (prime estimates) ─> R27.2 (prime gaps, Theorem 3.2) ─> R27.3 (double induction)
```

Targets carry labels such as `R26.3/weight-interval-containment`, its layer and a short name. Prerequisites written with such a label are targets of this roadmap; those written `Roadmap:Layer/target` or `Roadmap:Layer` are targets of a neighbouring roadmap; those written in code font without a colon are existing declarations.

## Layer I: Lifting and compatible-system inputs

This layer proves the rank-two input statements needed by the three strands. Representations, lattices, local period conditions, conductors and residual-image comparisons come from the arithmetic suppliers. The shared carrier is `AutomorphicSystemData` of SmallRamificationAndAbelianVarietyBaseCases §5.0d; its base-`ℚ`, rank-two specialization `ArithmeticCompatibleFamily` supplies the chosen completion models and arithmetic compatibility predicates. The local comparisons below enrich that specialization, using its fields and convention adapters. The raw operations and the marked isogeny and base-change transports retain their supplier's hypotheses and identifications. The global and local deformation rings come from GlobalGaloisDeformations R04.3–R04.6 and LocalGaloisDeformationRings Layer 8. The assertions here do not assume the universal Serre theorem.

### I.0 Potential modularity with local control

Let `ρ̄` be S-type, with cyclotomically absolutely irreducible restriction and `2 ≤ k(ρ̄) ≤ p+1` for odd `p`, or nonsolvable image for `p = 2`. Construct a totally real Galois extension `F/ℚ` of even degree preserving the residual image, unramified above `p` and split there in the locally irreducible and weight-`p+1` cases. Retain disjointness from any specified finite extension. Supply the weight-`k(ρ̄)` Hilbert seed (requiring `k(ρ̄)=2` when `p=2`) and the weight-two seed with the coefficient-prime conditions of [KW-II], Theorem 6.1. For a given characteristic-zero lift satisfying the residual hypotheses and one of the coefficient-prime prescriptions of I.3, prove potential modularity over a controlled totally real extension. Retain the local deformation conditions and matching automorphic seeds required by [KW-II], Theorem 9.7 and §10.3.2. The weight-two case and its single-representation solvable descent are supplied by SmallRamificationAndAbelianVarietyBaseCases §§5.0b–5.0c. The general-weight construction concerns the minimal crystalline lifts in this Serre-weight range.

Use HilbertModularVarietiesAndShimuraCurves H1 for the underlying Hilbert–Blumenthal moduli problem, and §§H6.2–H6.5 and H6.9 for its paired torsion twist, selected geometrically irreducible component and nonempty real and finite local loci. Verify the pairing, component and local-realization hypotheses of that export. Prove here the further local realizations outside its contract, including the dyadic real involutions of [KW-II], §6, and apply the totally real point theorem with the prescribed disjointness and local control. The point supplies the auxiliary automorphic seed. Descent through solvable intermediate fields uses GL2AutomorphicRepresentationsAndTransfer R17.4, retaining coefficients and characters. Source: [KW-II], Theorem 6.1 and proof, pp. 53–57, Theorem 9.7, pp. 89–90, and §10.3.2, pp. 93–94; [KW-Ann], Theorem 2.1, pp. 233–237, for odd `p`, `k≠p`; [Kh], Proposition 3.1, pp. 16–17, for the specified weight-two lifts.

**Checks.**

- At residual weight `p`, the Annals seed theorem is unavailable; [KW-II], Theorem 6.1 includes it, with the additional local trivialization when inertia is trivial.
- At `p=2`, complex conjugation can act trivially or unipotently. The real HBAV realization must handle both; H6.4's odd split-eigendirection hypothesis alone does not cover them.
- At residual weight four in characteristic two, the prescribed lift is semistable noncrystalline of weight two; the crystalline weight-two branch requires residual weight two.

### I.1 Ordinary lifting over ℚ

Prove the following residually reducible ordinary theorem. Let `p` be odd, and let `ρ` be continuous, odd, irreducible and finitely ramified over a finite extension of `ℚ_p`. After a finite-order twist suppose `ρ̄^ss = 1 ⊕ χ`, `χ|D_p ≠ 1`, `ρ|I_p = (*,*;0,1)`, and `det ρ = ψχ_p^(k−1)` with `k ≥ 2` and `ψ` finite order. Then `ρ` is attached to a classical newform of weight `k`. The residual character `χ` is odd, and its splitting field is abelian over `ℚ`. The unramified quotient and its residual character must agree; the distinguished condition is a hypothesis. Source: [SW99], Introduction, p. 6, Theorem A, pp. 74–75.

Also prove the residually irreducible ordinary theorem with the same characteristic-zero hypotheses, absolutely irreducible modular residual representation, and a `p`-distinguished ordinary residual local shape whose quotient matches the ordinary automorphic seed. The target includes the case induced from `ℚ(√−p)` for `p ≡ 3 mod 4`. In that case supply a correct nearly ordinary dihedral deformation argument and its pro-modularity consequence: the printed dimension estimate does not establish the full scope. The imaginary-quadratic branch is a proof target, not an application of the theorem restricted to non-imaginary inducing fields. Source: [SW01], Introduction, pp. 186–187, Lemma 2.2, p. 191, and Theorems 5.1–5.2, pp. 202–204; [KW-I], references to Skinner's correction in the lifting argument. This is the full-scope requirement in the level-one degenerate branch.

The ordinary exact-level specialization identifies the weight and local conductor of the resulting newform from the given representation, including its coefficient-prime ordinary crystalline or semistable comparison. Its small terminal instances are supplied by SmallRamificationAndAbelianVarietyBaseCases §5.0e. For the other instances used in R26.4, prove the same local–global conductor comparison from the actual attachment of AlgebraicModularFormsAndSerreWeights R15.5A.2 and GL2AutomorphicRepresentationsAndTransfer R17.6.4. Source: [Kh], Lemma 5.4 and proof, p. 22.

**Checks.**

- Coincident residual characters at `p` do not satisfy `p`-distinguishedness, even when the characteristic-zero representation is ordinary.
- A reducible characteristic-zero representation is excluded from both lifting conclusions.
- Induction from an imaginary quadratic field fails the restricted printed proof's dimension argument; it remains included in the full-scope mathematical target.

### I.2 Global finiteness, presentations and classical lifting

**Hilbert integral comparison over the potential-modularity field** (`I.2/hilbert-fixed-determinant-comparison`). Let `p > 2`, `ρ̄` be S-type, `ρ̄|G_{ℚ(μ_p)}` absolutely irreducible, `2 ≤ k(ρ̄) ≤ p+1`, and `k(ρ̄) ≠ p`. Use I.0 in the form of [KW-Ann], Theorem 2.1: `F/ℚ` is totally real Galois of even degree, unramified above `p`, preserves the residual image, makes `ρ̄|G_{F(μ_p)}` absolutely irreducible, and splits `p` completely in the supersingular case. Retain a cuspidal Hilbert automorphic seed over `F` realizing `ρ̄|G_F`, with the weight, determinant and local conditions of the chosen deformation problem. Let `W = W(𝔽)` and `O/W` be a finite coefficient DVR extension containing the seed's coefficients. The minimal fixed-determinant ring `R_F` is unramified at finite places away from `p`. At every `v | p` impose the restrictions of the corresponding [KW-Ann] §3.1 condition: crystalline weight `k` for `k < p`, or at `k = p+1` either the ordinary crystalline weight-`p+1` branch or the ordinary semistable weight-two branch. Fix determinant `ε̂χ_p^(k−1)` in the crystalline branch and `ε̂χ_p` in the semistable branch. In the ordinary case choose the distinguished filtration and its quotient matching the seed; in the supersingular case use the split-at-`p` crystalline problem. For `p = 3`, include the auxiliary neatness prime and its removal as in [Kh] §2.1.

Take the integral Hecke module and algebra `T_F`, localized at the residual eigensystem in this exact weight and level, from HilbertModularVarietiesAndShimuraCurves R18.3. Apply AutomorphicGaloisRepresentations §§6.8–6.12 for the arithmetic Hecke-valued representation, verifying every chosen local condition and the fixed determinant over the entire Hecke family. Prove here that `T_F` is finite flat over `O`, with the chosen residue identification and closed trace subalgebra equal to `T_F`. These data give GlobalGaloisDeformations R04.6 §6.7's `HeckeGaloisDatum`; its `classifying_surjective` supplies the unframed fixed-determinant map `R_F → T_F`. For reconstruction from characteristic-zero points use §6.8's `ofPoints` and `mem_of_points`, with reduced `T_F`, jointly injective point maps, both Frobenius coefficients and every prescribed local and determinant condition at the points. Prove here that the resulting surjection is an isomorphism. The ordinary and supersingular comparisons are separate targets within this contract; formally smooth local conditions alone are not a modularity hypothesis. The individual Hilbert attachments and their normalization come from AutomorphicGaloisRepresentations §§3.10–3.14, 4.4 and 4.7; this roadmap owns the Hilbert integral comparison and its finiteness application. The classifying-map interface follows the Imperial College London FLT project.
Source: [KW-Ann], Proposition 3.8 and proof, pp. 241–242, using Fujiwara Theorem 0.2 in the ordinary branch and Taylor Theorem 3.2 in the supersingular branch; [Kh], §2.1, pp. 8–11.
*Needs:* Input I.0; GlobalGaloisDeformations R04.3 and R04.6 §§6.7–6.8 ([Hecke–Galois data](../GlobalGaloisDeformations/README.md#hecke-galois-datum), [construction from points](../GlobalGaloisDeformations/README.md#hecke-galois-points)); LocalGaloisDeformationRings Layer 8; HilbertModularVarietiesAndShimuraCurves R18.3; AutomorphicGaloisRepresentations §§3.10–3.14, 4.4, 4.7 and 6.8–6.12.

**Checks.**

- A residual representation not yet known modular over `ℚ` still has the Hilbert seed after restriction to this `F`; it does not supply a Hecke maximal ideal over `ℚ`.
- The supersingular comparison requires complete splitting of `p` in `F`; unramifiedness alone is insufficient for this branch.
- Weight `p` is excluded here. At weight `p+1` both local problems are ordinary, but their weights, determinants and monodromy differ.
- Extending a lift from `O` to `O[ε]/(ε²)` leaves its traces in `O`; without trace generation the classifying map need not surject onto the larger algebra.

For the associated minimal global ring over `ℚ`, prove finiteness over the coefficient DVR by restriction to `R_F`. The finite-characteristic universal inertia images away from `p` have the residual orders, giving the restriction map `R_F/(π) → R_ℚ/(π)`. Use finite universal image over `F`, finite index and the ring/image criterion to deduce finite cardinality of `R_ℚ/(π)`, then integral finiteness. For the integral `R_ℚ ≅ T_ℚ` and complete-intersection conclusion, require residual modularity over `ℚ` and a matching automorphic seed satisfying the determinant and every prescribed local condition, together with the classical lifting hypotheses below. Retain the maps of deformation problems and local types.
Source: [KW-Ann], Proposition 3.8 and Theorem 3.7, pp. 241–242; Lemma 3.6, p. 241, only for the finite-characteristic ring/image criterion; [KW-I], Theorem 4.1, p. 7, proved in [KW-II].

**Global finiteness for the full Khare–Wintenberger range** (`I.2/full-kw-global-finiteness`). Let `ρ̄` be S-type, with `2 ≤ k(ρ̄) ≤ p+1` and cyclotomically absolutely irreducible restriction for odd `p`, or nonsolvable image for `p=2`. Fix a finite set `S` containing `p`, infinity and the residual ramification, the integers `O` of a finite extension of `ℚ_p` with the chosen residual coefficient embedding, and an arithmetic character `ψ` with `ψχ_p` lifting the residual determinant. Choose the framed local quotient rings of LocalGaloisDeformationRings §§8.2–8.19 with this determinant and their nonempty local lifting data. At `p` use exactly [KW-II], §8.3.3: crystalline weight `k` in `2≤k≤p+1` (including `k=p`), the prescribed potentially crystalline weight-two type, or semistable noncrystalline weight two at residual weight `p+1`. In characteristic two use crystalline weight two at residual weight two, or the specified semistable noncrystalline weight-two ordinary shape at residual weight four. At infinity impose oddness.

Base change the framed global ring along the completed tensor product of these local quotient rings. Prove that the image of the unframed fixed-determinant universal global ring in this base-changed framed ring is finite over `O`. Use I.0's seeds and the matching full-range Hilbert finiteness comparisons of [KW-II], Propositions 9.2–9.3, followed by the restriction and finite-image argument of §10.1; the odd `k≠p` integral isomorphism above has its narrower scope. Combine the dimension lower bound with this finiteness to obtain an `O′`-valued characteristic-zero point for some finite coefficient DVR extension `O′/O`, and hence the prescribed lifts of I.3.
Source: [KW-II], Theorem 10.1 and §10.1, pp. 90–92; Theorem 6.1, pp. 53–54; Corollary 4.7, pp. 45–46, and §10.3.1, p. 92.
*Needs:* Input I.0; GlobalGaloisDeformations R04.3–R04.6; LocalGaloisDeformationRings §§8.2–8.19; HilbertModularVarietiesAndShimuraCurves R18.3; AutomorphicGaloisRepresentations §§6.8–6.12.

**Checks.**

- The standard `S₃` action from the splitting field of `x³−2` over `𝔽₅` is odd, cyclotomically absolutely irreducible and unramified at `5`, with Serre weight `5`. Its crystalline lift uses this target's weight-`p` branch.
- A nonsolvable dyadic residual representation of weight two admits the crystalline weight-two problem; weight four instead uses the semistable noncrystalline prescription.
- Finiteness of an arbitrary quotient such as `O/(π)` does not give a characteristic-zero point. Corollary 4.7 also uses the dimension lower bound for these chosen local quotient rings.

Böckle's numerical criterion here is: if `O` is a complete DVR with uniformizer `π`, `A=O[[x₁,…,x_n]]`, and `f₁,…,f_m` lie in the maximal ideal with `m ≤ n`, and the nonzero local quotient `R` has the same residue field and is finite over `O`, then `m = n` and `R` is a finite flat complete intersection. The regularity is that of `(π,f₁,…,f_n)` in `A`; in particular the characteristic-zero fibre is nonempty. Use the finite-equation continuous formal presentations of DeformationAndDerivedPatchingAlgebra §1.9, its regular-sequence ideal and absolute local CI interfaces of §3.4, and its dimension and flatness criterion of §3.5. Retain the chosen equations, their count and the quotient equivalence. This roadmap owns their arithmetic application to the deformation rings, including the deduction from auxiliary `R_Q ≅ T_Q` to minimal `R_∅ ≅ T_∅` with the exact hypotheses of R26.1.

A relative formal CI presentation means a continuous local presentation `R ≅ O[[x₁,…,x_n]]/(f₁,…,f_m)` with the equations a regular sequence. It asserts neither finiteness nor flatness over `O`. Specialize the comparison of DeformationAndDerivedPatchingAlgebra §§3.4 and 3.14 to a regular complete Noetherian local coefficient ring `O` and a complete Noetherian local `O`-algebra `R` with the same residue field and such a finite-equation presentation. Since `O[[x₁,…,x_n]]` is regular local, `R` is an absolute local CI if and only if the kernel of this presentation is a regular-sequence ideal; equivalently `R` admits a relative formal CI presentation. A complete coefficient DVR satisfies these hypotheses. For arbitrary coefficient rings the relative formal condition and the absolute local CI condition remain distinct. Source: [Bö], Theorem 1, p. 1, Proposition 1, p. 2, Lemma 1, pp. 3–4, Corollary 1, p. 4, and Lemma 2/Corollary 2, p. 5; Stacks, Tags [09Q0](https://stacks.math.columbia.edu/tag/09Q0) and [09Q1](https://stacks.math.columbia.edu/tag/09Q1).
*Needs:* DeformationAndDerivedPatchingAlgebra §§1.9, 3.4–3.5 and 3.14; GlobalGaloisDeformations R04.3.

**Checks.**

- `O` has the empty presentation and also `O[[x]]/(x)`; a count refers to the chosen presentation.
- The dual numbers `ℚ[ε]/(ε²)` have a one-variable, one-relation power-series presentation with relation `X²`, and give both a relative formal CI over `ℚ` and an absolute local CI.
- The algebra `A=ℚ[X,Y]/(X²,XY,Y²)`, equivalently the same quotient of `ℚ[[X,Y]]`, is neither a relative formal CI over `ℚ` nor an absolute local CI. Its embedding dimension is two, while its minimal defining ideal needs three generators. This excludes every regular presentation, not just this displayed one (Stacks, Tags [00SC](https://stacks.math.columbia.edu/tag/00SC) and [09Q1](https://stacks.math.columbia.edu/tag/09Q1)).
- Taking the non-CI ring `B=ℚ[[X,Y]]/(X,Y)²` as coefficient ring, the identity `B → B` has an empty relative regular presentation, although `B` is not an absolute local CI. The regularity hypothesis on the coefficient ring is essential.
- `O[[x]]` has fewer equations than variables and is flat but is not finite over `O`, so finiteness cannot be omitted from the numerical criterion.
- The quotient by `(1)` is zero and is excluded; `O/(π)` is finite but fails flatness and cannot meet the regular presentation hypotheses with no excess relations.

**Crystalline lifting with a matching-weight seed** (`I.2/same-weight-crystalline-lifting`). Let `p > 2`, let `O` be the integers of a finite extension of `ℚ_p` with residue field `𝔽`, and let `ρ : G_ℚ → GL₂(O)` be continuous, odd, finitely ramified and crystalline at `p` with Hodge–Tate weights `{0,h−1}`, `2 ≤ h ≤ 2p−1`. Suppose `ρ̄|G_{ℚ(μ_p)}` is absolutely irreducible, `End_{𝔽[G_{ℚ_p}]}(ρ̄) = 𝔽`, and a cuspidal modular eigenform of weight `h` has residual representation `ρ̄`. Then `ρ` is modular. Prove the rational crystalline comparison of Kisin, including the fixed-determinant crystalline domain in this weight range and the matching-weight modular point, using the local crystalline deformation interfaces and weight and level changes over `ℚ`.
Source: [Ki], Proposition (3.13) and Theorem (3.14), author pp. 19–21; [KW-II], §10.2, p. 92.
*Needs:* LocalGaloisDeformationRings §3.10 and Layer 5; GlobalGaloisDeformations R04.3–R04.6; SerreWeightAndLevelOptimisation Layer 4; AutomorphicGaloisRepresentations §§4.4, 4.7 and 6.8–6.12.

**Checks.**

- At `h=p+1`, a nonordinary crystalline lift has locally absolutely irreducible reduction by the Berger–Li–Zhu comparison of PadicHodgeTheory §6.4, so its local endomorphisms are scalars.
- A weight-two modular seed alone is not a weight-`p+1` seed; multiplication by the weight-`p−1` Hasse invariant and eigenvalue lifting supply the latter.
- Weight `h=2p` lies outside this comparison, and a scalar local residual action fails its endomorphism hypothesis.

**Classical modularity lifting** (`I.2/classical-modularity-lifting`). Let `ρ` be an odd continuous irreducible finitely ramified `p`-adic representation with a chosen stable lattice and modular reduction `ρ̄`. For odd `p`, assume `2 ≤ k(ρ̄) ≤ p+1` and absolute irreducibility on `G_{ℚ(μ_p)}`. The crystalline branch allows any lift weight `2 ≤ h ≤ p+1`, with Hodge–Tate weights `{0,h−1}`, independently of `k(ρ̄)`, and includes ordinary and nonordinary endpoints. The other branch uses the weight-two type prescribed in I.3. For `p=2`, assume nonsolvable residual image and either crystallinity of weight two with residual weight two, or semistability of weight two with residual weight four. Then `ρ` is modular, with the local–global comparisons required to identify its weight and conductor. In applications retain the determinant and the minimal or prescribed away-`p` conditions of the chosen global deformation problem.

For the nonordinary endpoint `h=p+1`, PadicHodgeTheory §6.4 gives locally absolutely irreducible reduction of Serre weight two, up to an unramified twist. From residual modularity obtain a weight-two form at level prime to `p`, multiply its mod-`p` reduction by the Hasse invariant, and lift the resulting cuspidal eigensystem to weight `p+1`. Hasse multiplication preserves the mod-`p` q-expansion and away-`p` eigenvalues; eigenvalue lifting preserves their reductions. Apply `I.2/same-weight-crystalline-lifting` with this seed and its scalar local endomorphisms. The ordinary endpoint uses I.1 with distinguishedness, the matching quotient and ordinary modular seed. This treats the two endpoint branches without identifying the residual and lift weights.
Source: [KW-I], Theorem 4.1, p. 7; [KW-II], §10.2, p. 92; [Ki], Proposition (3.13) and Theorem (3.14), author pp. 19–21.
*Needs:* Input I.1; `I.2/same-weight-crystalline-lifting`; PadicHodgeTheory §6.4; SerreWeightAndLevelOptimisation §3.7 and Layer 4; AlgebraicModularFormsAndSerreWeights R15.3 (the elliptic Hasse invariant) and R15.5 (Deligne–Serre eigenvalue lifting); LocalGaloisDeformationRings Layer 8.

**Checks.**

- At `p=3`, a nonordinary crystalline member with weights `{0,3}` has residual Serre weight two. The Hasse invariant raises its weight-two modular seed to weight four; the crystalline lift retains weights `{0,3}`.
- In the general crystalline return of R27.2, `h≤p+1` controls lifting even if the residual weight after changing coefficient prime differs from `h`.
- A crystalline lift of weight `p+2` is outside this contract. At `p=2`, residual weight four uses the semistable weight-two prescription.

The potentially Barsotti–Tate lifting input also covers odd `p`, an odd irreducible finitely ramified lift potentially Barsotti–Tate at `p`, cyclotomically absolutely irreducible modular residual representation, and the matching determinant: the lift is modular. Its dyadic version used here is Hypothesis `(H)`: an odd irreducible finitely ramified weight-two potentially crystalline representation with modular nonsolvable residual image is modular. The equivalence with the potentially Barsotti–Tate condition is required, using FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4. Source: [KW-I], §9, p. 18; [DP], Theorems 1.4–1.5, pp. 3–4, in the weight-two case. The general de Rham lifting statements and their globalisation requirements are stated in R33.1 and R33.5.

### I.3 Prescribed lifts and compatible systems

**The four prescribed lifts** (`I.3/prescribed-lifts`). Use the common hypotheses: `ρ̄` is S-type; for odd `p` its cyclotomic restriction is absolutely irreducible and `2 ≤ k(ρ̄) ≤ p+1`; for `p = 2` its image is nonsolvable. Every odd-characteristic application uses the normalized residual representation supplied by the transition below; a change of coefficient prime requires a fresh normalization unless the weight range is already established. Construct the following prescribed lifts over the integers of a finite extension of `ℚ_p`, with a stable lattice reducing to the given full residual representation, the matching fixed determinant and minimality away from the listed primes.

- The minimal crystalline lift has weight `k`, requires `k = 2` at `p = 2`, and is minimal away from `p`. The Annals variant assumes odd `p` and `k ≠ p`; the full Khare–Wintenberger variant includes `k = p`.
- The weight-two lift is minimal away from `p` and has parameter `(ω_p^(k−2) ⊕ 1,0)` at `p`, with the semistable noncrystalline parameter `(id,N)` with `N ≠ 0` at `k = p+1`. At `p = 2` the exceptional residual weight is `4`.
- For odd `q` with `q ∥ N(ρ̄)` and `p | q−1`, with residual inertia shape `(χ,*;0,1)`, prescribe at `q` the lift `(χ′,*;0,1)` with `χ′=ω_q^i`, `0<i≤q−2`, reducing to `χ`. Require `i` even if `p = 2`. At `p` use the preceding weight-two prescription; be minimal away from `p` and `q`.
- For `q ≠ p` with `p | q+1` and residual decomposition shape an unramified twist of `(χ̄_p,*;0,1)`, prescribe `χ′ ⊕ χ′^q` at `q`, where `χ′` has `p`-power order, genuine niveau two and the compatible reduction. For `p = 2` impose the even exponent-sum condition, and exclude `v₂(q+1)=1`, where this character does not exist. At `p` use the weight-two prescription and be minimal away from `p` and `q`.

These are mathematical existence targets, using the local rings of LocalGaloisDeformationRings §§8.2–8.19 and the global presentation of I.2 together with `I.2/full-kw-global-finiteness` for every prescribed branch. The local point characterization, prescribed determinant, preservation of minimality, coefficient extension and residue comparison are the required API. Source: [KW-I], Theorem 5.1(1)–`(4)`, pp. 9–10; [KW-Ann], Theorem 3.3, p. 239. The modern prescribed-type variant allows a weight-two lift with any compatible inertial types in [DP], Theorem 1.9(4), p. 6; its notion of minimality is the stronger one in Conventions §2.3, required for the type-preservation arguments.

**Checks.**

- At `p = 2` and `q = 5` the exponent `i = 1` in the third prescription is excluded; `i = 2` has the required parity.
- In the fourth prescription `p = 2, q = 7` permits niveau-two `2`-power characters, whereas `q = 5` does not.
- At `k = p+1`, a weight-two lift has nonzero monodromy; the crystalline weight-`k` lift is a different prescription.
- The order-three type at `(p,q)=(3,2)` has both standard and adapted integral models; the full residual representation determines which lattice supplies compatibility.

**Residual-weight normalization transition** (`I.3/residual-weight-normalization-transition`). Let `p` be odd and `ρ̄` of S-type. Choose `a ∈ ℤ` such that `τ̄ = ρ̄ ⊗ χ̄_p^a` has `2 ≤ k(τ̄) ≤ p+1`, using AlgebraicModularFormsAndSerreWeights R15.4, “Invariance and renormalized twists”. Let `θ` be the finite-order Teichmüller lift of the global character `χ̄_p^a`, unramified away from `p`. Let the preceding member `ρ_p` be continuous, odd, irreducible, finitely ramified and de Rham at `p` with Hodge–Tate weights `{0,h−1}`, `h ≥ 2`, with a chosen stable lattice reducing to `ρ̄`. Twist that lattice and member by `θ`; its reduction is the full representation `τ̄`. The twist preserves oddness, irreducibility and the Hodge–Tate weights of `ρ_p`, and is de Rham. Both residual and characteristic-zero modularity are invariant under these twists, by twisting forms and taking their primitive associates. On `G_{ℚ(μ_p)}` the residual twist is trivial, so cyclotomic absolute irreducibility is preserved; the projective image, bad-dihedral property and solvability of the residual image are preserved as well.

At every prime different from `p`, the inertia action, prime-to-`p` conductor and inertial type are unchanged; local Weil–Deligne parameters may acquire an unramified twist. In particular the good-dihedral type at `N ≠ p` is retained. Record `a`, `θ`, the residual character `ε(τ̄)` from `det τ̄ = ε(τ̄)χ̄_p^{k(τ̄)−1}`, and `det(ρ_p ⊗ θ) = (det ρ_p)θ²`. A subsequent crystalline lift of `τ̄` uses weight `k(τ̄)` and its matching prescribed determinant, namely `ε̂(τ̄)χ_p^{k(τ̄)−1}` for the minimal crystalline prescription, with `ε̂` the Teichmüller lift. This determinant need not equal that of the twisted preceding member, whose Hodge–Tate weights can differ. The two determinants reduce to the same residual determinant. The comparison with the new lift is a congruence for `τ̄`, after the recorded twist of the preceding member. Each link retains the twist, the congruence and the new system's weight and character.
Source: [DP], Remark 2, p. 5, Theorem 1.9(3), p. 6, and Theorem 1.4, p. 4; [Se87], §§2.7–2.9, pp. 188–191.
*Needs:* AlgebraicModularFormsAndSerreWeights R15.4; ArithmeticGaloisRepresentations §§1.2 and 1.6–1.9; ModularForms Layer 9 (twists and primitive associates); the residual and characteristic-zero attachment comparisons of AlgebraicModularFormsAndSerreWeights R15.5–R15.6.

**Checks.**

- For `p ≥ 5`, split inertia `χ̄_p ⊕ χ̄_p²` has weight `p+3`, outside I.3's range; taking `a=−1` gives `1 ⊕ χ̄_p` and weight two. A finite-order Teichmüller twist of a weight-two member keeps its Hodge–Tate weights `{0,1}` while producing this residual weight `p+3`.
- At `p=5`, niveau-two data `(1,3)` have weight nine; the twist by `χ̄₅⁻¹` gives `(0,2)` and weight three, in `[2,6]`.
- For `p ≠ N`, `θ|I_N=1`, so the two good-dihedral inertial characters remain exactly `κ ⊕ κ^N`; their Frobenius parameter may be multiplied by `θ(Frob_N)`.
- When a member has weights `{0,h−1}` and `h ≠ k(τ̄)`, twisting by `θ` retains `{0,h−1}`; only the replacement crystalline lift has weights `{0,k(τ̄)−1}`. Equating their characteristic-zero determinants would impose an unjustified condition.

**Families through prescribed lifts** (`I.3/families-through-prescribed-lifts`). Enrich the supplied `ArithmeticCompatibleFamily` by oddness and irreducibility of every characteristic-zero member and require AutomorphicGaloisRepresentations §7.1's `AutomorphicSystemData.IsAlmostStrictlyCompatible` on its underlying shared data, with the pairwise exceptions of Conventions §2.3. Use its underlying `AutomorphicSystemData` fields for the coefficient number field `E`, finite places, ramification set `S`, polynomials, members and Hodge multisets, together with the specialization's chosen `E_λ`-models and equivariant scalar-extension identifications. Stable lattices and residual embeddings refer to these same members. Common arithmetic-Frobenius polynomials and positive Hodge weights are obtained through the owner's adapters: a geometric polynomial `P` of degree `n` becomes `X^n P(1/X)/P(0)`, and the numerical Hodge labels change sign. For Weil–Deligne parameters invert the Frobenius matrix, retain inertia and monodromy, and invert the Frobenius–monodromy conjugation relation. These changes leave the representation unchanged; taking its dual is a separate operation.

The supplied almost-strict predicate requires de Rhamness, the fixed Hodge pair, crystallinity at good coefficient primes, and Frobenius-semisimplified Weil–Deligne comparison preserving monodromy at every pair outside exactly the exceptions of Conventions §2.3. In particular, supply every required pairwise comparison even at coefficient places in the owner's finite exceptional set. At a ramified coefficient prime with reducible global reduction the Weil–Deligne comparison may be omitted, while de Rhamness remains; at an odd unramified coefficient prime comparison and crystallinity are still required when reduction is reducible. The finite-exception predicate alone does not imply the supplied almost-strict predicate.

Its API reuses the owner's coefficient-extension and residual-member operations, including independence of semisimplified reduction from the lattice. Use AutomorphicGaloisRepresentations §7.1's `AutomorphicSystemData.almostStrict_transport` for coefficient extension, retaining chosen models and every required output comparison; use its strict-to-almost-strict and almost-strict-to-weak implications. Prove here the stated local inertial-type, weight and ramification comparisons for each selected member. Marked isogeny and base-change transports of geometric realizations retain the specified coefficient action and equivariant identifications. `CompatibleSystem.HasWeight k` means the supplied multiset, after the Hodge-sign adapter, is `{0,k−1}`; `CompatibleSystem.SplitAt p` means every selected coefficient place above `p` has residue field `𝔽_p`. Construct an almost-strict system containing each prescribed lift, with the local conditions used in R26.2 and R27.1–R33.5. The general-weight system uses I.0 and Brauer induction over solvable subextensions. For each descended cuspidal Hilbert form `π_i` over the totally real field `F_i`, retain its parallel weight `k ≥ 2`, central character, coefficient field `E_i` and embedding `E_i → ℚ̄_ℓ` at each selected coefficient place. Apply AutomorphicGaloisRepresentations §§3.10–3.14 and 7.3, using its arithmetic dual `ρ_{π_i,λ}^∨`: at arithmetic Frobenius `v` the polynomial is `X²−t_vX+Nv·s_v`. Convert the supplier's `D_HT` degrees `{0,1−k}` for this dual to the positive cyclotomic-weight convention `{0,k−1}` used here and local Weil–Deligne parameters by §§4.4 and 4.7, retaining monodromy. Identify the induced virtual representations with actual semisimple representations at every coefficient place. SmallRamificationAndAbelianVarietyBaseCases §5.0b supplies only the parallel-weight-two special case. Source: [Kh], Proposition 3.1, pp. 16–17; [KW-I], §5, pp. 8–10; [DP], Definition 1.10, Theorem 1.11 and Remark 3, pp. 6–7.

**Checks.**

- A member can ramify at its own coefficient prime even when `S` is empty; replacing the ramification condition by unramifiedness at every prime would reject a crystalline Tate member.
- The Tate family of an elliptic curve has geometric polynomial `X²−(a_r/r)X+1/r` at a good prime; the shared reciprocal-polynomial adapter gives `X²−a_rX+r` at arithmetic Frobenius for the same representation.
- At an odd unramified coefficient prime with reducible global reduction, membership of the coefficient place in a finite exceptional set does not waive the almost-strict Weil–Deligne comparison or crystallinity.
- At a ramified coefficient prime with reducible global reduction, the allowed omission of Weil–Deligne comparison retains de Rhamness and the fixed Hodge pair.
- Reducible residual reduction does not make a characteristic-zero member reducible. A Hodge-sign conversion changes the labels, whereas the dual changes the representation; the cyclotomic character has labels `−1` and `+1` in the two conventions.
- Inert degree-two coefficient places need not give prime-field-valued reductions. Complete splitting, or a proved descent, is needed before Lemma 8.2.
- The Steinberg and order-three parameters at `2` have different monodromy. Matching trace alone cannot supply the local comparison or a type-preserving congruence.

**Residual links and modularity transfer** (`I.3/residual-links-and-modularity-transfer`). Define two such systems to be linked at `p` when specified places above `p` have isomorphic semisimplified residual representations over a common residue field. The API is symmetry and invariance under coefficient extension; linkage alone does not imply modularity equivalence. Prove modularity transfer when the chosen `p`-adic members satisfy the particular lifting theorem of I.1, I.2 or R33.1 and both lift the same modular residual representation. Once one member is modular, common Frobenius polynomials and ArithmeticGaloisRepresentations Layer 5 give modularity of the entire system. GL2AutomorphicRepresentationsAndTransfer §§R17.6.17–R17.6.19 supply compatible-family transfer and descent with their common-index and character hypotheses. Source: [KW-I], applications of Theorem 4.1 in §§8–9, pp. 12–19; [DP], Remark 4, p. 7.

**Checks.**

- A family is linked to itself at any selected coefficient place; reversing the residual isomorphism reverses the link.
- Equal residual traces give only semisimplified linkage. A prescribed lift still requires a lattice realizing the given full residual representation.
- A link between crystalline and weight-two members gives modularity transfer only when each member satisfies its lifting theorem, with its own weight and determinant.

### Examples

A family is linked to itself at a chosen coefficient place, and an isomorphism of residual representations gives linkage in either direction. Equal residual traces alone supply only semisimplified linkage; the chosen lattice must still realize the full residual representation required by a prescribed lift. Linkage between a crystalline member and a member of another Hodge type gives no modularity equivalence until the appropriate lifting hypotheses hold on both sides.

For the split-at-`p` condition, complete splitting of `p` in the coefficient field gives prime-field residue fields at all its places; an inert quadratic place has residue degree two and fails it; a chosen degree-one place alone does not establish the condition at every place. For the weight condition, `{0,1}` is weight two, `{0,p}` is weight `p+1`, and `{0,0}` is irregular and fails every regular weight-`k` condition with `k ≥ 2`.

### Dependencies

*Needs:* ArithmeticGaloisRepresentations Layers 1–5; GlobalGaloisDeformations R04.3–R04.6; LocalGaloisDeformationRings Layers F and 8; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3–R07.5; AlgebraicModularFormsAndSerreWeights R15.3–R15.6; GL2AutomorphicRepresentationsAndTransfer R17.4–R17.6; SmallRamificationAndAbelianVarietyBaseCases §§5.0b–5.0e (shared system data, operations, convention adapters and rank-two specialization) and §§5.1–5.4 (marked realization transports); HilbertModularVarietiesAndShimuraCurves H1, §§H6.2–H6.5, H6.9 and R18.3; AutomorphicGaloisRepresentations §§3.10–3.14, 4.4, 4.7, 6.8–6.12, 7.1 and 7.3; PadicHodgeTheory §6.4; SerreWeightAndLevelOptimisation §3.7 and Layer 4. The minimal ring, the auxiliary automorphic seed, the prescribed lift and the family containing a given lift are separate outputs; none assumes the final residual modularity theorem.

## Layer R26.1: The level-one statement and the deformation contract

*Milestone:* Khare's level-one theorem.

This layer states the level-one theorem, the prime-conductor corollary that the conductor induction starts from, and the exact form in which Böckle's presentation enters. Their proofs are assembled in R26.6.

**Khare's level-one theorem** (`R26.1/level-one-theorem-and-the-meaning-of-arises-from`). Let `ρ̄ : G_ℚ → GL₂(𝔽)` be continuous, absolutely irreducible and odd, `𝔽` finite of characteristic `p`, and unramified outside `p`, so `N(ρ̄) = 1`. Then `ρ̄` arises from a cuspidal eigenform of level `SL₂(ℤ)` and weight `k(ρ̄)`, relative to the fixed embedding `ι_p`, in the sense of Conventions §2.2: an integral model `ρ : G_ℚ → GL₂(𝒪)` of `ρ_f, 𝒪` the integers of a finite extension of `ℚ_p`, reduces to `ρ̄`. The `p`-adic lift need not be unramified at `p`. The cases `p = 2` and `p = 3` are Tate's and Serre's theorems and are imported; the proof assumes `p` odd. Only two kinds of modularity lifting input are used: a lift crystalline at `p` of weight `k ≤ p + 1`, ordinary when `k = p + 1`, or a lift with Hodge–Tate weights `{0, 1}` that becomes Barsotti–Tate over `ℚ_p(μ_p)`. No other base field or rank is in scope.
Source: [Kh], Theorem 1.1 and §1.1, p. 2; [KW-I], §1, p. 2 (the meaning of "arises from"); [BCDT], Introduction, author copy p. 2 (published pp. 844–845), which separates modularity from modularity at the optimal weight and level.
*Needs:* `R26.6/level-one-proof-assembly`; `AlgebraicModularFormsAndSerreWeights:R15.6`.
`Suggested.lean` states level-one modularity as `khare_level_one`, with a newform of weight at least two. The exact weight `k(ρ̄)` requires the local weight recipe specified in Conventions §2.2.

**Checks.**

- The irreducible mod-`11` representation attached to the discriminant form is a level-one instance of weight `12`.
- At `p = 2` and `p = 3` the S-type hypotheses and unramifiedness outside `p` are incompatible, as in the Tate–Serre base cases.
- A crystalline lift of a level-one residual representation may ramify at `p`; unramifiedness outside `p` does not impose unramifiedness at `p`.

**Prime conductor and weight two** (`R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`). Let `ρ̄` be odd, irreducible, two-dimensional, with `k(ρ̄) = 2` and `N(ρ̄) = q` a prime. Then `ρ̄` arises from `S₂(Γ₁(q))`. Khare states this for `p > 2`; Khare–Wintenberger Corollary 8.1(i) includes `p = 2`. The corrected proof (R26.6) disposes of dihedral projective image by Lemma 6.2 and of `q = 2` by the earlier Annals theorem, then works with a minimal weight-two compatible system whose `q`-adic member is either semistable with nonzero monodromy or crystalline over `ℚ_q(μ_q)`. The reference [KW-I] gives for that last step is Theorem 6.1(2) of the published Duke version of [Kh]; the arXiv preprint has no Theorem 5.1 or `6.1` (its compatible-system result is Proposition 3.1), so the step is specified mathematically in R26.6 rather than by that number. Theorem 5.1(3) of the published paper alone does not cover `p ∤ q − 1`.
Source: [Kh], Corollary 1.2, p. 3; [KW-I], §8.3, proof of Corollary 8.1, p. 16; [KW-Ann], Definition 4.1 and Theorem 4.2(ii), pp. 243–244, Theorem 5.2(ii), p. 247, and §6.2, pp. 250–251.
*Needs:* `R26.6/corollary-1-2-proof`; `AlgebraicModularFormsAndSerreWeights:R15.6`.

**Böckle's presentation as the level-one proof applies it** (`R26.1/bockle-appendix-minimal-deformation-ring-presentation`). Böckle's presentation of a global deformation ring with local conditions, his criterion that a finite `𝒪`-algebra presented by no more relations than variables is a finite flat complete intersection, and his deduction of `R_∅ ≅ T_∅` from an auxiliary `R_Q ≅ T_Q` are targets of Input I.2, with the generic presentation in `GlobalGaloisDeformations:R04.3`. This target verifies their hypotheses for the minimal ring `R_∅` and the `Q`-new rings `R_Q^{α-new}` of the level-one argument:

1. `ρ̄` is odd; the Euler-characteristic count in the presentation uses oddness once.
2. The local defect `Δ_ℓ` vanishes in the four cases used: no ramification at `ℓ`, no condition at `ℓ`, the minimal condition at a prime where `ρ̄` ramifies, and the `Q`-new condition at a prime of `Q`, where the local ring is `𝒪⟦T⟧`. At `p`, verify `Δ_p = 0` for the finite or Selmer problems of [Bö]. The split finite-flat calculation requires `p` odd, `ρ̄|G_p ≅ diag(χ̄_p,1)`, coefficient ring `W(k)` and determinant fixed to `χ_p`. In this case the flat lifts are reducible, the tangent dimension is `2` and the versal ring is `W(k)⟦X₁,X₂⟧`; after a finite coefficient extension `O/W(k)` it is `O⟦X₁,X₂⟧`. This calculation does not cover arbitrary decomposable flat representations.
3. If `R_Q` is finite over `𝒪`, then `R_∅` is a finite flat complete intersection.
4. The deduction `R_∅ ≅ T_∅` needs `T_Q` and `T_∅` finite flat over `W(k), T_Q` reduced by the choice of `Q`, and Carayol's theorem that a newform unramified at the primes of `Q` has conductor prime to `Q`.

The determinant convention fixes `d` and `Ad_X: d = 0` and `Ad⁰` if the determinant is fixed, otherwise `d = 1` and `Ad`.
Source: [Bö], Theorem 1, p. 1, Proposition 1, p. 2, Lemma 1, pp. 3–4, Corollary 1, p. 4, and Lemma 2/Corollary 2, p. 5.
*Needs:* Input I.2; `GlobalGaloisDeformations:R04.3/local-to-global-presentation`.

**Checks.**

- `diag(χ̄_p,1)` with determinant `χ_p` gives the two-variable flat versal ring for odd `p`.
- The scalar unramified representation `1 ⊕ 1` with determinant one has three unramified tangent directions, the trace-zero matrices; the two-dimensional calculation cannot apply.
- Extending `W(k)` to `O` extends the coefficients of the two-variable ring; changing the fixed determinant is a different deformation problem.

## Layer R26.2: Prescribed lifts in conductor one

*Milestones:* lifts with prescribed nebentypus; compatible systems through potential modularity.

Every lift of this layer is an application of the prescribed-lift and compatible-system theorems of Input I.3; the targets verify their local hypotheses in the cases the level-one proof needs. Throughout, `2 ≤ k(ρ̄) ≤ p + 1` and `k(ρ̄) ≠ p`, and the unframed relative dimension of the local ring at `p` is `h⁰(D_p, Ad⁰ρ̄) + 1`.

**Flatness of the deformation rings of prescribed lifts** (`R26.2/lifting-method-flatness`). Let `p` be odd and `ρ̄ : G_ℚ → GL₂(𝔽)` odd and irreducible with non-solvable image, with `2 ≤ k(ρ̄) ≤ p + 1` and `k(ρ̄) ≠ p`. Let `R` be the deformation ring of lifts with fixed determinant, unramified outside a fixed finite set, with prescribed local conditions. Suppose (a) each local ring `R_ℓ (ℓ ≠ p)` is a flat complete intersection over `𝒪` of relative dimension `h⁰(D_ℓ, Ad⁰ρ̄)`, and `R_p` one of relative dimension `h⁰(D_p, Ad⁰ρ̄) + 1`, and (b) `R/(π)` is finite. Then `R` is finite flat and a complete intersection over `𝒪`, and in particular `ρ̄` has a lift of the prescribed type. Finiteness of `R/(π)` comes from a totally real Galois field `F` of even degree over which `ρ̄` becomes modular (Taylor), `R_F ≅ T_F`, and the equality of the orders of the inertia images, which makes `ρ_R|_{G_F}` a specialisation of `ρ_{R_F}`. For `p = 3` an auxiliary prime handles non-neatness.
Source: [Kh], §2.1, pp. 8 and 11; [KW-Ann], Proposition 3.8 and Theorem 3.7, pp. 241–242; Lemma 3.6, p. 241, for the finite-characteristic criterion.
*Needs:* `R26.1/bockle-appendix-minimal-deformation-ring-presentation`; Input I.3; Input I.2.

**Checks.**

- Finiteness of the Hilbert ring first gives finite residual universal image after restriction; the finite index of `G_F` then gives finite image over `ℚ`.
- A finite residual deformation ring alone need not be flat: `O/(π)` is a counterexample. The bound on relations supplies the additional argument.
- Without a matching modular seed over `ℚ`, the Hilbert comparison proves finiteness over `ℚ`, but does not identify a rational Hecke algebra.

**Minimal weight-two lifts of ordinary representations** (`R26.2/minimal-weight-two-lift`). Let `p > 3` and `ρ̄` odd absolutely irreducible, ordinary at `p`, with `2 ≤ k(ρ̄) ≤ p + 1` and `k(ρ̄) ≠ p`. Then `ρ̄` has a lift `ρ` that is minimal at every `ℓ ≠ p`, has determinant `ε ω_p^{k(ρ̄)−2} χ_p`, and satisfies `ρ|_{I_p} ≅ (ω_p^{k−2}χ_p, ∗; 0, 1)` when `ρ̄|_{I_p} ≅ (χ̄_p^{k−1}, ∗; 0, 1)`; it is Barsotti–Tate when `k(ρ̄) = 2`. For `2 < k < p + 1` the tame character `ω_p^{k−2}` is nontrivial and the lift becomes Barsotti–Tate over `ℚ_p(μ_p)`; at the endpoint `k = p + 1` the conductor-one induction uses the semistable weight-two branch. If the image is solvable, Serre's conjecture is known in refined form, and Gross and Edixhoven place an ordinary `mod p` eigenform of weight `k(ρ̄)` in `S₂(Γ₁(N) ∩ Γ₀(p), ω^{k(ρ̄)−2})`; otherwise apply the previous target with the smooth ordinary local ring at `p` of relative dimension `1 + h⁰(D_p, Ad⁰ρ̄)`.
Source: [Kh], Proposition 2.1, Conventions §2.2, p. 12.
*Needs:* `R26.2/lifting-method-flatness`; `LocalGaloisDeformationRings Layer 8`; `ArithmeticGaloisRepresentations Layer 4`; Input I.3; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; `SerreWeightAndLevelOptimisation Layer 6`.

**Smoothness of the local ring at an auxiliary prime** (`R26.2/local-ring-at-q-smooth`). Let `p` and `q` be distinct odd primes with `p^e ∥ q − 1, e > 0`. Suppose `ρ̄|_{I_q} ≅ (χ̄, ∗; 0, 1)` is ramified, `χ̄` a `mod p` character of `Gal(ℚ_q(μ_q)/ℚ_q)` with Teichmüller lift `χ`, and put `η_q = ω_q^{(q−1)/p^e}`. Enlarge `𝒪` to contain the values of `χ` and `η_q`. The versal ring `R_q` of lifts of `ρ̄|_{D_q}` with determinant `ε χ_p^{k(ρ̄)−1} η_q^i` and `ρ|_{I_q} ≅ (χη_q^i, ∗; 0, 1)` is smooth over `𝒪` of relative dimension `h⁰(D_q, Ad⁰ρ̄) = 1`.
Proof outline: the mod-`π` tangent space has dimension `1`. Lifts are tame, given by the images `A` of a Frobenius `σ_q` and `B` of a tame generator `τ_q` with `ABA⁻¹ = B^q`. If `χ ≠ 1`, take diagonal lifts. If `χ = 1` and `χ′ = η_q^i ≠ 1`, with `ρ̄(σ) = (r_F, b; 0, r_F)` and `ρ̄(τ) = (1, 1; 0, 1)`, look for `A = (α, γ; 0, β)` and `B = (χ′(τ), 1; 0, 1)`. As `B` has order dividing `q − 1` the relation is `AB = BA`, that is `α − β = γ(χ′(τ) − 1)`; with `αβ = ψ` this gives `β² + βγ(χ′(τ) − 1) − ψ = 0`. Its derivative reduces to `2r_F`, a unit for `p` odd, and Hensel's lemma gives a one-parameter family. If `χ′ = 1` this is Taylor's computation.
Source: [Kh], proof of Proposition 2.2, p. 15 (the printed quadratic has the wrong sign in front of `βγ`; see Corrections to the sources).
*Needs:* `LocalGaloisDeformationRings Layer 2`.

**Lifts with prescribed nebentypus at an auxiliary prime** (`R26.2/nebentype-lift-at-q`). Let `p` be odd and `ρ̄` odd irreducible with non-solvable image, `2 ≤ k(ρ̄) ≤ p + 1, k(ρ̄) ≠ p`, with `ρ̄|_{I_q}` as in the previous target. For every integer `i` there is a lift `ρ` with determinant `ε χ_p^{k(ρ̄)−1} η_q^i`, minimal outside `{p, q}`, crystalline of weight `k(ρ̄)` at `p`, and with `ρ|_{I_q} ≅ (χη_q^i, ∗; 0, 1)`. The level-one proof uses it only for `k(ρ̄) = 2, ρ̄` unramified outside `{p, q}` and nontrivial nebentypus. The crystalline local ring at `p` is checked case by case: the irreducible Fontaine–Laffaille export for `k ≤ p`, the ramified or distinguished ordinary export, and the endpoint export for weight `p + 1` with compatible determinant.
Source: [Kh], Proposition 2.2, Conventions §2.3, p. 13; [KW-Ann], Proposition 3.5, pp. 240–241 (the endpoint).
*Needs:* `R26.2/lifting-method-flatness`; `R26.2/local-ring-at-q-smooth`; `LocalGaloisDeformationRings §8.3`; `LocalGaloisDeformationRings §8.9`; `LocalGaloisDeformationRings §8.15`; Input I.3.

**Placing the lifts in compatible systems** (`R26.2/compatible-system-lifts`).
(i) Let `p > 3, ρ̄` as in the minimal weight-two target and `ρ` a minimal weight-two lift. There is a weakly compatible system `(ρ_λ)` over a number field `E` containing `ρ` at the place given by `ι_p`. Its member at a place above a prime `ℓ > 2` unramified in `ρ̄` is Barsotti–Tate at `ℓ`, unramified outside `{ℓ} ∪ Ram(ρ̄)`, and has the inertial Weil–Deligne parameter of `ρ` at `p`.
(ii) Let `p` be odd (`p = 3` allowed), `ρ̄` with non-solvable image, `k(ρ̄) = 2`, and the lift of the previous target with nontrivial nebentypus `χη_q^i = ω_q^j, 1 ≤ j ≤ q − 2`. There is such a system whose member above `q` is unramified outside `{q} ∪ (Ram(ρ̄) ∖ {p})`, unramified at `p` and Barsotti–Tate over `ℚ_q(μ_q)`. If its residual representation has non-solvable image, its Serre weight is `j + 2`, or else the twist by `χ_q^{−j}` has Serre weight `q + 1 − j`.
Proof outline: use the field, weight, coefficient embeddings and arithmetic-dual Hilbert attachments fixed in I.3 at each descended `π_i`, with the local comparisons of AutomorphicGaloisRepresentations §§4.4 and 4.7. Taylor's potential modularity over a Galois totally real field `F`, Brauer's induction `1 = Σ n_i Ind χ_i` over solvable subextensions, and Arthur–Clozel base change give `ρ` as a virtual sum `Σ n_i Ind(χ_i ⊗ ρ_{π_i})`, which is a true representation at the other places too; here `ρ_{π_i}` denotes the arithmetic dual specified in I.3. For (i) Taylor's field is unramified at `p` and the form is ordinary or Steinberg at `p`. For (ii) use a solvable extension completing to `ℚ_q(μ_q)`, Breuil's theorem on finite flat reductions, level raising to a form square-integrable at an auxiliary place, Saito's local-global compatibility for the inertial parameter, and Breuil–Mézard and Savitt for the weights.
Source: [Kh], Proposition 3.1, §3, pp. 16–17.
*Needs:* `R26.2/minimal-weight-two-lift`; `R26.2/nebentype-lift-at-q`; Input I.3; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`; AutomorphicGaloisRepresentations §§3.10–3.14, 4.4, 4.7 and 7.3.

**Checks.**

- A parallel-weight-two descended form is within the small-ramification supplier's attachment scope; a weight-twelve one requires the general Hilbert constructor.
- For the discriminant form over `ℚ`, arithmetic Frobenius at `2` on the arithmetic dual has polynomial `X²+24X+2048`; using the geometric convention on that same representation gives reciprocal roots.
- A Steinberg place has nonzero monodromy. Equality of good-prime trace polynomials alone does not replace the local comparison needed to preserve that parameter.

## Layer R26.3: Prime estimates and the weight recursion

*Milestone:* the weight induction for level one.

The prime estimates are owned here and shared with R27.2. Use Nagura's elementary interval theorem, derived from factorial estimates and Chebyshev's `ψ`. Khare's printed uniform Chebyshev-type bound is false (Corrections to the sources).

**Factorial estimates for the elementary prime bound** (`R26.3/elementary-factorial-estimates`). Write `T(x) = log(⌊x⌋₊!)` for `x ≥ 0`. Prove the finite identity `T(x) = Σ_{1 ≤ n ≤ ⌊x⌋₊} ψ(x/n)` using the von Mangoldt divisor sum and `Chebyshev.psi`. With `LΓ(x) = log(Real.Gamma x)`, prove that for every integer `n > 1` the functions `LΓ(x)/n − LΓ((x+n−1)/n)` on `x > 1` and `LΓ(x+1)/n − LΓ(x/n+1)` on `x > 0` are strictly increasing. Prove the explicit Stirling remainder
`0 < LΓ(x) − ((x−1/2)log x − x + log(2π)/2) < 1/(12x)` for `x > 0`.

Use the resulting floor comparisons to prove, for `x ≥ 2000`,
`U(x) = T(x)−T(x/2)−T(x/3)−T(x/7)−T(x/43)−T(x/1806) < (10851/10000)x`,
and `V(x) = T(x)−T(x/2)−T(x/3)−T(x/5)+T(x/30) > (229/250)x`.
Derive the log-Gamma difference inequalities from strict convexity of `LΓ` on the positive reals and differentiation; establish that strictness from `Real.convexOn_log_Gamma` and the Gamma functional equation. Derive the signed remainder by the convergent logarithmic series and integration extending the bounds for the existing Stirling sequence to positive real arguments. Prove the numerical log inequalities by rational upper and lower series bounds.
Source: [Na], Lemma 1 and equations (1)–(2), pp. 177–179.
*Needs:* Mathlib `Chebyshev.psi`, `ArithmeticFunction.vonMangoldt`, `Real.Gamma`, its derivative API in `Mathlib/Analysis/SpecialFunctions/Gamma/Deriv.lean`, and `Mathlib/Analysis/SpecialFunctions/Stirling.lean`; finite sums, integration and rational bounds for `Real.log`.

**Checks.**

- At `x = 6`, `T(x) = log(720)`; the sum of `ψ(6/n)` has prime exponents `2⁴·3²·5`, so omitting the terms with `n > 1` fails.
- At positive integral `x`, the floor in `T` includes `x`; the left limit at a prime power has a smaller `ψ` value.
- The Stirling remainder is positive at `x = 1` and less than `1/12`; an asymptotic equivalence without the signed error does not give the displayed inequalities.

**Elementary bounds on `ψ`** (`R26.3/elementary-psi-bounds`). Prove `ψ(x)−ψ(x/1806) ≤ U(x)` and `V(x) ≤ ψ(x)` for `x > 0` by grouping the finite sums above. Extend the upper estimate `ψ(x)−ψ(x/1806) < (10851/10000)x` to `0 < x < 2000`, and prove `ψ(x) > (229/250)x−1159/500` throughout that range, including the appropriate one-sided endpoints of the prime-power intervals. Sum the upper estimate along `x/1806^j` until `ψ` vanishes to obtain
`(229/250)x−1159/500 < ψ(x) < (543/500)x` for every `x > 0`.
Mathlib already supplies `Chebyshev.psi_le_const_mul_self`, giving `ψ(x) ≤ (log 4 + 4)x` for `x ≥ 0`, `Chebyshev.psi_le`, giving `ψ(x) ≤ (log 4)x + 2√x log x` for `x ≥ 1`, and `Chebyshev.psi_ge'`, giving `(x−1)log 2 − log(x+2) ≤ ψ(x)` for `x ≥ 0`, in `Mathlib/NumberTheory/Chebyshev.lean`. Their asymptotic constants are weaker; the constants `1.086` and `0.916` supply the sharper comparison required for the six-fifths interval.
Source: [Na], Lemma 2 and proof, pp. 179–180.
*Needs:* `R26.3/elementary-factorial-estimates`; Mathlib's finite prime factorisation and `Chebyshev.psi_eq_zero_of_lt_two`.

**Checks.**

- On `0 < x < 2`, `ψ(x) = 0` and the lower affine bound is negative; a positive linear lower bound would fail.
- At `x = 2`, `ψ(x) = log 2`, with the jump included.
- `(10851/10000)·1806/1805 < 543/500`; the geometric summation changes the upper constant.

**Primes in a six-fifths interval** (`R26.3/elementary-prime-interval`). For every integer `n ≥ 25`, prove that a prime `P` satisfies `n < P` and `5P < 6n`. For real `x ≥ 100000`, put `y = 6x/5`. The existing comparison
`ψ(y)−θ(y) ≤ ψ(y^(1/2))+ψ(y^(1/3))+ψ(y^(1/5))`
and the preceding bounds give
`θ(y)−θ(x) > (229/250)y−1159/500−(543/500)(x+y^(1/2)+y^(1/3)+y^(1/5)) > 0`.
Prove the final strict inequality at `100000` by rational power bounds and extend it by monotonicity after division by `x`. For every integer `25 ≤ n ≤ 100000`, prove the existence of a prime witness with `5P < 6n`. Prove the displayed inequalities throughout the stated finite ranges. Since `θ` is the sum of `log P`, positive difference supplies a prime in `(x,6x/5]`; when `x = n` is an integer at least `25`, the upper endpoint cannot itself be prime, giving the strict inequality. This is the elementary route needed for the recursion.
Source: [Na], theorem and proof, pp. 180–181 (the large threshold `100000` above is a weaker sufficient bound).
*Needs:* `R26.3/elementary-psi-bounds`; `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi`; `Chebyshev.theta_eq_sum_primesLE`; primality and rational-power inequalities.

**Checks.**

- `n = 25` has witness `29`; `n = 24` has no prime strictly between `24` and `6·24/5`.
- `n = 100000` has witness `100003`, on the finite/large-range boundary.
- A prime cannot equal `6n/5` for integral `n ≥ 25`: if integral, it is a multiple of `6`.

**The consecutive-prime ratio** (`R26.3/next-prime-ratio`). If `p ≥ 31` is prime and `P` is the least prime greater than `p`, then `P/p < 6/5 < 22/15`, so `P/p ≤ 3/2 − 1/30`. Each of the next two primes is less than `6/5` times its predecessor. At most one is a Fermat prime, since Bertrand's postulate supplies a prime between any two consecutive Fermat primes above `5`. Thus the least non-Fermat prime above `p` has ratio less than `(6/5)² = 36/25 < 1499/1000`, in particular for `p ≥ 21591`.
Source: [Na], theorem, pp. 180–181; [KW-I], §7, p. 12, for the ratio required by the recursion.
*Needs:* `R26.3/elementary-prime-interval`; `Nat.exists_prime_lt_and_le_two_mul`.

**Checks.**

- The consecutive primes `31,37` satisfy `37/31 < 6/5`.
- After `251`, the next prime `257` is Fermat and the next non-Fermat prime is `263`; both steps obey the bound.
- `36/25 < 1499/1000 < 3/2`; Bertrand's factor `2` alone would not give the recursion's ratio.

**Auxiliary-prime estimate in the finite range** (`R26.3/finite-auxiliary-prime-checks`). Prove `Hfinite`: for every prime `5 ≤ p ≤ 21591`, if `P` is the least non-Fermat prime greater than `p`, there are an odd prime `ℓ ≤ p` and `e ≥ 1` with `ℓ^e ∥ P−1`, `ℓ^e = 2m+1` and `(m+1)P+m ≤ (2m+1)p`. Prove the displayed inequalities throughout the stated finite ranges, retaining the least non-Fermat condition and exact valuation. This finite-range theorem enters every classical endpoint through Khare’s prime estimate below.
Source: [Kh], §4, pp. 19–20, for the inequality and finite range used in the recursion.
*Needs:* Mathlib's primality and factorisation API.

**Checks.**

- For `p ≤ 31`, the triples `(p,P,ℓ^e)` are `(5,7,3), (7,11,5), (11,13,3), (13,19,9), (17,19,9), (19,23,11), (23,29,7), (29,31,5), (31,37,9)`; the two occurrences of `19` include skipping the Fermat prime `17`.
- At `p = 251`, skip `257 = 2⁸+1` and take `P = 263`, `ℓ^e = 131`; taking the next prime without testing the Fermat condition fails.
- The upper endpoint includes the last prime `21589 ≤ 21591`; its witness is `P = 21599`, `ℓ^e = 10799`, and `(5400·21599)+5399 ≤ 10799·21589`. The estimate includes this endpoint as well as the small rows.

**Khare's prime estimate** (`R26.3/chebyshev-next-prime`). For every prime `p_n ≥ 31` there are a prime `P_{n+1} > p_n` that is not a Fermat prime (`P_{n+1} = p_{n+1}`, or `p_{n+2}` when `p_{n+1}` is a Fermat prime) and an odd prime power `ℓ^e = 2m + 1` exactly dividing `P_{n+1} − 1`, with `ℓ ≤ p_n` and

`P_{n+1}/p_n ≤ (2m + 1)/(m + 1) − (m/(m + 1))(1/p_n).   (1)`

For `p_n ≤ 21591` this is the finite table. For larger `p_n` the ratio bound gives `P/p < 1499/1000 ≤ 3/2 − 1/p`, and the right side of `(1)` is at least `3/2 − 1/p` for `m ≥ 1`. As `P` is not a Fermat prime, `P − 1` has an exact odd prime-power divisor, and every odd prime factor of `P − 1` is at most `(P − 1)/2 < p`. The finite range also supplies `p = 5, 7`, …, `29`. Khare–Wintenberger §7, case (i), uses the same estimate.
Source: [Kh], §4, pp. 19–20.
*Needs:* `R26.3/next-prime-ratio`; `R26.3/finite-auxiliary-prime-checks`.

**Checks.**

- At `p = 31`, take `P = 37`, `ℓ^e = 9` and `m = 4`; the inequality is `189 ≤ 279`.
- At `p = 13`, `P = 19` uses the exact divisor `3²`, not `3³`; the exact exponent is part of the estimate.
- A Fermat choice such as `P = 257` has `P−1` a power of two and cannot supply the required odd divisor.

**Twisting the Serre weight** (`R26.3/serre-weight-twist`). Let `τ : G_{ℚ_p} → GL₂(𝔽)` have Serre weight `k ≠ 2` with `k < p`. If `τ` is irreducible and `k − 1 = p − k′` with `k′ ≥ 0`, then `τ ⊗ χ̄_p^{k′}` has weight `k′ + 2 = p + 3 − k`. If `τ|_{I_p}` is split, `τ ⊗ χ̄_p^{1−k}` has weight `p + 1 − k`. This is read off Serre's recipe.
Source: [Kh], Lemma 5.2, §5, p. 21.
*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.4`.

**The new weights fall into the known range** (`R26.3/weight-interval-containment`). Let `p_n ≥ 31` and `P = P_{n+1} > p_n` be odd primes and `ℓ^e = 2m + 1 ∥ P − 1, ℓ` an odd prime, `e ≥ 1`, satisfying `(1)`; put `L = (P − 1)/ℓ^e`, a positive integer. For every integer `j` with mL `< j ≤ (m + 1)L`, both `j + 2` and `P + 1 − j` lie in `[2, p_n + 1]`. The half-open interval (mL, `(m + 1)L`] contains exactly one integer in each residue class modulo `L`, so the nebentypus `χη_P^i` can be chosen with `j` in it: choose the representative of the coset of the original tame exponent. Both upper bounds are equivalent to `(m + 1)P ≤ (2m + 1)p_n − m`, that is to `(1)`.
Source: [Kh], §6.2, p. 27.
*Needs:* `R26.3/chebyshev-next-prime`; `R26.2/nebentype-lift-at-q`.

**The well-founded induction on the weight bound** (`R26.3/level-one-induction-scheme`). For `B ≥ 2` let `S(B)` say: every odd irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄_s)`, in every characteristic `s`, with `N(ρ̄) = 1` and `k(ρ̄) ≤ B`, is modular. Then `S(32)` holds (R26.5), and `S(p_n + 1)` implies `S(P_{n+1} + 1)` for the primes `p_n ≥ 31` of the prime estimate. In the step every recursive appeal is to weight at most `p_n + 1`, to weight two at level one (excluded, so the representation is reducible), or to solvable image (known). The induction is on the bound `B`, not on the prime: changing to the foil prime and back does not change `B`.
The step first proves the full level-one theorem in characteristic `P`: weights `≤ p_n + 1` come from `S(p_n + 1)`, and the new normalised weights `p_n + 2 ≤ k ≤ P + 1` from the step. Only then does Corollary 5.5(ii) export `S(P + 1)` to every characteristic. Corollary 5.5(i) moves a fixed weight `k ≤ p + 1` only to characteristics `q ≥ k − 1`, so a bounded statement in one characteristic does not suffice. Cyclotomic normalisation and its undoing come from Serre's recipe; characteristics `2` and `3` are Tate's and Serre's.
Source: [Kh], §6.2, p. 26.
*Needs:* `R26.3/weight-interval-containment`; `R26.3/serre-weight-twist`; `R26.4/level-one-lifting-lemma`; `R26.5/small-weights-table`; `R26.4/ordinary-reduction-and-parity`; `AlgebraicModularFormsAndSerreWeights:R15.4`.
The intended signature is `LevelOneUpTo : ℕ → Prop`, with exactly the quantifiers in `S(B)`. Its API is `LevelOneUpTo.mono` (`S(C)` implies `S(B)` for `B ≤ C`), the terminal bound `S(32)`, and the displayed step `levelOneUpTo_step`, using the finite-range auxiliary-prime theorem.

**Checks.**

- At bound `2` the predicate includes only level-one representations of weight at most `2`; a representation of weight `4` is outside its quantifiers.
- `S(32)` supplies the weight-`32` case, whereas `S(31)` alone does not; the inequality at the bound is inclusive.
- Enlarging the bound adds representations, so monotonicity of available proofs goes from `S(C)` to `S(B)` for `B ≤ C`. It does not follow in the opposite direction merely from inclusion.

## Layer R26.4: Ordinary and degenerate branches

Each change of prime can produce a residual representation that is reducible, bad dihedral, or solvable but cyclotomically absolutely irreducible. These are three different branches, with three different lifting theorems. The bad-dihedral branch, in the level-one lifting lemma and in the degenerate branches, rests on Skinner–Wiles' nearly ordinary lifting for residuals induced from `ℚ(√p*)`; for `p ≡ 3 (mod 4)` that field is imaginary. This case of nearly ordinary lifting, which Khare–Wintenberger take from Skinner's unpublished correction to Skinner–Wiles, is a target of Input I.1.

**Residually reducible potentially Barsotti–Tate lifts are ordinary** (`R26.4/local-reducibility-ordinary`). Let `p` be odd and `V` a two-dimensional potentially crystalline representation of `G_{ℚ_p}` with Hodge–Tate weights `{0, 1}`. Suppose that after a Teichmüller twist `WD(V)|_{I_p} ≅ ω_p^i ⊕ 1` with `1 ≤ i ≤ p − 2`, and let `T` be any `G_{ℚ_p}`-stable lattice over a large enough coefficient ring. If `T` modulo its maximal ideal is reducible, then `V` is reducible and ordinary up to a power of `ω_p`. Nothing is claimed for other potentially Barsotti–Tate types, and no `End(ρ̄) = 𝔽` hypothesis is needed.
Proof outline: in Breuil–Mézard's parametrisation `V(μ, ξ)`, an intermediate slope `0 < v_p(ξ) < 1` gives an irreducible residual representation of niveau two. A reducible lattice therefore forces slope `0` or `1`, the two reducible endpoints, which are ordinary after a Teichmüller twist and related by twist and Cartier duality. Savitt's integral classification gives the same answer; for lattices without trivial endomorphisms use his description of the semisimplification (Remark 6.17), as reducibility in dimension two is reducibility of the semisimplification.
Source: [Kh], Lemma 5.3, §5, p. 21; [BM], §6.1, Proposition 6.1.1, author copy p. 68; [Sa], Theorem 6.11, pp. 34–35, Corollary 6.15(1), p. 38, and Remark 6.17, p. 39.
*Needs:* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`.

**Level-one lifting and the change of prime** (`R26.4/level-one-lifting-lemma`). Let `p` be odd and `ρ` an irreducible `p`-adic representation unramified outside `p`, crystalline at `p` with Hodge–Tate weights `(k − 1, 0), k` even with `2 ≤ k ≤ p + 1`, with `ρ̄` modular. Then `ρ` arises from `S_k(SL₂(ℤ))`. Consequently:
(i) if every odd irreducible `mod p` representation of level one and weight `k ≤ p + 1` is modular, so is every such representation `mod q` of weight `k`, for every prime `q ≥ k − 1`;
(ii) the level-one theorem `mod` one prime `p > 2` gives it `mod` every prime `q` for weights `≤ p + 1`.
Proof outline: if `ρ̄` is irreducible but reducible over `ℚ(√p*)`, Wintenberger's lemma makes `ρ̄|_{I_p}` ordinary and distinguished, and nearly ordinary lifting applies; otherwise the lifting theorems of Wiles, Taylor–Wiles, Diamond and Skinner–Wiles apply, except non-ordinary weight `p + 1`, which Berger–Li–Zhu (Corollary 4.1.3) exclude because it would make `ρ̄|_{D_p}` irreducible of weight two, impossible at level one. For Corollary 5.5, first remove dihedral and bad-dihedral residuals with theta-series modularity and the exact weight and level theorem; then the residual restriction to `G_{ℚ(μ_q)}` is absolutely irreducible. Take the crystalline minimal lift of weight `k` and its general-weight compatible system (a weight-two system does not suffice), check the residual weight at `p`, apply the first statement and transfer along the system. The scalar crystalline input at the foil uses `k = 2 < p`.
Source: [Kh], Lemma 5.4 and Corollary 5.5, p. 22; [BM], §4.1, Proposition 4.1.1 and its proof, author copy pp. 30–31.
*Needs:* `SmallRamificationAndAbelianVarietyBaseCases §5.6`; `SmallRamificationAndAbelianVarietyBaseCases §5.8`; Input I.1; `R26.2/lifting-method-flatness`; Input I.2; `LocalGaloisDeformationRings §8.3`; `LocalGaloisDeformationRings §8.9`; `LocalGaloisDeformationRings §8.15`; Input I.3; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `SerreWeightAndLevelOptimisation Layer 5`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

**The degenerate branches of the level-one step** (`R26.4/degenerate-branches`). In the inductive step at `P` let `ρ` be the irreducible minimal weight-two lift, `ρ̄_ℓ` its residual member at the foil `ℓ`, and `ρ″` the `P`-adic member of the second system.
(a) If `ρ̄_ℓ` has solvable image, separate three cases. If it is reducible, its Barsotti–Tate lift is ordinary and distinguished and residually reducible ordinary lifting applies. If it is irreducible but reducible on `G_{ℚ(μ_ℓ)}`, the general bad-dihedral weight lemma excludes local irreducibility in weight two (it would force weight `(ℓ + 3)/2`), so the distinguished ordinary branch applies. If it is absolutely irreducible on that restriction, solvable residual modularity and a potentially Barsotti–Tate lifting theorem apply; solvability alone does not give ordinarity.
(b) If `ρ̄_ℓ` is unramified at `P`, it has weight two and level one and is therefore reducible; the ordinary branch applies.
(c) At the return member, local residual reducibility at `P` makes `ρ″` ordinary up to a Teichmüller twist by the nonscalar local classification, distinguished because `j` is even. Globally irreducible bad-dihedral return residuals have level one and are ordinary by the level-one dihedral classification; cyclotomically absolutely irreducible solvable ones use solvable modularity and potentially Barsotti–Tate lifting.
At the foil `ℓ` the residual representation may be ramified at both `ℓ` and `P`, so the general normalised-weight form of the bad-dihedral lemma is used there, not the level-one classification. For the scalar crystalline weight-two lift at `ℓ`, Breuil–Mézard Proposition 4.1.1 with `k = 2 < ℓ` shows that an irreducible characteristic-zero branch has irreducible reduction; otherwise the ordinary characters reduce to `χ̄_ℓ` and `1`, which differ for `ℓ` odd. Before applying an ordinary lifting theorem, check irreducibility of the characteristic-zero lift, the ordinary local shape and distinct residual inertia characters.
Source: [Kh], §6.2, pp. 26–27; [BM], §4.1, Proposition 4.1.1, author copy pp. 30–31.
*Needs:* `R26.4/local-reducibility-ordinary`; `R26.4/level-one-lifting-lemma`; `R26.4/ordinary-reduction-and-parity`; `SmallRamificationAndAbelianVarietyBaseCases §5.6`; `SmallRamificationAndAbelianVarietyBaseCases §5.8`; Input I.1; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; Input I.2; `AlgebraicModularFormsAndSerreWeights:R15.4`; Input I.3; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

**Ordinary reduction and residual distinction** (`R26.4/ordinary-reduction-and-parity`). At level one `k` is even. In the step with previous bound `p₀ + 1` and new characteristic `P, p₀ + 2 ≤ k ≤ P + 1`: a locally irreducible representation with `k < P` has a cyclotomic twist of weight `P + 3 − k`, and a locally split one a twist of weight `P + 1 − k`; the auxiliary-prime inequality puts both weights in the proved range. What remains is ordinary, including `k = P + 1`. The ordinary weight-two lift has inertial characters whose residual ratio is nontrivial, because `k − 1` is odd and `P − 1` is even. At a return member with even tame exponent `j, 1 ≤ j ≤ P − 2`, the same parity gives the distinguished hypothesis after the Teichmüller twist. The twist formulas need `k ≠ 2` and `k < P; k = P + 1` is treated by its ordinary classification.
Source: [Kh], §6.2, pp. 26–27.
*Needs:* `R26.3/serre-weight-twist`; `R26.3/chebyshev-next-prime`; `AlgebraicModularFormsAndSerreWeights:R15.4`.

## Layer R26.5: The terminal weights up to 32

The recursion of R26.3 starts at `31`, so the even weights up to `32` are proved directly. Weights `2, 4` and `6` come from the earlier Khare–Wintenberger Annals theorem ([KW-Ann], Theorems 5.2 and 5.4), which rests on the results of Fontaine, Schoof and Brumer–Kramer on semistable abelian varieties over `ℚ` with small ramification; characteristics `2` and `3` are Tate's and Serre's. Odd weights do not occur at level one because of the determinant.

**The terminal-row contract** (`R26.5/terminal-row-branch-contract`). Each row is a triple `(P, ℓ, j): P` and `ℓ` distinct odd primes, `ℓ^e ∥ P − 1`, and an even `j` with `1 ≤ j ≤ P − 2` and `j ≡ k − 2` modulo `(P − 1)/ℓ^e`. Start with an odd absolutely irreducible level-one mod-`P` representation of an even weight `k` of the row. After the local twist reduction it is ordinary; construct its minimal weight-two lift and system. The mod-`ℓ` member has weight two and is ramified only at `ℓ` and `P`. If it is solvable, use the three branches of `R26.4/degenerate-branches`; if it is unramified at `P`, the level-one weight-two exclusion makes it reducible. Otherwise change its nebentypus at `P` to `ω_P^j`, form the second system and return to `P`. Reducible and solvable return members use local ordinarity and the lifting theorems; non-solvable ones have weight `j + 2`, or a cyclotomic twist of weight `P + 1 − j`, both already proved: by an earlier row, or, for weights `2, 4` and `6`, by the Annals theorem. Undo the twist, lift modularity, transfer at `ℓ` and then to the initial representation, and optimise its weight and level. At each transition check the full determinant and local type, not only the weights. At the endpoint `k = P + 1` the minimal weight-two lift is semistable at `P`, so the mod-`ℓ` member is unipotent on `I_P` and the admissible exponent coset is `0`.
Source: [Kh], §6.1, pp. 23–26.
*Needs:* `R26.2/minimal-weight-two-lift`; `R26.2/nebentype-lift-at-q`; `R26.2/compatible-system-lifts`; `R26.4/degenerate-branches`; `R26.4/ordinary-reduction-and-parity`; Input I.3; `SerreWeightAndLevelOptimisation Layer 6`; `AlgebraicModularFormsAndSerreWeights:R15.4`.

The five rows are separate targets. Each proves every odd absolutely irreducible level-one representation of the listed weights modular, first in characteristic `P`; together with the earlier rows this gives the full level-one theorem in characteristic `P` up to that weight, and only then Corollary 5.5(ii) exports the bound to every characteristic. After reduction at `ℓ` the ramification is contained in `{ℓ, P}`. No abelian variety is constructed in these rows.

| Target | Weights | `P` | `ℓ^e` | `j` | Return weights |
| --- | --- | --- | --- | --- | --- |
| `R26.5/weight-eight` | `8` | `7` | `3` | `2` | `4, 6` |
| `R26.5/weights-ten-twelve` | `10, 12` | `11` | `5` | `4` | `6, 8` |
| `R26.5/weights-fourteen-twenty` | `14–20` | `19` | `9` | `8` | `10, 12` |
| `R26.5/weights-twentytwo-thirty` | `22–30` | `29` | `7` | `16` for `k = 22, 26, 30; 14` for `k = 24, 28` | `18, 14; 16` |
| `R26.5/weight-thirtytwo` | `32` | `31` | `5` | `18` | `20, 14` |

At `P = 29` the coset condition is modulo `(29 − 1)/7 = 4: k − 2 = 20, 24, 28` give exponent `0` modulo `4` and `k − 2 = 22, 26` give `2` modulo `4`, whence `j = 16` and `j = 14`. At `P = 31` the minimal weight-two lift of a weight-`32` representation is semistable at `31`, so the mod-`5` member is unipotent on `I₃₁` and the nebentypus must be `ω₃₁^{6i}; j = 18` lies in the interval `(12, 18]` and is divisible by `6` (Khare prints `16`; see Corrections to the sources). In the row for weights `22–30` the mod-`7` companion is ramified only at `7` and `29`.
Source: [Kh], §6.1, pp. 23–26.
Prerequisites of each row: `R26.5/terminal-row-branch-contract`; `R26.4/level-one-lifting-lemma`; `SmallRamificationAndAbelianVarietyBaseCases §5.11`; `SmallRamificationAndAbelianVarietyBaseCases Layer 2`; and the previous row.

**The small-weight table** (`R26.5/small-weights-table`). The even weights up to `32` at level one are modular in every characteristic: weights `2, 4, 6` from the Annals theorem and characteristics `2, 3` from Tate and Serre (both through `SmallRamificationAndAbelianVarietyBaseCases §5.11`), then the five rows in increasing order. This is `S(32)`.
Source: [Kh], §6.1, pp. 23 and 25.
*Needs:* `R26.5/weight-eight`; `R26.5/weights-ten-twelve`; `R26.5/weights-fourteen-twenty`; `R26.5/weights-twentytwo-thirty`; `R26.5/weight-thirtytwo`; `SmallRamificationAndAbelianVarietyBaseCases §5.11`.

## Layer R26.6: The level-one theorem and the start of the conductor induction

*Milestone:* assembly of the level-one proof.

**Proof of the level-one theorem** (`R26.6/level-one-proof-assembly`). In the inductive step the second compatible system `(ρ′_λ)` is modular: its `P`-adic member has residual weight at most `p_n + 1`, or falls into a degenerate branch. It is linked to the first system `(ρ_λ)` at the place above `ℓ`, where both have the same non-solvable residual representation. Modularity lifting makes `(ρ_λ)` modular, so `ρ̄` is modular of some weight and level, hence of weight `k(ρ̄)` and level `1` by Ribet's and Edixhoven's optimisation. With `S(32)` this proves `S(B)` for all `B`. The two systems add no fixed Weil–Deligne ramification at `ℓ`: their `ℓ`-adic lifts are crystalline of weight two, although a member may ramify at its own coefficient prime. Linked-system transfer is applied only after its residual and local hypotheses are checked.
Source: [Kh], §6.2, p. 28.
*Needs:* `R26.3/level-one-induction-scheme`; `R26.4/degenerate-branches`; `R26.5/small-weights-table`; `SerreWeightAndLevelOptimisation Layer 6`; `AlgebraicModularFormsAndSerreWeights:R15.6`; Input I.3; Input I.2.

**Proof of Corollary 1.2** (`R26.6/corollary-1-2-proof`). The statement of `R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof` holds for all `p`.

- `q = 2`. A prime-to-`p` conductor forces `p` odd. Conductor exponent one at `2` means one-dimensional inertia invariants and zero Swan conductor; the tame character on the quotient is Frobenius-stable, so `χ = χ²` and `χ = 1`, and the inertia image is unipotent of `p`-power order. With `k = 2` this is semistability in the sense of [KW-Ann] Definition 4.1. Then [KW-Ann] Theorem 5.2(ii) excludes the case: reducible cyclotomic restriction is handled by dihedral modularity and optimisation; otherwise Theorem 4.2(ii) realises a minimal weight-two system in a `GL₂`-type abelian variety of positive dimension with good reduction outside `2` and semistable reduction at `2`, which Schoof's theorem forbids.
- `q` odd. Take the minimal weight-two system. Its Weil–Deligne parameter at `q` is either semistable with nonzero monodromy or unramified after restriction to `ℚ_q(μ_q)`; correspondingly its `q`-adic member is semistable of weight two (Saito) or becomes crystalline of weight two over `ℚ_q(μ_q)`. Its residual representation is unramified outside `q`, so the level-one theorem, or the reducible convention, gives residual modularity. The lifting step is Theorem 6.1(2) of the published Duke version of [Kh] together with Skinner–Wiles (with Skinner's correction for the residually dihedral case), using Saito's theorem in the semistable case. Transfer along the system and optimise to weight two and level `Γ₁(q)`.
Killing ramification is a method with lifting hypotheses ([KW-Ann] §6.2), not a licence to remove local ramification.
Source: [Kh], §7.1, p. 28; [KW-I], §8.3, p. 16; [KW-Ann], Definition 4.1 and Theorem 4.2(ii), pp. 243–244, Theorem 5.2(ii), p. 247, §6.2, pp. 250–251.
*Needs:* `R26.6/level-one-proof-assembly`; `R26.4/level-one-lifting-lemma`; `R26.4/local-reducibility-ordinary`; Input I.3; Input I.1; `ArithmeticGaloisRepresentations Layer 2`; `ArithmeticGaloisRepresentations Layer 3`; `SmallRamificationAndAbelianVarietyBaseCases Layer 4`; `SmallRamificationAndAbelianVarietyBaseCases §5.1`; `SmallRamificationAndAbelianVarietyBaseCases §5.2`; `SmallRamificationAndAbelianVarietyBaseCases §5.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `SerreWeightAndLevelOptimisation Layer 6`.

**Finiteness of level-one representations** (`R26.6/finiteness-corollary-1-3`). For each prime `p` there are finitely many isomorphism classes of continuous semisimple odd representations `G_ℚ → GL₂(𝔽̄_p)` unramified outside `p`. In the absolutely irreducible case, normalise the weight by one of finitely many cyclotomic twists, apply the level-one theorem and realise the form in `S₂(Γ₁(p²))`; the integral Hecke algebra there is finite over `ℤ` and has finitely many mod-`p` eigencharacters, and the residual representations are determined by their Frobenius traces. A finite complex dimension alone is not enough. In the reducible semisimple case `ρ̄` is a sum of two characters unramified outside `p`; by Kronecker–Weber they factor through the prime-to-`p` quotient of `ℤ_p^×`, so their order divides `p − 1` (they are trivial when `p = 2`).
Source: [Kh], Corollary 1.3 and its proof, §7.1, p. 28.
*Needs:* `R26.6/level-one-proof-assembly`; `AlgebraicModularFormsAndSerreWeights:R15.3`; `AlgebraicModularFormsAndSerreWeights:R15.6`; `ArithmeticGaloisRepresentations Layer 5`; [ClassFieldTheory, Layer 13][cft].
`Suggested.lean` states the full semisimple conclusion as `finite_level_one_semisimple`.

**Corollary 8.1(ii) and the initial case `(W₁)`** (`R26.6/corollary-8-1-ii-and-the-statement-W1`). Let `ρ̄` be an irreducible odd two-dimensional `mod p` representation with `k(ρ̄) = 2`, unramified outside `p` and one other odd prime `q ≠ p`, tamely ramified at `q`, with `ρ̄(I_q)` of order a power of an odd prime `t > 5`. Then `ρ̄` arises from `S₂(Γ₁(q²))`. This, not the conductor-one theorem, is the start of the conductor induction: `(W₁)` concerns locally good-dihedral representations of weight two whose odd conductor has one prime divisor, which is exactly this shape.
Proof outline: the case `t = p` reduces to Corollary 8.1(i); otherwise `t` is an odd prime greater than `5` and different from `p`, and tameness gives `t ≠ q`. A dihedral projective image is handled by Lemma 6.2; `A₄` and `S₄` reduce to level one because `t > 5`. Build an almost strictly compatible lift by Theorem 5.1(1): `ρ_p` unramified outside `{p, q}`, crystalline of weight two at `p`, with `|ρ_p(I_q)| = |ρ̄_p(I_q)|`. Look at the mod-`t` member `ρ̄_t`. If it is reducible, or unramified at `q` (which forces reducibility by the level-one weight-two case), Skinner–Wiles makes `ρ_t` modular; `ρ_t` is crystalline of weight two since `t ≠ 2`. If `ρ̄_t` is irreducible and ramified at `q`, then `k(ρ̄_t) = 2`, the ramification at `q` is unipotent, Corollary 8.1(i) gives residual modularity, and Wiles–Taylor–Wiles make `ρ_t` modular; absolute irreducibility of `ρ̄_t` over `ℚ(μ_t)` follows from `|ρ̄_t(I_q)| = t` or from `k(ρ̄_t) = 2` and Lemma 6.2(ii).
Source: [KW-I], §8.3 and Corollary 8.1(ii), pp. 15–16.
*Needs:* `R26.6/corollary-1-2-proof`; `R27.1/good-dihedral-prime-definition`; `R27.2/hypotheses-Lr-Wr-and-Dr`; Input I.3; Input I.2; Input I.1; `AlgebraicModularFormsAndSerreWeights:R15.4`.

## Layer R27.1: Good-dihedral primes and auxiliary primes

*Milestones:* good-dihedral primes; Lemma 8.2, the Chebotarev choice of auxiliary primes.

A good-dihedral prime keeps every residual representation met in the conductor induction, and in the modern proof, large: non-solvable image and projective image different from `A₅`. The first three targets use nothing from R26 (How to read the build).

**Good-dihedral primes** (`R27.1/good-dihedral-prime-definition`). Let `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` be continuous and write `N = N(ρ̄)`. A prime `q ≠ p` is a *good-dihedral prime* for `ρ̄` if

1. `ρ̄|_{I_q} ≅ ψ ⊕ ψ^q` for a nontrivial character `ψ` of `I_q` whose order is a power of an odd prime `t` with `t | q + 1` and `t > max(Q(N/q²), 5, p)`; and
2. `q ≡ 1 (mod 8)`, and `q ≡ 1 (mod s)` for every prime `s ≤ max(Q(N/q²), p)`.
`ρ̄` is *locally good-dihedral* (for `q`), or *`q`-dihedral*, if such a `q` exists. Since `t | q + 1` and `t ∤ q − 1, ψ` has niveau two at `q`. The bound on `t` uses the largest prime of the prime-to-`q` part of the conductor; the congruences in `(2)` are what make `q` split or ramify in every quadratic field unramified outside the ramification of `ρ̄` (Lemma 6.3). The predicate refers to `N(ρ̄)`, so it is not stable under arbitrary changes of level. Its purpose: starting from a `q`-dihedral representation of characteristic `P` ramified at a set `S`, the proofs of Theorems 3.1 and 3.2 only meet residual representations of characteristic at most `max(P, ℓ)` over `ℓ ∈ S ∖ {q}`, which is exactly the range where `(1)` and `(2)` are imposed.
Source: [KW-I], Definition 2.1, pp. 4–5; §8.2, Remark 2, p. 15.
*Needs:* `ArithmeticGaloisRepresentations Layer 2`; `ArithmeticGaloisRepresentations Layer 3`; `ArithmeticGaloisRepresentations Layer 4`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `Nat.maxPrimeFac`; `Nat.maxPrimeFac_one`; `Nat.isGreatest_maxPrimeFac`; `Matrix.GeneralLinearGroup`.

The suggested predicate is algebraic: it takes a representation `ρ : G → GL₂(K)`, a family of inertia homomorphisms `I_q → G`, the characteristic `p` and the conductor `N` as inputs. For the Galois specialisation `p` is the characteristic of `K, N` the actual conductor and the inertia maps the inclusions of inertia groups at chosen primes above `q`.

API:

- `IsGoodDihedralPrime` — the conjunction: `q` prime, `q ≠ p; t`, `a` and `ψ` with `t` an odd prime, `a > 0, t | q + 1`, the strict size bound, `ψ` of exact order `t^a`, and a basis change `B` with `B⁻¹ρ(x)B = diag(ψ(x), ψ(x)^q)` on inertia; and the two congruence conditions.
- `IsLocallyGoodDihedral ρ ↔ ∃ q, IsGoodDihedralPrime ρ q`, with `IsGoodDihedralPrime.locallyGood` and `IsLocallyGoodDihedral.exists_good`.
- `IsGoodDihedralPrime.inertia` and `IsGoodDihedralPrime.congruences` extract the two conditions, the second including equality at the upper end `s = max(Q(N/q²), p)`.
- `IsGoodDihedralPrime.conjugate`, `IsLocallyGoodDihedral.conjugate`: replacing `ρ` by `B⁻¹ρB, B ∈ GL₂`, changes neither predicate.
- `IsGoodDihedralPrime.q_sq_dvd_conductor`: for an actual residual Galois representation, the niveau-two inertia has no invariants, so the conductor exponent at `q` is `2` and `q² | N(ρ̄)`.

**Checks.**

- take `G = DihedralGroup 7`, `K = GaloisField 2 3 = 𝔽₈`, `p = 2`, `q = 41`, `N = 41²` and `t = 7`. For a primitive `ζ₇ ∈ 𝔽₈`, send a rotation to `diag(ζ₇,ζ₇⁻¹)` and a reflection to the swap. Inertia is the cyclic rotation subgroup, with its inclusion. The character has exact order seven, `41 ≡ 1 (mod 8)` and modulo `2`, `7 | 42`, and `7 > max(1,5,2)`. This constructs both `IsGoodDihedralPrime` and `IsLocallyGoodDihedral`. This algebraic example does not assert a global Galois realization.
- `q = 13` is never good-dihedral, as `13 ≢ 1 (mod 8)`.
- a representation trivial on `I_q` is not good-dihedral at `q`, since `ψ` must have order `t^a` with `a > 0`.
- for `p = 7, q = 241` and `N = 9 · 241², Q(N/q²) = 3`; the congruences modulo `8, 2, 3` and `5` hold but `241 ≢ 1 (mod 7)`, so the predicate fails: the bound `s ≤ max(Q(N/q²), p)` includes `s = p`.
- invariance under conjugation, with the witness basis composed with `B`.
- one good prime makes `ρ` locally good-dihedral although `13` never is; this rejects a universal quantifier in place of the existential.
- trivial inertia at every `q` excludes local good-dihedrality for every conductor parameter.

**Lemma 6.3: image and propagation** (`R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`). Let `ρ̄` be locally good-dihedral for `q`.
(i) The image of `ρ̄` is not solvable and its projective image is not `A₅`.
(ii) Let `(ρ_ι)` be a compatible system lifting `ρ̄` whose fixed Weil–Deligne ramification lies in the primes dividing `N(ρ̄)p` (each member may also ramify at its own coefficient prime), with `ρ_p|_{D_q}` a minimal lift of `ρ̄|_{D_q}`. Then for every prime `r ≤ max(Q(N(ρ̄)/q²), p)`, every mod-`r` representation `ρ̄_r` arising from the system is again good-dihedral for `q`, and so has non-solvable image with projective image other than `A₅`.
Proof outline: since `t | q + 1` and `t ∤ q − 1, ρ̄|_{D_q}` is irreducible, hence so is `ρ̄; t > 5` excludes `A₅`. If the image were solvable, Dickson's classification makes the projective image dihedral (`t > 5` excludes `A₄` and `S₄`), so `ρ̄` is induced from a quadratic field `K` unramified outside the ramification of `ρ̄`. The congruences of `(2)` make `q` split or ramify in `K`: splitting contradicts irreducibility on `D_q`, ramification contradicts `t` odd. For (ii): `t` exceeds every new residual characteristic `r` in range, so reduction is bijective on the dihedral projective image `D_{2t^a}` of the decomposition group at `q`, in particular on its cyclic inertia part of order `t^a`; new prime divisors away from `q` are bounded by `max(Q(N/q²), p)` through the product and power rules for `Q`. Only Dickson's classification is used, no modularity or weight statement.
Source: [KW-I], Lemma 6.3, p. 11, and proof of Lemma 6.3(i), p. 12.
*Needs:* `R27.1/good-dihedral-prime-definition`; `ArithmeticGaloisRepresentations Layer 2`; `ArithmeticGaloisRepresentations Layer 3`; `ArithmeticGaloisRepresentations Layer 4`; Input I.3; `Nat.maxPrimeFac_mul`; `Nat.maxPrimeFac_pow`.

**Lemma 8.2: the Chebotarev choice of auxiliary primes** (`R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`). Let `p ≡ 1 (mod 4)` be prime and `ρ̄ : G_ℚ → GL₂(𝔽_p)`, with coefficients in the prime field, continuous, odd, with non-solvable image (so absolutely irreducible). Let `c` be a complex conjugation. The primes `q` unramified in `ρ̄` with
(i) `ρ̄_proj(Frob_q)` conjugate to `ρ̄_proj(c)` in the projective image,
(ii) `q ≡ 1 (mod ℓ)` for every prime `ℓ ≤ p − 1`, and `q ≡ 1 (mod 8)`,
(iii) `q ≡ −1 (mod p)`,
have positive Dirichlet density. At such `q, tr ρ̄(Frob_q) = 0, p | q + 1`, and `ρ̄|_{D_q}` is an unramified twist of `diag(χ̄_p, 1)` with `χ̄_p(Frob_q) = −1`.
The coefficients must be `𝔽_p`, not `𝔽̄_p`: Khare–Wintenberger record that an earlier version allowed `𝔽̄_p` and that a rationality hypothesis may be needed. `p ≡ 1 (mod 4)` is used twice: when the projective image is `PGL₂(𝔽_p), ρ̄_proj(c)` lies in `PSL₂(𝔽_p)` because `det ρ̄(c) = −1` is a square; and `−1` is a square `mod p`, which makes (iii) compatible with the other conditions.
Proof outline: by Dickson the projective image is `PSL₂(𝔽_p), PGL₂(𝔽_p)` or `A₅`. Let `M` be the field cut out by `ρ̄_proj` and `C` the cyclotomic field generated by `μ₈, μ_ℓ` for odd `ℓ < p`, and `μ_p`. As `PSL₂(𝔽_p)` and `A₅` have no nontrivial abelian quotient, `M ∩ C` has degree `1` or `2` over `ℚ`, and in degree `2` it is the fixed field of `PSL₂(𝔽_p)`. The congruence conditions make `Frob_q` trivial on every quadratic subfield of `C` (on `ℚ(i), ℚ(√±2)` by `q ≡ 1 mod 8`, on `ℚ(√ℓ*)` by `q ≡ 1 mod ℓ`, on `ℚ(√p)` because `q ≡ −1 mod p` and `−1` is a square), and condition (i) makes it trivial on `M ∩ C`. So the conditions define a nonempty union of conjugacy classes of `Gal(MC/ℚ)`, and Chebotarev gives positive density. Finally `ρ̄_proj(Frob_q)` has order `2`, so `ρ̄(Frob_q)` has eigenvalues `α, −α`.
Source: [KW-I], Lemma 8.2, the remark after it, and its proof, pp. 17–18; [DP], Lemma 1.15, p. 9, which restates it with `𝔽_p` coefficients.
*Needs:* `ArithmeticGaloisRepresentations Layer 3`; `ArithmeticGaloisRepresentations Layer 4`; [Chebotarev, Layer 10][cheb]; `NumberField.Chebotarev.frobeniusPrimeSet`; `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`; `NumberField.Chebotarev.infinite_frobeniusPrimeSet`.
`Suggested.lean` defines `auxiliaryPrimes` and states the positive-density theorem as `lemma_8_2`.

**Checks.**

- `q = 13` is excluded from `auxiliaryPrimes` for `p = 5`, independently of the representation, by the modulus-eight condition.
- For the trivial `𝔽₅` representation and any complex conjugation `c`, `409 ∈ auxiliaryPrimes 1 c`: inertia and both projective images are trivial, and all three congruences hold.
- `q = 409` satisfies every congruence for `p = 5`, but an inertia element outside the kernel excludes it. Thus congruences alone do not establish membership.
- The action `diag(1,χ_{ℚ(i)})` over `𝔽₅` is odd and unramified at `409`, with Frobenius the identity there since `409 ≡ 1 (mod 4)`. Complex conjugation is `diag(1,−1)`, which is not projectively conjugate to the identity. Consequently `409` is excluded even with all the arithmetic congruences and unramifiedness.

**Inserting a good-dihedral prime** (`R27.1/good-dihedral-prime-insertion`). Let `p′ > 5` be prime with `p′ ≡ 1 (mod 4), ρ̄′ : G_ℚ → GL₂(𝔽_{p′})` of S-type with non-solvable image and `k(ρ̄′) = 2`, and `q` a prime given by Lemma 8.2 for `ρ̄′`. Then `p′ | q + 1` and `ρ̄′|_{D_q}` is, up to an unramified twist, `(χ̄_{p′}, ∗; 0, 1)`. Khare–Wintenberger Theorem 5.1(4) gives an almost strictly compatible system `(ρ′_λ)` lifting `ρ̄′`, minimally ramified at primes other than `p′` and `q`, of weight two and crystalline at `p′`, with `ρ′_{p′}|_{I_q} ≅ χ′ ⊕ χ′^q` for a character `χ′` of `I_q` of niveau two and `p′`-power order; such characters exist because `p′` is odd. If moreover every prime other than `p′` at which `ρ̄′` ramifies is smaller than `p′`, then for every prime `s < p′, s ≠ q`, the residual representation `ρ̄′_s` is good-dihedral for `q` with `t = p′`, so has non-solvable image. In applications `ρ̄′` is the reduction `ρ̄_{p′}` of a compatible system, and `p′` must split completely in its coefficient field so that `ρ̄_{p′}` is `𝔽_{p′}`-valued, as Lemma 8.2 requires.
Proof outline: compatibility at `q` gives `ρ′_s|_{I_q} ≅ χ′ ⊕ χ′^q`, and reduction `mod s` is injective on a group of `p′`-power order; `t = p′` exceeds every other ramified prime and `s`; the congruences of Lemma 8.2(ii) cover every prime up to `p′ − 1`. Then apply Lemma 6.3(i).
Source: [KW-I], §8.4, p. 18; the remark after Theorem 5.1, p. 10.
*Needs:* `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`; `R27.1/good-dihedral-prime-definition`; `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; Input I.3.

**Dickson, its dyadic refinement and the dihedral weight lemmas** (`R27.1/dickson-and-the-dyadic-solvable-refinement`). This target collects four statements of Khare–Wintenberger §6 in the form the classical strand applies them; each is proved by its owner.

- Dickson: a finite subgroup of `GL₂(𝔽̄_p)` acting irreducibly has projective image dihedral, `A₄, S₄, A₅, PSL₂(𝔽₀)` or `PGL₂(𝔽₀)` for a finite subfield `𝔽₀; PSL₂(𝔽₀)` is simple nonabelian once `|𝔽₀| ≥ 4` (`ArithmeticGaloisRepresentations Layer 4`).
- Lemma 6.1: a finite solvable subgroup of `GL₂(𝔽̄₂)` acting irreducibly has dihedral projective image. `S₄` is excluded because elements of `2`-power order in `GL₂(𝔽̄₂)` have order at most `2; A₄` because its normal subgroup of order `4` would force the group into the upper triangular matrices (ArithmeticGaloisRepresentations Layer 4).
- Lemma 6.2(i): an S-type `ρ̄` with dihedral projective image arises from `S_{k(ρ̄)}(Γ₁(N(ρ̄)))`. At `p = 2` this goes through Serre's Proposition 10 method, with the refined weight and level from Wiese (`GL2AutomorphicRepresentationsAndTransfer:R17.5`, `R17.6`, and `SerreWeightAndLevelOptimisation Layer 5` for the exact weight and level).
- Lemma 6.2(ii): if `ρ̄` is of S-type, `p ≥ 3, 2 ≤ k(ρ̄) ≤ p + 1` and `ρ̄|_{G_{ℚ(μ_p)}}` is reducible, then `k(ρ̄)` is `(p + 1)/2` or `(p + 3)/2`. Here `ρ̄` is induced from the quadratic subfield of `ℚ(μ_p)`, so for `p > 2` its projective image is dihedral of order prime to `p` and the projective image of inertia at `p` is cyclic; it has order `2` because that quadratic field is ramified at `p` (`AlgebraicModularFormsAndSerreWeights:R15.4`).
The modern strand cites Dickson and Lemma 6.1 from their owner directly, not through this target.
Source: [KW-I], Lemma 6.1, p. 10, and Lemma 6.2, p. 11; [Ri], proof of Proposition 2.2, pp. 279–280, an analogous inertia argument for semistable `ρ̄` with cyclotomic determinant (not a proof of Lemma 6.2(ii)), read with the correction in Corrections to the sources.
*Needs:* `ArithmeticGaloisRepresentations Layer 4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; `SerreWeightAndLevelOptimisation Layer 5`; `AlgebraicModularFormsAndSerreWeights:R15.4`.

## Layer R27.2: The induction hypotheses and weight reduction

*Milestone:* reduction to weight two.

**The hypotheses `(L_r), (W_r)` and `(D_r)`** (`R27.2/hypotheses-Lr-Wr-and-Dr`). For `r ≥ 1`:

- `(L_r)`: every `ρ̄` of S-type is modular provided (a) `ρ̄` is locally good-dihedral, (b) `k(ρ̄) = 2` if `p = 2`, and (c) `N(ρ̄)` is odd with at most `r` prime divisors.
- `(W_r)`: the same with (b) replaced by `k(ρ̄) = 2` in every characteristic.
For `r ≥ 0`:

- `(D_r)`: every `ρ̄` of S-type is modular provided (a) `ρ̄` is locally good-dihedral, (b) `p` is odd, and (c) `2^{r+1} ∤ N(ρ̄)`.
`(L_r)` implies `(W_r)`. `(L_r)` and `(W_r)` require odd conductor; `(D_r)` allows even conductor with bounded `2`-adic valuation and excludes `p = 2`. All three are restricted to locally good-dihedral representations, which keeps residually degenerate lifting theorems out of the induction beyond their use in the level-one theorem. By Theorem 3.4, `(D₀)` gives modularity of every S-type `ρ̄` of odd characteristic with `N(ρ̄)` odd, and of characteristic `2` with `k(ρ̄) = 2; (D₁)` gives it in characteristic `2` and for odd `p` with `4 ∤ N(ρ̄)`.
Source: [KW-I], §3.1, p. 5; Theorem 3.4, p. 6.
*Needs:* `R27.1/good-dihedral-prime-definition`; `AlgebraicModularFormsAndSerreWeights:R15.6`.
The intended signatures are `HypL, HypW, HypD : ℕ → Prop`, with exactly the quantifiers and conductor conditions just stated.

API:

- `HypL r`, `HypW r`, `HypD r` quantify over every prime `p` and every S-type `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` satisfying the conditions, and conclude `IsModular ρ̄`.
- `(L_r) ⇒ (W_r)` by restriction to weight two.
- for `1 ≤ r ≤ s, (L_s) ⇒ (L_r)` and `(W_s) ⇒ (W_r)`; the converse is not a consequence of inclusion.
- for `r ≤ s, (D_s) ⇒ (D_r)`, since `2^{r+1} ∤ N` implies `2^{s+1} ∤ N`.

**Checks.**

- specialising a proof of `(L_r)` to a weight-two good-dihedral representation with odd conductor and at most `r` prime factors gives exactly `(W_r)`.
- `N = 2q²` (`q` odd) meets the conductor condition of `(D₁)` and fails the odd-conductor condition of `(L_r)` and `(W_r)`; no representation with this conductor is asserted to exist.
- for distinct odd primes `3, 5` and `q, N = 3 · 5 · q²` has three prime factors, so it meets the bound of `(L₃), (W₃)` and fails that of `(L₂), (W₂)`, whatever the exponent at `q`.
- in characteristic `2, (L_r)` admits weight `2` and rejects weight `4`; in odd characteristic `(L_r)` admits both weights and `(W_r)` rejects weight `4`.

**The prime-gap inequalities of the weight reduction** (`R27.2/prime-gap-estimates-driving-the-weight-recursion`). The odd estimate `(1)` is `R26.3/chebyshev-next-prime` and the ratio bound is `R26.3/next-prime-ratio`. If `P − 1` has no odd prime factor, `P` is a Fermat prime and `2^e ∥ P − 1` with `e ≥ 4 (P ≥ 17)`; the dyadic requirement is

`(2^{e−1} + 2)P + (2^{e−1} − 2) ≤ 2^e p.   (2)`

which implies `(2^{e−1} + 2)(P − 1) + 2 · 2^e ≤ (p + 1)2^e`, inequality `(4)` of Khare–Wintenberger. Choose an even exponent `i` in `[(P − 1)/2, ((2^{e−1} + 2)/2^e)(P − 1)]`, an interval of length `2` when `P` is a Fermat prime; for odd `ℓ` use the half-open interval of `R26.3/weight-interval-containment`. The inequalities are needed for `p ≥ 5`; characteristics `3` and `5` are separate cases of Theorem 3.2. For `p ≤ 31` the only Fermat case is `(p, P, e) = (13, 17, 4)`, where `(2)` reads `176 ≤ 208`. For `p > 31, P/p < 22/15 ≤ 3/2 − 1/p` and `2^e/(2^{e−1} + 2) ≥ 3/2` for `e ≥ 4`. Khare's level-one paper proves the stronger statement that the least non-Fermat prime above `p` always works.
Source: [KW-I], §7 and the remark there, p. 12.
*Needs:* `R26.3/chebyshev-next-prime`; `R26.3/next-prime-ratio`; `R26.3/finite-auxiliary-prime-checks`; `R26.3/weight-interval-containment`.

**Theorem 3.2: `(W_r)` implies `(L_r)`** (`R27.2/theorem-3-2-weight-reduction`). For `r ≥ 1, (W_r)` implies `(L_r)`. Fix `r` and induct on the residue characteristic `p`, with `ρ̄` locally good-dihedral for `q, N(ρ̄)` odd with at most `r` prime divisors. Characteristic `2` is `(W_r)` itself.

- `p = 3`. Lift `ρ̄ (k(ρ̄) ≤ 4)` by Theorem 5.1(2) and reduce at `2: ρ̄₂` is `q`-dihedral, hence non-solvable, of weight `2` by almost strict compatibility, with `N(ρ̄₂)` supported on the primes of `N(ρ̄)` and `3`. If `ρ̄₂` is unramified at `3`, conclude by `(W_r)` and Theorem 4.1. Otherwise `ρ̄₂|_{I₃}` is a nontrivial unipotent (`ω₃` has order `2`), so `ρ̄₂|_{D₃}` is an unramified twist of `(χ̄₂, ∗; 0, 1)`; apply Theorem 5.1(4) with `χ′ = ω_{3,2}²`. A twist of the new mod-`3` member `ρ̄′₃` has weight `2`, and `N(ρ̄′₃)` is odd with at most `r` prime divisors, so `(W_r)` and Theorem 4.1, applied at `3` and then at `2`, conclude.
- `p = 5`. The same start, with `k(ρ̄) ≤ 6`. If `ρ̄₂` is ramified at `5`, its inertia at `5` is a nontrivial unipotent (`ω₅` has order `4`), and Theorem 5.1(3) with `χ′ = ω₅²` gives a system whose mod-`5` member `ρ̄′₅` has weight `4` after a twist and odd conductor with at most `r` prime divisors. To prove `ρ̄′₅` modular, lift it by Theorem 5.1(2) if `3 | N(ρ̄′₅)`, by Theorem 5.1(1) otherwise, and reduce at `3`, where the case `p = 3` applies. In the latter branch the three-adic member is crystalline with weights `{0,3}`. If nonordinary, its residual Serre weight is two; the characteristic-three case gives residual modularity, and `I.2/classical-modularity-lifting` with lift weight `h=4` gives modularity of this member. If ordinary, use the same target's ordinary endpoint. The conductor need not be one.
- General step (`p ≥ 5; ρ̄` of characteristic `P`, the next prime after `p`, the statement being known in every characteristic `≤ p`). Choose `ℓ^e ∥ P − 1` satisfying `(1)`, or `(2)` when `ℓ = 2`. Lift `ρ̄` by Theorem 5.1(2) and reduce at `ℓ: ρ̄_ℓ` is `q`-dihedral, with odd conductor supported on the primes of `N(ρ̄)` and `P`. If `ρ̄_ℓ` is unramified at `P`, the hypothesis in characteristic `ℓ ≤ p` and Theorem 4.1 conclude. Otherwise apply Theorem 5.1(3) at the prime `P` to a twist `ρ̄′_ℓ` of `ρ̄_ℓ` by a character unramified outside `ℓ` (with `2 ≤ k(ρ̄′_ℓ) ≤ ℓ + 1` when `ℓ` is odd), with `χ′ = ω_P^i` for `i` in the interval of the previous target, and reduce the new system at `P`: the estimates give `k(ρ̄′_P) ≤ p + 1` after a twist. The return representation is still in characteristic `P`, so induction does not yet apply. If `p` divides its conductor, use the weight-two lift and reduce at `p`; its prime support lies in that of the prime-to-`p` part of `P · N(ρ̄′_P)`. If not, use the crystalline lift of that weight `h≤p+1` and reduce at `p`, adding no conductor prime. The resulting `p`-adic member is crystalline of lift weight `h`, independently of its residual Serre weight; the endpoint `h=p+1` includes the nonordinary residual-weight-two case of `I.2/classical-modularity-lifting`. In both cases the odd conductor has at most `r` prime divisors, the good-dihedral prime persists, and the hypothesis applies in the smaller characteristic `p`. Transfer modularity back through the three systems and undo the twists.
The foil leaves the fixed ramification: if `ℓ ∤ N(ρ̄)`, the second system is crystalline of weight two at `ℓ` with unramified Weil–Deligne parameter, so `ℓ` does not divide the return conductor; almost strict compatibility without this local type is not enough. Every reduction stays below `max(Q(N/q²), P)`, so Lemma 6.3 keeps `q` good-dihedral. The final reduction at `p`, not the weight change, lowers the induction variable; `r` stays fixed and is unrelated to `e`.

**Checks.**

- In the characteristic-five branch with `3 ∤ N(ρ̄′₅)`, a nonordinary crystalline three-adic member has lift weight four and residual weight two. Residual modularity lifts at weight four, without a level-one exclusion of weight two.
- In the general crystalline return with `h=p+1`, the nonordinary residual weight two is already in the normalized range. The crystalline member retains Hodge–Tate weights `{0,p}`.
- If `p` divides the return conductor, use the weight-two prescription. The crystalline return applies when `p` does not divide that conductor, preserving its prime support.

Source: [KW-I], §8.2, pp. 13–15.
*Needs:* `R27.2/hypotheses-Lr-Wr-and-Dr`; `R27.2/prime-gap-estimates-driving-the-weight-recursion`; `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; Input I.3; Input I.2; Input I.1; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`.

## Layer R27.3: Killing ramification and the double induction

*Milestones:* killing ramification; the initial case `(W₁)`; the `(L_r)/(W_r)` double induction.

**Theorem 3.1: `(L_r)` implies `(W_{r+1})`** (`R27.3/theorem-3-1-killing-ramification`). For `r ≥ 1, (L_r)` implies `(W_{r+1})`. Let `ρ̄` be of S-type, good-dihedral for `q`, with `k(ρ̄) = 2` and `N(ρ̄)` odd with at most `r + 1` prime divisors. If `N(ρ̄)` has at most `r` prime divisors, `(L_r)` applies directly. Otherwise choose a prime `s ≠ q` dividing `N(ρ̄)`; the good-dihedral prime is never killed. Theorem 5.1(1) gives an almost strictly compatible lift `(ρ_ι)`, minimally ramified away from `p` and crystalline of weight `2` at `p`. The mod-`s` member `ρ̄_s` is of S-type and `q`-dihedral (Lemma 6.3(ii)), and the primes dividing `N(ρ̄_s)` are among those of the prime-to-`s` part of `N(ρ̄)`: the ramification at `s` is absorbed into the coefficient prime. So `(L_r)` makes `ρ̄_s` modular, and Theorem 4.1 at `s` makes `(ρ_ι)`, hence `ρ̄`, modular. Theorem 4.1 needs non-solvable image of `ρ̄_s` if `s = 2`, and absolute irreducibility over `ℚ(μ_s)` if `s > 2`; both follow from `q`-dihedrality.
Source: [KW-I], §8.1, pp. 12–13; [KW-Ann], §6.2, p. 250, for the same device in general form.
*Needs:* `R27.2/hypotheses-Lr-Wr-and-Dr`; `R27.1/good-dihedral-prime-definition`; `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; Input I.3; Input I.2.

**Theorem 3.3: the initial case `(W₁)`** (`R27.3/theorem-3-3-initial-case`). `(W₁)` holds: every `ρ̄` of S-type, good-dihedral for `q`, with `k(ρ̄) = 2` and `N(ρ̄)` odd with at most one prime divisor, is modular. Indeed `q | N(ρ̄)` since `ρ̄|_{I_q} ≅ ψ ⊕ ψ^q` with `ψ ≠ 1`, so `q` is the only prime divisor; `ψ ⊕ ψ^q` has no inertia invariants, so `N(ρ̄) = q²`. Thus `ρ̄` is unramified outside `{p, q}`, tamely ramified at `q`, and `|ρ̄(I_q)| = ord ψ` is a power of the odd prime `t > 5`. Corollary 8.1(ii) applies; `p = 2` is allowed, and `t > p` excludes its branch `t = p`.
Source: [KW-I], Theorem 3.3, p. 6; §8.3, p. 15; Corollary 8.1(ii), p. 16.
*Needs:* `R26.6/corollary-8-1-ii-and-the-statement-W1`; `R27.2/hypotheses-Lr-Wr-and-Dr`; `R27.1/good-dihedral-prime-definition`; `ArithmeticGaloisRepresentations Layer 3`.

**The double induction** (`R27.3/double-induction-assembly`). `(L_r)` holds for every `r ≥ 1: (W₁)` and Theorem 3.2 give `(L₁)`; then `(L_r) ⇒ (W_{r+1})` by Theorem 3.1 `⇒` `(L_{r+1})` by Theorem 3.2. The two parameters of the double induction are the number of primes dividing `N(ρ̄)` (this target) and the residue characteristic (inside Theorem 3.2). The conductor does not decrease at every congruence: inside Theorem 3.2 the auxiliary representations can have `r + 1` prime divisors. Theorem 1.2 is derived in R27.4 and is not used here.
Source: [KW-I], §3.2, p. 6; §1.2, p. 3.
*Needs:* `R27.3/theorem-3-1-killing-ramification`; `R27.3/theorem-3-3-initial-case`; `R27.2/theorem-3-2-weight-reduction`; `R27.2/hypotheses-Lr-Wr-and-Dr`.

**All `(L_r)` give `(D₀)`** (`R27.3/d0-from-all-lr`). If `(L_r)` holds for every `r ≥ 1`, then `(D₀)` holds. A representation as in `(D₀)` is good-dihedral, of odd characteristic and odd conductor; its good-dihedral prime divides the conductor, so `r = ω(N(ρ̄)) ≥ 1`, and `(L_r)` applies because its weight condition concerns only `p = 2`.
Source: [KW-I], §3.2, p. 6.
*Needs:* `R27.3/double-induction-assembly`; `R27.2/hypotheses-Lr-Wr-and-Dr`; `R27.1/good-dihedral-prime-definition`.

## Layer R27.4: Removing the good-dihedral condition

*Milestones:* raising levels; weight and level from minimal lifts; Khare–Wintenberger Theorem 1.2.

**The auxiliary characteristic** (`R27.4/auxiliary-characteristic-choice`). Let `ρ̄` be of S-type with `ρ̄|_{ℚ(μ_p)}` absolutely irreducible (non-solvable image if `p = 2`), and `(ρ_λ)` an `E`-rational almost strictly compatible **weight-two** lift, from Theorem 5.1(2), of `ρ̄` (twisted into weight `2 ≤ k ≤ p + 1` if `p` is odd); `S` is the set of primes other than `p` at which `ρ̄` ramifies, and the system is ramified only at `S ∪ {p}` and at the coefficient primes. The system's weight is two even when `k(ρ̄) > 2`. Then either `ρ̄` is modular, or there is a prime `p′ > 5, p′ ≡ 1 (mod 4)`, larger than every prime of `S ∪ {p}` and split completely in `E`, such that `ρ̄_{p′} : G_ℚ → GL₂(𝔽_{p′})` is absolutely irreducible of weight `2` with non-solvable image. For `p′ ∉ S ∪ {p, 2}`, almost strict compatibility gives `k(ρ̄_{p′}) = 2`, that is `ρ̄_{p′}|_{I_{p′}}` is `(ω_{p′}, ∗; 0, 1)` or `ω_{p′,2} ⊕ ω_{p′,2}^{p′}`. It is not induced from the quadratic subfield of `ℚ(μ_{p′})`, since Lemma 6.2(ii) would force weight `(p′ + 1)/2` or `(p′ + 3)/2`. The projective image of inertia contains an element of order `p′ − 1` or `p′ + 1`, at least `6`, so by Dickson a solvable projective image is dihedral; then Lemma 6.2(i) and a lifting theorem for weight-two lifts with dihedral residual image (Diamond's in the source, covered by Input I.2) make `ρ̄` modular. The conditions on `p′` are Chebotarev conditions in `E(i)`, so infinitely many `p′` qualify. Only the absolutely irreducible residual members, almost all of them, are considered.
Source: [KW-I], Theorem 5.1(2), p. 9; §8.4, p. 17.
*Needs:* `R27.1/dickson-and-the-dyadic-solvable-refinement`; Input I.3; `AlgebraicModularFormsAndSerreWeights:R15.4`; Input I.2.

**Theorem 3.4: raising levels** (`R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`). Assume `(D_r)` for some `r ≥ 0`. Then every `ρ̄` of S-type of characteristic `p` with `2^{r+1} ∤ N(ρ̄)`, and with `k(ρ̄) = 2` when `p = 2` and `r = 0`, is modular.
Proof outline: reduce to `ρ̄|_{ℚ(μ_p)}` absolutely irreducible (Lemma 6.2) and to non-solvable image when `p = 2` (Lemma 6.1). Twisting by a power of `χ̄_p`, which changes neither modularity nor `N(ρ̄)`, we may assume `2 ≤ k(ρ̄) ≤ p + 1` for odd `p`. Lift by Theorem 5.1(2) to an `E`-rational almost strictly compatible system `(ρ_λ)` and choose `p′` as above. Take `q` from Lemma 8.2 for `ρ̄_{p′}` and insert it with Theorem 5.1(4), obtaining `(ρ′_λ)` linked to `(ρ_λ)` at `ρ̄_{p′}`. Let `s` be the largest prime below `p′: s > 2, ρ̄′_s` is good-dihedral for `q`, and `2^{r+1} ∤ N(ρ̄′_s)`, so `(D_r)` makes `ρ̄′_s` modular. Theorem 4.1 at `s` makes `(ρ′_λ)` modular, and Theorem 4.1 at `p′`, where `ρ̄_{p′}` has non-solvable image, makes `(ρ_λ)` and `ρ̄` modular.
The dyadic conductor is propagated as a chain of bounds. Let `A` be the conductor exponent at `2` of the Weil–Deligne parameter of `(ρ_λ)`. For `p` odd, `ρ_p` is minimal at `2` and `A = v₂(N(ρ̄)) ≤ r`. For `p = 2, k(ρ̄) = 2`, the parameter at `2` is `(1 ⊕ 1, 0)` and `A = 0`. For `p = 2, k(ρ̄) = 4`, the lift is Steinberg at `2`, the parameter is `(id, N)` with `N ≠ 0`, and `A = 0 + dim V^{I₂} − dim ker N = 1`, while `v₂(N(ρ̄)) = 0`; the theorem excludes `r = 0` here, so `A ≤ r`. Reduction at `p′ ≠ 2` does not increase the conductor, so `v₂(N(ρ̄_{p′})) ≤ A`; the minimal lift from Theorem 5.1(4) has dyadic exponent `v₂(N(ρ̄_{p′}))`; and reduction at `s ≠ 2` gives `v₂(N(ρ̄′_s)) ≤ A ≤ r`. No equality with `v₂(N(ρ̄))` is claimed.
Source: [KW-I], Theorem 3.4, p. 6; §8.4, p. 18.
*Needs:* `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`; `R27.1/good-dihedral-prime-insertion`; `R27.1/dickson-and-the-dyadic-solvable-refinement`; `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; `R27.4/auxiliary-characteristic-choice`; `R27.2/hypotheses-Lr-Wr-and-Dr`; Input I.3; Input I.2; `ArithmeticGaloisRepresentations Layer 3`.

**From modularity to weight `k(ρ̄)` and level `N(ρ̄)`** (`R27.4/strong-form-by-minimal-lifts`). Let `ρ̄ : G_ℚ → GL₂(𝔽)` be of S-type and modular, with `p` odd, or `p = 2` and `k(ρ̄) = 2`. Then `ρ̄` arises from `S_{k(ρ̄)}(Γ₁(N(ρ̄)))`.

- If the projective image is dihedral, Lemma 6.2(i) gives the conclusion. This covers `ρ̄|_{G_{ℚ(μ_p)}}` reducible for odd `p`, every solvable image at `p = 2`, and every `ρ̄` induced from `ℚ(i)`; the last are kept apart from Buzzard's theorem, which excludes them.
- Otherwise choose `i` with `2 ≤ k(ρ̄ ⊗ χ_p^i) ≤ p + 1` (`i = 0` when `p = 2`) and put `ρ̄′ = ρ̄ ⊗ χ_p^i`, with `N(ρ̄′) = N(ρ̄)`. Theorem 5.1(1) gives a lift of `ρ̄′`, minimal at every prime `≠ p` and crystalline of weight `k(ρ̄′)` at `p`; Theorem 4.1 makes it modular, and its newform has weight `k(ρ̄′)`, level prime to `p`, and level `N(ρ̄)` away from `p`. Undo the twist: twisting by `χ_p` is the `θ`-operator on mod-`p` forms of level prime to `p`, Edixhoven's weight theorem (no exceptional case for `p > 2`) gives a mod-`p` eigenform of type `(N(ρ̄), k(ρ̄), ε)`, and as `k(ρ̄) ≥ 2` the Deligne–Serre lemma lifts it to characteristic zero. The resulting newform has level dividing `N(ρ̄)` and divisible by `N(ρ̄)`, since the prime-to-`p` conductor of `ρ̄` divides that of every lift.
The twist is needed because Theorems 4.1 and 5.1 assume `2 ≤ k ≤ p + 1` while Serre's weight goes up to `p² − 1`: for `p ≥ 5, ρ̄|_{I_p} ≅ χ̄_p ⊕ χ̄_p²` has weight `p + 3` and its twist by `χ̄_p^{−1}` has weight `2`. The case `p = 2, k(ρ̄) = 4` is excluded: Theorem 5.1(1) has no crystalline branch there. At `p = 2` the theorem covers `ρ̄|_{D₂}` scalar with non-dihedral projective image, where Buzzard's multiplicity-one level lowering is not available; a scalar `ρ̄|_{D₂}` is unramified up to twist, hence finite, so `k(ρ̄) = 2` automatically. Khare–Wintenberger state this refinement in Theorem 1.2 but write out only the modularity; this target supplies the passage (Corrections to the sources).
Source: [KW-I], §1.1, p. 2; Theorem 5.1(1), p. 9; proof of Lemma 6.2(i), p. 11.
*Needs:* `R27.1/dickson-and-the-dyadic-solvable-refinement`; Input I.3; Input I.2; `AlgebraicModularFormsAndSerreWeights:R15.4`; `AlgebraicModularFormsAndSerreWeights:R15.6`; `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`; `SerreWeightAndLevelOptimisation §3.8`; `SerreWeightAndLevelOptimisation §3.7`.

**Khare–Wintenberger Theorem 1.2** (`R27.4/theorem-1-2`). `(1)` For `p` odd, every `ρ̄` of S-type with `N(ρ̄)` odd arises from `S_{k(ρ̄)}(Γ₁(N(ρ̄)))`. `(2)` For `p = 2`, every `ρ̄` of S-type with `k(ρ̄) = 2` arises from `S₂(Γ₁(N(ρ̄)))`. Proof: `(D₀)` holds; Theorem 3.4 with `r = 0` makes `ρ̄` modular; the previous target gives the weight and level. At `p = 2` the theorem does not give Edixhoven's strong form (unramified at `2` if and only if arising from a Katz form of weight one). Weight `4` at `p = 2` and even conductor in odd characteristic are Theorem 9.1.
Source: [KW-I], Theorem 1.2, p. 2; §1.1, p. 3; the remark after Theorem 3.4, p. 6.
*Needs:* `R27.3/d0-from-all-lr`; `R27.3/double-induction-assembly`; `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`; `R27.4/strong-form-by-minimal-lifts`.

## Layer R27.5: Characteristic two, weight four and even conductor

*Milestone:* Theorem 9.1, the reduction to Hypothesis `(H)`.

Hypothesis `(H)` of Khare–Wintenberger §9 says: a continuous, odd, irreducible `p`-adic representation `ρ`, unramified outside a finite set, of weight two and potentially crystalline at `p`, whose residual representation is modular with non-solvable image, is modular. At `p = 2` it is Kisin's theorem, through the passage from potentially crystalline of weight two to potentially Barsotti–Tate. It is Input I.2, with these hypotheses unchanged; this layer uses it only at `p = 2`.

**The dyadic weight claim** (`R27.5/dyadic-weight-two-claim`). In the proof of `(D₁)` below, `k(ρ̄′₂) = 2`. Otherwise `ρ̄′₂|_{D₂}` is très ramifiée, and a très ramifiée representation becomes finite flat over no finite extension `K/ℚ₂` of odd ramification index: its Kummer class has odd valuation, which stays odd. But over `K = ℚ₄(χ′)`, of ramification index `3` (the order of `χ′`), `ρ′₂` is crystalline with Hodge–Tate weights `{0, 1}`, because its Weil–Deligne parameter `(τ, 0)` becomes unramified there; so it comes from a `2`-divisible group and `ρ̄′₂|_{G_K}` is finite flat, a contradiction. The local type at `2` comes from Theorem 5.1(4) and almost strict compatibility at `2`, which applies because `ρ̄′₂` is irreducible. Savitt's computation of residual weights does not cover `p = 2`, which is why this separate argument is needed.
Source: [KW-I], proof of Theorem 9.1, p. 19; [Se87], (2.4.7), p. 186, and §2.6, p. 188.
*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20`; Input I.3.

**`(D₁)` through a congruence at `3`** (`R27.5/d1-by-the-prime-three`). `(D₁)` holds: every good-dihedral `ρ̄` of S-type in odd characteristic `p` with `4 ∤ N(ρ̄)` is modular. After a twist by a power of `χ̄_p`, which keeps good-dihedrality and `N(ρ̄)`, lift `ρ̄` by Theorem 5.1(2) to an almost strictly compatible system with `ρ_p` a minimal weight-two lift. `ρ̄₃` is good-dihedral `(2, 3 ≤ max(Q(N(ρ̄)/q²), p))`, so has non-solvable image. If `ρ̄₃` is unramified at `2`, its conductor is odd and Theorem 1.2(1) at `3` with Theorem 4.1 concludes. Otherwise `ρ̄₃(I₂)` is unipotent and `ρ̄₃|_{D₂}` is an unramified twist of `(χ̄₃, ∗; 0, 1)`. Theorem 5.1(4), applied to `ρ̄₃` at `q = 2` with the order-`3` characters `χ′, χ′²` of `I₂` (niveau two, since `3 | 2 + 1`), gives a system `(ρ′_λ)` lifting `ρ̄₃` with `ρ′₃|_{I₂} ≅ (χ′, ∗; 0, χ′²)` and Weil–Deligne parameter `(τ, 0)` at `2, τ` irreducible. Then `ρ̄′₂` has non-solvable image, weight `2` by the previous target, and is modular by Theorem 1.2(2); `ρ′₂` is potentially crystalline of weight two at `2`, so `(H)` makes it and `(ρ′_λ)` modular; Theorem 4.1 at `3` transfers modularity to `(ρ_λ)` and `ρ̄`. With Theorem 3.4 for `r = 1, (D₁)` gives modularity of every S-type representation of characteristic `2`. This is the mod-`3` step of Theorem 3.2 with `2` and `3` exchanged.
Source: [KW-I], proof of Theorem 9.1, pp. 18–19 (the system lifts `ρ̄₃`; see Corrections to the sources).
*Needs:* `R27.4/theorem-1-2`; `R27.5/dyadic-weight-two-claim`; `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; Input I.2; Input I.3.

**`(D_r)` for `r ≥ 2`** (`R27.5/dr-for-r-at-least-two`). For every `r ≥ 2, (D_r)` holds. If `ρ̄(I₂)` is unipotent up to twist, a twist by a character unramified outside `2`, which preserves good-dihedrality and the odd part of the conductor, has `4 ∤ N` and is modular by `(D₁)`. Otherwise, after a twist by a power of `χ̄_p`, which keeps good-dihedrality and `N(ρ̄)`, lift `ρ̄` by Theorem 5.1(2); `ρ̄₂` is good-dihedral, so of non-solvable image, and modular, since every S-type representation of characteristic `2` is (by `(D₁)` and Theorem 3.4); `ρ₂` is potentially crystalline of weight two at `2`, since a minimal lift of a `ρ̄|_{I₂}` that is not unipotent up to twist has finite inertia image (minimality gives `ρ_p(I₂) ≅ ρ̄(I₂)` unless `ρ̄(I₂)` is projectively cyclic of order `p`). `(H)`, applied with non-solvable residual image, makes `ρ₂, (ρ_λ)` and `ρ̄` modular.
Source: [KW-I], proof of Theorem 9.1, p. 19.
*Needs:* `R27.5/d1-by-the-prime-three`; `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`; `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; Input I.2; Input I.3.

**Theorem 9.1: every S-type representation is modular** (`R27.5/hypothesis-H-and-theorem-9-1`). Every `ρ̄` of S-type is modular. `(D₀), (D₁)` and `(D_r)` for `r ≥ 2` hold, and Theorem 3.4 for each `r` gives the conclusion. Hypothesis `(H)` is imported, including its passage from potentially crystalline of weight two to potentially Barsotti–Tate; `(H)` requires the residual representation to be modular with non-solvable image, and each use above checks this. Theorem 9.1 gives modularity only; weight and level are R27.6.
Source: [KW-I], §9, Hypothesis `(H)` and the proof of Theorem 9.1, p. 18; §1.1, p. 3.
*Needs:* `R27.3/d0-from-all-lr`; `R27.5/d1-by-the-prime-three`; `R27.5/dr-for-r-at-least-two`; `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`; Input I.2.
`Suggested.lean` states this qualitative conclusion as `serre_conjecture_weak`, shared with R33.5.

## Layer R27.6: The strong theorem and its exports

*Milestones:* Serre's modularity conjecture (strong form); odd Artin representations and weight-one modularity; Khare's weight-one descent.

**Serre's modularity conjecture, strong form** (`R27.6/full-classical-serre-theorem`). Let `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` be continuous, odd and absolutely irreducible. There are a normalised newform `f` of weight `k(ρ̄) ≥ 2`, level `N(ρ̄)` and character `ε`, a prime `λ | p` of its coefficient field relative to `ι_p`, and an isomorphism of the reduction of `ρ_{f,λ}` with `ρ̄`; moreover `det ρ̄ = ε̄ χ̄_p^{k(ρ̄)−1}`, so `ε` reduces to `ε(ρ̄)`. The cases:

- `p` odd and `N(ρ̄)` odd: Theorem 1.2(1);
- `p` odd and `N(ρ̄)` even: Theorem 9.1, then `R27.4/strong-form-by-minimal-lifts`;
- `p = 2` and `k(ρ̄) = 2`: Theorem 1.2(2);
- `p = 2` and `k(ρ̄) = 4`: Theorem 9.1, then the dyadic optimisation: Buzzard's level lowering for `ρ̄` not induced from `ℚ(i)`, Lemma 6.2(i) for dihedral `ρ̄`, and the passage from weight `2` at level `2N(ρ̄)`, Steinberg at `2`, to weight `4` at level `N(ρ̄)`.
The determinant identity and the invariance under enlarging the coefficient field are those of `AlgebraicModularFormsAndSerreWeights:R15.6` and `R15.4`. Only classical forms of weight at least `2` are produced. Khare's level-one theorem enters only through Corollary 8.1, as the base of the induction.
Source: [KW-I], §1, p. 2; §10.1, p. 20; [Se87], §2.6, p. 188 (the weight bounds).
*Needs:* `R27.4/theorem-1-2`; `R27.5/hypothesis-H-and-theorem-9-1`; `R27.4/strong-form-by-minimal-lifts`; `R27.1/dickson-and-the-dyadic-solvable-refinement`; `SerreWeightAndLevelOptimisation §5.6`; `SerreWeightAndLevelOptimisation Layer 6`; Input I.2; `AlgebraicModularFormsAndSerreWeights:R15.4`; `AlgebraicModularFormsAndSerreWeights:R15.6`.
The strong form requires the residual Artin conductor and Serre's local weight recipe, which the pinned libraries do not provide. Its weight bounds are `2 ≤ k ≤ p²−1` for odd `p` and `2 ≤ k ≤ 4` for `p = 2`. The qualitative conclusion `serre_conjecture_weak` is stated in `Suggested.lean` under R27.5 and R33.5.

**Checks.**

- A très ramifiée dyadic representation has Serre weight `4`; the bound `p²−1 = 3` cannot be used at `p = 2`.
- A representation with scalar restriction at `2` and non-dihedral projective image is included at weight `2` by Theorem 1.2(2).
- Twisting by a power of the mod-`p` cyclotomic character can change the Serre weight but preserves the prime-to-`p` conductor; the bounded statement applies to the original representation as well as its twists.

**The finite-flat weight-two export** (`R27.6/finite-flat-weight-two-export`). Let `p ≥ 5` and `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` continuous, odd and absolutely irreducible, finite at `p` in the sense of `IsFiniteFlatResidual` (Conventions §2.2), with `det ρ̄ = χ̄_p`. Then there are a normalised newform `g` of weight `2`, level `N(ρ̄)` and trivial character, and a prime `λ | p` of its coefficient field, with `ρ̄_{g,λ} ≅ ρ̄`; in particular `a_ℓ(g) ≡ tr ρ̄(Frob_ℓ) (mod λ)` for `ℓ ∤ pN(ρ̄)`. By Serre's Proposition 4, finiteness at `p` with `det ρ̄|_{I_p} = χ̄_p` gives `k(ρ̄) = 2; det ρ̄ = χ̄_p` gives `ε(ρ̄) = 1`; the strong form gives a newform of weight `2` and level `N(ρ̄)` with character reducing to `1`; Carayol's change of nebentypus `(p ≥ 5)` makes the character trivial at the same weight and level. The level is the prime-to-`p` conductor of `ρ̄`, not the conductor of an elliptic curve; `EllipticCurveModularity:R29.2` compares them.
Source: [Se87], Proposition 4, p. 189; [KW-I], §1, p. 2.
*Needs:* `R27.6/full-classical-serre-theorem`; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.24a and R07.5.6a; `AlgebraicModularFormsAndSerreWeights:R15.6`; `SerreWeightAndLevelOptimisation §4.1`.
Suggested exact-conductor name: `weight_two_trivial_character`. This is a README-only target: its finite-at-`p` notion requires the finite-flat residual-representation carriers of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.6a. The prime and residue-map conclusion on the newform carrier is the comparison that `EllipticCurveModularity:R29.2`'s `SerreWitness` derives from integral-closure congruence comparison.

**Checks.**

- The finite-flat representation on the `p`-torsion of an elliptic curve with good reduction at `p ≥ 5`, when absolutely irreducible, gives a trivial-character weight-two form.
- A très ramifiée extension of `1` by `χ̄_p` is excluded even though its semisimplification is finite flat and its determinant is cyclotomic.
- The local model may have coefficients in a finite extension of `𝔽_p`; the statement does not impose prime-field descent.

**Theorem 10.1(i): regular compatible systems** (`R27.6/scope-of-the-final-statement-and-the-compatible-system-export`). Every odd, irreducible, regular compatible system of two-dimensional representations of `G_ℚ` comes, after a twist, from a newform of weight at least `2`. First, `ρ̄_λ` is irreducible for almost all `λ`, by the bounded conductor and fixed Hodge–Tate weights. Twist so that the Hodge–Tate numbers are `(a, 0)` with `a ≥ 0`; regularity gives `a > 0`. Apply the strong form to `ρ̄_λ` for infinitely many `λ`: the forms all lie in `S_k(Γ₁(N))` with `k = a + 1` and `N` fixed, so one newform occurs infinitely often. The general irregular-system theorem, Theorem 10.1(ii), is outside this roadmap. Its finite-image case is Corollary 10.2(ii) below.
Source: [KW-I], Theorem 10.1 and its proof, p. 20.
*Needs:* `R27.6/full-classical-serre-theorem`; Input I.3.

**Checks.**

- Hodge–Tate weights `{0,1}` are regular and give weight two after normalization.
- The multiset `{0,0}` is irregular and fails this target's hypothesis.
- An odd finite-image system is irregular; its modularity belongs to the separate Artin weight-one conclusion below.

**Reductions of an odd Artin representation** (`R27.6/artin-reductions-of-serre-type`). Let `ρ : G_ℚ → GL₂(ℂ)` be continuous, irreducible and odd, with image `G = Gal(M/ℚ)` (finite, since `GL₂(ℂ)` has no small subgroups), Artin conductor `N` and determinant `ε`, a Dirichlet character `mod N` with `ε(−1) = −1`.
(a) There are a number field `E ⊂ ℂ` and `ρ_E : G → GL₂(E)` with `ρ_E ⊗ ℂ ≅ ρ`. For every finite place `λ` of `E`, with residue characteristic `ℓ, ρ_E` stabilises an `𝒪_λ`-lattice `Λ`, and `ρ̄_λ = Λ/λΛ` satisfies `tr ρ̄_λ(Frob_r) ≡ tr ρ(Frob_r)` and `det ρ̄_λ(Frob_r) ≡ ε(r) (mod λ)` for primes `r ∤ Nℓ`. `E` need not be the field of traces.
(b) If `ℓ ∤ |G|`, then `ℓ` is odd, `ρ̄_λ` is absolutely irreducible, odd, faithful on `G`, independent of `Λ`, and `dim (ρ̄_λ)^H = dim ρ^H` for every subgroup `H ≤ G`.
(c) If moreover `ℓ ∤ N`, then `ρ̄_λ` is unramified at `ℓ, N(ρ̄_λ) = N, ε(ρ̄_λ) = ε mod λ`, Serre's weight is `k(ρ̄_λ) = ℓ` and Edixhoven's weight is `1`.
(d) The primes `ℓ ∤ N|G|` with `ρ(Frob_ℓ)` conjugate to `ρ(c)` have Dirichlet density `|C|/|G| > 0, C` the class of `ρ(c)`; for such `ℓ, ρ̄_λ(Frob_ℓ)` has the distinct eigenvalues `1` and `−1`, so `ρ̄_λ|_{D_ℓ} ≅ 1 ⊕ η` with `η ≠ 1` unramified.
Proof outline: `ℚ̄[G]` is split semisimple, so `ρ` is realisable over a number field; the lattice `Σ_g ρ_E(g)𝒪_λ²` is stable. When `ℓ ∤ |G|` the averaging idempotent `e_H = |H|⁻¹Σ_{h∈H} h` acts on `Λ`, so invariants commute with reduction; the endomorphism ring of the reduction is the reduction of a rank-one direct summand, and Maschke's theorem gives semisimplicity, so the reduction is absolutely irreducible. The kernel of `GL₂(𝒪_λ) → GL₂(k_λ)` is pro-`ℓ`, which gives faithfulness. The conductor is computed from the ramification filtration of `M`, the same for `ρ` and `ρ̄_λ`, and the invariant dimensions agree. Trivial inertia at `ℓ` gives Serre weight `ℓ` and Edixhoven weight `1`, and `det ρ̄_λ = ε(ρ̄_λ)χ̄_ℓ^{ℓ−1} = ε(ρ̄_λ)`. Chebotarev gives (d).
Source: [KW-I], Corollary 10.2(ii), p. 21, and proof of Theorem 10.1(ii), p. 20, state the modularity conclusions; parts (a)–(d) and their reduction argument are targets here.
*Needs:* `ArithmeticGaloisRepresentations Layer 1`; `ArithmeticGaloisRepresentations Layer 3`; `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`; `AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k`; `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`; [Chebotarev, Layer 10][cheb]; `NumberField.Chebotarev.frobeniusPrimeSet`; `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`; `NumberField.Chebotarev.infinite_frobeniusPrimeSet`; `MonoidAlgebra.Submodule.exists_isCompl`.

**Checks.**

- For a subgroup acting trivially, the averaging idempotent is the identity and both invariant dimensions are two.
- If the group order is invertible in the residue field, two stable lattices in the same generic representation have isomorphic full reductions, by semisimplicity and equality of characteristic polynomials.
- At residue characteristic three, the order-three local type of R33.3 has standard and adapted reductions with inertia-invariant dimensions two and one. Here three divides the group order six, so the lattice-independence hypothesis fails.

**Weight one modulo `ℓ`** (`R27.6/unramified-residual-representations-arise-in-weight-one`). Let `ℓ` be an odd prime and `ρ̄ : G_ℚ → GL₂(𝔽̄_ℓ)` continuous, irreducible, odd and unramified at `ℓ`, with conductor `N` and character `ε = det ρ̄`, such that `ρ̄(Frob_ℓ)` has two distinct eigenvalues. Then there is a Katz cuspidal eigenform `h` of type `(N, 1, ε)` over `𝔽̄_ℓ` (a section of `ω ⊗ 𝒪(−cusps)` on the `Γ₁(N)` moduli stack, on which the diamond operators act through `ε`) with `T_r h = tr ρ̄(Frob_r) · h` for every prime `r ∤ Nℓ`. The form need not lift to characteristic zero for this `ℓ`.
Proof outline: `k(ρ̄) = ℓ`, so the strong form gives a newform `f` of weight `ℓ` and level `N` with `ρ̄_{f,λ′} ≅ ρ̄`; its reduction `g` is a Katz eigenform of type `(N, ℓ, ε)`. `g` is ordinary, since a supersingular eigenform has ramified local representation at `ℓ`. So `ρ_g|_{D_ℓ} ≅ (λ(ε(ℓ)/a_ℓ), ∗; 0, λ(a_ℓ))`, and distinct Frobenius eigenvalues give `a_ℓ² ≠ ε(ℓ)`. `ρ̄` is not exceptional in Edixhoven's sense, Edixhoven's weight is `1`, and Gross's companion-form theorem `(k = ℓ, k′ = 1)` gives `h` with `a_r(h) = a_r(g)` for `r ≠ ℓ`. Without the hypothesis on `Frob_ℓ` the conclusion still holds for `ℓ > 2` by the form of Edixhoven's theorem without an exceptional case (Coleman–Voloch); the Artin case below uses only the form with the hypothesis.
Source: [KW-I], proof of Theorem 10.1, p. 20.
*Needs:* `R27.6/full-classical-serre-theorem`; `SerreWeightAndLevelOptimisation §3.7`; `SerreWeightAndLevelOptimisation §§3.5–3.6`; `SerreWeightAndLevelOptimisation §3.1`; `SerreWeightAndLevelOptimisation §3.2`; `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`; `AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k`; `AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image`; `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field`.

**Weight-one forms reduce onto Katz forms for almost all `ℓ`** (`R27.6/weight-one-reduction-is-onto-for-almost-all-primes`). Let `N ≥ 5, X = X₁(N)` over `ℤ[1/N]` (proper smooth of relative dimension one), `ω` its Hodge bundle, `C` the cusps, and `S₁(N; A) = H⁰(X_A, ω ⊗ 𝒪(−C))` for a `ℤ[1/N]`-algebra `A`. There is a finite set `B(N)` of primes such that for every prime `ℓ ∤ N` outside `B(N)` and every discrete valuation ring `𝒪` flat over `ℤ_(ℓ)` with residue field `k`, the base-change map `S₁(N; 𝒪) ⊗ k → S₁(N; k)` is an isomorphism, compatible with `T_r (r ∤ Nℓ)` and the diamond operators. One may take `B(N)` to be the primes `ℓ` for which `H¹(X, ω ⊗ 𝒪(−C))` has nonzero `ℓ`-torsion: multiplication by `ℓ` on the invertible sheaf gives `0 → H⁰/ℓ → H⁰(X_{𝔽_ℓ}, ·) → H¹[ℓ] → 0`, and `H¹` is finitely generated over the principal ideal domain `ℤ[1/N]`, so only finitely many primes divide its torsion. `B(N)` may be nonempty. In weight `k ≥ 2` the exceptional set is empty (`H¹` vanishes for `k ≥ 3`, and is locally free for `k = 2` by Kodaira–Spencer and duality).
Source: [KW-I], proof of Theorem 10.1, p. 20, sketches the weight-one step by reference to [Kh97]; the cohomology argument above proves the base-change assertion and defines `B(N)`.
*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.1/cusp-ideal-section-forms`; `AlgebraicModularFormsAndSerreWeights:R15.2`; `AlgebraicModularFormsAndSerreWeights:R15.2/finite-generation-of-geometric-sections`; `AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image`; `AlgebraicModularFormsAndSerreWeights:R15.2/torsion-cohomology-hecke-action`; `AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`.

**Khare's weight-one descent** (`R27.6/weight-one-descent-from-infinitely-many-primes`). Let `N ≥ 1, ε` a Dirichlet character `mod N, E ⊂ ℂ` a number field containing its values, and `(t_r)` elements of `𝒪_E` indexed by the primes `r ∤ N`. Put `N′ = N` if `N ≥ 5` and `N′ = 5N` otherwise. Suppose that for infinitely many primes `ℓ` there are a place `λ | ℓ` of `E`, an embedding of its residue field in `𝔽̄_ℓ`, and a Katz cuspidal eigenform `h_ℓ` of type `(N, 1, ε mod λ)` over `𝔽̄_ℓ` with `T_r h_ℓ = (t_r mod λ) h_ℓ` for every prime `r ∤ Nℓ`. Then there is a normalised newform `f` of weight one and level dividing `N′`, with character agreeing with `ε` on integers prime to `N′`, such that `a_r(f) = t_r` for every prime `r ∤ N′`. If moreover `ρ : G_ℚ → GL₂(ℂ)` is continuous, semisimple and unramified outside `N` with `tr ρ(Frob_r) = t_r` and `det ρ(Frob_r) = ε(r)` for `r ∤ N`, then `ρ` is isomorphic to the Deligne–Serre representation `ρ_f`. Nothing is assumed about `T_ℓ` or the operators at primes dividing `N`, and the level of `f` is only shown to divide `N′`.
Proof outline: pull `h_ℓ` back to level `N′` and discard `ℓ | 2N′` and `ℓ ∈ B(N′)`. By the previous target, `h_ℓ` lies in the reduction of the finite free module `M = S₁(N′; ℤ[1/N′])`; the Deligne–Serre lemma gives an eigenvector over a discrete valuation ring with eigenvalues `b_r ≡ t_r`. The eigenvalue systems on `M ⊗ ℚ̄` form a finite Galois-stable set, so one system `Θ` occurs for infinitely many `ℓ`; then `Θ(T_r) − t_r` lies in primes above infinitely many rational primes and vanishes. `Θ` is the system of a nonzero weight-one form, and the theory of newforms gives `f`. Two semisimple representations of finite image with equal traces and determinants at all Frobenius elements outside a finite set are isomorphic, by Chebotarev.
Source: [KW-I], proof of Theorem 10.1, p. 20, sketches descent by reference to [Kh97]; the finite Galois-orbit argument above supplies the descent proof.
*Needs:* `R27.6/weight-one-reduction-is-onto-for-almost-all-primes`; `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`; `AlgebraicModularFormsAndSerreWeights:R15.2/finite-generation-of-geometric-sections`; `AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison`; [ModularForms, Layers 4–5][mf]; `AlgebraicModularFormsAndSerreWeights §R15.5A.3`; `ArithmeticGaloisRepresentations Layer 5`; [Chebotarev, Layer 10][cheb].

**Odd Artin representations come from weight one** (`R27.6/odd-artin-weight-one-modularity`). Let `ρ : G_ℚ → GL₂(ℂ)` be continuous, odd and irreducible, with Artin conductor `N`; put `N′ = N` if `N ≥ 5` and `N′ = 5N` otherwise. There is a normalised cuspidal newform `f` of weight one, level dividing `N′` and character `det ρ` on integers prime to `N′`, with `ρ ≅ ρ_f`. This is Khare–Wintenberger Corollary 10.2(ii). Proof: for `ℓ` in the positive-density set `P_c` of `R27.6/artin-reductions-of-serre-type`(d) and `λ | ℓ, ρ̄_λ` is absolutely irreducible, odd, unramified at `ℓ` with distinct Frobenius eigenvalues `1, −1`, of conductor `N` and character `det ρ mod λ`; the weight-one step gives a Katz eigenform `h_ℓ` of type `(N, 1, det ρ mod λ)` with eigenvalues `tr ρ(Frob_r) mod λ`; descent over the infinite set `P_c` gives `f`. The weight-one step used is the non-exceptional case of Edixhoven's theorem.
Source: [KW-I], Corollary 10.2(ii) and §10.2, p. 21.
*Needs:* `R27.6/artin-reductions-of-serre-type`; `R27.6/unramified-residual-representations-arise-in-weight-one`; `R27.6/weight-one-descent-from-infinitely-many-primes`; `R27.6/full-classical-serre-theorem`; `AlgebraicModularFormsAndSerreWeights §R15.5A.3`.
`Suggested.lean` states Artin weight-one modularity as `weight_one_artin_modularity`. Open kernel gives continuity with finite image on the Krull Galois group; the conclusion includes unramifiedness, trace equality and determinant-character equality at every prime away from the newform level. The exact conductor divisibility above requires the Artin conductor, absent at the pins.

**Checks.**

- A representation induced from a non-conjugation-invariant finite-order character of an imaginary quadratic field is included in the dihedral case.
- An odd icosahedral Artin representation is included without a solvable-image hypothesis.
- A sum of two characters fails irreducibility; its weight-one Eisenstein series is outside the cuspidal conclusion.

## Layer R33.1: The qualitative target and the first weight change

*Milestones:* Serre's conjecture, weak form; Paso 1, the change to a weight-two system.

The modern route proves modularity of every odd irreducible `ρ̄` without weight reduction and without the `(L_r)/(W_r)` induction. Its inputs are lift existence (Dieulefait–Pacetti Theorem 1.9, whose cases `(1)–(3)` are Khare–Wintenberger Theorem 5.1), almost strictly compatible systems (Theorem 1.11, Dieulefait), the de Rham lifting theorems `1.4–1.7`, Langlands–Tunnell and Rohrlich–Tunnell, and the base cases of Tate, Serre and Schoof. From the classical strand it uses only the definition of good-dihedral primes, Lemma 6.3 and Lemma 8.2.

**The weak form and the solvable case** (`R33.1/dp-target-and-the-weight-at-least-two-convention`). Target: every odd continuous irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` is modular, `ρ̄ ≅ ρ̄_{f,p}` for an eigenform `f ∈ S_k(Γ₀(N), ε)`. Only forms of weight `k ≥ 2` are used: a representation congruent to that of a weight-one form is congruent to one of weight at least `2` (Deligne–Serre, §6.9). For `p` odd, solvable image is Theorem 1.3 (Langlands–Tunnell): by Dickson the projective image is cyclic, dihedral, `A₄` or `S₄, ρ̄` lifts to an odd complex representation, and that comes from a weight-one form. So in odd characteristic the target reduces to non-solvable image. At `p = 2` the solvable case is Rohrlich–Tunnell (R33.5). Dieulefait–Pacetti take the passage from the weak to the strong form from the literature (Edixhoven for the weight; Ribet and Boston–Lenstra–Ribet for the level), which leaves the scalar dyadic case open; this roadmap obtains the passage in R33.6, from `R27.4/strong-form-by-minimal-lifts` and the dyadic optimisation.
Source: [DP], Introduction and Remark 1, p. 1; Theorem 1.3, p. 3.
*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`; `AlgebraicModularFormsAndSerreWeights:R15.6`; `ArithmeticGaloisRepresentations Layer 4`.

**Modularity transfer along congruences** (`R33.1/dp-modularity-lifting-inputs`). Let `ρ, ρ′ : G_ℚ → GL₂(ℚ̄_p)` be continuous, odd, finitely ramified and de Rham at `p` with Hodge–Tate weights `{0, k − 1}` and `{0, k′ − 1}, k, k′ > 1`, with isomorphic residual representations. If `p` is odd and `ρ̄|_{G_{ℚ(√p*)}}` is absolutely irreducible (Theorem 1.4), or `p = 2` and `ρ̄` has non-solvable image (Theorem 1.5), then `ρ` is modular if and only if `ρ′` is. Theorem 1.4 is Kisin's, with the local–global hypothesis removed by Emerton or Paškūnas and the remaining one by Hu–Tan `(p ≥ 5)` and Tung `(p = 3)`; Theorem 1.5 is due to Kisin, Paškūnas and Tung. For residually reducible `ρ̄`: Theorem 1.6 (`p ≥ 5, ρ` irreducible and de Rham with Hodge–Tate weights `{0, k − 1}: ρ` is modular; Skinner–Wiles and Pan), and Theorem 1.7 (`p = 3, ρ` irreducible, `ρ̄^{ss} ≅ 1 ⊕ χ̄₃, ρ|_{I₃}` of the form `(∗, ∗; 0, 1), det ρ = ψχ₃^{k−1}` with `ψ` of finite order: Skinner–Wiles). With Remark 4, that a compatible system is modular if one member is, these propagate modularity along every chain of systems below. The residual condition of Theorem 1.4 over `ℚ(√p*)` is equivalent to absolute irreducibility over `ℚ(ζ_p)` (Dieulefait–Pacetti Lemma 1.13). Each application below verifies the contract of `R33.1/dp-modularity-lifting-inputs`: the residual image, the Hodge–Tate weights, oddness, residual modularity or the congruence. Theorems 1.4–1.6 impose no ordinarity hypothesis. Theorem 1.7 requires characteristic-zero irreducibility, the stated ordinary inertia shape at `3`, the matching finite-order determinant factor and residual distinguishedness.
Theorem 1.7 is printed with a further condition, that `ρ|_{D₃}` is not the identity. In Skinner–Wiles' theorem, as stated in `R33.1/dp-modularity-lifting-inputs`, the condition is `χ̄|_{D₃} ≠ 1` for the nontrivial residual character `χ̄ = χ̄₃`; it holds automatically, since `χ̄₃` is ramified at `3`.
Source: [DP], Theorems 1.4–1.7, pp. 4–5, and the proof of Theorem 1.4, p. 4; Remark 4, p. 7.
*Needs:* `ArithmeticGaloisRepresentations Layer 4`; Input I.1; Input I.3.

**Checks.**

- A nonordinary crystalline lift satisfying Theorem 1.4's residual hypotheses still falls under that theorem.
- At `p = 3`, a residually reducible de Rham lift without the ordinary inertia shape does not meet Theorem 1.7's hypotheses.
- In Theorem 1.7, `χ̄₃|I₃ ≠ 1`, so the residual characters are distinguished; a scalar residual pair would fail this condition.
- The split representation `χ₃ ⊕ 1` is odd, crystalline of weights `{0,1}`, unramified outside `3`, distinguished and has determinant `χ₃`. Its invariant coordinate lines exclude it from Theorem 1.7; these other conditions alone cannot give a cuspidal newform.

**Fontaine–Laffaille members are not bad dihedral** (`R33.1/fontaine-laffaille-member-not-bad-dihedral`). Let `p` be odd and `ρ : G_ℚ → GL₂(ℚ̄_p)` crystalline at `p` with Hodge–Tate weights `{0, k − 1}, k ≥ 2`, and `p > 2k`. Then `k(ρ̄) = k`, and if `ρ̄` is irreducible it is not bad dihedral. Indeed a bad-dihedral `ρ̄` has `p = 2k(ρ̄) − 1` (niveau one) or `p = 2k(ρ̄) − 3` (niveau two) by Lemma 1.14, the statement of Khare–Wintenberger Lemma 6.2(ii): the projective image of `I_p` has order at most `2`; in niveau one `χ^{k−1}` has order `≤ 2` with `k ≤ p`, so `2k − 2 = p − 1` or `k = p`, and `k = p` makes the image of `I_p` trivial, which a bad-dihedral `ρ̄` excludes; in niveau two `ψ^{(k−1)(p−1)}` has order `(p + 1)/gcd(p + 1, k − 1)`, at most `2` only for `k − 1 = (p + 1)/2`. The uses are `(k, w)` with `w > 2k` in Paso 1, `(2, q)` with `q > 5` in Paso 2, and `(2, p)` with `p > 3` in characteristic two.
Source: [DP], Lemma 1.14, p. 8, and its proof, p. 9; Paso 1, p. 10.
*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.4`; `AlgebraicModularFormsAndSerreWeights:R15.4/bad-dihedral-normalized-weight-application`; `ArithmeticGaloisRepresentations Layer 4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.9`.

**Solvable residual image ends the argument** (`R33.1/solvable-residual-termination`). Let `p ≥ 5` and `ρ : G_ℚ → GL₂(ℚ̄_p)` odd, irreducible, finitely ramified and de Rham at `p` with Hodge–Tate weights `{0, k − 1}, k > 1`, with `ρ̄` of solvable image and not bad dihedral. Then `ρ` is modular: if `ρ̄` is reducible by Theorem 1.6, if irreducible by Theorem 1.3 and then Theorem 1.4. This ends Paso 1 at `w`, Paso 2 at `q` and the reduction of characteristic two; `w > 2k ≥ 4` and `q > 5` provide `p ≥ 5`, and the previous target provides "not bad dihedral". `ρ` is irreducible as a member of an irreducible system.
Source: [DP], Paso 1, p. 10.
*Needs:* `R33.1/dp-modularity-lifting-inputs`; `R33.1/dp-target-and-the-weight-at-least-two-convention`; `R33.1/fontaine-laffaille-member-not-bad-dihedral`.

**Paso 1: change to a weight-two system** (`R33.1/paso-1-weight-two-system`). Let `p` be odd and `ρ̄` odd irreducible with non-solvable image, twisted so that `2 ≤ k = k(ρ̄) ≤ p + 1`. Let `ρ^{(0)}` be a minimal crystalline lift (Theorem 1.9(3)) in an almost strictly compatible system (Theorem 1.11); non-solvable image gives the absolute irreducibility over `ℚ(ζ_p)` that both theorems need. Choose a prime `w > 2k` outside its ramification set. Then either `ρ^{(0)}_w`, and so `ρ̄`, is modular, or `ρ̄^{(0)}_w` has non-solvable image and there is an almost strictly compatible system `{ρ^{(1)}_ℓ}` with Hodge–Tate weights `{0, 1}`, containing a weight-two lift of `ρ̄^{(0)}_w` with the same ramification set (Theorem 1.9(4)), such that `ρ̄` is modular if and only if `{ρ^{(1)}_ℓ}` is. Write `S₁` for its ramification set; `w` may lie in `S₁`, since the new lift need not be crystalline at `w`.
Source: [DP], Paso 1, p. 10.
*Needs:* `R33.1/dp-modularity-lifting-inputs`; `R33.1/fontaine-laffaille-member-not-bad-dihedral`; `R33.1/solvable-residual-termination`; Input I.3.

## Layer R33.2: The good-dihedral prime and the odd level

*Milestones:* Paso 2, the good-dihedral prime `N`; Paso 3, killing the odd part of the level.

**The dihedral local type at `N`** (`R33.2/dihedral-local-type-at-n`). Let `q` be an odd prime and `N` a prime with `q | N + 1` (so `q ∤ N − 1`). The unit group of `𝔽_{N²}` has order `N² − 1 = (N − 1)(N + 1)`, so by local class field theory there is a character `κ : G_{ℚ_{N²}} → ℤ̄_q^×` of order `q` whose restriction to `I_N` factors through `𝔽_{N²}^×` and not through `𝔽_N^×` (niveau two), normalised by `κ(Art(N)) = 1`. Its induction `τ_N = Ind_{G_{ℚ_{N²}}}^{G_{ℚ_N}} κ` is irreducible (`κ ≠ κ^N` as `q ∤ N − 1`), `τ_N|_{I_N} ≅ κ ⊕ κ^N`, and its image is dihedral of order `2q`. Without the normalisation, `κ(Art(N)) = ζ ≠ 1` is a scalar in the image, which then has order `2q²`; the projective image is dihedral of order `2q` in either case, and the inertial type depends only on `κ|_{I_N}`.
The *standard lattice* is `L_std = Ind 𝒪(κ)` over the integers `𝒪` of a finite extension of `ℚ_q` containing `μ_q`, with basis `e₁ = 1 ⊗ 1, e₂ = s ⊗ 1` for a Frobenius lift `s`. A tame generator `σ` acts by `diag(κ(σ), κ(σ)^N)` and `s` by `(0, 1; 1, 0)`: the transfer sends `s` to `s² = Art(Nu)` with `u` a unit, and `κ` is trivial on units of `ℤ_N` because `q ∤ N − 1`, so `κ(s²) = κ(Art(N)) = 1`. Since `𝔽̄_q^×` has no element of order `q, κ̄ = 1`, and `L_std` modulo the maximal ideal is `1 ⊕ η` with `η` the unramified quadratic character: unramified, with trace `0` at `Frob_N`. This residual statement is about `L_std` only. Every stable lattice has semisimplified reduction `1 ⊕ η`, but another stable lattice can reduce to a non-split extension with nontrivial unipotent inertia, as the lattice `L₁` of R33.3 does at `(q, N) = (3, 2)`. With coefficients in `ℤ̄_p` for `p ≠ q` the reduction stays irreducible.
Source: [DP], Paso 2, p. 11 (with the two Paso 2 entries under Corrections to the sources, concerning the residue field and the inertia group).
*Needs:* `ArithmeticGaloisRepresentations Layer 2`; `ArithmeticGaloisRepresentations Layer 4`.

API of the full local construction, which needs the local Galois groups and characters of `ArithmeticGaloisRepresentations Layer 2`:

- `levelTwoCharacter` — `κ : G_{ℚ_{N²}} → 𝒪^×` of order `q` for `q | N + 1`, with `κ(Art(N)) = 1`; `levelTwoCharacter_orderOf`: its order is `q` and `κ|_{I_N}` does not factor through `𝔽_N^×`; `levelTwoCharacter_artin`: `κ(Art(N)) = 1`.
- `dihedralType` — `τ_N = Ind κ : G_{ℚ_N} → GL₂(𝒪)` in the basis `e₁, e₂` of `L_std`; `dihedralType_irreducible`: `τ_N` is irreducible, and so is its reduction modulo any prime `p ≠ q`.
- `dihedralType.standardLattice` — `L_std = 𝒪e₁ ⊕ 𝒪e₂`, with `σ ↦ diag(κ(σ), κ(σ)^N)` and `s ↦ (0, 1; 1, 0)`.
- `dihedralType_standardLattice_residual` — `L_std/𝔪L_std ≅ 1 ⊕ η`, unramified with trace `0` at `Frob_N`.
- `dihedralType_residual_semisimplification` — for every stable lattice `Λ, (Λ/𝔪Λ)^{ss} ≅ 1 ⊕ η; Λ/𝔪Λ` itself depends on `Λ`.

**Checks.**

- `5² − 1 = 24 = 4 · 6` while `|𝔽₂₅| = 25`, so `(N − 1)(N + 1)` is the order of the unit group.
- `q = 7, N = 13: 7 | 14` and `7 ∤ 12`, so `κ` has niveau two.
- `q = 3, N = 7: 3 | 6 = N − 1`, so a character of order `3` of `I_N` factors through `𝔽₇^×, κ^N = κ` on `I_N`, and with `κ(Art(N)) = 1` the induction `Ind κ` is reducible.
- on `L_std, κ̄ = 1` and the trace of `Frob_N` on `1 ⊕ η` is `1 − 1 = 0`.
- Under a coefficient map to `𝔽₂` sending `ζ` to `1`, the inertia matrix is still the identity, but the swap Frobenius is a nonidentity unipotent. It cannot be conjugated to `diag(1,1)`; the split quadratic-character description requires odd residue characteristic.
- if `κ(Art(N)) = ζ ≠ 1`, the restriction of `Ind κ` to `G_{ℚ_{N²}}` maps onto `μ_q × μ_q` and `Ind κ` has image of order `2q²`, with projective image still dihedral of order `2q`.
- at `(q, N) = (3, 2), 𝒪 = ℤ₃[ζ], π = ζ − 1`, the stable lattice `L₁ = 𝒪(e₁ + e₂) + 𝒪πe₂` reduces to `σ ↦ (1, 0; 1, 1)`, with one-dimensional inertia invariants, while `L_std` reduces to trivial inertia; a residual statement that names no lattice is false.

**Paso 2: inserting the good-dihedral prime `N`** (`R33.2/dp-lift-existence-and-good-dihedral-insertion`). Let `{ρ^{(1)}_ℓ}` be the weight-two system of Paso 1, with coefficient field `K` and ramification set `S₁`. Choose a prime `q ≡ 1 (mod 4), q > 5`, larger than every prime of `S₁` and split in `K`. As `q ∉ S₁` the residual weight at `q` is `2`, not `q + 1`. Either `ρ^{(1)}_q` is modular (solvable residual image; not bad dihedral since `k = 2` and `q > 5`), or `ρ̄^{(1)}_q : G_ℚ → GL₂(𝔽_q), 𝔽_q`-valued because `q` splits in `K`, has non-solvable image; non-solvable image gives the absolute irreducibility over `ℚ(ζ_q)` that Theorems 1.9 and 1.11 need. Choose `N ∉ S₁` by Lemma 8.2 (Dieulefait–Pacetti Lemma 1.15): `tr ρ̄^{(1)}_q(Frob_N) = 0` and `χ̄_q(Frob_N) = −1`, so `ρ̄^{(1)}_q|_{D_N}` is, up to twist, `diag(χ̄_q, 1)`, and `q | N + 1`. Theorem 1.9(4), in its crystalline-at-`q` alternative with the compatible type `τ_N` at `N`, gives a lift `ρ^{(2)}_q`, crystalline of weight `2` at `q`, whose inertial type at `N` is that of `τ_N: ρ^{(2)}_q(I_N)` is cyclic of order `q`, acting through `κ ⊕ κ^N`, and the projective image of `D_N` is dihedral of order `2q`. The image of `D_N` itself is infinite, since `det ρ^{(2)}_q(Frob_N) = ψ(N)N` is not a root of unity. By Theorem 1.4, `ρ^{(1)}_q` is modular if and only if `ρ^{(2)}_q` is, and Theorem 1.11 places `ρ^{(2)}_q` in a system `{ρ^{(2)}_ℓ}` with ramification set `S = S₁ ∪ {N}`. `N ≡ 1 (mod 8)` and `N ≡ 1` modulo every prime `≤ q − 1` (Lemma 8.2(ii)) are what Lemma 2.1 needs. This target is the Paso 2 application only; the general existence theorem, Theorem 1.9(1)–`(4)`, is Input I.3.
Source: [DP], Paso 2, pp. 10–11; Theorem 1.9(4), p. 6.
*Needs:* `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`; `R33.2/dihedral-local-type-at-n`; `R33.1/solvable-residual-termination`; `R33.1/dp-modularity-lifting-inputs`; `R33.1/paso-1-weight-two-system`; Input I.3.

API of the bundled insertion datum, which needs the compatible systems of Input I.3:

- `GoodDihedralInsertion` — the data `(q, N, κ, {ρ^{(2)}_ℓ})` with `q ≡ 1 (mod 4), q > 5, q > max S₁, q` split in `K`, and `N` as in Lemma 8.2 for `ρ̄^{(1)}_q`.
- `GoodDihedralInsertion.system` — the system `{ρ^{(2)}_ℓ}`, ramified inside `S₁ ∪ {N}`, with the prescribed nontrivial type at `N`.
- `GoodDihedralInsertion.type_at_N` — its Weil–Deligne parameter at `N` restricted to inertia is `κ ⊕ κ^N`.
- `GoodDihedralInsertion.congruences` — `N ≡ 1 (mod 8), N ≡ 1` modulo every prime `≤ q − 1, N ≡ −1 (mod q)`.
- `GoodDihedralInsertion.modular_iff` — `{ρ^{(1)}_ℓ}` is modular if and only if `{ρ^{(2)}_ℓ}` is.

**Checks.**

- for `q = 13` the prime `N = 406561` satisfies `N ≡ 1` modulo `8, 3, 5, 7, 11` and `N ≡ −1 (mod 13)`.
- `13 | 406561 + 1` and `13 ∤ 406561 − 1`, so `κ` has niveau two.
- an inert degree-two coefficient place gives an `𝔽_{q²}`-valued reduction, without certifying descent to `𝔽_q`. A Frobenius trace outside `𝔽_q` obstructs that descent and prevents an application of Lemma 8.2.
- `q = 5` is excluded, because Definition 2.1 asks for `t > 5` and Lemma 2.1 takes `t = q`; the Dickson step alone uses only that `q` divides neither `|A₄| = 12` nor `|S₄| = 24`, so that a solvable projective image of order divisible by `q` is dihedral.
- the construction gives Paso 2 only, not the four cases of Theorem 1.9.
- residual weight `q + 1` at `q` selects the Steinberg case of Theorem 1.9(4) and cannot give the crystalline Paso 2 lift.

**Lemma 2.1: the good-dihedral prime keeps the images large** (`R33.2/lemma-2-1-large-image`). Let `{ρ_ℓ}` be an almost strictly compatible system ramified inside `S ∪ {2, 3}` whose inertial type at `N` is that of `Ind κ`. Then for every prime `p ∈ S₁ ∪ {2, 3}, ρ̄_p` has non-solvable image. In fact `ρ̄_p` is good-dihedral for `N` with `t = q: ρ̄_p|_{I_N} ≅ κ̄_p ⊕ κ̄_p^N, κ̄_p` the reduction of `κ` in characteristic `p ≠ q`, still of order `q; q | N + 1, q > max(Q(N(ρ̄_p)/N²), 5, p)` because `p` and every other ramified prime lie in `S₁ ∪ {2, 3}`, below `q`, and the congruences of Lemma 8.2(ii) hold; so Lemma 6.3(i) applies. Dieulefait–Pacetti's own proof: `ρ̄_p|_{D_N}` is irreducible because reduction is injective on elements of order `q ≠ p`; a solvable image would be dihedral (Dickson, `q > 5`), induced from a quadratic field ramified only in `S ∪ {2, 3}; N` splits or ramifies there by the congruences, and both contradict the type. The hypothesis on the type at `N` must survive every congruence of Pasos `3–4`; it does for minimal lifts in the sense of Conventions §2.3.
Source: [DP], Lemma 2.1, p. 11, and its proof, pp. 11–12.
*Needs:* `R33.2/dihedral-local-type-at-n`; `R27.1/good-dihedral-prime-definition`; `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`.

**Paso 3: killing the odd part of the level** (`R33.2/paso-3-killing-the-odd-level`). Let `{ρ^{(2)}_ℓ}` be ramified at `{p₁ < … < p_r} ∪ {N}, S₁ = {p₁, …, p_r}`. For `i = 2, …, r`, and also `i = 1` when `p₁` is odd, reduce the preceding `p_i`-adic member modulo `p_i`: the residual representation has non-solvable image (Lemma 2.1). Apply `I.3/residual-weight-normalization-transition`, obtaining `τ̄_i = ρ̄_{p_i} ⊗ χ̄_{p_i}^{a_i}` with `2 ≤ k(τ̄_i) ≤ p_i+1`, and twist the preceding member by the finite-order Teichmüller lift `θ_i`. Theorem 1.9(3) now gives a minimal crystalline lift of `τ̄_i` at `p_i`, with Hodge–Tate weights `{0,k(τ̄_i)−1}` and unramified Weil–Deligne parameter, and Theorem 1.11 a system whose ramification set omits `p_i`, stays inside `S₁ ∪ {2, 3, N}` and keeps the type at `N`. Twist invariance and Theorem 1.4 make consecutive systems simultaneously modular; retain `a_i`, `θ_i` and the residual and lifted determinant data of the normalization transition. The result is a system ramified only in `{2, N}` (only at `N` if `p₁` is odd, and then Paso 5 follows), equivalent for modularity to `{ρ^{(2)}_ℓ}`. The `p_i`-adic member can ramify at `p_i`; it is the fixed ramification set of the system that omits `p_i`. The intermediate systems have weight `k(τ̄_i)`, not necessarily `2`; Paso 4 restores weight `2` when it is used, and Paso 5 also accepts the other regular weights. The lifts must be minimal in the sense of Conventions §2.3 so that the type at `N` is kept.
Source: [DP], Paso 3, p. 12; Remark 2, p. 5.
*Needs:* `R33.2/lemma-2-1-large-image`; `R33.1/dp-modularity-lifting-inputs`; `R33.2/dp-lift-existence-and-good-dihedral-insertion`; `I.3/residual-weight-normalization-transition`; Input I.3.

**Checks.**

- Split inertia `χ̄_{p_i} ⊕ χ̄_{p_i}²` at `p_i ≥ 5` has weight `p_i+3` even for a finite-order twist of a weight-two member. Normalize by `χ̄_{p_i}^{−1}` before invoking Theorem 1.9(3); inertia at `N` is unchanged.
- The cyclotomic character at `p_i` is crystalline and ramified, with unramified Weil–Deligne parameter; adjoining a trivial summand gives weights `{0,1}`.
- An unramified `p_i`-adic representation has only weight zero, so cannot have weights `{0,k−1}` for `k ≥ 2`.
- After removing `p_i` from the fixed ramification set, a member of coefficient characteristic different from `p_i` is unramified at `p_i`, while the member above `p_i` is crystalline there.

## Layer R33.3: The prime two and the auxiliary prime

*Milestones:* Lemma 2.3, the order-three type at `2`; Paso 4, removing `2`; Paso 5, killing the good-dihedral prime.

**Lemma 2.3: the order-three type at `2`** (`R33.3/dp-dyadic-transition-and-the-order-three-type`). Let `{ρ_ℓ}` be an almost strictly compatible system with Hodge–Tate weights `{0, 1}`, unramified at `3`, whose Weil–Deligne representation at `2` is Steinberg up to an unramified twist, and with `ρ̄₃` of non-solvable image. Since the system is unramified at `3, ρ₃` is crystalline and `k(ρ̄₃) = 2`. Let `χ′` be a character of `G_{ℚ₄}` (`ℚ₄` the unramified quadratic extension of `ℚ₂`) of order `3` and niveau two, normalised by `χ′(Art(2)) = 1`, with values in `𝒪 = ℤ₃[ζ], ζ² + ζ + 1 = 0, π = ζ − 1`; let `ρ̃₂ = Ind χ′`, so `ρ̃₂|_{I₂} ≅ χ′ ⊕ χ′²` with trivial monodromy. This is the construction of R33.2 at `(q, N) = (3, 2)`.
Then `ρ̄₃|_{D₂} ≅ γ ⊗ (χ̄₃, c; 0, 1)` with `γ` unramified, and either `c = 0` (`ρ̄₃` unramified at `2, ρ̄₃|_{D₂} ≅ γ ⊗ (η ⊕ 1)`) or `ρ̄₃|_{I₂}` is a nontrivial unipotent. There is a `G_{ℚ₂}`-stable lattice `Λ` in `ρ̃₂` with `γ ⊗ (Λ/πΛ) ≅ ρ̄₃|_{D₂}`: the standard lattice `L₀` when `c = 0`, the adapted lattice `L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂` when `c ≠ 0; L₀` does not serve when `c ≠ 0`. Hence `ρ̃₂|_{I₂}` is an inertial type compatible with `ρ̄₃` at `2` in the sense of Theorem 1.9, and both reductions have trace `0` at Frobenius. A lift `ρ′₃` of `ρ̄₃`, crystalline of weight `2` at `3`, minimal away from `2` and `3`, with `ρ′₃|_{I₂} ≅ χ′ ⊕ χ′²`, exists by Theorem 1.9(4), and also by Khare–Wintenberger Theorem 5.1(4) at `(p, q) = (3, 2)`, whose hypotheses `ρ̄₃` meets: it is of S-type with `k(ρ̄₃) = 2 ∈ [2, 4]`, absolutely irreducible over `ℚ(μ₃)` because its image is non-solvable, of the form `(χ̄₃, ∗; 0, 1)` on `D₂` up to an unramified twist, and `3 | 2 + 1; χ′|_{I₂}` has niveau two and order `3`, and no parity condition arises since `3` is odd. Its conclusion at `3` is the parameter `(1 ⊕ 1, 0)`, so `ρ′₃` is crystalline of weight `2`. Theorem 1.11 gives a system `{ρ′_ℓ}`, congruent to `{ρ_ℓ}` at `3`, with the same weights, ramification contained in the stated set and an order-three type at `2`; the two are simultaneously modular (Theorem 1.4 at `3`).
Proof outline: Steinberg up to the twist `γ̃` gives `ρ₃(Frob₂)` eigenvalues `γ̃(Frob₂){2, 1}`, reducing to `γ(Frob₂){−1, 1}` since `χ̄₃(Frob₂) = −1; ρ̄₃(I₂)` is unipotent, so wild inertia acts trivially and `I₂` acts through a tame generator `σ`. If `ρ̄₃(σ) = 1`, the distinct eigenvalues give the split case. Otherwise, in a basis whose first vector spans the inertia invariants, `ρ̄₃(σ) = (1, b; 0, 1)` with `b ≠ 0` and `ρ̄₃(Frob₂) = (α, x; 0, β)`; the tame relation `Frob₂σFrob₂⁻¹ = σ²` forces `α = −β`, and conjugation makes `Frob₂` diagonal and `b = 1`. On `L₀, σ ↦ D₀ = diag(ζ, ζ²), Frob₂ ↦ F₀ = (0, 1; 1, 0)`, reducing to `1` and to an involution with eigenvalues `±1`. With `P = (1, 0; 1, π), D₀P = PD₁` and `F₀P = PF₁` for `D₁ = (ζ, 0; ζ, ζ²)` and `F₁ = (1, π; 0, −1)`; both pairs satisfy `D³ = F² = 1` and FDF`⁻¹ = D²`, and modulo `π, D₁ ≡ (1, 0; 1, 1), F₁ ≡ diag(1, −1)`, the non-split module. The level-two inertia-rigid condition at `2` of `LocalGaloisDeformationRings §8.8` describes these lifts; the matrices of `L₀` and `L₁`, after an unramified twist, are lifts of that kind, though not in the supplier's diagonal-Frobenius normal form.
Source: [DP], Lemma 2.3, p. 12, and its proof, p. 13; §1.3 before Theorem 1.9, p. 6 (compatible inertial types); [KW-I], Theorem 5.1(4), p. 10.
*Needs:* `R33.2/lemma-2-1-large-image`; `R33.2/dihedral-local-type-at-n`; `R33.1/dp-modularity-lifting-inputs`; `ArithmeticGaloisRepresentations Layer 2`; Input I.3; `LocalGaloisDeformationRings §8.8`.
These matrix equations hold over any commutative coefficient ring with `ζ²+ζ+1=0` and under any map to a characteristic-three ring sending `ζ` to one. Over every field of characteristic three, adapted inertia has one invariant dimension and standard inertia has two. The cyclotomic coefficient ring gives the integral lattice specialization.

API of the full local construction:

- `orderThreeCharacter` — `χ′ : G_{ℚ₄} → ℤ₃[ζ]^×` of order `3` and niveau two with `χ′(Art(2)) = 1`; on `I₂` it is the niveau-two fundamental character into `𝔽₄^× ≅ μ₃`.
- `orderThreeType` — `ρ̃₂ = Ind χ′`, with `ρ̃₂|_{I₂} ≅ χ′ ⊕ χ′²` and monodromy `0`.
- `orderThreeType.standardLattice` — `L₀: σ ↦ diag(ζ, ζ²), Frob₂ ↦ (0, 1; 1, 0)`.
- `orderThreeType.adaptedLattice` — `L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂: σ ↦ (ζ, 0; ζ, ζ²), Frob₂ ↦ (1, π; 0, −1)`.
- `orderThreeType_standardLattice_reduction` — `L₀/πL₀ ≅ 1 ⊕ η`, with trivial inertia.
- `orderThreeType_adaptedLattice_reduction` — `L₁/πL₁` is the non-split extension, `σ ↦ (1, 0; 1, 1), Frob₂ ↦ diag(1, −1)`.
- `orderThreeType_exists_lattice_reduction_iso` — if `ρ̄₃|_{D₂} ≅ γ ⊗ (χ̄₃, c; 0, 1), Λ = L₀ (c = 0)` or `L₁ (c ≠ 0)` satisfies `γ ⊗ (Λ/πΛ) ≅ ρ̄₃|_{D₂}`.
- `orderThreeType_isCompatible` — `ρ̃₂|_{I₂}` is compatible with `ρ̄₃` at `2`, the hypothesis of Theorem 1.9(4) at `ℓ = 2`.
- `typeChangeAtTwo` — `{ρ_ℓ}` is modular if and only if `{ρ′_ℓ}` is.

**Checks.**

- `|𝔽₄^×| = 3` and `|𝔽₂^×| = 1`, so an order-`3` character of tame inertia at `2` has niveau two.
- `K = ℚ₄(χ′)` has `e(K/ℚ₂) = 3`, which is odd.
- the Steinberg type `(ω₁ ⊕ 1, N ≠ 0)` has nonzero monodromy and is not potentially crystalline; the order-three type is.
- if the system is ramified at `3, k(ρ̄₃) = 2` can fail and Theorem 1.9(4) gives no crystalline lift at `3`.
- over `ℤ[ζ], D₀³ = F₀² = 1, F₀D₀F₀⁻¹ = D₀²`, and `D₀ ≡ 1 (mod π)`.
- `D₀P = PD₁, F₀P = PF₁, D₁³ = F₁² = 1` and `F₁D₁F₁⁻¹ = D₁²`.
- modulo `π, D₁ ≡ (1, 0; 1, 1) ≠ 1` and `F₁ ≡ diag(1, −1)`, so `L₁/πL₁` has one-dimensional inertia invariants.
- `D₀ ≡ 1 (mod π)`, so `L₀` cannot realise a ramified `ρ̄₃|_{I₂}`.
- modulo `π, F₀² = 1` and `F₀ ≠ ±1`, so its eigenvalues are `1` and `−1 = 2 = χ̄₃(Frob₂)`.

**Remark 6: the dyadic weight after the type change** (`R33.3/remark-6-weight-two-after-type-change`). In Paso 4, if `ρ̄₂` has non-solvable image and `k(ρ̄₂) = 4`, the system `{ρ′_ℓ}` of Lemma 2.3 has `k(ρ̄′₂) = 2`. The type of `ρ′₂` at `2` comes from `χ′` (almost strict compatibility, `ρ̄′₂` irreducible by Lemma 2.1), so `ρ′₂` is crystalline with Hodge–Tate weights `{0, 1}` over `K = ℚ₄(χ′), e(K/ℚ₂) = 3`; it comes from a `2`-divisible group and `ρ̄′₂|_{G_K}` is finite flat. A très ramifiée representation is finite flat over no extension of odd ramification index, so `ρ̄′₂` has weight `2`. This is the argument of `R27.5/dyadic-weight-two-claim`; the criterion is imported from `AlgebraicModularFormsAndSerreWeights:R15.4`, not from R27.5, to keep the modern strand independent of the classical induction. The detour is needed because Theorem 1.9 gives a crystalline lift at `2` only in weight `2`.
Source: [DP], Remark 6, p. 13 (see Corrections to the sources for the operative criterion).
*Needs:* `R33.3/dp-dyadic-transition-and-the-order-three-type`; `R33.2/lemma-2-1-large-image`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20`; Input I.3.

**Paso 4: removing `2` from the level** (`R33.3/paso-4-removing-two`). After Paso 3 let the system be ramified only at `2` and `N`. There is an almost strictly compatible system of weight `2` unramified outside `N` and equivalent for modularity:

1. if `k(ρ̄₂) = 4`, take a minimal weight-two lift with Steinberg type at `2` (Theorem 1.9(2)) and its system (transfer by Theorem 1.5); if `k(ρ̄₂) = 2`, go directly to step `3`;
2. in the weight-four branch, change the type at `2` by Lemma 2.3, which needs the system unramified at `3` (after Paso 3) and of Hodge–Tate weights `{0, 1}` (after step `1`);
3. now `k(ρ̄₂) = 2` (Remark 6, or directly when the weight was `2`), and a minimal crystalline weight-two lift (Theorem 1.9(1)) lies in a system unramified at `2` (transfer by Theorem 1.5).
Non-solvable image at `2` (Lemma 2.1) is needed for Theorems 1.9(1), 1.9(2) and 1.5. The type at `N` is kept by minimal lifts and by prescribing `τ_N` at `N`. The order of the steps matters: the Steinberg lift makes Lemma 2.3 applicable, and Remark 6 needs the type from Lemma 2.3.
Source: [DP], Paso 4, pp. 12–13.
*Needs:* `R33.3/dp-dyadic-transition-and-the-order-three-type`; `R33.3/remark-6-weight-two-after-type-change`; `R33.2/lemma-2-1-large-image`; `R33.2/paso-3-killing-the-odd-level`; `R33.1/dp-modularity-lifting-inputs`; Input I.3.

**Paso 5: killing the good-dihedral prime** (`R33.3/paso-5-killing-the-good-dihedral-prime`). Let `{ρ′_ℓ}` be an odd irreducible almost strictly compatible system with Hodge–Tate weights `{0,h−1}`, `h ≥ 2`, unramified outside `N`, with `N ≡ 1 (mod 8)` as chosen in Paso 2. This includes the weight-two output of Paso 4 and the regular-weight output of Paso 3 when Paso 4 is skipped. Reduce its `N`-adic member modulo `N`.

1. If `ρ̄′_N` is reducible, `ρ′_N` is modular by Theorem 1.6 `(N > 5)`. Only the de Rham property at `N` is available here (almost strict compatibility gives no Weil–Deligne information at the ramified coefficient prime `N` when the residual member is reducible), and Pan's theorem needs nothing more.
2. If `ρ̄′_N` is irreducible, first apply `I.3/residual-weight-normalization-transition` at `N`, obtaining `τ̄_N = ρ̄′_N ⊗ χ̄_N^a` with `2 ≤ k(τ̄_N) ≤ N+1`, and twist the preceding member by its finite-order Teichmüller lift. Once `τ̄_N` is not bad dihedral, a minimal crystalline lift of `τ̄_N` (Theorem 1.9(3)), with its normalized weight and matching determinant, lies in a system with empty ramification set. Twist invariance and Theorem 1.4 give modularity equivalence with the original system.
3. `τ̄_N` is not bad dihedral: the twist preserves its level `1`, and a level-one bad-dihedral representation in characteristic `N` needs `N ≡ 3 (mod 4)` (Lemma 1.14 with Wintenberger's lemma, Remark 5), while `N ≡ 1 (mod 8)`.
`ρ′_N` is irreducible because other members of the system have irreducible residual representations. Case `1` is the one place where almost strict, rather than strict, compatibility matters.
Source: [DP], Paso 5, p. 14; Remark 2, p. 5; Remark 5, p. 9.
*Needs:* `R33.2/paso-3-killing-the-odd-level`; `R33.3/paso-4-removing-two`; `I.3/residual-weight-normalization-transition`; `R33.1/dp-modularity-lifting-inputs`; `R33.1/fontaine-laffaille-member-not-bad-dihedral`; `SmallRamificationAndAbelianVarietyBaseCases §5.6`; Input I.3.

**Checks.**

- Locally at `N ≥ 5`, split inertia `χ̄_N ⊕ χ̄_N²` has weight `N+3` and normalizes to weight two. For any global representation being normalized, its prime-to-`N` conductor is unchanged; in particular level one stays level one.
- Skipping Paso 4 can leave `h > 2`; the finite-order twist retains that weight, and Theorem 1.4 compares it to the normalized crystalline lift of possibly different weight.
- Twisting at `N` introduces no ramification at any other prime, so the new crystalline system has empty fixed ramification set. Its `N`-adic member can still be ramified at `N`.

## Layer R33.4: The terminal characteristic five

*Milestones:* Paso 6, the terminal characteristic five; Serre's conjecture for odd `p`.

**Paso 6: the level-one system at `p = 5`** (`R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`). Let `{ρ″_ℓ}` be the system with empty ramification set from Paso 5. At `p = 5`, normalize each irreducible reduction by `I.3/residual-weight-normalization-transition`, writing `τ̄₅ = ρ̄″₅ ⊗ χ̄₅^a`, twisting the preceding member by its Teichmüller lift and retaining its determinant data. The twist preserves level one and modularity. Then:

1. if `ρ̄″₅` is reducible, `ρ″₅` is modular by Theorem 1.6;
2. `τ̄₅` is not bad dihedral, since it has level `1` and `5 ≢ 3 (mod 4)` (Remark 5);
3. otherwise `k(τ̄₅) ∈ {2, 4, 6}`, as level one forces an even normalised weight (`det ρ̄ = χ̄₅^{k−1}` after normalisation and oddness make `k − 1` odd). For weight `2` or `4`, a minimal crystalline lift of `τ̄₅` in a system with empty ramification set has a `3`-adic member with reducible reduction (Tate–Serre: nothing irreducible is unramified outside `3`), ordinary by Berger–Li–Zhu since the weight is `2` or `4 = 3 + 1`, hence modular by Theorem 1.7, in the form of `R33.1/dp-modularity-lifting-inputs`: the semisimplified reduction is `1 ⊕ χ̄₃`, the only odd sum of characters unramified outside `3`, and `χ̄₃|_{D₃} ≠ 1` (Dieulefait–Pacetti phrase this as: the weight is not `3`). For weight `6`, a weight-two lift of `τ̄₅` Steinberg at `5` and unramified elsewhere (Theorem 1.9(4)) comes from a `GL₂`-type abelian variety `A/ℚ` (Snowden, Proposition 9.4.1), semistable with good reduction outside `5`, contradicting Schoof; before Schoof's theorem is applied, `A` must be checked to be of `GL₂`-type, semistable at `5` and of good reduction outside `5`.
In every case the system, hence `ρ̄″₅` and by the chain of Pasos `1–5` the original `ρ̄`, is modular (twist invariance and Theorem 1.4 at `5` for the lifts in case `3`). The terminal cases are `SmallRamificationAndAbelianVarietyBaseCases §5.12`.
Source: [DP], Paso 6, p. 14; Remark 2, p. 5.
*Needs:* `I.3/residual-weight-normalization-transition`; `R33.3/paso-5-killing-the-good-dihedral-prime`; `R33.1/dp-modularity-lifting-inputs`; `SmallRamificationAndAbelianVarietyBaseCases §5.12`; `SmallRamificationAndAbelianVarietyBaseCases §5.6`; `SmallRamificationAndAbelianVarietyBaseCases §5.3`; `SmallRamificationAndAbelianVarietyBaseCases §5.4`; `SmallRamificationAndAbelianVarietyBaseCases §5.9`; `SmallRamificationAndAbelianVarietyBaseCases §5.7`; `SmallRamificationAndAbelianVarietyBaseCases Layer 4`; `SmallRamificationAndAbelianVarietyBaseCases Layer 2`; Input I.3.

**Checks.**

- Locally at five, split inertia `χ̄₅ ⊕ χ̄₅²` has weight eight and normalizes to weight two. The interval `[2,6]` applies to the normalized reduction, independently of the preceding system's weight.
- Level one and oddness exclude odd normalized weights in `[2,6]`; precisely `2,4,6` remain.
- A finite-order twist at five preserves the preceding member's Hodge–Tate weights. The replacement lifts of normalized weights two and four have empty fixed ramification set, while the weight-two Steinberg replacement at residual weight six retains ramification at five.

**Serre's conjecture in odd characteristic** (`R33.4/dp-odd-characteristic-assembly`). Every odd irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` with `p` odd is modular. Solvable image is Theorem 1.3. Otherwise Pasos `1` to `6` give a chain of almost strictly compatible systems, consecutive ones simultaneously modular (Theorems 1.4 and 1.5, Remark 4), ending in a modular system or a contradiction. The proof uses no weight reduction and no `(L_r)/(W_r)` induction; its base cases are Tate–Serre and Schoof. Weight and level are not claimed here.
Source: [DP], §2, pp. 10 and 15.
*Needs:* `R33.1/dp-target-and-the-weight-at-least-two-convention`; `R33.1/paso-1-weight-two-system`; `R33.1/dp-modularity-lifting-inputs`; `R33.2/dp-lift-existence-and-good-dihedral-insertion`; `R33.2/paso-3-killing-the-odd-level`; `R33.3/paso-4-removing-two`; `R33.3/paso-5-killing-the-good-dihedral-prime`; `R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`.

## Layer R33.5: Characteristic two and the qualitative theorem

*Milestones:* characteristic two; the qualitative Serre theorem in every characteristic.

**The auxiliary odd prime for a dyadic system** (`R33.5/auxiliary-odd-prime-for-the-dyadic-system`). Let `ρ̄ : G_ℚ → GL₂(𝔽̄₂)` be irreducible with non-solvable image. Take the `E`-rational almost strictly compatible, irreducible, odd system of Khare–Wintenberger Theorem 5.1(1) when `k(ρ̄) = 2`, or `5.1(2)` when `k(ρ̄) = 4`, whose dyadic member lifts `ρ̄` with Hodge–Tate weights `{0, 1}`; by the definitions of Khare–Wintenberger §5 every characteristic-zero member is irreducible and odd. For every prime `p > 3` outside the finite ramification set and every coefficient place above `p`, the `p`-adic member `ρ_p` is odd, irreducible, finitely ramified and crystalline of weight `2` at `p`: the almost strict clause at an odd unramified prime gives crystallinity even when the reduction is reducible. `ρ̄_p` may be reducible; if it is irreducible it has weight `2` and is not bad dihedral, since Lemma 1.14 would force `p = 2 · 2 − 1 = 3` or `p = 2 · 2 − 3 = 1`. Such primes `p` exist, since the ramification set is finite.
Source: [DP], §3, p. 15; [KW-I], §5, definitions on p. 8 and Theorem 5.1(1)–(2), p. 9.
*Needs:* `R33.1/fontaine-laffaille-member-not-bad-dihedral`; Input I.3.

**Characteristic two** (`R33.5/dp-characteristic-two-closure`). Every irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄₂)` is modular. If the image is solvable, the projective image is dihedral (Khare–Wintenberger Lemma 6.1: `S₄` does not occur, and `A₄` would lie in a Borel subgroup over `𝔽₄`), and dihedral images are Rohrlich–Tunnell. If the image is non-solvable, take the dyadic system and an auxiliary prime `p > 3` as above: `ρ̄_p` is either reducible, and `ρ_p` is modular by Theorem 1.6, or irreducible, odd and not bad dihedral, hence modular by the odd case, and `ρ_p` is modular by Theorem 1.4. By Remark 4 the system, hence `ρ̄`, is modular. Only the odd-characteristic theorem of R33.4 is used, not this layer's own conclusion at `p = 2`; no dyadic lifting theorem is needed, only the dyadic lift existence.
Source: [DP], §3, p. 15.
*Needs:* `R33.5/auxiliary-odd-prime-for-the-dyadic-system`; `R33.4/dp-odd-characteristic-assembly`; `R33.1/dp-modularity-lifting-inputs`; `ArithmeticGaloisRepresentations Layer 4`; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; Input I.3.

**The qualitative Serre theorem** (`R33.5/qualitative-serre-theorem`). For every prime `p`, every odd irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` is modular: `ρ̄ ≅ ρ̄_{f,p}` for a cuspidal eigenform `f` of some weight `k ≥ 2`, level and character. Odd `p` is R33.4; `p = 2` is the previous target. The proof uses no target of R26 or of R27.2–R27.6. No weight or level is asserted.
Source: [DP], Introduction, pp. 1–2.
*Needs:* `R33.4/dp-odd-characteristic-assembly`; `R33.5/dp-characteristic-two-closure`; `R33.1/dp-target-and-the-weight-at-least-two-convention`.
`Suggested.lean` states this conclusion as `serre_conjecture_weak`, the statement of Theorem 9.1 with a second proof.

**What the qualitative proof rests on** (`R33.5/globalisation-dependency-check`). The qualitative theorem rests on exactly:

- (a) lift existence, Theorem 1.9: cases `(1)–(3)` are Khare–Wintenberger Theorem 5.1, proved in their second paper, and case `(4)` is Gee and Snowden (Input I.3);
- (b) almost strictly compatible systems, Theorem 1.11 (Dieulefait, through Taylor's potential modularity; Input I.3), and modularity transfer (Input I.3);
- (c) the lifting theorems `1.4–1.7` (`R33.1/dp-modularity-lifting-inputs`);
- (d) Langlands–Tunnell and Rohrlich–Tunnell (`GL2AutomorphicRepresentationsAndTransfer:R17.5`, `R17.6`);
- `(e)` the base cases of Tate, Serre and Schoof with Snowden's realisation (SmallRamificationAndAbelianVarietyBaseCases Layers 2–5);
- `(f)` from this roadmap, only the early R27.1 targets: the good-dihedral definition, Lemma 6.3 and Lemma 8.2, with Dickson's classification and Khare–Wintenberger Lemma 6.2(ii) (Dieulefait–Pacetti Lemma 1.14) from ArithmeticGaloisRepresentations Layer 4 and `AlgebraicModularFormsAndSerreWeights:R15.4`.
The modern route is independent of Khare–Wintenberger's induction, not of all of their work: it shares Theorem 5.1. It is independent of Serre's conjecture itself only if no globalisation step inside (a)–`(c)` invokes the general theorem. This condition concerns in particular Tung's global Breuil–Mézard inputs (the patched modules of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin, Emerton–Paškūnas faithfulness and Theorem A.4.1 of Barnet-Lamb–Gee–Geraghty `(2013)`) and Gee's Theorem 4.4.12 used by Kisin. `R33.5/globalisation-dependency-check` owns that examination, separating the forms of the lifting theorems that take residual modularity as a hypothesis from those that would use the full Serre theorem; the independence claim of this layer is exactly as strong as its conclusion. Dieulefait–Pacetti attribute the removal of weight reduction to Kisin's and Pan's lifting theorems.
Source: [DP], proof of Theorem 1.9, p. 6; Introduction, p. 2.
*Needs:* `R33.5/qualitative-serre-theorem`; `R33.1/dp-modularity-lifting-inputs`; `R33.1/paso-1-weight-two-system`; `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`; `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; Input I.3.

## Layer R33.6: The strong form from the modern proof

*Milestone:* the strong form via the modern route.

**The two notions of modularity agree** (`R33.6/modern-and-classical-modularity-agree`). For `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` odd and irreducible, the following are equivalent: (i) `ρ̄ ≅ ρ̄_{f,p}` for a Hecke eigenform `f ∈ S_k(Γ₀(N), ε)` with `k ≥ 2` (Dieulefait–Pacetti); (ii) `ρ̄` arises from a newform in the sense of Conventions §2.2 (Khare–Wintenberger, `AlgebraicModularFormsAndSerreWeights:R15.6`). `(ii) ⇒ (i)` because a newform is an eigenform. `(i) ⇒ (ii)`: pass to the newform with the same eigenvalues away from the level (Atkin–Lehner) and apply Brauer–Nesbitt; the residual isomorphism is in general with the semisimplification, and irreducibility of `ρ̄` makes it an isomorphism with `ρ̄`. Weight-one forms are handled by the Deligne–Serre congruence of R33.1. So R33.6 proves the same statement as R27.6, with one definition of modularity.
Source: [DP], Introduction, p. 1; [KW-I], §1, p. 2.
*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`; `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`; `R33.1/dp-target-and-the-weight-at-least-two-convention`.

**The strong form from the qualitative theorem** (`R33.6/strong-form-by-the-modern-route`). The statement of `R27.6/full-classical-serre-theorem` follows from the qualitative theorem (through the previous target) together with `R27.4/strong-form-by-minimal-lifts`, for `p` odd and for `p = 2` with `k(ρ̄) = 2` including `ρ̄|_{D₂}` scalar with non-dihedral projective image, and with the dyadic optimisation of SerreWeightAndLevelOptimisation Layers 5–6 for `p = 2` with `k(ρ̄) = 4`. R27.4's refinement needs only modularity of `ρ̄` and Khare–Wintenberger Theorems 5.1(1) and 4.1, so it can be fed by the qualitative theorem without the induction. This is a second proof of the one public theorem. Dieulefait–Pacetti cite Edixhoven, Ribet and Boston–Lenstra–Ribet for the refinement; those results do not cover the scalar dyadic case, which Khare–Wintenberger Theorem 1.2(2) states; its proof, Theorem 5.1(1) with Theorem 4.1(1) at `2`, is not written out in the source and is supplied by `R27.4/strong-form-by-minimal-lifts` (Corrections to the sources).
Source: [DP], Introduction, p. 1; [KW-I], §1.1, p. 2.
*Needs:* `R33.5/qualitative-serre-theorem`; `R33.6/modern-and-classical-modularity-agree`; `R27.4/strong-form-by-minimal-lifts`; `SerreWeightAndLevelOptimisation §5.6`; `SerreWeightAndLevelOptimisation Layer 6`; `ArithmeticGaloisRepresentations Layer 4`; `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`.

**What each proof takes from Khare–Wintenberger** (`R33.6/two-routes-comparison`). R27.6 and R33.6 prove the same theorem.

1. Qualitative existence: the classical route uses Khare–Wintenberger §§3, 8 and 9 (the `(L_r)/(W_r)/(D_r)` induction with Theorems 3.1–3.4 and 9.1) and Khare's level-one theorem for `(W₁)`; the modern route uses none of these, but shares Theorem 5.1 and the base cases.
2. Refinement: both routes pass from modularity to weight `k(ρ̄)` and level `N(ρ̄)` through `R27.4/strong-form-by-minimal-lifts`, with Lemma 6.2(i) in the dihedral case. Outside one case the refinement was known before Khare–Wintenberger (Edixhoven, Ribet, Boston–Lenstra–Ribet; Buzzard's mod-`2` level lowering and Wiese in characteristic two). Khare–Wintenberger's argument is indispensable only for `ρ̄|_{D₂}` scalar with non-dihedral projective image `(p = 2, k(ρ̄) = 2)`, where Buzzard's dyadic level lowering needs a multiplicity-one statement that is not known (`SerreWeightAndLevelOptimisation §5.11`); there Theorem 5.1(1) with Theorem 4.1(1) at `2` supplies the level, an argument Khare–Wintenberger do not write out (Corrections to the sources).
3. The dyadic weight-four optimisation is common to both routes.
The qualitative modern endpoint meets the classical strand only in the three early R27.1 targets. Its strong-form refinement also uses `R27.4/strong-form-by-minimal-lifts` and `R27.1/dickson-and-the-dyadic-solvable-refinement`; neither imports the conductor induction.
Source: [KW-I], §1.1, p. 2; [DP], Introduction, pp. 1–2.
*Needs:* `R27.6/full-classical-serre-theorem`; `R33.6/strong-form-by-the-modern-route`; `R27.4/strong-form-by-minimal-lifts`; `R27.4/theorem-1-2`; `R27.5/hypothesis-H-and-theorem-9-1`; `R33.5/globalisation-dependency-check`; `SerreWeightAndLevelOptimisation §5.11`.

**Checks.**

- The qualitative endpoint uses the three early R27.1 targets without the Dickson–dihedral refinement target.
- Passing to the optimal dyadic weight and level adds the Dickson–Lemma 6.2(i) package through `R27.4/strong-form-by-minimal-lifts`.
- Neither refinement target uses `(L_r)`, `(W_r)` or `(D_r)` to prove its conclusion; the classical conductor induction is needed only by the classical endpoint.

**The finite-flat export from either proof** (`R33.6/elliptic-curve-export-via-either-route`). Let `p ≥ 5` and `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` be continuous, odd and absolutely irreducible, finite at `p`, with `det ρ̄ = χ̄_p`, and assume the strong-form conclusion for this `ρ̄`: it arises from a newform of weight `k(ρ̄)`, level `N(ρ̄)` and nebentypus reducing to `ε(ρ̄)`. Then `ρ̄` arises from a normalised newform `g` of weight `2`, level `N(ρ̄)` and trivial nebentypus, with a coefficient prime `λ` above `p` and `ρ̄_{g,λ} ≅ ρ̄`; hence `a_ℓ(g) ≡ tr ρ̄(Frob_ℓ) (mod λ)` for `ℓ ∤ pN(ρ̄)`. The local finite-flat weight recipe gives `k(ρ̄) = 2` (for coefficients beyond `𝔽_p` in Raynaud's `𝔽`-vector-space form), the determinant gives `ε(ρ̄) = 1`, and Carayol's change of nebentypus at `p ≥ 5` makes the character trivial at the same weight and level; the level is exactly `N(ρ̄)` because the prime-to-`p` conductor of `ρ̄` divides that of every lift. The hypothesis is the strong conclusion for the fixed `ρ̄`, which either proof of the strong form supplies; the R27.6 export is the same argument.
Source: [KW-I], §1, p. 2.
*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`; `AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p`; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.24a and R07.5.6a; `SerreWeightAndLevelOptimisation §4.1`; `R33.6/strong-form-by-the-modern-route`; Input I.3.
Suggested exact-conductor name: `weight_two_trivial_character_of_arisesFrom`, with `k(ρ̄) = 2`, the consequence of finiteness at `p`. The unconditional export is the README target `R27.6/finite-flat-weight-two-export`; the exact-conductor statement above is shared with R27.6.

**Checks.**

- Either route supplies the same weight-two and trivial-character witness for an absolutely irreducible elliptic `p`-torsion representation at a good prime `p ≥ 5`.
- A très ramifiée local extension fails the finite-flat hypothesis in both routes; its cyclotomic determinant alone does not give weight two.
- Changing the basis or enlarging the finite coefficient field preserves the hypotheses and the integral-prime congruences.

## Worked examples

The following worked Checks distinguish the statements and conventions from plausible alternatives.

- **Terminal rows.** The five rows of R26.5 with their return weights: `(P, j) = (7, 2)` gives `4, 6; (11, 4)` gives `6, 8; (19, 8)` gives `10, 12; (29, 16)` gives `18, 14` and `(29, 14)` gives `16, 16; (31, 18)` gives `20, 14`. The factorisations `7 − 1 = 2 · 3, 11 − 1 = 2 · 5, 19 − 1 = 2 · 9, 29 − 1 = 4 · 7, 31 − 1 = 6 · 5` and the coset conditions modulo `(P − 1)/ℓ^e`. At `P = 31, 6 ∤ 16` while `6 | 18` and `18 ∈ (12, 18]`.
- **Prime estimates.** `π(31) = 11` and `π(100) = 25`, which refute the printed uniform bound. `257 = 2⁸ + 1` is skipped after `251`, and `263/251 ≤ 3/2 − 1/30`. The dyadic case `(13, 17, 4)` of `(2)` is `176 ≤ 208`, strict.
- **The local quadratic of R26.2.** With `α − β = γ(c − 1)` and `αβ = ψ, β² + βγ(c − 1) − ψ = 0`; at `(α, β, γ, c, ψ) = (3, 2, 1, 2, 6)` the correct polynomial vanishes and the printed one is `−4`.
- **Auxiliary primes.** For `p = 5, q = 409` satisfies `409 ≡ 1 (mod 8), ≡ 1 (mod 3), ≡ −1 (mod 5)`. For `p′ = q = 13, N = 406561` is prime, `≡ 1` modulo `8, 3, 5, 7, 11` and `≡ −1 (mod 13)`. `−1` is a square modulo `5` and `13 (2² + 1 ≡ 0, 5² + 1 ≡ 0)`.
- **Conductor bookkeeping.** `N = 6` satisfies the condition of `(D₁)` but not of `(D₀)`. The Steinberg parameter `(id, N)` with `N ≠ 0` nilpotent of rank one has conductor exponent `2 − 1 = 1`. In Theorem 3.4 the boundary case `p = 2, k(ρ̄) = 4, r = 1` has original exponent `0` and first-system exponent `A = 1 ≤ r`; with `r = 0` the bound would fail.
- **Bad-dihedral arithmetic.** `p > 2k` excludes `p = 2k − 1` and `p = 2k − 3`; the niveau-two case is attained at `p = 7, k = 5`, where `gcd(8, 4) = 4` and `8/4 = 2`. At level one a bad-dihedral representation has `p ≡ 3 (mod 4)`, which `N ≡ 1 (mod 8)` and `p = 5` avoid. At weight `2` the excluded primes are `3` and `1`.
- **Dyadic Dickson refinement.** An element `g` of `2`-power order of `GL₂(𝔽̄₂)` is unipotent `((g − 1)^{2^n} = g^{2^n} − 1 = 0)`, so `(g − 1)² = 0` and `g` has order at most `2`; the same holds in `PGL₂(𝔽̄₂)`, and since `S₄` has elements of order `4` it is not a projective image in characteristic two. The Borel subgroup of `PGL₂(𝔽₄)` has order `12 = |A₄|` while `|PGL₂(𝔽₄)| = 60 = |A₅|`.
- **Odd ramification index.** An odd valuation stays odd in an extension of odd ramification index and becomes even in index `2`.
- **Order-three lattices.** The identities `D₀³ = F₀² = 1, F₀D₀F₀⁻¹ = D₀², D₀P = PD₁, F₀P = PF₁, D₁³ = F₁² = 1, F₁D₁F₁⁻¹ = D₁²`, and the reductions modulo `π`, in exact arithmetic over `ℤ[ζ]`; both Frobenius matrices have trace `0`.

## Corrections to the sources

Every target above uses the corrected statement.

- [Kh], §6.1, p. 25 (weights `22–30`): the mod-`7` companion of a level-one mod-`29` representation is ramified only at `7` and `29`; the printed list `3, 19` is carried over from the previous row.
- [Kh], §6.1, pp. 25–26 (weight `32`): the printed nebentypus exponent `j = 16` is not admissible. A weight-`32 = 31 + 1` representation has a minimal weight-two lift semistable at `31`, so its mod-`5` member is unipotent on `I₃₁`, and the available nebentypes are `ω₃₁^{6i} (5 ∥ 30); 16` is not a multiple of `6`. The interval `(12, 18]` gives `j = 18` (`j = 12` also works), with return weights `20` or `14`.
- [Kh], §4, p. 19: the uniform bound `A x/log x ≤ π(x) ≤ B x/log x` for `x > 30` with the printed constants is false (`π(31) = 11` exceeds the upper bound, and so does `π(100) = 25`). R26.3 replaces it by Nagura's elementary `6/5` interval, its finite-range inequalities and the auxiliary-prime estimate; the auxiliary-prime conclusion is unchanged.
- [Kh], proof of Proposition 2.2, p. 15: the quadratic after `AB = BA` should read `β² + βγ(χ′(τ) − 1) − ψ = 0`; the derivative is still `2r_F` modulo `π`, so the smoothness conclusion is unchanged.
- [KW-I], §§7–8.2, pp. 12–15: the exponent of the prime power dividing `P − 1` is written `r`, the same letter as the fixed number of conductor primes; the two are unrelated, and this roadmap writes `ℓ^e ∥ P − 1`.
- [KW-I], proof of Theorem 9.1, p. 19: the system built with Theorem 5.1(4) lifts the mod-`3` representation `ρ̄₃`, not `ρ̄`, and the finite flatness over an extension `K` of `ℚ₂` of ramification index `3` comes from the local type of Theorem 5.1(4) moved to `ℓ = 2` by almost strict compatibility, not from Theorem 5.1(2).
- [KW-I], §3.2 and the remark after Theorem 3.4, p. 6: Theorem 3.4 proves modularity, and the passage to weight `k(ρ̄)` and level `N(ρ̄)` claimed in Theorem 1.2, including the scalar dyadic case, is not written out. `R27.4/strong-form-by-minimal-lifts` supplies it from Theorems 4.1 and 5.1(1), Lemmas 6.1 and 6.2(i), `θ`-operators, Edixhoven's weight theorem and the Deligne–Serre lemma.
- [DP], Paso 3, p. 12: the lift at `p_i` is crystalline with unramified Weil–Deligne parameter, not an unramified `p_i`-adic representation. Its system omits `p_i` from the fixed ramification set, while the member above `p_i` can ramify there.
- [DP], Paso 2, p. 11: `(N − 1)(N + 1)` is the order of the unit group of the residue field `𝔽_{N²}`, which itself has `N²` elements; and the niveau-two condition concerns the restriction of `κ` to the inertia group at `N`, not at `q`.
- [DP], Paso 2, p. 11: the lift `ρ^{(2)}_q` does not have dihedral image of order `2q` at `N`, since `det ρ^{(2)}_q(Frob_N) = ψ(N)N` is not a root of unity; its inertial type at `N` is that of `Ind κ`, and the projective image of `D_N` is dihedral of order `2q`, which is all Lemma 2.1 uses. Even `Ind κ` has image of order `2q` only when `κ(Art(N)) = 1`.
- [DP], Remark 6, p. 13: flatness over some extension of even ramification index gives no contradiction. The operative fact is that a très ramifiée representation becomes finite flat over no extension of odd ramification index: up to twist it is given by a Kummer class of odd valuation, which over `K` has valuation `e(K/ℚ₂)` times as large, and it is finite flat over `K` exactly when that valuation is even; so it becomes flat over `ℚ₂(√x)` (index `2`) but over no extension of odd ramification index.
- [DP], definition of minimal lift, p. 6, Lemma 2.1, p. 11, Pasos `3–4`, pp. 12–13: with Dieulefait–Pacetti's definition, under which a minimal lift need only be unramified at the primes `ℓ ≠ p` where `ρ̄` is unramified, a lift of `ρ̄_{p_i}` could have type `Ind(κε)` at `N` with `ε` of `p_i`-power order, and Lemma 2.1 would not apply to the new system. The lifts must be minimal in the sense of Conventions §2.3, which Khare–Wintenberger Theorem 5.1 provides; then the type at `N` is kept.
- [Ri], proof of Proposition 2.2, p. 280 (dihedral case): the subgroup containing the cyclic inertia image is the index-two rotation subgroup, not the centre, which has at most two elements.
- [Sa], Theorem 6.12(4) of the published version, case `i = 1`: in the exceptional case `m = 1 + (p + 1)j` the characters `ω₂^{m+p}` and `ω₂^{pm+1}` coincide and have niveau one, and the residual representation is split; the author corrects the published lattice statement in Remark 1.7 of arXiv v3, p. 4. Only Theorem 6.11, Corollary 6.15 and Remark 6.17 of v3 are used.

## Source notes

- [Kh] is cited in the page numbers of arXiv v1. It was published, with a different title, in Duke Math. J. 134 (2006). [KW-I] refer to Theorems 5.1 and 6.1 of the published version, numbers that do not occur in arXiv v1, where the compatible-system result is Proposition 3.1. R26.6 specifies the step that uses Theorem 6.1(2) by its content.
- [KW-I] is cited in the running page numbers (2–21) of the authors' preprint, not the Inventiones pages. Its Theorems 4.1 and 5.1 are proved in the sequel, Khare–Wintenberger, Serre's modularity conjecture (II), Invent. Math. 178 (2009), 505–586; this roadmap uses them as stated, through Input I.2 and Input I.3.
- [DP] is cited in the pages of arXiv v2. The theorems it imports (Kisin, Emerton, Paškūnas, Hu–Tan, Tung, Skinner–Wiles, Pan, Gee, Snowden, Dieulefait, Berger–Li–Zhu) are cited here through the layers that own them.
- [BM] is cited in the running pages of the authors' copy. Proposition 6.1.1 concerns the nonscalar principal-series type `ω_p^i ⊕ 1, 1 ≤ i ≤ p − 2`, with Hodge–Tate weights `{0, 1}` and any stable lattice, without an `End(ρ̄) = 𝔽` condition; the paper leaves out the details of its computation, which the integral classification of `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5` supplies.
- The weight-one step and the descent of R27.6 go back to Gross's companion forms, Coleman–Voloch, Edixhoven's weight paper with its note on the exceptional case, and Khare's note on `mod p` forms of weight one (Internat. Math. Res. Notices `1997`, corrigendum `1999`). The proofs given in R27.6 are complete from the listed prerequisites; the form of the weight-one step without a hypothesis on `Frob_ℓ` rests on Coleman–Voloch through `SerreWeightAndLevelOptimisation §3.7`. The Artin argument uses the distinct-Frobenius form; the general theorem for irregular compatible systems is outside this roadmap.
- The residually dihedral ordinary branch of the level-one proof for `ρ̄` induced from `ℚ(√−p)` rests on the full-scope ordinary lifting target of Input I.1. Khare–Wintenberger refer to Skinner's unpublished correction; the corrected dihedral deformation argument is part of that target. A lifting theorem excluding induction from an imaginary quadratic field cannot supply this branch.

## Suggested Lean forms

[`Suggested.lean`](Suggested.lean) uses the namespace `TauCeti.SerreConjecture`. Its five theorem statements are `serre_conjecture_weak` (R27.5 and R33.5), `khare_level_one` (R26.1 and R26.6), `finite_level_one_semisimple` (R26.6), `lemma_8_2` (R27.1), and `weight_one_artin_modularity` (R27.6). Each is a headline modularity, finiteness or density result.

The aliases `GQ`, `IntBar` and `FpBar` use native Mathlib carriers. The definitions `IsFrobAt`, `IsUnramifiedAt`, `IsOdd`, `IsAbsIrreducible` and `IsSType` express the arithmetic hypotheses; `coeff`, `coefficientRing` and `ArisesFrom` express residual attachment on `HeckeRing.GL2.Newform`; `toRepresentation` supplies Mathlib's semisimplicity predicate with the actual matrix action. The auxiliary-prime theorem uses `IsProjConj`, `primesOfRat` and `auxiliaryPrimes` to state its projective-image and density conditions.

The exact strong theorem requires the residual Artin conductor and Serre-weight recipe. The finite-flat weight-two export also requires the finite-flat residual predicate and its group-scheme model. The prescribed-lift, ordinary and crystalline lifting, compatible-system and conductor-induction statements require the arithmetic carriers and local period conditions specified by their suppliers. The Katz weight-one step, geometric reduction theorem and descent require the geometric modular-form spaces and their integral Hecke actions. The exact-conductor Artin refinement requires the Artin conductor. These targets, their APIs and their Checks are specified in the corresponding layers above.

## References

- [Ki] M. Kisin, *Modularity for some geometric Galois representations*, in *L-functions and Galois representations*, London Math. Soc. Lecture Note Ser. 320 (2007), 438–470; [author's version](https://people.math.harvard.edu/~kisin/dvifiles/dur.dvi), Proposition (3.13) and Theorem (3.14).
- [KW-II] C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009), 505–586; [authors' preprint](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf).
- [SW99] C. Skinner and A. Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999), 5–126; [version of record](https://www.numdam.org/item/PMIHES_1999__89__5_0/).
- [SW01] C. Skinner and A. Wiles, *Nearly ordinary deformations of irreducible residual representations*, Ann. Fac. Sci. Toulouse 10 (2001), 185–215; [version of record](https://www.numdam.org/item/AFST_2001_6_10_1_185_0/).

- [Kh] C. Khare, *On Serre's modularity conjecture for 2-dimensional `mod p` representations of `Gal(ℚ̄/ℚ)` unramified outside `p`*, [arXiv:math/0504080v1][kh] (2005); published as *Serre's modularity conjecture: the level one case*, Duke Math. J. 134 (2006), 557–589.
- [Kh97] C. Khare, *Remarks on mod p forms of weight one*, Internat. Math. Res. Notices 1997, no. 3, 127–133, [original note](https://doi.org/10.1155/S1073792897000093); corrigendum, 1999, no. 18, 1029, [correction](https://doi.org/10.1155/S1073792899000537).
- [KW-I] C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504; [authors' preprint][kw1].
- [KW-Ann] C. Khare and J.-P. Wintenberger, *On Serre's conjecture for 2-dimensional `mod p` representations of `Gal(ℚ̄/ℚ)`*, [Ann. of Math. 169 (2009), 229–253][kwann].
- [Bö] G. Böckle, *Appendix 1: On the isomorphism `R_∅ → T_∅`*, appendix to C. Khare, *On isomorphisms between deformation rings and Hecke rings*, Invent. Math. 154 (2003), 199–222; [author's file][bo].
- [Sa] D. Savitt, *On a conjecture of Conrad, Diamond, and Taylor*, Duke Math. J. 128 (2005), no. 1, 141–197; corrected version [arXiv:math/0404327v3][sa] (2010).
- [BM] C. Breuil and A. Mézard, *Multiplicités modulaires et représentations de `GL₂(ℤ_p)` et de `Gal(ℚ̄_p/ℚ_p)` en `ℓ = p`*, Duke Math. J. 115 (2002), 205–310; [authors' copy][bm].
- [DP] L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's Conjectures*, [arXiv:2108.07577v2][dp] (2022).
- [Ri] K. A. Ribet, *Images of semistable Galois representations*, [Pacific J. Math. 181 (1997), no. 3, 277–297][ri].
- [Na] J. Nagura, *On the interval containing at least one prime number*, Proc. Japan Acad. 28 (1952), 177–181; [version of record](https://www.jstage.jst.go.jp/article/pjab1945/28/4/28_4_177/_pdf).
- [RS] J. B. Rosser and L. Schoenfeld, *Approximate formulas for some functions of prime numbers*, [Illinois J. Math. 6 (1962), 64–94][rs].
- [BCDT] C. Breuil, B. Conrad, F. Diamond and R. Taylor, *On the modularity of elliptic curves over `ℚ`: wild 3-adic exercises*, J. Amer. Math. Soc. 14 (2001), 843–939; [authors' copy][bcdt].
- [Se87] J.-P. Serre, *Sur les représentations modulaires de degré 2 de `Gal(ℚ̄/ℚ)`*, [Duke Math. J. 54 (1987), 179–230][se].

Neighbouring Tau Ceti roadmaps: [Chebotarev][cheb], [ClassFieldTheory][cft], [ModularForms][mf].

[kh]: https://arxiv.org/abs/math/0504080v1
[kw1]: https://www.math.ucla.edu/~shekhar/papers/results.pdf
[kwann]: https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf
[bo]: https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf
[sa]: https://arxiv.org/abs/math/0404327v3
[bm]: https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf
[dp]: https://arxiv.org/abs/2108.07577v2
[ri]: https://msp.org/pjm/1997/181-3/pjm-v181-n3-p15-p.pdf
[rs]: https://doi.org/10.1215/ijm/1255631807
[bcdt]: https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/STW.pdf
[se]: https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf
[cheb]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev
[cft]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-13-norm-theorems-and-class-fields
[mf]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md#layer-4-eigenforms-newforms-primitive-forms-the-conductor
