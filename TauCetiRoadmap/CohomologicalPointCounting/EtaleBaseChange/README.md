# Roadmap: étale base change, finiteness, and variation in families

This roadmap builds the relative finite-coefficient étale theory for ordinary direct image. It turns a scheme morphism into functors between small étale topoi, derives direct image, proves the proper and smooth base-change theorems, and establishes the constructibility and finiteness results needed to compare geometric fibres.

The mathematical progression is

\[
\text{morphisms of étale topoi}
\longrightarrow
Rf_*
\longrightarrow
\text{stalk formulas and Leray}
\longrightarrow
\text{smooth/proper base change}
\longrightarrow
\text{constructibility and finiteness}
\longrightarrow
\text{cohomology varying in families}.
\]

Suggested code home:

```text
TauCeti/AlgebraicGeometry/EtaleCohomology/BaseChange/
```

Suggested Lean namespaces:

```text
TauCeti.AlgebraicGeometry.Etale
TauCeti.AlgebraicGeometry.EtaleCohomology
```

Direct roadmap dependency:

```text
CohomologicalPointCounting/ConstructibleEtale
```

The Markdown roadmap is the definitive specification. `Suggested.lean` is nonexhaustive.

## Primary references and source-to-layer map

* The Stacks Project, Chapter 59, [Étale Cohomology](https://stacks.math.columbia.edu/tag/03N1), especially §§59.34--59.38, 59.50--59.54, 59.86--59.97.
* The Stacks Project, §59.89, [smooth base change](https://stacks.math.columbia.edu/tag/0EYQ).
* The Stacks Project, §59.91, [proper base change](https://stacks.math.columbia.edu/tag/095S).
* SGA 4, Exposés XII, XIV, and XVI.
* J. S. Milne, *Étale Cohomology*, Chapter VI, §§1--4: proper and smooth base change, cohomological dimension, and finiteness.

| Roadmap material | Main source |
|---|---|
| Functoriality of small étale topoi | Stacks, §§59.34--59.38 |
| Stalks of higher direct images and Leray | Stacks, §§59.53--59.54 |
| Smooth base change | Stacks, §59.89 |
| Proper base change | Stacks, §59.91 |
| Local acyclicity and cospecialization | Stacks, §§59.93--59.94 |
| Cohomological dimension | Stacks, §§59.95--59.96 |
| Künneth | Stacks, §59.97 |

## Standing conventions

### Coefficients

Use the coefficient category and notation of `ConstructibleEtale`. In particular, \(\Lambda\) is finite commutative, annihilated by an integer invertible on the relevant base, and

\[
K\in D^b_{\mathrm{ctf}}(X,\Lambda)
\]

means bounded, constructible, finite Tor dimension.

### Variance

For a scheme morphism \(f:X\to Y\), pullback of étale objects by base change gives the continuous functor underlying a geometric morphism of topoi. Pin the direction of every site functor and expose the user-facing adjunction

\[
f^*:\operatorname{Sh}(Y_{\acute et},\Lambda)
\rightleftarrows
\operatorname{Sh}(X_{\acute et},\Lambda):f_*.
\]

Since inverse image for a geometric morphism is exact, do not introduce a redundant left-derived \(Lf^*\) in contexts where it is definitionally or canonically equal to \(f^*\). Derived tensor pullback along coefficient-ring maps is a different construction and should remain distinct.

### Base-change arrow

For a cartesian square

\[
\begin{matrix}
X'&\xrightarrow{g'}&X\\
\downarrow f'&&\downarrow f\\
Y'&\xrightarrow{g}&Y,
\end{matrix}
\]

use the standard transformation

\[
g^*Rf_*K\longrightarrow Rf'_*g'^*K.
\]

Pin its construction and coherence once. Proper base change asserts this map is an isomorphism when \(f\) is proper. Smooth base change is stated in Layer 4 in the rotated cartesian diagram \(Y=X\times_S T\): when \(f:X\to S\) is smooth, the exchange map \(f^*Rg_*\to Rh_*e^*\) is an isomorphism for the pinned torsion coefficients and the stated quasi-compactness hypotheses on \(g:T\to S\). This is distinct from proper base change for the vertical map in the displayed convention above.

### Fibre comparison

A lisse higher direct image gives transport after choosing an étale path between geometric points. It does not give a canonical isomorphism between arbitrary stalks. Every family theorem must preserve this distinction.

## What Mathlib and Tau Ceti already have: consume

Consume:

* Mathlib's big and small étale sites, small affine étale site, and sheaf equivalence;
* generic functors between sites induced by continuous/cocontinuous functors;
* Mathlib's generic sheaf inverse/direct-image adjunctions; extend them to the module-valued small étale sites used here;
* Grothendieck-abelian sheaf categories and enough injectives;
* derived categories, right-derived functors, Kan extensions, spectral sequences, and triangulated functors;
* scheme fibre products and base-change diagrams;
* Mathlib morphism properties `IsProper`, `Smooth`, `Etale`, `LocallyOfFiniteType`, `LocallyOfFinitePresentation`, `QuasiCompact`, and `QuasiSeparated` and their stability APIs;
* `ConstructibleEtale` for lisse/constructible sheaves, `D^b_ctf`, geometric stalks, the finite étale Galois category and étale path/fundamental-groupoid API, Tate twists, and finite group actions.

Mathlib does not supply the full derived proper/smooth base-change and finiteness theory in the form required here.

## What is missing: build here

The missing reusable library consists of:

1. the geometric morphism of small étale topoi induced by every scheme morphism;
2. module-valued inverse and direct image and their adjunction;
3. derived direct image \(Rf_*\);
4. Leray spectral sequences and derived composition;
5. geometric-stalk formulas for \(R^if_*\);
6. the derived base-change transformation and its coherence;
7. smooth base change;
8. proper base change;
9. constructibility of proper direct image;
10. finiteness and finite cohomological dimension;
11. local acyclicity, universal local acyclicity, and cospecialization;
12. lissity and monodromy of higher direct images in smooth proper or locally acyclic families;
13. Künneth formulas for ordinary étale cohomology;
14. explicit fibre-transport interfaces used by the parent family.

## The build, in layers

### Layer 0: morphisms of small étale sites

For \(f:X\to Y\), base change an étale \(Y\)-scheme \(U\to Y\) to \(U\times_YX\to X\). Package this as the Mathlib site functor with the direction and universe levels required by the small affine sites.

Prove:

* preservation of finite limits;
* continuity and cocontinuity statements required by the sheaf API;
* compatibility with coverings;
* identity and composition coherence;
* compatibility with the equivalence between ordinary and affine small étale sites;
* compatibility with base change of scheme morphisms.

Construct the induced geometric morphism and functors

\[
f^*\dashv f_*.
\]

Prove exactness of \(f^*\), left exactness of \(f_*\), functoriality in \(f\), and compatibility with module structures, coefficient change, constant sheaves, stalks, and tensor products.

### Layer 1: direct image and geometric stalks

For an abelian or module sheaf \(\mathcal F\) on \(X_{\acute et}\), identify \(f_*\mathcal F\) on an étale \(Y\)-scheme by the standard sections formula. Establish the ordinary adjunction API and unit/counit simp lemmas.

For a geometric point \(\bar y\to Y\), build the geometric fibre \(X_{\bar y}\) and the canonical comparison

\[
(R^if_*\mathcal F)_{\bar y}
\longrightarrow
H^i_{\acute et}(X_{\bar y},\mathcal F|_{X_{\bar y}}).
\]

State precisely the hypotheses under which this is an isomorphism. Separate the general stalk description by strict henselization from the fibre formula obtained under base-change hypotheses.

### Layer 2: derived direct image and Leray

Construct

\[
Rf_*:D^+(X_{\acute et},\Lambda)\to D^+(Y_{\acute et},\Lambda)
\]

using Mathlib's right-derived-functor infrastructure. Layer 6 restricts it to the bounded constructible categories, using the finiteness theorems proved there.

Build:

* the comparison \(\mathcal H^i(Rf_*K)\cong R^if_*K\);
* naturality in \(K\);
* derived composition
  \[
  R(g\circ f)_*\simeq Rg_*\circ Rf_*;
  \]
* the Leray spectral sequence
  \[
  H^p(Y,R^qf_*\mathcal F)\Rightarrow H^{p+q}(X,\mathcal F);
  \]
* compatibility with group actions, coefficient change, and Tate twists.

Do not build a theorem-specific derived functor only for proper maps.

### Layer 3: the base-change transformation

For every cartesian square, construct

\[
\operatorname{BC}_{f,g,K}:
 g^*Rf_*K\longrightarrow Rf'_*g'^*K.
\]

Prove:

* naturality in the square and in \(K\);
* identity-square normalization;
* horizontal and vertical pasting coherence;
* compatibility with composition of morphisms;
* compatibility with shifts, triangles, coefficient change, tensor products, and equivariant structures;
* agreement on \(H^0\) with the ordinary sheaf-theoretic base-change map.

This layer is complete only when downstream proofs can invoke pasting without unfolding the construction.

### Layer 4: smooth base change

Formalize the following pinned form of smooth base change. In a cartesian square

\[
\begin{matrix}
X&\xleftarrow{h}&Y\\
\downarrow f&&\downarrow e\\
S&\xleftarrow{g}&T,
\end{matrix}
\]

assume that \(f:X\to S\) is smooth and \(g:T\to S\) is quasi-compact and quasi-separated. For every torsion sheaf \(\mathcal F\) on \(T_{\acute et}\) whose torsion is prime to the residue characteristics of \(S\) — every section is annihilated by an integer invertible on \(S\) — prove

\[
f^*R^qg_*\mathcal F
\xrightarrow{\sim}
R^qh_*e^*\mathcal F
\]

for every \(q\). Derive the bounded-below complex form, and the standard corollary for base change along a cofiltered limit of smooth morphisms with affine transition maps. Do not replace this theorem by an unrestricted base-change assertion.

Build consequences:

* invariance under extension of separably closed base fields;
* smooth-base-change stalk formulas;
* local constancy of fibre cohomology in smooth situations under the further properness or local-acyclicity hypotheses required for lissity;
* compatibility with cup products and Tate twists.

### Layer 5: proper base change

Prove the proper base-change theorem. For a proper \(f:X\to Y\) and every cartesian base change \(g:Y'\to Y\), prove

\[
g^*Rf_*K
\xrightarrow{\sim}
Rf'_*g'^*K
\]

for every torsion abelian sheaf and every bounded-below complex of such — proper base change needs no invertibility hypothesis, and stating it below that standard generality would weaken a reusable theorem. Specialize to the pinned coefficient category \(\Lambda\).

Build:

* sheaf and derived forms;
* bounded-below and bounded constructible specializations;
* geometric-stalk formula
  \[
  (R^if_*K)_{\bar y}
  \cong
  H^i(X_{\bar y},K|_{X_{\bar y}});
  \]
* compatibility with composition, products, group actions, and coefficient change.

The theorem that proper direct image agrees with compactly supported direct image is owned by `CompactSupport`, which builds \(Rf_!\).

The proof architecture should expose reusable reduction lemmas rather than put the entire proof inside one theorem.

### Layer 6: cohomological dimension and finiteness

Develop the prime-to-characteristic cohomological-dimension bounds required to keep the derived constructions bounded. State dimensions using Mathlib's scheme-dimension vocabulary, with explicit Noetherian and finite-type hypotheses; where a needed dimension interface is absent from Mathlib, building it is part of this layer.

Prove:

* vanishing \(H^q_{\acute et}(X,\mathcal F)=0\) for \(q>2\dim X\), for \(X\) finite type over a separably closed field \(k\) and \(\mathcal F\) a torsion sheaf with torsion invertible in \(k\), together with the affine Artin vanishing bound \(q>\dim X\) for \(X\) affine;
* boundedness of \(Rf_*K\) for proper maps and \(K\in D^b_{\mathrm{ctf}}\);
* finiteness of \(H^i(X,K)\) for proper \(X\) over a separably closed field;
* constructibility of \(R^if_*\mathcal F\) for proper \(f\);
* preservation \(Rf_*K\in D^b_{\mathrm{ctf}}(Y,\Lambda)\) for proper \(f:X\to Y\) and \(K\in D^b_{\mathrm{ctf}}(X,\Lambda)\).

If a dimension theory needed by the proof is absent, build or explicitly depend on it. Do not hide a dimension induction behind a citation.

### Layer 7: local acyclicity and cospecialization

Define local acyclicity and universal local acyclicity for \((f,K)\) in a form stable under base change. Build the vanishing-cycle-free formulation through comparison maps from a fibre to strict-local neighbourhoods.

Prove:

* locality on source and target;
* base-change stability of universal local acyclicity;
* smooth morphisms are universally locally acyclic for prime-to-characteristic locally constant coefficients;
* compatibility with tensor products and distinguished triangles;
* cospecialization maps between geometric fibres;
* path composition and monodromy coherence.

This roadmap does not build the nearby- and vanishing-cycle formalism; local acyclicity is developed only through the ordinary base-change maps required here.

### Layer 8: lisse higher direct images and fibre transport

For a smooth proper morphism \(f:X\to S\) and lisse finite coefficients \(K\), prove that

\[
R^if_*K
\]

is lisse and that its stalk at \(\bar s\) is the fibre cohomology \(H^i(X_{\bar s},K)\).

More generally, prove the same conclusion on a locally closed stratum where \((f,K)\) satisfies the pinned local-acyclicity and constructibility hypotheses.

After choosing an étale path \(\gamma:\bar s_0\leadsto\bar s_1\), construct the transport isomorphism

\[
H^i(X_{\bar s_0},K)
\xrightarrow{\sim}
H^i(X_{\bar s_1},K)
\]

and prove:

* identity and concatenation laws;
* dependence on homotopy/path class through the étale fundamental groupoid;
* compatibility with cup products, Tate twists, group actions, and coefficient change;
* the resulting monodromy representation.

Do not expose an unqualified `fiberCohomologyEquiv` with no path argument.

### Layer 9: Künneth

For schemes \(X,Y\) over a separably closed field and coefficient objects in the pinned category, construct the external tensor product and prove the ordinary étale Künneth equivalence under the standard finiteness/Tor hypotheses:

\[
R\Gamma(X,K)\otimes^L_\Lambda R\Gamma(Y,L)
\xrightarrow{\sim}
R\Gamma(X\times Y,K\boxtimes L).
\]

Prove compatibility with cup products, symmetries, associativity, and group actions. The compact-support version belongs to `CompactSupport` and should reuse the same external-product API.

**Summit:** proper/smooth base change and the lisse-direct-image theorem provide a complete, path-aware comparison of fibre cohomology in families.

## Worked examples and acceptance criteria

1. For a finite morphism, higher direct images vanish in the standard finite case and proper base change reduces to the finite-level sheaf calculation.
2. For \(\mathbf P^n_S\to S\), proper base change identifies every geometric fibre cohomology group with the stalk of the relative cohomology sheaf.
3. For a finite étale family, \(R^0f_*\Lambda\) is the corresponding permutation local system and higher direct images vanish.
4. For a smooth proper curve family, \(R^1f_*\Lambda\) is lisse and carries the monodromy action.
5. Transport around a loop agrees with the induced étale fundamental-group action.
6. The base-change isomorphism is compatible with composition of two base changes.
7. Künneth recovers the cohomology of a product of finite étale schemes.

Every functor and equivalence must have naturality, identity, composition, and base-change coherence. Pointwise isomorphisms alone do not complete a layer.

## Design notes for Lean

### Centralize site-functor universe management

The ordinary small étale site is not the essentially small model used for derived categories. All transports through `AffineEtale.sheafEquiv` and all universe lifts should be centralized in a small number of files.

### Build transformations before theorem instances

Construct the base-change map for every cartesian square before proving it is an isomorphism under proper or smooth hypotheses. This gives a reusable statement and avoids separate incompatible maps.

### Use `IsIso` for theorem conclusions

When a canonical natural transformation is an equivalence, state an `IsIso` result and provide the resulting `iso`. This integrates with Mathlib's categorical simp and reassociation machinery.

### Preserve path dependence

Use the étale fundamental groupoid or the corresponding fibre-functor path type for transport. Do not quotient away monodromy.

## Scope boundaries

The following are not targets of this roadmap:

* constructible coefficient definitions, owned by `ConstructibleEtale`;
* Nagata compactification and \(Rf_!\), owned by `CompactSupport`;
* analytification and Artin comparison, owned by `ComplexComparison`;
* \(\ell\)-adic inverse limits, owned by `EllAdicRealization`;
* nearby cycles, vanishing cycles, and the full six-operations formalism;
* weights or purity.

## Completion criterion

This roadmap is complete when:

* every scheme morphism induces the correctly oriented geometric morphism of small étale topoi with coherent composition;
* \(Rf_*\), Leray, stalks, and base-change transformations are available for module-valued finite coefficients;
* smooth and proper base change are proved at the pinned standard generality;
* proper direct image preserves the required constructible bounded category and cohomology is finite in the stated proper finite-type cases;
* local acyclicity and cospecialization provide a reusable path-aware fibre-transport API;
* smooth proper higher direct images are lisse;
* ordinary Künneth is proved under the stated hypotheses;
* the worked examples pass;
* the Tau Ceti implementation contains no `sorry`.
