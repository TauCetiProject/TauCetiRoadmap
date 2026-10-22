# Roadmap: perfectoid quotients and their prismatic prerequisites

**Summary.** This roadmap develops the integral algebra and explicit root
constructions used alongside universal perfectoid quotients: Fontaine-generator
calculations over rings with torsion, Witt-vector torsion bounds, torsion removal,
root closure, completed ring operations, characteristic-`p` radical formulas,
and almost faithfully flat root extensions over a perfectoid field. Its end
results include perfectoid completion of root closures, an ind-syntomic
refinement modulo `p` of André's cover, and functorial almost absolutely
integrally closed extensions. All use the single integral-perfectoid predicate
and universal quotient supplied by PerfectoidSpaces.

## Scope and ownership

Layer 0 owns the additional integral algebra and fixed-field model comparison.
Layer 1 owns the relative smooth-site cover, the modulo-`p` refinement of the
root cover, and the fixed-field almost constructions. Layer 2 owns explicit
radical and inverse-Frobenius calculations in characteristic `p`.

[PerfectoidSpaces](../PerfectoidSpaces/README.md)
is the sole owner of integral perfectoidness (P1.24), its root/Frobenius criteria
and the integral/Tate dictionary (P1.25). We use its `IsIntegralPerfectoid`;
BMS2's normalized description is a characterization of that same property,
not a second predicate. P4.15.1–P4.15.6 own the semiperfectoid derived-completion
interfaces, initial prisms and their perfectizations, the universal ring under
a semiperfectoid ring, the ordinary `p`-completely faithfully flat André cover,
reducedness, rooted principal quotients, complete-flat base change and
completed-colimit reductions, surjectivity of perfectoidization, and the
strongly Zariski closed application with its integral model and plus ring.
Those statements are prerequisites, not targets here. In particular, the
initial-prism formula and the analytic universal ring denote that supplier's
one perfectoidization; this roadmap introduces no additional functor or carrier.

The exact contracts below refer to
[PerfectoidSpaces P0–P5](../PerfectoidSpaces/README.md).
Its P0 supplies almost modules and their adjoints; the ordinary cotangent
complex is supplied by DerivedModuleAlgebra §§0.4, 0.8–0.11, 0.13 and 0.25,
with the contract also recorded in PerfectoidSpaces P0.19;
P2 supplies rational localization and approximation; P2.1–P2.2 supply the
tilting homeomorphism; P5 supplies completed colimits of perfectoid pairs.
The early targets in §0.0 own perfectoid Tor-independence, Fontaine
Tor-independent base change, and complete étale δ-extension with its
algebraization input. They use only the lower-tier contracts specified below.
The restricted universal-prism and affine Hodge–Tate theory needed for the
quotient construction already belongs to PerfectoidSpaces P4.15.2–P4.15.3.
DerivedDeRhamCohomology §PD.6, *Envelopes of regular immersions*, supplies
characteristic-`p` divided-power envelopes and their regular-sequence formulas
for the modulo-`p` refinement.

General perfectoidization of arbitrary animated rings, arc descent and
`J`-almost purity belong to `PerfectoidQuotientsPartIIIntegralPerfectoidization`.
General fibre-product and valuation methods, including the stronger ordinary
ind-syntomic André theorem of Česnavičius–Scholze Theorem 2.3.4, pp.24–25, belong to
`IntegralPerfectoidPartII`. Frobenius-controlled towers remain with
PerfectoidSpaces P7. None is an input here. In particular, Bhatt–Scholze
Proposition 8.5 cannot prove their Theorem 7.4: it already uses that theorem.

## Conventions

Fix a prime natural number `p`. All rings are commutative and unital, all ring
maps preserve the unit, and the zero ring is allowed. Families are small in a
fixed universe; universal properties are stated in compatible universes before
choosing representatives. A perfect ring of characteristic `p` means that the
`p`-power endomorphism is bijective. A monic polynomial whose root is asserted
always has positive degree. Absolute integral closedness below is this
monic-root property for possibly nondomain rings.

Ordinary `I`-adic completion is `lim_n R/I^n`, including separation. Derived
completion is the P4.15.1 functor in the derived or animated category. A chosen
pseudouniformizer `ϖ` determines a third, explicitly specified topology.
Comparisons between these completions carry their hypotheses; divisibility
`ϖ^p | p` alone does not identify the `ϖ`-adic and `p`-adic topologies. The
torsion-allowing normalization uses the canonical torsion-free/reduced
decomposition when necessary. For finite sharp ideals, reducedness and the
Stacks separation criterion enter the derived/ordinary comparison.

Write `R♭ = lim_F R/p` and `A_inf(R) = W(R♭)`. This inverse perfection is
Mathlib's [`PreTilt R p`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Perfection.lean).
The direct root-adjoining [`PerfectClosure R p`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/PerfectClosure.lean) is a
different construction. Sharp `x ↦ x♯` is multiplicative; Fontaine's
`θ : A_inf(R) → R` is a ring map. Subscript `ξ₁` means Witt coordinate one.
In a Teichmüller `p`-adic expansion its corresponding digit is `F⁻¹(ξ₁)`;
calculations must preserve this distinction. An orientation is a chosen
generator of a prism ideal. The integral predicate does not include a chosen
orientation.

Almost statements specify the root ideal
`m = (ϖ^(1/p^n) : n ≥ 0)` or, over a fixed field, the analogous ideal generated
by the roots of `t`. They are statements in `P0`'s almost module category.
Ordinary faithful flatness, `p`-complete faithful flatness and almost faithful
flatness modulo `t` are distinct conclusions. A Huber pair always retains its
explicit plus subring. Complete analytic objects are also Hausdorff, and their
universal properties use continuous maps of pairs where the plus ring matters.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The library baseline is Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following Mathlib interfaces are
used directly rather than reconstructed.

| Existing interface | Generality relevant here |
| --- | --- |
| [`IsAdicComplete`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/AdicCompletion/Basic.lean), `AdicCompletion` | Ordinary complete and separated modules and inverse-limit completions. For a finitely generated ideal its ordinary completion is complete; no unrestricted ideal-completeness assertion is used (Stacks 05GG). |
| `IsAdicComplete.subsingleton`, `IsAdicComplete.le_jacobson_bot` | Completeness at the unit ideal forces the zero ring; a complete ring's defining ideal lies in its Jacobson radical. |
| `PreTilt`, `PreTilt.coeff`, `PreTilt.untilt` | Inverse perfection of `R/p`, its coordinate maps and the multiplicative sharp map. The pinned ring instances use nonunit `p`. |
| [`WittVector.fontaineTheta`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Perfectoid/FontaineTheta.lean), `WittVector.mk_fontaineTheta`, `WittVector.fontaineTheta_teichmuller` | Fontaine's map for a `p`-complete ring with nonunit `p`, its reduction modulo `p` and its value on Teichmüller representatives. |
| `WittVector.surjective_fontaineTheta` | Surjectivity of Frobenius on `R/p` suffices for surjectivity of `θ`; principal kernel is additional mathematics. |
| `WittVector.ker_constantCoeff`, `WittVector.quotientPEquiv`, `WittVector.isAdicCompleteIdealSpanP` | For perfect characteristic-`p` rings, `W(k)/(p) ≃ k` and `W(k)` is `p`-adically complete. |
| `WittVector.eq_zero_of_p_mul_eq_zero`, `WittVector.mem_span_p_iff_coeff_zero_eq_zero`, `WittVector.mem_span_p_pow_iff_le_coeff_eq_zero` | `p` is a nonzerodivisor in `W(k)` for perfect `k`; divisibility by `p^n` is detected by the first `n` Witt coordinates. |
| `WittVector.map`, `Perfection.map`, `Perfection.lift` | Functorial Witt vectors and inverse perfection; the last map uses a perfect source and characteristic-`p` source and target. |
| `PerfectRing`, `frobeniusEquiv`, `PerfectRing.ofSurjective` | Bijective Frobenius and its inverse; reducedness plus surjectivity gives perfectness in prime characteristic. |
| `Ideal.Quotient.lift`, `Ideal.quotientMap`, `Ideal.isRadical_iff_quotient_reduced` | Quotient maps and their actual kernel conditions; radical ideals correspond to reduced quotients. |
| `Subring.closure`, `integralClosure`, `Localization.Away` | Actual subrings, ordinary integral closure and localization carriers for `p`-integral closure and torsion removal. |
| `AdicCompletion.map_surjective`, `AdicCompletion.of_surjective`, `AdicCompletion.map_of` | Completion preserves any surjective module map; a precomplete module surjects onto its completion; the maps commute with canonical completion units. There is no Noetherian or finite-generation hypothesis in the first assertion. |

The complete theory of δ-rings, prisms, animated rings, full cotangent complexes,
derived completion and perfectoid analytic spaces is supplied by the contracts below. A Witt Frobenius endomorphism or a two-term naive cotangent
complex cannot stand in for the finite length-reducing Frobenius or the full
cotangent complex used here. The existing truncated Witt carrier, truncation and infinite Frobenius are
inputs to CrystallineCohomology §CR.4.4's finite length-reducing Frobenius
and to the finite Fontaine maps constructed in §0.2. The length-two Witt-section argument for δ-extension
belongs to §0.0 and uses that same finite Witt carrier.

The compatible-root reduction is already Mathlib’s
`Perfection.quotientMulEquiv p (Ideal.span {(p : R)})`, with its coordinate
formula `Perfection.coeff_quotientMulEquiv` in
`Mathlib/RingTheory/Teichmuller.lean`. It requires completeness and
characteristic `p` of the quotient; perfectoidness is unnecessary. The new
normalized finite-quotient calculations use this equivalence.

Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` supplies:

- `WittVector.isAdicComplete_span_p_teichmuller` in
  `TauCeti/RingTheory/WittVector/Complete.lean`: if `R` is perfect of
  characteristic `p` and ordinarily `ϖ`-complete, `W(R)` is complete for
  `(p,[ϖ])`. `TauCeti.WittVector.completeSpace_and_t2Space_adicTopology_span_p_teichmuller`
  gives the complete Hausdorff topology.
- `WittVector.frobeniusEquiv_symm_teichmuller` and
  `TauCeti.WittVector.continuous_frobenius`, `continuous_frobeniusEquiv_symm`
  in `TauCeti/RingTheory/WittVector/Frobenius.lean`: inverse Frobenius on
  Teichmüller representatives and continuity for that same adic topology.
- `TauCeti.Huber.WittVector.isHuberRing_adicTopology_span_p_teichmuller` and
  `isTateRing_adicTopology_span_p_teichmuller_iff` in
  `TauCeti/RingTheory/Huber/WittVector.lean`: the Huber-ring adapter and,
  in characteristic `p`, the criterion that it is Tate precisely when `ϖ`
  is a unit.

These remain their existing interfaces; none defines integral perfectoidness or universal
perfectoidization. The perfectoid-field input and its topological `A_inf`
model retain `TauCetiRoadmap.AdicSpaces`, Layer 6.1, as owner.

### From PerfectoidSpaces: the common integral predicate

Use P1.24's choice-independent BMS1 Definition 3.5 predicate. There is an
admissible `ϖ` with `ϖ^p | p` and ordinary complete separated `ϖ`-adic topology,
Frobenius on `R/p` is surjective, and the kernel of the existing Fontaine map
is principal. A generator is not part of the structure. For nonzero `R`, the
adic presentation provides ordinary `p`-completeness and nonunit `p`, as needed
by the pinned Fontaine map; for zero `R` use its unique map. Thus products,
`p`-torsion and the zero ring are permitted.

The same property has the BMS2 Definition 4.18 description: ordinary
`p`-completeness, `π^p=pu` for some unit `u`, surjective Frobenius on `R/p`,
and principal Fontaine kernel, with the zero case understood separately.
This change of admissible element uses the normalization and completion
comparison; it does not assert that every `ϖ` with `ϖ^p | p` satisfies
`(ϖ^p)=(p)`. P1.24 supplies the BMS1 Lemma 3.10 criterion: under ordinary
`ϖ`-completeness, `ϖ^p | p` and surjectivity of that power map, principal kernel implies that
`R/ϖ → R/ϖ^p`, `x ↦ x^p`, is bijective; its converse requires regular `ϖ`.
Use the compatible-root unit replacements supplied there. PerfectoidSpaces
P1.24 also owns comparison with the
[Mathlib integral-perfectoid interface](https://github.com/leanprover-community/mathlib4/pull/26385)
when its specified topology is the complete separated adic topology for the
same admissible element. Adopt Mathlib's resulting vocabulary through that
single supplier. Sources: BMS1
Definition 3.5, Lemmas 3.9–3.10 and Remark 3.11, pp.21–23; BMS2 Definition
4.18, p.22; Česnavičius Definition 4.2 and Remarks 4.4–4.5, pp.7–8, for the
`p`-torsion-free normalized specialization.

P4.15.5 supplies reducedness of every integral perfectoid ring. Together with
P1.24's Frobenius clause and perfect characteristic-`p` examples, this gives
the characteristic-`p` dictionary used here: a ring killed by `p` is integral
perfectoid exactly when its `p`-power map is bijective, including the zero
ring. For characteristic exactly `p`, this is Mathlib's `PerfectRing R p`.
The representative Lean coefficient-ring statements use `CharP R p`,
which means exact characteristic and hence excludes zero for prime `p`;
quotients by the unit ideal are still included and receive no such instance.
Use the common predicate's ordinary-completeness and equivalence-transport
interfaces; they are not redeclared locally. Checks of that contract include
`0`, `F_p × F_p`, and exclusion of `F₂[T]` and the semiperfect nonreduced
`PerfectClosure(F₂[T],2)/(T)` (BMS1 Example 3.15, p.24).

For `p`-torsion-free integral perfectoid `A`, P1.20 and P1.25 supply the Tate
ring `A[1/p]` with the topology from `A`. Its powerbounded ring is the
almost-elements saturation of `A`, with quotient annihilated by every root
of a normalized `π`; `A` contains the topologically nilpotent elements.
Keep this actual powerbounded carrier and the complete integral/Tate
comparison (BMS1 Lemmas 3.20–3.21, pp.26–27; Česnavičius §4.8, pp.8–9).

### From PerfectoidSpaces: the single universal quotient

Use P4.15.6's `SemiperfectoidRing`: an ordinary derived `p`-complete ring `S`
with an actual surjection from an integral perfectoid ring. Derived
completeness means the derived/animated completion of P4.15.1; for a discrete
module it is equivalent to bijectivity of
`(a_n) ↦ (a_n-p a_(n+1))` on `∏_n S` (Stacks 091P(7)). It does not mean
ordinary completeness by definition. Ordinary complete separated modules are
derived complete (Stacks 091T); conversely separatedness, or the supplier's
bounded-torsion comparison where applicable, is retained when passing back
to ordinary completion. For `F_p` the difference operator is the identity;
for `Q` it has the nonzero kernel `(1,p⁻¹,p⁻²,…)`.

P4.15.2 constructs an initial prism `Δ_init(S)` under `S`. Its perfected
prism quotient is **the** `semiperfectoidPerfectoidization(S)`, with unit
`η_S : S → S_perfd`. P4.15.6 supplies
`semiperfectoidPerfectoidization_universal`: precomposition with `η_S` is a
bijection from maps `S_perfd → T` to maps `S → T` for every integral
perfectoid `T`. This specifies the object and all functor maps independently
of the chosen presentation. The perfect-prism construction and universal
property are compared inside P4.15.2, not by a new comparison target here.
P4.15.5 supplies `semiperfectoidPerfectoidization_surjective`, its
complete-flat base-change and completed-colimit reductions, and the formula
for the completed quotient by all entries of a compatible root tower.
P4.15.6 supplies the kernel as the intersection of kernels of maps to
integral perfectoid rings and `S_perfd ⊗_S T ≃ T` for perfectoid `S`-algebras.
Sources: Bhatt–Scholze Notation 7.1 and Proposition 7.2, p.55; Corollary 7.3,
Theorem 7.4 and Remark 7.5, p.56; proof of Theorem 7.4, p.62.

For an affinoid perfectoid pair `(R,R⁺)` and any ideal `I ⊆ R`, P4.15.6's
`completedIntegralQuotient` is the actual ordinary `ϖ`-completion
`A=(R⁺/(I∩R⁺))^∧_ϖ`. Its contract proves that `A` has a semiperfectoid
presentation in the derived sense above. No identification of derived and
ordinary completion is implicit in that notation. The universal analytic
quotient has `S=A_perfd[1/ϖ]` and the integral closure of the image of `R⁺`
as its minimal plus ring; `R → S` is surjective, `R⁺ → S⁺` is almost
surjective, and its spectrum maps homeomorphically to `V(I)`. This applies to
nonclosed and infinitely generated `I` (Bhatt–Scholze Remark 7.5, p.56;
Scholze ECD Theorem 5.8, p.25). The maps go from ambient rings to quotient
rings. Both `I=0` and `I=R` fix the direction: they give the original pair
and the empty spectrum, respectively.

### From PerfectoidSpaces: derived and prism interfaces

P4.15.1 consumes DerivedModuleAlgebra §§1.1–1.9 for derived completion,
completed tensor products and complete faithfully flat descent on their genuine
derived/animated carriers. It adds finite-ideal simplicial descent and transfinite
completion exchange on those same carriers. DerivedModuleAlgebra §§0.4,
0.8–0.11, 0.13 and 0.25 supply `Algebra.CotangentComplex`, its transitivity
triangle, Tor-independent base change, filtered colimits, regular-quotient
calculation and deformation theory, also consumed by PerfectoidSpaces P0.19. These
are not replacements by ordinary differentials or a two-term naive complex.
For cohomological grading, `[1]` moves a degree-zero module to degree `−1`.

P4.15.2 supplies free δ-algebras, distinguished elements, bounded prisms,
rigidity of their Cartier ideals, envelopes and completed perfection, and
the equivalence between perfect prisms and integral perfectoid rings.
P4.15.3 supplies affine prismatic cohomology for bounded prisms and
`p`-completely smooth algebras, its completed base-change comparison, and
Hodge–Tate comparison with completed forms and twists by the conormal line.
Its extension by simplicial resolutions has conjugate graded pieces
`(∧^i L)[−i]` and identifies a discrete QRSP Hodge–Tate object with the
initial prism. These are the precise carriers used in the relative cover.
Sources: Bhatt–Scholze Lemma 3.9 and Theorem 3.10, pp.31–32; Lemma 4.8,
pp.38–39; Theorems 6.3–6.4, pp.52–54; Construction 7.6, pp.56–58, and
Proposition 7.10, p.59.

P4.15.4 supplies the lifting theorem for a quasisyntomic algebra over the
reduction of a bounded prism, preserving complete flatness and faithful
flatness. If the base prism is perfect, these properties persist on completed
perfection. It also supplies André's `p`-completely faithfully flat integral
perfectoid cover on which every positive-degree monic polynomial has a root
(Bhatt–Scholze Proposition 7.11, p.60, and Theorem 7.14, pp.61–62).
The constant polynomial `1` is excluded. The relative smooth-site statement
and modulo-`p` ind-syntomic refinement below add conclusions to these inputs.

P4.15.1 is used only for generic derived completion, tensor and descent
operations. Neither perfectoid Tor-independence nor δ-extension or complete
étale algebraization is attributed to it: these are the local §0.0 targets.
For their characteristic-`p` algebra input, use
[EnhancedDerivedSheaves §E1.6](../EnhancedDerivedSheaves/README.md),
`perfectRing_tor_eq_zero`: for maps
`B ← A → C` of perfect `𝔽_p`-algebras, all positive `Tor_i^A(B,C)` vanish
(Bhatt–Scholze [BS17], Lemma 3.16, p.14). This contract concerns perfect
algebras, not arbitrary modules over a perfect ring.
For §1.2 use DerivedDeRhamCohomology §PD.6, *Envelopes of regular
immersions*: for an `𝔽_p`-algebra `A` and a regular sequence `f₁,…,f_r`,
the envelope is `A⟨x₁,…,x_r⟩/(x_i−f_i)`. For the principal-envelope tensor
and free-module formulas retain that each `f_i` is a nonzerodivisor on `A`;
the resulting basis over `A/(f₁^p,…,f_r^p)` consists of the products
`∏ γ_(j_i p)(f_i)`. DerivedDeRhamCohomology §4.2 supplies the conjugate graded map
with its Frobenius base change. These are the characteristic-`p` inputs to
Bhatt–Scholze Remark 7.15 and its proof, p.62.

### From SchemeAndStackFoundations: étale invariance and Frobenius

[SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §0.23a
supplies topological invariance of étale schemes under universal
homeomorphisms, in particular square-zero thickenings. Its §0.29 supplies
`SchemeFrobenius.relativeFrobenius_etale_isIso`. For an étale map `A → B`
of characteristic-`p` rings, its affine form is the isomorphism
`B ⊗_(A,F_A) A → B`, `b ⊗ a ↦ b^p a`. These inputs supply the
square-zero lifting and relative Frobenius steps in `delta_witt2_etale`
and `perfectPrism_completeEtale_lift`. Sources: Stacks Theorem 59.45.2,
tag `04DZ`, and Lemma 41.14.3, tag `0EBS`.

### From CrystallineCohomology: finite Witt operators

CrystallineCohomology §CR.4.4, *Finite-length Witt operators and their
identities*, supplies `Crystalline.truncatedFrobenius`, the ring map
`W_(r+1)(R) → W_r(R)` on Mathlib's `TruncatedWittVector p r R` for any
commutative ring `R`. Its `truncatedFrobenius_truncate` identifies it with
the quotient of infinite Witt Frobenius through truncation. This pins its
compatibility with restriction: writing `F_r:W_(r+1)→W_r` and
`res_r:W_(r+1)→W_r`, require
`res_r ∘ F_(r+1) = F_r ∘ res_(r+1)` and
`F_r ∘ trunc_(r+1) = trunc_r ∘ F` from infinite Witt vectors. Its
length-two coordinate formula is `F(x₀,x₁)=x₀^p+p x₁`, without a
characteristic-`p` hypothesis. The map is
neither coordinatewise Frobenius nor restriction. Use this operator directly
in the finite Fontaine identities and Frobenius-surjectivity equivalences;
no second finite Witt Frobenius is introduced. Sources: BMS1 Lemma 3.2,
pp.19–20; Davis–Kedlaya §1, pp.1–3.

**Checks.**

- `finiteWittZeroLength` — `F:W₁(ℤ)→W₀(ℤ)` has value zero.
- `finiteWittDirection` — At `p=2`, `(1,1) ∈ W₂(ℤ)` maps to
  `1²+2·1=3`, whereas restriction gives `1`.
- `finiteWittCharacteristicTwo` — Over `F₂`, `F(0,1)=0`: the second
  coordinate contributes in mixed characteristic but vanishes here.

### From EnhancedDerivedSheaves: Frobenius-root ideals

EnhancedDerivedSheaves §E1.6, *Frobenius-root ideals*, owns
`frobeniusRootIdeal`, `frobeniusRootIdeal_radical` and
`frobeniusRootIdeal_root_mem`. For a perfect `𝔽_p`-algebra `R` and `f ∈ R`,
the ideal generated by `((frobeniusEquiv R p).symm^[n]) f`, `n ≥ 0`,
is `√(f)`. Its union-of-principal-ideals description, idempotence, flatness
and sequential-colimit model also belong to that supplier. The explicit
quotient comparisons below use this same ideal. Source: BS17, proof of
Lemma 3.16, p.14. The roots' powers prove containment in the radical;
perfectness gives the reverse containment by expressing a sufficiently large
`p`-power of any element of `√(f)` as a multiple of `f` and applying inverse
Frobenius.

**Checks.** The root ideal of zero is zero; that of one is the unit ideal;
in `F₂[T^(1/2^∞)]`, it contains `T^(1/2)` although `(T)` does not. These
cases distinguish the radical from the original principal ideal.

## How to read the build

Layer 0 first states its Tor and complete étale δ-extension targets, then
proceeds from units and naturality through Fontaine generators and Witt torsion
to torsion removal, root closure and completed operations. The Fontaine-square
proof uses the generator calculation of §0.2 before the cotangent application.
Layer 1 adds the relative cover and the modulo-`p` refinement, then develops
the fixed-field almost route. Layer 2 computes characteristic-`p` quotients
by radicals and their inverse-Frobenius root ideals. Each uses the common
supplier contracts above and states its extra conclusion explicitly.

[Suggested.lean](Suggested.lean) states the bound-one Witt quotient torsion
theorem of §0.3 as `Witt.witt_principal_quotient_p_torsion` in the namespace
`TauCetiRoadmap.PerfectoidQuotients`. The other headline results need the
supplier's integral-perfectoid predicate, universal perfectoidization, prisms,
derived or almost carriers, or the finite Witt operators and Fontaine maps;
these objects are absent at the pins. Their statements remain full README
targets, and the module docstring identifies the missing objects.
Elaboration with `sorry` checks types and does not supply mathematical proofs.

## Layer 0: integral perfectoid algebra

### 0.0 Tor independence and complete étale δ-extension

These are this roadmap's early theorem targets. The integral predicate, basic
δ-rings and perfect-prism equivalence retain their PerfectoidSpaces owners;
no second carrier is introduced. Derived tensor and completion use P4.15.1,
and the characteristic-`p` Tor input is the E1 contract above.

**Perfectoid Tor independence** (`perfectoid_tor_independence`). For any maps
`S ← R → T` of integral perfectoid rings, the derived `p`-completed pushout
`(S ⊗^L_R T)^∧_p` is discrete and its degree-zero ring is integral perfectoid.
This is a statement about the completed derived tensor, with no flatness,
finite-presentation or torsion-freeness hypothesis on the maps. With its canonical
maps the degree-zero ring is the pushout in integral perfectoid rings: the
mapping property follows from derived tensor and completion against derived
p-complete targets. The ordinary completed tensor comparison is recorded in §0.6. Do not assert that an arbitrary
uncompleted derived tensor is discrete.

*Proof route.* If `S` or `T` is zero, the completed derived pushout is zero.
Assume both are nonzero. Transport the diagram through P4.15.2's equivalence to perfect
prisms `(B,IB) ← (A,I) → (C,IC)`. Form the derived `(p,I)`-completed tensor
`D = (B ⊗^L_A C)^∧_(p,I)`. The reductions `A/p`, `B/p` and `C/p` are nonzero:
if `p` were a unit in any prism ring, its `(p,I)`-completeness would force
that ring and its perfectoid quotient to be zero. Thus these perfect
reductions have exact characteristic `p`, as E1's `CharP _ p` hypotheses require.
Reduction modulo `p`, E1's Tor-independence of
perfect `𝔽_p`-algebras and the supplied completion comparisons show that D is
discrete with invertible Frobenius. A distinguished generator of I stays
distinguished in D, so P4.15.2's regularity criterion makes `ID` Cartier.
Together with completeness and the inherited prism identity, this makes
`(D,ID)` a perfect prism. Its derived quotient is the ordinary quotient
`D/ID`. Associativity
of derived base change and completion identifies this quotient with
`(S ⊗^L_R T)^∧_p`. P4.15.2 then gives integral perfectoidness. This proof uses
neither almost purity nor general animated perfectoidization.
Source: BS, the general pushout argument in the proof of Lemma 10.3,
pp.78–79; its input is BS17 Lemma 3.16, p.14, owned by E1.

**Checks.**

- `perfectoidTensorIdentity` — For `S=R`, the comparison is the identity
  `T^∧_p ≃ T`, including perfectoid rings with `p`-torsion.
- `perfectoidTensorZero` — If either factor is the zero ring, the completed
  derived pushout is zero. The theorem must allow this integral perfectoid ring.
- `perfectoidTensorCharP` — For `R=𝔽_p`,
  `S=𝔽_p[X^(1/p^∞)]` and `T=𝔽_p[Y^(1/p^∞)]`, the answer is
  `𝔽_p[X^(1/p^∞),Y^(1/p^∞)]` in degree zero. In characteristic `p`,
  derived `p`-completion is the identity on these rings.
- `perfectoidTensorHypothesis` — If the base is instead `𝔽_p[X]` and both
  factors are `𝔽_p` via `X↦0`, the resolution with differential multiplication
  by X becomes a zero differential after tensoring. Its `H^(−1)=𝔽_p` survives
  `p`-completion. Thus even perfect factors do not permit an arbitrary base.

**Fontaine base change** (`fontaine_tor_independence`). For any map `R → S`
of integral perfectoid rings, the natural map
`R ⊗^L_(A_inf(R)) A_inf(S) → S` is an equivalence, using the natural Witt
map and the ordinary quotient maps `θ_R` and `θ_S`. Equivalently, the Fontaine square
is a derived pushout; all its positive Tor groups vanish. This is a distinct
statement from the completed tensor theorem.

*Proof route.* Handle zero source or target separately. Otherwise use §0.2's generator ξ of `ker θ_R`. Its image generates
`ker θ_S` and is a nonzerodivisor there. The two-term free resolution
`[A_inf(R) →ξ A_inf(R)]` remains a resolution after base change; its cokernel
is S. Hence no completion or assumed flatness of `A_inf(R) → A_inf(S)` is
needed. This gives precisely the base-change premise of §0.3's cotangent
argument. Source: BMS1 Lemma 3.13, p.24, at length one, with the θ variant
explicitly included in its proof; Lemma 3.14, p.24, is the application.

**Checks.**

- `fontaineSquareIdentity` — For `R=S`, this is tensoring a quotient resolution
  with its original base, giving R in degree zero.
- `fontaineSquareCharP` — For a map of perfect `𝔽_p`-algebras `k → l`, the
  resolution is multiplication by p on `W(k)`; after base change to `W(l)`,
  p remains a nonzerodivisor and the quotient is l.
- `fontaineSquareProduct` — For `R=k×l → S=k`, with perfect characteristic-`p`
  factors, Witt vectors split as a product and ξ=p projects to p. The assertion
  covers this noninjective map, as well as a zero target.

**Complete étale δ-extension** (`delta_etale_extension`). Let A be a δ-ring
and `I ⊂ A` a finitely generated ideal containing p. Let B be an ordinary
A-algebra that is derived I-complete and I-completely étale: the derived
reduction `B ⊗^L_A A/I` is discrete and étale over `A/I`. There is a unique
δ-structure on B making `A → B` a δ-map. Uniqueness is for the actual
p-derivation, including on rings with p-torsion; a lift of Frobenius alone
does not specify such a structure. The result is natural in complete étale
maps. Basic δ-identities and the δ-ring carrier come from P4.15.2.

The following supporting statements belong to this target, rather than being
unspecified completion interfaces.

- `completeEtale_algebraization`: under the displayed hypotheses on B, there
  is an étale A-algebra B′ with `(B′)^∧_I ≃ B`, using derived completion.
  Lift the finitely presented étale algebra `B ⊗^L_A A/I` to an étale
  A-algebra by lifting a standard smooth presentation and inverting its
  Jacobian determinant (Stacks, Lemma 10.143.10, tag `04D1`). Formal étaleness
  identifies the compatible lifts on the derived nilpotent reduction tower;
  derived completeness then identifies the derived completions. Use P4.15.1's
  derived tower and derived Nakayama, without replacing derived completion by
  the ordinary inverse limit over `A/I^n` for unbounded torsion. B′ need not be
  unique, and this is not an algebraization assertion for arbitrary complete
  smooth or finite algebras.
- `delta_witt2_etale`: for any étale map `A → B′`, `W₂(A) → W₂(B′)` is étale.
  The length-two ghost map `(x₀,x₁) ↦ (x₀,x₀^p+p x₁)` has image
  `A ×_(A/p) A`, with Frobenius on the first map to `A/p`, and kernel
  `V(A[p])` of square zero. Étale gluing for this fibre product, invariance
  under square-zero thickenings and the relative Frobenius isomorphism for an
  étale characteristic-`p` map prove the assertion: after lifting the étale
  ghost-image algebra across the square-zero kernel, flatness and relative
  Frobenius identify its kernel with `V(B′[p])`, so the lift is `W₂(B′)`.
  This is the length-two
  case of Borger, Proposition 8.1, pp.35–36, Theorem 8.3 and Remark 8.4,
  pp.37–38, and Theorem 9.2, pp.38–40 (his `W₁` has two coordinates).
  This argument does not declare the whole Verschiebung ideal square zero.

*Proof route.* Express a δ-structure as a section `w_A : A → W₂(A)` of
zeroth coordinate, `a ↦ (a,δ(a))`. Choose B′ by `completeEtale_algebraization`
and apply `delta_witt2_etale`. The exact sequence of A-modules
`0 → φ_*B′ → W₂(B′) → B′ → 0`, using `w_A` for the A-action, compares
its derived I-completion with `W₂(B)`. The ideals `I` and `φ(I)` have the
same radical because `p ∈ I` and `φ(a) ≡ a^p mod p`; thus their derived
completion functors agree. Zeroth coordinate `W₂(B) → B` is a
pro-infinitesimal thickening in this complete setting. Formal étaleness gives
the unique compatible lift `B′ → W₂(B)` of `B′ → B`; completeness extends
it uniquely to a section `B → W₂(B)`. This proves existence and uniqueness
without dividing by p. Continuity uses `δ(I^(2^(n+1))) ⊂ I^(2^n)`; include
the resulting unique extension to classical I-adic completion as well.
Sources: BS Lemmas 2.17–2.18, pp.17–18, including the derived-completion
argument and its stated algebraization input.

Include `delta_derivedCompletion`: let I be a finitely generated ideal in a
δ-ring A containing a power of p. If the derived I-completion B of A is
discrete, there is a unique δ-structure on B for which `A → B` is a δ-map.
The ideals I and `(I,p)` have the same radical. Apply `delta_etale_extension`
at `(I,p)` to this completion map: its derived reduction is the identity of
`A/(I,p)`, hence is étale. This is the discrete-completion consequence of
BS Lemma 2.18, p.17; the classical completion statement above is separate.

**Perfect-prism application** (`perfectPrism_completeEtale_lift`). For a
perfect prism `(A,J)` and a derived p-complete, p-completely étale
`A/J`-algebra S, there is a unique `(p,J)`-complete étale lift B over A,
up to unique isomorphism with its specified reduction. It has the unique
compatible δ-structure, is perfect, and `(B,JB)` is a perfect prism with
`B/JB ≃ S`. In particular S is integral perfectoid. Construct the complete
étale lift by the preceding algebraization and nilpotent lifting argument,
apply `delta_etale_extension` at `(p,J)`, and use the relative Frobenius
isomorphism modulo p and completeness to prove perfectness. The prism ideal
remains Cartier by complete flatness. Sources: ALB Proposition 2.1.8,
Remark 2.1.9 and Corollary 2.1.10, pp.13–14; Remark 2.1.9 permits the θ
convention used here. This application supplies §0.6, without adding a
complete étale theorem to P4.15.1.

**Checks.**

- `deltaEtaleIdentity` — For `B=A` with A derived I-complete, the only
  extension is the given δ. On `A=ℤ₂`, `φ=id` forces `δ(2)=−1`.
- `deltaEtaleProduct` — For derived I-complete A and `B=A×A`, δ is coordinatewise and is preserved by
  the projections. For a perfect prism the lifted prism is the product prism;
  this checks naturality and the ideal extension, not just existence.
- `deltaCompletion` — Completing `ℤ_(p)` along `(p²)` or `(p)` gives
  `ℤ_p` with `φ=id` and the same δ. This checks the power-of-p hypothesis
  in the derived-completion corollary, without requiring `p ∈ (p²)`.
- `deltaEtaleLocalization` — Take `A=ℤ_p[X]`, `φ(X)=X^p`, `I=(p)` and
  `B=(A[1/X])^∧_p`. Its extension has `φ(X^(-1))=X^(-p)` and
  `δ(X^(-1))=0`. This checks that B′ is étale but need not be finite.
- `deltaEtaleHypothesis` — On `ℤ₂⟨X⟩`, the two continuous lifts
  `φ₀(X)=X²` and `φ₁(X)=X²+2` give different δ-structures over `ℤ₂`,
  with `δ₀(X)=0` and `δ₁(X)=1`. Their reductions agree modulo 2; this
  algebra is completely smooth, not completely étale, so uniqueness fails.
- `deltaWittKernel` — Over `ℤ`, `V(1)²` has coordinate one p, so the full
  Verschiebung ideal is not square zero. Over `𝔽₂`, `W₂(𝔽₂)` has a
  nonzero element 2 with square zero; replacing it by the product of ghost
  coordinates would give the wrong ring.

### 0.1 Integral rings, units and characteristic p

Throughout this layer integral perfectoidness means the common P1.24
predicate. The following elementary statements also apply outside the
Tate-plus setting of P1.16–P1.18: they quantify over arbitrary characteristic-`p`
rings, their inverse perfections, and arbitrary perfect coefficient rings.

Three algebraic lemmas support the characteristic-`p` comparison. For any
characteristic-`p` ring `k`, an inverse-perfection element is a unit exactly
when its zeroth coordinate is a unit (`perfection_isUnit_iff`); surjectivity of
Frobenius on `k` is unnecessary. For perfect characteristic-`p` `k`, a Witt
vector is a unit exactly when its constant coordinate is a unit
(`witt_isUnit_iff`). This statement is for perfect rings, including products,
rather than only perfect fields. For arbitrary characteristic-`p` `k`, prove

```text
(xy)₁ = x₀^p y₁ + x₁ y₀^p.
```

This is `witt_mul_coeff_one` and needs no perfectness assumption. Use the
existing Witt multiplication polynomials; `p` vanishes in `k`, while it need
not vanish in `W(k)`. Unit detection follows by lifting inverses modulo the
complete defining ideal and using its Jacobson property. In inverse perfection
the inverses of the coordinates themselves form a compatible root tower.

For a complete nonzero ring of characteristic exactly `p`, principal `ker θ`
already implies `ker θ = (p)` (`theta_kernel_charP`). Indeed `p` is in the
kernel. Writing `p = ξa`, the first two Witt coordinates and the unit criteria
show that `a` is a unit. The resulting factorization through the existing
isomorphism `W(R♭)/(p) ≃ R♭` proves injectivity of the zeroth tilt projection
(`tilt_projection_injective_charP`). Neither lemma assumes Frobenius
surjective on `R/p` in addition to its stated principal-kernel premise.
The characteristic-`p` dictionary is the supplier contract above;
these intermediate unit, coordinate and projection statements expose the
algebra in its proof without defining a new predicate.

Sources: BMS1 Lemma 3.10 and its proof, pp.22–23, and Example 3.15, p.24.
Prerequisites are inverse perfection, Witt completion,
`WittVector.ker_constantCoeff`, `WittVector.quotientPEquiv` and the baseline
Fontaine map. The two projection statements do not require Frobenius
surjective on the original ring.

**Checks.**

- `wittTwoCoordinates` — At `p=2`, the first two Witt coordinates of `2` in
  `W(F₂)` are `(0,1)`, while coordinate one of `4` is zero. For `x=y=2`,
  the product formula gives `0²·1+1·0²=0`.
- `wittDigitConvention` — In `W(PerfectClosure(F₂[T],2))`, coordinate one of
  `2[T]` is `T²`, while its first Teichmüller digit is `T`. In particular,
  a coordinate-one unit criterion cannot be implemented using the unmodified
  Teichmüller digit formula.

### 0.2 Naturality, finite Witt maps and Fontaine generators

For `p`-complete rings `R,S` with nonunit `p`, a unital map `f : R → S` induces
a quotient map `g : R/p → S/p`. Require explicitly that `g` commutes with the
two quotient maps. Then the induced inverse-perfection and Witt maps satisfy

```text
f(x♯) = (g♭x)♯,
f(θ_R(w)) = θ_S(W(g♭)(w)).
```

The names are `untilt_natural` and `theta_natural`. Prove the first formula
using the sharp congruence modulo `p^(n+1)` for each coordinate and completeness
of the target. For the second, compare maps into `S/p^(n+1)`, where `p` is
nilpotent, using equality on Teichmüller representatives; separation then
identifies the maps into `S`. The pinned theorem
`WittVector.eq_of_apply_teichmuller_eq` is applied only to these nilpotent
quotient targets. The result applies to arbitrary `p`-complete rings with nonunit
`p` on Mathlib's `PreTilt`. PerfectoidSpaces P1.7's `uniformTilt.map`, with
`sharp (map g x) = g (sharp x)`, and `uniformTilt.theta_natural` concern
complete uniform Tate rings and their plus rings; the two `theta_natural`
names live in different namespaces.

For a `p`-complete ring `R` with nonunit `p`, construct
`finiteFontaineTheta p R r : A_inf(R) → W_r(R)` by the inverse-limit
identification in BMS1 Lemma 3.2. In its notation, `θ_r=θ̃_r φ^r`, rather
than `θ̃_r`. Prove `finiteFontaineTheta_teichmuller`, with
`θ_r([a])=[a♯]`; `finiteFontaineTheta_restrict`, with restriction of
`θ_(r+1)` equal to `θ_r`; `finiteFontaineTheta_frobenius`, with
`F θ_(r+1)=θ_r φ`; and `finiteFontaineTheta_one`, identifying its
length-one coordinate with the existing `WittVector.fontaineTheta`.
At length zero the target is the zero ring. The zero source has the unique
maps separately. The broader `ϖ`-complete input below is `p`-complete because
`ϖ` divides `p`, via the completion supplier; this construction uses
the normalized `p`-complete instance (BMS1 Lemmas 3.2–3.4, pp.19–21).

**Checks.**

- `finiteThetaZeroLength` — `θ₀` takes every input to zero.
- `finiteThetaOneLength` — Coordinate zero of `θ₁(2)` over `F₂` is zero.
- `finiteThetaTwoLength` — Coordinate one of `θ₂(2)` over `F₂` is one;
  the two coordinates are `(0,1)`, using the Witt ring structure.
- `finiteThetaSharpConvention` — For `a♯=T` in
  `PerfectClosure(F₂[T],2)`, `θ₂([a])` has coordinates `(T,0)`, rather
  than the coordinates of the inverse-limit projection `θ̃₂([a])`.
- `thetaSign` — At `p=2` in a characteristic-zero complete ring with a
  root sequence `a` satisfying `a♯=2`,
  `θ([a]−2)=0` and `θ([a]+2)=4≠0`. The generator normal form
  `2+[π♭]²x` therefore uses `x=−1` when `(π♭)²=a`. A unit change of
  orientation preserves its generated ideal, rather than this chosen sign.

The broader BMS1 setting begins with `R` ordinarily `ϖ`-complete and separated
and `ϖ^p | p`. Establish the following Frobenius-surjectivity equivalences
(`frobenius_surjectivity_equivalences`):

- every element of `R/(pϖ)` is a `p`th power;
- Frobenius on `R/p` is surjective;
- every element of `R/ϖ^p` is a `p`th power;
- the finite length-reducing maps `F : W_(r+1)(R) → W_r(R)` are surjective for
  every `r ≥ 1`;
- each `θ_r : A_inf(R) → W_r(R)` is surjective for `r ≥ 1`.

Under these equivalent conditions, unit multiples of `ϖ` and of `p` admit
compatible `p`-power roots. The finite Frobenius implication uses the
Davis–Kedlaya criterion with this topology; the infinite Witt Frobenius is a
different map. The predicate normalization and two-direction principal-kernel criterion
are the P1.24 supplier contract. Here the finite-map equivalences are the
additional all-length statements. They neither introduce another predicate
nor repeat the supplied admissible-element criterion.

For nonzero integral perfectoid `R` and `ξ ∈ ker θ`, beyond the Tate-plus scope of P1.18, prove
`theta_generator_iff_unit_coeff_one`: `ξ` generates the kernel exactly when
`ξ₁` is a unit in `R♭`. Every such generator is a nonzerodivisor
(`theta_generator_nonzerodivisor`). Prove `theta_generator_normal_form`: choose
a normalized `π` with `π^p=pu`, where `u` is a unit. After replacing `π`
by a suitable unit multiple with compatible roots, one obtains
a generator `p + [π♭]^p x` with `x` a unit. Prove
`theta_map_preserves_generator`: for a unital map of nonzero integral perfectoid
rings, the Witt map induced on tilts sends any generator of `ker θ_R` to a
generator of `ker θ_S`. Naturality and preservation of units prove the claim.

Sources: BMS1 Definition 3.1, Lemmas 3.2 and 3.4, pp.19–21, for the sharp and
Fontaine constructions; BMS2 Definition 4.18, p.22, for the normalized convention; BMS1
Definition 3.5, Remark 3.8 and Lemma 3.9, pp.21–22, for normalization and
Frobenius equivalences; Davis–Kedlaya Theorem 3.2, implication `(xiv)′⇒(ii)`,
§3 pp.6–11, for finite Witt surjectivity; Česnavičius Definition 4.2 and
Remarks 4.4–4.5, pp.7–8, for the torsion-free convention; BMS1 Lemma 3.10,
pp.22–23, and Remark 3.11, p.23, for the kernel criterion and generators.
Prerequisites for naturality are the baseline sharp congruence,
`Perfection.map`, `WittVector.map`, Teichmüller evaluation and adic separation.
The common normalization is imported; its use keeps the supplier
completion hypotheses. The finite-map equivalences use the preceding unit criteria. The kernel and generator statements use Witt completeness, the
Frobenius equivalences, the supplied finite Frobenius and the finite Fontaine
maps just constructed, with their actual truncated-Witt carriers.

### 0.3 Elementary Witt torsion and cotangent consequences

Let `k` be a perfect ring of characteristic `p`, and let `ξ ∈ W(k)` have unit
Witt coordinate `ξ₁`. The following three lemmas retain this generality,
including zero divisors and products in `k`.

1. `Witt.witt_p_sq_dvd_mul_detects_p`: if `p² | ξg`, then `p | g`.
2. `Witt.witt_principal_p_saturation`: if `p²f ∈ (ξ)`, then
   `pf ∈ (ξ)`.
3. `Witt.witt_principal_quotient_p_torsion`: in `W(k)/(ξ)`,
   `p^n x=0` implies `px=0` for every natural `n`.

The bound-one assertion is stated in Suggested.lean as
`Witt.witt_principal_quotient_p_torsion`.

For the first lemma compare the initial Teichmüller digits, with digit one
`F⁻¹(ξ₁)`, and use reducedness of perfect `k`. For the second, express the
ideal membership as `p²f=ξg`, divide `g` by `p` using the first lemma, and
cancel `p` in the Witt ring. This cancellation is available even though `ξ`
was not assumed a nonzerodivisor and `k` was not assumed a domain. Induction
gives the third assertion. The unit-coordinate hypothesis is sufficient; the
lemmas do not assert an equivalence for all principal ideals.

**Checks.**

- `witt_torsion_prime_detection` — For `ξ=p`, the condition is
  `p² ∣ pg ↔ p ∣ g`, and `ξ₁=1`.

- `witt_torsion_quotient_by_prime` — `W(k)/(p)` is killed by `p` for
  any perfect characteristic-`p` ring `k`, including a product of fields.

- `witt_torsion_hypothesis_required` — In `W(F₂)/(4)`, the class of one
  is killed by `4` and survives multiplication by `2`. The generator `4`
  has Witt coordinate one zero, so it fails the theorem's hypothesis.

Apply these lemmas to a distinguished Fontaine generator to prove
`perfectoid_p_torsion_killed_by_p`: every integral perfectoid ring has
`R[p^∞]=R[p]`. Thus its `p`-primary torsion has bound one. The ordinary and
derived `p`-completeness comparison follows through P4.15.1; it is a separate
application of the torsion bound. This is the elementary Witt-vector proof of the bound-one assertion;
the supplier's prismatic construction is an independent prerequisite.

For any map `R → S` of integral perfectoid rings, the full relative cotangent
complex satisfies `L_(S/R) ⊗^L_ℤ F_p = 0`; its derived `p`-completion is
therefore zero (`perfectoid_cotangent_mod_p_vanishes`). Use the Tor-independent
Fontaine square and base change of the full cotangent complex. Vanishing of
ordinary Kähler differentials alone is insufficient. For a single integral
perfectoid ring, prove `perfectoid_absolute_cotangent`: transitivity through `A_inf(R)` and the regular kernel of
`θ` identify the completed absolute cotangent complex over `ℤ_p` with
`(ker θ/(ker θ)²)[1]`. Choosing a generator gives `R[1]`, with cohomology in
degree `−1`. In cohomological notation `K[1]^i=K^(i+1)`.
The free rank-one identification depends on that choice; the
unoriented cotangent object remains canonical.

Sources: BMS2 Proposition 4.19(3), statement p.22 and elementary proof p.23
in the v2 preprint, published p.227, for the three Witt calculations and the
torsion bound; BMS1 Lemmas 3.13–3.14, p.24, for Tor independence and relative
cotangent vanishing; BMS2 Proposition 4.19(2), pp.22–23, for the absolute
cotangent calculation. Prerequisites for the Witt lemmas are the baseline
Teichmüller expansion, Witt coordinate divisibility, injectivity of Frobenius
and cancellation of `p` in `W(k)`. The perfectoid application uses the kernel
generator criterion. Cotangent statements additionally use the local
`fontaine_tor_independence` of §0.0, DerivedModuleAlgebra §§0.8, 0.10
and 0.13, and PerfectoidSpaces P4.15.1. The full derived complex and the shift convention are essential to both assertions.

**Checks.**

- `cotangentShift` — For the complex `ℤ` concentrated in degree zero,
  its shift `[1]` has `ℤ` in degree `−1` and zero in degree zero. These
  two terms fix the sign of the completed absolute cotangent convention;
  the full cotangent identification uses DerivedModuleAlgebra §0.4's carrier.

### 0.4 Torsion removal and compatible roots

Use the supplied reducedness theorem. For an element `a` with a compatible tower of `p`-power roots,
all the annihilators agree:

```text
Ann(a^(1/p^n)) = Ann(a) = R[a^∞].
```

These annihilator identities (`compatible_root_annihilator` and
`compatible_root_power_torsion`) hold in any reduced ring with the indicated
root tower; the perfectoid application uses the supplied reducedness theorem. They are the reason that maps
to perfectoid rings killing an element also kill all its specified roots.

Let `R` be integral perfectoid and ordinarily `ϖ`-complete, with `ϖ^p | p`. Then
`R_tf = R/R[ϖ^∞]` is `ϖ`-torsion-free and integral perfectoid
(`perfectoid_torsion_free_quotient`). With a compatible-root unit replacement
of `ϖ`, its tilt is `R♭/R♭[(ϖ♭)^∞]`. The decomposition is

```text
R ≃ R_tf ×_((R_tf/ϖ)_red) (R/ϖ)_red.
```

Both special fibres in this formula are reduced. The ideal generated by all
compatible roots of `ϖ` has quotient `(R/ϖ)_red`, a perfect `F_p`-algebra.
The tilt, fibre-product and completeness comparisons are part of this target
on the supplied integral-perfectoid carrier.
The construction uses the actual localization kernel
`ker(R → R[1/ϖ])` for power torsion and transports the quotient topology and
completion. It is a specific decomposition theorem; generic fibre-product
preservation results retain their `IntegralPerfectoidPartII` owner.

For `p`-torsion-free integral perfectoid `R`, choose `π` with `(π^p)=(p)`.
Construct `π_n` for `n ≥ 1` with `π₁` a unit multiple of `π`,
`π_(n+1)^p=π_n`, and `(π_n^(p^n))=(p)`. The ideal `(π_n)` is the inverse
image of `ker(F^n : R/p → R/p)`. The power map identifies
`R/π_n ≃ R/p`. Include the expansion `x^p + p y^p` for every class modulo
`p²`, and surjectivity of the `p`-power map modulo `pπ`. These finite-quotient statements form
`perfectoid_compatible_roots_iterated_frobenius`; they add normalized roots
and quotient calculations to the existing multiplicative comparison.

Sources: Česnavičius–Scholze §§2.1.2–2.1.3, pp.10–12, including equations
(2.1.3.1)–(2.1.3.2), for reducedness, annihilators and the decomposition;
Česnavičius Remark 4.3 and Remarks 4.4–4.5, p.8, for reducedness and the
normalized root calculations. Prerequisites are the integral predicate,
Fontaine generators, inverse perfection, ordinary quotient/localization APIs
and the normalization/completion transport. The finite
Frobenius calculations use the finite Witt maps of §0.2.

### 0.5 p-integral closure and perfectoid completion

For a subring `A ⊆ B`, define `pIntegralClosure p B A` to be the smallest
intermediate subring closed under `p`th roots inside the fixed ambient ring
`B`. Equivalently, start from `A`, adjoin all ambient `p`th roots, take the
generated subring and repeat; the union of these stages is root closed.
The definition may use the infimum of the root-closed subrings containing `A`.
The ambient ring is essential: this construction does not adjoin roots in a
new algebra. Its infimum definition works for any natural exponent; the source
application fixes a prime. The integral-closure containment needs only a
positive exponent, since each root then satisfies a monic polynomial; the
prime hypothesis suffices. Exponent `0` makes the closure the whole ring.
For positive exponents the root closure need not equal ordinary integral closure.

Develop the source inclusion, closure under ambient `p`th roots, and
minimality among root-closed intermediate subrings. Prove idempotence,
monotonicity in the source subring, and containment in the ordinary integral
closure for positive exponents.

**Checks.**

- `pClosureIdentity` — A p-integrally closed subring is its own p-integral closure.
- `pClosureZero` — In the zero ambient ring the closure is the unique subring.
- `pClosureExponentZero` — At exponent `0`, every ambient element has power
  `b^0=1` in every subring, so `pIntegralClosure 0 B A = ⊤` for every `A ⊆ B`.
- `polynomialAmbient` — The subring generated by `T¹` in `F₂[T]` is all of `F₂[T]`.
- `pClosureRoot` — In `F₂[T]`, the 2-integral closure of `F₂[T²]` is all of `F₂[T]`.
- `pClosureNotOrdinary` — In `F₂[T]`, `F₂[T³]` is 2-integrally closed, while its ordinary
  integral closure in `F₂[T]` is all of `F₂[T]`; `F₂[T³]` is proper.

The local map `quotientPowerMap` is the canonical ring homomorphism
`A/(ϖ) → A/(ϖ^p)` taking a representative `x` to `x^p`.
Its API is `quotientPowerMap_mk`, the representative formula, and
`quotientPowerMap_natural`: if `f : A → B` sends `ϖ` to `τ` with the same
divisibility hypotheses, its quotient maps commute with the two power maps.
Use the baseline quotient extensionality to characterize these maps.
The construction uses the explicit witness
`ϖ^p a=p`; this makes the target characteristic dividing `p` and the
representative formula independent of the choice of lift.

**Checks.**

- `quotientPowerUnit` — At `p=2`, `A=ℤ` and `ϖ=1`, both quotients are
  zero and the map is bijective.
- `quotientPowerZero` — At `p=2`, `A=F₄` and `ϖ=0`, both quotients are
  `F₄` and the map is Frobenius: for `ω²+ω+1=0`, it sends
  `ω ↦ ω² = ω+1 ≠ ω`. A `p²`-power map would be the identity here.
- `quotientPowerDirection` — At `p=2`, `A=F₂[T]` and `ϖ=T`, the source
  is modulo `T` and the target modulo `T²`. The map is injective with
  image the constants, while the nonzero class `[T]` has no preimage.
  In the reverse direction the power map is surjective and sends the
  nonzero class `[T]` to zero.

Let `ϖ` be a nonzerodivisor in `A` with `ϖ^p | p`. The map
`A/ϖ → A/ϖ^p` given by `p`th powers is injective if and only if `A` is
`p`-integrally closed in `A[1/ϖ]`
(`perfectoid_p_integral_closedness`). Apply this to the torsion-free image of
an integral perfectoid ring to obtain `p`-root closedness of its image in the
localization even when the original ring has `ϖ`-torsion. The equivalent
representative criterion `∀ x ∈ A, ϖ^p | x^p → ϖ | x` expresses the
injectivity condition. Its equivalence with ambient root closedness
holds for every nonzerodivisor `ϖ` without `ϖ^p | p`; that divisibility
makes the quotient power map well defined. The torsion-removal application and
completion criterion below are separate conclusions. The nonzerodivisor
criterion is first proved before this torsion-removal application.

If `A` has a compatible root tower for `ϖ`, `ϖ` is a nonzerodivisor,
`ϖ^p | p`, and `A/ϖ → A/ϖ^p` is surjective, the ordinary `ϖ`-completion of
the `p`-integral closure of `A` in `A[1/ϖ]` is integral perfectoid
(`completion_pIntegralClosure_perfectoid`). Construct and compare the
quotients before identifying the completion; Frobenius injectivity comes
from root closedness and surjectivity from the original quotient map. An
additional useful criterion says that for `p`-torsion-free `A` with
`(π^p)=(p)`, ordinary integral closedness in `A[1/p]` and Frobenius
surjectivity on `A/p` imply that its ordinary `p`-completion is perfectoid
(`completion_integrally_closed_perfectoid`).
This implication retains both the root normalization and the integral
closedness hypothesis.

Sources: Česnavičius–Scholze §2.1.7 and equation (2.1.7.1), p.13, for
`p`-integral closure and the injectivity criterion, and Proposition 2.1.8,
pp.13–14, for its perfectoid completion; Česnavičius Lemma 4.7, p.8, for the
ordinary integral-closure criterion. Prerequisites for the closure definition
are baseline `Subring` operations and `integralClosure`. The localization
criterion uses `Localization.Away`, quotient power maps and the
nonzerodivisor hypothesis. The completed statements use normalization,
torsion removal and PerfectoidSpaces P4.15.1's quotient/completion
comparison in precisely the indicated setting.

### 0.6 Ring operations and their tilts

Keep the topology and the tilt formula as parts of every operation. Let `A`
be integral perfectoid and ordinarily `ϖ`-complete with `ϖ^p | p`; choose
compatible roots to identify the corresponding `ϖ♭`. The following are
ordinary completed constructions.

- **Root-polynomial algebras** (`perfectoid_completed_root_polynomial`). For
  any small set `I`, the `ϖ`-completion of
  `A[X_i^(1/p^∞) : i ∈ I]` is perfectoid. Its tilt is the
  `ϖ♭`-completion of `A♭[(X_i♭)^(1/p^∞) : i ∈ I]`, with the tilt variable
  representing the actual root tower. The empty variable set recovers `A`.
- **Tensor products** (`perfectoid_completed_tensor`). For a small family of
  `ϖ`-complete perfectoid `A`-algebras, the ordinary `ϖ`-completed tensor
  product is perfectoid and its tilt is the corresponding completed tensor
  product over `A♭`. Infinite tensor products are formed as
  filtered colimits of finite tensor products before completion. The empty
  tensor product is `A`. The tensor carrier and its comparison maps must be
  the canonical ones.
- **Root-stable quotients** (`perfectoid_completed_root_quotient`). For a
  subset `E ⊆ A`, assume for every `n>0` that the ideal generated by `E`
  modulo `ϖ^n` is generated by `p^n`th powers of elements of that ideal.
  Then the ordinary `ϖ`-completion of `A/(E)` is perfectoid.
  This extends the supplier's single-tower quotient to arbitrary root-stable
  defining sets and the stated ideal-power condition. Put
  `J₁ = Ideal.span (image of E in A/(ϖ))` and let `J♭ = lim_F J₁` be
  the inverse-limit ideal in `lim_F A/(ϖ) ≃ A♭`, with transition maps
  `x ↦ x^p`. Its tilt is the ordinary `ϖ♭`-completion of `A♭/J♭`.
  A sufficient condition is that every
  element of `E` has some positive `p`-power root in `E`; compatible root
  towers are a principal example. The conclusion concerns the completion,
  rather than completeness of the raw quotient.
- **Products** (`integralPerfectoid_pi_iff`). For any small family of
  `ℤ_p`-algebras, their product is integral perfectoid exactly when every
  factor is. The tilt is the product of the tilts. The ring-level equivalence is stated for arbitrary commutative rings: every perfectoid
  factor has its canonical `ℤ_p` action by completeness. The tilt comparison
  is a further target. This includes the empty
  product, which is the zero ring. The uniform bound on `p`-torsion is
  supplied by the preceding bound-one theorem, so no additional bound on
  the family is imposed.
- **Sharp-ideal completions** (`perfectoid_sharp_ideal_completion`). For
  finitely many `a_i ∈ A♭`, let `J=(a_i♯)` and `J♭=(a_i)`. The ordinary
  `J`-completion of `A` is perfectoid, agrees with derived `J`-completion,
  and has tilt the ordinary `J♭`-completion of `A♭`. Finiteness of the
  tuple is retained. The ordinary perfectoidness, derived comparison and tilt identification
  are all conclusions of this target. There is no requirement that `J` contain `p`. Use the
  reduced/separated completion criterion before identifying the two
  completions; this is not a statement for all infinitely generated ideals.

**Checks.**

- `rootQuotientEmpty` — For `E=∅`, both `J₁` and `J♭` are zero; the
  completed quotient and its tilt recover `A` and `A♭`.
- `rootQuotientUnitGenerator` — At `p=2`, take `A=F₄`, `ϖ=0` and
  `E={ω}` with `ω²+ω+1=0`. The ideal-power hypothesis holds for this
  unit ideal. Both `J₁` and `J♭` are the unit ideal, so the completed
  quotient and its tilt are zero. No compatible tower has all its
  coordinates in `{ω}`, since `ω²≠ω`.
- `rootQuotientTower` — For `A=F₂[T^(1/2^∞)]`, `ϖ=0` and
  `E={T^(1/2^n) : n≥0}`, the ideal is already radical and stable under
  square roots. The quotient and its tilt are `F₂`, with every specified
  root of T mapping to zero.

There is also an independent étale route
(`perfectoid_completely_etale_henselization`). If `R` is integral perfectoid
and `R′` is derived `p`-complete with
`R′ ⊗^L_R R/p` a discrete étale algebra, then `R′` is integral perfectoid.
For any ideal `J ⊆ R`, the ordinary `p`-completion of the henselization
`R_J^h` is perfectoid, and the same conclusion holds for the appropriate
`p`-completion of ind-étale `R`-algebras. No finite-generation or closedness
assumption on `J` is added. Lift the étale algebra through the Fontaine prism
using unique δ-extension and complete algebraization. This proof does not
require the later generic fibre-product theory.

Sources: Česnavičius–Scholze Proposition 2.1.11(a)–(e), statements and proofs
pp.15–17: (a) and (b) pp.15–16, (c) pp.15–17, and (d),(e) pp.16–17.
For the sharp-completion comparison, use Stacks tags `0G3I` and `091T`.
The étale assertion uses Anschütz–Le Bras Corollary 2.1.10, p.14, and the
henselization assertion Česnavičius–Scholze Corollary 2.1.6, p.13.
Prerequisites for root polynomials are the integral predicate, inverse
perfection and ordinary completion. Tensor products use these and
PerfectoidSpaces P4.15.1; root-stable quotients use
the Fontaine criterion and quotient/completion transport. Products use the
torsion bound, Witt functoriality and perfection of products. Sharp
completions use the torsion decomposition and the finite-ideal separation
criterion. The étale route additionally uses §0.0's
`delta_etale_extension`, `completeEtale_algebraization` and
`perfectPrism_completeEtale_lift`. P4.15.1 supplies only the generic completion
operations in that argument.
[SchemeAndStackFoundations §0.12](../SchemeAndStackFoundations/README.md#012-étale-neighbourhoods-and-the-henselization-of-a-pair)
supplies `Henselization.algebra J`, its structural map, its filtered
étale-neighbourhood presentation and its universal property. The notation
`R_J^h` denotes this carrier; §0.13 supplies its ind-étale property.

### 0.7 The fixed-field integral model

For Bhatt's field-based model, fix a perfectoid field `K`, its valuation ring
`K°`, and a nonzero topologically nilpotent `t ∈ K°` with compatible roots.
In characteristic zero normalize `|t|=|p|`. An integral model `A` is a flat
`K°`-algebra, ordinarily `t`-complete, saturated under almost elements, and
has an isomorphism `F : A/t^(1/p) → A/t`. Saturation means that every
`x ∈ A[1/t]` for which `t^(1/p^n)x ∈ A` for all `n` already lies in `A`.
These are precisely the powerbounded integral models of perfectoid
`K`-algebras (`bhatt_integral_model_comparison`). They satisfy the general
integral predicate. The converse needs the specified `K°`-algebra structure,
flatness or the corresponding torsion-free condition, and saturation; the
general torsion-allowing predicate does not imply this field-based structure.

Source: Bhatt, *On the direct summand conjecture and its derived variant*,
Notation 1.4 and footnote 5, p.3. Prerequisites are the integral predicate,
normalization, and `PerfectoidSpaces:P0` and `P1` for the actual almost-elements
and powerbounded carriers. This comparison supplies the hypotheses of the fixed-field route in Layer 1;
it adds the explicit flatness and saturation conditions to P1.25's
bounded-plus-ring comparison.

### Examples

The `p=2` computations in §0.1 distinguish a Witt coordinate from its
Teichmüller digit. The Witt quotient `W(F₂)/(4)` in §0.3 separates bound-two torsion
from the bound-one conclusion. The two polynomial subrings in §0.5 separate
root closure in a fixed ambient ring from ordinary integral closure.

### Dependencies

*Needs:* PerfectoidSpaces P0.6–P0.7, P1.20, P1.24–P1.25 and P4.15.1–P4.15.2; DerivedModuleAlgebra §§0.4, 0.8–0.11, 0.13, 0.25 and 1.1–1.9; CrystallineCohomology §CR.4.4; EnhancedDerivedSheaves §E1.6; SchemeAndStackFoundations §§0.12–0.13, 0.23a and 0.29; AdicSpaces §6.1.

Mathlib’s completion, quotient, localization, inverse-perfection and Witt APIs;
DerivedModuleAlgebra §§0.4, 0.8–0.11 and 0.13 for the full cotangent
complex; PerfectoidSpaces P4.15.1 for completion transport;
§0.0 for the locally owned Tor/étale theorems and §0.2 for finite
Fontaine maps. The fixed-field model
uses the specified `P0` almost-elements and `P1` powerbounded contracts.

## Layer 1: relative covers and almost root extensions

### 1.1 A relative smooth-site cover

For bounded `(A,I)` and `p`-completely smooth `R`, choose a quasisyntomic
cover `R → R_∞` with `(L_(R_∞/(A/I)))^∧_p=0`. The relative object
`B=Δ_(R_∞/A)` is a discrete relatively perfect δ-`A`-algebra,
`(p,I)`-completely flat over `A`, with `B/IB ≃ R_∞`
(`relative_perfectoid_cover_smooth_site`). It covers the final object of
the relative prismatic site of `R` in the following precise sense: every
test prism has a faithfully flat refinement receiving a map from `B`.
The statement concerns relative perfection of `B`. The cotangent vanishing is the full derived statement and enters the
Hodge–Tate filtration calculation.

Unlike P4.15.4's general lifting statement, this target supplies the
cotangent-vanishing smooth-site cover, relative perfection of its prismatic
algebra, and the refinement property for every test prism.

There is a related absolute-site conclusion
(`frobenius_flat_prism_perfection_cover`). Let `(A,I)` be bounded and assume
`φ_A : A → A` is `(p,I)`-completely flat. For its supplied completed
perfection `(B,IB)`, the object with perfectoid reduction `B/IB` covers the
final object of the absolute prismatic site of `A/I`: every test prism over
`A/I` has a completely faithfully flat refinement receiving a compatible
map from `(B,IB)`. The new target is this covering property; perfection
itself and its complete-flatness properties use P4.15.2 and P4.15.4.
The Frobenius-flat hypothesis is retained explicitly, including in the
regular-ring applications.

Sources: Bhatt–Scholze Examples 7.12–7.13, proof and footnote 12, p.61.
Prerequisites are P4.15.3's smooth and derived Hodge–Tate comparisons,
P4.15.4's quasisyntomic lifting, Layer 0's relative cotangent theorem,
§0.0's `delta_etale_extension`, and P4.15.1's
complete-flatness and completion exchanges.

### 1.2 The modulo-p ind-syntomic refinement

Refine the supplied André cover, rather than constructing a second
cover theorem. For each integral perfectoid `R`, the target is an integral
perfectoid `S` with `R → S` `p`-completely faithfully flat, every
positive-degree monic polynomial over `S` having a root, and the following
additional conclusion.

Refine the construction so that `R/p → S/p` is an ind-syntomic faithfully
flat cover (`andre_ind_syntomic_mod_p`). Trace the characteristic-`p`
divided-power envelopes after their Frobenius pullback. The relevant
finite reductions have the form of an algebra over `A/(f^p)` with root
variables satisfying `g_i^p=0`; their regular-sequence and nilpotent
thickening calculations give ordinary syntomic stages modulo `p`.
Pass through these stages and their limits to obtain ind-syntomicity.
This refinement is separate from the stronger ordinary ind-syntomic
extension of Česnavičius–Scholze Theorem 2.3.4, pp.24–25.

Source: Bhatt–Scholze Remark 7.15 and its proof, p.62, refining Theorem
7.14, pp.61–62. Prerequisites are the P4.15.4 cover, P4.15.1's
complete-flatness/limit interfaces, DerivedDeRhamCohomology §PD.6's
characteristic-`p` regular-immersion PD-envelope formula and §4.2's Frobenius
base-change comparison
in the exact contracts. The stronger ordinary ind-syntomic statement retains
its `IntegralPerfectoidPartII` owner.

### 1.3 Rational root neighborhoods and the saturated root extension

There is a second construction in the fixed-field setting of the Layer 0
Bhatt comparison. Let `A` be a saturated integral perfectoid `K°`-model,
let `g ∈ A`, and use its specified nonzero `t` and compatible roots.
In the root-polynomial perfectoid space

```text
Y = Spa(A⟨T^(1/p^∞)⟩[1/t], A⟨T^(1/p^∞)⟩)
```

with the appropriate powerbounded integral model, define rational
neighborhoods `U_ℓ = { |T-g| ≤ |t|^ℓ }` for `ℓ ≥ 0`. They shrink around
`V(T-g)`. Their integral rings `B_ℓ=O_Y⁺(U_ℓ)` have restriction maps
`B_ℓ → B_(ℓ+1)` (`bhatt_root_neighborhoods`). Use the actual `P2`
rational-localization model and its necessary almost-elements saturation;
the notation does not select an arbitrary integral subring.
The neighborhood API is `bhattRootNeighborhoods.restrict` for `ℓ ≤ k`,
`restrict_self` and `restrict_comp` for the contravariant section maps,
and `rational_model` identifying the actual integral rational-localization
model with `B_ℓ` after its prescribed saturation.

**Checks.**

- `rootNeighborhoodZeroRadiusIndex` — Since both `T` and `g` are
  powerbounded, `U₀=Y`; the exponent zero gives radius one.
- `rootNeighborhoodRestrictionDirection` — For `A=K°`, `g=0` and a
  rank-one point with `T=t`, that point belongs to `U₁` and not `U₂`:
  `0<|t|²<|t|<1`. Thus `U₂⊆U₁` and sections restrict `B₁→B₂`.
- `rootNeighborhoodUnitElement` — For `g=1`, the point `T=0` belongs
  to `U₀` but not `U₁`, since `|0−1|=1>|t|`.

Let `C` be the ordinary `t`-completion of `colim_ℓ B_ℓ` and define
`bhattRootExtension(A,g) = A_∞ = C_*`, where `(-)_*` is `P0`'s saturation.
The root variables give an adjacent compatible tower `g_n`, with
`g_0` the image of `g` and `g_(n+1)^p=g_n`. The saturated object is again
an integral perfectoid `K°`-model. The comparison `C → C_*` is an almost
isomorphism; equality of the raw completion and the saturated model is
not asserted. Localization identifies the construction with the `P4`
universal perfectoid closed space `V(T-g)`.

The API consists of the following named statements.

- `bhattRootExtension.map` — The natural `K°`-algebra map `A → A_∞`.
- `bhattRootExtension.root` — For each `n≥0`, a distinguished root `g_n∈A_∞`, with `g₀` the image of `g`.
- `bhattRootExtension.root_pow` — `g_(n+1)^p=g_n` for every `n`.
- `bhattRootExtension.perfectoid` — `A_∞` is `t`-complete, flat over `K°`, saturated, and has the integral-model Frobenius isomorphism.
- `bhattRootExtension.raw_almost_iso` — `C → C_*` is an almost isomorphism for the specified root ideal.
- `bhattRootExtension.map_comp` — Maps of pairs `(A,g)` induce compatible root-extension maps preserving identities and composition.
- `bhattRootExtensionPower` — The adjacent-root relations imply `g_n^(p^n)=image(g)` for every `n`.
- `bhattRootExtensionModel` — Localization gives PerfectoidSpaces P4.14's universal perfectoid closed subspace `V(T−g)`; its powerbounded ring is the saturated model `A_∞`.

**Checks.**

- `bhattRootExtensionZero` — For the zero `K°`-algebra the root extension is zero and every root is zero.
- `bhattRootExtensionZeroElement` — For `g=0` in any Bhatt integral perfectoid `K°`-model `A`, the canonical map `A → A_∞` is an isomorphism and every distinguished root is zero.
- `bhattRootExtensionCharP` — In characteristic `p`, the model `A` is
  perfect. Every `g` has a unique compatible root tower, and the canonical
  map `A → A_∞` is an isomorphism.
- `bhattRootExtensionMixedCharUnit` — For `p=2`, `A=𝒪_{ℂ₂}` and `g=1`,
  evaluate the roots at the all-ones tower and at a compatible tower of
  primitive `2`-power roots of unity starting with `g₀=1`, `g₁=−1`.
  The universal closed-space property gives two `A`-algebra maps `A_∞ → A`
  with different values on the first root, so `A → A_∞` is not an isomorphism.

Sources: Bhatt, *On the direct summand conjecture and its derived
variant*, Notation 2.1, Definition 2.2 and footnote 6, p.4;
Bhatt notes, Example 9.4.4 and Exercise 9.4.5, printed p.115, for the zero
and unit cases. PerfectoidSpaces P4.14's
`zariskiClosedSubspace_T_sub_one` and
`zariskiClosedSubspace_T_sub_one_char_p` compute the unit case in mixed
characteristic and characteristic `p`; unique roots in perfect rings give
the latter identity for every `g`. Prerequisites
are the fixed-field comparison in Layer 0, its root-polynomial construction,
`PerfectoidSpaces:P0` saturation, `P1`'s integral model, `P2` rational
localization and approximation, and `P4`'s universal closed-space
construction. The raw/saturated comparison and the `g=0` identity test
are part of the interface before flatness is claimed.

### 1.4 Almost flatness and functorial monic-root iteration

For `ℓ>0`, the map `A → B_ℓ` is almost faithfully flat modulo `t` for
`m=(t^(1/p^n))`. Passing to the completed colimit and its saturation gives
the same conclusion for `A → A_∞`
(`bhatt_root_extension_almost_faithfully_flat`). Use rational
approximation and the corresponding almost integral models. This statement
is in the specified almost category, rather than ordinary flatness.

The monic-polynomial version is needed for iteration. Let `(A,A⁺)` be a
perfectoid affinoid `K`-pair, choose the compatible-root pseudouniformizer
`π`, and let `P(T) ∈ A⁺[T]` be monic of positive degree. Let `B⁺` be the
`π`-completion of the integral closure of `A⁺` in
`A[T^(1/p^∞)]/(P(T))`, and put `B=B⁺[1/π]`. Denote this construction by `monicRootPair(A,A⁺,P,π)`. Then `(B,B⁺)` is perfectoid,
and `A⁺ → B⁺` is almost faithfully flat modulo `π`. It is universal
among complete uniform affinoid `A`-pairs equipped with a root
`h_0 ∈ C⁺` of `P` and adjacent compatible roots `h_(n+1)^p=h_n`.
For this target category prove the integral-closure and completion
extension explicitly; the universal closed-space property only for
perfectoid targets does not by itself prove the stronger statement.
The finite free root algebra and the relevant regular sequence supply the
flatness calculation. Coefficients belong to `A⁺` in this argument.
Its API is `monicRootPair.map` for the continuous map of pairs,
`root` and `root_pow` for the chosen adjacent tower, `polynomial_root`
for `P(h₀)=0`, and `lift` with `lift_map`, `lift_root` and `lift_unique`
for this universal property.

**Checks.**

- `monicRootLinear` — For `P=T−g`, the roots start at the image of `g`
  and the analytic pair agrees with the fixed-element root construction.
- `monicRootZero` — For `P=T`, the resulting pair is the original pair;
  all adjacent roots of zero vanish by uniformity/reducedness.
- `monicRootUnit` — For `P=T−1`, the distinguished `h₀` is one; at
  `p=2` the next root may be `−1`. The construction therefore cannot
  require a unique chosen root in the original ring or identify the pair
  with the original one for every linear polynomial.

Construct a functor `B` on the category of Bhatt integral perfectoid
`K°`-models, with natural maps `A → B(A)` almost faithfully flat modulo
`t`, such that every positive-degree monic polynomial over `B(A)` has a
root (`functorial_almost_aic_extension`). At a successor stage use a
polynomial-indexed family of covers and their perfectoid coproduct,
preserving maps of models; independent nonfunctorial choices of extensions
do not yield this functor. Iterate to `ω₁`. A Cauchy sequence uses only
countably many stages, so at the final countably filtered (`ω₁`-filtered) stage the raw
plus-ring colimit is already complete. Every finite list of polynomial
coefficients comes from one earlier stage, and its successor supplies the
root. Verify naturality, preservation of the integral-model conditions,
and almost faithful flatness through the completed operations. This is
the fixed-field almost variant. The supplied ordinary `p`-complete André
cover theorem has its stated integral hypotheses and complete-flatness conclusion.
Use the API `almostAicExtension.map`, `map_id`, `map_comp` and the
natural structural map `unit`, with `map_unit` for its naturality;
`has_root` asserts existence for each positive-degree monic polynomial,
without choosing its roots functorially.

**Checks.**

- `almostAicZero` — Starting from the zero model gives the zero model,
  as every unital algebra over zero is zero.
- `almostAicConstantExcluded` — Over a nonzero model the constant monic
  polynomial `1` has no root. The positive-degree clause is essential;
  already evaluation of `1` at each element of `F₃` equals one.
- `almostAicBeyondPowers` — For `p=3` and
  `K` the completion of `Q₃(3^(1/3^∞))`, the original residue field is `F₃`, where
  `X²+1` has no root: its values at `0,1,2` are `1,2,2`.
  The extension must supply a root of this monic quadratic as well as
  compatible cube roots. An extension solving only `X³−a` would fail.

Sources: Bhatt Theorem 2.3 and proof, pp.4–5, and Remark 2.7, p.5;
Bhatt's 23 April 2017 perfectoid lecture notes, Theorem 9.4.3(1)–(2) and
proof, printed pp.113–115, for the monic-root version, and Corollary 9.4.7
with its transfinite proof, printed pp.115–117, for functorial iteration.
Prerequisites for almost flatness are the saturated root extension,
`PerfectoidSpaces:P0/almost-flat-projective-finiteness`,
`P2/approximation-lemma`, `P2/rational-localization-in-characteristic-p`,
`P2/almost-integral-model-of-untilted-rational-localization`, the Layer 0
root-polynomial algebra and `P4/universal-perfectoid-zariski-closed`.
Functorial iteration uses Layer 0's completed tensor products,
`P0/almost-hom-and-adjoints`, `almost-tensor-and-internal-hom`,
`almost-zero-limits-and-colimits`,
`PerfectoidSpaces:P5/completed-colimit-of-perfectoid-pairs`,
`P5/completed-colimit-is-perfectoid` and P4.15.1's `ω₁`-filtered
completion exchange (`semiperfectoidCompletionTransfinite`).

### Examples

The monic polynomial `X^p-a` gives the adjacent relation
`a_(n+1)^p=a_n`, including `n=0`. The polynomial `1` in a nonzero ring has no
root, so positive degree is essential. For the fixed-field construction,
`g=0` gives back the original model after completion and saturation, whereas
`g=1` carries choices of roots of unity and need not give the identity model
(Bhatt notes, Example 9.4.4 and Exercise 9.4.5, printed p.115).

### Dependencies

*Needs:* Layer 0; PerfectoidSpaces P0.6–P0.7, P0.11, P0.27, P1, P2, P4.14, P4.15.1–P4.15.4 and P5.1–P5.5; DerivedDeRhamCohomology §§PD.6 and 4.2.

Layer 0; P4.15.1, P4.15.3 and P4.15.4 for limits, relative prismatic
cohomology and quasisyntomic lifting; DerivedDeRhamCohomology §PD.6
and §4.2 for characteristic-`p` divided powers and their Frobenius base change. The field-based branch uses `P0`, `P1`,
`P2`, `P4` and `P5` on the fixed root ideal and explicit plus rings.

## Layer 2: characteristic-p quotients and radicals

### 2.1 Characteristic-p quotients and radicals

The characteristic-`p` route gives elementary tests of the universal
construction. If the `p`-power map on a ring is surjective, it remains
surjective on every quotient (`quotient_pow_surjective`), without
finite-generation assumptions on the ideal. This descent of a surjective
power function holds even without the characteristic hypothesis. For perfect characteristic-`p`
`R`, prove

```text
PerfectRing (R/I) p ↔ I.IsRadical.
```

The forward direction is reducedness of a perfect ring; the reverse
combines reducedness of a radical quotient with its surjective Frobenius
(`quotient_perfect_iff_radical`). The formula includes `I=⊤` and the zero
quotient. By the common characteristic-`p` dictionary, `R/√I` is integral
perfectoid (`radical_quotient_integralPerfectoid`) and
`IsIntegralPerfectoid p (R/I) ↔ I.IsRadical`
(`quotient_perfectoid_iff_radical`).

Prove `radical_quotient_universal`: every map from `R` into any reduced ring
`T` killing `I` factors uniquely through `R/√I`. This strengthens the factorization needed for perfectoid targets;
there is no extra characteristic-`p` hypothesis on `T`: the unital map from `R`
forces `p=0` in the target, and reducedness forces it to kill the radical.
Thus the universal perfectoid quotient of `R/I` is `R/√I` and the unit
is the surjective quotient map. The supplied Frobenius-root-ideal contract identifies the compatible-root
quotient in this comparison, with its given root indices and structural map. The raw quotient
by a nonradical ideal is merely semiperfect, and need not be perfectoid.

**Checks.**

- `rootTowerIndices` — In `A=PerfectClosure(F₂[T],2)`, the canonical
  roots at indices `0,1,2` are `T,T^(1/2),T^(1/4)`. Squaring the second
  and taking the fourth power of the third both give `T`.
- `nonradicalRootClass` — In `A/(T)`, the class of `T` is zero but that
  of `T^(1/2)` is nonzero and has square zero. Killing the root ideal
  removes this class. This witnesses both the nonradical negative control
  and the noninjectivity of the perfectoidization unit.

Sources: BMS1 Example 3.15, p.24, and the characteristic-`p` specialization
of Bhatt–Scholze Theorem 7.4, statement p.56 and proof p.62. The quotient
and radical lemmas here are elementary consequences spelling out that
specialization; they are not additional named theorems in the source.
Prerequisites are the common characteristic-`p` dictionary and reducedness,
baseline quotient lifts, `Ideal.isRadical_iff_quotient_reduced`,
`Ideal.IsRadical.radical_le_iff`, `PerfectRing.ofSurjective` and inverse
Frobenius. The universal comparison additionally uses P4.15.6's mapping
property when identifying this explicit object with `S_perfd`.

### Examples

The top ideal gives the zero perfect ring and the zero ideal recovers `R`.
For `PerfectClosure(F₂[T],2)/(T)`, squaring is surjective but not injective;
its radical quotient is `F₂`. At root indices `0,1,2`, the powers recovering
`T` are `1,2,4`. These tests distinguish radical closure from the original
ideal and inverse Frobenius from forward Frobenius.

### Dependencies

*Needs:* PerfectoidSpaces P1.24 and P4.15.5–P4.15.6; EnhancedDerivedSheaves §E1.6.

Mathlib's actual ideals, quotients, radical, perfect-ring and inverse-Frobenius
interfaces; EnhancedDerivedSheaves §E1.6 for Frobenius-root ideals;
PerfectoidSpaces P1.24 and P4.15.5–P4.15.6 for the common characteristic-`p`
dictionary, reducedness and the universal quotient to which the explicit
radical formula is compared. No new perfectoidization carrier is constructed.

## Downstream consumers

AInfCohomology, PrismaticCohomology and PadicHodgeTheory are downstream
consumers, in that dependency order. They use §0.0's
`perfectoid_tor_independence` and `delta_etale_extension` (with their supporting
Fontaine-square and complete étale lifting targets), as well as the additional
Fontaine-generator, torsion and completed-operation results. The full cotangent
and torsion-removal calculations support derived de Rham applications. The
fixed-field root extensions provide almost faithfully flat monic-root covers
for later perfectoid arguments. All these consumers obtain the integral
predicate and universal perfectoidization directly from PerfectoidSpaces;
there is no reverse dependency from that lower-tier roadmap to this one.
The two integral-perfectoid Part II roadmaps add the larger descent and
valuation scopes specified in the ownership boundaries.

## References

Page numbers above refer to the following accessible versions, and to printed
pages of the lecture notes. Section, theorem and version information is part
of each locator.

- **BS**: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*,
  [arXiv:1905.08229v4, 12 January 2022](https://arxiv.org/pdf/1905.08229v4).
  The prism interfaces are §§2–4, with perfection and initiality milestones
  at pp.31–39; smooth comparison is §§4–6,
  pp.38–54; initial prisms, perfectoidization, covers and André's theorem
  are §7, pp.55–62. The local Tor and δ-extension proofs use Lemmas
  2.17–2.18, pp.17–18, and the pushout argument in Lemma 10.3, pp.78–79.
- **BS17**: Bhargav Bhatt and Peter Scholze, *Projectivity of the Witt vector
  affine Grassmannian*, [arXiv:1507.06490v3](https://arxiv.org/pdf/1507.06490v3),
  Lemma 3.16, p.14 (the perfect-characteristic-`p` input supplied by E1).
- **Borger**: James Borger, *The basic geometry of Witt vectors, I: The affine
  case*, [author PDF](https://maths-people.anu.edu.au/~borger/papers/05/bgwvI.pdf),
  §§8–9, pp.35–40, especially Theorem 9.2; truncation index one means length two.
- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Integral
  p-adic Hodge theory*, [arXiv:1602.03148v3](https://arxiv.org/pdf/1602.03148v3).
  The relevant algebra is §3, pp.19–27.
- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Topological
  Hochschild homology and integral p-adic Hodge theory*,
  [arXiv:1802.03261v2, 9 April 2019](https://arxiv.org/pdf/1802.03261v2),
  §4, pp.21–23; [published version, Publications mathématiques de l'IHÉS
  129 (2019), 199–310](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf).
  Definition 4.18 and Proposition 4.19 occur at published pp.225–227;
  the elementary bounded-torsion proof is p.227.
- **ČS**: Kęstutis Česnavičius and Peter Scholze, *Purity for flat
  cohomology*, [arXiv:1912.10932v3](https://arxiv.org/pdf/1912.10932v3),
  §2.1, pp.10–17.
- **Č**: Kęstutis Česnavičius, *Purity for the Brauer group*,
  [arXiv:1711.06456v4](https://arxiv.org/pdf/1711.06456v4), §4.2–§4.8,
  pp.7–9.
- **ALB**: Johannes Anschütz and Arthur-César Le Bras, *Prismatic
  Dieudonné theory*, [arXiv:1907.10525v4](https://arxiv.org/pdf/1907.10525v4),
  §2.1, pp.12–14, particularly Corollary 2.1.10.
- **Bhatt**: Bhargav Bhatt, *On the direct summand conjecture and its
  derived variant*, [arXiv:1608.08882v2](https://arxiv.org/pdf/1608.08882v2),
  Notation 1.4, p.3, and §2.1–§2.7, pp.4–5.
- **Bhatt notes**: Bhargav Bhatt, *Lecture notes for a class on perfectoid
  spaces*, [University of Michigan Math 679, 23 April 2017](https://www.math.ias.edu/~bhatt/teaching/mat679w17/lectures.pdf),
  Theorem 9.4.3 and Corollary 9.4.7, printed pp.113–117.
- **DK**: Christopher Davis and Kiran S. Kedlaya, *On the Witt vector
  Frobenius*, [arXiv:1409.7530v1](https://arxiv.org/pdf/1409.7530v1),
  §3, pp.6–11, particularly Theorem 3.2.
- **ECD**: Peter Scholze, *Étale cohomology of diamonds*,
  [author version dated 14 April 2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf),
  Definitions 5.6–5.7 and Theorem 5.8, pp.24–25.
- **Stacks Project**: The Stacks Project Authors,
  [étale lifting, tag 04D1](https://stacks.math.columbia.edu/tag/04D1),
  [Derived completion, tag 091N](https://stacks.math.columbia.edu/tag/091N),
  [criterion 091P](https://stacks.math.columbia.edu/tag/091P),
  [ordinary/derived comparison 091T](https://stacks.math.columbia.edu/tag/091T),
  [weak Serre property 091U](https://stacks.math.columbia.edu/tag/091U),
  [reduced-ring completeness criterion 0G3I](https://stacks.math.columbia.edu/tag/0G3I),
  and [finite-ideal completion 05GG](https://stacks.math.columbia.edu/tag/05GG).
